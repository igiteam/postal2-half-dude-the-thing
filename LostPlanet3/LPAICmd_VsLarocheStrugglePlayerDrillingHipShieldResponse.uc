class LPAICmd_VsLarocheStrugglePlayerDrillingHipShieldResponse extends LPAICmd_VsLarocheStrugglePlayerDestroyingHipShieldResponse within LPAIControllerVsLaroche;

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield';
    //return ReturnValue;    
}
