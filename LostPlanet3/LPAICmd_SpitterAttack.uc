class LPAICmd_SpitterAttack extends LPAICmd_Attack within LPAIControllerSpitter
    abstract;

enum StalkPosResult
{
    SPR_Failed,                     // 0
    SPR_StalkPos,                   // 1
    SPR_StalkNeg,                   // 2
    SPR_MAX                         // 3
};

struct HidePointDebugData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Origin;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Target;

    structdefaultproperties
    {
        Origin=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Target=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanStrikeBeforeReachingMeleeSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableStrafing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool MovingToActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttackEvaluaterEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabledReactiveTailSwing[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabledReactiveTailSting[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabledReactiveTalon[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInIdlePause[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool IsManeuvering;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanStalk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartCircle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLosTraversalFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideTraversalFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_SpitAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ResinBreakAndSpitAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TailSting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TailStingForwardArcDot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TailStingQuick_RepeatCount_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TailStingQuick_RepeatCount_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TalonAttackQuick_RepeatCount_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TalonAttackQuick_RepeatCount_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TalonAttackNormal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TalonAttackReactive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TalonAttackForwardArcDot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTailSting_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTailSting_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTalonAttack_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTalonAttack_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_TailSwing_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_TailSwing_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TailSwingRearDot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TailSwing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_ChargeAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionTailBurning[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionNotResined[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionNotResinedSpitDisabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionNotResinedTailDisabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionResined[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepeatCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StalkSpeedScale[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackSpeedScale[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DesiredPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_ReactiveTailSting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextIdleTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BackUpTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IdleFinishTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastStalkStepDirection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NextStalkStepDirection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentPosIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NextPosIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int iter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastStalkPosResult[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayBeforeStalkMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LosTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TempValidLosPositions[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TempValidLosPositionsCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ValidLosPositions[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ValidLosPositionsCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastLosTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LosTraversalBot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HideTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TempValidHidePositions[5];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TempValidHidePositionsCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ValidHidePositions[5];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ValidHidePositionsCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastHideTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HideTraversalBot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HidePointData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TempHidePointData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WithdrawForChargePoint[536870913];

function Pushed()
{
    super.Pushed();
    Outer.TimeStrikeEnd = 0.0000000;
    Outer.EnableRotation(true);
    SetTunables();
    SetAttackSpeedScale();
    Outer.SpitterPawn.DisableTailIKImmediate();
    Outer.SpitterPawn.ClearReactiveSpitTimers();
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.myAIPawn.ZeroMovementVariables();
    LastStalkPosResult = 0;
    Outer.SpitterPawn.bAllowChoreography = true;
    //return;    
}

function SetTunables()
{
    TalonAttackForwardArcDot = Outer.SpitterPawn.TalonAttackForwardArcDot;
    TimeBetween_ResinBreakAndSpitAttack = Outer.SpitterPawn.TimeBetween_ResinBreakAndSpitAttack;
    TailStingQuick_RepeatCount_Min = Outer.SpitterPawn.TailStingQuick_RepeatCount_Min;
    TailStingQuick_RepeatCount_Max = Outer.SpitterPawn.TailStingQuick_RepeatCount_Max;
    TalonAttackQuick_RepeatCount_Min = Outer.SpitterPawn.TalonAttackQuick_RepeatCount_Min;
    TalonAttackQuick_RepeatCount_Max = Outer.SpitterPawn.TalonAttackQuick_RepeatCount_Max;
    TimeBetween_ReactiveTailSting_Min = Outer.SpitterPawn.TimeBetween_ReactiveTailSting_Min;
    TimeBetween_ReactiveTailSting_Max = Outer.SpitterPawn.TimeBetween_ReactiveTailSting_Max;
    TimeBetween_ReactiveTalonAttack_Min = Outer.SpitterPawn.TimeBetween_ReactiveTalonAttack_Min;
    TimeBetween_ReactiveTalonAttack_Max = Outer.SpitterPawn.TimeBetween_ReactiveTalonAttack_Max;
    TimeBetween_TailSwing_Min = Outer.SpitterPawn.TimeBetween_TailSwing_Min;
    TimeBetween_TailSwing_Max = Outer.SpitterPawn.TimeBetween_TailSwing_Max;
    TailSwingRearDot = Outer.SpitterPawn.TailSwingRearDot;
    AttackSeperation_TailSwing = Outer.SpitterPawn.AttackSeperation_TailSwing;
    //return;    
}

function Popped()
{
    super.Popped();
    OnExitSpitterAttack();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExitSpitterAttack();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.SpitterPawn.bAllowChoreography = true;
    Outer.SpitterPawn.ForceCloseDodgeWindows(EnemyForAttack);
    //return;    
}

function OnExitSpitterAttack()
{
    StopAttackEvaluater();
    SetDefaultSpeedScale();
    Outer.SetCSA();
    Outer.SpitterPawn.SetSpitState(0);
    Outer.SpitterPawn.DisableTailIKImmediate();
    // End:0xD7
    if(LosTraversal != none)
    {
        LosTraversal.Stop();
        LosTraversal = none;
    }
    // End:0x110
    if(LosTraversalBot != none)
    {
        LosTraversalBot.Destroy();
        LosTraversalBot = none;
    }
    // End:0x149
    if(HideTraversal != none)
    {
        HideTraversal.Stop();
        HideTraversal = none;
    }
    // End:0x182
    if(HideTraversalBot != none)
    {
        HideTraversalBot.Destroy();
        HideTraversalBot = none;
    }
    //return;    
}

function AbortChildCommand()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ChildCmd;

    ChildCmd = LPAICommand(ChildCommand);
    // End:0x80
    if(ChildCmd != none)
    {
        // End:0x7B
        if(ChildCmd.IsInterruptible())
        {
            Outer.AbortCommand(ChildCmd);
            return true;            
        }
        else
        {
            return false;
        }        
    }
    else
    {
        return true;
    }
    //return ReturnValue;    
}

function AbortMove()
{
    // End:0x38
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
    }
    // End:0x70
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
    }
    MoveToActorCmd = none;
    MoveToPositionCmd = none;
    Outer.SpitterPawn.ZeroMovementVariables();
    //return;    
}

function PopCommandWithMoveFaliure()
{
    LPAICmd_Attack_Status(3);
    Outer.PopCommand(self);
    //return;    
}

function ShouldTauntOnSightingEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !(IsInRangeForTailSting()) || IsInPositionForTailSwingAttack() && (Outer.NextEnemySightedTauntTime < Outer.WorldTime()) && Outer.SpitterPawn.LastEnemyUsedForTauntOnSight != EnemyForAttack;
    //return ReturnValue;    
}

function TauntOnSightingEnemy()
{
    // End:0x100
    if((ShouldTauntOnSightingEnemy()) && Outer.SpitterPawn.IsSinglePlayerGame())
    {
        Outer.NextEnemySightedTauntTime = Outer.WorldTime() + Outer.SpitterPawn.MinTimeBetweenEnemySightedTaunt;
        Outer.SpitterPawn.LastEnemyUsedForTauntOnSight = EnemyForAttack;
        Taunt();
    }
    //return;    
}

function Taunt()
{
    Outer.CmdSpitterTaunt(EnemyForAttack, 2, 1.0000000);
    //return;    
}

function TauntBetweenAttacks()
{
    Outer.CmdSpitterTaunt(EnemyForAttack, 3, AttackSelection.TauntDuration);
    //return;    
}

function IsEnemyTooFar()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return Seperation > (GetEnemyTooFarDistance());
        //return ReturnValue;
    }    
    @NULL
    default.@NULL
    @NULL
}

function GetEnemyTooFarDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return AttackSeperation_SpitAttack.Max * 2.0000000;
    //return ReturnValue;    
}

function ShouldAttackShortRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsInLongRangeAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x15
    if(IsInState('SpitAttack'))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsDoingTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x27
    if(IsInState('TailSting') || IsInState('TailStingQuick'))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsDoingTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x27
    if(IsInState('TalonAttack') || IsInState('TalonAttackQuick'))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsDoingMeleeAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x21
    if((IsDoingTailSting()) || IsDoingTalonAttack())
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CanInterruptWithReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(IsDoingTalonAttack())
    {
        return false;        
    }
    else
    {
        // End:0x6B
        if(IsDoingTailSting())
        {
            // End:0x66
            if(Outer.IsInStrikeCmd())
            {
                return !Outer.IsStriking();                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            return true;
        }
    }
    //return ReturnValue;    
}

function IsDoingAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((IsDoingMeleeAttack()) || IsInLongRangeAttack()) || IsInState('TauntDuringAttack');
    //return ReturnValue;    
}

function SetStalkSpeedScale()
{
    Outer.SpitterPawn.SetMaxSpeedScale(StalkSpeedScale);
    //return;    
}

function SetAttackSpeedScale()
{
    Outer.SpitterPawn.SetMaxSpeedScale(AttackSpeedScale);
    //return;    
}

function SetDefaultSpeedScale()
{
    Outer.SpitterPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    //return;    
}

function Fire()
{
    Outer.CmdSpitStrike(EnemyForAttack, AttackSelection.TimeBetweenHunkerAndSpit, false,, 1);
    //return;    
}

function FakeFire()
{
    // End:0x53
    if(Outer.IsSpitPossible())
    {
        Outer.CmdSpitStrike(EnemyForAttack, 0.0000000, true,, 1);
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

function HasMoveToActorSucceeded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);
    //return ReturnValue;    
}

function HasMoveToSlotFailed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) >= int(3))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasMoveToSlotSucceeded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(2);
    //return ReturnValue;    
}

function ManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
    local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bZeroVelocityOnFinish[9437185], CheckForStrikeAccess;
    local /*0x97E50000-0x00000000*/ private float Seperation;

    true
    false
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    Outer.EnableRotation(true);
    MovingToActor = true;
    // End:0x1A8
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        // End:0x1A8
        if(Seperation > AttackSeperationMax)
        {
            MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, FocusActor, AttackSeperationMin, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfManeuverForAttack);
            SetupManeuverForAttack(bZeroVelocityOnFinish, CheckForStrikeAccess);
        }
    }
    //return;    
}

function SetupManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bZeroVelocityOnFinish[8388609], CheckForStrikeAccess;

    // End:0x40
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
    //return;    
}

function ManeuverForAttackTight()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
    local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bZeroVelocityOnFinish[9437185], CheckForStrikeAccess;
    local /*0x97E50000-0x00000000*/ private float Seperation;

    true
    false
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    Outer.EnableRotation(true);
    MovingToActor = true;
    // End:0x1A6
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        // End:0x1A6
        if(Seperation > AttackSeperationMax)
        {
            MoveToActorCmd = Outer.CmdMoveToActorTight(EnemyForAttack, FocusActor, AttackSeperationMin, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfManeuverForAttack);
            SetupManeuverForAttack(bZeroVelocityOnFinish, CheckForStrikeAccess);
        }
    }
    //return;    
}

function MoveToFirePositionAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !Outer.HaveRangedAccess();
    //return ReturnValue;    
}

event DelegateDynamicAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(Obstacle == EnemyForAttack)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event @NULL TouchWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event @NULL BumpWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyOfFailedMoveToPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
    }
    return true;
    //return ReturnValue;    
}

function MoveToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack[8388609], FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius[9437185], DelayMoveByTime;
    local /*0x97E50000-0x00000000*/ private @NULL Center;

    -1.0000000
    0.0000000
    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    MoveToPositionCmd = Outer.CmdMoveToPosition(PositionForAttack, EnemyForAttack, Outer.MyKynapseRadius * 0.1000000, Outer.CmdStatus_MoveToPosition, 1, 0);
    MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToFirePositionAbortCondition;
    MoveToPositionCmd.bZeroVelocityOnFinish = false;
    MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
    MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
    // End:0x277
    if(FormationConstraintRadius > float(0))
    {
        Center = EnemyForAttack.Location;
        Center.Z = FormationCenter.Z;
        MoveToPositionCmd.AddAreaConstraint(Center, FormationConstraintRadius, Outer.MyHeight);
    }
    MoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateDynamicAvoidance;
    MoveToPositionCmd.SetNotifyOfTouchWhileMovingDelegate(TouchWhileMoving);
    MoveToPositionCmd.SetNotifyOfBumpWhileMovingDelegate(BumpWhileMoving);
    MoveToPositionCmd.SetTimeDelayBeforeMove(DelayMoveByTime);
    MoveToPositionCmd.SetMovementMonitorParameters(true, 2.0000000, 200.0000000, 2.0000000, NotifyOfFailedMoveToPosition);
    //return;    
}

function MoveToAttackResourceLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius, ReachDistance;
    local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack;
    local /*0x97E50000-0x00000000*/ private bool bHasPosition;

    bHasPosition = GetPositionForAttack(PositionForAttack, FormationCenter, FormationConstraintRadius, ReachDistance, 1, 3);
    // End:0xFD
    if(bHasPosition)
    {
        MovingToActor = false;
        // End:0xFA
        if(IsMyEnemyAlive())
        {
            Outer.Focus = EnemyForAttack;
            Outer.EnableRotation(true);
            MoveToPosition(PositionForAttack, FormationCenter, FormationConstraintRadius);
            Outer.Focus = EnemyForAttack;
            return true;
        }        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
        return false;
    }
    //return ReturnValue;    
}

function GetPositionResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x38
    if(!Outer.HaveRangedAccess())
    {
        GetRangedAccess(EnemyForAttack);
    }
    // End:0x8F
    if(Outer.HaveRangedAccess())
    {
        return Outer.RangedAccess.GetResource();
    }
    return none;
    //return ReturnValue;    
}

function GetPositionForAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack[25165825], FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius[25165825], ReachDistance;
    local /*0x97E50000-0x00000000*/ private int MinStep[9437185], MaxStep;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation;

    -1
    -1
    ResourceMultiLocation = LPAIResMultiLocation(GetPositionResource());
    // End:0x117
    if(ResourceMultiLocation != none)
    {
        ReachDistance = ResourceMultiLocation.ReachDistance();
        FormationCenter = ResourceMultiLocation.GetFormationCenter();
        FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
        PositionForAttack = ResourceMultiLocation.GetNearestWorldPosition(Outer.myAIPawn.Location);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsEnabledStalk()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    // End:0x41
    /*@Error*/;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 2 & Type:If Position:0x041
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 2 & Type:If Position:0x041
}

function GetFormationInfo()
{
    local /*0x97E50000-0x00000000*/ private int PosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Position[25165825], FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius[25165825], ReachDistance;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation;

    ResourceMultiLocation = LPAIResMultiLocation(GetPositionResource());
    // End:0x108
    if(ResourceMultiLocation != none)
    {
        // End:0x108
        if(PosIndex < ResourceMultiLocation.NumPositions())
        {
            Position = ResourceMultiLocation.GetPosition(PosIndex);
            ReachDistance = ResourceMultiLocation.ReachDistance();
            FormationCenter = ResourceMultiLocation.GetFormationCenter();
            FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetNextStalkPositionIndex()
{
    local /*0x97E50000-0x00000000*/ private int CurrentStalkPosIndex[25165825], NextStalkPosIndex, MinStep, MaxStep;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AvailablePositions;
    local /*0x97E50000-0x00000000*/ private int StepDirection, NextMinIndex, NextMaxIndex, I;

    -1
    -1
    ResourceMultiLocation = LPAIResMultiLocation(GetPositionResource());
    // End:0x445
    if(ResourceMultiLocation != none)
    {
        // End:0x5B
        if(MinStep < 1)
        {
            MinStep = 1;            
        }
        else
        {
            // End:0xB4
            if(MinStep > ResourceMultiLocation.NumPositions())
            {
                MinStep = ResourceMultiLocation.NumPositions() - 1;
            }
        }
        // End:0xD1
        if(MaxStep < 1)
        {
            MaxStep = 1;            
        }
        else
        {
            // End:0x12A
            if(MaxStep > ResourceMultiLocation.NumPositions())
            {
                MaxStep = ResourceMultiLocation.NumPositions() - 1;
            }
        }
        // End:0x17A
        if(MaxStep < MinStep)
        {
            StepDirection = MinStep;
            MinStep = MaxStep;
            MaxStep = StepDirection;
        }
        CurrentStalkPosIndex = ResourceMultiLocation.GetNearestWorldPositionIndex(Outer.SpitterPawn.Location);
        NextStalkPosIndex = CurrentStalkPosIndex;
        // End:0x445
        if(ResourceMultiLocation.NumPositions() >= MinStep)
        {
            ResourceMultiLocation.GetWorldPositions(AvailablePositions);
            StepDirection = ((FRand() > 0.5000000) ? 1 : -1);
            I = 0;
            J0x267:

            // End:0x445 [Loop If]
            if(I < 2)
            {
                NextStalkStepDirection = StepDirection;
                // End:0x368
                if(StepDirection > 0)
                {
                    // End:0x365
                    if((CurrentStalkPosIndex + MinStep) < AvailablePositions.Length)
                    {
                        NextMinIndex = CurrentStalkPosIndex + MinStep;
                        NextMaxIndex = CurrentStalkPosIndex + MaxStep;
                        // End:0x327
                        if(NextMaxIndex >= AvailablePositions.Length)
                        {
                            NextMaxIndex = AvailablePositions.Length - 1;
                        }
                        NextStalkPosIndex = Class'SPEngine.SPUtil'.static.RandRangeInt(NextMinIndex, NextMaxIndex);
                        return 1;
                    }                    
                }
                else
                {
                    // End:0x425
                    if(StepDirection < 0)
                    {
                        // End:0x425
                        if((CurrentStalkPosIndex - MinStep) >= 0)
                        {
                            NextMaxIndex = CurrentStalkPosIndex - MinStep;
                            NextMinIndex = CurrentStalkPosIndex - MaxStep;
                            // End:0x3E7
                            if(NextMinIndex < 0)
                            {
                                NextMinIndex = 0;
                            }
                            NextStalkPosIndex = Class'SPEngine.SPUtil'.static.RandRangeInt(NextMinIndex, NextMaxIndex);
                            return 2;
                        }
                    }
                }
                StepDirection *= float(-1);
                ++I;
                // [Loop Continue]
                goto J0x267;
            }
        }
    }
    return 0;
    //return ReturnValue;    
}

function MoveToStalkPos()
{
    local /*0x97E50000-0x00000000*/ private int PosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float DelayTimeBeforeMove[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius, ReachDistance;
    local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack;

    0.0000000
    // End:0xFF
    if(GetFormationInfo(PosIndex, PositionForAttack, FormationCenter, FormationConstraintRadius, ReachDistance))
    {
        MovingToActor = false;
        // End:0xFC
        if(IsMyEnemyAlive())
        {
            Outer.Focus = EnemyForAttack;
            Outer.EnableRotation(true);
            MoveToPosition(PositionForAttack, FormationCenter, FormationConstraintRadius, DelayTimeBeforeMove);
            Outer.Focus = EnemyForAttack;
            return true;
        }        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
        return false;
    }
    //return ReturnValue;    
}

function IsEnemyReachableForSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsEnabledSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    // End:0x65
    /*@Error*/;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 2 & Type:If Position:0x065
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 2 & Type:If Position:0x065
}

function HaveRangedStrafePositions()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA6
    if(IsMyEnemyAlive())
    {
        // End:0xA6
        if(EnemyForAttack.AIResourceManager != none)
        {
            // End:0xA6
            if(EnemyForAttack.AIResourceManager.IsAccessPossible(Outer.RangedResourceName, Outer.SpitterPawn))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsInPositionForSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return IsInRangeForSpiAttack(Seperation);
        //return ReturnValue;
    }    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForSpiAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsEnabledSpitAttack()) && Outer.IsInRange(AttackSeperation_SpitAttack, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsEnemyReachableForTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsEnemyReachable(EnemyForAttack, AttackSeperation_TailSting.Max);
    //return ReturnValue;    
}

function IsEnabledTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    /*@Error*/;
}

function IsInPositionForTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x7D
        /*@Error*/
        return IsInAngularRangeForTailSting();
    }
    return false;
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInPositionForReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x7D
        /*@Error*/
        return IsInAngularRangeForReactiveTailSting();
    }
    return false;
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsEnabledTailSting()) && Outer.IsInRange(AttackSeperation_TailSting, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsEnabledTailSting()) && Outer.IsInRange(AttackSeperation_ReactiveTailSting, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInAngularRangeForTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, MyFacing;

    RelativeDirection = EnemyForAttack.Location - Outer.SpitterPawn.Location;
    RelativeDirection.Z = 0.0000000;
    RelativeDirection = Normal(RelativeDirection);
    MyFacing = Vector(Outer.SpitterPawn.Rotation);
    // End:0xF7
    if((MyFacing Dot RelativeDirection) > TailStingForwardArcDot)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsInAngularRangeForReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, MyFacing;

    RelativeDirection = EnemyForAttack.Location - Outer.SpitterPawn.Location;
    RelativeDirection.Z = 0.0000000;
    RelativeDirection = Normal(RelativeDirection);
    MyFacing = Vector(Outer.SpitterPawn.Rotation);
    // End:0xF3
    if((MyFacing Dot RelativeDirection) < 0.5000000)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TimeForReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NextTime;

    // End:0xD6
    if(Outer.TimeStrikeEnd > float(0))
    {
        NextTime = RandRange(Outer.SpitterPawn.TimeBetween_ReactiveTailSting_Min, Outer.SpitterPawn.TimeBetween_ReactiveTailSting_Min);
        NextTime += Outer.TimeStrikeEnd;
        return NextTime;        
    }
    else
    {
        return 0.0000000;
    }
    //return ReturnValue;    
}

function TimeToNextReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeRemaining;

    TimeRemaining = (TimeForReactiveTailSting()) - (CurTime());
    return TimeRemaining;
    //return ReturnValue;    
}

function IsTimeForNextReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (TimeToNextReactiveTailSting()) <= float(0);
    //return ReturnValue;    
}

function IsStrikeAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA6
    if(IsMyEnemyAlive())
    {
        // End:0xA6
        if(TheEnemy.AIResourceManager != none)
        {
            // End:0xA6
            if(TheEnemy.AIResourceManager.IsAccessPossible(Outer.StrikeResourceName, Outer.SpitterPawn))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsRangedAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA6
    if(IsMyEnemyAlive())
    {
        // End:0xA6
        if(EnemyForAttack.AIResourceManager != none)
        {
            // End:0xA6
            if(EnemyForAttack.AIResourceManager.IsAccessPossible(Outer.RangedResourceName, Outer.SpitterPawn))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyReachableForTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsEnemyReachable(EnemyForAttack, AttackSeperation_TalonAttackNormal.Max);
    //return ReturnValue;    
}

function IsEnemyReachableForChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsEnemyReachable(EnemyForAttack, AttackSeperation_ChargeAttack.Max);
    //return ReturnValue;    
}

function IsEnabledTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    /*@Error*/;
}

function IsInPositionForTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x7D
        /*@Error*/
        return IsInAngularRangeForTalonAttack();
    }
    return false;
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsEnabledTalonAttack()) && Outer.IsInRange(AttackSeperation_TalonAttackNormal, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInPositionForReactiveTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x7D
        /*@Error*/
        return IsInAngularRangeForTalonAttack();
    }
    return false;
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForReactiveTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsEnabledTalonAttack()) && Outer.IsInRange(AttackSeperation_TalonAttackReactive, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInAngularRangeForTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, MyFacing;

    RelativeDirection = EnemyForAttack.Location - Outer.SpitterPawn.Location;
    RelativeDirection.Z = 0.0000000;
    RelativeDirection = Normal(RelativeDirection);
    MyFacing = Vector(Outer.SpitterPawn.Rotation);
    // End:0xF7
    if((MyFacing Dot RelativeDirection) > TalonAttackForwardArcDot)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TimeForReactiveTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NextTime;

    // End:0xD6
    if(Outer.TimeStrikeEnd > float(0))
    {
        NextTime = RandRange(Outer.SpitterPawn.TimeBetween_ReactiveTalonAttack_Min, Outer.SpitterPawn.TimeBetween_ReactiveTalonAttack_Min);
        NextTime += Outer.TimeStrikeEnd;
        return NextTime;        
    }
    else
    {
        return 0.0000000;
    }
    //return ReturnValue;    
}

function TimeToNextReactiveTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeRemaining;

    TimeRemaining = (TimeForReactiveTalonAttack()) - (CurTime());
    return TimeRemaining;
    //return ReturnValue;    
}

function IsTimeForNextReactiveTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (TimeToNextReactiveTalonAttack()) <= float(0);
    //return ReturnValue;    
}

function IsEnabledTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    /*@Error*/;
}

function IsInPositionForTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x7D
        /*@Error*/
        return IsInAngularRangeForTailSwingAttack();
    }
    return false;
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsEnabledTailSwingAttack()) && Outer.IsInRange(AttackSeperation_TailSwing, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInAngularRangeForTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, MyFacing;

    RelativeDirection = EnemyForAttack.Location - Outer.SpitterPawn.Location;
    RelativeDirection.Z = 0.0000000;
    RelativeDirection = Normal(RelativeDirection);
    MyFacing = Vector(Outer.SpitterPawn.Rotation);
    // End:0xF7
    if((MyFacing Dot RelativeDirection) < TailSwingRearDot)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TimeForTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NextTime;

    // End:0x82
    if(Outer.TimeStrikeEnd > float(0))
    {
        NextTime = RandRange(TimeBetween_TailSwing_Min, TimeBetween_TailSwing_Max);
        NextTime += Outer.TimeStrikeEnd;
        return NextTime;        
    }
    else
    {
        return 0.0000000;
    }
    //return ReturnValue;    
}

function TimeToNextTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeRemaining;

    TimeRemaining = (TimeForTailSwingAttack()) - (CurTime());
    return TimeRemaining;
    //return ReturnValue;    
}

function IsTimeForNextTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (TimeToNextTailSwingAttack()) <= float(0);
    //return ReturnValue;    
}

protected function CanTryTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        // End:0x9E
        if(((IsEnabledTailSwingAttack(Seperation)) && IsInPositionForTailSwingAttack(Seperation)) && IsTimeForNextTailSwingAttack())
        {
        }
        return true;
        goto J0xA0;
        return false;
        //return ReturnValue;        
        @NULL
        stop;
        CmdPackHunterFarBiteStrikePof
    }
    @NULL
}

function StartCommandForChargeAttack()
{
    //return;    
}

function LosTraversalFinished()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x57 [Loop If]
    if(I < TempValidLosPositionsCount)
    {
        ValidLosPositions[I] = TempValidLosPositions[I];
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    ValidLosPositionsCount = TempValidLosPositionsCount;
    TimeOfLastLosTraversal = Outer.SpitterPawn.WorldInfo.TimeSeconds;
    bLosTraversalFinished = true;
    //return;    
}

function IsValidLosPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;
    local /*0x97E50000-0x00000000*/ private float EnemySeperationFromLocation;

    // End:0x12
    if(TempValidLosPositionsCount >= 2)
    {
        return true;
    }
    EnemySeperationFromLocation = VSize2D(EnemyForAttack.Location - FromLocation);
    // End:0xAC
    if(Outer.IsSpitPossible())
    {
        // End:0xA9
        if(!Outer.IsInRange(AttackSeperation_SpitAttack, EnemySeperationFromLocation))
        {
            return false;
        }        
    }
    else
    {
        // End:0x109
        if(Outer.IsTailIntact())
        {
            // End:0x106
            if(!Outer.IsInRange(AttackSeperation_TailSting, EnemySeperationFromLocation))
            {
                return false;
            }            
        }
        else
        {
            // End:0x141
            if(!Outer.IsInRange(AttackSeperation_TalonAttackNormal, EnemySeperationFromLocation))
            {
                return false;
            }
        }
    }
    bCanSee = Outer.LineOfSightTo(TestActor, FromLocation, false);
    // End:0x188
    if(!bCanSee)
    {
        return false;
    }
    // End:0x1D5
    if(!Outer.SpitterPawn.HaveLosForSpitAttack(FromLocation, EnemyForAttack))
    {
        return false;
    }
    TempValidLosPositions[TempValidLosPositionsCount] = FromLocation;
    TempValidLosPositionsCount++;
    return false;
    //return ReturnValue;    
}

function StartLosTraversal()
{
    // End:0x207
    if(!IsRangedAccessPossible() && (TimeOfLastLosTraversal + 0.5000000) < Outer.SpitterPawn.WorldInfo.TimeSeconds)
    {
        // End:0x91
        if(LosTraversalBot == none)
        {
            LosTraversalBot = CreateBotFromPawn();
        }
        // End:0x207
        if(LosTraversalBot != none)
        {
            // End:0xE2
            if(LosTraversal == none)
            {
                LosTraversal = LPKyTraversalFindLosSpot(Class'LPKyTraversalFindLosSpot'.static.Create());
            }
            // End:0x207
            if(LosTraversal != none)
            {
                LosTraversal.SetActor(EnemyForAttack);
                LosTraversal.SetLosFunction(IsValidLosPosition);
                LosTraversal.SetFinishCallBack(LosTraversalFinished);
                LosTraversal.StartAndBindToDummyBot(LosTraversalBot, Outer.myAIPawn.Location, AttackSeperation_SpitAttack.Max);
                TempValidLosPositionsCount = 0;
                bLosTraversalFinished = false;
            }
        }
    }
    //return;    
}

function CreateBotFromPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], SpitterDummyBot;

    SpitterDummyBot = Class'SPAIKynapse.SPKyDummyBot'.static.CreateFromPawn(Outer.myAIPawn);
    return SpitterDummyBot;
    //return ReturnValue;    
}

function HideTraversalFinished()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x57 [Loop If]
    if(I < TempValidHidePositionsCount)
    {
        ValidHidePositions[I] = TempValidHidePositions[I];
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    ValidHidePositionsCount = TempValidHidePositionsCount;
    TimeOfLastHideTraversal = Outer.SpitterPawn.WorldInfo.TimeSeconds;
    HidePointData = TempHidePointData;
    bHideTraversalFinished = true;
    //return;    
}

function IsValidHidePosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;
    local /*0x97E50000-0x00000000*/ private @NULL DebugData;

    // End:0x12
    if(TempValidHidePositionsCount >= 5)
    {
        return true;
    }
    bCanSee = Outer.LineOfSightTo(TestActor, FromLocation, false);
    // End:0x57
    if(bCanSee)
    {
        return false;
    }
    TempValidHidePositions[TempValidHidePositionsCount] = FromLocation;
    TempValidHidePositionsCount++;
    DebugData.Origin = FromLocation;
    DebugData.Target = TestActor.Location;
    // End:0x146
    if(TestActor == EnemyForAttack)
    {
        DebugData.Target.Z += EnemyForAttack.BaseEyeHeight;
    }
    TempHidePointData.AddItem(DebugData);    
    return false;
    //return ReturnValue;    
}

function StartHideTraversal()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldStart;

    bShouldStart = (Outer.bDebugAttackReactive || !Outer.IsSpitPossible()) || !IsRangedAccessPossible();
    bShouldStart = bShouldStart && (TimeOfLastHideTraversal + 0.5000000) < Outer.SpitterPawn.WorldInfo.TimeSeconds;
    // End:0x28D
    if(bShouldStart)
    {
        // End:0x105
        if(HideTraversalBot == none)
        {
            HideTraversalBot = CreateBotFromPawn();
        }
        // End:0x28D
        if(HideTraversalBot != none)
        {
            // End:0x156
            if(HideTraversal == none)
            {
                HideTraversal = LPKyTraversalFindLosSpot(Class'LPKyTraversalFindLosSpot'.static.Create());
            }
            // End:0x28D
            if(HideTraversal != none)
            {
                HideTraversal.SetActor(EnemyForAttack);
                HideTraversal.SetLosFunction(IsValidHidePosition);
                HideTraversal.SetFinishCallBack(HideTraversalFinished);
                HideTraversal.StartAndBindToDummyBot(HideTraversalBot, Outer.myAIPawn.Location, AttackSeperation_SpitAttack.Max * float(3));
                TempValidHidePositionsCount = 0;
                bHideTraversalFinished = false;
                TempHidePointData.Length = 0;
            }
        }
    }
    //return;    
}

final function IsAttackEvaluaterActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('InternalAttackEvaluater', self);
    //return ReturnValue;    
}

final function StartAttackEvaluater()
{
    // End:0x41
    if(!IsAttackEvaluaterActive())
    {
        Outer.SetTimer(0.0500000, true, 'InternalAttackEvaluater', self);
        InternalAttackEvaluater();
    }
    //return;    
}

final function StopAttackEvaluater()
{
    Outer.ClearTimer('InternalAttackEvaluater', self);
    //return;    
}

function PauseAttackEvaluater()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    bAttackEvaluaterEnabled = !bPause;
    // End:0x31
    if(bPause)
    {
        StopAttackEvaluater();        
    }
    else
    {
        StartAttackEvaluater();
    }
    //return;    
}

protected function ShouldNotDoAttackEvaluation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (((Outer.bDisableAI || Outer.SpitterPawn == none) || Outer.SpitterPawn.IsPendingKill()) || Outer.SpitterPawn.IsGrabbed()) || Outer.SpitterPawn.IsStunned();
    //return ReturnValue;    
}

final function InternalAttackEvaluater()
{
    // End:0x26
    if(!Outer.IsActiveCmdInterruptible())
    {
        return;
    }
    // End:0x55
    if(!IsMyEnemyAlive())
    {
        Outer.PopCommand(self);
    }
    // End:0x64
    if(ShouldNotDoAttackEvaluation())
    {
        return;
    }
    // End:0x7B
    if(bAttackEvaluaterEnabled)
    {
        AttackEvaluater();
    }
    //return;    
}

function IsInAttackState()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsInState(StateName, true);
    //return ReturnValue;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x53
    if(AbortChildCommand())
    {
        // End:0x33
        if(IsMyEnemyAlive())
        {
            GotoState(StateName, 'Begin');            
        }
        else
        {
            Outer.PopCommand(self);
        }
    }
    //return;    
}

function GotoAttackState()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x2B
    if(!IsInAttackState(StateName))
    {
        GotoStateWithEnemyCheck(StateName);
    }
    //return;    
}

function GotoDefaultAttackState()
{
    // End:0x23
    if(bDisableStrafing)
    {
        GotoAttackState('BackAway');        
    }
    else
    {
        GotoAttackState('DoNothing');
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
        Outer.PopCommand(self);
    }
    //return;    
}

function SelectAttack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;
    local /*0x97E50000-0x00000000*/ private float Sum, RandNum, RangeMin, RangeMax;

    Sum = 0.0000000;
    I = 0;
    J0x1A:

    // End:0x84 [Loop If]
    if(I < As.Probablility.Length)
    {
        Sum += As.Probablility[I];
        ++I;
        // [Loop Continue]
        goto J0x1A;
    }
    // End:0x9B
    if(Sum <= float(0))
    {
        return -1;
    }
    RandNum = FRand() * Sum;
    RangeMin = 0.0000000;
    I = 0;
    J0xCC:

    // End:0x1C0 [Loop If]
    if(I < As.Probablility.Length)
    {
        RangeMax = RangeMin + As.Probablility[I];
        // End:0x19F
        if(((As.Probablility[I] > float(0)) && RandNum >= RangeMin) && RandNum <= RangeMax)
        {
            return I;            
        }
        RangeMin = RangeMax;
        ++I;
        // [Loop Continue]
        goto J0xCC;
    }
    return -1;
    //return ReturnValue;    
}

function TimeForNextAttack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NextTime;

    // End:0xA8
    if(Outer.TimeStrikeEnd > float(0))
    {
        NextTime = RandRange(As.TimeBetweenAttack_Min, As.TimeBetweenAttack_Max);
        NextTime += Outer.TimeStrikeEnd;
        return NextTime;        
    }
    else
    {
        return 0.0000000;
    }
    //return ReturnValue;    
}

function TimeToNextAttack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeRemaining;

    TimeRemaining = (TimeForNextAttack(As)) - (CurTime());
    return TimeRemaining;
    //return ReturnValue;    
}

function IsTimeForNextAttack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (TimeToNextAttack(As)) <= float(0);
    //return ReturnValue;    
}

function ResetTauntTime()
{
    Outer.TimeTauntEnd = CurTime();
    //return;    
}

function TimeForNextTaunt()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NextTime;

    // End:0xA8
    if(Outer.TimeTauntEnd > float(0))
    {
        NextTime = RandRange(As.TimeBetweenTaunt_Min, As.TimeBetweenTaunt_Max);
        NextTime += Outer.TimeTauntEnd;
        return NextTime;        
    }
    else
    {
        return 0.0000000;
    }
    //return ReturnValue;    
}

function TimeToNextTaunt()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeRemaining;

    TimeRemaining = (TimeForNextTaunt(As)) - (CurTime());
    return TimeRemaining;
    //return ReturnValue;    
}

function IsTimeForNextTaunt()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return As.bEnableTaunt && (TimeToNextTaunt(As)) <= float(0);
    //return ReturnValue;    
}

function RunTimeAdjustAttackSelection()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25165825];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x72
    if(!IsEnabledTailSting(Seperation) || !IsEnemyReachableForTailSting())
    {
        As.Probablility[1] = 0.0000000;
        As.Probablility[2] = 0.0000000;
    }
    // End:0xBF
    if(!IsEnabledSpitAttack(Seperation) || !IsEnemyReachableForSpitAttack())
    {
        As.Probablility[0] = 0.0000000;
    }
    // End:0x132
    if(!IsEnabledTalonAttack(Seperation) || !IsEnemyReachableForTalonAttack())
    {
        As.Probablility[3] = 0.0000000;
        As.Probablility[4] = 0.0000000;
    }
    // End:0x194
    if(!Outer.IsSpitPossible() || LPVSFuturePlayerPawn(EnemyForAttack) != none)
    {
        As.Probablility[0] = 0.0000000;
    }
    // End:0x1EE
    if(!Outer.IsChargeAttackPossible() || !IsEnemyReachableForChargeAttack())
    {
        As.Probablility[5] = 0.0000000;
    }
    // End:0x2C7
    if(Outer.DebugExclusiveAttack > -1)
    {
        I = 0;
        J0x221:

        // End:0x286 [Loop If]
        if(I < As.Probablility.Length)
        {
            As.Probablility[I] = 0.0000000;
            ++I;
            // [Loop Continue]
            goto J0x221;
        }
        As.Probablility[Outer.DebugExclusiveAttack] = 100.0000000;
    }
    //return;    
}

protected function CanTryReactiveTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        // End:0x92
        if((bEnabledReactiveTalon && IsInRangeForReactiveTalonAttack(Seperation)) && IsTimeForNextReactiveTalonAttack())
        {
        }
        return true;
        return false;
        //return ReturnValue;        
        @NULL
        stop;
        Enemy2Strike
    }
    @NULL
}

protected function CanTryReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        // End:0xAA
        if(((bEnabledReactiveTailSting && IsEnabledTailSting(Seperation)) && IsInPositionForReactiveTailSting(Seperation)) && IsTimeForNextReactiveTailSting())
        {
        }
        return true;
        return false;
        //return ReturnValue;        
        @NULL
        stop;
        CmdStatus
    }
    @NULL
}

protected function AttackEvaluaterReactive()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(CanTryTailSwingAttack(Seperation))
    {
        GotoAttackState('TailSwing');
        return true;        
    }
    else
    {
        // End:0x5C
        if(CanTryReactiveTalonAttack(Seperation))
        {
            GotoAttackState('TalonAttackReactive');
            return true;            
        }
        else
        {
            // End:0xAD
            if((CanTryReactiveTailSting(Seperation)) && !Outer.IsTailBurning())
            {
                GotoAttackState('TailStingReactive');
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsInAttackPause()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x21
    if(IsInState('Stalk') && bInIdlePause)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function AttackEvaluater()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;
    local /*0x97E50000-0x00000000*/ private int SelectedAttack;

    // End:0x65
    if(Outer.SpitterPawn.IsSinglePlayerGame())
    {
        // End:0x4E
        if(bLosTraversalFinished)
        {
            StartLosTraversal();
        }
        // End:0x65
        if(bHideTraversalFinished)
        {
            StartHideTraversal();
        }
    }
    Seperation = EnemySeperation2D();
    SelectedAttack = -1;
    // End:0xC7
    if((IsEnemyTooFar(Seperation)) && !IsInState('BackAway'))
    {
        GotoAttackState('MoveCloser');
        return;
    }
    // End:0xDF
    if(AttackEvaluaterReactive(Seperation))
    {
        return;
    }
    // End:0x117
    if(Outer.IsTailBurning())
    {
        AttackSelection = AttackSelectionTailBurning;        
    }
    else
    {
        // End:0x143
        if(IsEnabledSpitAttack(Seperation))
        {
            AttackSelection = AttackSelectionNotResined;            
        }
        else
        {
            // End:0x16F
            if(IsEnabledTailSting(Seperation))
            {
                AttackSelection = AttackSelectionNotResinedSpitDisabled;                
            }
            else
            {
                AttackSelection = AttackSelectionNotResinedTailDisabled;
            }
        }
    }
    // End:0x234
    if(((((Outer.SpitterPawn.IsSinglePlayerGame() && IsTimeForNextTaunt(AttackSelection)) && !IsDoingAttack()) && !IsInState('MoveCloser')) && !IsInRangeForReactiveTailSting(Seperation)) && IsRangedAccessPossible())
    {
        GotoAttackState('TauntDuringAttack');
        return;
    }
    RunTimeAdjustAttackSelection(AttackSelection, Seperation);
    // End:0x3EE
    if((((IsTimeForNextAttack(AttackSelection)) && !IsDoingAttack()) && IsStrikeAccessPossible(EnemyForAttack)) && !IsInAttackPause())
    {
        SelectedAttack = SelectAttack(AttackSelection);
        // End:0x2EE
        if(Outer.bDebugAttackReactive)
        {
            SelectedAttack = -1;
        }
        switch(SelectedAttack)
        {
            // End:0x31B
            case 0:
                GotoAttackState('SpitAttack');
                // End:0x3EB
                break;
            // End:0x335
            case 1:
                GotoAttackState('TailSting');
                // End:0x3EB
                break;
            // End:0x350
            case 2:
                GotoAttackState('TailStingQuick');
                // End:0x3EB
                break;
            // End:0x36B
            case 3:
                GotoAttackState('TalonAttack');
                // End:0x3EB
                break;
            // End:0x386
            case 4:
                GotoAttackState('TalonAttackQuick');
                // End:0x3EB
                break;
            // End:0x3A1
            case 5:
                GotoAttackState('WithdrawForChargeAtEnemy');
                // End:0x3EB
                break;
            // End:0xFFFF
            default:
                // End:0x3E1
                if((IsEnabledStalk(Seperation)) && ValidHidePositionsCount < 1)
                {
                    GotoAttackState('Stalk');                    
                }
                else
                {
                    GotoDefaultAttackState();
                }
                break;
        }        
    }
    else
    {
        // End:0x433
        if(!IsDoingAttack())
        {
            // End:0x429
            if(IsEnabledStalk(Seperation))
            {
                GotoAttackState('Stalk');                
            }
            else
            {
                GotoDefaultAttackState();
            }
        }
    }
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    super.DrawDebug(InHUD);
    // End:0x48
    if(Outer.bShowMoreDebug)
    {
        DrawDebugAttack(InHUD);
    }
    //return;    
}

function DrawDebugHide()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

function @NULL DrawDebugStalk()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL DebugComponent, ToolTip;

    DrawDebug(InHUD);
    // End:0x13F
    if((EnemyForAttack != none) && bInIdlePause)
    {
        Outer.myAIPawn.GetComponentsOfClass(Class'SPEngine.SPDebugComponentPawn', ComponentArray);
        // End:0xA5
        if(ComponentArray.Length > 0)
        {
            DebugComponent = SPDebugComponentPawn(ComponentArray[0]);
        }
        // End:0x13F
        if(DebugComponent != none)
        {
            ToolTip = DebugComponent.GetTooltip(InHUD);
            ToolTip.Draw2DTextLn("Paused during Stalk ",, ToolTip.RedColor);
        }
    }
    //return;    
}

function DrawDebugAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000000*/ private float Y;

    Y = 10.0000000;
    DrawDebugRangeInfo(InHUD, 4.0000000, Y);
    //return;    
}

function DrawDebugRangeInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float X[8388609], Y;
    local /*0x97E50000-0x00000000*/ private @NULL Canvas;
    local /*0x97E50000-0x00000000*/ private float YL;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPos, EnemyRelPos;
    local /*0x97E50000-0x00000000*/ private float Seperation;

    // End:0x781
    if(EnemyForAttack != none)
    {
        Seperation = EnemySeperation2D();
        EnemyPos = EnemyForAttack.Location;
        EnemyRelPos = EnemyPos - Outer.Location;
        HUD.Canvas.SetDrawColor(255, 0, 255);
        HUD.Canvas.SetPos(X, Y);
        Canvas = HUD.Canvas;
        YL = Canvas.GetDefaultCanvasFont().GetMaxCharHeight() + float(2);
        Canvas.DrawText("My Pos : " $ Class'SPEngine.SPUtil'.static.Vec2Str(Outer.SpitterPawn.Location));
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        Canvas.DrawText("Enemy Pos : " $ Class'SPEngine.SPUtil'.static.Vec2Str(EnemyForAttack.Location));
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        Canvas.DrawText("Enemy Relative Pos : " $ Class'SPEngine.SPUtil'.static.Vec2Str(EnemyRelPos));
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        Canvas.DrawText("Enemy Relative Distance : " $ string(VSize2D(EnemyRelPos)));
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        DebugShowRange(Canvas, "Spit Range          :", Seperation, AttackSeperation_SpitAttack);
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        DebugShowRange(Canvas, "Tail Range          :", Seperation, AttackSeperation_TailSting);
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        DebugShowRange(Canvas, "Reactive Tail Range :", Seperation, AttackSeperation_ReactiveTailSting);
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        DebugShowRange(Canvas, "Talon Range         :", Seperation, AttackSeperation_TalonAttackNormal);
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
        Canvas.DrawText("Enemy Seperation : " $ string(Seperation));
        Y += YL;
        HUD.Canvas.SetPos(X, Y);
    }
    //return;    
}

function DebugShowRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Description[8388609];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];

    // End:0x5D
    if(Outer.IsInRange(Range, Seperation))
    {
        Canvas.SetDrawColor(255, 0, 0);        
    }
    else
    {
        Canvas.SetDrawColor(255, 0, 255);
    }
    Canvas.DrawText(((((Description $ " (") $ string(Range.Min)) $ ", ") $ string(Range.Max)) $ ")");
    Canvas.SetDrawColor(0, 0, 255);
    //return;    
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
    Outer.EnableRotation(true);
    GotoState('BeginAttack');
    stop;                    
}

state BeginAttack
{Begin:

    StopAttackEvaluater();
    AbortMove();
    // End:0x43
    if(!IsMyEnemyAlive())
    {
        Outer.PopCommand(self);
    }
    GotoState('StateAttackOnGround');
    stop;            
}

state StateAttackOnGround
{
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

    function InInRangeForReactiveAttackAtStart()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float Seperation;

        Seperation = EnemySeperation2D();
        return ((IsInPositionForTailSwingAttack(Seperation)) || IsInPositionForReactiveTailSting(Seperation)) || IsInRangeForTalonAttack(Seperation);
        //return ReturnValue;        
    }
Begin:

    Outer.SpitterPawn.DisableTailIKImmediate();
    Outer.SetAttackResourceNames();
    Outer.SpitterPawn.ForceCloseDodgeWindows(EnemyForAttack);
    Outer.Sleep(0.0100000);
    // End:0x152
    if(!InInRangeForReactiveAttackAtStart())
    {
        TauntOnSightingEnemy();
        Outer.EnableRotation(true);
        Outer.Focus = EnemyForAttack;
        Outer.CmdTurnToFaceFocus(0);
        Outer.EnableRotation(false);
    }
    StartAttackEvaluater();
    J0x15C:

    // End:0x189 [Loop If]
    if(IsMyEnemyAlive())
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x15C;
    }
    Outer.PopCommand(self);
    stop;            
}

state BackUp
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

    function GetBackUpTime()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return 2.0000000;
        //return ReturnValue;        
    }
Begin:

    BackUpTime = GetBackUpTime();
    // End:0xD6
    if(BackUpTime > float(0))
    {
        PauseAttackEvaluater(true);
        Outer.Focus = EnemyForAttack;
        Outer.CmdTurnToFaceFocus(0);
        Outer.CmdShortFlee(EnemyForAttack, BackUpTime);
        Outer.Sleep(0.0000000);
        PauseAttackEvaluater(false);
    }
    PopState();
    stop;            
}

state Stalk
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        PauseAttackEvaluater(false);
        SetStalkSpeedScale();
        bInIdlePause = false;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        SetAttackSpeedScale();
        Outer.SetCSA();
        bInIdlePause = false;
        //return;        
    }

    function GetEnemyTooFarDistance()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return AttackSeperation_SpitAttack.Max * 3.0000000;
        //return ReturnValue;        
    }

    event DelegateDynamicAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function MoveClose()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation;
        local /*0x97E50000-0x00000000*/ private float ReachDistance, FormationRadius;

        ResourceMultiLocation = LPAIResMultiLocation(GetPositionResource());
        // End:0xB0
        if(ResourceMultiLocation != none)
        {
            ReachDistance = ResourceMultiLocation.ReachDistance();
            FormationRadius = ResourceMultiLocation.GetFormationRadius();
            ManeuverForAttack(FormationRadius, FormationRadius + ReachDistance, EnemyForAttack);
        }
        //return;        
    }

    function ShouldBackUpDuringStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return FRand() < 0.5000000;
        //return ReturnValue;        
    }

    event NotifyAIResourceChanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

        ResourceAccess = SPAIResourceAccess(ResAccess);
        // End:0x65
        if((ResourceAccess != none) && ResourceAccess == Outer.RangedAccess)
        {
            bCanStalk = false;
        }
        return super(LPAICmd_Attack).NotifyAIResourceChanged(ResAccess);
        //return ReturnValue;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

        ResourceAccess = SPAIResourceAccess(ResAccess);
        // End:0x65
        if((ResourceAccess != none) && ResourceAccess == Outer.RangedAccess)
        {
            bCanStalk = false;
        }
        return super(SPAICommand).NotifyAIResourceAccessLost(ResAccess);
        //return ReturnValue;        
    }
Begin:

    // End:0x3D
    if(ShouldBackUpDuringStalk())
    {
        PushStateWithEnemyCheck('BackUpDuringStalk');
        Outer.Sleep(0.0000000);
    }
StartCircling:


    GetRangedAccess(EnemyForAttack);
    J0x51:

    // End:0x13B [Loop If]
    if(Outer.HaveRangedAccess())
    {
        bCanStalk = true;
        Outer.SetCSA(0);
        MoveClose();
        Outer.Sleep(0.0000000);
        // End:0x111
        if(bCanStalk)
        {
            MoveToAttackResourceLocation();
            Outer.Sleep(0.0000000);
            PushStateWithEnemyCheck('CircleDuringStalk');            
        }
        else
        {
            AbortMove();
        }
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x51;
    }
    GotoDefaultAttackState();
    stop;            
}

state CircleDuringStalk
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
        bCanStalk = true;
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
        AbortMove();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event NotifyAIResourceChanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

        ResourceAccess = SPAIResourceAccess(ResAccess);
        // End:0x65
        if((ResourceAccess != none) && ResourceAccess == Outer.RangedAccess)
        {
            bCanStalk = false;
        }
        return super(LPAICmd_Attack).NotifyAIResourceChanged(ResAccess);
        //return ReturnValue;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

        ResourceAccess = SPAIResourceAccess(ResAccess);
        // End:0x65
        if((ResourceAccess != none) && ResourceAccess == Outer.RangedAccess)
        {
            bCanStalk = false;
        }
        return super(SPAICommand).NotifyAIResourceAccessLost(ResAccess);
        //return ReturnValue;        
    }

    function FixUpTime()
    {
        local /*0x97E50000-0x00000000*/ private float Min[25165825], Max, Limit;

        Min = Abs(Min);
        Max = Abs(Max);
        Limit = Abs(Limit);
        // End:0x69
        if(Min > Limit)
        {
            Min = Limit;
        }
        // End:0x93
        if(Max > Limit)
        {
            Max = Limit;
        }
        // End:0xE3
        if(Max < Min)
        {
            Limit = Max;
            Max = Min;
            Min = Limit;
        }
        //return;        
    }

    function ShouldTurnToFace()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL RelativePosition, RelativeDirection, MyFacing;

        RelativePosition = EnemyForAttack.Location - Outer.SpitterPawn.Location;
        RelativePosition.Z = 0.0000000;
        RelativeDirection = Normal(RelativePosition);
        MyFacing = Vector(Outer.SpitterPawn.Rotation);
        // End:0xF3
        if((MyFacing Dot RelativeDirection) < 0.9238795)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function GetStalkPos()
    {
        local /*0x97E50000-0x00000000*/ private int InCurrentPosIndex[25165825], InNextPosIndex;
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689], Result;

        Result = GetNextStalkPositionIndex(InCurrentPosIndex, InNextPosIndex, 3, 10);
        // End:0x67
        if(int(Result) == int(0))
        {
            Result = GetNextStalkPositionIndex(InCurrentPosIndex, InNextPosIndex, 1, 10);
        }
        return Result;
        //return ReturnValue;        
    }

    event @NULL TouchWhileMoving()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return RanInToWhileCircling(Other, OtherComp, HitLocation, HitNormal);
        //return ReturnValue;        
    }

    event @NULL BumpWhileMoving()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL HitLocation;

        HitLocation = Other.Location;
        return RanInToWhileCircling(Other, OtherComp, HitLocation, HitNormal);
        //return ReturnValue;        
    }

    event @NULL RanInToWhileCircling()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x22
        if(LPPawn(Other) != none)
        {
            AbortMove();
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.SetCSA(3);
    bInIdlePause = false;
    DelayBeforeStalkMove = 0.0000000;
    LastStalkPosResult = 0;
    bStartCircle = true;
    J0x54:

    // End:0x229 [Loop If]
    if(bCanStalk && Outer.HaveRangedAccess())
    {
        switch(GetStalkPos(CurrentPosIndex, NextPosIndex))
        {
            // End:0x119
            case 1:
                // End:0xEE
                if((int(LastStalkPosResult) != int(1)) && !bStartCircle)
                {
                    AbortMove();
                    DelayBeforeStalkMove = 0.5000000;
                }
                MoveToStalkPos(NextPosIndex, DelayBeforeStalkMove);
                LastStalkPosResult = 1;
                // End:0x1FD
                break;
            // End:0x187
            case 2:
                // End:0x15C
                if((int(LastStalkPosResult) != int(2)) && !bStartCircle)
                {
                    AbortMove();
                    DelayBeforeStalkMove = 0.5000000;
                }
                MoveToStalkPos(NextPosIndex, DelayBeforeStalkMove);
                LastStalkPosResult = 2;
                // End:0x1FD
                break;
            // End:0xFFFF
            default:
                LastStalkPosResult = 0;
                Outer.SpitterPawn.ZeroMovementVariables();
                PushStateWithEnemyCheck('BackUpDuringStalk');
                Outer.Sleep(0.0000000);
                // End:0x1FD
                break;
                break;
        }
        Outer.Sleep(0.0000000);
        bStartCircle = false;
        // [Loop Continue]
        goto J0x54;
    }
    PopState();
    stop;                
}

state BackUpDuringStalk extends BackUp
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function GetBackUpTime()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Time;

        Time = TimeToNextAttack(AttackSelection);
        Time = RandRange(0.1000000, 0.2000000) * Time;
        // End:0x67
        if(Time > float(2))
        {
            Time = 2.0000000;
        }
        return Time;
        //return ReturnValue;        
    }
    stop;    
}

state SpitAttack
{
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
        Outer.ReleaseStrikeAccess();
        Outer.ReleaseRangedAccess();
        //return;        
    }

    function GetEnemyTooFarDistance()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return AttackSeperation_SpitAttack.Max * 3.0000000;
        //return ReturnValue;        
    }

    event DelegateDynamicAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function ShouldFire()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x9D
        if(bDisableStrafing || Outer.IsInRangeMax(AttackSeperation_SpitAttack, EnemySeperation2D()))
        {
            // End:0x7D
            if(!Outer.HaveStrikeAccess())
            {
                GetStrikeAccess(EnemyForAttack);
            }
            return Outer.HaveStrikeAccess();
        }
        return false;
        //return ReturnValue;        
    }

    function MoveClose()
    {
        ManeuverForAttack(AttackSeperation_SpitAttack.Min, AttackSeperation_SpitAttack.Max, EnemyForAttack);
        //return;        
    }

    function MoveToLosPosition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack;
        local /*0x97E50000-0x00000000*/ private int Idx;

        // End:0x127
        if(ValidLosPositionsCount > 0)
        {
            MovingToActor = false;
            // End:0x127
            if(IsMyEnemyAlive())
            {
                Idx = Class'SPEngine.SPUtil'.static.RandRangeInt(0, ValidLosPositionsCount - 1);
                PositionForAttack = ValidLosPositions[Idx];
                Outer.Focus = EnemyForAttack;
                Outer.EnableRotation(true);
                MoveToPosition(PositionForAttack, EnemyForAttack.Location, (Outer.MyKynapseRadius + MyEnemyRadius) * 1.2500000);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function MoveToFirePositionAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (MoveAbortCondition()) || !Outer.HaveRangedAccess() && ValidLosPositionsCount < 1;
        //return ReturnValue;        
    }
Begin:

    // End:0x38
    if(!Outer.HaveRangedAccess())
    {
        GetRangedAccess(EnemyForAttack);
    }
    // End:0x95
    if(!bDisableStrafing && Outer.HaveRangedAccess())
    {
        MoveToAttackResourceLocation();
        Outer.Sleep(0.0000000);        
    }
    else
    {
        // End:0xCB
        if(ValidLosPositionsCount > 0)
        {
            MoveToLosPosition();
            Outer.Sleep(0.0000000);
        }
    }
    // End:0x135
    if(IsMyEnemyAlive())
    {
        MoveClose();
        Outer.Sleep(0.0000000);
        // End:0x135
        if(ShouldFire())
        {
            Fire();
            Outer.ReleaseStrikeAccess();
        }
    }
    Outer.Sleep(0.0000000);
    GotoDefaultAttackState();
    stop;                
}

state BackUpBeforeSpit extends BackUp
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function GetBackUpTime()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(1.0000000, 2.5000000);
        //return ReturnValue;        
    }
    stop;    
}

state TailSting
{
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
        Outer.ReleaseStrikeAccess();
        AbortMove();
        //return;        
    }

    function MoveClose()
    {
        ManeuverForAttack(AttackSeperation_TailSting.Min, AttackSeperation_TailSting.Max, EnemyForAttack);
        //return;        
    }

    function GetAttackAccess()
    {
        // End:0x39
        if(!Outer.HaveStrikeAccess())
        {
            GetStrikeAccess(EnemyForAttack);
        }
        //return;        
    }

    function HaveAttackAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HaveStrikeAccess();
        //return ReturnValue;        
    }

    function DoTailSting()
    {
        Outer.CmdTailSting(EnemyForAttack, AttackSelection.TimeBetweenHunkerAndSting);
        //return;        
    }

    function ShouldMoveAwayAfterAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (IsEnabledStalk()) && IsInPositionForTailSting();
        //return ReturnValue;        
    }

    protected function CanTryReactiveTailSting()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        // End:0x56
        /*@Error*/;
        // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 2 & Type:If Position:0x056
        // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
        // 2 & Type:If Position:0x056
    }
Begin:

    GetAttackAccess();
    // End:0xC8
    if((IsEnabledTailSting()) && HaveAttackAccess())
    {
        MoveClose();
        Outer.Sleep(0.0000000);
        DoTailSting();
        Outer.Sleep(0.0000000);
        Outer.ReleaseStrikeAccess();
        // End:0xC8
        if(ShouldMoveAwayAfterAttack())
        {
            MoveToAttackResourceLocation();
            Outer.Sleep(0.0000000);
        }
    }
    GotoDefaultAttackState();
    stop;        
}

state TailStingQuick extends TailSting
{
    function DoTailSting()
    {
        RepeatCount = Class'SPEngine.SPUtil'.static.RandRangeInt(TailStingQuick_RepeatCount_Min, TailStingQuick_RepeatCount_Max);
        Outer.CmdTailStingQuick(EnemyForAttack, AttackSelection.TimeBetweenHunkerAndSting, RepeatCount);
        //return;        
    }
    stop;    
}

state TailStingReactive extends TailSting
{
    ignores MoveClose, GetAttackAccess;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        PauseAttackEvaluater(true);
        ResetTauntTime();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super.EndState(NextState);
        PauseAttackEvaluater(false);
        //return;        
    }

    function IsMoving()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function IsTimeForNextTailSting()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function HaveAttackAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function DoTailSting()
    {
        Outer.CmdTailSting(EnemyForAttack, 0.0000000, true);
        //return;        
    }

    function ShouldMoveAwayAfterAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryReactiveTailSting()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryTailSwingAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
    stop;    
}

state TalonAttack
{
    ignores PreStrike;

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
        AbortMove();
        //return;        
    }

    function MoveClose()
    {
        ManeuverForAttackTight(0.0000000, AttackSeperation_TalonAttackNormal.Max, EnemyForAttack);
        //return;        
    }

    function GetAttackAccess()
    {
        // End:0x39
        if(!Outer.HaveStrikeAccess())
        {
            GetStrikeAccess(EnemyForAttack);
        }
        //return;        
    }

    function HaveAttackAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HaveStrikeAccess();
        //return ReturnValue;        
    }

    function ShouldMoveAwayAfterAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (IsEnabledStalk()) && IsInPositionForTalonAttack();
        //return ReturnValue;        
    }

    function ShouldStop()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function DoTalonStrike()
    {
        // End:0x38
        if(IsInPositionForTalonAttack())
        {
            Outer.CmdTalonStrike(EnemyForAttack);
        }
        //return;        
    }

    function MoveToFirePositionAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return ((MoveAbortCondition()) || !Outer.HaveRangedAccess()) || IsTimeForNextAttack(AttackSelection);
        //return ReturnValue;        
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryReactiveTailSting()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
Begin:

    GetAttackAccess();
    // End:0xF5
    if((IsEnabledTalonAttack()) && HaveAttackAccess())
    {
        MoveClose();
        // End:0xD3
        if(IsInRangeForTalonAttack())
        {
            Outer.Sleep(0.0000000);
            PreStrike();
            J0x66:

            DoTalonStrike();
            // End:0x66
            if(!(ShouldStop()))
                goto J0x66;
            Outer.ReleaseStrikeAccess();
            // End:0xD0
            if(ShouldMoveAwayAfterAttack())
            {
                MoveToAttackResourceLocation();
                Outer.Sleep(0.0000000);
            }            
        }
        else
        {
            Outer.ReleaseStrikeAccess();
        }        
    }
    else
    {
        Outer.Sleep(0.0010000);
    }
    GotoDefaultAttackState();
    stop;                
}

state TalonAttackQuick extends TalonAttack
{
    function ShouldStop()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (RepeatCount <= 0) || !IsInPositionForTalonAttack();
        //return ReturnValue;        
    }

    function PreStrike()
    {
        RepeatCount = Class'SPEngine.SPUtil'.static.RandRangeInt(TalonAttackQuick_RepeatCount_Min, TalonAttackQuick_RepeatCount_Max);
        //return;        
    }

    function DoTalonStrike()
    {
        Outer.CmdTalonStrike(EnemyForAttack);
        --RepeatCount;
        //return;        
    }
    stop;    
}

state TalonAttackReactive extends TalonAttack
{
    ignores MoveClose, GetAttackAccess;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        PauseAttackEvaluater(true);
        ResetTauntTime();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super.EndState(NextState);
        PauseAttackEvaluater(false);
        //return;        
    }

    function IsMoving()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function IsTimeForNextTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function HaveAttackAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function ShouldMoveAwayAfterAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryReactiveTailSting()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryTailSwingAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
    stop;    
}

state TailSwing
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        Outer.SpitterPawn.ZeroMovementVariables();
        AbortMove();
        Outer.EnableRotation(false);
        Outer.Focus = none;
        ResetTauntTime();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        Outer.SpitterPawn.ZeroMovementVariables();
        //return;        
    }

    function GetAttackAccess()
    {
        // End:0x39
        if(!Outer.HaveStrikeAccess())
        {
            GetStrikeAccess(EnemyForAttack);
        }
        //return;        
    }

    function HaveAttackAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HaveStrikeAccess();
        //return ReturnValue;        
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryReactiveTailSting()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryTailSwingAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
    J0x00:
    // End:0xD7 [Loop If]
    if(true)
    {
        GetAttackAccess();
        // End:0xB7
        if(((IsEnabledTailSwingAttack()) && IsTimeForNextTailSwingAttack()) && HaveAttackAccess())
        {
            Outer.CmdTailSwingStrike(EnemyForAttack);
            Outer.ReleaseStrikeAccess();
            Outer.SpitterPawn.ZeroMovementVariables();
        }
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

state ChargeAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        Outer.SpitterPawn.ZeroMovementVariables();
        AbortMove();
        Outer.EnableRotation(false);
        Outer.Focus = none;
        ResetTauntTime();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        Outer.SpitterPawn.ZeroMovementVariables();
        //return;        
    }

    function GetAttackAccess()
    {
        // End:0x39
        if(!Outer.HaveStrikeAccess())
        {
            GetStrikeAccess(EnemyForAttack);
        }
        //return;        
    }

    function HaveAttackAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HaveStrikeAccess();
        //return ReturnValue;        
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryReactiveTailSting()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }

    protected function CanTryTailSwingAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
    J0x00:
    // End:0x98 [Loop If]
    if(true)
    {
        GetAttackAccess();
        // End:0x78
        if(HaveAttackAccess())
        {
            StartCommandForChargeAttack();
            Outer.ReleaseStrikeAccess();
            Outer.SpitterPawn.ZeroMovementVariables();
        }
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                
}

state WithdrawForChargeAtEnemy
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

    event PoppedState()
    {
        Outer.LockStrikeAccess(false);
        Outer.SpitterPawn.ZeroMovementVariables();
        Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.LockStrikeAccess(false);
        Outer.SpitterPawn.ZeroMovementVariables();
        Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function DelegateMovingToChargePointAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x61
        if(((Obstacle == EnemyForAttack) || Obstacle == Outer.myAIPawn) || LPBaseVSPlayerPawn(Obstacle) != none)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function StartCommandForMovingToChargePoint()
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        MovingToActor = false;
        // End:0x2D8
        if(IsMyEnemyAlive())
        {
            Outer.Focus = EnemyForAttack;
            MoveToPositionCmd = Outer.CmdMoveToPosition(WithdrawForChargePoint,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToChargePoint);
            MoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
            MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.SpitterPawn.TuneDataSpitter.DurationBetweenMovementDeltaDuringWithdrawForCharge.GetValue(), Outer.SpitterPawn.TuneDataSpitter.MinMovementDeltaDuringWithdrawForCharge.GetValue(), Outer.SpitterPawn.TuneDataSpitter.DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts.GetValue(), NotifyOfFailedMovementToChargePoint);
            IsManeuvering = true;
        }
        //return;        
    }

    function NotifyOfFailedMovementToChargePoint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x38
        if(MoveToPositionCmd != none)
        {
            Outer.AbortCommand(MoveToPositionCmd);
        }
        return true;
        //return ReturnValue;        
    }

    function TryFindingWithDrawPoint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL sideOffset;
        local /*0x97E50000-0x00000000*/ private int ScaleFactor;
        local /*0x97E50000-0x00000000*/ private bool shiftLeft;
        local /*0x97E50000-0x00000000*/ private float ammountToScale;

        shiftLeft = false;
        // End:0x2B
        if((NumOfAttemptsToFindWithDrawPointThisAttack % 2) == 0)
        {
            shiftLeft = true;
        }
        ScaleFactor = (NumOfAttemptsToFindWithDrawPointThisAttack + 1) / 2;
        ammountToScale = float(ScaleFactor) * Outer.SpitterPawn.TuneDataSpitter.DistanceBetweenWithdrawPointsToCheck.GetValue();
        ammountToScale = ((shiftLeft) ? ammountToScale : -ammountToScale);
        // End:0x15D
        if(ammountToScale != float(0))
        {
            sideOffset = Class'SPEngine.SPUtil'.static.GetRightVector(Outer.SpitterPawn);
            sideOffset = sideOffset * ammountToScale;
        }
        NumOfAttemptsToFindWithDrawPointThisAttack++;
        return CalculateWithDrawPoint(sideOffset);
        //return ReturnValue;        
    }

    function CalculateWithDrawPoint()
    {
        local /*0x97E50000-0x00000000*/ private @NULL sideOffset[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL displacementToWithDrawPoint;
        local /*0x97E50000-0x00000000*/ private float distanceAwayTheWithdrawPointShouldBe;
        local /*0x97E50000-0x00000000*/ private editfixedsize array LosIgnoreActor;
        local /*0x97E50000-0x00000000*/ private @NULL LosHitActor;

        displacementToWithDrawPoint = Outer.SpitterPawn.Location - EnemyForAttack.Location;
        displacementToWithDrawPoint = Normal(displacementToWithDrawPoint);
        displacementToWithDrawPoint.Z = 0.0000000;
        distanceAwayTheWithdrawPointShouldBe = Outer.GetMinDistanceAwayToStartChargingStrike(EnemyForAttack);
        distanceAwayTheWithdrawPointShouldBe += (((Outer.MyKynapseRadius * float(2)) + (MyEnemyRadius * float(2))) + Outer.SpitterPawn.TuneDataSpitter.ExtraBufferToAddToTheWithdrawDistance.GetValue());
        displacementToWithDrawPoint = displacementToWithDrawPoint * distanceAwayTheWithdrawPointShouldBe;
        WithdrawForChargePoint = displacementToWithDrawPoint + EnemyForAttack.Location;
        WithdrawForChargePoint = WithdrawForChargePoint + sideOffset;
        // End:0x2D6
        if(Outer.IsDestinationInsideAiMesh(WithdrawForChargePoint))
        {
            LosIgnoreActor.AddItem(Outer.myAIPawn);            
            LosIgnoreActor.AddItem(EnemyForAttack);            
            LosHitActor = LosTestForPawn(Outer.myAIPawn.Location, WithdrawForChargePoint, Outer.MyKynapseRadius * 0.2500000, LosIgnoreActor);
            // End:0x2D4
            if(LosHitActor == none)
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function CanRestartBehavioursAfterWithdarAndCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    StopAttackEvaluater();
    NumOfAttemptsToFindWithDrawPointThisAttack = 0;
    // End:0x56
    if(Outer.ShouldShowChargeAndWithDrawPointArtifacts())
    {
        Outer.FlushPersistentDebugLines();
    }
    J0x56:

    // End:0x318 [Loop If]
    if(float(NumOfAttemptsToFindWithDrawPointThisAttack) < Outer.SpitterPawn.TuneDataSpitter.NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt.GetValue())
    {
        // End:0x2F8
        if(TryFindingWithDrawPoint())
        {
            Outer.LockStrikeAccess(true);
            Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.WithdrawForChargeMaxSpeedScale.GetValue());
            StartCommandForMovingToChargePoint();
            IsManeuvering = false;
            GetStrikeAccess(EnemyForAttack);
            // End:0x2C8
            if(Outer.HaveStrikeAccess())
            {
                StartCommandForChargeAttack();
                Outer.SpitterPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.SpitterPawn));
                Outer.ReleaseStrikeAccess();
                Outer.SpitterPawn.ZeroMovementVariables();
            }
            Outer.Sleep(0.0100000);
            GotoStateWithEnemyCheck('StateCmdActive');
        }
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x56;
    }
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;                
}

state MoveCloser
{
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
        ResetTauntTime();
        //return;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x80
        if(ResourceAccess == Outer.MeleeAccess)
        {
            Outer.AbortCommand(MoveToPositionCmd);
            MoveToPositionCmd = none;
            Outer.MeleeAccess = none;
        }
        return false;
        //return ReturnValue;        
    }

    function MoveClose()
    {
        local /*0x97E50000-0x00000000*/ private float MinDist, MaxDist;

        MinDist = (GetEnemyTooFarDistance()) * 0.5000000;
        MaxDist = (GetEnemyTooFarDistance()) * 0.9000000;
        ManeuverForAttack(MinDist, MaxDist, EnemyForAttack, false);
        //return;        
    }
    J0x00:
    // End:0x2E [Loop If]
    if(true)
    {
        MoveClose();
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;        
}

state BackUpDuringDoNothing extends BackUp
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function GetBackUpTime()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Time;

        Time = TimeToNextAttack(AttackSelection);
        return Time;
        //return ReturnValue;        
    }
    stop;    
}

state TauntDuringAttack
{Begin:

    PauseAttackEvaluater(false);
    // End:0xFF
    if(IsMyEnemyAlive())
    {
        Outer.SpitterPawn.ZeroMovementVariables();
        Outer.Focus = EnemyForAttack;
        Outer.EnableRotation(true);
        Outer.CmdTurnToFaceFocus(1);
        Outer.Sleep(0.0000000);
        Outer.EnableRotation(false);
        TauntBetweenAttacks();
    }
    GotoDefaultAttackState();
    stop;            
}

state DoNothing
{
    function MoveToHidePosition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack;
        local /*0x97E50000-0x00000000*/ private int Idx;

        // End:0x148
        if(ValidHidePositionsCount > 0)
        {
            MovingToActor = false;
            // End:0x148
            if(IsMyEnemyAlive())
            {
                Idx = Class'SPEngine.SPUtil'.static.RandRangeInt(0, ValidHidePositionsCount - 1);
                PositionForAttack = ValidHidePositions[Idx];
                Outer.Focus = EnemyForAttack;
                Outer.EnableRotation(true);
                MoveToPosition(PositionForAttack, EnemyForAttack.Location, (Outer.MyKynapseRadius + MyEnemyRadius) * 1.2500000);
                MoveToPositionCmd.bZeroVelocityOnFinish = true;
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function MoveToFirePositionAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return MoveAbortCondition();
        //return ReturnValue;        
    }
Begin:

    PauseAttackEvaluater(false);
    J0x0B:

    // End:0x1AA [Loop If]
    if(true)
    {
        Outer.EnableRotation(false);
        Outer.SpitterPawn.ZeroMovementVariables();
        Outer.Focus = EnemyForAttack;
        Outer.EnableRotation(true);
        Outer.CmdTurnToFaceFocus(1);
        Outer.Sleep(0.0000000);
        Outer.EnableRotation(false);
        // End:0x145
        if(ValidHidePositionsCount > 0)
        {
            MoveToHidePosition();
            Outer.Sleep(0.0000000);            
        }
        else
        {
            // End:0x15B
            if(FRand() < 0.2500000)
            {
                FakeFire();
            }
        }
        Outer.EnableRotation(false);
        Outer.Sleep(RandRange(1.0000000, 2.0000000));
        // [Loop Continue]
        goto J0x0B;
    }
    stop;        
}

state BackAway
{Begin:

    PauseAttackEvaluater(false);
    Outer.Focus = EnemyForAttack;
    Outer.CmdTurnToFaceFocus(0);
    BackUpTime = TimeToNextAttack(AttackSelection);
    Outer.CmdShortFlee(EnemyForAttack, BackUpTime);
    J0xA6:

    // End:0x1B8 [Loop If]
    if(true)
    {
        Outer.SpitterPawn.ZeroMovementVariables();
        Outer.Focus = EnemyForAttack;
        Outer.CmdTurnToFaceFocus(0);
        Outer.Sleep(RandRange(2.0000000, 3.0000000));
        // End:0x16F
        if(FRand() < 0.2500000)
        {
            FakeFire();            
        }
        else
        {
            TauntBetweenAttacks();
        }
        Outer.CmdShortFlee(EnemyForAttack, TimeToNextAttack(AttackSelection));
        // [Loop Continue]
        goto J0xA6;
    }
    stop;                
}

defaultproperties
{
    bAttackEvaluaterEnabled=true
    bEnabledReactiveTailSwing=true
    bEnabledReactiveTailSting=true
    bEnabledReactiveTalon=true
    bLosTraversalFinished=true
    bHideTraversalFinished=true
    TimeOfLastLosTraversal=-9999.0000000
    TimeOfLastHideTraversal=-9999.0000000
}