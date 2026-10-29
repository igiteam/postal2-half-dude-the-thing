// ============================================================================
// ThingWeapon.uc
// Replicates the PS2 Nightfire "Wii-style" free-aim and ADS system in Postal 2.
//
// All logic below is reverse-engineered from the nightfire-port repository.
// The raw GitHub links are included inline so you can verify the math.
// ============================================================================

class ThingWeapon extends Weapon;

// --- Free Aim Variables ---
var float AimOffsetX;       // Current horizontal aim offset
var float AimOffsetY;       // Current vertical aim offset
var float DeadZoneRadius;   // How far the mouse can move before the camera turns
var float AimSensitivity;   // Multiplier for raw mouse input

// --- Sway & Recoil Variables ---
var float SwayPhase;        // Tracks the sine wave for walking bob
var float RecoilX;          // Current horizontal recoil
var float RecoilY;          // Current vertical recoil

// --- ADS (Aim Down Sights) Variables ---
var bool  bIsZooming;       // Is the player holding the zoom button?
var float ZoomProgress;     // 0.0 = Hip Fire, 1.0 = Fully Aimed
var float TargetZoom;       // The desired zoom level (e.g., 2.0 for 2x scope)
var float CurrentZoom;      // The actual zoom level right now (lerped)
var float BlendTicks;       // How many seconds the zoom transition takes (0.17s)
var Vector BaseOffset;      // The default hip-fire position of the gun

// ============================================================================
// INITIALIZATION
// ============================================================================
simulated function PostBeginPlay()
{
    Super.PostBeginPlay();
    
    // Default values (tweak these to match Postal 2's scale)
    DeadZoneRadius = 0.05; 
    AimSensitivity = 0.8;
    BlendTicks = 0.17;      // ~10 frames at 60Hz
    TargetZoom = 2.0;       // Default 2x zoom
    
    // Store the default gun position so we can return to it
    BaseOffset = PlayerViewOffset;
}

// ============================================================================
// THE TICK FUNCTION (Runs every frame)
// This handles the Sway, Recoil, Free-Aim, and Zoom Smoothing.
// ============================================================================
simulated function Tick(float DeltaTime)
{
    local float ForwardVel;
    local float Step;
    local float EasedProgress;
    local Vector NewOffset;
    local Vector SwayVector;
    local Vector RecoilVector;

    Super.Tick(DeltaTime);

    if (Owner == None) return;

    // ------------------------------------------------------------------------
    // 1. THE FREE-AIM DEAD-ZONE LOGIC
    // Source: camera_aim.cpp (RPlayerCamera_GetAimMatrix4)
    // https://raw.githubusercontent.com/Jeffsteelflex/nightfire-port/main/src/driving/camera/camera_aim.cpp
    // ------------------------------------------------------------------------
    // Note: In Postal 2, MouseX and MouseY are handled by the PlayerController.
    // To truly do this, you would need to override Input in the PlayerController.
    // For the weapon, we apply the visual offset.
    
    AimOffsetX = (AimOffsetX + (float(PlayerController(Owner).aMouseX) * AimSensitivity)) * 0.8;
    AimOffsetY = (AimOffsetY + (float(PlayerController(Owner).aMouseY) * AimSensitivity)) * 0.8;
    
    // Clamp the aim offset so the gun doesn't fly off screen
    AimOffsetX = FClamp(AimOffsetX, -DeadZoneRadius, DeadZoneRadius);
    AimOffsetY = FClamp(AimOffsetY, -DeadZoneRadius, DeadZoneRadius);

    // ------------------------------------------------------------------------
    // 2. THE SWAY (Walking Bob)
    // Source: player_weapon.cpp (Player_WeaponRecoil)
    // https://raw.githubusercontent.com/Jeffsteelflex/nightfire-port/main/src/engine/player_weapon.cpp
    // Lines: b->sway = b->sway + b->prev_vel.z; sway.x += PS2Sinf(b->sway) * 0.01f;
    // ------------------------------------------------------------------------
    // Get forward velocity (how fast the player is moving forward)
    ForwardVel = Owner.Velocity Dot Vector(Owner.Rotation);
    
    // Advance the sine wave phase based on movement
    SwayPhase += ForwardVel * DeltaTime;
    
    // Calculate the figure-8 sway pattern (Exact values from C++ source)
    SwayVector.X = Sin(SwayPhase) * 0.01; 
    SwayVector.Y = Abs(Sin(SwayPhase + 1.5707)) * 0.01;  // 1.5707 is kHalfPi
    SwayVector.Z = Sin(SwayPhase * 0.84329) * 0.02;

    // ------------------------------------------------------------------------
    // 3. THE RECOIL (Firing Kick)
    // Source: player_weapon.cpp (Player_WeaponRecoil)
    // Lines: b->recoil_x = b->recoil_x * 0.75f;
    // ------------------------------------------------------------------------
    // Recoil decays by 25% every frame
    RecoilX *= 0.75;
    RecoilY *= 0.75;
    
    RecoilVector.X = RecoilX;
    RecoilVector.Y = RecoilY;

    // ------------------------------------------------------------------------
    // 4. THE SMOOTH ZOOM (ADS)
    // Source: player_ads.cpp (ads_step_weight & ads_ease)
    // https://raw.githubusercontent.com/Jeffsteelflex/nightfire-port/main/src/engine/player_ads.cpp
    // Lines: kBlendTicks = 10.0f; return t * t * (3.0f - 2.0f * t);
    // ------------------------------------------------------------------------
    if (bIsZooming)
    {
        Step = DeltaTime / BlendTicks;
        ZoomProgress = FMin(ZoomProgress + Step, 1.0);
    }
    else
    {
        Step = DeltaTime / BlendTicks;
        ZoomProgress = FMax(ZoomProgress - Step, 0.0);
    }

    // The Smoothstep formula (eases in and out, exactly as in Nightfire)
    EasedProgress = ZoomProgress * ZoomProgress * (3.0 - 2.0 * ZoomProgress);

    // Calculate the current zoom level
    // Source: g.view_zoom = 1.0f + (en.zoom - 1.0f) * w;
    CurrentZoom = 1.0 + (TargetZoom - 1.0) * EasedProgress;

    // Apply the FOV change to the player's camera
    if (PlayerController(Owner) != None)
        PlayerController(Owner).FOVAngle = PlayerController(Owner).Default.FOVAngle / CurrentZoom;

    // ------------------------------------------------------------------------
    // 5. APPLYING THE OFFSETS (The Math)
    // Source: player_ads.cpp (ads_tick)
    // Lines: gun->pos.x += (target[0] - gun->pos.x) * w;
    // ------------------------------------------------------------------------
    // When zooming (EasedProgress = 1.0), the gun moves to the center (0,0,0)
    // When hip firing (EasedProgress = 0.0), the gun stays at BaseOffset
    
    NewOffset.X = BaseOffset.X * (1.0 - EasedProgress);
    NewOffset.Y = BaseOffset.Y * (1.0 - EasedProgress);
    NewOffset.Z = BaseOffset.Z * (1.0 - EasedProgress);

    // Add the Sway, Recoil, and Free-Aim offset
    // Note: We scale the sway down when aiming (like kSwayInAds in Nightfire)
    NewOffset += SwayVector * (1.0 - (EasedProgress * 0.75));
    NewOffset += RecoilVector;
    NewOffset.X += AimOffsetX;
    NewOffset.Y += AimOffsetY;

    // Apply the final position to the gun
    PlayerViewOffset = NewOffset;
}

// ============================================================================
// FIRING (Recoil Trigger)
// Source: player_weapon.cpp (Player_WeaponRecoil)
// Lines: d->gun->rot.y = v->aspect * -((d->aim_cur_x * 0.5235988f) / v->lod_scale) + d->recoil_y;
// ============================================================================
simulated function Fire(float F)
{
    Super.Fire(F);
    
    // Kick the gun up and randomly left/right
    RecoilY = 0.05; // Upward kick
    RecoilX = FRand() * 0.02 - 0.01; // Random left/right kick
}

// ============================================================================
// ZOOMING (ADS Trigger)
// Source: player_weapon.cpp (Player_Weapon)
// Lines: if (Input_Action(player, kActAimMode, kActionDown) != 0) anim->flags |= 1;
// ============================================================================
simulated function AltFire(byte Mode)
{
    Super.AltFire(Mode);
    bIsZooming = true;
}

simulated function ReleaseAltFire(byte Mode)
{
    bIsZooming = false;
}
