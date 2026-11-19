class LPAICmd_SpitterChargeAttack extends LPAICmd_Attack within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CmdStatus_ChargeAttackUsing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnsChargedAndHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedShakeOff;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurStrikeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDodgeWindownHasBeenOpenedAndClosed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPassiveBlockedShouldDoKnockDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PositionLastUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastRunInUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleToSideStepACosAngRange[536870913];

function GetDodgeWindowType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 24;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    PawnsChargedAndHit.MaxLifeTimeOfItemInList = Outer.SpitterPawn.TuneDataSpitter.DelayBetweenNewChargeHitsAllowed.GetValue();
    PawnsChargedAndHit.MaxLifeTimeOfVsInList = Outer.SpitterPawn.TuneDataSpitter.DelayBetweenNewChargeHitsAgainstVsAllowed.GetValue();
    PawnsChargedAndHit.MaxLifeTimeOfShutdownVsInList = Outer.SpitterPawn.TuneDataSpitter.DelayBetweenNewChargeHitsAgainstShutdownVsAllowed.GetValue();
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(Outer.SpitterPawn.TuneDataSpitter.AngleToSideStepVsDuringCharge.GetValue(), AngleToSideStepACosAngRange);
    Class'LPAIUtils'.static.EmptyHitList(PawnsChargedAndHit);
    TimeStartedShakeOff = 0.0000000;
    CurMoveToActorCmd = none;
    CurStrikeCmd = none;
    bDodgeWindownHasBeenOpenedAndClosed = false;
    TimeOfLastRunInUpdate = 0.0000000;
    Outer.SetWantsNewEnemy(false);
    //return;    
}

function Popped()
{
    Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
    Class'LPAIUtils'.static.EmptyHitList(PawnsChargedAndHit);
    StopProcessRunInUpdateTimer();
    // End:0x157
    if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen())
    {
        Outer.SpitterPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 1, EnemyForAttack);
        CmdStatus_ChargeAttackUsing.CloseDodgeWindow();
    }
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    // End:0x18
    if(IsProcessRunInUpdateTimerActive())
    {
        PauseProcessRunInUpdateTimer(true);
    }
    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    CmdStatus = ReturnStatus;
    CmdStatus_ChargeAttackUsing = LPAICmdStatus_ChargeAttack(ReturnStatus);
    CmdStatus_ChargeAttackUsing.StartingChargeAttack(EnemyForAttack);
    CmdStatus_ChargeAttackUsing.CloseDodgeWindow();
    CmdStatus_ChargeAttackUsing.SetToFinishedGettingKnockedBackAfterHittingUnmovableObject();
    CmdStatus_ChargeAttackUsing.SetToHavingFinishedRecoveringAfterFailedStrikedFinsihed();
    //return;    
}

event DelegateMovingToChargePointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest, kActorObs;

    // End:0x10C
    if(Pawn(Obstacle) != none)
    {
        bAvoid = true;
        PawnToTest = Pawn(Obstacle);
        // End:0x66
        if(PawnToTest == EnemyForAttack)
        {
            bAvoid = false;            
        }
        else
        {
            // End:0xB3
            if(Outer.IsThisActorTheVsAndInGivenAvoidanceZone(PawnToTest, AngleToSideStepACosAngRange, EnemyForAttack))
            {
                bAvoid = true;                
            }
            else
            {
                // End:0xDA
                if(LPBaseVSPlayerPawn(Obstacle) != none)
                {
                    bAvoid = false;                    
                }
                else
                {
                    // End:0xFE
                    if(LPPlayerPawn(Obstacle) != none)
                    {
                        bAvoid = false;
                    }
                }
            }
        }
        return bAvoid;        
    }
    else
    {
        bAvoid = true;
        kActorObs = LPKActor(Obstacle);
        // End:0x1D8
        if(kActorObs != none)
        {
            // End:0x1D8
            if(CylinderComponent(kActorObs.CollisionComponent).CollisionHeight < Outer.SpitterPawn.CylinderComponent.CollisionHeight)
            {
                bAvoid = false;
            }
        }
        return bAvoid;
    }
    return false;
    //return ReturnValue;    
}

function RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitPush, runIntoPawn;
    local /*0x97E50000-0x00000000*/ private float DamageAmount;

    // End:0x33E
    if(Other != none)
    {
        runIntoPawn = LPPawn(Other);
        // End:0x33E
        if(runIntoPawn != none)
        {
            // End:0x33C
            if((runIntoPawn.SpecialMoveState.CurSMInstance == none) || (runIntoPawn.SpecialMoveState.CurSMInstance != none) && !ClassIsChildOf(runIntoPawn.SpecialMoveState.CurSMInstance.Class, Class'SPEngine.SPSM_DirectionalHitReaction'))
            {
                // End:0x339
                if(Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, PawnsChargedAndHit, Outer.WorldInfo.TimeSeconds, true))
                {
                    Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, Outer.PawnsRunIntoWhileMoveing, Outer.WorldInfo.TimeSeconds, true);
                    hitPush = GetHitPushDuringCharge(runIntoPawn);
                    Outer.AdjustHitPushForUnoccupiedVs(runIntoPawn, hitPush);
                    DamageAmount = Outer.GetChargeBrushDamageForThisTarget(runIntoPawn);
                    // End:0x337
                    if(DamageAmount > float(0))
                    {
                        runIntoPawn.TakeDamage(int(DamageAmount), Outer, Outer.SpitterPawn.Location, hitPush, Outer.SpitterPawn.DamageTypeChargeBrush,, Outer.SpitterPawn);
                    }
                    return true;
                }                
            }
            else
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetHitPushDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue, hitPush;

    hitPush = HitActor.Location - Outer.SpitterPawn.Location;
    hitPush = Normal(hitPush);
    return hitPush;
    //return ReturnValue;    
}

function StartChargingStrikeCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToStrike[8388609], strikeTargetPoint;

    CmdStatus_ChargeAttackUsing.StartingChargeStrike(PawnToStrike, strikeTargetPoint);
    //return;    
}

function GetDistanceBeyondTargetForChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 500.0000000;
    //return ReturnValue;    
}

function GetDurationOfChargingShakeOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function @NULL IsStrikeTargetPointAtCorrectHeight()
{
    local /*0x97E50000-0x00000000*/ private @NULL strikeTargetPoint[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle, Adjusted;
    local /*0x97E50000-0x00000000*/ private float HeightDiff;

    BotHandle = SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle);
    // End:0x112
    if(BotHandle != none)
    {
        // End:0x112
        if(BotHandle.GetFloorAdjustedPos(strikeTargetPoint, Adjusted))
        {
            HeightDiff = Abs(strikeTargetPoint.Z - Adjusted.Z);
            // End:0x112
            if(HeightDiff <= Outer.myAIPawn.MaxStepHeight)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsStrikeTargetPointValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL strikeTargetPoint[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(!Outer.LineOfSightTo(EnemyForAttack, strikeTargetPoint, false))
    {
        return false;
    }
    // End:0x4C
    if(!IsStrikeTargetPointAtCorrectHeight(strikeTargetPoint))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetStrikeTargetPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], strikeTargetPoint, DirToTarget, Displacement;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget, distanceBeyond;

    DirToTarget = EnemyForAttack.Location - Outer.SpitterPawn.Location;
    DirToTarget.Z = 0.0000000;
    DistanceToTarget = VSize(DirToTarget);
    distanceBeyond = GetDistanceBeyondTargetForChargingStrike();
    DirToTarget = Normal(DirToTarget);
    Displacement = DirToTarget * distanceBeyond;
    strikeTargetPoint = EnemyForAttack.Location;
    strikeTargetPoint.Z = Outer.SpitterPawn.Location.Z;
    strikeTargetPoint = strikeTargetPoint + Displacement;
    J0x184:

    // End:0x25E [Loop If]
    if(!IsStrikeTargetPointValid(strikeTargetPoint))
    {
        distanceBeyond -= Outer.MyKynapseRadius;
        // End:0x20A
        if(distanceBeyond < DistanceToTarget)
        {
            strikeTargetPoint = EnemyForAttack.Location;
            // [Explicit Break]
            goto J0x25E;            
        }
        else
        {
            Displacement = DirToTarget * distanceBeyond;
            strikeTargetPoint = EnemyForAttack.Location + Displacement;
        }
        // [Loop Continue]
        goto J0x184;
    }
    J0x25E:

    return strikeTargetPoint;
    //return ReturnValue;    
}

function StartChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL strikeTargetPoint;

    // End:0x9B
    if(!Outer.IsOffNavMesh(Outer.SpitterPawn.Location, EnemyForAttack, MyEnemyRadius))
    {
        strikeTargetPoint = GetStrikeTargetPoint();
        StartChargingStrikeCmd(EnemyForAttack, strikeTargetPoint);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function MoveCharingStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function MoveToEnemyForChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation, minDistaceToStartStrike;

    minDistaceToStartStrike = Outer.GetMinDistanceAwayToStartChargingStrike(EnemyForAttack);
    // End:0x3CF
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation();
        // End:0x3CF
        if(Seperation > minDistaceToStartStrike)
        {
            CurMoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, EnemyForAttack, minDistaceToStartStrike, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeRunIn,, false);
            CurMoveToActorCmd.SetMovementZDiffAllowanceFactor(Outer.SpitterPawn.TuneDataSpitter.DefaultMovementZDiffAllowanceFactor.GetValue());
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            CurMoveToActorCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
            CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveCharingStrikeAbortCondition;
            CurMoveToActorCmd.bZeroVelocityOnFinish = false;
            CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.SpitterPawn.TuneDataSpitter.DurationBetweenMovementDeltaDuringChargeRunIn.GetValue(), Outer.SpitterPawn.TuneDataSpitter.MinMovementDeltaDuringChargeRunIn.GetValue(), Outer.SpitterPawn.TuneDataSpitter.DelayAfterStartOfChargeRunIneforeMonitorStarts.GetValue(), NotifyOfFailedMovementToChargePoint);
            StartOfRunInSetUp();
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyOfFailedMovementToChargePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    Outer.PopCommand(self);
    return true;
    //return ReturnValue;    
}

final function StartProcessRunInUpdateTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessRunInUpdateTimerActive())
    {
        Outer.SetTimer(0.0100000, true, 'ProcessRunInUpdateTimer', self);
    }
    //return;    
}

function StopProcessRunInUpdateTimer()
{
    // End:0x8A
    if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen())
    {
        Outer.SpitterPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 1, EnemyForAttack);
        CmdStatus_ChargeAttackUsing.CloseDodgeWindow();
    }
    Outer.ClearTimer('ProcessRunInUpdateTimer', self);
    //return;    
}

function PauseProcessRunInUpdateTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessRunInUpdateTimer();        
    }
    else
    {
        StartProcessRunInUpdateTimer();
    }
    //return;    
}

final function IsProcessRunInUpdateTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessRunInUpdateTimer', self);
    //return ReturnValue;    
}

private final function ProcessRunInUpdateTimer()
{
    ProcessDodgeWindow();
    //return;    
}

function ProcessDodgeWindow()
{
    //return;    
}

function StartOfRunInSetUp()
{
    StartProcessRunInUpdateTimer();
    //return;    
}

function BeforeEnterStrikeCleanUp()
{
    StopProcessRunInUpdateTimer();
    //return;    
}

function EndOfChargeAttack()
{
    Outer.Focus = EnemyForAttack;
    Outer.CmdTurnToFaceFocus(1);
    //return;    
}

state StateCmdActive
{
    ignores PrepareForChargingStrike;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        CurStrikeCmd = none;
        Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x64
        if(CurStrikeCmd == none)
        {
            // End:0x61
            if(!RanIntoActor(Other))
            {
                Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
            }            
        }
        else
        {
            CurStrikeCmd.Touch(Other, OtherComp, HitLocation, HitNormal);
        }
        //return;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        // End:0x64
        if(CurStrikeCmd == none)
        {
            // End:0x61
            if(!RanIntoActor(Other))
            {
                Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
            }            
        }
        else
        {
            CurStrikeCmd.Bump(Other, OtherComp, HitNormal);
        }
        //return;        
    }

    function OverrideDamageReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x57
        if(DM.bIsVSMeleeDamage)
        {
            DM.SetAIReactionDelegate(None);
            return true;            
        }
        else
        {
            // End:0x132
            if(ClassIsChildOf(MyPawn.TakeDamageParams.DamageType, Class'LPDamageTypeFragGrenade'))
            {
                Outer.CmdStatus_ChargeAttack.SetChargeInteruptedBecauseOfExplosion();
                Outer.PopCommand(self.ChildCommand);
                DM.SetAIReactionDelegate(None);
                return true;
            }
        }
        return super(LPAICommand).OverrideDamageReaction(DM);
        //return ReturnValue;        
    }

    function MoveToEnemyForUberClawStrike()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation, minDistaceToStartStrike;

        minDistaceToStartStrike = Outer.SpitterPawn.TuneDataSpitter.DesiredSeperationWhenChargeIsNotPossible.GetValue();
        // End:0x403
        if(IsMyEnemyAlive())
        {
            Seperation = EnemySeperation2D();
            // End:0x403
            if(Seperation > minDistaceToStartStrike)
            {
                CurMoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, EnemyForAttack, minDistaceToStartStrike, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfSaftyChargeRunIn,, false);
                CurMoveToActorCmd.SetMovementZDiffAllowanceFactor(Outer.SpitterPawn.TuneDataSpitter.DefaultMovementZDiffAllowanceFactor.GetValue());
                CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                CurMoveToActorCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
                CurMoveToActorCmd.bZeroVelocityOnFinish = false;
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.SpitterPawn.TuneDataSpitter.DurationBetweenMovementDeltaDuringChargeRunIn.GetValue(), Outer.SpitterPawn.TuneDataSpitter.MinMovementDeltaDuringChargeRunIn.GetValue(), Outer.SpitterPawn.TuneDataSpitter.DelayAfterStartOfChargeRunIneforeMonitorStarts.GetValue(), NotifyOfFailedMovementToChargePoint);
                StartOfRunInSetUp();
            }
        }
        //return;        
    }

    function FaceEnemyForChargingStrike()
    {
        // End:0xD6
        if(Outer.IsTurnToFaceTargetCommandNeeded(EnemyForAttack, Outer.SpitterPawn.TuneDataSpitter.MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack.GetValue()))
        {
            Outer.Focus = EnemyForAttack;
            Outer.CmdTurnToFaceFocus(1,, 1);
        }
        //return;        
    }

    function IsPreparedForChargingStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.ChargingMaxSpeedScale.GetValue());
    CmdStatus_ChargeAttackUsing.StartingChargeRunIn(EnemyForAttack);
    FaceEnemyForChargingStrike();
    Outer.Sleep(0.0000000);
    PrepareForChargingStrike();
    J0xEB:

    // End:0x11A [Loop If]
    if(!IsPreparedForChargingStrike())
    {
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0xEB;
    }
    MoveToEnemyForChargingStrike();
    BeforeEnterStrikeCleanUp();
    // End:0x2FC
    if(StartChargingStrike())
    {
        CurStrikeCmd = none;
        Outer.Focus = none;
        Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
        // End:0x23A
        if(CmdStatus_ChargeAttackUsing.WasTheChargeInteruptedBecauseOfExplosion())
        {
            PushState('PostChargingTripAndStunned');            
        }
        else
        {
            // End:0x273
            if(CmdStatus_ChargeAttackUsing.WasNothingHitDuringCharge())
            {
                PushState('PostChargingTripAndStunned');                
            }
            else
            {
                // End:0x2AC
                if(CmdStatus_ChargeAttackUsing.WasActiveDefenseStruck())
                {
                    PushState('PostChargingKnockBackedAndStunned');                    
                }
                else
                {
                    // End:0x2E5
                    if(CmdStatus_ChargeAttackUsing.WasBlockingObjectStruck())
                    {
                        PushState('PostChargingPassiveBlocked');                        
                    }
                    else
                    {
                        PushState('PostChargingShakeOff');
                    }
                }
            }
        }        
    }
    else
    {
        CmdStatus_ChargeAttackUsing.StartingUberClawStrike();
        MoveToEnemyForUberClawStrike();
    }
    EndOfChargeAttack();
    Outer.Sleep(0.0000000);
    Outer.PopCommand(self);
    stop;                
}

state PostChargingTripAndStunned
{
    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x85
        if(Other.IsA('LPPlayerPawn'))
        {
            // End:0x82
            if(Outer.SpitterPawn.TuneDataSpitter.bChargeHitsOnTouchAgainstPof)
            {
                FellIntoActor(Other);
            }            
        }
        else
        {
            // End:0x10A
            if(Other.IsA('LPBaseVSPlayerPawn'))
            {
                // End:0x107
                if(Outer.SpitterPawn.TuneDataSpitter.bChargeHitsOnTouchAgainstVs)
                {
                    FellIntoActor(Other);
                }                
            }
            else
            {
                FellIntoActor(Other);
            }
        }
        //return;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        FellIntoActor(Other);
        //return;        
    }

    function FellIntoActor()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], hitPush, runIntoPawn;
        local /*0x97E50000-0x00000000*/ private float twoDSpeed;
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo, HitLoc, HitNorm, StartTrace, EndTrace;


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        // End:0x435
        /*@Error*/
        runIntoPawn = LPPawn(Other);
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x435
        /*@Error*/
        twoDSpeed = VSize2D(Outer.SpitterPawn.Velocity);
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x435
        /*@Error*/
        hitPush = runIntoPawn.Location - Outer.SpitterPawn.Location;
        hitPush = Normal(hitPush);
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x435
        /*@Error*/
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x435
        /*@Error*/
        Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, Outer.PawnsRunIntoWhileMoveing, Outer.WorldInfo.TimeSeconds, true);
        StartTrace = Outer.myAIPawn.Location;
        EndTrace = Other.Location;
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // BadToken (0x5C)
        /*@Error*/;
    }

    function OnLPSM_SpitterFailedChargeStunEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        CmdStatus_ChargeAttackUsing.SetToHavingStartedRecoveringAfterFailedStrikedFinsihed();
        //return;        
    }

    function DoFailSpecialMove()
    {
        Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterFailedChargeTrip', true, false, OnLPSM_SpitterFailedChargeStunEnd);
        //return;        
    }
Begin:

    Outer.Focus = none;
    CmdStatus_ChargeAttackUsing.SetToHavingFinishedRecoveringAfterFailedStrikedFinsihed();
    Outer.CmdSpitterDefaultStun(EnemyForAttack, Outer.SpitterPawn.TuneDataSpitter.DurationOfFailedChargeStun.GetValue(), Class'LPSM_SpitterFailedChargeStun', Class'LPSM_SpitterFailedChargeStunIn', Class'LPSM_SpitterFailedChargeStunOut');
    Outer.Focus = EnemyForAttack;
    PopState();
    stop;                
}

state PostChargingBlocked
{
    ignores Touch, Bump, KnockBack, PostKnockBack;

    function OnLPSM_SpitterChargeAgainstVsBlockedEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        CmdStatus_ChargeAttackUsing.SetToFinishedGettingKnockedBackAfterHittingUnmovableObject();
        //return;        
    }

    function StillGettingKnockedBack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x24
        if(CmdStatus_ChargeAttackUsing.IsGettingKnockedBackAfterHittingUnmovableObject())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    KnockBack();
    J0x2A:

    // End:0x57 [Loop If]
    if(StillGettingKnockedBack())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x2A;
    }
    CmdStatus_ChargeAttackUsing.SetToHavingStartedRecoveringAfterFailedStrikedFinsihed();
    PostKnockBack();
    CmdStatus_ChargeAttackUsing.SetToHavingFinishedRecoveringAfterFailedStrikedFinsihed();
    Outer.Sleep(0.0100000);
    Outer.Focus = EnemyForAttack;
    PopState();
    stop;                    
}

state PostChargingKnockBackedAndStunned extends PostChargingBlocked
{
    function KnockBack()
    {
        CmdStatus_ChargeAttackUsing.SetToStartedGettingKnockedBackAfterHittingUnmovableObject();
        Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargeAgainstVsBlocked', true, false, OnLPSM_SpitterChargeAgainstVsBlockedEnd);
        //return;        
    }

    function PostKnockBack()
    {
        Outer.CmdSpitterDefaultStun(EnemyForAttack, Outer.SpitterPawn.TuneDataSpitter.DurationOfBlockedChargeStun.GetValue(), Class'LPSM_SpitterFailedVsChargeStun', none, Class'LPSM_SpitterStunFinish');
        //return;        
    }
    stop;    
}

state PostChargingPassiveBlocked extends PostChargingBlocked
{
    function KnockBack()
    {
        bPassiveBlockedShouldDoKnockDown = Rand(2) == 0;
        // End:0x8F
        if(bPassiveBlockedShouldDoKnockDown)
        {
            CmdStatus_ChargeAttackUsing.SetToStartedGettingKnockedBackAfterHittingUnmovableObject();
            Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargeAgainstVsBlocked', true, false, OnLPSM_SpitterChargeAgainstVsBlockedEnd);
        }
        //return;        
    }

    function PostKnockBack()
    {
        local /*0x97E50000-0x00000000*/ private class RecoveryMove;

        RecoveryMove = ((bPassiveBlockedShouldDoKnockDown) ? Class'LPSM_SpitterStunFinish' : Class'LPSM_SpitterFailedVsChargeNoStun');
        Outer.CmdSpitterDefaultStun(EnemyForAttack, 0.0000000, none, none, RecoveryMove);
        //return;        
    }
    stop;    
}

state PostChargingShakeOff
{
    ignores Touch, Bump, TransitionOutOfCharge;

    function StillShakingOff()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4F
        if((Outer.WorldInfo.TimeSeconds - TimeStartedShakeOff) > (GetDurationOfChargingShakeOff()))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function FinishedTransitioningOutOfCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    TransitionOutOfCharge();
    J0x2A:

    // End:0x59 [Loop If]
    if(!FinishedTransitioningOutOfCharge())
    {
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x2A;
    }
    TimeStartedShakeOff = Outer.WorldInfo.TimeSeconds;
    Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargingShakeOff', true, false);
    J0xD7:

    // End:0x104 [Loop If]
    if(StillShakingOff())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xD7;
    }
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterChargingShakeOff');
    PopState();
    stop;                
}

defaultproperties
{
    PawnsChargedAndHit=(PawnsHit=none,MaxLifeTimeOfItemInList=-1.0000000,MaxLifeTimeOfVsInList=-1.0000000,MaxLifeTimeOfShutdownVsInList=-1.0000000)
    bInterruptible=false
}