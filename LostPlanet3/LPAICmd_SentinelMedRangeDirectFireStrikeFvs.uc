class LPAICmd_SentinelMedRangeDirectFireStrikeFvs extends LPAICmd_SentinelMedRangeDirectFireStrike within LPAIControllerSentinel;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SentinelDirectFireStrike';
    //return ReturnValue;    
}
