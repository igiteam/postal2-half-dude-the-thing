class LPAICmd_MoveToPosition extends LPAICmd_Move within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDesiredDestination[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionStatus[536870913];

// Export ULPAICmd_MoveToPosition::execShouldKynapseDynamicallyAvoid(FFrame&, void* const)
native event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Pushed()
{
    super.Pushed();
    CurDesiredDestination = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

protected function ResetMoveVars()
{
    super.ResetMoveVars();
    // End:0x38
    if(MoveToPositionStatus != none)
    {
        MoveToPositionStatus.SetDefaults();
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x80
    if(!bTouchHandledByDelegate)
    {
        Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super.Bump(Other, OtherComp, HitNormal);
    // End:0x6E
    if(!bBumpHandledByDelegate)
    {
        Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
    }
    //return;    
}

final function SetDesiredDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897];

    // End:0x53
    if(CurDesiredDestination != pos)
    {
        Outer.AIClearCoverGoal();
        CurDesiredDestination = pos;
        NotifyDestinationChange();
    }
    //return;    
}

function GetDesiredDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CurDesiredDestination;
    //return ReturnValue;    
}

function IsDesiredDestinationReachable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1D
    if(CurDesiredDestination == vect(0.0000000, 0.0000000, 0.0000000))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsPawnAtDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float radiusSq, distanceToTargetLocSq;

    // End:0x20
    if(DesiredSeperation > float(-1))
    {
        return IsPawnAtDesiredSeperation();
    }
    radiusSq = Outer.myAIPawn.CylinderComponent.CollisionRadius;
    radiusSq = radiusSq * radiusSq;
    // End:0xF2
    if(bUse2dDistanceChecks)
    {
        distanceToTargetLocSq = VSizeSq2D(CurDesiredDestination - Outer.myAIPawn.Location);        
    }
    else
    {
        distanceToTargetLocSq = VSizeSq(CurDesiredDestination - Outer.myAIPawn.Location);
    }
    // End:0x158
    if(distanceToTargetLocSq > radiusSq)
    {
        return false;        
    }
    else
    {
        // End:0x218
        if(Abs(CurDesiredDestination.Z - Outer.myAIPawn.Location.Z) > (Outer.myAIPawn.CylinderComponent.CollisionHeight * MovementZDiffAllowanceFactor))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function IsPawnAtDesiredSeperation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyPawnLocation;
    local /*0x97E50000-0x00000000*/ private float CollisionHeight, distanceToTargetLocSq, HeightDiff;

    CollisionHeight = Outer.myAIPawn.CylinderComponent.CollisionHeight;
    MyPawnLocation = Outer.myAIPawn.Location;
    MyPawnLocation.Z -= CollisionHeight;
    // End:0xEE
    if(bUse2dDistanceChecks)
    {
        distanceToTargetLocSq = VSizeSq2D(CurDesiredDestination - MyPawnLocation);        
    }
    else
    {
        distanceToTargetLocSq = VSizeSq(CurDesiredDestination - MyPawnLocation);
    }
    HeightDiff = Abs(CurDesiredDestination.Z - MyPawnLocation.Z);
    // End:0x17B
    if(distanceToTargetLocSq > (DesiredSeperation * DesiredSeperation))
    {
        return false;        
    }
    else
    {
        // End:0x19F
        if(HeightDiff > (CollisionHeight * MovementZDiffAllowanceFactor))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function DestinationAsStr()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return Vector2Str(CurDesiredDestination);
    //return ReturnValue;    
}

private final function OnGoalChange()
{
    // End:0x57
    if(MoveToPositionStatus != none)
    {
        MoveToPositionStatus.Cmd_Move_GoalIsOnAiMesh = Outer.IsDestinationInsideAiMesh(CurDesiredDestination);
    }
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super(LPAICommand).SetReturnCmdStatus(ReturnStatus);
    MoveToPositionStatus = LPAICmdStatus_MoveToPosition(ReturnStatus);
    //return;    
}

function HasPawnFinishedPathing()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(IsPawnAtDestination())
    {
        return true;        
    }
    else
    {
        return super.HasPawnFinishedPathing();
    }
    //return ReturnValue;    
}

function NotifyMoveAboutToStart()
{
    // End:0x4C
    if(DesiredSeperation >= float(0))
    {
        Outer.Kynapse_PathFinderSetDistToTarget(DesiredSeperation, DesiredSeperation * 1.5000000);        
    }
    else
    {
        Outer.Kynapse_PathFinderSetDistToTarget(Outer.MyKynapseRadius, Outer.MyKynapseRadius * 1.5000000);
    }
    super.NotifyMoveAboutToStart();
    //return;    
}

function NotifyMoveEnded()
{
    CurDesiredDestination = vect(0.0000000, 0.0000000, 0.0000000);
    super.NotifyMoveEnded();
    //return;    
}

function WaitBeforeStartMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsKynapseReady() || super.WaitBeforeStartMove();
    //return ReturnValue;    
}

protected event DestinationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CurDesiredDestination;
    //return ReturnValue;    
}

state MoveToCurrentDestination
{DOMOVE:

    OnGoalChange();
    Outer.MoveToWithConstraint(CurDesiredDestination, Outer.Focus,,, MoveConstraint);
    goto 'POSTDOMOVE';
DOMOVE_NEWDEST:


    OnGoalChange();
    Outer.MoveToWithConstraint(CurDesiredDestination, Outer.Focus,,, MoveConstraint);
    goto 'POSTDOMOVE_NEWDEST';
    stop;        
}
