class LPAICmd_SentinelTacticalPof extends LPAICmd_SentinelTactical within LPAIControllerSentinel;

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

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    //return;    
}

function FixedPlacementAttackEnemy()
{
    super(LPAICmd_StationaryEngagement).FixedPlacementAttackEnemy();
    // End:0x61B
    if(Outer.SentinelPawn != none)
    {
        TypeOfAttackToldToPerform = Outer.SelectCurrentAttackType(EnemyForAttack);
        // End:0x24A
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdLongRangeLobAttackPof(EnemyForAttack, int(Outer.SentinelPawn.TuneDataSentinel.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.SentinelPawn.TuneDataSentinel.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.SentinelPawn.TuneDataSentinel.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.SentinelPawn.TuneDataSentinel.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, none, 1);            
        }
        else
        {
            // End:0x434
            if(int(TypeOfAttackToldToPerform) == int(8))
            {
                CurrentAttackCmd = Outer.CmdMedRangeBurstFireAttackPof(EnemyForAttack, int(Outer.SentinelPawn.TuneDataSentinel.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.SentinelPawn.TuneDataSentinel.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.SentinelPawn.TuneDataSentinel.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.SentinelPawn.TuneDataSentinel.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, none, 1);                
            }
            else
            {
                // End:0x61B
                if(int(TypeOfAttackToldToPerform) == int(5))
                {
                    CurrentAttackCmd = Outer.CmdMedRangeDirectFireAttackPof(EnemyForAttack, int(Outer.SentinelPawn.TuneDataSentinel.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.SentinelPawn.TuneDataSentinel.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.SentinelPawn.TuneDataSentinel.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.SentinelPawn.TuneDataSentinel.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, none, 1);
                }
            }
        }
    }
    //return;    
}
