class LPAICmd_DefenderRangedDirectFireAttackVs extends LPAICmd_DefenderRangedAttack within LPAIControllerDefender;

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
    CurStrikeCmd = Outer.CmdMedFlyerBasicDirectFireStrike(EnemyForAttack,, 1);
    //return;    
}
