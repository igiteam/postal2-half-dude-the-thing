class LPAICmd_GotoFleePoint extends LPAICmd_Objective within LPAIController;

struct FleePointInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FleeToActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttempted;

    structdefaultproperties
    {
        FleeToActor=none
        bAttempted=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FleePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool RotateToFaceSameDirectionAsFleePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool InterpolateToExactPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInterpolating[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlowThroughActorsHitOnWayToFleePoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToFaceWhileMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToAvoidWhileMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ActorToAvoidRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ActorToAvoidHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpeedScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxAttempts;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurAttempt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FleeTarget[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrevFocus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreInterpPos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreInterpRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalInterpPos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalInterpRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalPawnPos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalPawnRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpEndTime[536870913];

function SetFleePoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InFleePoint[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    FleePoint.Length = 0;
    FleePoint.Add(InFleePoint.Length);    
    I = 0;
    J0x2C:

    // End:0xB5 [Loop If]
    if(I < InFleePoint.Length)
    {
        FleePoint[I].FleeToActor = InFleePoint[I];
        FleePoint[I].bAttempted = false;
        ++I;
        // [Loop Continue]
        goto J0x2C;
    }
    //return;    
}

function SetPlowThroughActorsHitOnWayToFleePoint()
{
    local /*0x97E50000-0x00000000*/ private bool bInPlowThroughActorsHitOnWayToFleePoint[8388609];

    bPlowThroughActorsHitOnWayToFleePoint = bInPlowThroughActorsHitOnWayToFleePoint;
    //return;    
}

function ResetAttempted()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5A [Loop If]
    if(I < FleePoint.Length)
    {
        FleePoint[I].bAttempted = false;
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function Pushed()
{
    super.Pushed();
    PrevFocus = Outer.Focus;
    bPlowThroughActorsHitOnWayToFleePoint = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.Focus = PrevFocus;
    Outer.myAIPawn.bInvulnerableWhenFleeing = false;
    SetSpeedScale();
    //return;    
}

function PopCommandWithFaliure()
{
    Outer.PopCommand(self);
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPAICommand).LPCommandTick(DeltaTime);
    //return;    
}

function AvoidActorRange2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize2D(Outer.myAIPawn.Location - ActorToAvoidWhileMoving.Location);
    //return ReturnValue;    
}

function AvoidActorSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = MyRadius + ActorToAvoidRadius;
    return (AvoidActorRange2D()) - combinedRadius;
    //return ReturnValue;    
}

function InitFlee()
{
    MyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(Outer.myAIPawn);
    // End:0x11A
    if(ActorToAvoidWhileMoving != none)
    {
        // End:0xE9
        if(LPPawn(ActorToAvoidWhileMoving) != none)
        {
            ActorToAvoidRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(ActorToAvoidWhileMoving);
            ActorToAvoidHeight = LPPawn(ActorToAvoidWhileMoving).CylinderComponent.CollisionHeight;            
        }
        else
        {
            ActorToAvoidWhileMoving.GetBoundingCylinder(ActorToAvoidRadius, ActorToAvoidHeight);
        }
    }
    //return;    
}

function CostOfGoingToFleePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL FleeCandidate[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Dist, Cost;
    local /*0x97E50000-0x00000000*/ private @NULL FleePos, MyPositionRelativeToAvoidActor, FleePointPositionRelativeToAvoidActor;

    // End:0x1E
    if(FleeCandidate == none)
    {
        return 2147484000.0000000 * float(2147483647);
    }
    FleePos = FleeCandidate.Location;
    Dist = VSize(FleePos - Outer.myAIPawn.Location);
    Cost = Dist;
    // End:0x2C7
    if(ActorToAvoidWhileMoving != none)
    {
        MyPositionRelativeToAvoidActor = Outer.myAIPawn.Location - ActorToAvoidWhileMoving.Location;
        FleePointPositionRelativeToAvoidActor = FleeCandidate.Location - ActorToAvoidWhileMoving.Location;
        // End:0x259
        if((MyPositionRelativeToAvoidActor Dot FleePointPositionRelativeToAvoidActor) < float(0))
        {
            Dist = Class'SPEngine.SPUtil'.static.DistFromLineSegment(Outer.myAIPawn.Location, FleeCandidate.Location, ActorToAvoidWhileMoving.Location);
            Dist -= (MyRadius + ActorToAvoidRadius);
            // End:0x259
            if(Dist < (MyRadius * float(2)))
            {
                Cost += float(2147483647);
            }
        }
        // End:0x2C7
        if(VSize2D(FleeCandidate.Location - ActorToAvoidWhileMoving.Location) < (MyRadius * float(2)))
        {
            Cost += float(2147483647);
        }
    }
    return Cost;
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

function GetFleeTargetIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I, Idx;
    local /*0x97E50000-0x00000000*/ private float Cost, BestCost;

    BestCost = 2147484000.0000000 * float(2147483647);
    Idx = -1;
    I = 0;
    J0x32:

    // End:0xFB [Loop If]
    if(I < FleePoint.Length)
    {
        // End:0xED
        if(!FleePoint[I].bAttempted)
        {
            Cost = CostOfGoingToFleePoint(FleePoint[I].FleeToActor);
            // End:0xED
            if(Cost < BestCost)
            {
                Idx = I;
                BestCost = Cost;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x32;
    }
    return Idx;
    //return ReturnValue;    
}

function SetupNextFleePointToTry()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = GetFleeTargetIndex();
    // End:0x85
    if(Idx > -1)
    {
        FleeTarget = FleePoint[Idx].FleeToActor;
        FleePoint[Idx].bAttempted = true;
        return true;        
    }
    else
    {
        FleeTarget = none;
        return false;
    }
    //return ReturnValue;    
}

function SetSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private float Scale[9437185];

    -1.0000000
    // End:0xB8
    if(Scale < float(0))
    {
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));        
    }
    else
    {
        Outer.myAIPawn.SetMaxSpeedScale(Scale);
    }
    //return;    
}

function MoveToFleePoint()
{
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    // End:0x24C
    if(FleeTarget != none)
    {
        Outer.Focus = ActorToFaceWhileMoving;
        // End:0x133
        if(int(Outer.myAIPawn.Physics) == int(4))
        {
            MoveToActorCmd = Outer.CmdMoveToActorFly(FleeTarget, ActorToFaceWhileMoving, 50.0000000, 0.0000000, 50.0000000,, 1);            
        }
        else
        {
            MoveToActorCmd = Outer.CmdMoveToActorTight(FleeTarget, ActorToFaceWhileMoving, 0.0000000, Outer.CmdStatus_MoveToActor, 1);
            LPAICmd_MoveToActorTight(MoveToActorCmd).OverridePawnRadius(50.0000000);
        }
        MoveToActorCmd.bZeroVelocityOnFinish = true;
        MoveToActorCmd.SetMovementMonitorParameters(true, 10.0000000, 200.0000000, 2.0000000, NotifyOfFailedMovement);
        Outer.Focus = ActorToFaceWhileMoving;
    }
    //return;    
}

state StateCmdActive
{Begin:

    SetSpeedScale(SpeedScale);
    InitFlee();
    // End:0x4D
    if(FleePoint.Length < 1)
    {
        Outer.PopCommand(self);
    }
    CurAttempt++;
    GotoState('SelectNextFleePoint');
    stop;        
}

state SelectNextFleePoint
{Begin:

    // End:0x1E
    if(SetupNextFleePointToTry())
    {
        GotoState('MoveToFleeTarget');        
    }
    else
    {
        GotoState('FailedToFindFleePoint');
    }
    stop;                
}

state FailedToFindFleePoint
{Begin:

    // End:0x32
    if(CurAttempt < MaxAttempts)
    {
        ResetAttempted();
        GotoState('StateCmdActive');        
    }
    else
    {
        PopCommandWithFaliure();
    }
    stop;                
}

state MoveToFleeTarget
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
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

    function GotoPostMoveState()
    {
        // End:0x1E
        if(HasMoveToActorFailed())
        {
            GotoState('MoveToFleeTargetFailed');            
        }
        else
        {
            GotoState('RotateToFacing');
        }
        //return;        
    }
Begin:

    MoveToFleePoint();
    Outer.Sleep(0.0000000);
    GotoPostMoveState();
    Outer.Sleep(0.0000000);
    stop;        
}

state RotateToFacing
{
    ignores PreRotateTowardsFleePoint, PostRotateTowardsFleePoint;

    function PointToFace()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

        return (Vector(FleeTarget.Rotation) * float(100)) + Outer.myAIPawn.Location;
        //return ReturnValue;        
    }
Begin:

    Outer.Pawn.ZeroMovementVariables();
    // End:0xD1
    if(RotateToFaceSameDirectionAsFleePoint && FleeTarget != none)
    {
        Outer.Focus = none;
        PreRotateTowardsFleePoint();
        Outer.CmdTurnToFacePosition(0, PointToFace());
        Outer.Sleep(0.0000000);
        PostRotateTowardsFleePoint();
    }
    GotoState('MoveToFleeTargetFinished');
    stop;                    
}

state MoveToFleeTargetFailed
{Begin:

    GotoState('SelectNextFleePoint');
    stop;        
}

state MoveToFleeTargetFinished
{
    function TriggerReachEvent()
    {
        FleeTarget.TriggerEventClass(Class'LPSeqEvent_FleePointReached', Outer.myAIPawn);
        //return;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Alpha;
        local /*0x97E50000-0x00000000*/ private @NULL NewPos, NewRot;

        // End:0x1F1
        if(bInterpolating)
        {
            super(LPAICmd_GotoFleePoint).LPCommandTick(DeltaTime);
            Alpha = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(InterpStartTime, InterpEndTime, 0.0000000, 1.0000000, CurTime());
            // End:0x118
            if(Alpha >= float(1))
            {
                Alpha = 1.0000000;
                bInterpolating = false;
                Outer.myAIPawn.SetRotation(FinalInterpRot);
                Outer.myAIPawn.SetLocationNoCheck(FinalInterpPos);                
            }
            else
            {
                NewRot = RLerp(PreInterpRot, FinalInterpRot, Alpha, true);
                Outer.myAIPawn.SetRotation(NewRot);
                NewPos = VLerp(PreInterpPos, FinalInterpPos, Alpha);
                Outer.myAIPawn.SetLocationNoCheck(NewPos);
            }
        }
        //return;        
    }
Begin:

    // End:0x284
    if(InterpolateToExactPosition && !FleeTarget.bBlockActors)
    {
        Outer.myAIPawn.ZeroMovementVariables();
        Outer.Focus = none;
        Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
        PreInterpPos = Outer.myAIPawn.Location;
        PreInterpRot = Outer.myAIPawn.Rotation;
        FinalInterpPos = FleeTarget.Location;
        FinalInterpRot = FleeTarget.Rotation;
        FinalInterpRot.Roll = 0;
        InterpStartTime = CurTime();
        InterpEndTime = InterpStartTime + InterpTime;
        bInterpolating = true;
        Outer.EnableRotation(false);
        J0x1FA:

        // End:0x227 [Loop If]
        if(bInterpolating)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x1FA;
        }
        Outer.EnableRotation(true);
        FinalPawnPos = Outer.myAIPawn.Location;
    }
    TriggerReachEvent();
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    MaxAttempts=4
    InterpTime=0.2500000
    bInterruptible=false
}