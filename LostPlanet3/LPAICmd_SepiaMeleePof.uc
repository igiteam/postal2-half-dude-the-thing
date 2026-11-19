class LPAICmd_SepiaMeleePof extends LPAICmd_SepiaMelee within LPAIControllerSepia;

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

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    // End:0x6B
    if(Outer.CurrentSepiaMassRetreatMgrRef != none)
    {
        Outer.CurrentSepiaMassRetreatMgrRef.StopTrackingDeathsForMassRetreat();
    }
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super.CanStrike())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL strikeDensityRes;

    // End:0x26
    if(!Outer.HaveAttackAccess())
    {
        return false;
    }
    // End:0xCD
    if(EnemyForAttack != none)
    {
        strikeDensityRes = LPAIResSepiaStrike(EnemyForAttack.AIResourceManager.GetResource(Outer.StrikeResourceName));
        // End:0xCD
        if(strikeDensityRes != none)
        {
            // End:0xCD
            if(strikeDensityRes.IsDensityOfStrikesOverTimeTooHighToAllowAnotherStrike())
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    Outer.GetAttackAccess(EnemyForAttack);
    //return;    
}

function AttackEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    // End:0x21D
    if(Outer.SepiaPawn != none)
    {
        ResLoc = none;
        Outer.bMeleeFinished = false;
        Outer.CmdDirectAttackPof(EnemyForAttack, int(Outer.SepiaPawn.TuneDataSepia.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.SepiaPawn.TuneDataSepia.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.SepiaPawn.TuneDataSepia.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.SepiaPawn.TuneDataSepia.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ResLoc, Outer.CmdStatus_SepiaAttack, 1);
    }
    //return;    
}
