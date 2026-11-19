class LPAICmd_MoveToPositionFly extends LPAICmd_MoveToPosition within LPAIController;

function Pushed()
{
    super.Pushed();
    //return;    
}

protected function ResetMoveVars()
{
    super.ResetMoveVars();
    //return;    
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
    local /*0x97E50000-0x00000000*/ private float radiusSq;

    // End:0x20
    if(DesiredSeperation > float(-1))
    {
        return IsPawnAtDesiredSeperation();
    }
    radiusSq = Outer.myAIPawn.CylinderComponent.CollisionRadius;
    radiusSq = radiusSq * radiusSq;
    // End:0xE3
    if(VSizeSq(CurDesiredDestination - Outer.myAIPawn.Location) > radiusSq)
    {
        return false;        
    }
    else
    {
        // End:0x198
        if(Abs(CurDesiredDestination.Z - Outer.myAIPawn.Location.Z) > Outer.myAIPawn.CylinderComponent.CollisionHeight)
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
    local /*0x97E50000-0x00000000*/ private float DistSq;

    MyPawnLocation = Outer.myAIPawn.Location;
    DistSq = VSizeSq(CurDesiredDestination - MyPawnLocation);
    // End:0x81
    if(DistSq > (DesiredSeperation * DesiredSeperation))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

protected function OnFlyGoalChange()
{
    // End:0xB9
    if(MoveToPositionStatus != none)
    {
        // End:0x98
        if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
        {
            MoveToPositionStatus.Cmd_Move_GoalIsOnAiMesh = Outer.IsDestinationInsideAiMesh(CurDesiredDestination);            
        }
        else
        {
            MoveToPositionStatus.Cmd_Move_GoalIsOnAiMesh = true;
        }
    }
    //return;    
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

state MoveToCurrentDestination
{DOMOVE:

    OnFlyGoalChange();
    Outer.MoveToWithConstraint(CurDesiredDestination, Outer.Focus,,, MoveConstraint);
    goto 'POSTDOMOVE';
DOMOVE_NEWDEST:


    OnFlyGoalChange();
    Outer.MoveToWithConstraint(CurDesiredDestination, Outer.Focus,,, MoveConstraint);
    goto 'POSTDOMOVE_NEWDEST';
    stop;        
}
