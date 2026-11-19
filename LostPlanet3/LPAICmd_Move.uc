class LPAICmd_Move extends LPAICommand within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool IsMoveInProgress[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool HasDestinationChanged[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUse2dDistanceChecks[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool NotifyMoveAboutToStartCompleted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool NotifyMoveEndedCompleted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool NotifyMoveAbortedCompleted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bZeroVelocityOnFinish[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseGrossProgressMonitor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsStuck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayedAnimatedStop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayMovingToStationaryOnAborted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFireWhileMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBumpHandledByDelegate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTouchHandledByDelegate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStartVelocity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte UpdateResult[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StopType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte OverwriteLookWhenStartMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DesiredSeperation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovementZDiffAllowanceFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MoveConstraint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myAIPawnLastPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastProgressMonitorUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeMovementStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterStartOfMovementBeforeMonitorStarts[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenMovementProgressMonitorUpdates[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinMovementDeltaForMonitor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinMovementDeltaForMonitorSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfFailedMovementMonitorDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToStartMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfCoreHitWhileMovingDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfNonCoreHitWhileMovingDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfMeleeHitSomethingNewWhileMovingDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfTouchWhileMovingDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfBumpWhileMovingDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PotentialFireTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxSpeedScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawnToPush[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentPlayerSeparation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartVelocity[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __MoveAbortDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __MoveAvoidanceDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnNotifyOfCoreHitWhileMovingDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnNotifyOfNonCoreHitWhileMovingDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnNotifyOfMeleeHitSomethingNewWhileMovingDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnNotifyOfTouchWhileMovingDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnNotifyOfBumpWhileMovingDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnNotifyOfFailedMovementMonitor__Delegate;

delegate MoveAbortDelegate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate MoveAvoidanceDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

// Export ULPAICmd_Move::execStopPathing(FFrame&, void* const)
protected native final function StopPathing();

// Export ULPAICmd_Move::execAddMoveConstraint(FFrame&, void* const)
protected native final function AddMoveConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewMoveConstraint[8388609];


}

// Export ULPAICmd_Move::execAddMultipleMoveConstraint(FFrame&, void* const)
protected native final function AddMultipleMoveConstraint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array NewMoveConstraints[8388609];


}

// Export ULPAICmd_Move::execRemoveMoveConstraint(FFrame&, void* const)
protected native final function RemoveMoveConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewMoveConstraint[8388609];


}

// Export ULPAICmd_Move::execRemoveAllMoveConstraint(FFrame&, void* const)
protected native final function RemoveAllMoveConstraint();

// Export ULPAICmd_Move::execShouldKynapseDynamicallyAvoid(FFrame&, void* const)
native event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

delegate OnNotifyOfCoreHitWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnNotifyOfNonCoreHitWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnNotifyOfMeleeHitSomethingNewWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate @NULL OnNotifyOfTouchWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate @NULL OnNotifyOfBumpWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnNotifyOfFailedMovementMonitor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DefaultMoveAbort()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DefaultMoveAvoidanceDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x8F
    if(int(Outer.WorldInfo.NetMode) != int(NM_Standalone))
    {
        LPP = LPPlayerPawn(Obstacle);
        // End:0x8F
        if(LPP != none)
        {
            // End:0x8F
            if(!LPP.IsAliveAndWell())
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    // End:0xBC
    if((int(Outer.myAIPawn.Physics) == int(0)) || int(Outer.myAIPawn.Physics) == int(7))
    {
        Outer.myAIPawn.SetMovementPhysics();
    }
    IsMoveInProgress = false;
    UpdateResult = 0;
    HasDestinationChanged = false;
    NotifyMoveAboutToStartCompleted = false;
    NotifyMoveEndedCompleted = false;
    NotifyMoveAbortedCompleted = false;
    NotifyOfCoreHitWhileMovingDelegate = None;
    NotifyOfNonCoreHitWhileMovingDelegate = None;
    NotifyOfMeleeHitSomethingNewWhileMovingDelegate = None;
    NotifyOfTouchWhileMovingDelegate = None;
    NotifyOfBumpWhileMovingDelegate = None;
    StopType = 0;
    bPlayedAnimatedStop = false;
    bPlayMovingToStationaryOnAborted = false;
    TimeToStartMove = 0.0000000;
    MaxSpeedScale = 0.0000000;
    Outer.DamageReceivedMoving = 0.0000000;
    PlayerPawnToPush = none;
    bUseStartVelocity = false;
    SelectPotentialFireTarget();
    //return;    
}

function Popped()
{
    super.Popped();
    OnMoveExit();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

protected function ResetMoveVars()
{
    IsMoveInProgress = false;
    HasDestinationChanged = false;
    DesiredSeperation = 0.0000000;
    bUse2dDistanceChecks = true;
    NotifyMoveAboutToStartCompleted = false;
    NotifyMoveEndedCompleted = false;
    NotifyMoveAbortedCompleted = false;
    bIsStuck = false;
    bPlayedAnimatedStop = false;
    bUseStartVelocity = false;
    //return;    
}

event OnMoveExit()
{
    // End:0x17
    if(IsMoveInProgress)
    {
        NotifyMoveAbortedInternal();
    }
    GotoState('None');
    Outer.ScriptedFocus = none;
    StopMonitorTimer();
    StopPathing();
    MoveConstraint.Length = 0;
    PlayerPawnToPush = none;
    // End:0x118
    if((Outer.myAIPawn != none) && Outer.myAIPawn.TransitionComponent != none)
    {
        Outer.myAIPawn.TransitionComponent.DisableMovingToStationaryTransition();
    }
    // End:0x14B
    if(int(OverwriteLookWhenStartMoving) != int(0))
    {
        Outer.RestoreMoveLookingMode();
    }
    //return;    
}

function SetStartVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL InStartVelocity[8388609];

    // End:0x3A
    if(InStartVelocity != vect(0.0000000, 0.0000000, 0.0000000))
    {
        bUseStartVelocity = true;
        StartVelocity = InStartVelocity;
    }
    //return;    
}

event AddAreaConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[8388609];
    local /*0x97E50000-0x00000000*/ private float Radius[8388609], Height;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Constraint;

    Constraint = LPKyConstraintLocations(Class'LPKyConstraintLocations'.static.InitConstraint(Outer));
    // End:0x97
    if(Constraint != none)
    {
        Constraint.SetPosition(Position, Radius, Height);
        AddMoveConstraint(Constraint);
    }
    return Constraint;
    //return ReturnValue;    
}

event AddActorConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private float Radius[9437185], Height;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Constraint;

    -1.0000000
    -1.0000000
    Constraint = none;
    // End:0xC3
    if(TheActor != none)
    {
        Constraint = LPKyConstraintActors(Class'LPKyConstraintActors'.static.InitConstraint(Outer));
        // End:0xC3
        if(Constraint != none)
        {
            Constraint.SetActor(TheActor, Radius, Height);
            AddMoveConstraint(Constraint);
        }
    }
    return Constraint;
    //return ReturnValue;    
}

function SetMaxSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[8388609];

    MaxSpeedScale = InMaxSpeedScale;
    //return;    
}

function SetTimeDelayBeforeMove()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];

    // End:0x71
    if(inTime > float(0))
    {
        TimeToStartMove = Outer.myAIPawn.WorldInfo.TimeSeconds + inTime;        
    }
    else
    {
        TimeToStartMove = 0.0000000;
    }
    //return;    
}

final function NotifyDestinationChange()
{
    // End:0x19
    if(IsMoveInProgress)
    {
        HasDestinationChanged = true;
    }
    //return;    
}

final function IsPawnAbleToMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x73
    if(((Outer.myAIPawn != none) && Outer.myAIPawn.myKynapseHandle != none) && IsDesiredDestinationReachable())
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

final function Vector2Str()
{
    local /*0x97E50000-0x00000000*/ private @NULL V[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return ((((("(" $ string(V.X)) $ ", ") $ string(V.Y)) $ ", ") $ string(V.Z)) $ ")";
    //return ReturnValue;    
}

function DestinationAsStr()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "";
    //return ReturnValue;    
}

private final function NotifyMoveAboutToStartInternal()
{
    NotifyMoveAboutToStartCompleted = false;
    NotifyMoveAboutToStart();
    // End:0x26
    if(NotifyMoveAboutToStartCompleted == false)
    {
    }
    //return;    
}

private final function NotifyMoveEndedInternal()
{
    NotifyMoveEndedCompleted = false;
    NotifyMoveEnded();
    // End:0x26
    if(NotifyMoveEndedCompleted == false)
    {
    }
    LPAICmd_Move_Status(2);
    //return;    
}

protected function NotifyMoveAbortedInternal()
{
    NotifyMoveAbortedCompleted = false;
    NotifyMoveAborted();
    // End:0x26
    if(NotifyMoveAbortedCompleted == false)
    {
    }
    LPAICmd_Move_Status(5);
    //return;    
}

final function LPAICmd_Move_Status()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    // End:0x7D
    if((LPAICmdStatus_Move(CmdStatus) != none) && int(LPAICmdStatus_Move(CmdStatus).Cmd_Move_Error) < int(3))
    {
        LPAICmdStatus_Move(CmdStatus).Cmd_Move_Error = NewStatus;
    }
    // End:0x9D
    if(int(NewStatus) >= int(3))
    {
        LPAICmd_Status(1);
    }
    //return;    
}

function SetDesiredSeperation()
{
    local /*0x97E50000-0x00000000*/ private float Dist[8388609];

    // End:0x27
    if(Dist >= float(0))
    {
        DesiredSeperation = Dist;        
    }
    //return;    
}

function SetShouldUse2dDistanceChecks()
{
    local /*0x97E50000-0x00000000*/ private bool bUse2d[8388609];

    bUse2dDistanceChecks = bUse2d;
    //return;    
}

function SetMovementZDiffAllowanceFactor()
{
    local /*0x97E50000-0x00000000*/ private float NewMovementZDiffAllowanceFactor[8388609];

    MovementZDiffAllowanceFactor = NewMovementZDiffAllowanceFactor;
    //return;    
}

function SetStopAtDestinationType()
{
    local /*0x97E50000-0x00000000*/ private byte InStopType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ActorToFace[8388609];

    // End:0x1C2
    if(Outer.myAIPawn.TransitionComponent != none)
    {
        StopType = InStopType;
        switch(StopType)
        {
            // End:0xB3
            case 2:
                Outer.myAIPawn.TransitionComponent.EnableMovingToStationaryTransition(3, none);
                // End:0x1C2
                break;
            // End:0x107
            case 3:
                Outer.myAIPawn.TransitionComponent.EnableMovingToStationaryTransition(1, none);
                // End:0x1C2
                break;
            // End:0x163
            case 4:
                Outer.myAIPawn.TransitionComponent.EnableMovingToStationaryTransition(4, ActorToFace);
                // End:0x1C2
                break;
            // End:0x1BF
            case 5:
                Outer.myAIPawn.TransitionComponent.EnableMovingToStationaryTransition(2, ActorToFace);
                // End:0x1C2
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function CheckAnimationTransitionRequirements()
{
    local /*0x97E50000-0x00000000*/ private byte InResult[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(Outer.myAIPawn.TransitionComponent == none)
    {
        return true;
    }
    // End:0x89
    if(Outer.myAIPawn.TransitionComponent.IsDoingTransition())
    {
        return false;
    }
    // End:0xB0
    if((int(InResult) == int(2)) && !bPlayMovingToStationaryOnAborted)
    {
        return true;
    }
    // End:0xC6
    if(int(StopType) == int(0))
    {
        return true;
    }
    // End:0x15E
    if(int(StopType) == int(1))
    {
        Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        return true;
    }
    // End:0x16D
    if(bPlayedAnimatedStop)
    {
        return true;
    }
    // End:0x1C5
    if(SPMovementTransitionComponentAI(Outer.myAIPawn.TransitionComponent).TryToForce_MovingToStationary(false))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event MovementTransitionFinished()
{
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTransitionAborted[8388609];

    // End:0x20
    if(int(Type) == int(5))
    {
        bPlayedAnimatedStop = true;
    }
    //return;    
}

final function SetMovementMonitorParameters()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldUseGrossProgressMonitor[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeBetweenUpdates[8388609], MinMovementDelta, DelayAfterStartBeforeMonitorStarts;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOfFailedMovement[8388609];

    bUseGrossProgressMonitor = bShouldUseGrossProgressMonitor;
    TimeBetweenMovementProgressMonitorUpdates = TimeBetweenUpdates;
    MinMovementDeltaForMonitor = MinMovementDelta;
    DelayAfterStartOfMovementBeforeMonitorStarts = DelayAfterStartBeforeMonitorStarts;
    NotifyOfFailedMovementMonitorDelegate = NotifyOfFailedMovement;
    MinMovementDeltaForMonitorSq = MinMovementDeltaForMonitor * MinMovementDeltaForMonitor;
    //return;    
}

private final function DummyMoveCall()
{
    //return;    
}

final function SetNotifyOfCoreHitWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    NotifyOfCoreHitWhileMovingDelegate = InDelegate;
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(NotifyOfCoreHitWhileMovingDelegate != none)
    {
        return OnNotifyOfCoreHitWhileMovingDelegate(HitCoreIndex, AmountOfDamage, TypeOfDamage);
    }
    return false;
    //return ReturnValue;    
}

final function SetNotifyOfNonCoreHitWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    NotifyOfNonCoreHitWhileMovingDelegate = InDelegate;
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x35
    if(NotifyOfCoreHitWhileMovingDelegate != none)
    {
        return OnNotifyOfNonCoreHitWhileMovingDelegate(AmountOfDamage, TypeOfDamage);
    }
    return false;
    //return ReturnValue;    
}

final function SetNotifyOfMeleeHitSomethingNewWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    NotifyOfMeleeHitSomethingNewWhileMovingDelegate = InDelegate;
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x2B
    if(NotifyOfMeleeHitSomethingNewWhileMovingDelegate != none)
    {
        OnNotifyOfMeleeHitSomethingNewWhileMovingDelegate(Info);
    }
    //return;    
}

final function SetNotifyOfTouchWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    NotifyOfTouchWhileMovingDelegate = InDelegate;
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    bTouchHandledByDelegate = false;
    // End:0x5D
    if(NotifyOfTouchWhileMovingDelegate != none)
    {
        bTouchHandledByDelegate = OnNotifyOfTouchWhileMovingDelegate(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

final function SetNotifyOfBumpWhileMovingDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    NotifyOfBumpWhileMovingDelegate = InDelegate;
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, APlayerPawn;

    // End:0x8A
    if(Outer.myAIPawn.TuneDataAIPawn.bEnablePlayerPush)
    {
        APlayerPawn = LPPlayerPawn(Other);
        // End:0x8A
        if(APlayerPawn != none)
        {
            PlayerPawnToPush = APlayerPawn;
        }
    }
    bBumpHandledByDelegate = false;
    // End:0xDE
    if(NotifyOfBumpWhileMovingDelegate != none)
    {
        bBumpHandledByDelegate = OnNotifyOfBumpWhileMovingDelegate(Other, OtherComp, HitNormal);
    }
    //return;    
}

function MoveUnreachable()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttemptedDest[8388609], AttemptedTarget;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Outer.PopCommand(self);
    return super(GameAICommand).MoveUnreachable(AttemptedDest, AttemptedTarget);
    //return ReturnValue;    
}

function IsPawnAtDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HasPawnFinishedPathing()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.Kynapse_PathFinderHasArrivedAtGoal())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyMoveAboutToStart()
{
    // End:0x4A
    if(bUseStartVelocity)
    {
        Outer.myAIPawn.Velocity = StartVelocity;
    }
    IsMoveInProgress = true;
    Outer.Kynapse_ActivateBot(true);
    NotifyMoveAboutToStartCompleted = true;
    TimeMovementStarted = Outer.WorldInfo.TimeSeconds;
    Outer.NotifyMoveCmdStartingMove();
    // End:0xF5
    if(bUseGrossProgressMonitor)
    {
        StartMonitorTimer();
    }
    //return;    
}

function NotifyMoveEnded()
{
    IsMoveInProgress = false;
    Outer.Kynapse_ActivateBot(false);
    NotifyMoveEndedCompleted = true;
    StopMonitorTimer();
    //return;    
}

function NotifyMoveAborted()
{
    Outer.Kynapse_ActivateBot(false);
    NotifyMoveAbortedCompleted = true;
    StopMonitorTimer();
    //return;    
}

function GetDesiredDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function IsDesiredDestinationReachable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function WaitBeforeStartMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5B
    if(TimeToStartMove > Outer.myAIPawn.WorldInfo.TimeSeconds)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function UpdateDuringMove()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float SpeedAdjust;
    local /*0x97E50000-0x00000000*/ private @NULL PushVelocity;

    // End:0x2A8
    if((PlayerPawnToPush != none) && Outer.myAIPawn.TuneDataAIPawn.DesiredSeparationToPlayer > 0.0000000)
    {
        CurrentPlayerSeparation = VSize(Outer.MySPPawn.Location - PlayerPawnToPush.Location) - (Outer.MySPPawn.GetCollisionRadius() + PlayerPawnToPush.GetCollisionRadius());
        // End:0x2A8
        if(CurrentPlayerSeparation < Outer.myAIPawn.TuneDataAIPawn.DesiredSeparationToPlayer)
        {
            SpeedAdjust = (Outer.myAIPawn.TuneDataAIPawn.DesiredSeparationToPlayer - CurrentPlayerSeparation) / Outer.myAIPawn.TuneDataAIPawn.TimeToDesiredSeparationToPlayer;
            PushVelocity = Normal(PlayerPawnToPush.Location - Outer.MySPPawn.Location) * SpeedAdjust;
            PlayerPawnToPush.SetExternalVelocity(PushVelocity);
        }
    }
    return 0;
    //return ReturnValue;    
}

function DoesPathExist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.Kynapse_PathFinderPathFound();
    //return ReturnValue;    
}

function UpdateDestination()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

private final function MonitorMovement()
{
    local /*0x97E50000-0x00000000*/ private float timeSinceLastUpdate;
    local /*0x97E50000-0x00000000*/ private @NULL displacementFromLastUpdate;
    local /*0x97E50000-0x00000000*/ private float distanceFromLastUpdateSq;

    bIsStuck = false;
    timeSinceLastUpdate = Outer.WorldInfo.TimeSeconds - TimeMovementStarted;
    // End:0x33C
    if((Outer.MySPKynapseBotHandle.Agent_HasMoveAgent() && !Outer.MySPKynapseBotHandle.PathFinder_PathInConstruction()) && timeSinceLastUpdate >= DelayAfterStartOfMovementBeforeMonitorStarts)
    {
        // End:0x2FC
        if(!Outer.IsDoingSpecialUninteruptibleMovement())
        {
            timeSinceLastUpdate = Outer.WorldInfo.TimeSeconds - TimeOfLastProgressMonitorUpdate;
            // End:0x2F9
            if(timeSinceLastUpdate > TimeBetweenMovementProgressMonitorUpdates)
            {
                TimeOfLastProgressMonitorUpdate = Outer.WorldInfo.TimeSeconds;
                displacementFromLastUpdate = Outer.myAIPawn.Location - myAIPawnLastPosition;
                myAIPawnLastPosition = Outer.myAIPawn.Location;
                distanceFromLastUpdateSq = VSizeSq(displacementFromLastUpdate);
                // End:0x2F9
                if(distanceFromLastUpdateSq < MinMovementDeltaForMonitorSq)
                {
                    // End:0x2BB
                    if(VSize(Outer.myAIPawn.Acceleration) > float(0))
                    {
                        bIsStuck = true;
                        Outer.NotifyStuckCollidingWithWorld();                        
                    }
                    else
                    {
                        bIsStuck = true;
                        Outer.NotifyStuckPathingFailed();
                    }
                    OnNotifyOfFailedMovementMonitor();
                }
            }            
        }
        else
        {
            TimeOfLastProgressMonitorUpdate = Outer.WorldInfo.TimeSeconds;
        }        
    }
    else
    {
        TimeOfLastProgressMonitorUpdate = Outer.WorldInfo.TimeSeconds;
    }
    //return;    
}

final function StartMonitorTimer()
{
    myAIPawnLastPosition = Outer.myAIPawn.Location;
    // End:0x93
    if(!Outer.IsTimerActive('MonitorMovement', self))
    {
        Outer.SetTimer(0.2500000, true, 'MonitorMovement', self);
    }
    //return;    
}

final function StopMonitorTimer()
{
    // End:0x55
    if(Outer.IsTimerActive('MonitorMovement', self))
    {
        Outer.ClearTimer('MonitorMovement');
    }
    //return;    
}

protected event DestinationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.myAIPawn.Location;
    //return ReturnValue;    
}

function SetLookWhenStartMoving()
{
    local /*0x97E50000-0x00000000*/ private byte inLookWhenMoving[8388609];

    OverwriteLookWhenStartMoving = inLookWhenMoving;
    //return;    
}

function SetAllowFiring()
{
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[8388609];

    bFireWhileMoving = bAllowFiring;
    //return;    
}

function SelectPotentialFireTarget()
{
    // End:0x4F
    if(Outer.FireTarget != none)
    {
        PotentialFireTarget = Outer.FireTarget;        
    }
    else
    {
        // End:0x9E
        if(Outer.MainEnemy != none)
        {
            PotentialFireTarget = Outer.MainEnemy;            
        }
        else
        {
            PotentialFireTarget = none;
        }
    }
    //return;    
}

event NotifyReceivedDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

    super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
    Outer.DamageReceivedMoving += float(Damage);
    // End:0x35A
    if((Outer.myAIPawn.TuneDataAIPawn.AIStumbleCSA != none) && (Outer.WorldInfo.TimeSeconds - Outer.TimeStampStumbled) > Outer.myAIPawn.TuneDataAIPawn.MinTimeBetweenStumbles)
    {
        // End:0x35A
        if(((float(Outer.myAIPawn.TuneDataAIPawn.DamageToReactStumble) > 0.0000000) && !Outer.bAimDownSight) && Outer.DamageReceivedMoving > float(Outer.myAIPawn.TuneDataAIPawn.DamageToReactStumble))
        {
            Outer.DamageReceivedMoving = 0.0000000;
            Outer.myAIPawn.OverrideWithCSA(Outer.myAIPawn.TuneDataAIPawn.AIStumbleCSA, Outer.myAIPawn.TuneDataAIPawn.TimeReactStumble);
            Outer.TimeStampStumbled = Outer.WorldInfo.TimeSeconds;
        }
    }
    //return;    
}

function CheckAimWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private float PathDistLeft;

    // End:0x106
    if(int(Outer.lookWhenStartMoving) == int(Outer.@NULL))
    {
        @NULL
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x1DC
        /*@Error*/
        {
        }
    }
    @NULL
    // DebugMode: 232
    WarnInternal((assert((@NULL != (none != )) != Outer.Kynapse_PathFinderGetDistanceLeft()) != (PathDistLeft > Outer.LookEnemyShortPathDist)) != Outer);
    //return;    
    @NULL
    default.@NULL
    @NULL
}

function CheckFireWhileMoving()
{
    // End:0x101
    if(WantsToFire())
    {
        Outer.SetTimer(0.2000000, true, 'TimerFireWhileMoving', self);
        // End:0xAD
        if(!Outer.bConsumeAmmoWhileMoving)
        {
            SPGFWeapon(Outer.myAIPawn.Weapon).bInfiniteAmmo = true;
        }
        Outer.AISetFireTarget(PotentialFireTarget);
        FireFromOpen = Outer.CmdFireFromOpen();
    }
    //return;    
}

function WantsToFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(PotentialFireTarget == none)
    {
        return false;
    }
    // End:0x22
    if(!bFireWhileMoving)
    {
        return false;
    }
    // End:0x51
    if(!Outer.AIWantsToFireWhileMoving(PotentialFireTarget))
    {
        return false;
    }
    Outer.GetFireAccess(LPPawn(PotentialFireTarget), true);
    return true;
    //return ReturnValue;    
}

function TimerFireWhileMoving()
{
    // End:0x19
    if(HasPawnFinishedPathing())
    {
        StopFiring();
        return;
    }
    UpdateResult = CheckMoveAbort();
    // End:0x4D
    if(int(UpdateResult) != int(0))
    {
        StopFiring();
        return;
    }
    UpdateResult = UpdateDestination();
    // End:0x81
    if(int(UpdateResult) != int(0))
    {
        StopFiring();
        return;
    }
    // End:0xA5
    if(LPAICmd_FireFromOpen(ChildCommand) == none)
    {
        StopFiring();
        return;
    }
    //return;    
}

function StopFiring()
{
    // End:0x145
    if(bFireWhileMoving)
    {
        Outer.ClearTimer('TimerFireWhileMoving', self);
        Outer.AbortCommand(FireFromOpen);
        FireFromOpen = none;
        Outer.ReleaseFireAccess();
        // End:0x145
        if(!Outer.bConsumeAmmoWhileMoving && SPGFWeapon(Outer.myAIPawn.Weapon) != none)
        {
            SPGFWeapon(Outer.myAIPawn.Weapon).bInfiniteAmmo = false;
        }
    }
    //return;    
}

function CheckMoveAbort()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x28
    if(MoveAbortDelegate())
    {
        LPAICmd_Move_Status(5);
        return 2;        
    }
    else
    {
        // End:0x82
        if(!DoesPathExist())
        {
            // End:0x54
            if(IsPawnAtDestination())
            {
                NotifyMoveEndedInternal();
                return 1;                
            }
            else
            {
                LPAICmd_Move_Status(4);
                Outer.NotifyStuckPathingFailed();
                return 2;
            }
        }
    }
    return 0;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    GotoState('MoveToCurrentDestination');
    stop;        
}

state MoveToCurrentDestination
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x50
        if(MaxSpeedScale > 0.0000000)
        {
            Outer.myAIPawn.SetMaxSpeedScale(MaxSpeedScale);
        }
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StopFiring();
        // End:0xCB
        if(MaxSpeedScale > 0.0000000)
        {
            Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        }
        //return;        
    }

    function SetNextMoveLocation()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0xF5
    if(Outer.CoverIsIn())
    {
        // End:0x89
        if(Outer.CoverActionIsDoing() && !Outer.CanExitCoverFromCoverAction())
        {
            Outer.CoverResetAction();
        }
        J0x89:

        // End:0xCB [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x89;
        }
        Outer.CoverExit(GetDesiredDestination());
    }
    J0xF5:

    // End:0x122 [Loop If]
    if(WaitBeforeStartMove())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0xF5;
    }
    J0x122:

    // End:0x164 [Loop If]
    if(Outer.IsDoingSpecialUninteruptibleMovement())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x122;
    }
    // End:0x1A0
    if(int(OverwriteLookWhenStartMoving) != int(0))
    {
        Outer.MoveLookingMode(OverwriteLookWhenStartMoving);
    }
    // End:0x230
    if(((int(Outer.lookWhenStartMoving) == int(1)) || int(Outer.lookWhenStartMoving) == int(4)) && PotentialFireTarget != none)
    {
        Outer.PawnLookAtActor(PotentialFireTarget);        
    }
    else
    {
        // End:0x27B
        if(int(Outer.lookWhenStartMoving) == int(2))
        {
            Outer.PawnDontLook();            
        }
        else
        {
            // End:0x2C3
            if(int(Outer.lookWhenStartMoving) == int(3))
            {
                Outer.PawnDontLook();
            }
        }
    }
    // End:0x4C7
    if(IsPawnAbleToMove() && !MoveAbortDelegate())
    {
STARTMOVE:


        // End:0x304
        if(IsPawnAtDestination())
        {
            NotifyMoveEndedInternal();            
        }
        else
        {
            NotifyMoveAboutToStartInternal();
            LPAICmd_Move_Status(1);
            goto 'DOMOVE';
POSTDOMOVE:


            Outer.Sleep(0.0000000);
            J0x341:

            // End:0x42A [Loop If]
            if(((HasPawnFinishedPathing()) == false) && int(UpdateResult) == int(0))
            {
                UpdateResult = CheckMoveAbort();
                // End:0x40A
                if(int(UpdateResult) == int(0))
                {
                    UpdateResult = UpdateDestination();
                    // End:0x40A
                    if(int(UpdateResult) == int(0))
                    {
                        CheckAimWhileMoving();
                        CheckFireWhileMoving();
                        // End:0x40A
                        if(int(UpdateResult) == int(0))
                        {
                            // End:0x3F6
                            if(HasDestinationChanged)
                            {
                                goto 'DOMOVE_NEWDEST';
                            }
POSTDOMOVE_NEWDEST:


                            UpdateResult = UpdateDuringMove();
                        }
                    }
                }
                Outer.Sleep(0.0000000);
                // [Loop Continue]
                goto J0x341;
            }
        }
        J0x42A:

        // End:0x457
        if((int(UpdateResult) != int(2)) && SetNextMoveLocation())
        {
            goto 'DOMOVE_NEWDEST';
        }
        J0x457:

        // End:0x48F [Loop If]
        if(!CheckAnimationTransitionRequirements(UpdateResult))
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x457;
        }
        // End:0x4AD
        if(int(UpdateResult) == int(2))
        {
            NotifyMoveAbortedInternal();
        }
        // End:0x4C4
        if(IsMoveInProgress)
        {
            NotifyMoveEndedInternal();
        }        
    }
    else
    {
        NotifyMoveAbortedInternal();
    }
    GotoState('MoveEnded');
DOMOVE:


    DummyMoveCall();
    goto 'POSTDOMOVE';
DOMOVE_NEWDEST:


    DummyMoveCall();
    goto 'POSTDOMOVE_NEWDEST';
    stop;                    
}

state MoveEnded
{Begin:

    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bUse2dDistanceChecks=true
    bZeroVelocityOnFinish=true
    DesiredSeperation=-1.0000000
    MoveAbortDelegate=DefaultMoveAbort
    MoveAvoidanceDelegate=DefaultMoveAvoidanceDelegate
}