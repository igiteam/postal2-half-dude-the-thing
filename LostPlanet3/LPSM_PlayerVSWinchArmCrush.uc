class LPSM_PlayerVSWinchArmCrush extends LPSM_PlayerVSWinchGrabbedPawnAction
    config(Game);

function GetPawnSpecialMoveStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CrushedByVS';
    //return ReturnValue;    
}

function GetTouchedEventIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 1;
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