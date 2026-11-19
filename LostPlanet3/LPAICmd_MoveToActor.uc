class LPAICmd_MoveToActor extends LPAICmd_Move within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastTargetActorLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastTouchedActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorStatus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DesiredReachDistance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistForReachedTest[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistForReachedTest[536870913];

// Export ULPAICmd_MoveToActor::execShouldKynapseDynamicallyAvoid(FFrame&, void* const)
native event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Pushed()
{
    TargetActor = none;
    LastTouchedActor = none;
    LastTargetActorLocation = vect(0.0000000, 0.0000000, 0.0000000);
    TargetRadius = 0.0000000;
    DesiredReachDistance = 0.0000000;
    super.Pushed();
    //return;    
}

function Popped()
{
    TargetActor = none;
    Outer.MoveTarget = none;
    super.Popped();
    //return;    
}

function SetDesiredTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTarget[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist;

    // End:0x49
    if(Controller(NewTarget) != none)
    {
        NewTarget = Controller(NewTarget).Pawn;
    }
    // End:0x1B2
    if(TargetActor != NewTarget)
    {
        Outer.AIClearCoverGoal();
        TargetActor = NewTarget;
        NotifyDestinationChange();
        LastTargetActorLocation = TargetActor.Location;
        // End:0x14E
        if(TargetActor.bBlockActors)
        {
            TargetRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(TargetActor);
            reachDist = Outer.MyKynapseRadius + TargetRadius;            
        }
        else
        {
            TargetRadius = 0.0000000;
            reachDist = Outer.MyKynapseRadius;
        }
        MinDistForReachedTest = reachDist;
        MaxDistForReachedTest = MinDistForReachedTest * 1.2000000;
    }
    //return;    
}

function SetDesiredReachDistance()
{
    local /*0x97E50000-0x00000000*/ private float InDesiredReachDistance[8388609];

    DesiredReachDistance = InDesiredReachDistance;
    //return;    
}

protected final function SetDefaultReachDist()
{
    // End:0x5B
    if(DesiredSeperation >= float(0))
    {
        Outer.Kynapse_PathFinderSetDistToTarget(MinDistForReachedTest + DesiredSeperation, MaxDistForReachedTest + DesiredSeperation);        
    }
    else
    {
        Outer.Kynapse_PathFinderSetDistToTarget(MinDistForReachedTest, MaxDistForReachedTest);
    }
    //return;    
}

protected final function SetReachDist()
{
    local /*0x97E50000-0x00000000*/ private float MinDist[8388609], MaxDist;

    Outer.Kynapse_PathFinderSetDistToTarget(MinDist, MaxDist);
    //return;    
}

function CheckIsDestinationInsideAiMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsDestinationInsideAiMesh(Dest);
    //return ReturnValue;    
}

protected function SetReach()
{
    // End:0xBA
    if(((TargetActor != none) && !TargetActor.bBlockActors) && DesiredReachDistance > 0.0000000)
    {
        DesiredSeperation = 0.0000000;
        MinDistForReachedTest = DesiredReachDistance;
        MaxDistForReachedTest = MinDistForReachedTest * 1.2000000;
        Outer.Kynapse_PathFinderSetDistToTarget(MinDistForReachedTest, MaxDistForReachedTest);        
    }
    else
    {
        // End:0x129
        if(((TargetActor != none) && !TargetActor.IsPendingKill()) && CheckIsDestinationInsideAiMesh(TargetActor.Location))
        {
            SetDefaultReachDist();            
        }
        else
        {
            SetReachDist(Outer.MyKynapseRadius, Outer.MyKynapseRadius * 1.2000000);
        }
    }
    //return;    
}

final function GetDesiredTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TargetActor;
    //return ReturnValue;    
}

protected final function SetTargetActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTarget[8388609];

    TargetActor = NewTarget;
    //return;    
}

protected final function GetLastTargetActorLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LastTargetActorLocation;
    //return ReturnValue;    
}

protected final function SetLastTargetActorLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTargetLoc[8388609];

    LastTargetActorLocation = NewTargetLoc;
    //return;    
}

function GetDesiredDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TargetActor.Location;
    //return ReturnValue;    
}

function IsDesiredDestinationReachable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(TargetActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function @NULL IsPawnAtDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Distance, reachDist;
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float PathDistanceLeft;
    local /*0x97E50000-0x00000000*/ private @NULL PathFinderDest;

    // End:0x11
    if(TargetActor == none)
    {
        return false;
    }
    // End:0x88
    if(bUse2dDistanceChecks)
    {
        Distance = VSize2D(TargetActor.Location - Outer.myAIPawn.Location);        
    }
    else
    {
        Distance = VSize(TargetActor.Location - Outer.myAIPawn.Location);
    }
    // End:0x119
    if(DesiredSeperation >= float(0))
    {
        reachDist = MinDistForReachedTest + DesiredSeperation;        
    }
    else
    {
        reachDist = MinDistForReachedTest;
    }
    // End:0x148
    if(Distance > reachDist)
    {
        return false;        
    }
    else
    {
        // End:0x21D
        if(Abs(TargetActor.Location.Z - Outer.myAIPawn.Location.Z) > (Outer.myAIPawn.CylinderComponent.CollisionHeight * MovementZDiffAllowanceFactor))
        {
            return false;
        }
    }
    BotHandle = SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle);
    // End:0x342
    if(BotHandle != none)
    {
        // End:0x296
        if(BotHandle.PathFinder_PathInConstruction())
        {
            return false;
        }
        PathFinderDest = BotHandle.PathFinder_GetDestination();
        // End:0x300
        if(VSizeSq2D(PathFinderDest - TargetActor.Location) > float(10000))
        {
            return false;
        }
        PathDistanceLeft = BotHandle.PathFinder_GetDistanceLeft();
        // End:0x342
        if(PathDistanceLeft > reachDist)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function WaitBeforeStartMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsKynapseReady() || super.WaitBeforeStartMove();
    //return ReturnValue;    
}

function DestinationAsStr()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0xF7
    if(TargetActor != none)
    {
        // End:0x9D
        if(TargetActor.IsPendingKill())
        {
            return ((("Target actor : " $ string(TargetActor)) $ "(Pending Kill)") $ " Position ") $ Vector2Str(TargetActor.Location);            
        }
        else
        {
            return (("Target actor : " $ string(TargetActor)) $ " Position ") $ Vector2Str(TargetActor.Location);
        }        
    }
    else
    {
        return "Target actor : none";
    }
    //return ReturnValue;    
}

private final function OnGoalChange()
{
    // End:0x57
    if(MoveToActorStatus != none)
    {
        MoveToActorStatus.Cmd_Move_GoalIsOnAiMesh = Outer.IsDestinationInsideAiMesh(LastTargetActorLocation);
    }
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super(LPAICommand).SetReturnCmdStatus(ReturnStatus);
    MoveToActorStatus = LPAICmdStatus_MoveToActor(ReturnStatus);
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0xAA
    if(!bTouchHandledByDelegate)
    {
        RanIntoActor(Other);
        // End:0xAA
        if(TargetActor != Other)
        {
            Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
        }
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super.Bump(Other, OtherComp, HitNormal);
    // End:0xA4
    if(Outer.myAIPawn.TuneDataAIPawn.bEnablePlayerPush)
    {
        // End:0xA4
        if((PlayerPawnToPush != none) && PlayerPawnToPush == TargetActor)
        {
            PlayerPawnToPush = none;
        }
    }
    // End:0x117
    if(!bBumpHandledByDelegate)
    {
        RanIntoActor(Other);
        // End:0x117
        if(TargetActor != Other)
        {
            Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
        }
    }
    //return;    
}

function RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x53
    if((Other != none) && Other == TargetActor)
    {
        // End:0x53
        if(LPAICmd_AnimatedPath(ChildCommand) == none)
        {
            LastTouchedActor = Other;
        }
    }
    return true;
    //return ReturnValue;    
}

function NotifyMoveAboutToStart()
{
    SetReach();
    super.NotifyMoveAboutToStart();
    //return;    
}

function NotifyMoveEnded()
{
    super.NotifyMoveEnded();
    // End:0xBF
    if(Outer.Focus == none)
    {
        Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * 1000.0000000), true);
    }
    TargetActor = none;
    //return;    
}

function HasPawnFinishedPathing()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if((IsPawnAtDestination()) || (LastTouchedActor == TargetActor) && TargetActor.bBlockActors)
    {
        return true;        
    }
    else
    {
        return super.HasPawnFinishedPathing();
    }
    //return ReturnValue;    
}

function UpdateDestination()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x86
    if(((TargetActor == none) || TargetActor.IsPendingKill()) || (LPPawn(TargetActor) != none) && TargetActor.bHidden == true)
    {
        LPAICmd_Move_Status(6);
        return 2;        
    }
    else
    {
        // End:0xEE
        if(LastTargetActorLocation != TargetActor.Location)
        {
            LastTargetActorLocation = TargetActor.Location;
            SetReach();
            NotifyDestinationChange();
        }
    }
    return 0;
    //return ReturnValue;    
}

protected event DestinationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TargetActor.Location;
    //return ReturnValue;    
}

state MoveToCurrentDestination
{
    function SetNextMoveLocation()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PathTarget;

        PathTarget = LPPathTargetPoint(TargetActor);
        // End:0x2D
        if(PathTarget == none)
        {
            return false;
        }
        // End:0xE4
        if(PathTarget.NextPathTargetPoint != none)
        {
            // End:0xBA
            if(Outer.Focus == PathTarget)
            {
                Outer.SetFocusActor(PathTarget.NextPathTargetPoint);
            }
            SetDesiredTarget(PathTarget.NextPathTargetPoint);
            return true;
        }
        return false;
        //return ReturnValue;        
    }
DOMOVE:

    OnGoalChange();
    Outer.MoveTowardWithConstraint(TargetActor, Outer.Focus,,,, MoveConstraint);
    goto 'POSTDOMOVE';
DOMOVE_NEWDEST:


    OnGoalChange();
    Outer.MoveTowardWithConstraint(TargetActor, Outer.Focus,,,, MoveConstraint);
    goto 'POSTDOMOVE_NEWDEST';
    stop;                
}
