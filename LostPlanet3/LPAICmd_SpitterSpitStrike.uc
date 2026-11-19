class LPAICmd_SpitterSpitStrike extends LPAICmd_SpitterStrike within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PreAbortState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHoldFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpitStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFakeStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialTargetSet;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassSpitStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassSpitHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassSpitFinish;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ErrorInAiming_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ErrorInAiming_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimingErrorCorrectionSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceFromSpitToSlowAutoCorrection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoCorrectionSlowDownFactorForRoll[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoCorrectionSlowDownFactorForSprint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoCorrectionSlowDownFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToEndSlowAutoCorrection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SlowAutoCorrectionDuration[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDeltaTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurSpitTarget;

function Pushed()
{
    super.Pushed();
    ErrorInAiming_Min = Outer.SpitterPawn.ErrorInAiming_Min;
    ErrorInAiming_Max = Outer.SpitterPawn.ErrorInAiming_Max;
    AimingErrorCorrectionSpeed = Outer.SpitterPawn.AimingErrorCorrectionSpeed;
    Outer.SpitterPawn.ResetDamageTracker();
    Seperation_ToBreakOutOfHunkerDown = Outer.SpitterPawn.Seperation_ToBreakOutOfHunkerDown_DuringSpit;
    AngularSeperation_ToBreakOutOfHunkerDown = Outer.SpitterPawn.AngularSeperation_ToBreakOutOfHunkerDown_DuringSpit;
    bSpinOnTheSpotDuringHunkerDown = Outer.SpitterPawn.TuneDataSpitter.bAllowToSpinOnTheSpotWithoutAnimationDuringHunkerDownBeforeSpit;
    Outer.SpitterPawn.bAllowChoreography = true;
    DistanceFromSpitToSlowAutoCorrection = Outer.SpitterPawn.TuneDataSpitter.DistanceFromSpitToSlowAutoCorrection.GetValue();
    // End:0x281
    if(DistanceFromSpitToSlowAutoCorrection <= float(0))
    {
        DistanceFromSpitToSlowAutoCorrection = 1.0000000;
    }
    AutoCorrectionSlowDownFactorForRoll = Outer.SpitterPawn.TuneDataSpitter.AutoCorrectionSlowDownPercentageOfOriginalSpeed.GetValue() / float(100);
    // End:0x322
    if((AutoCorrectionSlowDownFactorForRoll <= float(0)) || AutoCorrectionSlowDownFactorForRoll > float(1))
    {
        AutoCorrectionSlowDownFactorForRoll = 1.0000000;
    }
    TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds = Outer.SpitterPawn.TuneDataSpitter.TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds.GetValue();
    // End:0x3AA
    if(TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds < float(0))
    {
        TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds = 0.0000000;
    }
    AutoCorrectionSlowDownFactorForSprint = Outer.SpitterPawn.TuneDataSpitter.AutoCorrectionSlowDownPercentageOfOriginalSpeed_DueToSprint.GetValue() / float(100);
    // End:0x44B
    if((AutoCorrectionSlowDownFactorForSprint <= float(0)) || AutoCorrectionSlowDownFactorForSprint > float(1))
    {
        AutoCorrectionSlowDownFactorForSprint = 1.0000000;
    }
    TimeToEndSlowAutoCorrection = float(-2147483647);
    AutoCorrectionSlowDownFactor = 1.0000000;
    SlowAutoCorrectionDuration = 0.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    OnExitSpitterSpitStrike();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExitSpitterSpitStrike();
    //return;    
}

function OnExitSpitterSpitStrike()
{
    Outer.ClearTimer('FinishHold', self);
    Outer.SpitterPawn.ServerEndSpecialMove(LPSMClassSpitStart);
    Outer.SpitterPawn.ServerEndSpecialMove(LPSMClassSpitHold);
    Outer.SpitterPawn.ServerEndSpecialMove(LPSMClassSpitFinish);
    Outer.StopSpit();
    Outer.TimeSpitStrikeEnd = CurTime();
    Outer.SpitterPawn.DisableTailIKImmediate();
    Outer.SpitterPawn.AccumulatedCoreDamageDuringPhase = 0.0000000;
    //return;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x26
    if(IsMyEnemyAlive())
    {
        GotoState(StateName, 'Begin');        
    }
    else
    {
        GotoState('Abort', 'Begin');
    }
    //return;    
}

function PushStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x24
    if(IsMyEnemyAlive())
    {
        PushState(StateName);        
    }
    else
    {
        GotoState('Abort', 'Begin');
    }
    //return;    
}

function On_LPSM_SpitStart_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bStartFinished = true;
    //return;    
}

function StartSpitStart()
{
    Outer.SpitterPawn.DoSpecialMove(LPSMClassSpitStart, true, false, On_LPSM_SpitStart_Finished, EnemyForStrike);
    //return;    
}

function On_LPSM_SpitHold_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bHoldFinished = true;
    Outer.StopSpit();
    //return;    
}

function StartSpitHold()
{
    Outer.SpitterPawn.DoSpecialMove(LPSMClassSpitHold, true, false, On_LPSM_SpitHold_Finished, EnemyForStrike);
    Outer.SpitterPawn.StartSpitting();
    //return;    
}

function On_LPSM_SpitFinish_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.bMeleeFinished = true;
    //return;    
}

function StartSpitFinish()
{
    Outer.SpitterPawn.DoSpecialMove(LPSMClassSpitFinish, true, false, On_LPSM_SpitFinish_Finished, EnemyForStrike);
    //return;    
}

function FinishHold()
{
    bHoldFinished = true;
    Outer.SpitterPawn.ServerEndSpecialMove(LPSMClassSpitHold);
    Outer.StopSpit();
    //return;    
}

function GetTargetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EnemyForStrike.Location;
    //return ReturnValue;    
}

function AdjustmentToAimError()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnemyForStrike.CylinderComponent.CollisionRadius;
    //return ReturnValue;    
}

function NotifySpitStarted()
{
    SetInitialSpitTarget();
    //return;    
}

function SetInitialSpitTargetAtIkStart()
{
    SetInitialSpitTarget();
    bInitialTargetSet = false;
    //return;    
}

function SetInitialSpitTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL RelativePosition;
    local /*0x97E50000-0x00000000*/ private float AimError, Dist;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPosition, Direction, TargetPos, PerpendicularDirection;

    // End:0x276
    if(!bInitialTargetSet)
    {
        TargetPosition = GetTargetPosition();
        RelativePosition = TargetPosition - Outer.SpitterPawn.Location;
        RelativePosition.Z = 0.0000000;
        Dist = VSize(RelativePosition);
        Direction = Normal(RelativePosition);
        PerpendicularDirection.X = -Direction.Y;
        PerpendicularDirection.Y = Direction.X;
        PerpendicularDirection.Z = 0.0000000;
        AimError = RandRange(ErrorInAiming_Min, ErrorInAiming_Max);
        // End:0x1A4
        if(AimError > Dist)
        {
            AimError = Dist * 0.7500000;
        }
        Direction = -Normal(RelativePosition);
        PerpendicularDirection = -PerpendicularDirection;
        TargetPos = ((Direction * AimError) + (PerpendicularDirection * RandRange(100.0000000, 200.0000000))) + TargetPosition;
        CurSpitTarget = TargetPos;
        Outer.SpitterPawn.TargetPosition = CurSpitTarget;
        bInitialTargetSet = true;
    }
    //return;    
}

function IsEnemyRolling()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

    curTargetDodge = LPSM_PlayerRollBase(EnemyForStrike.SpecialMoveState.CurSMInstance);
    return curTargetDodge != none;
    //return ReturnValue;    
}

function IsEnemySprinting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlyrCtrl;

    PlyrCtrl = LPPlayerController(EnemyForStrike.Controller);
    // End:0x60
    if(PlyrCtrl != none)
    {
        return PlyrCtrl.IsSprinting();
    }
    return false;
    //return ReturnValue;    
}

function TargetSpit()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], TrackingSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPosition, RelativePos;
    local /*0x97E50000-0x00000000*/ private float Dist, DistCovered, Alpha, BlendedSlowDownFactor;

    TrackingSpeed = AimingErrorCorrectionSpeed;
    TargetPosition = GetTargetPosition();
    RelativePos = TargetPosition - CurSpitTarget;
    Dist = VSize2D(RelativePos);
    RelativePos.Z = 0.0000000;
    // End:0x177
    if(Outer.SpitterPawn.TuneDataSpitter.bAllowPlayerRollToSlowAutoCorrection)
    {
        // End:0x177
        if(Dist <= DistanceFromSpitToSlowAutoCorrection)
        {
            // End:0x177
            if(IsEnemyRolling())
            {
                SlowAutoCorrectionDuration = TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds;
                AutoCorrectionSlowDownFactor = AutoCorrectionSlowDownFactorForRoll;
                TimeToEndSlowAutoCorrection = Outer.SpitterPawn.WorldInfo.TimeSeconds + SlowAutoCorrectionDuration;
            }
        }
    }
    // End:0x2BF
    if(Outer.SpitterPawn.TuneDataSpitter.bAllowPlayerSprintToSlowAutoCorrection)
    {
        // End:0x2BF
        if(Dist <= DistanceFromSpitToSlowAutoCorrection)
        {
            // End:0x2BF
            if(IsEnemySprinting())
            {
                SlowAutoCorrectionDuration = Outer.SpitterPawn.TuneDataSpitter.TimeToContinueSlowAutoCorrectionAfterPlayerSprintEnds.GetValue();
                AutoCorrectionSlowDownFactor = AutoCorrectionSlowDownFactorForSprint;
                TimeToEndSlowAutoCorrection = Outer.SpitterPawn.WorldInfo.TimeSeconds + SlowAutoCorrectionDuration;
            }
        }
    }
    // End:0x413
    if((TimeToEndSlowAutoCorrection > Outer.SpitterPawn.WorldInfo.TimeSeconds) && Dist <= DistanceFromSpitToSlowAutoCorrection)
    {
        // End:0x3E3
        if(SlowAutoCorrectionDuration > 0.0000000)
        {
            Alpha = 1.0000000 - ((TimeToEndSlowAutoCorrection - Outer.SpitterPawn.WorldInfo.TimeSeconds) / SlowAutoCorrectionDuration);
            BlendedSlowDownFactor = FInterpEaseIn(AutoCorrectionSlowDownFactor, 1.0000000, Alpha, 2.0000000);            
        }
        else
        {
            BlendedSlowDownFactor = 1.0000000;
        }
        TrackingSpeed = TrackingSpeed * BlendedSlowDownFactor;        
    }
    else
    {
        // End:0x498
        if(Dist > float(100))
        {
            RelativePos += (EnemyForStrike.Velocity * DeltaTime);
            Dist = VSize2D(RelativePos);
            RelativePos.Z = 0.0000000;
        }
    }
    // End:0x512
    if(Dist > float(0))
    {
        DistCovered = TrackingSpeed * DeltaTime;
        // End:0x4F1
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
    CurSpitTarget = VLerp(CurSpitTarget, TargetPosition, Alpha);
    Outer.SpitterPawn.SetSpitTargetPosition(CurSpitTarget);
    //return;    
}

function MoveClose()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ManeuverForAttack(Seperation_ToBreakOutOfHunkerDown, Seperation_ToBreakOutOfHunkerDown, EnemyForStrike);
    //return ReturnValue;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    super.DrawDebug(InHUD);
    //return;    
}

state StateCmdActive
{
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

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.Focus = none;
    // End:0xBD
    if(Outer.CanBeMyEnemy(EnemyForStrike))
    {
        PushStateWithEnemyCheck('AttackTransition');
        // End:0x94
        if(bReactive || WaitTimeBeforeAttack <= float(0))
        {
            GotoStateWithEnemyCheck('SpitStart');            
        }
        else
        {
            PushStateWithEnemyCheck('DesignerSpecifiedWaiting');
        }
        GotoStateWithEnemyCheck('SpitStart');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;            
}

state SpitStart
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        SetInterruptible(true);
        bStartFinished = false;
        StartMonitiringForReactiveAttack();
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        SetInterruptible(true);
        StopMonitiringForReactiveAttack();
        //return;        
    }

    function MoveInRange()
    {
        PushStateWithEnemyCheck('MoveInRange');
        //return;        
    }
Begin:

    Outer.EnableRotation(false);
    StartSpitStart();
    J0x2A:

    // End:0x59 [Loop If]
    if(!bStartFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x2A;
    }
    MoveInRange();
    Outer.Sleep(0.0000000);
    GotoStateWithEnemyCheck('SpitHold');
    stop;                    
}

state SpitHold
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        bHoldFinished = false;
        bSpitStarted = false;
        StartMonitiringForReactiveAttack();
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.ClearTimer('FinishHold', self);
        Outer.StopSpit();
        bSpitStarted = false;
        StopMonitiringForReactiveAttack();
        //return;        
    }

    function SetFinishTime()
    {
        local /*0x97E50000-0x00000000*/ private float TimeToHold;

        TimeToHold = RandRange(Outer.SpitterPawn.Duration_SpitAttackPof_Min, Outer.SpitterPawn.Duration_SpitAttackPof_Max);
        Outer.SetTimer(TimeToHold, false, 'FinishHold', self);
        //return;        
    }

    function NotifyPawnOfFinishTime()
    {
        local /*0x97E50000-0x00000000*/ private float TimeOut;

        TimeOut = Outer.GetRemainingTimeForTimer('FinishHold', self);
        // End:0x53
        if(TimeOut < float(0))
        {
            TimeOut = 0.0000000;
        }
        Outer.SpitterPawn.SetSpitFinishTime(TimeOut + Outer.SpitterPawn.WorldInfo.TimeSeconds);
        //return;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x20
        if(bSpitStarted)
        {
            TargetSpit(DeltaTime);
        }
        //return;        
    }

    function ShouldContinueHold()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bHoldFinished)
        {
            return false;
        }
        // End:0x35
        if(!Outer.IsTailIntact())
        {
            return false;
        }
        // End:0x46
        if(!IsMyEnemyAlive())
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0xE8
    if(!bFakeStrike)
    {
        SetFinishTime();
        NotifyPawnOfFinishTime();
        bSpitStarted = true;
        StartSpitHold();
        Outer.SpitterPawn.AccumulatedCoreDamageDuringPhase = 0.0000000;
        J0x72:

        // End:0x9F [Loop If]
        if(ShouldContinueHold())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x72;
        }
        bSpitStarted = false;
        Outer.SpitterPawn.ServerEndSpecialMove(LPSMClassSpitHold);
    }
    GotoStateWithEnemyCheck('SpitFinish');
    stop;                    
}

state SpitFinish
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.SpitterPawn.DisableTailIK();
    StartSpitFinish();
    J0x3F:

    // End:0x83 [Loop If]
    if(!Outer.bMeleeFinished)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x3F;
    }
End:


    Outer.PopCommand(self);
    stop;                    
}

state Abort
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        PreAbortState = PreviousStateName;
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.PopCommand(self);
    stop;                
}

state AttackTransition
{
    function DoTransitionToAttack()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

        Outer.SetTimer(TimeoutHunkerDown, false, 'EndHunkerDown', self);
        // End:0x6F
        if(bSpinOnTheSpotDuringHunkerDown)
        {
            return Outer.CmdSpitterHunkerDownForSpit(EnemyForStrike, EnemyForStrike);            
        }
        else
        {
            return Outer.CmdSpitterHunkerDownForSpit(EnemyForStrike);
        }
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    LPSMClassSpitStart=Class'LPSM_SpitterSpitAttack'
    LPSMClassSpitHold=Class'LPSM_SpitterSpitAttackHold'
    LPSMClassSpitFinish=Class'LPSM_SpitterSpitAttackFinish'
    AutoCorrectionSlowDownFactorForSprint=0.5000000
    bDoTransitionInToAttack=true
    AttackCSA=eSpitterCSA.eSpitterCSA_Attack
}