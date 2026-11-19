class LPAICmd_SepiaSuicideLongJumpBiteStrike extends LPAICmd_SepiaStaticStrikeBase within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SepiaSuicideLongJumpBiteStrike';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x83
    if(Outer.SepiaPawn != none)
    {
        return Outer.SepiaPawn.TuneDataSepia.MaxTimeForJumpBiteAnimation.GetValue();
    }
    return 10.0000000;
    //return ReturnValue;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x1EC
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x1EC
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.SepiaPawn != none)
        {
            Outer.SepiaPawn.StopPawnChoreographyReplicated();
            bMeleeHitEnemy = true;
            Outer.SepiaPawn.TakeDamage(Outer.SepiaPawn.HealthMax + 1, Outer, Outer.SepiaPawn.Location, Normal(Outer.SepiaPawn.Velocity), Class'LPDamageTypeForced');            
        }
    }
    //return;    
}
