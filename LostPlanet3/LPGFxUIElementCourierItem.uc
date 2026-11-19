class LPGFxUIElementCourierItem extends LPGFxUIElementMPObjective
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CourierItem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowDestination;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bObscured;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCarriedByAkrid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckVisibility[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastAkridHealthPct;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VisibilityCheckInterval[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastVisibilityCheckTime;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    CourierItem = LPCourierItem(AttachedActor);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    CourierItem = LPCourierItem(AttachedActor);
    //return;    
}

function ObjectiveChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL ItemOwner;
    local /*0x97E50000-0x00000000*/ private int TeamIndex;

    // End:0x69
    if(int(CourierItem.CourierState) == int(7))
    {
        ItemOwner = LPPlayerPawn(CourierItem.LastCarrier);
        bShowDestination = false;        
    }
    else
    {
        ItemOwner = LPPlayerPawn(CourierItem.Carrier);
        bShowDestination = (ItemOwner != none) && ItemOwner == LPPlayerPawn(GetLPPC().Pawn);
    }
    TeamIndex = ((ItemOwner != none) ? int(ItemOwner.GetTeamNum()) : -1);
    bCarriedByAkrid = LPAIPawnAkrid(CourierItem.Carrier) != none;
    switch(CourierItem.CourierState)
    {
        // End:0x1A2
        case 1:
            SetObjectiveState("neutral");
            // End:0x322
            break;
        // End:0x285
        case 3:
            // End:0x1D1
            if(bCarriedByAkrid)
            {
                SetObjectiveState("carriedByAkrid");                
            }
            else
            {
                // End:0x21E
                if(TeamIndex == 0)
                {
                    SetObjectiveState(((bShowDestination) ? "destinationNevec" : "carriedByNevec"));                    
                }
                else
                {
                    // End:0x26F
                    if(TeamIndex == 1)
                    {
                        SetObjectiveState(((bShowDestination) ? "destinationPirates" : "carriedByPirates"));                        
                    }
                    else
                    {
                        SetObjectiveState("neutral");
                    }
                }
            }
            // End:0x322
            break;
        // End:0x309
        case 7:
            // End:0x2B6
            if(TeamIndex == 0)
            {
                SetObjectiveState("carriedByNevec");                
            }
            else
            {
                // End:0x2E4
                if(TeamIndex == 1)
                {
                    SetObjectiveState("carriedByPirates");                    
                }
                else
                {
                    SetObjectiveState("neutral");
                }
            }
            StateTimer = 3.0000000;
            // End:0x322
            break;
        // End:0xFFFF
        default:
            SetObjectiveState("neutral");
            // End:0x322
            break;
            break;
    }
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CarryPawn;
    local /*0x97E50000-0x00000000*/ private float HealthPct;

    super.UpdateObjectiveIcon(DeltaTime);
    // End:0xE9
    if(bCarriedByAkrid)
    {
        CarryPawn = LPPawn(CourierItem.Carrier);
        // End:0xE9
        if(CarryPawn != none)
        {
            HealthPct = float(CarryPawn.Health) / float(CarryPawn.HealthMax);
            // End:0xE9
            if(HealthPct != LastAkridHealthPct)
            {
                SetProgress(HealthPct);
                LastAkridHealthPct = HealthPct;
            }
        }
    }
    //return;    
}

// Export ULPGFxUIElementCourierItem::execGetIconPosition(FFrame&, void* const)
native function GetIconPosition()
{
    local /*0x97E50000-0x00000000*/ private float distToPlayer[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function ShouldHideUI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHideUI;
    local /*0x97E50000-0x00000000*/ private @NULL CamLoc, CamRot, LPC, LPPP;

    LPC = GetLPPC();
    LPPP = LPPlayerPawn(LPC.Pawn);
    // End:0x1F9
    if(bCheckVisibility && IsCarriedByOpponent())
    {
        // End:0x1F6
        if(LPC.WorldInfo.TimeSeconds > (LastVisibilityCheckTime + VisibilityCheckInterval))
        {
            LPC.GetPlayerViewPoint(CamLoc, CamRot);
            bObscured = (LPPP == none) || !LPPP.FastTrace(CourierItem.Carrier.Location, CamLoc) && !LPPP.FastTrace(LPPawn(CourierItem.Carrier).GetHeadBoneLocation(), CamLoc);
            LastVisibilityCheckTime = LPC.WorldInfo.TimeSeconds;
        }        
    }
    else
    {
        bObscured = false;
    }
    bHideUI = super.ShouldHideUI();
    bHideUI = bHideUI || bObscured;
    bHideUI = bHideUI || ((LPPP != none) && LPPP == LPPlayerPawn(CourierItem.LastCarrier)) && int(CourierItem.CourierState) == int(7);
    bHideUI = (bHideUI || (int(CourierItem.CourierState) == int(7)) && StateTimer <= float(0)) || !CourierItem.bEnabled;
    bHideUI = bHideUI || !CourierItem.CourierTuneData.bShowUIWhileCarriedByAkrid && LPAIPawnAkrid(CourierItem.Carrier) != none;
    return bHideUI;
    //return ReturnValue;    
}

function SetBounded()
{
    local /*0x97E50000-0x00000000*/ private bool bBounded[8388609];

    SetMPObjectiveVisibility(PointMC, !bBounded);
    SetMPObjectiveVisibility(EdgeMC, bBounded && !bCheckVisibility || !IsCarriedByOpponent());
    UpdateEdgeIconRotation();
    //return;    
}

function IsCarriedByOpponent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CourierItem.Carrier != none) && int(CourierItem.Carrier.GetTeamNum()) == (1 - int(GetLPPC().GetTeamNum()));
    //return ReturnValue;    
}

defaultproperties
{
    VisibilityCheckInterval=0.2500000
    ObjectiveType="courier"
    ObjectiveStateFunc="setMPCourierPointState"
}