class LPAICmd_SepiaSuicideLongJumpBiteStrikeVs extends LPAICmd_SepiaSuicideLongJumpBiteStrike within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x156
    if((!bMeleeHitEnemy && Outer.SepiaPawn != none) && Outer.SepiaPawn.Health > 0)
    {
        Outer.SepiaPawn.TakeDamage(Outer.SepiaPawn.HealthMax + 1, Outer, Outer.SepiaPawn.Location, Normal(Outer.SepiaPawn.Velocity), Class'LPDamageTypeForced');
    }
    super.Popped();
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SepiaSuicideLongJumpBiteStrikeVs';
    //return ReturnValue;    
}
