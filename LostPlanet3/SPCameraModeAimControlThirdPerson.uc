class SPCameraModeAimControlThirdPerson extends SPCameraModeAimControl
    abstract;

const c_AttractorScanPeriod = 0.5;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ThirdPersonAimParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000400*/ private editfixedsize @NULL StaticLocationFilter[524289];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticRadiusFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticFOVFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticSprintLocalOffsetFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticSprintFOVFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticRollLocalOffsetFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticRollFOVFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticSmoothOffsetFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticHeadBobFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float HeadBobZ[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float PrevHeadBobZ[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float SmoothedBobZ[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float RelBobZ[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool oldsprinting[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bIsRollingOrDodging[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float ZFilterDuration[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float SprintBlendOutTimeRemaining[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float RollBlendOutTimeRemaining[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TempPitchLimitFilterInternal[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TimeSinceScannedAttractors[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize array Attractors[536870913];

// Export USPCameraModeAimControlThirdPerson::execGetPlayerSprintCameraParams(FFrame&, void* const)
native final simulated function GetPlayerSprintCameraParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControlThirdPerson::execGetPlayerRollCameraParams(FFrame&, void* const)
native final simulated function GetPlayerRollCameraParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControlThirdPerson::execApplyRotationConstraints(FFrame&, void* const)
native function ApplyRotationConstraints()
{
    local /*0x043A0000-0x00000000*/ private @NULL InRotation[8388609];
    local /*0x043A0000-0x00000000*/ private bool bPredicting[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControlThirdPerson::execGetAllowFloatingAim(FFrame&, void* const)
native function GetAllowFloatingAim()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeAimControlThirdPerson::execDoesSprintCameraFollowRotation(FFrame&, void* const)
native function DoesSprintCameraFollowRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeAimControlThirdPerson::execProcessViewRotation(FFrame&, void* const)
native function ProcessViewRotation()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL OutViewRotation[25165825], OutDeltaRot;


}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    ThirdPersonAimParams = SPCameraModeAimControlThirdPersonParam(PendingModeParam.ModeParam);
    //return;    
}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609], PrevAimControlThirdPersonCam;

    super.OnBecomeActive(PrevCameraMode);
    ZFilterDuration = 0.0000000;
    CameraMgr.Targeting.Params.HeadTrackingPercent = 0.0000000;
    CameraMgr.Targeting.Params.HorizontalHeadTrackingDeadZoneDistance = 250.0000000;
    CameraMgr.Targeting.Params.HorizontalHeadTrackingSmoothRate = 3.0000000;
    Rig.CameraCollisionMain.Data.bDisabled = false;
    Rig.Offset = ThirdPersonAimParams.LocalOffset;
    Rig.NearOffset = ThirdPersonAimParams.CollisionZoomInOffset;
    // End:0x274
    if(ThirdPersonAimParams.bFilterZLocation)
    {
        StaticLocationFilter.Rate = ThirdPersonAimParams.LocationZFilterRate;
        Rig.LocationFilter = StaticLocationFilter;
        Rig.bFilterZLocationOnly = true;        
    }
    else
    {
        Rig.LocationFilter = none;
        Rig.bFilterZLocationOnly = false;
    }
    Rig.RadiusFilter = StaticRadiusFilter;
    StaticRadiusFilter.Rate = ThirdPersonAimParams.OrbitRadiusFilterRate;
    Rig.OffsetFilter = StaticSmoothOffsetFilter;
    StaticSmoothOffsetFilter.Rate = ThirdPersonAimParams.FilterRateOffset;
    PrevAimControlThirdPersonCam = SPCameraModeAimControlThirdPerson(PrevCameraMode);
    // End:0x427
    if(PrevAimControlThirdPersonCam != none)
    {
        SprintBlendOutTimeRemaining = PrevAimControlThirdPersonCam.SprintBlendOutTimeRemaining;
        RollBlendOutTimeRemaining = PrevAimControlThirdPersonCam.RollBlendOutTimeRemaining;
        bIsRollingOrDodging = PrevAimControlThirdPersonCam.bIsRollingOrDodging;        
    }
    else
    {
        SprintBlendOutTimeRemaining = 0.0000000;
        RollBlendOutTimeRemaining = 0.0000000;
        bIsRollingOrDodging = false;
    }
    //return;    
}

function ShouldBlendEyeLocation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function PostRigUpdate()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL TargetPawn, PlayerVelocity;
    local /*0x043A0000-0x00000000*/ private float PlayerSpeed, PlayerSpeedMultiplier;
    local /*0x043A0000-0x00000000*/ private @NULL SprintCamParams, RollCamParams;

    super.PostRigUpdate(DeltaTime);
    // End:0xAF
    if(bIsRollingOrDodging == true)
    {
        RollCamParams = GetPlayerRollCameraParams();
        Rig.Offset += RollCamParams.AdditiveLocalOffsetDuringRoll;
        Rig.FOV += RollCamParams.AdditiveFOVDuringRoll;
    }
    TargetPawn = CameraMgr.Targeting.TargetPawn;
    // End:0x2D6
    if(TargetPawn != none)
    {
        TargetPawn.UpdateCameraRigOffset(DeltaTime, Rig.Offset);
        SprintCamParams = GetPlayerSprintCameraParams();
        // End:0x2B3
        if(SprintCamParams.bEnableVelocityBasedSprintCamera)
        {
            // End:0x2B3
            if(TargetPawn.SprintControl.bSprinting)
            {
                PlayerVelocity = TargetPawn.Velocity;
                PlayerSpeed = VSize2D(PlayerVelocity);
                // End:0x2B3
                if(PlayerSpeed > 1.0000000)
                {
                    PlayerSpeedMultiplier = Square(FMin(PlayerSpeed * 0.0020000, 1.0000000));
                    Rig.Offset += (SprintCamParams.AdditiveLocalOffsetDuringPlayerSprints * PlayerSpeedMultiplier);
                    Rig.FOV += (SprintCamParams.AdditiveFOVDuringPlayerSprints * PlayerSpeedMultiplier);
                }
            }
        }
        // End:0x2D6
        if(bIsRollingOrDodging == false)
        {
            DoHeadBobbing(DeltaTime);
        }
    }
    // End:0x2ED
    if(true)
    {
        FocusCameraAttractors(DeltaTime);
    }
    //return;    
}

simulated function FocusCameraAttractors()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL iter, cyl;
    local /*0x043A0000-0x00000000*/ private float orig_fov, favored_fov, temp_fov, Fade, c_max_dist, c_min_dist,
	    c_min_fov, half_dist, Dist, max_dist, min_dist,
	    min_fov;

    local /*0x043A0000-0x00000000*/ private @NULL Delta;

    c_max_dist = ThirdPersonAimParams.AttractorMaxDistance;
    // End:0x49
    if(c_max_dist < 0.1000000)
    {
        Attractors.Length = 0;
        return;
    }
    orig_fov = Rig.FOV;
    favored_fov = orig_fov;
    TimeSinceScannedAttractors += DeltaTime;
    // End:0x16B
    if(TimeSinceScannedAttractors > 0.5000000)
    {
        half_dist = c_max_dist * 0.5000000;
        Class'SPCameraAttractor'.static.FindCameraAttractors(Rig.Location + (Rig.CameraForward() * half_dist), SPMakeVector(half_dist, half_dist, half_dist), Attractors);
        TimeSinceScannedAttractors = 0.0000000;
    }
    c_min_dist = ThirdPersonAimParams.AttractorMinDistance;
    c_min_fov = ThirdPersonAimParams.AttractorMinFOVDegrees;
    // End:0x58F
    foreach Attractors(iter)
    {
        // End:0x21E
        if(iter.bDeleteMe || !iter.bEnabled)
        {
            continue;            
        }
        else
        {
            max_dist = FMin(c_max_dist, iter.MaxDistance);
            min_dist = FMax(c_min_dist, iter.MinDistance);
            cyl.Radius = iter.CylinderComponent.CollisionRadius;
            cyl.Height = iter.CylinderComponent.CollisionHeight;
            Delta = iter.Location - Rig.Location;
            Dist = FMax(0.0000000, VSize(Delta) - cyl.Radius);
            Fade = FClamp((max_dist - Dist) / (max_dist - min_dist), 0.0000000, 1.0000000);
            // End:0x566
            if(Fade > 0.0000000)
            {
                Fade = Class'SPEngine.SPUtil'.static.SmoothStep(Fade);
                Rig.FOVToFrameCylinder(iter.Location, cyl, CameraMgr.Targeting.AspectRatio);
                min_fov = FMax(c_min_fov, iter.MinFOVDegrees);
                temp_fov = FMax(Rig.FOV, min_fov);
                // End:0x566
                if(temp_fov < orig_fov)
                {
                    temp_fov = Lerp(orig_fov, temp_fov, Fade);
                    favored_fov = FMin(temp_fov, favored_fov);
                }
            }
            Rig.FOV = orig_fov;            
        }
    }    
    Rig.FOV = favored_fov;
    //return;    
}

static final simulated function @NULL GetSocketLocZ()
{
    local /*0x043A0000-0x00000400*/ private @NULL SkelMesh[8388609];
    local /*0x043A0000-0x00000000*/ private name Socket[8388609];
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL pos, Rot;

    SkelMesh.GetSocketWorldLocationAndRotation(Socket, pos, Rot);
    return pos.Z;
    //return ReturnValue;    
}

static final simulated function @NULL GetBoneLocZ()
{
    local /*0x043A0000-0x00000400*/ private @NULL SkelMesh[8388609];
    local /*0x043A0000-0x00000000*/ private name Bone[8388609];
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return SkelMesh.GetBoneLocation(Bone, 0).Z;
    //return ReturnValue;    
}

simulated function @NULL GetHeadBobZ()
{
    local /*0x043A0000-0x00000000*/ private bool is_sprinting[8388609];
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689], cylz, headz;
    local /*0x043A0000-0x00000000*/ private @NULL tgtPawn, Mesh;

    tgtPawn = CameraMgr.Targeting.TargetPawn;
    // End:0x52
    if(tgtPawn == none)
    {
        return 0.0000000;
    }
    Mesh = tgtPawn.Mesh;
    // End:0xCE
    if(is_sprinting)
    {
        headz = FMax(GetBoneLocZ(Mesh, 'JO_L_Toe'), GetBoneLocZ(Mesh, 'JO_R_Toe'));        
    }
    else
    {
        headz = GetBoneLocZ(Mesh, 'JO_hip');
    }
    cylz = GetBoneLocZ(Mesh, 'JO_positionTracker');
    return headz - cylz;
    //return ReturnValue;    
}

simulated function ResetHeadBobbing()
{
    local /*0x043A0000-0x00000000*/ private bool is_sprinting[8388609];

    HeadBobZ = GetHeadBobZ(is_sprinting);
    PrevHeadBobZ = HeadBobZ;
    SmoothedBobZ = HeadBobZ;
    RelBobZ = 0.0000000;
    //return;    
}

simulated function DoHeadBobbing()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609], bobz, smoothbobz, bobfactor;
    local /*0x043A0000-0x00000000*/ private @NULL tgtPawn;
    local /*0x043A0000-0x00000000*/ private float tgtvel;
    local /*0x043A0000-0x00000000*/ private bool sprinting;

    tgtPawn = CameraMgr.Targeting.TargetPawn;
    // End:0x74
    if((tgtPawn == none) || tgtPawn.Mesh == none)
    {
        return;
    }
    tgtvel = VSize(tgtPawn.Velocity);
    sprinting = tgtPawn.SprintControl.bSprinting && tgtvel > tgtPawn.GroundSpeed;
    // End:0x15D
    if((bIgnoreBlend || oldsprinting != sprinting) || tgtvel < 1.0000000)
    {
        ResetHeadBobbing(sprinting);        
    }
    else
    {
        bobfactor = ThirdPersonAimParams.HeadBobbing;
        // End:0x349
        if(bobfactor > 0.0000000)
        {
            bobfactor *= FMin(1.2500000, tgtvel / tgtPawn.GroundSpeed);
            // End:0x1F0
            if(sprinting)
            {
                bobfactor *= 0.8000000;
            }
            bobz = GetHeadBobZ(sprinting);
            StaticHeadBobFilter.Update(DeltaTime);
            smoothbobz = StaticHeadBobFilter.BlendFloat(PrevHeadBobZ, HeadBobZ, bobz);
            SmoothedBobZ = smoothbobz;
            PrevHeadBobZ = HeadBobZ;
            HeadBobZ = smoothbobz;
            bobz -= smoothbobz;
            RelBobZ = bobz;
            bobz = FClamp(bobz, -6.0000000, 6.0000000);
            bobz *= bobfactor;
            Rig.Location.Z += bobz;
        }
    }
    oldsprinting = sprinting;
    //return;    
}

function ForceFilterZLocation()
{
    local /*0x043A0000-0x00000000*/ private bool bOn[8388609];
    local /*0x043A0000-0x00000000*/ private float Duration[9437185], Rate;

    // End:0x105
    if(bOn)
    {
        // End:0x4A
        if(Rate <= 0.0000000)
        {
            Rate = ThirdPersonAimParams.LocationZFilterRate;
        }
        ZFilterDuration = Duration;
        // End:0x91
        if(!ThirdPersonAimParams.bFilterZLocation)
        {
            ZFilterDuration += 0.5000000;
        }
        StaticLocationFilter.Rate = Rate;
        Rig.LocationFilter = StaticLocationFilter;
        Rig.bFilterZLocationOnly = true;        
    }
    else
    {
        Rig.LocationFilter = none;
        Rig.bFilterZLocationOnly = false;
    }
    //return;    
}

function UpdateFilters()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL TargetPawn, SprintCamParams;
    local /*0x043A0000-0x00000000*/ private float MinPitch, MaxPitch, cps;
    local /*0x043A0000-0x00000000*/ private @NULL RollCamParams;

    super.UpdateFilters(DeltaTime);
    Rig.FOVFilter = StaticFOVFilter;
    StaticFOVFilter.Rate = ThirdPersonAimParams.FOVFilterRate;
    // End:0x244
    if(ZFilterDuration > 0.0000000)
    {
        ZFilterDuration -= DeltaTime;
        // End:0x1B0
        if(ZFilterDuration <= 0.0000000)
        {
            ZFilterDuration = 0.0000000;
            // End:0x16C
            if(ThirdPersonAimParams.bFilterZLocation)
            {
                StaticLocationFilter.Rate = ThirdPersonAimParams.LocationZFilterRate;
                Rig.LocationFilter = StaticLocationFilter;
                Rig.bFilterZLocationOnly = true;                
            }
            else
            {
                Rig.LocationFilter = none;
                Rig.bFilterZLocationOnly = false;
            }            
        }
        else
        {
            // End:0x244
            if(!ThirdPersonAimParams.bFilterZLocation && ZFilterDuration < 0.5000000)
            {
                StaticLocationFilter.Rate = Lerp(StaticLocationFilter.Rate, 200.0000000, (0.5000000 - ZFilterDuration) / 0.5000000);
            }
        }
    }
    Rig.OffsetFilter = StaticSmoothOffsetFilter;
    StaticSmoothOffsetFilter.Rate = ThirdPersonAimParams.FilterRateOffset;
    SprintCamParams = GetPlayerSprintCameraParams();
    MinPitch = ThirdPersonAimParams.LookAroundPitchMinimum;
    MaxPitch = ThirdPersonAimParams.LookAroundPitchMaximum;
    Rig.PitchMin = MinPitch;
    Rig.PitchMax = MaxPitch;
    // End:0x682
    if(SprintCamParams.bEnableVelocityBasedSprintCamera)
    {
        TargetPawn = CameraMgr.Targeting.TargetPawn;
        // End:0x682
        if(TargetPawn != none)
        {
            // End:0x5EB
            if(TargetPawn.SprintControl.bSprinting)
            {
                // End:0x58B
                if(TimeSinceLastLook > SprintCamParams.NarrowPitchAfterNoAimTime)
                {
                    cps = SprintCamParams.CenterPitchSpeed;
                    MinPitch = Class'SPEngine.SPBlend'.static.SpeedLimitFloat(CameraMgr.Targeting.Params.LookAroundPitchMinimum, SprintCamParams.PitchMin, cps, DeltaTime);
                    MaxPitch = Class'SPEngine.SPBlend'.static.SpeedLimitFloat(CameraMgr.Targeting.Params.LookAroundPitchMaximum, SprintCamParams.PitchMax, cps, DeltaTime);                    
                }
                else
                {
                    TempPitchLimitFilterInternal = Rig.Orbit.Pitch;
                }
                SetSprintBlendFilters(SprintCamParams);
                SprintBlendOutTimeRemaining = 0.0000000;                
            }
            else
            {
                // End:0x682
                if(SprintBlendOutTimeRemaining > 0.0000000)
                {
                    TempPitchLimitFilterInternal = Rig.Orbit.Pitch;
                    SetSprintBlendFilters(SprintCamParams);
                    SprintBlendOutTimeRemaining -= DeltaTime;
                    // End:0x682
                    if(SprintBlendOutTimeRemaining < 0.0000000)
                    {
                        SprintBlendOutTimeRemaining = 0.0000000;
                    }
                }
            }
        }
    }
    RollCamParams = GetPlayerRollCameraParams();
    // End:0x6C8
    if(bIsRollingOrDodging)
    {
        SetRollBlendFilters(RollCamParams);
        RollBlendOutTimeRemaining = 0.0000000;        
    }
    else
    {
        // End:0x724
        if(RollBlendOutTimeRemaining > 0.0000000)
        {
            SetRollBlendFilters(RollCamParams);
            RollBlendOutTimeRemaining -= DeltaTime;
            // End:0x724
            if(RollBlendOutTimeRemaining < 0.0000000)
            {
                RollBlendOutTimeRemaining = 0.0000000;
            }
        }
    }
    CameraMgr.Targeting.Params.LookAroundPitchMinimum = MinPitch;
    CameraMgr.Targeting.Params.LookAroundPitchMaximum = MaxPitch;
    //return;    
}

function SetSprintBlendFilters()
{
    local /*0x043A0000-0x00000000*/ private @NULL SprintCamParams[25165825];

    Rig.OffsetFilter = StaticSprintLocalOffsetFilter;
    StaticSprintLocalOffsetFilter.Rate = SprintCamParams.SprintLocalOffsetFilterRate;
    Rig.FOVFilter = StaticSprintFOVFilter;
    StaticSprintFOVFilter.Rate = SprintCamParams.SprintFOVFilterRate;
    //return;    
}

function BlendOutSprint()
{
    local /*0x043A0000-0x00000000*/ private @NULL SprintCamParams;

    SprintCamParams = GetPlayerSprintCameraParams();
    SprintBlendOutTimeRemaining = SprintCamParams.SprintBlendOutTime;
    //return;    
}

function SetRollBlendFilters()
{
    local /*0x043A0000-0x00000000*/ private @NULL RollCamParams[25296897];

    Rig.OffsetFilter = StaticRollLocalOffsetFilter;
    StaticRollLocalOffsetFilter.Rate = RollCamParams.RollLocalOffsetFilterRate;
    Rig.FOVFilter = StaticRollFOVFilter;
    StaticRollFOVFilter.Rate = RollCamParams.RollFOVFilterRate;
    //return;    
}

function BlendOutRoll()
{
    local /*0x043A0000-0x00000000*/ private @NULL RollCamParams;

    RollCamParams = GetPlayerRollCameraParams();
    RollBlendOutTimeRemaining = RollCamParams.RollBlendOutTime;
    //return;    
}

function SetIsRollingOrDodging()
{
    local /*0x043A0000-0x00000000*/ private bool isThePlayerRollingOrDodging[8388609];

    // End:0x2C
    if((isThePlayerRollingOrDodging == false) && bIsRollingOrDodging == true)
    {
        BlendOutRoll();
    }
    bIsRollingOrDodging = isThePlayerRollingOrDodging;
    //return;    
}

simulated function ResetFilters()
{
    super.ResetFilters();
    ResetHeadBobbing(false);
    TempPitchLimitFilterInternal = Rig.Orbit.Pitch;
    Rig.CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

simulated function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL SavedVT[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL Ofs;

    SavedVT.CopyFrom(CFD.IdealVT);
    SavedVT.Location = CameraMgr.Targeting.Current.eyeLoc;
    SavedVT.Orbit = CartesianToSpherical(CameraMgr.Targeting.TargetForward());
    SavedVT.Orbit.Radius = 0.0000000;
    Ofs = GetDesiredLocalOffset();
    SavedVT.Offset = Ofs;
    SavedVT.NearOffset = Ofs * 0.1000000;
    SavedVT.CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
    SavedVT.Rotation = SphericalToRotator(SavedVT.Orbit);
    SavedVT.CheckValid();
    SavedVT.Collide(CameraMgr.Targeting.Target, 1.0000000);
    SavedVT.CheckValid();
    return true;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x043A0000-0x00000000*/ private @NULL Canvas;

    super(SPCameraMode).DisplayDebug(HUD, out_YL, out_YPos);
    Canvas = HUD.Canvas;
    Canvas.DrawText((("headbobz=" $ string(SmoothedBobZ)) @ string(RelBobZ)) @ string(StaticHeadBobFilter.Rate));
    out_YPos = Canvas.CurY;
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlThirdPerson.LocationFilterObj'
    begin object name=LocationFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlThirdPerson.RadiusFilterObj'
    begin object name=RadiusFilterObj class=Class'SPCameraBlendLowPassFilter'
        Rate=0.4000000
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__SPCameraModeAimControlThirdPerson.FOVFilterObj2'
    begin object name=FOVFilterObj2 class=Class'SPCameraBlendLowPass2Filter'
        Rate=2.0000000
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlThirdPerson.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj class=Class'SPCameraBlendLowPassFilter'
        Rate=0.4000000
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlThirdPerson.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj class=Class'SPCameraBlendLowPassFilter'
        Rate=0.4000000
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlThirdPerson.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj class=Class'SPCameraBlendLowPassFilter'
        Rate=0.4000000
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlThirdPerson.RollFOVFilterObj'
    begin object name=RollFOVFilterObj class=Class'SPCameraBlendLowPassFilter'
        Rate=0.4000000
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__SPCameraModeAimControlThirdPerson.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2 class=Class'SPCameraBlendLowPass2Filter'
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__SPCameraModeAimControlThirdPerson.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj class=Class'SPCameraBlendLowPass2Filter'
        Rate=0.2500000
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeAimControlThirdPerson.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__SPCameraModeAimControlThirdPerson.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
        Data=(PenetrationBlendOutTime=0.7000000,PenetrationBlendInTime=0.5000000,CollisionFeelers=/* Array type was not detected. */,bSmallObstaclesDontHardBlock=true,PawnFeelerFarSpaceExtraBlockFactor=0.1300000)
    end object
    CameraCollisionMain=MainCameraCollisionObj
}