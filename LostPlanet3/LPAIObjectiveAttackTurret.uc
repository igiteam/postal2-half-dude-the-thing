class LPAIObjectiveAttackTurret extends LPAIObjectiveAttackActor within LPAIController
    config(AI)
    hidecategories(Object,Object);

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.AISetMainEnemy(SPPawn(EnemyInfo.Info.Actor));
    super.PerformObjective();
    //return;    
}

protected event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TurretPawn;

    TurretPawn = LPAIPawnTurret(Outer.Pawn);
    // End:0x42
    if(TurretPawn == none)
    {
        return false;
    }
    // End:0xF6
    if((Outer.WorldInfo.TimeSeconds - InAttackTarget.Info.LastSeenTime) < TurretPawn.TuneDataTurret.EnemyTooLongNoSeeTime.GetValue())
    {
        return true;
    }
    // End:0x1AA
    if((Outer.WorldInfo.TimeSeconds - InAttackTarget.Info.LastDamageTime) < TurretPawn.TuneDataTurret.EnemyTooLongNoSeeTime.GetValue())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsTargetInAngularRanges()
{
    local /*0x97E50000-0x00000000*/ private @NULL TurretPawn[8388609], Target;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LookDir, ToTarget;

    LookDir = Vector(TurretPawn.Rotation);
    ToTarget = Target.Location - TurretPawn.GetPawnViewLocation();
    // End:0xE5
    if(Class'SPEngine.SPUtil'.static.IsInHorizontalAndVerticalAngleLimit(LookDir, ToTarget, TurretPawn.PeripheralVision, TurretPawn.PeripheralVisionVertical))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

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
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TurretPawn;
    local /*0x97E50000-0x00000000*/ private float Cost;

    TurretPawn = LPAIPawnTurret(Outer.Pawn);
    // End:0x107
    if((Outer.WorldInfo.TimeSeconds - InAttackTarget.Info.LastSeenTime) > LPAIPawnTurret(Outer.Pawn).TuneDataTurret.EnemyTooLongNoSeeTime.GetValue())
    {
        return 10000.0000000;
    }
    // End:0x154
    if(!IsTargetInAngularRanges(TurretPawn, InAttackTarget.Info.Actor))
    {
        return 10000.0000000;
    }
    Cost = GetTimeEstimate(InAttackTarget);
    return Cost;
    //return ReturnValue;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TurretPawn, CurrentEnemy;

    // End:0xAF
    if(EnemyInfo.Info.Actor != none)
    {
        TurretPawn = LPAIPawnTurret(Outer.Pawn);
        // End:0xAF
        if(!IsTargetInAngularRanges(TurretPawn, EnemyInfo.Info.Actor))
        {
            return false;
        }
    }
    CurrentEnemy = GetEnemyPawn();
    // End:0x101
    if((CurrentEnemy != none) && Outer.IsTooLongSinceEnemySeen(CurrentEnemy))
    {
        return false;
    }
    return super.IsValid();
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;

    // End:0x68
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        GenerateSingleObjective(OuterController, InObjectiveManager, InAttributes);        
    }
    else
    {
        super.GenerateObjectives(OuterController, InObjectiveManager, InAttributes);
    }
    //return;    
}

function AllowOtherObjectivesToInterrupt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        return false;
    }
    return super(LPAIObjective).AllowOtherObjectivesToInterrupt();
    //return ReturnValue;    
}

defaultproperties
{
    MinimumAttackTimeBeforeSwitchingEnemies=2.0000000
    AttackCmdTable=/* Array type was not detected. */
    bRangedAttack=true
}