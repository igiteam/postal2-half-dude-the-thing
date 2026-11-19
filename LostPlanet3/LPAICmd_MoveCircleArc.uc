class LPAICmd_MoveCircleArc extends LPAICmd_MoveToPosition within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Center;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Radius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Alpha;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CircleArcStartLimit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CircleArcEndLimit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResetParams[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AreaConstraint[536870913];

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

function SetCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCenter[8388609];

    Center = InCenter;
    //return;    
}

function SetRadius()
{
    local /*0x97E50000-0x00000000*/ private float Inradius[8388609];

    Radius = Inradius;
    //return;    
}

function SetDesiredPosition()
{
    local /*0x97E50000-0x00000000*/ private float InAlpha[8388609];

    Alpha = InAlpha;
    // End:0x36
    if(Alpha < float(0))
    {
        Alpha = 0.0000000;        
    }
    else
    {
        // End:0x56
        if(Alpha > float(1))
        {
            Alpha = 1.0000000;
        }
    }
    //return;    
}

function SetArcLimits()
{
    local /*0x97E50000-0x00000000*/ private float arcStart[8388609], arcEnd;

    Class'SPEngine.SPUtil'.static.NormalizeRadian(arcStart);
    Class'SPEngine.SPUtil'.static.NormalizeRadian(arcEnd);
    CircleArcStartLimit = arcStart;
    CircleArcEndLimit = arcEnd;
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Move).SPAborted();
    //return;    
}

private final function SetupNextMove()
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

function InitMove()
{
    local /*0x97E50000-0x00000000*/ private float DesiredAngularPosition;
    local /*0x97E50000-0x00000000*/ private @NULL FinalDestination;

    bResetParams = false;
    Class'SPEngine.SPUtil'.static.NormalizeRadian(CircleArcStartLimit);
    Class'SPEngine.SPUtil'.static.NormalizeRadian(CircleArcEndLimit);
    DesiredAngularPosition = Class'SPEngine.SPUtil'.static.InterpolateRadianClockWise(CircleArcStartLimit, CircleArcEndLimit, Alpha);
    FinalDestination.X = Cos(DesiredAngularPosition);
    FinalDestination.Y = Sin(DesiredAngularPosition);
    FinalDestination.Z = 0.0000000;
    FinalDestination = (FinalDestination * Radius) + Center;
    RemoveMoveConstraint(AreaConstraint);
    AreaConstraint = AddAreaConstraint(Center, Radius, 1000.0000000);
    SetupNextMove(FinalDestination);
    //return;    
}

function UpdateDuringMove()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x13
    if(bResetParams)
    {
        return 1;        
    }
    else
    {
        return 0;
    }
    //return ReturnValue;    
}

function ResetParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCenter[25296897];
    local /*0x97E50000-0x00000000*/ private float NewRadius[8388609], arcStart, arcEnd;

    bResetParams = true;
    StopPathing();
    SetCenter(NewCenter);
    SetRadius(NewRadius);
    SetArcLimits(arcStart, arcEnd);
    //return;    
}

state StateCmdActive
{Begin:

    InitMove();
    GotoState('MoveToCurrentDestination');
    stop;                
}

state MoveEnded
{Begin:

    // End:0x1E
    if(bResetParams)
    {
        GotoState('StateCmdActive');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;        
}
