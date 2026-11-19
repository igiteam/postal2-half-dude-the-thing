class LPAICmd_SpitterAttackPof_MP extends LPAICmd_SpitterAttackPof within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCachedTailCanSee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastSpitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextEnemyCheckTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpitTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpitDelayTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTailCanSee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyToFireAt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StateStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetLockTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextManeuverTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextCloseCombatCheck;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Traversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ValidManeuverPositions[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ValidManeuverPositionsCount;

function Pushed()
{
    SpitDelayTimer = 0.0000000;
    Outer.SetWantsNewEnemy(false);
    NextCloseCombatCheck = Outer.WorldInfo.TimeSeconds + float(3);
    super.Pushed();
    //return;    
}

function Popped()
{
    bWantsToFire = false;
    Outer.EnableRotation(true);
    StopFiring(true);
    // End:0x70
    if(Traversal != none)
    {
        Traversal.Stop();
        Traversal = none;
    }
    Outer.ReleaseFireAccess();
    Outer.SetWantsNewEnemy(false);
    super.Popped();
    //return;    
}

function OnExitSpitterAttack()
{
    StopAttackEvaluater();
    SetDefaultSpeedScale();
    Outer.SetCSA();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GotoDefaultAttackState()
{
    // End:0x86
    if(Outer.SpitterPawn.IsSinglePlayerGame() && Outer.SpitterPawn.IsTeenSpitter())
    {
        GotoAttackState('SPTeenSpitter');        
    }
    else
    {
        GotoAttackState('MPSpitter');
    }
    //return;    
}

function GetTargetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EnemyToFireAt.GetProjectileTargetPosition(Outer.myAIPawn);
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    EnemyToFireAt = InEnemy;
    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    //return;    
}

function SetEnemyToFireAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTarget[8388609];

    EnemyToFireAt = InTarget;
    // End:0x55
    if(Outer.SpitterPawn.IsSpitting())
    {
        StopFiring();
    }
    //return;    
}

function StartManueverTraversal()
{
    // End:0x42
    if(Traversal == none)
    {
        Traversal = LPKyTraversalFindLosSpot(Class'LPKyTraversalFindLosSpot'.static.Create());
    }
    Traversal.SetActor(EnemyForAttack);
    Traversal.SetLosFunction(IsValidAttackPosition);
    Traversal.SetFinishCallBack(TraversalFinished);
    Traversal.StartAndBindToController(MyController, Outer.myAIPawn.Location, Outer.SpitterPawn.TuneDataSpitter.MaxManueverTraversalDistance.GetValue());
    ValidManeuverPositionsCount = 0;
    //return;    
}

function StartGetCloserToEnemyTraversal()
{
    // End:0x42
    if(Traversal == none)
    {
        Traversal = LPKyTraversalFindLosSpot(Class'LPKyTraversalFindLosSpot'.static.Create());
    }
    Traversal.SetActor(EnemyForAttack);
    Traversal.SetLosFunction(IsValidEncroachPosition);
    Traversal.SetFinishCallBack(TraversalFinished);
    Traversal.StartAndBindToController(MyController, Outer.myAIPawn.Location, Outer.SpitterPawn.TuneDataSpitter.MaxManueverTraversalDistance.GetValue());
    ValidManeuverPositionsCount = 0;
    IsManeuvering = true;
    //return;    
}

function IsValidEncroachPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x56
    if(VSize2D(FromLocation - TestActor.Location) > AttackSeperation_SpitAttack.Max)
    {
        return false;
    }
    // End:0x87
    if(ValidManeuverPositionsCount == 0)
    {
        ValidManeuverPositions[0] = FromLocation;
        ValidManeuverPositionsCount++;
        return false;
    }
    // End:0x10B
    if(VSize2D(FromLocation - TestActor.Location) < VSize2D(ValidManeuverPositions[0] - TestActor.Location))
    {
        ValidManeuverPositions[0] = FromLocation;
        return false;
    }
    return false;
    //return ReturnValue;    
}

function IsValidAttackPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;
    local /*0x97E50000-0x00000000*/ private float DistToEnemy;

    // End:0x12
    if(ValidManeuverPositionsCount >= 4)
    {
        return true;
    }
    // End:0xBF
    if(VSize2D(FromLocation - Outer.Pawn.Location) < Outer.SpitterPawn.TuneDataSpitter.MinManueverTraversalDistance.GetValue())
    {
        return false;
    }
    DistToEnemy = VSize2D(FromLocation - TestActor.Location);
    // End:0x128
    if(DistToEnemy >= AttackSeperation_SpitAttack.Max)
    {
        return false;
    }
    bCanSee = Outer.LineOfSightTo(TestActor, FromLocation, false);
    // End:0x16F
    if(!bCanSee)
    {
        return false;
    }
    ValidManeuverPositions[ValidManeuverPositionsCount] = FromLocation;
    ValidManeuverPositionsCount++;
    return false;
    //return ReturnValue;    
}

function TraversalFinished()
{
    //return;    
}

function CanAimAtEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyDir, Forward;
    local /*0x97E50000-0x00000000*/ private float dotprod;

    EnemyDir = Normal(InEnemy.Location - Outer.SpitterPawn.Location);
    Forward = Vector(Outer.SpitterPawn.Rotation);
    dotprod = EnemyDir Dot Forward;
    // End:0xD1
    if(dotprod < 0.4000000)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsTailOnTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float CurrentDistSqrd;

    CurrentDistSqrd = VSizeSq((GetTargetPosition()) - Outer.SpitterPawn.TargetPosition);
    // End:0x69
    if(CurrentDistSqrd <= float(300 * 300))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsTailAimCloseEnoughToFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x56
    if(VSizeSq(Outer.SpitterPawn.TargetPosition - (GetTargetPosition())) > float(500 * 500))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanTailSeeTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDist[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SpitOrigin, Target, Rot, iInfo;
    local /*0x97E50000-0x00000000*/ private float maxDistSqrd;
    local /*0x97E50000-0x00000000*/ private bool bCanSee;

    200.0000000
    maxDistSqrd = MaxDist * MaxDist;
    // End:0x91
    if(TargetPawn == EnemyForAttack)
    {
        // End:0x91
        if((Outer.WorldInfo.TimeSeconds - LastTailCanSee) < 0.5000000)
        {
            return bCachedTailCanSee;
        }
    }
    bCanSee = false;
    Outer.SpitterPawn.Mesh.GetSocketWorldLocationAndRotation('SpitPoint', SpitOrigin, Rot);
    Target = TargetPawn.GetProjectileTargetPosition(Outer.myAIPawn);
    // End:0x1A9
    if(!Outer.SpitterPawn.GetSpitCollisionVisual(SpitOrigin, Target, iInfo))
    {
        bCanSee = true;
    }
    // End:0x21E
    if(!bCanSee && VSizeSq(Target - TargetPawn.GetProjectileTargetPosition(Outer.myAIPawn)) < maxDistSqrd)
    {
        bCanSee = true;
    }
    // End:0x287
    if(TargetPawn == EnemyForAttack)
    {
        bCachedTailCanSee = bCanSee;
        LastTailCanSee = Outer.WorldInfo.TimeSeconds;
    }
    return bCanSee;
    //return ReturnValue;    
}

function SetupTargetLockTime()
{
    TargetLockTime = RandRange(Outer.SpitterPawn.TuneDataSpitter.MinLockOnTargetDuringSpitTime.GetValue(), Outer.SpitterPawn.TuneDataSpitter.MaxLockOnTargetDuringSpitTime.GetValue());
    LastSpitTime = Outer.WorldInfo.TimeSeconds;
    //return;    
}

function AimTail()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], TrackingSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPosition, RelativePos;
    local /*0x97E50000-0x00000000*/ private float Dist, DistCovered, Alpha;
    local /*0x97E50000-0x00000000*/ private @NULL InterpolatedPosition;

    // End:0xB5
    if(!IsTailAimCloseEnoughToFire() && !Outer.SpitterPawn.IsSpitting())
    {
        TrackingSpeed = Outer.SpitterPawn.TuneDataSpitter.TailTargetAcquireMoveSpeed.GetValue();        
    }
    else
    {
        // End:0x1DA
        if(Outer.SpitterPawn.IsSpitting() && (Outer.WorldInfo.TimeSeconds - LastSpitTime) > TargetLockTime)
        {
            TrackingSpeed = Outer.SpitterPawn.AimingErrorCorrectionSpeed * Outer.SpitterPawn.TuneDataSpitter.PostTargetLockTargetRateModifier.GetValue();            
        }
        else
        {
            TrackingSpeed = Outer.SpitterPawn.AimingErrorCorrectionSpeed;
        }
    }
    TargetPosition = GetTargetPosition();
    RelativePos = TargetPosition - Outer.SpitterPawn.TargetPosition;
    RelativePos.Z = 0.0000000;
    Dist = VSize2D(RelativePos);
    // End:0x32C
    if(Dist > float(0))
    {
        DistCovered = TrackingSpeed * DeltaTime;
        // End:0x30B
        if(DistCovered > Dist)
        {
            DistCovered = Dist;
        }
        Alpha = DistCovered / Dist;        
    }
    else
    {
        Alpha = 1.0000000;
    }
    InterpolatedPosition = VLerp(Outer.SpitterPawn.TargetPosition, TargetPosition, Alpha);
    Outer.SpitterPawn.SetSpitTargetPosition(InterpolatedPosition);
    //return;    
}

function UpdateRotation()
{
    //return;    
}

function OnSpitFinished()
{
    //return;    
}

function UpdateAiming()
{
    // End:0x6D
    if(Outer.SpitterPawn.bWantTailIK)
    {
        // End:0x6A
        if((EnemyToFireAt == none) || !CanAimAtEnemy(EnemyToFireAt))
        {
            StopAiming();
        }        
    }
    else
    {
        // End:0xD7
        if((EnemyToFireAt != none) && CanAimAtEnemy(EnemyToFireAt))
        {
            // End:0xD7
            if(!Outer.SpitterPawn.IsSpitting())
            {
                StartAiming();
            }
        }
    }
    //return;    
}

function GetTimeToWaitBeforeSwitchingEnemies()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.SpitterPawn.TuneDataSpitter.MinTimeBeforeSwitchingTargets.GetValue(), Outer.SpitterPawn.TuneDataSpitter.MaxTimeBeforeSwitchingTargets.GetValue());
    //return ReturnValue;    
}

function CheckTargetSwitch()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    NextEnemyCheckTimer -= DeltaTime;
    // End:0x67
    if(NextEnemyCheckTimer <= float(0))
    {
        // End:0x49
        if(LookForNewTarget())
        {
            NextEnemyCheckTimer = GetTimeToWaitBeforeSwitchingEnemies();            
        }
        else
        {
            NextEnemyCheckTimer = RandRange(0.5000000, 1.0000000);
        }
    }
    //return;    
}

function LookForNewTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NewEnemy;

    return false;
    // End:0xC9
    if(Outer.GetNumOtherEnemiesWithinRange(Outer.SpitterPawn.TuneDataSpitter.MaxDistToLookForSecondaryTargets.GetValue(), EnemyToFireAt, NewEnemy, IsValidEnemyToSpitAt) > 0)
    {
        SetEnemyToFireAt(LPPawn(NewEnemy));
        return true;        
    }
    else
    {
        // End:0xF5
        if(EnemyToFireAt != EnemyForAttack)
        {
            SetEnemyToFireAt(EnemyForAttack);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsValidEnemyToSpitAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float separation;

    // End:0x32
    if((AnEnemy == EnemyForAttack) || AnEnemy == EnemyToFireAt)
    {
        return false;
    }
    // End:0x61
    if(!Outer.IsEnemyVisible(AnEnemy))
    {
        return false;
    }
    separation = ActorSeperation2D(AnEnemy);
    // End:0xEC
    if(separation < Outer.SpitterPawn.TuneDataSpitter.MinDistanceForSpitAttack.GetValue())
    {
        return false;
    }
    // End:0x106
    if(!CanAimAtEnemy(AnEnemy))
    {
        return false;
    }
    // End:0x121
    if(!CanTailSeeTarget(AnEnemy))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetSpitIntervalTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.SpitterPawn.TuneDataSpitter.MinTimeBetweenSpitAttacks.GetValue(), Outer.SpitterPawn.TuneDataSpitter.MaxTimeBetweenSpitAttacks.GetValue());
    //return ReturnValue;    
}

function OnNewEnemy()
{
    super(LPAICmd_Attack).OnNewEnemy();
    SpitDelayTimer = 0.0000000;
    //return;    
}

function UpdateFiring()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0xDD
    if(Outer.SpitterPawn.IsSpitting())
    {
        SpitTimer -= DeltaTime;
        // End:0x88
        if(SpitTimer < float(0))
        {
            StopFiring();
            SpitDelayTimer = GetSpitIntervalTime();
            OnSpitFinished();            
        }
        else
        {
            // End:0xA5
            if(!bWantsToFire)
            {
                StopFiring();                
            }
            else
            {
                // End:0xDA
                if(!IsTailAimCloseEnoughToFire() || !CanTailSeeTarget(EnemyToFireAt))
                {
                    StopFiring();
                }
            }
        }        
    }
    else
    {
        // End:0x138
        if(bWantsToFire)
        {
            SpitDelayTimer -= DeltaTime;
            // End:0x138
            if(SpitDelayTimer < float(0))
            {
                // End:0x129
                if(CanFire())
                {
                    StartFiring();                    
                }
                else
                {
                    SpitDelayTimer = 0.2000000;
                }
            }
        }
    }
    //return;    
}

function GetSpitDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.SpitterPawn.TuneDataSpitter.Duration_SpitAttackPof_Min.GetValue(), Outer.SpitterPawn.TuneDataSpitter.Duration_SpitAttackPof_Max.GetValue());
    //return ReturnValue;    
}

function StartFiring()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    bShouldFire = true;
    Outer.SpitterPawn.StartSpitting(999.0000000);
    // End:0xD5
    if(SpitTimer < (Outer.SpitterPawn.TuneDataSpitter.Duration_SpitAttackPof_Min.GetValue() / float(2)))
    {
        SpitTimer = GetSpitDuration();
        SetupTargetLockTime();
    }
    NextEnemyCheckTimer = GetTimeToWaitBeforeSwitchingEnemies();
    SetInterruptible(false);
    Outer.SetWantsNewEnemy(true);
    return true;
    //return ReturnValue;    
}

function StopFiring()
{
    local /*0x97E50000-0x00000000*/ private bool bEndingCommand[9437185];

    false
    bShouldFire = false;
    Outer.SpitterPawn.StopSpitting(true);
    SetInterruptible(true, bEndingCommand);
    //return;    
}

function CanFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6B
    if(VSize2D(MyPawn.Location - EnemyForAttack.Location) > AttackSeperation_SpitAttack.Max)
    {
        return false;
    }
    // End:0xA4
    if(Outer.SpitterPawn.IsTailIKBlending())
    {
        return false;
    }
    // End:0xD3
    if(!Outer.IsEnemyVisible(EnemyToFireAt))
    {
        return false;
    }
    // End:0xED
    if(!CanAimAtEnemy(EnemyToFireAt))
    {
        return false;
    }
    // End:0xFE
    if(!IsTailAimCloseEnoughToFire())
    {
        return false;
    }
    // End:0x119
    if(!CanTailSeeTarget(EnemyToFireAt))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CheckForCloseCombat()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], possibleEnemy;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x11
    if(!IsInterruptible())
    {
        return none;
    }
    // End:0x54
    if(Outer.WorldInfo.TimeSeconds < NextCloseCombatCheck)
    {
        return none;
    }
    // End:0xC0
    if(!Outer.IsTailIntact())
    {
        NextCloseCombatCheck = Outer.WorldInfo.TimeSeconds + float(9999999);
        return none;
    }
    NextCloseCombatCheck = Outer.WorldInfo.TimeSeconds + 0.2500000;
    // End:0x13D
    if(Outer.SpitterPawn.IsSpitting())
    {
        return none;
    }
    // End:0x1C0
    if(Outer.ShouldCloseCombat(EnemyForAttack, Outer.myAIPawn.CylinderComponent.CollisionHeight * float(2)))
    {
        return EnemyForAttack;
    }
    I = 0;
    J0x1CB:

    // End:0x2A3 [Loop If]
    if(I < MyController.TargetList.Length)
    {
        possibleEnemy = LPPawn(MyController.TargetList[I].Actor);
        // End:0x295
        if((possibleEnemy != EnemyForAttack) && Outer.ShouldCloseCombat(possibleEnemy))
        {
            return possibleEnemy;
        }
        ++I;
        // [Loop Continue]
        goto J0x1CB;
    }
    return none;
    //return ReturnValue;    
}

function TickSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CloseCombatEnemy;

    UpdateRotation();
    UpdateAiming();
    // End:0xAA
    if(Outer.SpitterPawn.IsTailIKEnabled() && Outer.SpitterPawn.bWantTailIK)
    {
        AimTail(DeltaTime);
        UpdateFiring(DeltaTime);
    }
    // End:0xCA
    if(bWantsToFire)
    {
        CheckTargetSwitch(DeltaTime);
    }
    CloseCombatEnemy = CheckForCloseCombat();
    // End:0x125
    if(CloseCombatEnemy != none)
    {
        // End:0x117
        if(CloseCombatEnemy != EnemyForAttack)
        {
            SetDesiredEnemy(CloseCombatEnemy);
        }
        GotoState('CloseCombat');
    }
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Obj;

    TickSpitAttack(DeltaTime);
    // End:0x93
    if((EnemyForAttack == none) || !EnemyForAttack.IsAliveAndWell())
    {
        Obj = LPAIObjectiveAttackSpitter_MP(MySPAIObjective);
        // End:0x93
        if(Obj != none)
        {
            Obj.AttemptToFindNewEnemy();
        }
    }
    //return;    
}

function DoStationaryAttack()
{
    NextCloseCombatCheck = Outer.WorldInfo.TimeSeconds + float(3);
    Outer.GetFireAccess(EnemyForAttack);
    // End:0x9F
    if(Outer.HaveFireAccess())
    {
        GotoState('StationaryAttack');        
    }
    else
    {
        GotoState('WaitForAccess');
    }
    //return;    
}

function IsCurrentlyDoingCloseCombat()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function StartAiming()
{
    // End:0x8B
    if(!Outer.SpitterPawn.bWantTailIK)
    {
        Outer.SpitterPawn.TargetPosition = EnemyForAttack.Location;
    }
    Outer.SpitterPawn.SetAiming(true);
    //return;    
}

function StopAiming()
{
    Outer.SpitterPawn.SetAiming(false);
    //return;    
}

function IsEnemyTooClose()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state CloseCombat
{
    ignores TickSpitAttack;

    function IsCurrentlyDoingCloseCombat()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        //return;        
    }
Begin:

    Outer.Sleep(0.0100000);
    Outer.CmdCloseCombat(EnemyForAttack);
    NextCloseCombatCheck = Outer.WorldInfo.TimeSeconds + float(3);
    DoStationaryAttack();
    stop;                
}

state AttackManeuver
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        Outer.SetCSA(3);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        IsManeuvering = false;
        Outer.SetCSA();
        NextManeuverTime = Outer.WorldInfo.TimeSeconds + float(5);
        //return;        
    }

    function MoveTowardsEnemy()
    {
        local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
        local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
        local /*0x97E50000-0x00000000*/ private bool bZeroVelocityOnFinish[9437185], CheckForStrikeAccess;

        true
        false
        Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        Outer.EnableRotation(true);
        Outer.Focus = none;
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, FocusActor, AttackSeperationMin, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfManeuverForAttack);
        MoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
        MoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
        MoveToActorCmd.bZeroVelocityOnFinish = bZeroVelocityOnFinish;
        MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
        IsManeuvering = true;
        //return;        
    }

    function MoveToNewAttackPos()
    {
        local /*0x97E50000-0x00000000*/ private int Index;

        Outer.Focus = EnemyForAttack;
        Outer.EnableRotation(true);
        // End:0x83
        if(ValidManeuverPositionsCount > 1)
        {
            Index = int(RandRange(0.0000000, float(ValidManeuverPositionsCount - 1)));            
        }
        else
        {
            Index = 0;
        }
        MoveToPosition(ValidManeuverPositions[Index]);
        ValidManeuverPositionsCount = 0;
        //return;        
    }

    function MoveAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x15D
        if(IsManeuvering)
        {
            // End:0x15D
            if((Outer.WorldInfo.TimeSeconds - StateStartTime) > Outer.SpitterPawn.TuneDataSpitter.MinManueverTime.GetValue())
            {
                // End:0x15D
                if(VSize2D(MyPawn.Location - EnemyForAttack.Location) < AttackSeperation_SpitAttack.Max)
                {
                    // End:0x15D
                    if(Outer.IsEnemyVisible(EnemyForAttack) && CanTailSeeTarget(EnemyForAttack))
                    {
                        return true;
                    }
                }
            }
        }
        return super(LPAICmd_SpitterAttack).MoveAbortCondition();
        //return ReturnValue;        
    }

    function MoveToFirePositionAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return MoveAbortCondition();
        //return ReturnValue;        
    }

    function UpdateRotation()
    {
        // End:0x98
        if(Outer.Focus != none)
        {
            // End:0x95
            if(Outer.TimeSinceLastSeenEnemy(EnemyToFireAt) > float(4))
            {
                Outer.Focus = none;
                Outer.EnableRotation(true);
            }            
        }
        else
        {
            // End:0xEB
            if(Outer.IsEnemyVisible(EnemyToFireAt))
            {
                Outer.Focus = EnemyToFireAt;
            }
        }
        //return;        
    }
Begin:

    StateStartTime = Outer.WorldInfo.TimeSeconds;
    // End:0x59
    if(ValidManeuverPositionsCount > 0)
    {
        MoveToNewAttackPos();        
    }
    else
    {
        MoveTowardsEnemy(100.0000000, 100.0000000, none);
    }
    DoStationaryAttack();
    stop;        
}

state StationaryAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ReleaseFireAccess();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function GetEnemyTooFarDistance()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return AttackSeperation_SpitAttack.Max;
        //return ReturnValue;        
    }

    event DelegateDynamicAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function UpdateRotation()
    {
        local /*0x97E50000-0x00000000*/ private bool bCanAimAtEnemy;

        // End:0x141
        if(EnemyForAttack != none)
        {
            bCanAimAtEnemy = CanAimAtEnemy(EnemyForAttack);
            // End:0xA9
            if(bCanAimAtEnemy)
            {
                Outer.EnableRotation(false);
                // End:0xA6
                if(Outer.Focus == EnemyForAttack)
                {
                    Outer.Focus = none;
                }                
            }
            else
            {
                Outer.EnableRotation(true);
                // End:0x141
                if(Outer.Focus != EnemyForAttack)
                {
                    Outer.Focus = EnemyForAttack;
                    Outer.CmdTurnToFaceFocus(0);
                }
            }
        }
        //return;        
    }

    function ShouldMoveCloser()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return IsEnemyTooFar();
        //return ReturnValue;        
    }

    function ShouldManeuver()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x35
        if((Traversal != none) && Traversal.IsRunning())
        {
            return false;
        }
        // End:0x7F
        if(!Outer.IsEnemyVisible(EnemyForAttack) || !CanTailSeeTarget(EnemyForAttack))
        {
            return true;
        }
        // End:0x8E
        if(IsEnemyTooClose())
        {
            return true;
        }
        // End:0xD1
        if(Outer.WorldInfo.TimeSeconds >= NextManeuverTime)
        {
            return true;
        }
        // End:0x18B
        if((Outer.WorldInfo.TimeSeconds - StateStartTime) > float(2))
        {
            // End:0x18B
            if((Outer.WorldInfo.TimeSeconds - Outer.SpitterPawn.LastTimePawnDamagedBySpitAttack) > float(5))
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function OnSpitFinished()
    {
        // End:0x2A
        if(EnemyToFireAt != EnemyForAttack)
        {
            SetEnemyToFireAt(EnemyForAttack);
        }
        NextManeuverTime = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function TraversalFinished()
    {
        global.TraversalFinished();
        GotoState('AttackManeuver');
        //return;        
    }
Begin:

    Outer.PawnZeroVelocity();
    StartAiming();
    bWantsToFire = true;
    Outer.EnableRotation(false);
    StateStartTime = Outer.WorldInfo.TimeSeconds;
    Outer.CmdTurnToFaceFocus(0);
    J0xB6:

    // End:0x114 [Loop If]
    if(IsMyEnemyAlive())
    {
        // End:0xDD
        if(ShouldMoveCloser())
        {
            StartGetCloserToEnemyTraversal();            
        }
        else
        {
            // End:0xF4
            if(ShouldManeuver())
            {
                StartManueverTraversal();
            }
        }
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0xB6;
    }
    Outer.PopCommand(self);
    stop;                
}

state MPSpitter
{
    function TraversalFinished()
    {
        global.TraversalFinished();
        GotoState('AttackManeuver');
        //return;        
    }

    function DecideWhatToDo()
    {
        // End:0x1A
        if(IsEnemyTooFar())
        {
            StartGetCloserToEnemyTraversal();
            return;
        }
        DoStationaryAttack();
        //return;        
    }
Begin:

    Outer.Sleep(0.0100000);
    LastSpitTime = Outer.WorldInfo.TimeSeconds;
    DecideWhatToDo();
    stop;                
}

state SPTeenSpitter
{Begin:

    Outer.Sleep(0.0100000);
    GotoState('CloseCombat');
    stop;                    
}

state WaitForAccess
{Begin:

    Outer.Sleep(0.0010000);
    Outer.SetWantsNewEnemy(true);
    SetEnemyToFireAt(EnemyForAttack);
    J0x50:

    // End:0x110 [Loop If]
    if(1 == 1)
    {
        Outer.GetFireAccess(EnemyForAttack);
        // End:0xF0
        if(Outer.HaveFireAccess())
        {
            Outer.SetWantsNewEnemy(false);
            Outer.EnableRotation(true);
            GotoState('StationaryAttack');
        }
        Outer.Sleep(0.2000000);
        // [Loop Continue]
        goto J0x50;
    }
    stop;                
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
Begin:

    Outer.Sleep(0.0010000);
    SetEnemyToFireAt(EnemyForAttack);
    Outer.GetFireAccess(EnemyForAttack);
    // End:0xA8
    if(Outer.HaveFireAccess())
    {
        Outer.EnableRotation(true);
        GotoDefaultAttackState();        
    }
    else
    {
        GotoState('WaitForAccess');
    }
    stop;        
}
