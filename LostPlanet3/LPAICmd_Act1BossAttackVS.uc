class LPAICmd_Act1BossAttackVS extends LPAICmd_Act1BossAttack within LPAIControllerAct1Boss;

function GetDesiredTetherRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.BossPawn.TuneDataBoss.DesiredIdleRangeVS.GetValue();
    //return ReturnValue;    
}

function GetMaxTetherRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.BossPawn.TuneDataBoss.MaxTetherRangeVS.GetValue();
    //return ReturnValue;    
}

function CanPerformSpawnLeeches()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PerformStrike()
{
    Outer.TimeOfLastAttack = Outer.WorldInfo.TimeSeconds;
    Outer.CmdAct1BossTunedStrike(EnemyForAttack,, 1);
    //return;    
}
