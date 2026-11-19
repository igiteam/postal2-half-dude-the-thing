class LPAICmd_SepiaStrugglePofStrike extends LPAICmd_StrugglePofStrike within LPAIControllerSepia;

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerSepiaStruggleNPH';
    //return ReturnValue;    
}
