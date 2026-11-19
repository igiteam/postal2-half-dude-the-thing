class LPAICmd_MoveToActorTight extends LPAICmd_MoveToActor within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OverridenPawnRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKillTransitionComponentOnTouchOfTarget;

function Pushed()
{
    super.Pushed();
    Outer.MyKynapseRadius = TightAdjustedRadius(Outer.myAIPawn);
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Move).SPAborted();
    //return;    
}

function OverridePawnRadius()
{
    local /*0x97E50000-0x00000000*/ private float Inradius[9437185];

    -1.0000000
    OverridenPawnRadius = Inradius;
    SetupReachTest(GetDesiredTarget());
    //return;    
}

function SetKillTransitionComponentOnTouchOfTarget()
{
    local /*0x97E50000-0x00000000*/ private bool bInKillTransitionComponentOnTouchOfTarget[8388609];

    bKillTransitionComponentOnTouchOfTarget = bInKillTransitionComponentOnTouchOfTarget;
    //return;    
}

function GetMyKynapseRadius()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x1E
    if(OverridenPawnRadius > float(0))
    {
        return OverridenPawnRadius;        
    }
    else
    {
        return Outer.MyKynapseRadius;
    }
    //return ReturnValue;    
}

function TightAdjustedRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], ActorRadius, ActorHeight;

    ActorRadius = 0.0000000;
    // End:0x70
    if(Pawn(TheActor) != none)
    {
        ActorRadius = Pawn(TheActor).CylinderComponent.CollisionRadius;        
    }
    else
    {
        // End:0xB0
        if(TheActor != none)
        {
            TheActor.GetBoundingCylinder(ActorRadius, ActorHeight);
        }
    }
    return ActorRadius;
    //return ReturnValue;    
}

function SetDesiredTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTarget[8388609];

    // End:0x49
    if(Controller(NewTarget) != none)
    {
        NewTarget = Controller(NewTarget).Pawn;
    }
    // End:0x91
    if(GetDesiredTarget() != NewTarget)
    {
        SetTargetActor(NewTarget);
        NotifyDestinationChange();
        SetupReachTest(NewTarget);
    }
    //return;    
}

function SetupReachTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTarget[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist;

    SetLastTargetActorLocation(GetDesiredTarget().Location);
    // End:0xA0
    if(GetDesiredTarget().bBlockActors)
    {
        TargetRadius = TightAdjustedRadius(GetDesiredTarget());
        reachDist = Outer.MyKynapseRadius + TargetRadius;        
    }
    else
    {
        TargetRadius = 0.0000000;
        reachDist = GetMyKynapseRadius();
    }
    MinDistForReachedTest = reachDist;
    MaxDistForReachedTest = MinDistForReachedTest * 1.2000000;
    //return;    
}

function RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x13B
    if((Other != none) && Other == GetDesiredTarget())
    {
        LastTouchedActor = Other;
        // End:0x13B
        if(bKillTransitionComponentOnTouchOfTarget)
        {
            // End:0x13B
            if((Outer.myAIPawn.TransitionComponent != none) && Outer.myAIPawn.TransitionComponent.IsDoingTransition())
            {
                Outer.myAIPawn.TransitionComponent.StopTransition(true, true);
                Outer.PopCommand(self);
            }
        }
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    OverridenPawnRadius=-1.0000000
}