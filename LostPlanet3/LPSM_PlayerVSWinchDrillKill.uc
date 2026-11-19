class LPSM_PlayerVSWinchDrillKill extends LPSM_PlayerVSWinchGrabbedPawnAction
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Welder[536870913];

function GetPawnSpecialMoveStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return GrabbedPawn.VSDrillKillSpecialMove;
    //return ReturnValue;    
}

function GetTouchedEventIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((Welder == none) ? 3 : 4);
    //return ReturnValue;    
}

function GetSMMessageType()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return Class'LPSMMTypes'.default.SMM_TossCrushedPawn;
    //return ReturnValue;    
}

function PlayStartAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[8388609];

    // End:0x4E
    if(Welder != none)
    {
        LPVSPlayerPawn(MySPPawn).StartRightArmPartAction(0, 2, false, 0, GrabbedPawn,, false, false, false);
    }
    super.PlayStartAnim(GrabbedPawn);
    //return;    
}

function PlayEndAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x3B
    if(Welder != none)
    {
        LPVSPlayerPawn(MySPPawn).StopRightArmPartAction(0);
    }
    super.PlayEndAnim(Node, InUserData, bInterrupted);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    vsPawn = LPVSPlayerPawn(MySPPawn);
    Welder = LPWeaponVSWelder(vsPawn.RightArmPart);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}