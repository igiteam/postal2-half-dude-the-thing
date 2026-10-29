// ============================================================================
// TheThingSuicideSystem.uc
// A dedicated manager for the sanity/suicide mechanic.
//
// This class loops through all ThingSquadControllers in the level, checks
// their FearLevel, and triggers a suicide if they've been terrified for too
// long. It also handles the visual and audio effects associated with the event.
//
// This is a standalone manager so you don't have to clutter ThingSquadController.
// Spawn this once in your GameInfo (or let it spawn itself in PostBeginPlay).
// ============================================================================

class TheThingSuicideSystem extends Actor;

// --- SYSTEM SETTINGS ---
var() float FearThreshold;          // The FearLevel required to start the timer (e.g., 85.0)
var() float BreakingPointDuration;  // How long they must stay terrified (e.g., 5.0 seconds)
var() float CheckInterval;          // How often to check (e.g., 1.0 second)
var() bool  bEnableSuicideSystem;   // Master toggle

// --- VISUAL/AUDIO SETTINGS ---
var() Sound SuicideScreamSound;     // The scream played when they snap
var() Sound SuicideGunshotSound;    // The gunshot sound
var() Texture ScreenBloodTexture;   // The blood overlay texture for the HUD

// --- INTERNAL STATE ---
var float CheckTimer;
var array<ThingSquadController> ActiveControllers;

// ============================================================================
// INITIALIZATION
// ============================================================================
function PostBeginPlay()
{
    Super.PostBeginPlay();
    
    // --- DEFAULT SETTINGS ---
    FearThreshold = 85.0;
    BreakingPointDuration = 5.0;
    CheckInterval = 1.0;
    bEnableSuicideSystem = true;
    
    CheckTimer = 0.0;
    
    Log("THING: Suicide System initialized.");
}

// ============================================================================
// THE TICK — The Main Loop
// ============================================================================
function Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);
    
    if (!bEnableSuicideSystem) return;
    
    // --- CHECK TIMER ---
    CheckTimer -= DeltaTime;
    if (CheckTimer <= 0)
    {
        CheckAllNPCs();
        CheckTimer = CheckInterval;
    }
}

// ============================================================================
// CHECK ALL NPCS — Loops through every ThingSquadController
// ============================================================================
function CheckAllNPCs()
{
    local ThingSquadController Controller;
    
    // Clear the active list each check.
    ActiveControllers.Length = 0;
    
    foreach AllActors(class'ThingSquadController', Controller)
    {
        if (Controller.MyPawn == None) continue;
        if (Controller.bHasTransformed) continue; // Already a monster, skip.
        
        // Add to the active list.
        ActiveControllers.AddItem(Controller);
        
        // --- CHECK THE FEAR LEVEL ---
        if (Controller.FearLevel >= FearThreshold)
        {
            // The NPC is terrified. Start or continue the breaking point timer.
            Controller.BreakingPointTimer += CheckInterval;
            
            // --- CHECK IF THEY'VE REACHED THE BREAKING POINT ---
            if (Controller.BreakingPointTimer >= BreakingPointDuration)
            {
                // They snap. Trigger the suicide.
                TriggerSuicide(Controller);
            }
            else
            {
                // They're still holding on. Maybe play a whimpering sound.
                // PlaySound(WhimperSound, SLOT_Talk, 1.0, true, 800, 1.0);
            }
        }
        else
        {
            // They've calmed down. Reset the timer.
            Controller.BreakingPointTimer = 0.0;
        }
    }
}

// ============================================================================
// TRIGGER SUICIDE — The Moment of Breaking
// ============================================================================
function TriggerSuicide(ThingSquadController Controller)
{
    local Pawn Victim;
    local Vector VictimLocation;
    
    Victim = Controller.MyPawn;
    if (Victim == None) return;
    
    VictimLocation = Victim.Location;
    
    Log("THING: NPC " $ Victim $ " has snapped and committed suicide!");
    
    // --- 1. PLAY THE SCREAM SOUND ---
    if (SuicideScreamSound != None)
    {
        Victim.PlaySound(SuicideScreamSound, SLOT_Talk, 1.0, true, 800, 1.0);
    }
    
    // --- 2. PLAY THE GUNSHOT SOUND ---
    if (SuicideGunshotSound != None)
    {
        Victim.PlaySound(SuicideGunshotSound, SLOT_Misc, 1.0, true, 800, 1.0);
    }
    
    // --- 3. TRIGGER THE SCREEN BLOOD EFFECT ---
    // This is where you would call a HUD function to flash the screen red.
    // For now, we log it. In a real mod, you would call:
    // ThingHUD(PlayerController(Level.GetLocalPlayerController()).myHUD).TriggerSuicideFlash();
    
    // --- 4. BROADCAST FEAR TO NEARBY NPCS ---
    BroadcastSuicideFear(VictimLocation, Controller);
    
    // --- 5. KILL THE PAWN ---
    // This is the core of the suicide. The Pawn kills itself.
    Victim.Died(Controller, 'suicided', VictimLocation);
    
    // --- 6. RESET THE CONTROLLER ---
    Controller.BreakingPointTimer = 0.0;
}

// ============================================================================
// BROADCAST SUICIDE FEAR — Makes nearby NPCs panic
// ============================================================================
function BroadcastSuicideFear(Vector SuicideLocation, ThingSquadController ExcludeController)
{
    local ThingSquadController OtherController;
    
    foreach AllActors(class'ThingSquadController', OtherController)
    {
        // Skip the dead NPC and any transformed Things.
        if (OtherController == ExcludeController) continue;
        if (OtherController.MyPawn == None) continue;
        if (OtherController.bHasTransformed) continue;
        
        // Check distance.
        if (VSize(OtherController.MyPawn.Location - SuicideLocation) < 1000)
        {
            // The suicide terrifies everyone nearby.
            OtherController.FearLevel = FClamp(OtherController.FearLevel + 30.0, 0, 100);
            
            // Play a panicked dialog.
            // OtherController.PlayDialog("aid_ff");
            
            Log("THING: " $ OtherController.MyPawn $ " witnessed a suicide. Fear +30.");
        }
    }
}

// ============================================================================
// CONSOLE COMMANDS (for testing)
// ============================================================================
exec function ToggleSuicideSystem()
{
    bEnableSuicideSystem = !bEnableSuicideSystem;
    Log("THING: Suicide System is now " $ (bEnableSuicideSystem ? "ON" : "OFF"));
}

exec function SetFearThreshold(float NewThreshold)
{
    FearThreshold = NewThreshold;
    Log("THING: Fear Threshold set to " $ FearThreshold);
}

exec function SetBreakingDuration(float NewDuration)
{
    BreakingPointDuration = NewDuration;
    Log("THING: Breaking Point Duration set to " $ BreakingPointDuration);
}
