class LPAICmd_Melee extends LPAICmd_Attack within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool IsManeuvering[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldStalk[537001985];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool MovingToActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanStrikeBeforeReachingMeleeSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeStatus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ACosHorizAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ACosVertAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAttackRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAttackRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HorizAngRangeInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VertAngRangeInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleePatternCenter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MeleePatternRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WaitPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedMoveTimer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeSlotPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToGiveUpTryingToStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToKeepTryingForStrike[131073];

function SetCanStrikeBeforeReachingMeleeSlot()
{
    local /*0x97E50000-0x00000000*/ private bool bCan[8388609];

    bCanStrikeBeforeReachingMeleeSlot = bCan;
    //return;    
}

function HasAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ResetAttackWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    //return;    
}

function SetMeleeExtents()
{
    MeleePatternCenter = EnemyForAttackLocation();
    MeleePatternRadius = MyEnemyRadius * float(2);
    //return;    
}

function Pushed()
{
    super.Pushed();
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(HorizAngRangeInDegrees, ACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(VertAngRangeInDegrees, ACosVertAngRange);
    //return;    
}

function Popped()
{
    super.Popped();
    OnExit();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function OnExit()
{
    Outer.ReleaseAllAttackAccess();
    // End:0x3A
    if(!LPAICmd_Status_HasFailed())
    {
        ResetAttackWaitTimer();
    }
    Outer.PawnZeroVelocity();
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xD2
    if(ResourceAccess == Outer.MeleeAccess)
    {
        // End:0x6F
        if(MoveToPositionCmd != none)
        {
            Outer.AbortCommand(MoveToPositionCmd);
            MoveToPositionCmd = none;
        }
        // End:0xB2
        if(MoveToActorCmd != none)
        {
            Outer.AbortCommand(MoveToActorCmd);
            MoveToActorCmd = none;
        }
        Outer.MeleeAccess = none;
    }
    // End:0x161
    if(ResourceAccess == Outer.StrikeAccess)
    {
        // End:0x141
        if(MoveToActorCmd != none)
        {
            Outer.AbortCommand(MoveToActorCmd);
            MoveToActorCmd = none;
        }
        Outer.StrikeAccess = none;
    }
    // End:0x1AD
    if(ResourceAccess == Outer.FeintAccess)
    {
        Outer.FeintAccess = none;
    }
    // End:0x1F9
    if(ResourceAccess == Outer.StruggleAccess)
    {
        Outer.StruggleAccess = none;
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyInAngularRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Displacement, Horiz, Vert, Forward;

    // End:0x171
    if(EnemyForAttack != none)
    {
        Displacement = (EnemyForAttackLocation()) - Outer.myAIPawn.Location;
        Horiz = Displacement;
        Horiz.Z = 0.0000000;
        Horiz = Normal(Horiz);
        Vert = Displacement;
        Vert.Y = 0.0000000;
        Vert = Normal(Vert);
        Forward = Vector(Outer.myAIPawn.Rotation);
        // End:0x171
        if((Horiz Dot Forward) > ACosHorizAngRange)
        {
            // End:0x171
            if((Vert Dot Forward) > ACosVertAngRange)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function AttackEnemy()
{
    Outer.bMeleeFinished = false;
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    MeleeStatus = LPAICmdStatus_Melee(ReturnStatus);
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(EnemyForAttack.InStruggleMode)
    {
        return false;
    }
    // End:0x56
    if(IsMyEnemyAlive())
    {
        // End:0x53
        if(HasAccessToStartAttack())
        {
            // End:0x50
            if(IsEnemyInAngularRange())
            {
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function HandleCanNotStrikeButInStrikeState()
{
    // End:0x5C
    if(!IsEnemyInAngularRange())
    {
        Outer.Focus = EnemyForAttack;
        Outer.CmdTurnToFaceFocus(1,, 1);
    }
    //return;    
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

function MoveToMeleeSlotAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !Outer.HaveMeleeAccess();
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

    return !IsManeuvering || int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);
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

    return !IsManeuvering || int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(2);
    //return ReturnValue;    
}

function IsMoving()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(MovingToActor)
    {
        return !HasMoveToActorSucceeded() && !HasMoveToActorFailed();        
    }
    else
    {
        return !HasMoveToSlotSucceeded() && !HasMoveToSlotFailed();
    }
    //return ReturnValue;    
}

function PopCommandWithMoveFaliure()
{
    LPAICmd_Attack_Status(3);
    Outer.PopCommand(self);
    //return;    
}

function PopCommandWithFaliure()
{
    LPAICmd_Attack_Status(1);
    Outer.PopCommand(self);
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
        Outer.PopCommand(self);
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

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MinAttackRange;
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MaxAttackRange;
    //return ReturnValue;    
}

function StartStandOffAnimation()
{
    //return;    
}

function EndStandOffAnimation()
{
    //return;    
}

function ManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
    local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool CheckForStrikeAccess[9437185];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    false
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    MovingToActor = true;
    // End:0x262
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        // End:0x262
        if(Seperation > AttackSeperationMax)
        {
            MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, FocusActor, AttackSeperationMin, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfManeuverForAttack);
            // End:0x1A5
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
            MoveToActorCmd.bZeroVelocityOnFinish = false;
            IsManeuvering = true;
        }
    }
    IsManeuvering = false;
    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldAttackInsteadOfMovingToMeleeSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetStopTypeForMoveToMeleeSlot()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Outer.myAIPawn.TuneDataAIPawn.StopTypeForMoveToMeleeSlot;
    //return ReturnValue;    
}

function ManeuverToSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedSubPos[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation, ResourceLocation, FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius, ReachDistance;
    local /*0x97E50000-0x00000000*/ private bool bCanMove;

    -1
    bCanMove = false;
    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    // End:0xC4
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x35E
    if(Access != none)
    {
        ResourceLocation = SPAIResLocation(Access.GetResource());
        // End:0x2AE
        if(ResourceLocation == none)
        {
            ResourceMultiLocation = LPAIResMultiLocation(Access.GetResource());
            // End:0x2AB
            if(ResourceMultiLocation != none)
            {
                ReachDistance = ResourceMultiLocation.ReachDistance();
                FormationCenter = ResourceMultiLocation.GetFormationCenter();
                FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
                // End:0x243
                if((SelectedSubPos >= 0) && SelectedSubPos < ResourceMultiLocation.NumPositions())
                {
                    MeleeSlotPosition = ResourceMultiLocation.GetPosition(SelectedSubPos);                    
                }
                else
                {
                    MeleeSlotPosition = ResourceMultiLocation.GetNearestWorldPosition(Outer.myAIPawn.Location);
                }
                bCanMove = true;
            }            
        }
        else
        {
            ReachDistance = ResourceLocation.ReachDistance();
            FormationCenter = ResourceLocation.GetFormationCenter();
            FormationConstraintRadius = ResourceLocation.GetFormationMoveConstraintRadius();
            MeleeSlotPosition = ResourceLocation.GetWorldPosition();
            bCanMove = true;
        }
    }
    // End:0x5F5
    if(bCanMove)
    {
        MovingToActor = false;
        // End:0x5E6
        if(IsMyEnemyAlive())
        {
            // End:0x5DA
            if(!ShouldAttackInsteadOfMovingToMeleeSlot())
            {
                MoveToPositionCmd = Outer.CmdMoveToPosition(MeleeSlotPosition, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, GetStopTypeForMoveToMeleeSlot());
                MoveToPositionCmd.SetMovementZDiffAllowanceFactor(Outer.myAIPawn.TuneDataAIPawn.DefaultMovementZDiffAllowanceFactor.GetValue());
                MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToMeleeSlotAbortCondition;
                MoveToPositionCmd.bZeroVelocityOnFinish = false;
                MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                MoveToPositionCmd.AddAreaConstraint(FormationCenter, FormationConstraintRadius, Outer.MyHeight);
                // End:0x5BA
                if(ShouldFaceEnemyWhileMovingToSlot())
                {
                    Outer.Focus = EnemyForAttack;                    
                }
                else
                {
                    Outer.Focus = none;
                }
            }
            IsManeuvering = true;
        }
        IsManeuvering = false;        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
    }
    //return;    
}

final function StartLookForAttackOpportunityWhileMovingTimer()
{
    // End:0x74
    if(!IsLookForAttackOpportunityWhileMovingTimerActive())
    {
        TimeStartedMoveTimer = Outer.WorldInfo.TimeSeconds;
        Outer.SetTimer(0.0400000, true, 'LookForAttackOpportunityWhileMovingTimer', self);
    }
    //return;    
}

final function StopLookForAttackOpportunityWhileMovingTimer()
{
    Outer.ClearTimer('LookForAttackOpportunityWhileMovingTimer', self);
    //return;    
}

function PauseLookForAttackOpportunityWhileMovingTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopLookForAttackOpportunityWhileMovingTimer();        
    }
    else
    {
        StartLookForAttackOpportunityWhileMovingTimer();
    }
    //return;    
}

final function IsLookForAttackOpportunityWhileMovingTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('LookForAttackOpportunityWhileMovingTimer', self);
    //return ReturnValue;    
}

private final function LookForAttackOpportunityWhileMovingTimer()
{
    // End:0x0F
    if(IsAnyChildEngagedInCommittedBehavior())
    {
        return;
    }
    LookForAttackOpportunityWhileMoving();
    //return;    
}

function LookForAttackOpportunityWhileMoving()
{
    //return;    
}

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

function OptionalResetTimersAtStart()
{
    //return;    
}

function HandlePassingToCloseToEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];

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

    Outer.SetAttackResourceNames();
    SetMeleeExtents();
    J0x29:

    // End:0x56 [Loop If]
    if(IsMyEnemyAlive())
    {
        OptionalResetTimersAtStart();
        GotoStateWithEnemyCheck('MoveCloserToEnemy');
        // [Loop Continue]
        goto J0x29;
    }
    Outer.PopCommand(self);
    stop;        
}

state MoveToActor
{
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
    stop;    
}

state MoveCloserToEnemy extends MoveToActor
{Begin:

    // End:0x37
    if(bCanStrikeBeforeReachingMeleeSlot)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0x37
        if(HasAccessToStartAttack())
        {
            GotoStateWithEnemyCheck('BeginStrike');
        }
    }
    ManeuverForAttack(MeleePatternRadius + (Outer.MyKynapseRadius * float(3)), MeleePatternRadius + (Outer.MyKynapseRadius * float(4)), EnemyForAttack);
    J0xA9:

    // End:0xD6 [Loop If]
    if(IsMoving())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xA9;
    }
    // End:0xED
    if(HasMoveToActorFailed())
    {
        PopCommandWithMoveFaliure();
    }
    // End:0x124
    if(bCanStrikeBeforeReachingMeleeSlot)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0x124
        if(HasAccessToStartAttack())
        {
            GotoStateWithEnemyCheck('BeginStrike');
        }
    }
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;                    
}

state GetMeleeFormationClearence
{
    function GotoMeleeSlot()
    {
        GotoStateWithEnemyCheck('MoveToMeleeSlot');
        //return;        
    }

    function GotoWaitForMeleeSlot()
    {
        GotoStateWithEnemyCheck('WaitForClearence');
        //return;        
    }
Begin:

    Outer.ReleaseStrikeAccess();
    Outer.ReleaseFeintAccess();
    // End:0x80
    if(!Outer.HaveMeleeAccess())
    {
        GetMeleeAccess(EnemyForAttack);
        SetMeleeExtents();
    }
    // End:0xCC
    if(Outer.HaveMeleeAccess())
    {
        Outer.Sleep(0.0000000);
        GotoMeleeSlot();        
    }
    else
    {
        GotoWaitForMeleeSlot();
    }
    stop;        
}

state GetMeleeFormationClearenceOnFormationChange extends GetMeleeFormationClearence
{
    function GotoMeleeSlot()
    {
        GotoStateWithEnemyCheck('MoveToMeleeSlotOnFormationChange');
        //return;        
    }

    function GotoWaitForMeleeSlot()
    {
        GotoStateWithEnemyCheck('WaitForClearence');
        //return;        
    }
    stop;    
}

state GetMeleeFormationClearenceOnRetreat extends GetMeleeFormationClearence
{
    function GotoMeleeSlot()
    {
        GotoStateWithEnemyCheck('MoveToMeleeSlotOnRetreat');
        //return;        
    }

    function GotoWaitForMeleeSlot()
    {
        GotoStateWithEnemyCheck('WaitForClearence');
        //return;        
    }
    stop;    
}

state MoveToMeleeSlot extends MoveToActor
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StopLookForAttackOpportunityWhileMovingTimer();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StopLookForAttackOpportunityWhileMovingTimer();
        //return;        
    }

    function AttemptStrikeAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x26
        if(bCanStrikeBeforeReachingMeleeSlot)
        {
            GetStrikeAccessIfRequiredBeforeAttack();
            // End:0x26
            if(HasAccessToStartAttack())
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function ReGetMeleeAccess()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        //return;        
    }

    function DoneWithManeuverToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Sleep(0.1000000);
    // End:0x4B
    if(!Outer.HaveMeleeAccess())
    {
        ReGetMeleeAccess();
    }
    Outer.Sleep(0.0000000);
    // End:0x22E
    if(!AttemptStrikeAccess())
    {
        // End:0xA3
        if(Outer.bLookForAttackOpportunityWhileMovingToNonAttackLocations)
        {
            StartLookForAttackOpportunityWhileMovingTimer();
        }
        ManeuverToSlot(Outer.MeleeAccess);
        // End:0x221
        if(DoneWithManeuverToSlot())
        {
            J0xD9:

            // End:0x169 [Loop If]
            if(IsMoving())
            {
                Outer.Sleep(0.0100000);
                // End:0x166
                if(AttemptStrikeAccess())
                {
                    // End:0x153
                    if(MoveToPositionCmd != none)
                    {
                        Outer.AbortCommand(MoveToPositionCmd);
                        MoveToPositionCmd = none;
                    }
                    GotoStateWithEnemyCheck('BeginStrike');
                }
                // [Loop Continue]
                goto J0xD9;
            }
            StopLookForAttackOpportunityWhileMovingTimer();
            // End:0x1A4
            if(!Outer.HaveMeleeAccess())
            {
                ReGetMeleeAccess();                
            }
            else
            {
                // End:0x20B
                if(HasMoveToSlotFailed())
                {
                    // End:0x1E2
                    if(!Outer.HaveMeleeAccess())
                    {
                        ReGetMeleeAccess();                        
                    }
                    else
                    {
                        Outer.ReleaseMeleeAccess();
                        ReGetMeleeAccess();
                    }
                }
            }
            GotoStateWithEnemyCheck('ReachedMeleeSlot');            
        }
        else
        {
            goto 'Begin';
        }        
    }
    else
    {
        GotoStateWithEnemyCheck('BeginStrike');
    }
    stop;            
}

state MoveToMeleeSlotOnFormationChange extends MoveToMeleeSlot
{
    function GetStopTypeForMoveToMeleeSlot()
    {
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

        return Outer.myAIPawn.TuneDataAIPawn.StopTypeForMoveToMeleeSlotOnFormationChange;
        //return ReturnValue;        
    }

    function ReGetMeleeAccess()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
        //return;        
    }
    stop;    
}

state MoveToMeleeSlotOnRetreat extends MoveToMeleeSlot
{
    function ReGetMeleeAccess()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnRetreat');
        //return;        
    }

    function AttemptStrikeAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state ReachedMeleeSlot
{Begin:

    Outer.PawnZeroVelocity();
    Outer.Sleep(0.0100000);
    // End:0x5F
    if(bShouldStalk)
    {
        GotoStateWithEnemyCheck('Stalk');        
    }
    else
    {
        GotoStateWithEnemyCheck('StartAttackFromMeleeSlot');
    }
    stop;        
}

state Stalk
{
    ignores StaticStalk_Start, StaticStalk_Stop, ProceeduralStalk_Start, PreMove, PreStalkToNextPosition, PostStalkToNextPosition;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ProceeduralStalk_Stop();
        StaticStalk_Stop();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        ProceeduralStalk_Stop();
        StaticStalk_Stop();
        //return;        
    }

    function StaticStalk_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HaveMeleeAccess();
        //return ReturnValue;        
    }

    function StaticStalk_ShouldWait()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StaticStalk_ShouldWaitBeforeExitState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function GotoPostStalkState()
    {
        // End:0x3A
        if(!Outer.HaveMeleeAccess())
        {
            GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');            
        }
        else
        {
            // End:0x73
            if(!Outer.HaveStrikeAccess())
            {
                GetStrikeAccess(EnemyForAttack);
            }
            // End:0xAB
            if(Outer.HaveStrikeAccess())
            {
                GotoStateWithEnemyCheck('StartAttackFromMeleeSlot');                
            }
            else
            {
                GotoStateWithEnemyCheck('StateCmdActive');
            }
        }
        //return;        
    }

    function ProceeduralStalk_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HaveMeleeAccess();
        //return ReturnValue;        
    }

    function ProceeduralStalk_ShouldWait()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function ProceeduralStalk_ShouldWaitBeforeExitState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function ProceeduralStalk_Stop()
    {
        Outer.PawnZeroVelocity();
        //return;        
    }

    function GetNextSubPosIndex()
    {
        local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL Res;

        // End:0xBC
        if(Outer.HaveMeleeAccess())
        {
            Res = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
            return Res.GetFarthestIndexFromPoint(Outer.myAIPawn.Location);
        }
        return -1;
        //return ReturnValue;        
    }

    function GetPosForSubPosIndex()
    {
        local /*0x97E50000-0x00000000*/ private int Index[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Res, pos;

        // End:0xAA
        if(Outer.HaveMeleeAccess())
        {
            Res = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
            // End:0xAA
            if(Res != none)
            {
                pos = Res.GetPosition(Index);
            }
        }
        return pos;
        //return ReturnValue;        
    }

    function StalkToNextPosition()
    {
        local /*0x97E50000-0x00000000*/ private int SubPosIndex;

        SubPosIndex = GetNextSubPosIndex();
        PreMove(SubPosIndex);
        ManeuverToSlot(Outer.MeleeAccess, SubPosIndex);
        //return;        
    }

    function ShouldDoProceeduralStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL Res;

        Res = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
        // End:0x7F
        if((Res != none) && Res.NumPositions() > 1)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function CanStartStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL Res;

        // End:0x14
        if(!bShouldStalk)
        {
            return false;            
        }
        else
        {
            // End:0x3D
            if(!Outer.HaveMeleeAccess())
            {
                return false;                
            }
            else
            {
                Res = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
                // End:0xBC
                if((Res == none) || Res.NumPositions() < 1)
                {
                    return false;
                }
            }
        }
        return true;
        //return ReturnValue;        
    }

    event NotifyAIResourceChanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess, Res;
        local /*0x97E50000-0x00000000*/ private bool bHandled, ReturnVal;

        ReturnVal = false;
        ResourceAccess = SPAIResourceAccess(ResAccess);
        bHandled = false;
        // End:0x10A
        if((ResourceAccess != none) && ResourceAccess == Outer.MeleeAccess)
        {
            Res = LPAIResMultiLocation(ResourceAccess.GetResource());
            // End:0x10A
            if(Res != none)
            {
                // End:0x10A
                if(Res.HasPosition(MeleeSlotPosition))
                {
                    Outer.bMeleePointMoved = false;
                    bHandled = true;
                }
            }
        }
        // End:0x14A
        if(!bHandled)
        {
            ReturnVal = super(LPAICmd_Attack).NotifyAIResourceChanged(ResAccess);
            GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        }
        return ReturnVal;
        //return ReturnValue;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bMeleeAccessLost;

        bMeleeAccessLost = ResourceAccess == Outer.MeleeAccess;
        super(LPAICmd_Melee).NotifyAIResourceAccessLost(ResourceAccess);
        // End:0x67
        if(bMeleeAccessLost)
        {
            GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        }
        return true;
        //return ReturnValue;        
    }

    function GetStopTypeForMoveToMeleeSlot()
    {
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

        return Outer.myAIPawn.TuneDataAIPawn.StopTypeForMoveToMeleeSlotWhileStalking;
        //return ReturnValue;        
    }

    function MoveToMeleeSlotAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return super(LPAICmd_Melee).MoveToMeleeSlotAbortCondition() || !ProceeduralStalk_CanContinue();
        //return ReturnValue;        
    }
Begin:

    // End:0x22
    if(!CanStartStalk())
    {
        GotoStateWithEnemyCheck('StartAttackFromMeleeSlot');
    }
    // End:0x59
    if(!Outer.HaveMeleeAccess())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
    }
    // End:0x73
    if(ShouldDoProceeduralStalk())
    {
        goto 'BeginProceeduralStalk';        
    }
    else
    {
        goto 'BeginStaticStalk';
    }
    J0x7D:

    Outer.ReleaseStrikeAccess();
    J0x9C:

    // End:0xC9 [Loop If]
    if(StaticStalk_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x9C;
    }
    StaticStalk_Start();
    J0xD3:

    // End:0x100 [Loop If]
    if(StaticStalk_CanContinue())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0xD3;
    }
    StaticStalk_Stop();
    J0x10A:

    // End:0x137 [Loop If]
    if(StaticStalk_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x10A;
    }
    GotoPostStalkState();
    J0x141:

    // End:0x165 [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x141;
    }
    J0x165:

    // End:0x192 [Loop If]
    if(ProceeduralStalk_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x165;
    }
    ProceeduralStalk_Start();
    J0x19C:

    // End:0x29C [Loop If]
    if(ProceeduralStalk_CanContinue())
    {
        Outer.Sleep(0.0000000);
        PreStalkToNextPosition();
        Outer.Sleep(0.0000000);
        StalkToNextPosition();
        Outer.Sleep(0.0000000);
        PostStalkToNextPosition();
        Outer.Sleep(0.0000000);
        J0x23B:

        // End:0x299 [Loop If]
        if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(1))
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x23B;
        }
        // [Loop Continue]
        goto J0x19C;
    }
    ProceeduralStalk_Stop();
    Outer.PawnZeroVelocity();
    J0x2C5:

    // End:0x2F2 [Loop If]
    if(ProceeduralStalk_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x2C5;
    }
    GotoPostStalkState();
    J0x2FC:

    // End:0x320 [Loop If]
    if(true)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x2FC;
    }
    stop;                
}

state StartAttackFromMeleeSlot
{
    function CanStartAttackFromMeleeSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function StartStikeBehavior()
    {
        GotoStateWithEnemyCheck('BeginStrike');
        //return;        
    }
Begin:

    // End:0x5C
    if(!CanStartAttackFromMeleeSlot())
    {
        Outer.Sleep(0.0010000);
        GotoStateWithEnemyCheck('ReachedMeleeSlot');
        Outer.Sleep(0.0010000);
    }
    TimeToGiveUpTryingToStrike = Outer.WorldInfo.TimeSeconds + TimeToKeepTryingForStrike;
    // End:0xDB
    if(!Outer.HaveMeleeAccess())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
    }
    J0xDB:

    // End:0x167 [Loop If]
    if(!HasAccessToStartAttack())
    {
        // End:0x121
        if(!Outer.HaveMeleeAccess())
        {
            GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
        }
        // End:0x138
        if(HasAttackWaitTimerExpired())
        {
            GetStrikeAccessIfRequiredBeforeAttack();
        }
        // End:0x164
        if(!HasAccessToStartAttack())
        {
            Outer.Sleep(0.0100000);
        }
        // [Loop Continue]
        goto J0xDB;
    }
    Outer.ReleaseMeleeAccess();
    StartStikeBehavior();
    stop;                
}

state BeginStrike
{Begin:

    GotoStateWithEnemyCheck('MoveToAttackRangeWithClearence');
    stop;                    
}

state ContinueStrike
{Begin:

    GotoStateWithEnemyCheck('MoveToAttackRangeWithClearence');
    stop;                    
}

state MoveToAttackRangeWithClearence extends MoveToActor
{Begin:

    // End:0x25
    if(!HasAccessToStartAttack())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');        
    }
    else
    {
        Outer.ReleaseMeleeAccess();
        ManeuverForAttack(GetMinAttackRange(), GetMaxAttackRange(), EnemyForAttack, true);
        J0x6C:

        // End:0x99 [Loop If]
        if(IsMoving())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x6C;
        }
        // End:0xD8
        if(HasMoveToActorFailed())
        {
            Outer.ReleaseStrikeAccess();
            GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        }
        Outer.Sleep(0.0000000);
        GotoStateWithEnemyCheck('StrikeWithClearence');
    }
    stop;                
}

state StrikeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super(SPStateObject).BeginState(PrevStateName);
        Outer.SetWantsNewEnemy(false);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.LockStrikeAccess(false);
        SetInterruptible(true);
        //return;        
    }

    function ShouldContinueToStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function PreAttack()
    {
        Outer.LockStrikeAccess(true);
        Outer.SetWantsNewEnemy(false);
        //return;        
    }

    function PostAttack()
    {
        Outer.LockStrikeAccess(false);
        ResetAttackWaitTimer();
        //return;        
    }

    function RetreatToMeleeSlot()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        //return;        
    }
Begin:

    // End:0x25
    if(!HasAccessToStartAttack())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');        
    }
    else
    {
        // End:0x136
        if(HasMoveToActorSucceeded())
        {
            // End:0xD4
            if(CanStrike())
            {
                // End:0xB1
                if(HasAttackWaitTimerExpired())
                {
                    PreAttack();
                    AttackEnemy();
                    J0x60:

                    // End:0xA4 [Loop If]
                    if(!Outer.IsMeleeAttackFinished())
                    {
                        Outer.Sleep(0.0000000);
                        // [Loop Continue]
                        goto J0x60;
                    }
                    PostAttack();                    
                }
                else
                {
                    Outer.SetWantsNewEnemy(true);
                }                
            }
            else
            {
                SetInterruptible(false);
                HandleCanNotStrikeButInStrikeState();
                Outer.Sleep(0.0000000);
                OptionalResetTimersAtStart();
                SetInterruptible(true);
                GotoState('StrikeWithClearence', 'Begin');
            }            
        }
        else
        {
            // End:0x192
            if(HasMoveToActorFailed())
            {
                Outer.ReleaseStrikeAccess();
                Outer.Sleep(0.1000000);
                GotoStateWithEnemyCheck('GetMeleeFormationClearence');
            }
        }
        Outer.Sleep(0.0000000);
        // End:0x1D2
        if(ShouldContinueToStrike())
        {
            GotoStateWithEnemyCheck('ContinueStrike');            
        }
        else
        {
            Outer.ReleaseStrikeAccess();
            Outer.Sleep(0.1000000);
            RetreatToMeleeSlot();
        }
    }
    stop;                
}

state WaitForClearence extends MoveToActor
{Begin:

    PopCommandWithFaliure();
    stop;        
}

defaultproperties
{
    MinAttackRange=50.0000000
    MaxAttackRange=100.0000000
    HorizAngRangeInDegrees=90.0000000
    VertAngRangeInDegrees=180.0000000
    TimeToKeepTryingForStrike=5.0000000
}