class LPAICmd_NushiSporeRamStrikePof extends LPAICmd_DefenderRamStrikeBase within LPAIControllerDefender;

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

function GetSucsussfulRamStrikeHitClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeRamStrikeHitPof';
    //return ReturnValue;    
}

function GetMissedRamStrikeClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeRamStrikeMissPof';
    //return ReturnValue;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeRamStrikePof';
    //return ReturnValue;    
}
