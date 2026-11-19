class LPAICmd_PackHunterStrugglePofStrike extends LPAICmd_StrugglePofStrike within LPAIControllerPackHunter;

function Popped()
{
    Outer.PHPawn.TurnOffScriptedGlows();
    super.Popped();
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerPackHunterStruggle';
    //return ReturnValue;    
}
