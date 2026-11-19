class LPKyTraversalAttackFormationSurround extends LPKyTraversal;

struct native SAFVertex
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Position;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rating;

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rating=0.0000000
    }
};

struct native SAFDebugVertex extends SAFVertex
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool IsUsable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Bin;

    structdefaultproperties
    {
        Bin=-1
    }
};

struct native AngularBin
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Vertex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DotCompare[2];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Direction;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CenterPosition;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValueSet;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipUpdate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DebugColor;

    structdefaultproperties
    {
        Vertex=(Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rating=0.0000000)
        DotCompare[0]=0.0000000
        DotCompare[1]=0.0000000
        Direction=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        CenterPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bValueSet=false
        bSkipUpdate=false
        DebugColor=(R=0,G=0,B=0,A=0)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsThreat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IdealDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMustHaveLos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableDebug;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPositionsUpdated;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRetainOldPositions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStopTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationCenterActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationCenter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DebugVertex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AngularPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Segments;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadiansPerSegment;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __LosTest__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ThreatTest__Delegate;

// Export ULPKyTraversalAttackFormationSurround::execGetPositions(FFrame&, void* const)
native function GetPositions()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Positions[25165825];


}

// Export ULPKyTraversalAttackFormationSurround::execGetDotCompareFromAngle(FFrame&, void* const)
protected native function GetDotCompareFromAngle()
{
    local /*0x97E50000-0x00000000*/ private float Angle[8388609], ReturnValue;


}

// Export ULPKyTraversalAttackFormationSurround::execInitBins(FFrame&, void* const)
protected native function InitBins();

// Export ULPKyTraversalAttackFormationSurround::execSetBinPositions(FFrame&, void* const)
protected native function SetBinPositions();

// Export ULPKyTraversalAttackFormationSurround::execCompareAgainstRange(FFrame&, void* const)
protected native function CompareAgainstRange()
{
    local /*0x97E50000-0x00000000*/ private float Min[8388609], Max, Value;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFormationSurround::execGetBinFromDot(FFrame&, void* const)
protected native function GetBinFromDot()
{
    local /*0x97E50000-0x00000000*/ private float InDot[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFormationSurround::execGetBin(FFrame&, void* const)
protected native function GetBin()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFormationSurround::execIsPositionUsable(FFrame&, void* const)
protected native function IsPositionUsable()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFormationSurround::execRatePosition(FFrame&, void* const)
protected native function RatePosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[8388609];
    local /*0x97E50000-0x00000000*/ private int Bin[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFormationSurround::execConditionallyAddPosition(FFrame&, void* const)
protected native function ConditionallyAddPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFormationSurround::execPostTraversal(FFrame&, void* const)
protected native function PostTraversal();

// Export ULPKyTraversalAttackFormationSurround::execIsInRange(FFrame&, void* const)
protected native function IsInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Posiion[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

delegate LosTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate ThreatTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x97E50000-0x00000000*/ private float DistSqFromActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

final function SetLosFunction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    IsVisible = Callback;
    //return;    
}

final function SetThreatFunction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    IsThreat = Callback;
    //return;    
}

final function SetSearchParams()
{
    local /*0x97E50000-0x00000000*/ private float InMin[8388609], InMax, InIdeal;
    local /*0x97E50000-0x00000000*/ private int InSegments[8388609];

    MinDistance = InMin;
    MaxDistance = InMax;
    IdealDistance = InIdeal;
    // End:0x6F
    if(InSegments != Segments)
    {
        AngularPosition.Length = 0;
        Segments = InSegments;
    }
    //return;    
}

final function SetCenterActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    FormationCenterActor = inActor;
    FormationCenter = inActor.Location;
    //return;    
}

final function SetCenterPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPos[8388609];

    FormationCenter = InPos;
    //return;    
}

function WerePositionsUpdated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bPositionsUpdated;
    //return ReturnValue;    
}

protected event CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LosTest(Position, TestActor);
    //return ReturnValue;    
}

protected event CheckThreat()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x97E50000-0x00000000*/ private float DistSqFromActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ThreatTest(TestActor, DistSqFromActor);
    //return ReturnValue;    
}

protected event TraversalStrated()
{
    bPositionsUpdated = false;
    bStopTraversal = false;
    // End:0x3B
    if(FormationCenterActor != none)
    {
        FormationCenter = GetStartPoint();
    }
    DebugVertex.Length = 0;
    // End:0x61
    if(AngularPosition.Length == 0)
    {
        InitBins();
    }
    SetBinPositions();
    super.TraversalStrated();
    //return;    
}

protected event TraversalFinished()
{
    PostTraversal();
    super.TraversalFinished();
    //return;    
}

protected event TraversalAborted()
{
    DebugVertex.Length = 0;
    super.TraversalAborted();
    //return;    
}

function Abort()
{
    super(SPKyTraversal).Abort();
    AngularPosition.Length = 0;
    DebugVertex.Length = 0;
    //return;    
}

protected function GetBinTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL Direction, North;
    local /*0x97E50000-0x00000000*/ private float DotResult;
    local /*0x97E50000-0x00000000*/ private @NULL CrossResult, TestDirection;
    local /*0x97E50000-0x00000000*/ private int I;

    North.X = 1.0000000;
    North.Y = 0.0000000;
    North.Z = 0.0000000;
    TestDirection[0] = vect(1.0000000, 0.0000000, 0.0000000);
    TestDirection[1] = vect(1.0000000, 1.0000000, 0.0000000);
    TestDirection[2] = vect(0.0000000, 1.0000000, 0.0000000);
    TestDirection[3] = vect(-1.0000000, 1.0000000, 0.0000000);
    TestDirection[4] = vect(-1.0000000, 0.0000000, 0.0000000);
    TestDirection[5] = vect(-1.0000000, -1.0000000, 0.0000000);
    TestDirection[6] = vect(0.0000000, -1.0000000, 0.0000000);
    TestDirection[7] = vect(1.0000000, -1.0000000, 0.0000000);
    I = 0;
    J0x13F:

    // End:0x22D [Loop If]
    if(I < 8)
    {
        Direction = TestDirection[I];
        Direction.Z = 0.0000000;
        Direction = Normal(Direction);
        DotResult = Direction Dot North;
        CrossResult = Direction Cross North;
        // End:0x21F
        if(CrossResult.Z > float(0))
        {
            DotResult = -DotResult - 2.0000000;
        }
        ++I;
        // [Loop Continue]
        goto J0x13F;
    }
    //return;    
}

defaultproperties
{
    bMustHaveLos=true
    bEnableDebug=true
    bRetainOldPositions=true
}