// ============================================================================
// ThingMonsterController.uc
// The Hunting AI.
//
// This is the Controller class for the Thing. It is a relentless hunter.
// It does not use the Paranoia Engine (it has no trust or fear). It only
// knows how to find the player and kill them.
//
// Base Class: Controller (UnrealScript's base for all AI)
// ============================================================================

class ThingMonsterController extends Controller;

// --- HUNTING STATE ---
var Pawn TargetPawn;            // The player we are hunting.
var float HuntUpdateTimer;      // How often we update our target.
var float HuntInterval;         // Time between updates.

// ============================================================================
// INITIALIZATION
// ============================================================================
function PostBeginPlay()
{
    Super.PostBeginPlay();
    
    HuntInterval = 0.5;
    HuntUpdateTimer = 0.0;
}

// ============================================================================
// THE TICK — The Hunt Loop
// ============================================================================
function Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);
    
    // --- UPDATE THE TARGET ---
    HuntUpdateTimer -= DeltaTime;
    if (HuntUpdateTimer <= 0)
    {
        FindTarget();
        HuntUpdateTimer = HuntInterval;
    }
    
    // --- CHASE THE TARGET ---
    if (TargetPawn != None)
    {
        ChaseTarget();
    }
}

// ============================================================================
// FIND TARGET — Locate the Player
// ============================================================================
function FindTarget()
{
    local Pawn P;
    local float Distance, BestDistance;
    local Pawn BestTarget;
    
    BestDistance = 999999.0;
    BestTarget = None;
    
    // Loop through all Pawns.
    foreach AllActors(class'Pawn', P)
    {
        // We only want the player.
        if (P.IsA('PlayerController') || P.Controller.IsA('PlayerController'))
        {
            Distance = VSize(P.Location - Pawn.Location);
            if (Distance < BestDistance)
            {
                BestDistance = Distance;
                BestTarget = P;
            }
        }
    }
    
    TargetPawn = BestTarget;
}

// ============================================================================
// CHASE TARGET — Move Toward the Player
// ============================================================================
function ChaseTarget()
{
    local float Distance;
    
    Distance = VSize(TargetPawn.Location - Pawn.Location);
    
    // If we are in attack range, attack.
    if (Distance <= ThingMonster(Pawn).AttackRange)
    {
        ThingMonster(Pawn).PerformMeleeAttack(TargetPawn);
    }
    // Otherwise, move toward the target.
    else
    {
        // This is a simplified "MoveTo" command.
        // In Postal 2, you would use the native MoveTo() function.
        MoveTo(TargetPawn.Location);
        
        // Play the run animation.
        ThingMonster(Pawn).PlayAnim(ThingMonster(Pawn).AnimRun, 1.0, 0.2);
    }
}

// ============================================================================
// DEATH HANDLING — The Monster is Dead
// ============================================================================
function PawnDied(Pawn DeadPawn)
{
    Log("THING: Monster has been killed!");
    
    // Broadcast a "victory" event to all nearby NPCs.
    // This could increase their trust in the player.
}
