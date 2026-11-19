class LPAICmd_MoveToActorFly extends LPAICmd_MoveToActor within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceFromMoveToTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PitchAngleFromMoveToTargetInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PitchAngleFromMoveToTargetInUU;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DisplacementToOffsetPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RotationToOffsetPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OffsetPointMovingTo;

function Pushed()
{
    super.Pushed();
    //return;    
}

function SetDesiredTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTarget[8388609];

    super.SetDesiredTarget(NewTarget);
    //return;    
}

final function SetDesiredPitchAngleFromTarget()
{
    local /*0x97E50000-0x00000000*/ private float PitchAngleFromTargetInDegrees[8388609];

    PitchAngleFromMoveToTargetInDegrees = PitchAngleFromTargetInDegrees;
    //return;    
}

final function SetDistanceFromMoveToTarget()
{
    local /*0x97E50000-0x00000000*/ private float distanceFromTarget[8388609];

    DistanceFromMoveToTarget = distanceFromTarget;
    //return;    
}

function CalculateCurrentDesriedOffsetFromMoveTarget()
{
    PitchAngleFromMoveToTargetInUU = int(float(65535) * (PitchAngleFromMoveToTargetInDegrees / 360.0000000));
    DisplacementToOffsetPoint = Outer.myAIPawn.Location - TargetActor.Location;
    RotationToOffsetPoint = Rotator(DisplacementToOffsetPoint);
    RotationToOffsetPoint.Pitch = PitchAngleFromMoveToTargetInUU;
    DisplacementToOffsetPoint = Vector(RotationToOffsetPoint);
    DisplacementToOffsetPoint = Normal(DisplacementToOffsetPoint);
    DisplacementToOffsetPoint = DisplacementToOffsetPoint * DistanceFromMoveToTarget;
    OffsetPointMovingTo = DisplacementToOffsetPoint + TargetActor.Location;
    return;
    //return;    
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

function IsPawnAtDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Distance, reachDist;

    // End:0x11
    if(TargetActor == none)
    {
        return false;
    }
    CalculateCurrentDesriedOffsetFromMoveTarget();
    Distance = VSize(OffsetPointMovingTo - Outer.myAIPawn.Location);
    // End:0x97
    if(DesiredSeperation >= float(0))
    {
        reachDist = MinDistForReachedTest + DesiredSeperation;        
    }
    else
    {
        reachDist = MinDistForReachedTest;
    }
    // End:0xC3
    if(Distance > reachDist)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super.Bump(Other, OtherComp, HitNormal);
    //return;    
}

function RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.RanIntoActor(Other);
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
        // End:0xF8
        if(LastTargetActorLocation != TargetActor.Location)
        {
            LastTargetActorLocation = TargetActor.Location;
            SetReach();
            NotifyDestinationChange();
            CalculateCurrentDesriedOffsetFromMoveTarget();
        }
    }
    return 0;
    //return ReturnValue;    
}

protected function OnFlyGoalChange()
{
    // End:0xB9
    if(MoveToActorStatus != none)
    {
        // End:0x98
        if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
        {
            MoveToActorStatus.Cmd_Move_GoalIsOnAiMesh = Outer.IsDestinationInsideAiMesh(LastTargetActorLocation);            
        }
        else
        {
            MoveToActorStatus.Cmd_Move_GoalIsOnAiMesh = true;
        }
    }
    //return;    
}

function CheckIsDestinationInsideAiMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x52
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super.CheckIsDestinationInsideAiMesh(Dest);
    }
    return true;
    //return ReturnValue;    
}

state MoveToCurrentDestination
{DOMOVE:

    OnFlyGoalChange();
    Outer.MoveToWithConstraint(OffsetPointMovingTo, Outer.Focus,,, MoveConstraint);
    goto 'POSTDOMOVE';
DOMOVE_NEWDEST:


    OnFlyGoalChange();
    Outer.MoveToWithConstraint(OffsetPointMovingTo, Outer.Focus,,, MoveConstraint);
    goto 'POSTDOMOVE_NEWDEST';
    stop;        
}
