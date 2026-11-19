
// ============================================================================
// ThingSquadController.uc
// The Paranoia Engine - Postal 2 / Unreal Engine 2
//
// Squad system inspired by Medal of Honor: Pacific Assault.
// Also retains the existing infection, psychology and morale systems.
//
// IMPORTANT:
// - Initialise each NPC's squad from its spawning script.
// - Call InitializeSquad() for every squad member.
// - Call CreateSquad() for the leader.
// - Call JoinSquad() for every other member.
// - MoveToward() is retained from the original controller. Verify its
//   signature against the exact Postal 2 SDK/compiler you are using.
// ============================================================================

class ThingSquadController extends FPSController;


// ============================================================================
// SECTION 1: INFECTION STATE
// ============================================================================

var bool bIsInfected;
var float InfectionTimer;
var bool bHasTransformed;


// ============================================================================
// SECTION 2: PSYCHOLOGY STATE
// ============================================================================

var float TrustLevel;
var float FearLevel;
var float ParanoiaLevel;


// ============================================================================
// SECTION 3: MORALE SYSTEM
// ============================================================================

var int MoraleLevel;
var int MoraleBaseMin;
var int MoraleBaseRate;
var bool bMoraleEnabled;

// Retains fractional morale changes between ticks.
var float MoraleChangeAccumulator;


// ============================================================================
// SECTION 4: SQUAD SYSTEM
// ============================================================================

// Squad identity and role.
var string SquadID;
var string SquadRole;

// Current order:
// "none", "advance", "fallback", "flank", "charge", "hold", "follow".
var string CurrentTactic;

// Squad leadership.
var ThingSquadController SquadLeader;
var array<ThingSquadController> SquadMembers;

var bool bIsSquadLeader;
var bool bIsInSquad;
var bool bSquadInitialized;

// Squad movement configuration.
var bool bSquadMovementEnabled;
var bool bSquadFollowing;
var bool bSquadHoldingPosition;
var bool bSquadCombatActive;

var float SquadFormationSpacing;
var float SquadFormationDistance;

// Shared order destination.
var Vector SquadOrderTarget;

// Update throttling.
var float SquadUpdateInterval;
var float SquadUpdateTimer;

// Position in the leader's roster.
// Index zero is reserved for the leader.
var int SquadMemberIndex;


// ============================================================================
// SECTION 5: REFERENCES
// ============================================================================

var Pawn MyPawn;


// ============================================================================
// SECTION 6: INITIALIZATION
// ============================================================================

function PostBeginPlay()
{
Super.PostBeginPlay();

MyPawn = Pawn;

// Psychology defaults.
TrustLevel = 50.0;
FearLevel = 0.0;
ParanoiaLevel = FRand() * 20.0;

// Morale defaults.
MoraleLevel = 10 + int(FRand() * 10);
MoraleBaseMin = 5 + int(FRand() * 11);
MoraleBaseRate = 1;
bMoraleEnabled = true;
MoraleChangeAccumulator = 0.0;

// Infection roll.
if (FRand() < 0.25)
{
    bIsInfected = true;
    InfectionTimer = 30.0 + (FRand() * 150.0);

    Log("THING: NPC " $ MyPawn $
        " is INFECTED. Timer: " $ InfectionTimer);
}

// Squad defaults.
SquadID = "";
SquadRole = "";
CurrentTactic = "none";

SquadLeader = None;
SquadMembers.Length = 0;

bIsSquadLeader = false;
bIsInSquad = false;
bSquadInitialized = false;

bSquadMovementEnabled = true;
bSquadFollowing = false;
bSquadHoldingPosition = false;
bSquadCombatActive = false;

SquadFormationSpacing = 180.0;
SquadFormationDistance = 250.0;

SquadOrderTarget = vect(0,0,0);

SquadUpdateInterval = 0.25;
SquadUpdateTimer = 0.0;

SquadMemberIndex = -1;
}


// ============================================================================
// SECTION 7: MAIN TICK
// ============================================================================

function Tick(float DeltaTime)
{
Super.Tick(DeltaTime);

if (MyPawn == None)
    MyPawn = Pawn;

if (MyPawn == None)
    return;

// Infection.
if (bIsInfected && !bHasTransformed)
{
    if (IsPlayerOutOfSight())
        InfectionTimer -= 2.0 * DeltaTime;
    else
        InfectionTimer -= 1.0 * DeltaTime;

    if (InfectionTimer <= 0.0)
        TransformIntoThing();
}

// Psychology.
UpdatePsychology(DeltaTime);

// Morale.
UpdateMorale(DeltaTime);

// Squad management.
if (bIsSquadLeader)
    CleanupSquadRoster();

UpdateSquadTactics(DeltaTime);
}


// ============================================================================
// SECTION 8: MORALE SYSTEM
// ============================================================================

function UpdateMorale(float DeltaTime)
{
if (!bMoraleEnabled)
    return;

if (IsInCombat())
{
    MoraleChangeAccumulator -= 1.0 * DeltaTime;
}
else if (MoraleLevel < MoraleBaseMin)
{
    MoraleChangeAccumulator += float(MoraleBaseRate) * DeltaTime;
}

// Convert accumulated fractional changes into integer morale changes.
while (MoraleChangeAccumulator >= 1.0)
{
    MoraleLevel++;
    MoraleChangeAccumulator -= 1.0;
}

while (MoraleChangeAccumulator <= -1.0)
{
    MoraleLevel--;
    MoraleChangeAccumulator += 1.0;
}

MoraleLevel = Clamp(MoraleLevel, 0, 19);

// Low morale: panic response.
if (MoraleLevel < 5)
{
    if (FRand() < 0.1)
    {
        PlayDialog("aid_lowhealth");
        SetToPanic();
    }
}

// High morale: confident advance, but only if not already following
// another squad order.
else if (MoraleLevel > 15)
{
    if (CurrentTactic == "none" && bIsSquadLeader)
        OrderAdvance();
}
}


// ============================================================================
// SECTION 9: SQUAD INITIALIZATION
// ============================================================================

// Call this for every NPC that belongs to a squad.
//
// Example:
// InitializeSquad("PlayerSquad", "Captain");
//
function InitializeSquad(string NewSquadID, string NewRole)
{
SquadID = NewSquadID;
SquadRole = NewRole;

CurrentTactic = "none";

SquadLeader = None;
SquadMembers.Length = 0;

bIsSquadLeader = false;
bIsInSquad = false;
bSquadInitialized = true;

SquadMemberIndex = -1;

bSquadFollowing = false;
bSquadHoldingPosition = false;

Log("SQUAD: Initialised " $ MyPawn $
    " as " $ SquadRole $ " in squad " $ SquadID);
}


// ============================================================================
// SECTION 10: CREATE AND JOIN SQUADS
// ============================================================================

// Call this on the NPC that should lead the squad.
function CreateSquad()
{
if (!bSquadInitialized)
{
    Log("SQUAD ERROR: CreateSquad called before InitializeSquad.");
    return;
}

if (MyPawn == None)
    return;

// Leave any previous squad first.
if (bIsInSquad)
    LeaveSquad();

SquadMembers.Length = 0;

SquadLeader = Self;

bIsSquadLeader = true;
bIsInSquad = true;

CurrentTactic = "none";

RegisterSquadMember(Self);

Log("SQUAD: " $ SquadID $
    " created. Leader: " $ MyPawn);
}


// Call this on a non-leader NPC.
// NewLeader must already have called CreateSquad().
function JoinSquad(ThingSquadController NewLeader)
{
if (!bSquadInitialized)
{
    Log("SQUAD ERROR: JoinSquad called before InitializeSquad.");
    return;
}

if (NewLeader == None)
    return;

if (NewLeader == Self)
    return;

if (!NewLeader.bIsSquadLeader)
{
    Log("SQUAD ERROR: Attempted to join a controller that is not leader.");
    return;
}

if (!NewLeader.bIsInSquad)
    return;

if (NewLeader.SquadID != SquadID)
{
    Log("SQUAD ERROR: Squad ID mismatch. Member: " $
        SquadID $ " Leader: " $ NewLeader.SquadID);
    return;
}

if (bIsInSquad)
    LeaveSquad();

SquadLeader = NewLeader;

bIsSquadLeader = false;
bIsInSquad = true;

CurrentTactic = NewLeader.CurrentTactic;

NewLeader.RegisterSquadMember(Self);

Log("SQUAD: " $ MyPawn $
    " joined " $ SquadID $
    ". Leader: " $ NewLeader.MyPawn);
}


// ============================================================================
// SECTION 11: MEMBER REGISTRATION
// ============================================================================

// This function is called on the leader's controller.
function RegisterSquadMember(ThingSquadController Member)
{
local int i;

if (!bIsSquadLeader)
    return;

if (Member == None)
    return;

if (Member.MyPawn == None)
    return;

// Avoid duplicate registrations.
for (i = 0; i < SquadMembers.Length; i++)
{
    if (SquadMembers[i] == Member)
    {
        Member.SquadLeader = Self;
        Member.bIsInSquad = true;
        Member.UpdateSquadIndices();
        return;
    }
}

SquadMembers.AddItem(Member);

Member.SquadLeader = Self;
Member.bIsInSquad = true;

Member.UpdateSquadIndices();

Log("SQUAD: Registered " $ Member.MyPawn $
    ". Squad size: " $ SquadMembers.Length);
}


// Remove a member from the leader's roster.
function UnregisterSquadMember(ThingSquadController Member)
{
local int i;

if (!bIsSquadLeader || Member == None)
    return;

for (i = SquadMembers.Length - 1; i >= 0; i--)
{
    if (SquadMembers[i] == Member)
        SquadMembers.Remove(i, 1);
}

UpdateSquadIndices();

Log("SQUAD: Unregistered member. Squad size: " $
    SquadMembers.Length);
}


// Recalculate each member's formation index.
function UpdateSquadIndices()
{
local int i;

if (!bIsSquadLeader)
{
    if (SquadLeader != None)
        SquadLeader.UpdateSquadIndices();

    return;
}

for (i = 0; i < SquadMembers.Length; i++)
{
    if (SquadMembers[i] != None)
    {
        SquadMembers[i].SquadMemberIndex = i;
        SquadMembers[i].SquadLeader = Self;
        SquadMembers[i].bIsInSquad = true;
    }
}
}


// Returns the number of currently registered members.
function int GetSquadSize()
{
if (!bIsSquadLeader)
{
    if (SquadLeader != None)
        return SquadLeader.GetSquadSize();

    return 0;
}

return SquadMembers.Length;
}


// Returns this NPC's current roster index.
function int GetSquadMemberIndex()
{
return SquadMemberIndex;
}


// ============================================================================
// SECTION 12: LEAVING A SQUAD
// ============================================================================

function LeaveSquad()
{
local ThingSquadController OldLeader;

OldLeader = SquadLeader;

if (OldLeader != None && OldLeader != Self)
{
    OldLeader.UnregisterSquadMember(Self);
}

SquadLeader = None;

bIsSquadLeader = false;
bIsInSquad = false;

SquadMemberIndex = -1;

CurrentTactic = "none";

bSquadFollowing = false;
bSquadHoldingPosition = false;

Log("SQUAD: " $ MyPawn $ " left squad " $ SquadID);
}


// ============================================================================
// SECTION 13: LEADER PROMOTION
// ============================================================================

// Promote the first living member in the current roster.
// This is intended to be called when the leader dies or is removed.
function PromoteNextSquadLeader()
{
local ThingSquadController NewLeader;
local ThingSquadController Member;
local int i;

if (!bIsSquadLeader)
    return;

NewLeader = None;

// Find the first living member other than the current leader.
for (i = 0; i < SquadMembers.Length; i++)
{
    Member = SquadMembers[i];

    if (Member == None || Member == Self)
        continue;

    if (Member.MyPawn == None)
        continue;

    if (Member.MyPawn.Health <= 0)
        continue;

    NewLeader = Member;
    break;
}

if (NewLeader == None)
{
    Log("SQUAD: No living member available for leader promotion.");

    SquadMembers.Length = 0;
    SquadLeader = None;

    bIsSquadLeader = false;
    bIsInSquad = false;

    return;
}

Log("SQUAD: Promoting " $ NewLeader.MyPawn $ " to leader.");

// Preserve the old roster before changing leadership.
NewLeader.SquadMembers.Length = 0;

// Transfer all living members to the new leader.
for (i = 0; i < SquadMembers.Length; i++)
{
    Member = SquadMembers[i];

    if (Member == None || Member == Self)
        continue;

    if (Member.MyPawn == None)
        continue;

    if (Member.MyPawn.Health <= 0)
        continue;

    NewLeader.SquadMembers.AddItem(Member);
}

// The new leader now owns the roster.
NewLeader.SquadLeader = NewLeader;
NewLeader.bIsSquadLeader = true;
NewLeader.bIsInSquad = true;

// Reassign every transferred member.
for (i = 0; i < NewLeader.SquadMembers.Length; i++)
{
    Member = NewLeader.SquadMembers[i];

    if (Member == None)
        continue;

    Member.SquadLeader = NewLeader;
    Member.bIsSquadLeader = (Member == NewLeader);
    Member.bIsInSquad = true;
}

// The old leader is no longer part of the active squad.
SquadMembers.Length = 0;

SquadLeader = None;
bIsSquadLeader = false;
bIsInSquad = false;

SquadMemberIndex = -1;

NewLeader.UpdateSquadIndices();

Log("SQUAD: Leadership transferred successfully.");
}


// ============================================================================
// SECTION 14: SQUAD ORDER DISTRIBUTION
// ============================================================================

// All squad orders should enter through this function.
// If called by a normal member, the order is forwarded to its leader.
function IssueSquadOrder(string NewTactic, Vector NewTarget)
{
local int i;
local ThingSquadController Member;

if (!bIsInSquad)
{
    ReceiveSquadOrder(NewTactic, NewTarget);
    return;
}

if (!bIsSquadLeader)
{
    if (SquadLeader != None)
        SquadLeader.IssueSquadOrder(NewTactic, NewTarget);

    return;
}

SquadOrderTarget = NewTarget;
CurrentTactic = NewTactic;

bSquadFollowing = (NewTactic == "follow");
bSquadHoldingPosition = (NewTactic == "hold");

// Give the order to every registered member.
for (i = 0; i < SquadMembers.Length; i++)
{
    Member = SquadMembers[i];

    if (Member == None || Member == Self)
        continue;

    if (Member.MyPawn == None)
        continue;

    Member.ReceiveSquadOrder(NewTactic, NewTarget);
}

// Apply the order to the leader too.
ReceiveSquadOrder(NewTactic, NewTarget);

Log("SQUAD: Issued order " $ NewTactic $
    " to " $ SquadMembers.Length $ " registered members.");
}


// Called on each member when an order is received.
function ReceiveSquadOrder(string NewTactic, Vector NewTarget)
{
CurrentTactic = NewTactic;
SquadOrderTarget = NewTarget;

bSquadFollowing = (NewTactic == "follow");
bSquadHoldingPosition = (NewTactic == "hold");

SquadUpdateTimer = 0.0;
}


// ============================================================================
// SECTION 15: PUBLIC SQUAD ORDERS
// ============================================================================

function OrderAdvance()
{
IssueSquadOrder("advance", GetEnemyLocation());
}


function OrderFallback()
{
IssueSquadOrder("fallback", GetRetreatLocation());
}


function OrderFlank()
{
IssueSquadOrder("flank", GetFlankLocation());
}


function OrderCharge()
{
IssueSquadOrder("charge", GetEnemyLocation());
}


function OrderHold()
{
IssueSquadOrder("hold", MyPawn.Location);
}


function OrderFollow()
{
local Vector FollowTarget;

if (SquadLeader != None && SquadLeader.MyPawn != None)
    FollowTarget = SquadLeader.MyPawn.Location;
else
    FollowTarget = MyPawn.Location;

IssueSquadOrder("follow", FollowTarget);
}


// ============================================================================
// SECTION 16: SQUAD MOVEMENT AND TACTICS
// ============================================================================

function UpdateSquadTactics(float DeltaTime)
{
local Vector Destination;

if (!bIsInSquad)
    return;

if (!bSquadMovementEnabled)
    return;

if (MyPawn == None)
    return;

// Throttle movement updates to avoid issuing movement requests every tick.
SquadUpdateTimer += DeltaTime;

if (SquadUpdateTimer < SquadUpdateInterval)
    return;

SquadUpdateTimer = 0.0;

switch (CurrentTactic)
{
    case "none":
        return;

    case "hold":
        // Do not issue movement commands while holding position.
        return;

    case "advance":
        if (Enemy != None)
            Destination = GetEnemyLocation();
        else
            Destination = SquadOrderTarget;

        break;

    case "fallback":
        Destination = SquadOrderTarget;
        break;

    case "flank":
        Destination = SquadOrderTarget;
        break;

    case "charge":
        SetToPanic();
        Destination = SquadOrderTarget;
        break;

    case "follow":
        Destination = GetFormationLocation();
        break;

    default:
        return;
}

// Avoid unnecessary movement requests when already close to the target.
if (VSize(Destination - MyPawn.Location) < 80.0)
    return;

// Retained from the original controller.
// Confirm this call against the Postal 2 SDK.
MoveToward(Destination);
}


// ============================================================================
// SECTION 17: FORMATION POSITIONING
// ============================================================================

// Calculates a position behind and to the side of the squad leader.
//
// Formation layout:
//             Leader
//       Member 2   Member 1
//       Member 4   Member 3
//
// The exact layout can be adjusted using SquadFormationSpacing.
function Vector GetFormationLocation()
{
local Vector LeaderLocation;
local Vector ForwardVector;
local Vector RightVector;
local Vector FormationLocation;

local int RowNumber;
local int SideNumber;

if (SquadLeader == None)
    return MyPawn.Location;

if (SquadLeader.MyPawn == None)
    return MyPawn.Location;

if (SquadLeader == Self)
    return MyPawn.Location;

LeaderLocation = SquadLeader.MyPawn.Location;

ForwardVector = Vector(SquadLeader.MyPawn.Rotation);

RightVector = Normal(ForwardVector Cross vect(0,0,1));

// Index zero is the leader.
// Members are arranged in alternating left/right positions.
RowNumber = (SquadMemberIndex + 1) / 2;

if ((SquadMemberIndex % 2) == 0)
    SideNumber = 1;
else
    SideNumber = -1;

FormationLocation =
    LeaderLocation
    - (ForwardVector * SquadFormationDistance * float(RowNumber))
    + (RightVector * SquadFormationSpacing * float(SideNumber));

return FormationLocation;
}


// ============================================================================
// SECTION 18: ROSTER CLEANUP
// ============================================================================

// Called by the leader to remove invalid or dead members.
function CleanupSquadRoster()
{
local int i;
local ThingSquadController Member;

if (!bIsSquadLeader)
    return;

for (i = SquadMembers.Length - 1; i >= 0; i--)
{
    Member = SquadMembers[i];

    if (Member == None)
    {
        SquadMembers.Remove(i, 1);
        continue;
    }

    // Do not accidentally remove the leader from its own roster.
    if (Member == Self)
        continue;

    if (Member.MyPawn == None)
    {
        Member.SquadLeader = None;
        Member.bIsInSquad = false;

        SquadMembers.Remove(i, 1);
        continue;
    }

    if (Member.MyPawn.Health <= 0)
    {
        Member.SquadLeader = None;
        Member.bIsInSquad = false;

        Member.CurrentTactic = "none";

        SquadMembers.Remove(i, 1);
        continue;
    }
}

UpdateSquadIndices();
}


// Explicit death notification.
// Call this before destroying or replacing a squad member's Pawn.
function HandleSquadMemberDeath()
{
if (bIsSquadLeader)
{
    PromoteNextSquadLeader();
    return;
}

if (SquadLeader != None)
    SquadLeader.UnregisterSquadMember(Self);

SquadLeader = None;

bIsInSquad = false;
bIsSquadLeader = false;

CurrentTactic = "none";
SquadMemberIndex = -1;
}


// ============================================================================
// SECTION 19: SQUAD MOVEMENT CONFIGURATION
// ============================================================================

function EnableSquadMovement()
{
bSquadMovementEnabled = true;
}


function DisableSquadMovement()
{
bSquadMovementEnabled = false;
}


function SetSquadFormationSpacing(float NewSpacing)
{
if (NewSpacing < 50.0)
    NewSpacing = 50.0;

if (NewSpacing > 1000.0)
    NewSpacing = 1000.0;

SquadFormationSpacing = NewSpacing;
}


function SetSquadFormationDistance(float NewDistance)
{
if (NewDistance < 50.0)
    NewDistance = 50.0;

if (NewDistance > 1500.0)
    NewDistance = 1500.0;

SquadFormationDistance = NewDistance;
}


// ============================================================================
// SECTION 20: PSYCHOLOGY SYSTEM
// ============================================================================

function UpdatePsychology(float DeltaTime)
{
// Fear decay.
if (FearLevel > 0.0)
    FearLevel = FMax(FearLevel - 1.0 * DeltaTime, 0.0);

// Trust slowly returns towards neutral.
if (TrustLevel > 50.0)
    TrustLevel = FMax(TrustLevel - 0.5 * DeltaTime, 50.0);
else if (TrustLevel < 50.0)
    TrustLevel = FMin(TrustLevel + 0.5 * DeltaTime, 50.0);

// Weapon-related paranoia.
if (PlayerHoldingWeapon() &&
    VSize(PlayerLocation() - MyPawn.Location) < 500.0)
{
    ParanoiaLevel = FMin(
        ParanoiaLevel + 2.0 * DeltaTime,
        100.0
    );

    TrustLevel = FMax(
        TrustLevel - 1.0 * DeltaTime,
        0.0
    );
}

// Panic reaction.
if (FearLevel > 70.0 && TrustLevel < 30.0)
{
    if (FRand() < 0.1)
    {
        PlayDialog("aid_lowhealth");
        SetToPanic();
    }
}
}


// ============================================================================
// SECTION 21: BLOOD TEST
// ============================================================================

function bool PerformBloodTest()
{
if (bHasTransformed)
    return false;

if (bIsInfected)
{
    Log("THING: Blood test revealed a Thing!");

    BroadcastTrustLoss(20.0);

    PlayDialog("aid_enemygethelp");

    TransformIntoThing();

    return false;
}

Log("THING: Blood test confirmed a Human.");

TrustLevel = FMin(TrustLevel + 40.0, 100.0);
FearLevel = FMax(FearLevel - 30.0, 0.0);

MoraleLevel = Clamp(MoraleLevel + 5, 0, 19);

return true;
}


// ============================================================================
// SECTION 22: TRANSFORMATION
// ============================================================================

function TransformIntoThing()
{
if (bHasTransformed)
    return;

bHasTransformed = true;

Log("THING: NPC " $ MyPawn $ " is TRANSFORMING!");

PlayDialog("aid_enemygethelp");

BroadcastFear(50.0);

// Placeholder for the actual monster transformation.
//
// Example:
// NewThing = Spawn(
//     class'ThingMonster',
//     ,
//     ,
//     MyPawn.Location,
//     MyPawn.Rotation
// );
//
// MyPawn.Destroy();
}


// ============================================================================
// SECTION 23: EXISTING DIALOGUE STUB
// ============================================================================

// Retained from the original controller.
// No new audio implementation is included here.
function PlayDialog(string DialogName)
{
local Sound DialogSound;

Log("NPC " $ MyPawn $ " says: " $ DialogName);

// Example for a future sound implementation:
// DialogSound = Sound'ThingDialog.PanicScream';
// PlaySound(DialogSound, SLOT_Talk, 1.0, true, 800, 1.0);
}


// ============================================================================
// SECTION 24: TRUST AND FEAR MODIFIERS
// ============================================================================

function AddTrust(float Amount)
{
TrustLevel = FClamp(TrustLevel + Amount, 0.0, 100.0);
}


function AddFear(float Amount)
{
FearLevel = FClamp(FearLevel + Amount, 0.0, 100.0);
}


function BroadcastTrustLoss(float Amount)
{
local ThingSquadController Ally;

foreach AllActors(class'ThingSquadController', Ally)
{
    if (Ally == None || Ally == Self)
        continue;

    if (Ally.MyPawn == None || MyPawn == None)
        continue;

    if (VSize(Ally.MyPawn.Location - MyPawn.Location) < 1000.0)
    {
        Ally.AddTrust(-Amount);
        Ally.AddFear(10.0);

        Ally.PlayDialog("aid_ff");
    }
}
}


function BroadcastFear(float Amount)
{
local ThingSquadController Ally;

foreach AllActors(class'ThingSquadController', Ally)
{
    if (Ally == None || Ally == Self)
        continue;

    if (Ally.MyPawn == None || MyPawn == None)
        continue;

    if (VSize(Ally.MyPawn.Location - MyPawn.Location) < 1000.0)
        Ally.AddFear(Amount);
}
}


// ============================================================================
// SECTION 25: PLAYER AND COMBAT HELPERS
// ============================================================================

function bool IsPlayerOutOfSight()
{
local PlayerController PC;

PC = PlayerController(Level.GetLocalPlayerController());

if (PC == None || PC.Pawn == None)
    return true;

return !LineOfSightTo(PC.Pawn);
}


function bool PlayerHoldingWeapon()
{
local PlayerController PC;
local Pawn P;

PC = PlayerController(Level.GetLocalPlayerController());

if (PC == None)
    return false;

P = PC.Pawn;

if (P == None)
    return false;

return (P.Weapon != None);
}


function Vector PlayerLocation()
{
local PlayerController PC;

PC = PlayerController(Level.GetLocalPlayerController());

if (PC == None || PC.Pawn == None)
    return MyPawn.Location;

return PC.Pawn.Location;
}


function bool IsInCombat()
{
if (Enemy == None || MyPawn == None)
    return false;

return (VSize(Enemy.Location - MyPawn.Location) < 1000.0);
}


function Vector GetEnemyLocation()
{
if (Enemy != None)
    return Enemy.Location;

if (MyPawn != None)
    return MyPawn.Location + (Vector(MyPawn.Rotation) * 500.0);

return vect(0,0,0);
}


function Vector GetRetreatLocation()
{
local Vector AwayDirection;

if (MyPawn == None)
    return vect(0,0,0);

AwayDirection = Normal(MyPawn.Location - PlayerLocation());

return MyPawn.Location + (AwayDirection * 1000.0);
}


function Vector GetFlankLocation()
{
local Vector RightVector;
local Vector TargetLocation;
local Vector DirectionToTarget;

if (MyPawn == None)
    return vect(0,0,0);

TargetLocation = PlayerLocation();

DirectionToTarget = Normal(TargetLocation - MyPawn.Location);

RightVector = Normal(DirectionToTarget Cross vect(0,0,1));

return TargetLocation + (RightVector * 500.0);
}


// ============================================================================
// END OF THINGSQUADCONTROLLER.UC
// ============================================================================
