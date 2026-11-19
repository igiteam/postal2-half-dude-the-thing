class LPAICmd_Act1BossAttackPOF extends LPAICmd_Act1BossAttack within LPAIControllerAct1Boss;

function CanPerformStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy;
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2D;
    local /*0x97E50000-0x00000000*/ private bool CanPerformMove;

    // End:0x1A7
    if((super.CanPerformStrike() && (Outer.GetLeechCount() == 0) || Outer.bForceExitLeechWait) && int(Outer.BossPawn.Phase) != int(5))
    {
        Enemy2D = EnemyForAttackLocation();
        Enemy2D.Z = MyPawn.Location.Z;
        rangeToEnemy = VSize(Enemy2D - MyPawn.Location);
        // End:0x1A7
        if(rangeToEnemy <= Outer.BossPawn.TuneDataBoss.MaxRangeForTongueStrike.GetValue())
        {
            CanPerformMove = true;
        }
    }
    return CanPerformMove;
    //return ReturnValue;    
}

function PerformStrike()
{
    Outer.TimeOfLastAttack = Outer.WorldInfo.TimeSeconds;
    Outer.CmdAct1BossTunedStrike(EnemyForAttack,, 1);
    //return;    
}
