class LPAICmd_AnimatedPath extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Helper;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimContext;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoingSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRecoverSpeedOnFinish;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL originalSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL originalAccel[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float originalDesiredSpeed[536870913];

function Pushed()
{
    super.Pushed();
    Outer.NotifyStartOfAnimatedPathCmd();
    Helper = none;
    bDoingSpecialMove = false;
    originalDesiredSpeed = Outer.myAIPawn.DesiredSpeed;
    originalSpeed = Outer.myAIPawn.Velocity;
    originalAccel = Outer.myAIPawn.Acceleration;
    //return;    
}

function Popped()
{
    Outer.NotifyEndOfAnimatedPathCmd();
    // End:0x80
    if(!bDoingSpecialMove)
    {
        SPKynapseBotHandle(Outer.MySPPawn.myKynapseHandle).AnimatedPathFinished();
    }
    Helper = none;
    super.Popped();
    //return;    
}

function SetHelper()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHelper[8388609], PathProperty;

    Helper = InHelper;
    PathProperty = LPAnimatedPathProperty(Helper.AnimProperty);
    // End:0x80
    if(PathProperty != none)
    {
        bRecoverSpeedOnFinish = PathProperty.bTryToMaintainOriginalVelocityOnEnd;        
    }
    else
    {
        bRecoverSpeedOnFinish = default.bRecoverSpeedOnFinish;
    }
    //return;    
}

function SetAnimContext()
{
    local /*0x97E50000-0x00000000*/ private name InAnimContext[8388609];

    AnimContext = InAnimContext;
    //return;    
}

function On_LPSM_AnimatedPathFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0xC4
    if(bRecoverSpeedOnFinish)
    {
        Outer.myAIPawn.DesiredSpeed = originalDesiredSpeed;
        Outer.myAIPawn.Velocity = originalSpeed;
        Outer.myAIPawn.Acceleration = originalAccel;
    }
    Outer.PopCommand(self);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function OrientPawn()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FacingPoint;

        Outer.PawnLookAtActor(none);
        FacingPoint = Outer.myAIPawn.Location + (Vector(Outer.myAIPawn.ReplicatedAnimatedPathData.FacingDirection) * float(1000));
        // End:0x16A
        if(!Outer.myAIPawn.IsAtDesiredRotationYaw(Rotator(FacingPoint - Outer.myAIPawn.Location).Yaw))
        {
            Outer.CmdTurnToFacePosition(0, FacingPoint, 10);
        }
        //return;        
    }

    function PerformAnimatedPathSM()
    {
        Outer.myAIPawn.DoSpecialMove(Helper.GetSpecialMoveClass(), true, true, On_LPSM_AnimatedPathFinished, Helper);
        bDoingSpecialMove = true;
        //return;        
    }
Begin:

    // End:0x55
    if((Helper == none) || Outer.myAIPawn == none)
    {
        Outer.PopCommand(self);
    }
    Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Outer.myAIPawn.ReplicatedAnimatedPathData = Helper.GetAnimatedPathData(Outer.myAIPawn, AnimContext);
    // End:0x2AB
    if((Outer.myAIPawn.ReplicatedAnimatedPathData.Destination == vect(0.0000000, 0.0000000, 0.0000000)) || Outer.myAIPawn.ReplicatedAnimatedPathData.AnimationName == 'None')
    {
        // End:0x257
        if(Outer.myAIPawn.ReplicatedAnimatedPathData.Destination == vect(0.0000000, 0.0000000, 0.0000000))
        {
        }
        // End:0x2AB
        if(Outer.myAIPawn.ReplicatedAnimatedPathData.AnimationName == 'None')
        {
        }
    }
    OrientPawn();
    PerformAnimatedPathSM();
    stop;                    
}

defaultproperties
{
    bRecoverSpeedOnFinish=true
    bInterruptible=false
}