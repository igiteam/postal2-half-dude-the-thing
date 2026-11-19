class LPAICmd_SentinelMedRangeDirectFireAttackFvs extends LPAICmd_SentinelMedRangeDirectFireAttack within LPAIControllerSentinel;

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

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdMedRangeDirectFireStrikeFvs(EnemyForAttack,, 1);
    //return;    
}
