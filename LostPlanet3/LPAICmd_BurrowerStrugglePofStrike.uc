class LPAICmd_BurrowerStrugglePofStrike extends LPAICmd_StrugglePofStrike within LPAIControllerBurrower;

function Pushed()
{
    super.Pushed();
    Outer.PawnUnderground(false);
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x63
    if(Outer.BurrowerPawn.Health > 0)
    {
        Outer.PawnUnderground(true);
    }
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerBurrowerStruggle';
    //return ReturnValue;    
}

function HaveStruggleStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}
