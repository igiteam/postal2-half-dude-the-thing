class LPAICmd_DongoFrenzyStrike extends LPAICmd_Strike within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackupPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBumpedDuringBackup;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSmFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTellBeforeAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ForwardArcDot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BreakOutDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToPositionCmd;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepeatCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ClawSwipRepeatCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SmTell;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SmIn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SmCycle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SmEnd;

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    RepeatCount = int(Abs(Outer.DongoPawn.TuneDataDongo.FrenzySequenceRepeatCount.GetValue()));
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
    Outer.ResetRotationRate();
    Outer.MeleeFinished();
    Outer.SetFrenzyCSA(false);
    Outer.LockStrikeAccess(false);
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    Outer.ConstraintMovementInFacingDirection(false);
    Outer.SetWantsNewEnemy(true);
    // End:0x1D7
    if(SmIn != none)
    {
        Outer.DongoPawn.EndSpecialMove(SmIn);
    }
    // End:0x223
    if(SmCycle != none)
    {
        Outer.DongoPawn.EndSpecialMove(SmCycle);
    }
    // End:0x26F
    if(SmEnd != none)
    {
        Outer.DongoPawn.EndSpecialMove(SmEnd);
    }
    //return;    
}

event DelegateMovingInFrenzy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(Obstacle == EnemyForStrike)
    {
        return false;
    }
    return Outer.ShouldAviodActorTypeDuringFrenzy(Obstacle);
    //return ReturnValue;    
}

event @NULL TouchWhileFrenzy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event @NULL BumpWhileFrenzy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyOfFailedMovementWhileFrenzy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
    }
    // End:0x70
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    return true;
    //return ReturnValue;    
}

function @NULL IsOffNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPos[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;

    BotHandle = SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle);
    // End:0x86
    if((BotHandle != none) && !BotHandle.PathFinder_IsLocationInNavMesh(InPos))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event DelegateMovingBackup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(Obstacle == EnemyForStrike)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event @NULL TouchWhileBackup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(LPPawn(Other) != none)
    {
        bBumpedDuringBackup = true;
    }
    return true;
    //return ReturnValue;    
}

event @NULL BumpWhileBackup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(LPPawn(Other) != none)
    {
        bBumpedDuringBackup = true;
    }
    return true;
    //return ReturnValue;    
}

function NotifyOfFailedMovementWhileBackup()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
    }
    return true;
    //return ReturnValue;    
}

function MoveBackupAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(MoveStrikeAbortCondition())
    {
        return true;
    }
    return bBumpedDuringBackup;
    //return ReturnValue;    
}

function BackupForStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL EDircetion;
    local /*0x97E50000-0x00000000*/ private float Dist;

    Dist = Outer.DongoPawn.TuneDataDongo.FrenzyBackUpDistance.GetValue();
    // End:0x82
    if((EnemySeperation2D()) >= Dist)
    {
        return;
    }
    EDircetion = EnemyForStrike.Location - Outer.DongoPawn.Location;
    EDircetion = Normal(EDircetion);
    TargetPos = (-EDircetion * Dist) + Outer.DongoPawn.Location;
    bBumpedDuringBackup = false;
    CurMoveToPositionCmd = Outer.CmdMoveToPosition(TargetPos, EnemyForStrike, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeStrike);
    Outer.Focus = EnemyForStrike;
    CurMoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingBackup;
    CurMoveToPositionCmd.SetNotifyOfTouchWhileMovingDelegate(TouchWhileBackup);
    CurMoveToPositionCmd.SetNotifyOfBumpWhileMovingDelegate(BumpWhileBackup);
    CurMoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveBackupAbortCondition;
    CurMoveToPositionCmd.bZeroVelocityOnFinish = true;
    CurMoveToPositionCmd.SetMovementMonitorParameters(true, Outer.DongoPawn.TuneDataIceCrab.DurationBetweenMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.DongoPawn.TuneDataIceCrab.MinMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.DongoPawn.TuneDataIceCrab.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable.GetValue(), NotifyOfFailedMovementWhileBackup);
    //return;    
}

function AbortFrenzy()
{
    // End:0x38
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
    }
    // End:0x70
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    //return;    
}

function StartFrenzy()
{
    local /*0x97E50000-0x00000000*/ private float SpeedScale;

    SpeedScale = Outer.DongoPawn.TuneDataDongo.FrenzySpeedScale.GetValue();
    Outer.DongoPawn.SetMaxSpeedScale(SpeedScale);
    ForwardArcDot = Outer.DongoPawn.TuneDataDongo.FrenzyForwardArcInDeg.GetValue();
    ForwardArcDot = Cos(ForwardArcDot * 0.0174533);
    BreakOutDistance = Abs(Outer.DongoPawn.TuneDataDongo.FrenzyBreakOutDistance.GetValue());
    Outer.SetFrenzyCSA(true);
    ClawSwipRepeatCount = int(Abs(Outer.DongoPawn.TuneDataDongo.FrenzyClawRepeatCount.GetValue()));
    //return;    
}

function TurnBeforeFrenzy()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewRotRate;

    NewRotRate = Outer.DongoPawn.RotationRate;
    NewRotRate.Yaw *= float(3);
    Outer.DongoPawn.RotationRate = NewRotRate;
    Outer.Focus = EnemyForStrike;
    Outer.CmdTurnToFaceFocus(1);
    //return;    
}

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsMyEnemyAlive();
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !HasAccessToStartAttack();
    //return ReturnValue;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x23
    if(HasAccessToStartAttack())
    {
        super.GotoStateWithEnemyCheck(StateName);        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

function OnSmFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSmFinished = true;
    //return;    
}

function StartSmOfClass()
{
    local /*0x97E50000-0x00000000*/ private class SMClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x79
    if(SMClass != none)
    {
        bSmFinished = false;
        Outer.DongoPawn.DoSpecialMove(SMClass, true, false, OnSmFinished, EnemyForStrike);
        return true;        
    }
    else
    {
        bSmFinished = true;
        return false;
    }
    //return ReturnValue;    
}

function IsEnemyRolling()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

    curTargetDodge = LPSM_PlayerRollBase(EnemyForStrike.SpecialMoveState.CurSMInstance);
    return curTargetDodge != none;
    //return ReturnValue;    
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

    // End:0x44
    if(!Outer.HaveStrikeAccess())
    {
        Outer.PopCommand(self);
    }
    Outer.LockStrikeAccess(true);
    Outer.Focus = EnemyForStrike;
    Outer.CmdTurnToFaceFocus(1);
    Outer.Focus = none;
    Outer.Sleep(0.0000000);
    GotoStateWithEnemyCheck('BackUp');
    stop;                
}

state BackUp
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
        Outer.ResetRotationRate();
        //return;        
    }

    event PushedState()
    {
        Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
        Outer.ResetRotationRate();
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

    BackupForStrike();
    Outer.Focus = EnemyForStrike;
    Outer.CmdTurnToFaceFocus(1);
    Outer.Focus = none;
    GotoStateWithEnemyCheck('MoveInRange');
    stop;            
}

state MoveInRange
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
        Outer.ClearTimer('ChaseTimeOutTimer', self);
        //return;        
    }

    function CanFollowEnemy()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x2D
        if(IsOffNavMesh(EnemyForStrike.Location))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function IsEnemyCloseEnoughToStartAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x74
        if(VSize2D(TargetPos - Outer.DongoPawn.Location) < (Outer.MyKynapseRadius * 0.5000000))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function MoveForAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float ChaseTimeOut;

        // End:0x0F
        if(IsEnemyCloseEnoughToStartAttack())
        {
            return false;
        }
        CurMoveToActorCmd = Outer.CmdMoveToActor(EnemyForStrike, EnemyForStrike, 200.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeStrike);
        CurMoveToActorCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingInFrenzy;
        CurMoveToActorCmd.SetNotifyOfTouchWhileMovingDelegate(TouchWhileFrenzy);
        CurMoveToActorCmd.SetNotifyOfBumpWhileMovingDelegate(BumpWhileFrenzy);
        CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
        CurMoveToActorCmd.bZeroVelocityOnFinish = true;
        CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.DongoPawn.TuneDataIceCrab.DurationBetweenMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.DongoPawn.TuneDataIceCrab.MinMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.DongoPawn.TuneDataIceCrab.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable.GetValue(), NotifyOfFailedMovementWhileFrenzy);
        ChaseTimeOut = Outer.DongoPawn.TuneDataIceCrab.FrenzyChaseTimeOut.GetValue();
        // End:0x36F
        if(ChaseTimeOut <= float(0))
        {
            ChaseTimeOut = 300.0000000;
        }
        Outer.SetTimer(ChaseTimeOut, false, 'ChaseTimeOutTimer', self);
        return true;
        //return ReturnValue;        
    }

    function HasMoveToActorSucceeded()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);
        //return ReturnValue;        
    }

    event @NULL TouchWhileFrenzy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x65
        if(Outer.CanBeDestroyedByFrenzyHit(Other))
        {
            Outer.DestroyByFrenzyHit(Other, HitLocation, HitNormal);
        }
        return true;
        //return ReturnValue;        
    }

    event @NULL BumpWhileFrenzy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x7A
        if(Outer.CanBeDestroyedByFrenzyHit(Other))
        {
            Outer.DestroyByFrenzyHit(Other, Other.Location, HitNormal);
        }
        return true;
        //return ReturnValue;        
    }

    function ChaseTimeOutTimer()
    {
        // End:0x38
        if(CurMoveToPositionCmd != none)
        {
            Outer.AbortCommand(CurMoveToPositionCmd);
        }
        // End:0x70
        if(CurMoveToActorCmd != none)
        {
            Outer.AbortCommand(CurMoveToActorCmd);
        }
        //return;        
    }

    function PostMoveForAttack()
    {
        // End:0x38
        if(CurMoveToActorCmd != none)
        {
            Outer.AbortCommand(CurMoveToActorCmd);
        }
        // End:0x66
        if(HasMoveToActorSucceeded())
        {
            CurMoveToActorCmd = none;
            GotoStateWithEnemyCheck('Frenzy');            
        }
        else
        {
            GotoStateWithEnemyCheck('FrenzyEnd');
        }
        //return;        
    }
Begin:

    StartFrenzy();
    // End:0x76
    if(bTellBeforeAttack && !IsEnemyCloseEnoughToStartAttack())
    {
        StartSmOfClass(SmTell);
        J0x3B:

        // End:0x6A [Loop If]
        if(!bSmFinished)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x3B;
        }
        bTellBeforeAttack = false;
    }
    // End:0xA2
    if(!MoveForAttack())
    {
        Outer.Sleep(0.0000000);
    }
    Outer.Sleep(0.1000000);
    PostMoveForAttack();
    stop;            
}

state Frenzy
{
    function CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL Rel, facing;

        // End:0x120
        if(((EnemySeperation2D()) < BreakOutDistance) && ClawSwipRepeatCount > 0)
        {
            Rel = EnemyForStrike.Location - Outer.DongoPawn.Location;
            Rel.Z = 0.0000000;
            Rel = Normal(Rel);
            facing = Vector(Outer.DongoPawn.Rotation);
            // End:0x120
            if((Rel Dot facing) > ForwardArcDot)
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x136
        if(Outer.DongoPawn.IsDoingSpecialMove_OF_Class(SmIn) && IsEnemyRolling())
        {
            Outer.DongoPawn.StopPawnChoreography();
            Outer.Focus = none;
            Outer.SetFocalPoint(Outer.DongoPawn.Location + (Vector(Outer.DongoPawn.Rotation) * float(1000)), true);
        }
        //return;        
    }
Begin:

    TurnBeforeFrenzy();
    Outer.ResetRotationRate();
    Outer.Focus = none;
    --RepeatCount;
    StartSmOfClass(SmIn);
    J0x67:

    // End:0x96 [Loop If]
    if(!bSmFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x67;
    }
    J0x96:

    // End:0x136 [Loop If]
    if(CanContinue())
    {
        // End:0x133
        if(ClawSwipRepeatCount > 0)
        {
            --ClawSwipRepeatCount;
            StartSmOfClass(SmCycle);
            J0xD0:

            // End:0xFF [Loop If]
            if(!bSmFinished)
            {
                Outer.Sleep(0.0000000);
                // [Loop Continue]
                goto J0xD0;
            }
            Outer.DongoPawn.LineSweepHitTesterResetHitTest();
        }
        // [Loop Continue]
        goto J0x96;
    }
    // End:0x15B
    if(RepeatCount > 0)
    {
        GotoStateWithEnemyCheck('StateCmdActive');        
    }
    else
    {
        GotoStateWithEnemyCheck('FrenzyEnd');
    }
    stop;        
}

state FrenzyEnd
{Begin:

    Outer.MeleeFinished();
    StartSmOfClass(SmEnd);
    Outer.DongoPawn.ZeroMovementVariables();
    Outer.Focus = EnemyForStrike;
    Outer.CmdTurnToFaceFocus(1);
    Outer.Focus = none;
    Outer.Sleep(0.0000000);
    Outer.PopCommand(self);
    stop;                    
}

defaultproperties
{
    bTellBeforeAttack=true
    RepeatCount=3
    SmTell=Class'LPSM_DongoFrenzyTell'
    SmIn=Class'LPSM_DongoFrenzyIn'
    SmCycle=Class'LPSM_DongoFrenzyCycle'
    SmEnd=Class'LPSM_DongoFrenzyOut'
}