class LPAICmd_VsLarocheStrugglePlayerDrillingMainSawGenResponse extends LPAICmd_VsLarocheStrugglePlayerDestroyingMainSawGenResponse within LPAIControllerVsLaroche;

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsDrillingMainSawGen';
    //return ReturnValue;    
}
