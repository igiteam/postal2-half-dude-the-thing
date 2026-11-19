
// ============================================================================
// ThingSquad.uc
//
// Central player squad manager.
//
// Responsibilities:
//   - Owns the recruited NPC roster.
//   - Enforces squad capacity and recruitment trust requirements.
//   - Adds and removes NPCs safely.
//   - Tracks the player's squad and shared enemy.
//   - Distributes squad orders to individual controllers.
//
// Individual NPC psychology, infection, morale and movement remain in
// ThingSquadController.uc.
//
// Inspired by the central membership model in Half-Life 2's CAI_Squad.
// ============================================================================

class ThingSquad extends Info;

// ============================================================================
// CONFIGURATION
// ============================================================================

var() int MaxMembers;
var() float MinimumTrustToJoin;

// ============================================================================
// SQUAD STATE
// ============================================================================

// The player pawn who owns this squad.
var Pawn SquadOwner;

// Recruited NPCs only. The player is NOT stored in this array.
var array<ThingSquadController> Members;

// Enemy currently shared by the squad.
var Pawn SharedEnemy;

// Current player-issued squad order.
var string CurrentOrder;

// Prevents accidental double initialization.
var bool bSquadInitialized;

// ============================================================================
// INITIALIZATION
// ============================================================================

function PostBeginPlay()
{
    Super.PostBeginPlay();

    if (MaxMembers <= 0)
        MaxMembers = 4;

    if (MinimumTrustToJoin <= 0)
        MinimumTrustToJoin = 60.0;

    CurrentOrder = "follow";
}

function bool InitializeSquad(Pawn NewOwner)
{
    if (NewOwner == None)
        return false;

    SquadOwner = NewOwner;
    bSquadInitialized = true;

    Log("THING SQUAD: Initialized for " $ SquadOwner);

    return true;
}

// ============================================================================
// MEMBERSHIP
// ============================================================================

// Returns true if this controller is already in this squad.
function bool IsMember(ThingSquadController TestMember)
{
    local int i;

    if (TestMember == None)
        return false;

    for (i = 0; i < Members.Length; i++)
    {
        if (Members[i] == TestMember)
            return true;
    }

    return false;
}

// Returns the number of living recruited NPCs.
function int GetMemberCount()
{
    local int i;
    local int Count;

    Count = 0;

    for (i = 0; i < Members.Length; i++)
    {
        if (Members[i] != None &&
            Members[i].MyPawn != None &&
            Members[i].MyPawn.Health > 0)
        {
            Count++;
        }
    }

    return Count;
}

// Checks whether an NPC is allowed to join.
// Infection is deliberately NOT an exclusion: an infected NPC can be
// recruited, which preserves the paranoia/suspicion gameplay.
function bool CanAddMember(ThingSquadController NewMember)
{
    if (!bSquadInitialized)
        return false;

    if (SquadOwner == None || NewMember == None)
        return false;

    if (NewMember.MyPawn == None)
        return false;

    if (NewMember.MyPawn == SquadOwner)
        return false;

    if (NewMember.MyPawn.Health <= 0)
        return false;

    if (NewMember.bHasTransformed)
        return false;

    if (IsMember(NewMember))
        return false;

    if (GetMemberCount() >= MaxMembers)
        return false;

    if (NewMember.TrustLevel < MinimumTrustToJoin)
        return false;

    return true;
}

// Adds an NPC to the central roster.
// This function does not possess the NPC or replace its controller.
function bool AddMember(ThingSquadController NewMember)
{
    if (!CanAddMember(NewMember))
    {
        Log("THING SQUAD: Recruitment rejected for " $ NewMember);
        return false;
    }

    Members.Length = Members.Length + 1;
    Members[Members.Length - 1] = NewMember;

    // Give the new member the squad's current enemy, if one exists.
    if (SharedEnemy != None)
        NewMember.Enemy = SharedEnemy;

    // Store the current order on the member.
    // Actual movement/order execution belongs to its controller.
    NewMember.CurrentTactic = CurrentOrder;

    Log(
        "THING SQUAD: Added " $ NewMember.MyPawn $
        ". Members: " $ GetMemberCount()
    );

    return true;
}

// Removes an NPC without destroying its pawn or controller.
function bool RemoveMember(ThingSquadController OldMember)
{
    local int i;
    local int j;

    if (OldMember == None)
        return false;

    for (i = 0; i < Members.Length; i++)
    {
        if (Members[i] == OldMember)
        {
            // Compact the dynamic array.
            for (j = i; j < Members.Length - 1; j++)
                Members[j] = Members[j + 1];

            Members.Length = Members.Length - 1;

            OldMember.CurrentTactic = "none";
            OldMember.SquadLeader = None;

            Log(
                "THING SQUAD: Removed " $ OldMember $
                ". Members: " $ GetMemberCount()
            );

            return true;
        }
    }

    return false;
}

// Returns a member by roster index.
function ThingSquadController GetMember(int Index)
{
    if (Index < 0 || Index >= Members.Length)
        return None;

    return Members[Index];
}

// Removes all members from the roster.
// NPCs themselves are not destroyed.
function ClearMembers()
{
    local int i;

    for (i = Members.Length - 1; i >= 0; i--)
    {
        if (Members[i] != None)
        {
            Members[i].CurrentTactic = "none";
            Members[i].SquadLeader = None;
        }
    }

    Members.Length = 0;
    SharedEnemy = None;
    CurrentOrder = "follow";

    Log("THING SQUAD: Roster cleared.");
}

// ============================================================================
// SHARED ENEMY
// ============================================================================

// Updates the squad's shared enemy and informs every living member.
// This shares target information; it does not force an NPC to attack.
function SetSharedEnemy(Pawn NewEnemy)
{
    local int i;
    local ThingSquadController Member;

    SharedEnemy = NewEnemy;

    for (i = 0; i < Members.Length; i++)
    {
        Member = Members[i];

        if (Member != None && Member.MyPawn != None)
            Member.Enemy = SharedEnemy;
    }

    if (SharedEnemy == None)
        Log("THING SQUAD: Shared enemy cleared.");
    else
        Log("THING SQUAD: Shared enemy set to " $ SharedEnemy);
}

// ============================================================================
// ORDERS
// ============================================================================

// Accepted orders:
//   follow, hold, advance, fallback, flank, charge
//
// This records and distributes the order. The controller is responsible
// for carrying out the corresponding movement/combat behaviour.
function bool IssueOrder(string NewOrder)
{
    local int i;
    local ThingSquadController Member;

    switch (NewOrder)
    {
        case "follow":
        case "hold":
        case "advance":
        case "fallback":
        case "flank":
        case "charge":
            break;

        default:
            Log("THING SQUAD: Unknown order: " $ NewOrder);
            return false;
    }

    CurrentOrder = NewOrder;

    for (i = 0; i < Members.Length; i++)
    {
        Member = Members[i];

        if (Member != None && Member.MyPawn != None)
            Member.CurrentTactic = NewOrder;
    }

    Log("THING SQUAD: Order issued: " $ CurrentOrder);

    return true;
}

// ============================================================================
// CLEANUP
// ============================================================================

// Periodically remove dead, destroyed or transformed members.
// Reverse iteration allows safe removal from the dynamic array.
function Tick(float DeltaTime)
{
    local int i;
    local ThingSquadController Member;

    Super.Tick(DeltaTime);

    for (i = Members.Length - 1; i >= 0; i--)
    {
        Member = Members[i];

        if (Member == None ||
            Member.MyPawn == None ||
            Member.MyPawn.Health <= 0 ||
            Member.bHasTransformed)
        {
            if (Member != None)
                RemoveMember(Member);
            else
                RemoveMemberAt(i);
        }
    }

    // The player pawn may be destroyed during a level transition.
    if (SquadOwner == None)
        ClearMembers();
}

// Internal array removal for a null controller entry.
function RemoveMemberAt(int Index)
{
    local int i;

    if (Index < 0 || Index >= Members.Length)
        return;

    for (i = Index; i < Members.Length - 1; i++)
        Members[i] = Members[i + 1];

    Members.Length = Members.Length - 1;
}

// ============================================================================
// DEFAULTS
// ============================================================================

defaultproperties
{
    MaxMembers=4
    MinimumTrustToJoin=60.0
    CurrentOrder="follow"
    bSquadInitialized=false
    bHidden=true
    bCollideActors=false
    bBlockActors=false
    bBlockPlayers=false
}
