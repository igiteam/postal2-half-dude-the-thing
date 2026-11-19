class LPAICmd_DefenderRamAttackVs extends LPAICmd_DefenderRamAttackBase within LPAIControllerDefender;

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

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation2D(Outer.DefenderPawn.TuneDataDefender.MaxDistanceAwayToTryRamAttackVs.GetValue());
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    super.PerformBestStikeBasedOnDistanceToTarget();
    Outer.CmdRamStrikeVs(EnemyForAttack,, 1);
    //return;    
}
