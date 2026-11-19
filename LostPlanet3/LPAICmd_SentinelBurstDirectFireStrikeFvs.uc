class LPAICmd_SentinelBurstDirectFireStrikeFvs extends LPAICmd_SentinelBurstDirectFireStrike within LPAIControllerSentinel;

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

    return Class'LPSM_SentinelBurstFireStrike';
    //return ReturnValue;    
}
