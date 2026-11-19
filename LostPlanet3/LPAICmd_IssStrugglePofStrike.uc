class LPAICmd_IssStrugglePofStrike extends LPAICmd_StrugglePofStrike within LPAIControllerHumanIss;

function HaveStruggleStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsStruggleModeForced();
    //return ReturnValue;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerIssStruggle';
    //return ReturnValue;    
}
