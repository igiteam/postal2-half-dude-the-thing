class LPAICmd_CarrierTauntPof extends LPAICmd_CarrierTaunt within LPAIControllerCarrier
    config(AI);

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

function GetRaiseIntoTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntRaise';
    //return ReturnValue;    
}

function GetTauntLoopSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLoop';
    //return ReturnValue;    
}

function GetLowerOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLower';
    //return ReturnValue;    
}

function GetStrikeOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntStrike';
    //return ReturnValue;    
}
