class LPAICmd_SpitterStrike extends LPAICmd_Strike within LPAIControllerSpitter
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool MovingToActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReactive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoTransitionInToAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoOffScreenChecks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanDoReactiveAttacksDuringTransition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttackTransitionAborted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpinOnTheSpotDuringHunkerDown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AttackCSA;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitEndTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackTransitionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackTransitionStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackTransitionEndTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Seperation_ToBreakOutOfHunkerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngularSeperation_ToBreakOutOfHunkerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfNextReactiveStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeoutHunkerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_Reactive[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    Outer.SpitterPawn.ZeroMovementVariables();
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.myAIPawn.ZeroMovementVariables();
    Outer.bDelayMeleeDmg = false;
    Outer.PendingMeleeDmg.Length = 0;
    Seperation_ToBreakOutOfHunkerDown = Outer.SpitterPawn.Seperation_ToBreakOutOfHunkerDown;
    AngularSeperation_ToBreakOutOfHunkerDown = Outer.SpitterPawn.AngularSeperation_ToBreakOutOfHunkerDown;
    AttackSeperation_Reactive = Outer.SpitterPawn.AttackSeperation_TalonAttackReactivePof;
    AttackSeperation_Reactive.Max = 150.0000000;
    TimeOfNextReactiveStrike = 0.0000000;
    TimeoutHunkerDown = Outer.SpitterPawn.TuneDataSpitter.MaxTimeInHunkerDown.GetValue();
    // End:0x292
    if(TimeoutHunkerDown <= float(0))
    {
        TimeoutHunkerDown = 0.1000000;
    }
    CheckForOffScreenAttack();
    //return;    
}

function Popped()
{
    OnSpitterStrikeExit();
    Outer.TimeStrikeEnd = CurTime();
    Outer.bDelayMeleeDmg = false;
    super.Popped();
    //return;    
}

event SPAborted()
{
    OnSpitterStrikeExit();
    super.SPAborted();
    //return;    
}

function OnSpitterStrikeExit()
{
    SetInterruptible(true, true);
    Outer.MeleeFinished();
    Outer.Focus = none;
    Outer.SpitterPawn.bInDodgeWindow = false;
    Outer.SpitterPawn.DisableTailIKImmediate();
    Outer.SpitterPawn.ForceCloseDodgeWindows(EnemyForStrike);
    Outer.SpitterPawn.bAllowChoreography = true;
    //return;    
}

function DelayedMeleeHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    //return;    
}

function CheckForOffScreenAttack()
{
    local /*0x97E50000-0x00000000*/ private float TimeNotRendered, PercentChanceForChoreography;

    Outer.SpitterPawn.bAllowChoreography = true;
    // End:0x253
    if((bDoOffScreenChecks && Class'SPEngine.SPUtil'.static.IsSinglePlayerGame()) && Outer.SpitterPawn.TuneDataSpitter.bAllowOffScreenSpitterAttacksToBeLessAccurate)
    {
        TimeNotRendered = Outer.SpitterPawn.TuneDataSpitter.TimeNotRenderedToBeConsideredOffScreen.GetValue();
        // End:0x253
        if(TimeNotRendered > float(0))
        {
            // End:0x253
            if(Outer.SpitterPawn.HasNotBeenRenderedForTime(TimeNotRendered))
            {
                PercentChanceForChoreography = Outer.SpitterPawn.TuneDataSpitter.PercentageChanceOfUsingChoreographyForAttacksWhenOffScreen.GetValue();
                // End:0x253
                if((PercentChanceForChoreography >= float(0)) && PercentChanceForChoreography <= float(100))
                {
                    // End:0x253
                    if(RandRange(0.0000000, 100.0000000) > PercentChanceForChoreography)
                    {
                        Outer.SpitterPawn.bAllowChoreography = false;
                    }
                }
            }
        }
    }
    //return;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsMyEnemyAlive();
    //return ReturnValue;    
}

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !HasAccessToStartAttack();
    //return ReturnValue;    
}

function IsStriking()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyOfFailedMovement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
    }
    return true;
    //return ReturnValue;    
}

function ManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
    local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bZeroVelocityOnFinish[9437185], CheckForStrikeAccess, ReturnValue;
    local /*0x97E50000-0x00000000*/ private float Seperation;

    true
    false
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    // End:0x2EC
    if((IsMyEnemyAlive()) && !Outer.bTuneSpit)
    {
        Seperation = EnemySeperation2D();
        // End:0x2EC
        if(Seperation > AttackSeperationMax)
        {
            Outer.EnableRotation(true);
            MovingToActor = true;
            MoveToActorCmd = Outer.CmdMoveToActor(EnemyForStrike, FocusActor, AttackSeperationMin, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfManeuverForAttack);
            // End:0x1F0
            if(CheckForStrikeAccess)
            {
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;                
            }
            else
            {
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
            }
            MoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            MoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            MoveToActorCmd.bZeroVelocityOnFinish = bZeroVelocityOnFinish;
            MoveToActorCmd.SetMovementMonitorParameters(true, 1.0000000, 100.0000000, 1.0000000, NotifyOfFailedMovement);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function HasMoveToActorSucceeded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);
    //return ReturnValue;    
}

function HasMoveToActorFailed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x7E
    if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) >= int(3))
    {
        // End:0x7E
        if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) != int(6))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsMoving()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !HasMoveToActorSucceeded() && !HasMoveToActorFailed();
    //return ReturnValue;    
}

function MoveClose()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ManeuverForAttack(Outer.SpitterPawn.AttackSeperation_TailStingPof.Min, Outer.SpitterPawn.AttackSeperation_TailStingPof.Max, EnemyForStrike);
    //return ReturnValue;    
}

function StartMonitiringForReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private float Frequency;

    // End:0xD6
    if(bCanDoReactiveAttacksDuringTransition)
    {
        Frequency = Outer.SpitterPawn.TuneDataSpitter.TimeBetweenTalonPushAway.GetValue() + Outer.SpitterPawn.LengthOfTalonPushAnim;
        Outer.SetTimer(Frequency, true, 'MonitiringForReactiveAttack', self);
    }
    //return;    
}

function StopMonitiringForReactiveAttack()
{
    Outer.ClearTimer('MonitiringForReactiveAttack', self);
    //return;    
}

function PauseMonitiringForReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    Outer.PauseTimer(bPause, 'MonitiringForReactiveAttack', self);
    //return;    
}

function MonitiringForReactiveAttack()
{
    // End:0xC6
    if((IsInRange(AttackSeperation_Reactive, EnemySeperation2D())) && !Outer.SpitterPawn.bIsTalonPushing)
    {
        Outer.SpitterPawn.EnableLineSweepHitTester(true);
        Outer.SpitterPawn.PlayAdditiveTalonPush();
    }
    //return;    
}

function @NULL DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL DebugComponent, ToolTip;
    local /*0x97E50000-0x00000000*/ private byte CurCsa;

    super(LPAICommand).DrawDebug(InHUD);
    Outer.myAIPawn.GetComponentsOfClass(Class'SPEngine.SPDebugComponentPawn', ComponentArray);
    // End:0x87
    if(ComponentArray.Length > 0)
    {
        DebugComponent = SPDebugComponentPawn(ComponentArray[0]);
    }
    // End:0x165
    if(DebugComponent != none)
    {
        ToolTip = DebugComponent.GetTooltip(InHUD);
        CurCsa = Outer.SpitterPawn.GetCurrentCSA();
        ToolTip.Draw2DTextLn("Attack CSA : " $ string(CurCsa),, ToolTip.YellowColor);
    }
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        // End:0x4A
        if(!bDoTransitionInToAttack)
        {
            Outer.SetCSA(AttackCSA);
        }
        //return;        
    }
    stop;    
}

state DesignerSpecifiedWaiting
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
        SetInterruptible(false);
        StopMonitiringForReactiveAttack();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        SetInterruptible(false);
        StopMonitiringForReactiveAttack();
        //return;        
    }

    function ShouldTurnToFace()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL RelativePosition, RelativeDirection, MyFacing;

        RelativePosition = EnemyForStrike.Location - Outer.SpitterPawn.Location;
        RelativePosition.Z = 0.0000000;
        RelativeDirection = Normal(RelativePosition);
        MyFacing = Vector(Outer.SpitterPawn.Rotation);
        // End:0xF3
        if((MyFacing Dot RelativeDirection) < 0.7071068)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function IsStriking()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0x29F
    if(WaitTimeBeforeAttack > float(0))
    {
        WaitEndTime = WaitTimeBeforeAttack + Outer.myAIPawn.WorldInfo.TimeSeconds;
        Outer.Focus = none;
        Outer.EnableRotation(false);
        StartMonitiringForReactiveAttack();
        J0xB8:

        // End:0x29F [Loop If]
        if(((WaitEndTime > Outer.myAIPawn.WorldInfo.TimeSeconds) && Outer.HaveStrikeAccess()) && Outer.CanBeMyEnemy(EnemyForStrike))
        {
            Outer.EnableRotation(false);
            // End:0x218
            if(ShouldTurnToFace())
            {
                Outer.EnableRotation(true);
                Outer.Focus = EnemyForStrike;
                Outer.CmdTurnToFaceFocus(1);
                Outer.EnableRotation(false);
            }
            Outer.Sleep(0.5000000);
            Outer.EnableRotation(true);
            MoveClose();
            Outer.EnableRotation(false);
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xB8;
        }
    }
    PopState();
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
        SetInterruptible(false);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        SetInterruptible(false);
        //return;        
    }
Begin:

    Outer.EnableRotation(true);
    // End:0x4A
    if(MoveClose())
    {
        Outer.Sleep(0.0000000);
    }
    Outer.Focus = EnemyForStrike;
    Outer.CmdTurnToFaceFocus(1);
    Outer.EnableRotation(false);
    PopState();
    stop;            
}

state AttackTransition
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
        PauseMonitiringForEarlyEndOfTransition(true);
        PauseMonitiringForReactiveAttack(true);
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        PauseMonitiringForEarlyEndOfTransition(false);
        PauseMonitiringForReactiveAttack(false);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        SetInterruptible(false);
        StopMonitiringForEarlyEndOfTransition();
        StopMonitiringForReactiveAttack();
        AttackTransitionCmd = none;
        Outer.SpitterPawn.StopAdditiveTalonPush();
        Outer.SetCSA(AttackCSA);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        SetInterruptible(false);
        StopMonitiringForEarlyEndOfTransition();
        AttackTransitionCmd = none;
        Outer.SpitterPawn.StopAdditiveTalonPush();
        //return;        
    }

    function DoTransitionToAttack()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

        Outer.SetTimer(TimeoutHunkerDown, false, 'EndHunkerDown', self);
        // End:0x6F
        if(bSpinOnTheSpotDuringHunkerDown)
        {
            return Outer.CmdSpitterHunkerDown(EnemyForStrike, EnemyForStrike);            
        }
        else
        {
            return Outer.CmdSpitterHunkerDown(EnemyForStrike);
        }
        //return ReturnValue;        
    }

    function IsInStayHunkeredRange()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (EnemySeperation2D()) < Seperation_ToBreakOutOfHunkerDown;
        //return ReturnValue;        
    }

    function IsInStayHunkeredAngularRange()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL RelativeDir, SpitterFacing;

        RelativeDir = EnemyForStrike.Location - Outer.SpitterPawn.Location;
        RelativeDir.Z = 0.0000000;
        RelativeDir = Normal(RelativeDir);
        SpitterFacing = Vector(Outer.SpitterPawn.Rotation);
        // End:0xF7
        if((RelativeDir Dot SpitterFacing) >= AngularSeperation_ToBreakOutOfHunkerDown)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function CanContinueHunkerDown()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (IsInStayHunkeredRange()) && IsInStayHunkeredAngularRange();
        //return ReturnValue;        
    }

    function StartMonitiringForEarlyEndOfTransition()
    {
        // End:0x63
        if(Outer.SpitterPawn.LengthOfHunkerDownAnim > float(0))
        {
            Outer.SetTimer(0.5000000, true, 'MonitiringForEarlyEndOfTransition', self);
        }
        //return;        
    }

    function StopMonitiringForEarlyEndOfTransition()
    {
        Outer.ClearTimer('MonitiringForEarlyEndOfTransition', self);
        //return;        
    }

    function PauseMonitiringForEarlyEndOfTransition()
    {
        local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

        Outer.PauseTimer(bPause, 'MonitiringForEarlyEndOfTransition', self);
        //return;        
    }

    function MonitiringForEarlyEndOfTransition()
    {
        // End:0x28
        if(AttackTransitionCmd != none)
        {
            // End:0x28
            if(!CanContinueHunkerDown())
            {
                AbortHunkerDown();
            }
        }
        //return;        
    }

    function AbortHunkerDown()
    {
        bAttackTransitionAborted = true;
        EndHunkerDown();
        //return;        
    }

    function EndHunkerDown()
    {
        Outer.AbortCommand(AttackTransitionCmd);
        StopMonitiringForEarlyEndOfTransition();
        Outer.ClearTimer('AbortHunkerDown', self);
        //return;        
    }

    function SetWaitTimeOnAbortedTransition()
    {
        local /*0x97E50000-0x00000000*/ private float TimeSpentInTransition, TimeRemaining, TimeTotal;

        TimeTotal = float(Min(int(TimeoutHunkerDown), int(Outer.SpitterPawn.LengthOfHunkerDownAnim)));
        TimeSpentInTransition = AttackTransitionEndTime - AttackTransitionStartTime;
        TimeRemaining = TimeTotal - TimeSpentInTransition;
        // End:0xAF
        if(TimeRemaining > float(0))
        {
            WaitTimeBeforeAttack += TimeRemaining;
        }
        //return;        
    }
Begin:

    // End:0x26A
    if(bDoTransitionInToAttack)
    {
        Outer.EnableRotation(true);
        // End:0x57
        if(MoveClose())
        {
            Outer.Sleep(0.0000000);
        }
        Outer.Focus = EnemyForStrike;
        Outer.CmdTurnToFaceFocus(1);
        Outer.EnableRotation(false);
        AttackTransitionCmd = none;
        AttackTransitionStartTime = Outer.SpitterPawn.WorldInfo.TimeSeconds;
        Outer.SetCSA(AttackCSA);
        // End:0x1A9
        if(CanContinueHunkerDown())
        {
            StartMonitiringForEarlyEndOfTransition();
            bAttackTransitionAborted = false;
            StartMonitiringForReactiveAttack();
            AttackTransitionCmd = DoTransitionToAttack();
            Outer.Sleep(0.0000000);            
        }
        AttackTransitionEndTime = Outer.SpitterPawn.WorldInfo.TimeSeconds;
        AttackTransitionCmd = none;
        StopMonitiringForEarlyEndOfTransition();
        StopMonitiringForReactiveAttack();
        Outer.EnableRotation(false);
        // End:0x254
        if(bAttackTransitionAborted)
        {
            SetWaitTimeOnAbortedTransition();            
        }
        else
        {
            PushStateWithEnemyCheck('MoveInRange');
        }        
    }
    else
    {
        Outer.EnableRotation(true);
        // End:0x2B4
        if(MoveClose())
        {
            Outer.Sleep(0.0000000);
        }
        Outer.EnableRotation(false);
    }
    PopState();
    stop;                    
}

defaultproperties
{
    bDoOffScreenChecks=true
    bCanDoReactiveAttacksDuringTransition=true
    TimeoutHunkerDown=3.0000000
}