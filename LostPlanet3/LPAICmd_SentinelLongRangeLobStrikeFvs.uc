class LPAICmd_SentinelLongRangeLobStrikeFvs extends LPAICmd_SentinelLongRangeLobStrike within LPAIControllerSentinel;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SentinelLongRangeLobStrike';
    //return ReturnValue;    
}
