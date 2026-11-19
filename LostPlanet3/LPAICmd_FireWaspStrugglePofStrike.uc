class LPAICmd_FireWaspStrugglePofStrike extends LPAICmd_StrugglePofStrike within LPAIControllerFireWasp;

function Popped()
{
    Outer.EnableStruggleAttackGlow(false);
    Outer.FireWaspPawn.TurnOffScriptedGlows();
    super.Popped();
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerFireWaspStruggle';
    //return ReturnValue;    
}

function HaveStruggleStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.bNeedToBringTheHammerDownForHighRateOfFlyFormationInvalidations)
    {
        return true;
    }
    return super.HaveStruggleStrikeAccess();
    //return ReturnValue;    
}
