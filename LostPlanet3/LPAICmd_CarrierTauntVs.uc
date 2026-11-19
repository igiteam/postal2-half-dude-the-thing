class LPAICmd_CarrierTauntVs extends LPAICmd_CarrierTaunt within LPAIControllerCarrier
    config(AI);

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.CarrierPawn.ArmCollisionOn();
    super.Popped();
    //return;    
}

function GetRaiseIntoTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntRaiseVs';
    //return ReturnValue;    
}

function GetTauntLoopSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLoopVs';
    //return ReturnValue;    
}

function GetLowerOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLowerVs';
    //return ReturnValue;    
}

function GetStrikeOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntStrikeVs';
    //return ReturnValue;    
}
