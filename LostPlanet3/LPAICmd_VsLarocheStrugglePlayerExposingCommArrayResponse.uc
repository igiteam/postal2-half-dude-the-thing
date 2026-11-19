class LPAICmd_VsLarocheStrugglePlayerExposingCommArrayResponse extends LPAICmd_VsLarocheStruggleVsStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    Outer.UpdateVsLightsLeftShoulderShieldStruggleStart();
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray';
    //return ReturnValue;    
}
