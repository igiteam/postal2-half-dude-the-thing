class LPAIObjectiveAttackVSISS extends LPAIObjectiveAttackActor within LPAIControllerVSISS
    config(AI)
    hidecategories(Object,Object);

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function UpdateRating()
{
    // End:0xE4
    if(Outer.bPickPlayerNext && (Outer.WorldInfo.TimeSeconds - Outer.TimeStampCloseRangeStrike) < 4.0000000)
    {
        // End:0xD3
        if(LPPlayerPawn(EnemyInfo.Info.Actor) != none)
        {
            Rating = 10000.0000000;
            return;            
        }
        else
        {
            Rating = 0.0000000;
            return;
        }
    }
    // End:0x186
    if(int(Outer.vsPawn.GetMainCore()) == int(4))
    {
        // End:0x175
        if(LPPlayerPawn(EnemyInfo.Info.Actor) != none)
        {
            Rating = 10000.0000000;
            return;            
        }
        else
        {
            Rating = 0.0000000;
            return;
        }
    }
    super(LPAIObjectiveAttack).UpdateRating();
    //return;    
}

function CanSwitchEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x78
    if((EnemyInfo.Info.Actor != Outer.MainEnemy) && Outer.WeaponIsFiring())
    {
        return false;
    }
    // End:0x18C
    if(((LPPlayerPawn(Outer.MainEnemy) != none) && Outer.FireTarget == Outer.MainEnemy) && (Outer.WorldInfo.TimeSeconds - Outer.FireTargetTimeStampAcquire) < Outer.vsPawn.TuneDataVsISS.MinTimeAttackPlayer)
    {
        return false;
    }
    return super(LPAIObjectiveAttack).CanSwitchEnemies();
    //return ReturnValue;    
}

event GetCostFactor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Factor;
    local /*0x97E50000-0x00000000*/ private @NULL AkridTarget;

    Factor = super(LPAIObjectiveAttack).GetCostFactor(InAttackTarget);
    // End:0x8F
    if(Factor > float(0))
    {
        AkridTarget = LPAIPawnAkrid(InAttackTarget.Info.Actor);
        // End:0x8F
        if(AkridTarget != none)
        {
            Factor *= 0.5000000;
        }
    }
    return Factor;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.AISetMainEnemy(SPPawn(EnemyInfo.Info.Actor));
    // End:0xDA
    if(Outer.bPickPlayerNext && LPPlayerPawn(EnemyInfo.Info.Actor) != none)
    {
        Outer.bPickPlayerNext = false;
    }
    super.PerformObjective();
    //return;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    bRangedAttack=true
}