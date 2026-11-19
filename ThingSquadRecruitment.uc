
// ============================================================================
// ThingSquadRecruitment.uc
// The Paranoia Engine - Dynamic NPC Recruitment
//
// Handles:
// 1. Finding nearby recruitable NPCs.
// 2. Checking NPC eligibility.
// 3. Recruiting NPCs into the player's squad.
// 4. Enforcing squad capacity.
// 5. Dismissing recruited NPCs.
// 6. Tracking squad membership.
//
// NPC psychology and combat AI remain in ThingSquadController.
// ============================================================================

class ThingSquadRecruitment extends Actor;

// ============================================================================
// SECTION 1: CONFIGURATION
// ============================================================================

var() float RecruitmentRadius;
var() float MinimumTrust;
var() int MaxSquadSize;

var() bool bRequireLineOfSight;
var() bool bAllowInfected;
var() bool bAllowLowMorale;

// ============================================================================
// SECTION 2: SQUAD DATA
// ============================================================================

var array<ThingSquadController> RecruitedMembers;

var PlayerController SquadCommander;

// ============================================================================
// SECTION 3: INITIALIZATION
// ============================================================================

function PostBeginPlay()
{
    Super.PostBeginPlay();

    RecruitmentRadius = 700.0;
    MinimumTrust = 60.0;
    MaxSquadSize = 4;

    bRequireLineOfSight = true;
    bAllowInfected = false;
    bAllowLowMorale = false;

    Log("THING SQUAD: Recruitment system initialized.");
}

// ============================================================================
// SECTION 4: GET SQUAD SIZE
// ============================================================================

function int GetSquadSize()
{
    CleanupDeadMembers();

    return RecruitedMembers.Length;
}

// ============================================================================
// SECTION 5: CHECK MEMBERSHIP
// ============================================================================

function bool IsMember(ThingSquadController Candidate)
{
    local int i;

    if (Candidate == None)
        return false;

    for (i = 0; i < RecruitedMembers.Length; i++)
    {
        if (RecruitedMembers[i] == Candidate)
            return true;
    }

    return false;
}

// ============================================================================
// SECTION 6: CHECK NPC ELIGIBILITY
// ============================================================================

function bool CanRecruit(
    ThingSquadController Candidate,
    Pawn Recruiter
)
{
    local Pawn CandidatePawn;

    if (Candidate == None || Recruiter == None)
        return false;

    CandidatePawn = Candidate.MyPawn;

    if (CandidatePawn == None)
        return false;

    // NPC must be alive.
    if (CandidatePawn.Health <= 0)
        return false;

    // Cannot recruit transformed Things.
    if (Candidate.bHasTransformed)
        return false;

    // Infection restrictions.
    if (Candidate.bIsInfected && !bAllowInfected)
        return false;

    // Trust restrictions.
    if (Candidate.TrustLevel < MinimumTrust)
        return false;

    // Morale restrictions.
    if (Candidate.MoraleLevel < 5 && !bAllowLowMorale)
        return false;

    // Already recruited.
    if (IsMember(Candidate))
        return false;

    // Already belongs to another player's squad.
    if (Candidate.SquadCommander != None)
        return false;

    // Distance check.
    if (VSize(CandidatePawn.Location - Recruiter.Location)
        > RecruitmentRadius)
        return false;

    // Visibility check.
    if (bRequireLineOfSight)
    {
        if (Recruiter.Controller == None)
            return false;

        if (!Recruiter.Controller.LineOfSightTo(CandidatePawn))
            return false;
    }

    return true;
}

// ============================================================================
// SECTION 7: FIND NEAREST RECRUITABLE NPC
// ============================================================================

function ThingSquadController FindNearestRecruitable(Pawn Recruiter)
{
    local ThingSquadController Candidate;
    local ThingSquadController BestCandidate;

    local float Distance;
    local float BestDistance;

    BestDistance = RecruitmentRadius;
    BestCandidate = None;

    if (Recruiter == None)
        return None;

    foreach AllActors(class'ThingSquadController', Candidate)
    {
        if (CanRecruit(Candidate, Recruiter))
        {
            Distance = VSize(
                Candidate.MyPawn.Location - Recruiter.Location
            );

            if (Distance < BestDistance)
            {
                BestDistance = Distance;
                BestCandidate = Candidate;
            }
        }
    }

    return BestCandidate;
}

// ============================================================================
// SECTION 8: RECRUIT NPC
// ============================================================================

function bool RecruitNPC(
    ThingSquadController Candidate,
    Pawn Recruiter
)
{
    local PlayerController PC;

    if (Candidate == None || Recruiter == None)
        return false;

    PC = PlayerController(Recruiter.Controller);

    if (PC == None)
        return false;

    // Establish commander.
    if (SquadCommander == None)
        SquadCommander = PC;

    // Only one player commander per squad.
    if (SquadCommander != PC)
        return false;

    // Enforce capacity.
    if (GetSquadSize() >= MaxSquadSize)
    {
        Log("THING SQUAD: Squad is full.");
        return false;
    }

    // Check eligibility.
    if (!CanRecruit(Candidate, Recruiter))
        return false;

    // Add member.
    RecruitedMembers[RecruitedMembers.Length] = Candidate;

    // Update NPC state.
    Candidate.SquadCommander = PC;
    Candidate.bIsRecruited = true;
    Candidate.CurrentTactic = "follow";

    Candidate.PlayDialog("aid_enadvance");

    Log(
        "THING SQUAD: Recruited "
        $ Candidate.MyPawn
        $ ". Squad size: "
        $ RecruitedMembers.Length
    );

    return true;
}

// ============================================================================
// SECTION 9: RECRUIT NEAREST NPC
// ============================================================================

function bool RecruitNearest(Pawn Recruiter)
{
    local ThingSquadController Candidate;

    Candidate = FindNearestRecruitable(Recruiter);

    if (Candidate == None)
    {
        Log("THING SQUAD: No eligible NPC nearby.");
        return false;
    }

    return RecruitNPC(Candidate, Recruiter);
}

// ============================================================================
// SECTION 10: DISMISS NPC
// ============================================================================

function bool DismissNPC(ThingSquadController Candidate)
{
    local int i;

    if (Candidate == None)
        return false;

    for (i = 0; i < RecruitedMembers.Length; i++)
    {
        if (RecruitedMembers[i] == Candidate)
        {
            // Restore normal NPC behaviour.
            Candidate.bIsRecruited = false;
            Candidate.SquadCommander = None;
            Candidate.CurrentTactic = "none";
            Candidate.SquadLeader = None;

            // Remove from array.
            RecruitedMembers.Remove(i, 1);

            Log("THING SQUAD: NPC dismissed.");

            return true;
        }
    }

    return false;
}

// ============================================================================
// SECTION 11: DISMISS ENTIRE SQUAD
// ============================================================================

function DismissAll()
{
    local int i;
    local ThingSquadController Member;

    for (i = RecruitedMembers.Length - 1; i >= 0; i--)
    {
        Member = RecruitedMembers[i];

        if (Member != None)
        {
            Member.bIsRecruited = false;
            Member.SquadCommander = None;
            Member.CurrentTactic = "none";
            Member.SquadLeader = None;
        }
    }

    RecruitedMembers.Length = 0;

    SquadCommander = None;

    Log("THING SQUAD: All members dismissed.");
}

// ============================================================================
// SECTION 12: CLEANUP DEAD NPCS
// ============================================================================

function CleanupDeadMembers()
{
    local int i;
    local ThingSquadController Member;

    for (i = RecruitedMembers.Length - 1; i >= 0; i--)
    {
        Member = RecruitedMembers[i];

        if (
            Member == None
            || Member.MyPawn == None
            || Member.MyPawn.Health <= 0
            || Member.bHasTransformed
        )
        {
            RecruitedMembers.Remove(i, 1);
        }
    }
}

// ============================================================================
// SECTION 13: DEFAULT PROPERTIES
// ============================================================================

defaultproperties
{
    RecruitmentRadius=700.0
    MinimumTrust=60.0
    MaxSquadSize=4

    bRequireLineOfSight=True
    bAllowInfected=False
    bAllowLowMorale=False

    bHidden=True
    bCollideActors=False
    bBlockActors=False
    bBlockPlayers=False
}
