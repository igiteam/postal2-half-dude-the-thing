class LPGFxUIElementVSWinchPoint extends LPGFxUIElementVSInteractionPoint
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRequiresExtendedWinch;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    //return;    
}

function CreateInteractionPointMC()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Mode[9437185];
    local /*0x97E50000-0x00000000*/ private float X[9437185], Y;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createWinchPoint");
    //return ReturnValue;    
}

function PlayerHasRequiredEquipment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPVSP;
    local /*0x97E50000-0x00000000*/ private bool bRetval;

    LPPC = GetLPPC();
    LPVSP = LPVSPlayerPawn(LPPC.Pawn);
    bRetval = LPVSP.FindInventoryType(Class'LPWeaponVSWinch', true) != none;
    // End:0xD3
    if(bRetval && bRequiresExtendedWinch)
    {
        // End:0xD3
        if(LPPC.HasUpgrade(Class'LPVSUpgrade_ExtendedWinch') == false)
        {
            bRetval = false;
        }
    }
    return bRetval;
    //return ReturnValue;    
}

function NotifyChangedVSInventoryPart()
{
    SetInteractionPointActive(InteractionPointMC, true);
    //return;    
}

function GetHelpType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 5;
    //return ReturnValue;    
}

function GetTutorialText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;

    LPPC = GetLPPC();
    S = "";
    // End:0x103
    if(LPPC != none)
    {
        // End:0x103
        if(LPPC.ShouldDisplayVSCombatTutorials())
        {
            // End:0xD1
            if(LPVSInteractionPointHUD(AttachedActor) != none)
            {
                S = MoviePlayer.GetLocalizedString(LPVSInteractionPointHUD(AttachedActor).InputCallout.MarkUpTag);                
            }
            else
            {
                S = MoviePlayer.GetLocalizedString(TutorialString);
            }
        }
    }
    return S;
    //return ReturnValue;    
}

function SetWorldPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];

    WorldPos = pos;
    //return;    
}

function SetPlayerIsBusy()
{
    local /*0x97E50000-0x00000000*/ private bool bInPlayerIsBusy[8388609];

    SetInteractionPointActive(InteractionPointMC, !bInPlayerIsBusy);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    SetInteractionPointText(InteractionPointMC, GetTutorialText());
    //return;    
}

function SetInteractionPointText()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Str[8388609];

    MoviePlayer.ActionScriptVoid("setWinchPointText");
    //return;    
}

function UpdateVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bVisible;
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint, LPPC;

    bVisible = true;
    WinchPoint = LPVSWinchPoint(AttachedActor);
    // End:0x106
    if(WinchPoint != none)
    {
        LPPC = GetLPPC();
        // End:0x106
        if((WinchPoint.VisibilityDistance > float(0)) && LPPC != none)
        {
            // End:0x106
            if(VSize(WinchPoint.Location - LPPC.Pawn.Location) > WinchPoint.VisibilityDistance)
            {
                bVisible = false;
            }
        }
    }
    return bVisible;
    //return ReturnValue;    
}

function GetWorldPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], WinchPoint;

    // End:0x25
    if(SPPawn(AttachedActor) != none)
    {
        return WorldPos;        
    }
    else
    {
        WinchPoint = LPVSWinchPoint(AttachedActor);
        // End:0x70
        if(WinchPoint != none)
        {
            return WinchPoint.GetHUDReticleLocation();
        }
    }
    return AttachedActor.Location;
    //return ReturnValue;    
}

defaultproperties
{
    bAimForActive=false
    InteractableFunctionName="setWinchPointActive"
    AimWidthFunctionName="getWinchPointAimWidth"
    AimHeightFunctionName="getWinchPointAimHeight"
    TutorialString="<InputCallOuts:GBA_WinchArm>"
}