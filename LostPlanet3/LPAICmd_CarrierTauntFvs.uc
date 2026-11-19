class LPAICmd_CarrierTauntFvs extends LPAICmd_CarrierTaunt within LPAIControllerCarrier
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

    return Class'LPSM_CarrierTauntRaiseFvs';
    //return ReturnValue;    
}

function GetTauntLoopSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLoopFvs';
    //return ReturnValue;    
}

function GetLowerOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLowerFvs';
    //return ReturnValue;    
}

function GetStrikeOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntStrikeFvs';
    //return ReturnValue;    
}
