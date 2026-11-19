class LPAICmd_DefenderDirectAttackPoF extends LPAICmd_MedFlyerDirectAttack within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    Outer.DefenderPawn.bRamAggressiveOnFlag = true;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.UseAnimationAggressive();
    Outer.DefenderPawn.bRamAggressiveOnFlag = false;
    // End:0xF8
    if((EnemyForAttack != none) && LPPlayerController(EnemyForAttack.Controller) != none)
    {
        LPPlayerController(EnemyForAttack.Controller).NotifyOfAttentionDrawingAttackEnded(Outer.DefenderPawn);
    }
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function ShouldPerformAnnounceBeforeRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    // End:0xAC
    if((InEnemy != none) && LPPlayerController(InEnemy.Controller) != none)
    {
        LPPlayerController(InEnemy.Controller).NotifyOfAttentionDrawingAttackStarted(Outer.DefenderPawn);
    }
    //return;    
}

function GetShortAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderSwoopStingStart';
    //return ReturnValue;    
}

function GetLongAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderSwoopStingStart';
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    Outer.CmdDefenderSwoopStingStrike(EnemyForAttack,, 1);
    //return;    
}
