class LPAICmd_VsLarocheStrugglePlayerCauseByDrillMobilityKillResponse extends LPAICmd_VsLarocheStrugglePlayerCauseMobilityKillResponse within LPAIControllerVsLaroche;

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsCauseByDrillMobilityKill';
    //return ReturnValue;    
}
