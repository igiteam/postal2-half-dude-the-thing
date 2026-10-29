// ============================================================================
// ThingSquadController.uc
// The Paranoia Engine: A Deep AI System for The Thing Remake
//
// This class replaces Postal 2's standard FPSController with a multi-layered
// psychological simulation inspired by:
// 1. The 2002 The Thing Video Game (Trust/Fear/Infection).
// 2. Medal of Honor: Pacific Assault (Morale System, Squad Tactics).
// 3. Nightfire PS2 (Weapon sway/ADS, though that's on the weapon).
//
// Base Class: FPSController (Postal 2's native AI brain)
// ============================================================================

class ThingSquadController extends FPSController;

// ============================================================================
// SECTION 1: CORE PARANOIA VARIABLES
// ============================================================================

// --- INFECTION STATE ---
var bool  bIsInfected;          // The dark secret. Is this NPC a Thing?
var float InfectionTimer;       // Seconds until transformation if not tested.
var bool  bHasTransformed;      // Prevents double-transformation.

// --- PSYCHOLOGY STATE (Multi-Axis) ---
var float TrustLevel;           // 0 = Will shoot you, 100 = Loyal ally
var float FearLevel;            // 0 = Calm, 100 = Screaming in terror
var float ParanoiaLevel;        // 0 = Relaxed, 100 = Sees threats everywhere

// --- MOHPA-INSPIRED MORALE SYSTEM (0-19 Scale) ---
// Source: MoHPA Class Reference - morale(Integer morale, Integer bReact)
// In MoHPA, morale is a single 0-19 value. We use it as a "combat stress" meter.
var int   MoraleLevel;          // 0-19 scale. 0 = Broken, 19 = Unbreakable.
var int   MoraleBaseMin;        // The minimum morale this NPC drifts back to.
var int   MoraleBaseRate;       // How fast morale drifts back to baseline.
var bool  bMoraleEnabled;       // Toggle for the morale system.

// --- MOHPA-INSPIRED SQUAD TACTICS ---
// Source: MoHPA Class Reference - order_advance, order_flankleft, etc.
var string CurrentTactic;       // "none", "advance", "fallback", "flank", "charge"
var ThingSquadController SquadLeader; // The NPC who issues orders.
var array<ThingSquadController> SquadMembers;

// --- REFERENCES ---
var Pawn MyPawn;

// ============================================================================
// SECTION 2: INITIALIZATION
// ============================================================================
function PostBeginPlay()
{
    Super.PostBeginPlay();
    
    MyPawn = Pawn;
    
    // --- PSYCHOLOGY DEFAULTS ---
    TrustLevel    = 50.0;
    FearLevel     = 0.0;
    ParanoiaLevel = FRand() * 20.0;
    
    // --- MOHPA MORALE DEFAULTS ---
    // Source: morale_basemin, morale_baserate from MoHPA.
    // Each NPC has a different "breaking point".
    MoraleLevel   = 10 + (FRand() * 9); // Start between 10 and 19
    MoraleBaseMin = 5 + (FRand() * 10); // Drift back to 5-15
    MoraleBaseRate = 1;
    bMoraleEnabled = true;
    
    // --- INFECTION ROLL ---
    if (FRand() < 0.25)
    {
        bIsInfected = true;
        InfectionTimer = 30.0 + (FRand() * 150.0);
        Log("THING: NPC " $ MyPawn $ " is INFECTED. Timer: " $ InfectionTimer);
    }
    
    // --- SQUAD ASSIGNMENT ---
    CurrentTactic = "none";
}

// ============================================================================
// SECTION 3: THE TICK — The Heartbeat of the Paranoia Engine
// ============================================================================
function Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);
    
    // --- INFECTION CHECK ---
    if (bIsInfected && !bHasTransformed)
    {
        // The infection timer ticks faster when the player isn't looking.
        if (IsPlayerOutOfSight())
            InfectionTimer -= 2.0 * DeltaTime;
        else
            InfectionTimer -= 1.0 * DeltaTime;
        
        if (InfectionTimer <= 0)
            TransformIntoThing();
    }
    
    // --- PSYCHOLOGY UPDATE ---
    UpdatePsychology(DeltaTime);
    
    // --- MOHPA MORALE UPDATE ---
    // Source: morale_baserate in MoHPA.
    UpdateMorale(DeltaTime);
    
    // --- SQUAD TACTICS UPDATE ---
    UpdateSquadTactics(DeltaTime);
}

// ============================================================================
// SECTION 4: THE MOHPA MORALE SYSTEM
// ============================================================================
// Source: MoHPA Class Reference - morale(Integer morale, Integer bReact)
// The morale system governs how combat stress affects the NPC.
function UpdateMorale(float DeltaTime)
{
    if (!bMoraleEnabled) return;
    
    // --- MORALE DECAY (Combat Stress) ---
    // If the NPC is in combat (enemy nearby, or player is shooting), morale drops.
    if (IsInCombat())
    {
        MoraleLevel -= 1 * DeltaTime;
    }
    // --- MORALE RECOVERY (Peace) ---
    // If the NPC is safe, morale drifts back to baseline.
    else if (MoraleLevel < MoraleBaseMin)
    {
        MoraleLevel += MoraleBaseRate * DeltaTime;
    }
    
    // Clamp the morale to 0-19.
    MoraleLevel = FClamp(MoraleLevel, 0, 19);
    
    // --- MORALE EFFECTS ---
    // Source: MoHPA's morale levels affect combat behavior.
    // In our system, low morale = panic.
    if (MoraleLevel < 5)
    {
        // The NPC is breaking. They might flee or freeze.
        if (FRand() < 0.1)
        {
            PlayDialog("aid_lowhealth"); // MoHPA: aid_lowhealth
            SetToPanic();
        }
    }
    else if (MoraleLevel > 15)
    {
        // The NPC is confident. They might advance.
        if (CurrentTactic == "none")
            OrderAdvance();
    }
}

// ============================================================================
// SECTION 5: THE MOHPA SQUAD TACTICS
// ============================================================================
// Source: MoHPA Class Reference - order_advance, order_flankleft, etc.
// These functions replace simple "charge" AI with coordinated tactics.
function UpdateSquadTactics(float DeltaTime)
{
    if (SquadLeader == None)
    {
        // If we don't have a leader, we act alone.
        return;
    }
    
    // Execute the tactic assigned by the leader.
    switch (CurrentTactic)
    {
        case "advance":
            // Move toward the enemy.
            MoveToward(GetEnemyLocation());
            break;
        case "fallback":
            // Retreat to a safe location.
            MoveToward(GetRetreatLocation());
            break;
        case "flank":
            // Move to the side of the enemy.
            MoveToward(GetFlankLocation());
            break;
        case "charge":
            // Rush the enemy in a Banzai-style attack.
            SetToPanic(); // Postal 2's equivalent of "Charge!"
            break;
    }
}

// --- SQUAD ORDERS (Callable by the Squad Leader) ---
function OrderAdvance()
{
    CurrentTactic = "advance";
    PlayDialog("aid_enadvance"); // MoHPA: aid_enadvance
}

function OrderFallback()
{
    CurrentTactic = "fallback";
    PlayDialog("aid_enfallback_response"); // MoHPA: aid_enfallback_response
}

function OrderFlank()
{
    CurrentTactic = "flank";
    PlayDialog("aid_enflank"); // MoHPA: aid_enflank
}

function OrderCharge()
{
    CurrentTactic = "charge";
    PlayDialog("aid_banzai"); // MoHPA: aid_banzai
}

// ============================================================================
// SECTION 6: THE PSYCHOLOGY SYSTEM (Trust, Fear, Paranoia)
// ============================================================================
function UpdatePsychology(float DeltaTime)
{
    // --- FEAR DECAY ---
    if (FearLevel > 0)
        FearLevel = FMax(FearLevel - 1.0 * DeltaTime, 0.0);
    
    // --- TRUST DECAY ---
    if (TrustLevel > 50)
        TrustLevel = FMax(TrustLevel - 0.5 * DeltaTime, 50.0);
    else if (TrustLevel < 50)
        TrustLevel = FMin(TrustLevel + 0.5 * DeltaTime, 50.0);
    
    // --- PARANOIA INCREASE ---
    if (PlayerHoldingWeapon() && VSize(PlayerLocation() - MyPawn.Location) < 500)
    {
        ParanoiaLevel = FMin(ParanoiaLevel + 2.0 * DeltaTime, 100.0);
        TrustLevel = FMax(TrustLevel - 1.0 * DeltaTime, 0.0);
    }
    
    // --- PANIC REACTION ---
    if (FearLevel > 70 && TrustLevel < 30)
    {
        if (FRand() < 0.1)
        {
            PlayDialog("aid_lowhealth"); // MoHPA: aid_lowhealth
            SetToPanic();
        }
    }
}

// ============================================================================
// SECTION 7: THE BLOOD TEST
// ============================================================================
function bool PerformBloodTest()
{
    if (bHasTransformed) return false;
    
    if (bIsInfected)
    {
        Log("THING: Blood test revealed a Thing!");
        BroadcastTrustLoss(20.0);
        // MoHPA: aid_enemygethelp — the Thing calls for help.
        PlayDialog("aid_enemygethelp");
        TransformIntoThing();
        return false;
    }
    else
    {
        Log("THING: Blood test confirmed a Human.");
        TrustLevel = FMin(TrustLevel + 40.0, 100.0);
        FearLevel  = FMax(FearLevel - 30.0, 0.0);
        MoraleLevel = FMin(MoraleLevel + 5, 19); // Morale boost
        return true;
    }
}

// ============================================================================
// SECTION 8: TRANSFORMATION
// ============================================================================
function TransformIntoThing()
{
    if (bHasTransformed) return;
    bHasTransformed = true;
    
    Log("THING: NPC " $ MyPawn $ " is TRANSFORMING!");
    
    // MoHPA: aid_enemygethelp — the Thing roars.
    PlayDialog("aid_enemygethelp");
    
    // Broadcast fear to nearby NPCs.
    BroadcastFear(50.0);
    
    // Spawn the Thing monster (placeholder).
    // NewThing = Spawn(class'ThingMonster', , , MyPawn.Location, MyPawn.Rotation);
    // MyPawn.Destroy();
}

// ============================================================================
// SECTION 9: AUDIO / DIALOG EVENTS (MoHPA Inspiration)
// ============================================================================
// Source: MoHPA Class Reference - aid_* events.
// The AID system is a priority-based sound system. Here, we simplify it.
function PlayDialog(string DialogName)
{
    local Sound DialogSound;
    
    // In a real mod, you would load these from a .uax file.
    // Example: DialogSound = Sound'ThingDialog.PanicScream';
    Log("NPC " $ MyPawn $ " says: " $ DialogName);
    
    // Play the sound at the NPC's location.
    // PlaySound(DialogSound, SLOT_Talk, 1.0, true, 800, 1.0);
}

// ============================================================================
// SECTION 10: TRUST / FEAR MODIFIERS
// ============================================================================
function AddTrust(float Amount) { TrustLevel = FClamp(TrustLevel + Amount, 0, 100); }
function AddFear(float Amount)  { FearLevel  = FClamp(FearLevel + Amount, 0, 100); }

function BroadcastTrustLoss(float Amount)
{
    local ThingSquadController Ally;
    foreach AllActors(class'ThingSquadController', Ally)
    {
        if (Ally != Self && VSize(Ally.MyPawn.Location - MyPawn.Location) < 1000)
        {
            Ally.AddTrust(-Amount);
            Ally.AddFear(10.0);
            // MoHPA: aid_ff (friendly fire)
            Ally.PlayDialog("aid_ff");
        }
    }
}

function BroadcastFear(float Amount)
{
    local ThingSquadController Ally;
    foreach AllActors(class'ThingSquadController', Ally)
    {
        if (Ally != Self && VSize(Ally.MyPawn.Location - MyPawn.Location) < 1000)
        {
            Ally.AddFear(Amount);
        }
    }
}

// ============================================================================
// SECTION 11: HELPER FUNCTIONS
// ============================================================================
function bool IsPlayerOutOfSight()
{
    if (PlayerController(Level.GetLocalPlayerController()) == None) return true;
    return !LineOfSightTo(PlayerController(Level.GetLocalPlayerController()).Pawn);
}

function bool PlayerHoldingWeapon()
{
    local Pawn P;
    P = PlayerController(Level.GetLocalPlayerController()).Pawn;
    if (P == None) return false;
    return (P.Weapon != None);
}

function Vector PlayerLocation()
{
    return PlayerController(Level.GetLocalPlayerController()).Pawn.Location;
}

function bool IsInCombat()
{
    // Simplified: If the enemy is nearby, we're in combat.
    return (Enemy != None && VSize(Enemy.Location - MyPawn.Location) < 1000);
}

function Vector GetEnemyLocation()
{
    if (Enemy != None) return Enemy.Location;
    return MyPawn.Location + (Vector(MyPawn.Rotation) * 500);
}

function Vector GetRetreatLocation()
{
    // Retreat away from the player.
    return MyPawn.Location - (Normal(PlayerLocation() - MyPawn.Location) * 1000);
}

function Vector GetFlankLocation()
{
    // Move to the side of the player.
    local Vector RightVector;
    RightVector = Normal(PlayerLocation() - MyPawn.Location) cross vect(0,0,1);
    return PlayerLocation() + (RightVector * 500);
}
