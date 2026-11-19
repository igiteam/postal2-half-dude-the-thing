class LPAICmd_MoveCircling extends LPAICmd_MoveToPosition within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CenterActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Center[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InnerRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OuterRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleInc[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CirclingTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CirclingEndTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartedCircling[536870913];

function SetDesiredTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetActor[8388609];

    // End:0x4C
    if(Controller(TargetActor) != none)
    {
        CenterActor = Controller(TargetActor).Pawn;        
    }
    else
    {
        CenterActor = TargetActor;
    }
    //return;    
}

function SetDesiredCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCenter[8388609];

    Center = InCenter;
    //return;    
}

function SetInnerRadius()
{
    local /*0x97E50000-0x00000000*/ private float Radius[8388609];

    InnerRadius = Radius;
    //return;    
}

function SetOuterRadius()
{
    local /*0x97E50000-0x00000000*/ private float Radius[8388609];

    OuterRadius = Radius;
    //return;    
}

function AbortCircling()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x18
    if(MoveAbortDelegate())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super(LPAICmd_Move).Popped();
    //return;    
}

protected function IsOutsideCircle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Nearest[26214401];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Threshold, Dist;
    local /*0x97E50000-0x00000000*/ private @NULL RelPosition, Direction, MyLocation;

    MyLocation = Outer.myAIPawn.Location;
    RelPosition = MyLocation - Center;
    Direction = Normal(RelPosition);
    Nearest = (Direction * InnerRadius) + Center;
    Threshold = Outer.MyKynapseRadius * float(4);
    Dist = VSize2D(Nearest - MyLocation);
    // End:0x109
    if(Dist > Threshold)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function SetupNextMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897];
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];

    Outer.MyKynapseRadius
    ResetMoveVars();
    // End:0x5A
    if(MoveToPositionStatus != none)
    {
        MoveToPositionStatus.SetDefaults();
    }
    CurDesiredDestination = Position;
    DesiredSeperation = reachDist;
    //return;    
}

protected function GetAngularPosition()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Direction;

    Direction = Outer.myAIPawn.Location - Center;
    return Atan2(Direction.Y, Direction.X);
    //return ReturnValue;    
}

function IsMovePointValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsDestinationInsideAiMesh(Position) && !IsVitalSuitAtLocation(Position, Outer.MyKynapseRadius);
    //return ReturnValue;    
}

protected function SetNextDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Angle;
    local /*0x97E50000-0x00000000*/ private @NULL NextPoint;
    local /*0x97E50000-0x00000000*/ private bool bNextPointAvailable;
    local /*0x97E50000-0x00000000*/ private float CurAngularPosition;

    // End:0x6B
    if((CirclingEndTime > float(0)) && CirclingEndTime < Outer.myAIPawn.WorldInfo.TimeSeconds)
    {
        return false;
    }
    // End:0xC6
    if(CenterActor != none)
    {
        // End:0x9E
        if(CenterActor.IsPendingKill())
        {
            return false;
        }
        Center = CenterActor.Location;
    }
    // End:0x141
    if(IsOutsideCircle(NextPoint))
    {
        bNextPointAvailable = IsMovePointValid(NextPoint);
        // End:0x13E
        if(bNextPointAvailable)
        {
            SetupNextMove(NextPoint, Outer.MyKynapseRadius * float(2));
        }        
    }
    else
    {
        SetCirclingTimer();
        CurAngularPosition = GetAngularPosition();
        Angle = CurAngularPosition + AngleInc;
        Class'SPEngine.SPUtil'.static.NormalizeRadian(Angle);
        NextPoint.X = Cos(Angle);
        NextPoint.Y = Sin(Angle);
        NextPoint.Z = 0.0000000;
        NextPoint = (NextPoint * InnerRadius) + Center;
        bNextPointAvailable = IsMovePointValid(NextPoint);
        // End:0x27F
        if(bNextPointAvailable)
        {
            SetupNextMove(NextPoint);
        }
    }
    return bNextPointAvailable;
    //return ReturnValue;    
}

function SetCirclingTimer()
{
    // End:0x9B
    if(!bStartedCircling)
    {
        bStartedCircling = true;
        // End:0x8C
        if(CirclingTime > float(0))
        {
            CirclingEndTime = Outer.myAIPawn.WorldInfo.TimeSeconds + CirclingTime;            
        }
        else
        {
            CirclingEndTime = -1.0000000;
        }
    }
    //return;    
}

function InitializeMovement()
{
    CirclingEndTime = -1.0000000;
    AngleInc = (2.0000000 * 3.1415930) / 4.0000000;
    // End:0x63
    if(CenterActor != none)
    {
        Center = CenterActor.Location;
    }
    RemoveAllMoveConstraint();
    AddAreaConstraint(Center, InnerRadius, 1000.0000000);
    //return;    
}

function ExitWithFaliure()
{
    LPAICmd_Move_Status(4);
    Outer.PopCommand(self);
    //return;    
}

state StateCmdActive
{Begin:

    // End:0x36
    if(InnerRadius < Outer.MyKynapseRadius)
    {
        ExitWithFaliure();
    }
    InitializeMovement();
    bZeroVelocityOnFinish = false;
    // End:0x87
    if(SetNextDestination())
    {
        Outer.Sleep(0.0100000);
        GotoState('MoveToCurrentDestination');        
    }
    else
    {
        ExitWithFaliure();
    }
    stop;            
}

state MoveEnded
{Begin:

    StopPathing();
    // End:0x45
    if(SetNextDestination())
    {
        Outer.Sleep(0.0100000);
        GotoState('MoveToCurrentDestination');        
    }
    else
    {
        ExitWithFaliure();
    }
    stop;                    
}

defaultproperties
{
    CirclingTime=-1.0000000
    CirclingEndTime=-1.0000000
}