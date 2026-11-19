class LPAIObjectiveAttackStalkerFemale extends LPAIObjectiveAttackStalker within LPAIController
    config(AI)
    hidecategories(Object,Object);

event GetTimeEstimate()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Time, Range;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentEnemyPawn, PotentialEnemyPawn, Dir;

    Range = TargetInfoSeperation(InAttackTarget);
    Time = GetTimeForDistance(Range);
    PotentialEnemyPawn = LPPawn(InAttackTarget.Info.Actor);
    // End:0xB9
    if(!Outer.IsEnemyVisible(PotentialEnemyPawn))
    {
        Time *= 1.5000000;
    }
    // End:0x127
    if((Outer.myAIPawn == none) || int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return Time;
    }
    CurrentEnemyPawn = LPPawn(Outer.Enemy);
    // End:0x1CC
    if(Outer.WantsNewEnemy())
    {
        // End:0x1CC
        if(InAttackTarget.Info.Actor == CurrentEnemyPawn)
        {
            Time += (GetWantsNewEnemyPenalty());
        }
    }
    // End:0x2F2
    if((PotentialEnemyPawn != none) && PotentialEnemyPawn.IsInCover())
    {
        Dir = Normal(PotentialEnemyPawn.Location - Outer.myAIPawn.Location);
        // End:0x2F2
        if(PotentialEnemyPawn.IsHiddenByCover(Dir))
        {
            Time += Outer.myAIPawn.TuneDataAIPawn.TimePenaltyForEnemyInCover.GetValue();
        }
    }
    return Time;
    //return ReturnValue;    
}

event GetCost_Summed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Cost;

    // End:0x52
    if(LPAIControllerStalker(Outer).bMultiplayerMode)
    {
        Cost = GetTimeEstimate(InAttackTarget);
        return Cost;
    }
    return super(LPAIObjectiveAttack).GetCost_Summed(InAttackTarget);
    //return ReturnValue;    
}

event GetCostFactorAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn;

    EnemyPawn = LPPawn(InAttackTarget.Info.Actor);
    // End:0xFB
    if(!EnemyPawn.AIResourceManager.HasResource(Outer.FireResourceName) || Outer.CanHaveFireAccess(LPPawn(InAttackTarget.Info.Actor)))
    {
        return 1.0000000;
    }
    return 2.0000000;
    //return ReturnValue;    
}

function GetAttackCost()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Cost, Factor;

    Cost = GetCost_Summed(InAttackTarget);
    DebugData.SummedCost = Cost;
    Factor = 1.0000000;
    Factor *= (GetCostFactorAttackAccess(InAttackTarget));
    Factor *= (GetCostFactorDamagedBy(InAttackTarget));
    Cost *= Factor;
    return Cost;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
}