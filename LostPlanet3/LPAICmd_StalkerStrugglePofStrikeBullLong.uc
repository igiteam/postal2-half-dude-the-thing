class LPAICmd_StalkerStrugglePofStrikeBullLong extends LPAICmd_StrugglePofStrike within LPAIControllerStalker;

function Pushed()
{
    Outer.StalkerPawn.EnableSpikesStruggleGlowFactor(true);
    Outer.StalkerPawn.EnableArmsStruggleGlowFactor(true);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.StalkerPawn.EnableSpikesStruggleGlowFactor(false);
    Outer.StalkerPawn.EnableArmsStruggleGlowFactor(false);
    super.Popped();
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerStalkerStrikeBullLong';
    //return ReturnValue;    
}

function HaveStruggleStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CanDoStruggle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}
