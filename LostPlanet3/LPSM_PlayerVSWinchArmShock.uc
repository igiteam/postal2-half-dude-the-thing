class LPSM_PlayerVSWinchArmShock extends LPSM_PlayerVSWinchGrabbedPawnAction
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GetPawnSpecialMoveStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return GrabbedPawn.VSShockSpecialMove;
    //return ReturnValue;    
}

function GetTouchedEventIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 5;
    //return ReturnValue;    
}

function GetSMMessageType()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return Class'LPSMMTypes'.default.SMM_TossCrushedPawn;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}