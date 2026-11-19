
//
// ThingSquadHud.uc
//
// Squad status HUD for The Paranoia Engine.
// Inspired by the Half-Life 2 squad status HUD.
//
// Displays:
// - C = normal squad member
// - M = medic
// - Squad member count
// - Squad following / stationed status
// - Brief feedback when squad members join or leave
//

class ThingSquadHud extends P2HUD;


// ============================================================================
// CONFIGURATION
// ============================================================================

// The squad ID to display.
var string DisplaySquadID;

// Whether to display the stationed status.
var bool bShowStationedText;

// HUD positioning.
var float IconStartX;
var float IconStartY;
var float IconSpacing;

var float TextStartX;
var float TextStartY;

// Squad state.
var int CachedSquadMembers;
var int CachedSquadMedics;

var bool bSquadFollowing;
var bool bPreviousSquadFollowing;

// Feedback.
var float SquadChangeFlashEnd;
var string SquadChangeMessage;


// ============================================================================
// INITIALIZATION
// ============================================================================

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    DisplaySquadID = "PlayerSquad";

    bShowStationedText = true;

    IconStartX = 12.0;
    IconStartY = 12.0;
    IconSpacing = 22.0;

    TextStartX = 12.0;
    TextStartY = 34.0;

    CachedSquadMembers = 0;
    CachedSquadMedics = 0;

    bSquadFollowing = true;
    bPreviousSquadFollowing = true;

    SquadChangeFlashEnd = 0.0;
    SquadChangeMessage = "";
}


// ============================================================================
// HUD RENDERING
// ============================================================================

simulated function PostRender(Canvas C)
{
    Super.PostRender(C);

    DrawSquadStatus(C);
}


// ============================================================================
// FIND SQUAD MEMBERS
// ============================================================================

simulated function UpdateSquadInformation()
{
    local ThingSquadController SquadController;
    local ThingSquadController SquadLeaderController;

    local int NewMemberCount;
    local int NewMedicCount;

    local bool NewFollowing;

    NewMemberCount = 0;
    NewMedicCount = 0;

    NewFollowing = true;
    SquadLeaderController = None;

    // Find the squad leader.
    foreach AllActors(class'ThingSquadController', SquadController)
    {
        if (SquadController.SquadID != DisplaySquadID)
            continue;

        if (!SquadController.bIsSquadLeader)
            continue;

        SquadLeaderController = SquadController;
        break;
    }

    if (SquadLeaderController == None)
    {
        CachedSquadMembers = 0;
        CachedSquadMedics = 0;
        return;
    }

    // Read the leader's current order.
    NewFollowing = (SquadLeaderController.CurrentTactic == "follow");

    // Count living squad members.
    foreach AllActors(class'ThingSquadController', SquadController)
    {
        if (SquadController.SquadID != DisplaySquadID)
            continue;

        if (!SquadController.bIsInSquad)
            continue;

        if (SquadController.MyPawn == None)
            continue;

        if (SquadController.MyPawn.Health <= 0)
            continue;

        NewMemberCount++;

        // Medic role.
        if (SquadController.SquadRole ~= "Medic")
            NewMedicCount++;
    }

    // Detect members joining.
    if (NewMemberCount > CachedSquadMembers)
    {
        SquadChangeMessage = "SQUAD MEMBER ADDED";
        SquadChangeFlashEnd = Level.TimeSeconds + 1.0;
    }

    // Detect members leaving or dying.
    else if (NewMemberCount < CachedSquadMembers)
    {
        SquadChangeMessage = "SQUAD MEMBER LOST";
        SquadChangeFlashEnd = Level.TimeSeconds + 1.0;
    }

    // Detect following state changes.
    if (NewFollowing != bPreviousSquadFollowing)
    {
        if (NewFollowing)
            SquadChangeMessage = "SQUAD FOLLOWING";
        else
            SquadChangeMessage = "SQUAD STATIONED";

        SquadChangeFlashEnd = Level.TimeSeconds + 1.0;
    }

    CachedSquadMembers = NewMemberCount;
    CachedSquadMedics = NewMedicCount;

    bPreviousSquadFollowing = NewFollowing;
    bSquadFollowing = NewFollowing;
}


// ============================================================================
// DRAW SQUAD STATUS
// ============================================================================

simulated function DrawSquadStatus(Canvas C)
{
    local int i;

    local float X;
    local float Y;

    local float OldClipX;

    local ThingSquadController SquadController;

    local int MemberIndex;

    local Color NormalColor;
    local Color MedicColor;
    local Color TextColor;

    // Update squad information.
    UpdateSquadInformation();

    // Nothing to display if there are no members.
    if (CachedSquadMembers <= 0)
        return;

    // Save drawing position.
    OldClipX = C.ClipX;

    X = IconStartX;
    Y = IconStartY;

    // Normal squad icon color.
    NormalColor.R = 255;
    NormalColor.G = 220;
    NormalColor.B = 0;
    NormalColor.A = 200;

    // Medic icon color.
    MedicColor.R = 80;
    MedicColor.G = 220;
    MedicColor.B = 255;
    MedicColor.A = 220;

    // Status text color.
    TextColor.R = 255;
    TextColor.G = 220;
    TextColor.B = 0;
    TextColor.A = 200;

    C.Font = Font'Engine.DefaultFont';

    // Draw each squad member.
    MemberIndex = 0;

    foreach AllActors(class'ThingSquadController', SquadController)
    {
        if (SquadController.SquadID != DisplaySquadID)
            continue;

        if (!SquadController.bIsInSquad)
            continue;

        if (SquadController.MyPawn == None)
            continue;

        if (SquadController.MyPawn.Health <= 0)
            continue;

        C.SetPos(X, Y);

        // Medic icon.
        if (SquadController.SquadRole ~= "Medic")
        {
            C.DrawColor = MedicColor;
            C.DrawText("M", false);
        }
        else
        {
            C.DrawColor = NormalColor;
            C.DrawText("C", false);
        }

        X += IconSpacing;
        MemberIndex++;
    }

    // Draw squad status text.
    C.SetPos(TextStartX, TextStartY);
    C.DrawColor = TextColor;

    if (bSquadFollowing)
    {
        C.DrawText("SQUAD FOLLOWING", false);
    }
    else if (bShowStationedText)
    {
        C.DrawText("SQUAD STATIONED", false);
    }

    // Draw temporary join/leave feedback.
    if (Level.TimeSeconds < SquadChangeFlashEnd)
    {
        C.SetPos(TextStartX, TextStartY + 18.0);

        C.DrawColor.R = 255;
        C.DrawColor.G = 255;
        C.DrawColor.B = 255;
        C.DrawColor.A = 255;

        C.DrawText(SquadChangeMessage, false);
    }

    // Draw member count.
    C.SetPos(TextStartX, TextStartY + 36.0);

    C.DrawColor = NormalColor;

    C.DrawText(
        "SQUAD: " $ string(CachedSquadMembers),
        false
    );
}


// ============================================================================
// RESET
// ============================================================================

simulated function Reset()
{
    Super.Reset();

    CachedSquadMembers = 0;
    CachedSquadMedics = 0;

    bSquadFollowing = true;
    bPreviousSquadFollowing = true;

    SquadChangeFlashEnd = 0.0;
    SquadChangeMessage = "";
}


// ============================================================================
// DEFAULT PROPERTIES
// ============================================================================

defaultproperties
{
    DisplaySquadID="PlayerSquad"
    bShowStationedText=True
}
