class LPSurroundFormationExplorer extends SPTickableObject
    hidecategories(Object);

enum ExplorationStateEnum
{
    EXP_State_NotStarted,           // 0
    EXP_State_Started,              // 1
    EXP_State_Finished,             // 2
    EXP_State_Aborted,              // 3
    EXP_State_MAX                   // 4
};

struct native ExploredConnectedPositions
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Positions;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoop;

    structdefaultproperties
    {
        Positions=none
        bLoop=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ExpState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindPositionTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindPositionBot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IdealDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CenterActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Positions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ConnectedPositions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Sectors;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOnFinish;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> CanGoBetweenPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsThreat;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CanGoCheck__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __LosTest__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ThreatTest__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnFinish__Delegate;

// Export ULPSurroundFormationExplorer::execDestroy(FFrame&, void* const)
native function Destroy();

delegate CanGoCheck()
{
    local /*0x97E50000-0x00000000*/ private @NULL Origin[25296897], pos, DummyBot;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
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

delegate OnFinish()
{
    //return;    
}

final function SetCanGoBetweenPointsFunction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    // End:0x25
    if(Callback != none)
    {
        CanGoBetweenPoints = Callback;        
    }
    else
    {
        CanGoBetweenPoints = CheckCanGo;
    }
    //return;    
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

final function SetFinishCallBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    NotifyOnFinish = Callback;
    //return;    
}

final function SetSectors()
{
    local /*0x97E50000-0x00000000*/ private int InSectors[8388609];

    Sectors = InSectors;
    //return;    
}

function SetSearchDistances()
{
    local /*0x97E50000-0x00000000*/ private float InMinDistance[8388609], InMaxDistance, InIdealDistance;

    MinDistance = InMinDistance;
    MaxDistance = InMaxDistance;
    IdealDistance = InIdealDistance;
    // End:0x8B
    if(FindPositionTraversal != none)
    {
        FindPositionTraversal.SetSearchParams(MinDistance, MaxDistance, IdealDistance, Sectors);
    }
    //return;    
}

static function CreateFromPawnClassName()
{
    local /*0x97E50000-0x00000000*/ private name ContentPawnClassName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL newExplorer;

    bSuccess = false;
    newExplorer = CreateNewInstance();
    // End:0x66
    if(newExplorer != none)
    {
        // End:0x66
        if(newExplorer.CreateBotFromPawnClassName(ContentPawnClassName))
        {
            bSuccess = true;
        }
    }
    // End:0xCF
    if((newExplorer != none) && !bSuccess)
    {
        newExplorer.Cleanup();
        newExplorer.Destroy();
        newExplorer = none;
    }
    return newExplorer;
    //return ReturnValue;    
}

static function CreateFromPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL newExplorer;

    bSuccess = false;
    newExplorer = CreateNewInstance();
    // End:0x66
    if(newExplorer != none)
    {
        // End:0x66
        if(newExplorer.CreateBotFromPawn(inPawn))
        {
            bSuccess = true;
        }
    }
    // End:0xCF
    if((newExplorer != none) && !bSuccess)
    {
        newExplorer.Cleanup();
        newExplorer.Destroy();
        newExplorer = none;
    }
    return newExplorer;
    //return ReturnValue;    
}

protected static function CreateNewInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newExplorer;

    newExplorer = LPSurroundFormationExplorer(Class'LPSurroundFormationExplorer'.static.Create());
    // End:0x90
    if(newExplorer != none)
    {
        // End:0x90
        if(!newExplorer.CreateTraversal())
        {
            newExplorer.Destroy();
            newExplorer = none;
        }
    }
    return newExplorer;
    //return ReturnValue;    
}

function CreateTraversal()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FindPositionTraversal = LPKyTraversalAttackFormationSurround(Class'LPKyTraversalAttackFormationSurround'.static.Create());
    // End:0xD7
    if(FindPositionTraversal != none)
    {
        FindPositionTraversal.SetLosFunction(CheckLos);
        FindPositionTraversal.SetFinishCallBack(FindPositionTraversalFinished);
        FindPositionTraversal.SetAbortCallBack(FindPositionTraversalAborted);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CreateBotFromPawnClassName()
{
    local /*0x97E50000-0x00000000*/ private name ContentPawnClassName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FindPositionBot = Class'SPAIKynapse.SPKyDummyBot'.static.CreateFromContentPawnClassName(ContentPawnClassName);
    // End:0x46
    if(FindPositionBot != none)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CreateBotFromPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FindPositionBot = Class'SPAIKynapse.SPKyDummyBot'.static.CreateFromPawn(inPawn);
    // End:0x46
    if(FindPositionBot != none)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

event Cleanup()
{
    // End:0x58
    if(FindPositionTraversal != none)
    {
        FindPositionTraversal.Abort();
        FindPositionTraversal.Destroy();
        FindPositionTraversal = none;
    }
    // End:0x91
    if(FindPositionBot != none)
    {
        FindPositionBot.Destroy();
        FindPositionBot = none;
    }
    //return;    
}

function StartExploration()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCenterActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL StartPos, FloorAdjustedPos;
    local /*0x97E50000-0x00000000*/ private float Radius, Height, BotHeight;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn;

    // End:0x2DA
    if(((InCenterActor != none) && FindPositionTraversal != none) && FindPositionBot != none)
    {
        // End:0x2D8
        if(!FindPositionTraversal.IsRunning())
        {
            CenterActor = InCenterActor;
            StartPos = CenterActor.Location;
            FindPositionTraversal.SetCenterActor(CenterActor);
            BotHeight = FindPositionBot.GetHeight();
            // End:0x152
            if(FindPositionBot.GetFloorAdjustedPos(StartPos, FloorAdjustedPos))
            {
                FindPositionTraversal.StartAndBindToDummyBot(FindPositionBot, FloorAdjustedPos, MaxDistance);                
            }
            else
            {
                FloorAdjustedPos = StartPos;
                TargetPawn = Pawn(CenterActor);
                // End:0x20C
                if(TargetPawn != none)
                {
                    Height = TargetPawn.GetCollisionHeight();
                    Radius = TargetPawn.GetCollisionRadius();
                    FloorAdjustedPos.Z -= Height;                    
                }
                else
                {
                    CenterActor.GetBoundingCylinder(Radius, Height);
                    FloorAdjustedPos.Z -= (Height * 0.5000000);
                }
                FloorAdjustedPos.Z += BotHeight;
                FindPositionTraversal.StartAndBindToDummyBot(FindPositionBot, FloorAdjustedPos, MaxDistance);
            }
            ExpState = 1;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AbortExploration()
{
    // End:0x4B
    if((FindPositionTraversal != none) && FindPositionBot != none)
    {
        FindPositionTraversal.Abort();
        ExpState = 3;
    }
    ClearAllPositions();
    //return;    
}

function ClearAllPositions()
{
    Positions.Length = 0;
    ConnectedPositions.Length = 0;
    //return;    
}

function NumConnectedPositions()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ConnectedPositions.Length;
    //return ReturnValue;    
}

function NumPositions()
{
    local /*0x97E50000-0x00000000*/ private int InIndex[8388609], ReturnValue;

    // End:0x40
    if(InIndex < ConnectedPositions.Length)
    {
        return ConnectedPositions[InIndex].Positions.Length;
    }
    return 0;
    //return ReturnValue;    
}

function GetPosition()
{
    local /*0x97E50000-0x00000000*/ private int InIndex[8388609], PosIndex;
    local /*0x97E50000-0x00000000*/ private @NULL OutPosition[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x89
    if(InIndex < ConnectedPositions.Length)
    {
        // End:0x89
        if(PosIndex < ConnectedPositions[InIndex].Positions.Length)
        {
            OutPosition = ConnectedPositions[InIndex].Positions[PosIndex];
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function WerePositionsUpdated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(FindPositionTraversal != none)
    {
        return FindPositionTraversal.WerePositionsUpdated();
    }
    return false;
    //return ReturnValue;    
}

protected function FindPositionTraversalFinished()
{
    // End:0x37
    if(FindPositionTraversal != none)
    {
        FindPositionTraversal.GetPositions(Positions);
    }
    ExpState = 2;
    // End:0x69
    if(IsInState('ExplorationFinished'))
    {
        GotoState('ExplorationFinished', 'Begin');
    }
    //return;    
}

protected function FindPositionTraversalAborted()
{
    ExpState = 3;
    //return;    
}

protected function IsEdgeAngleGood()
{
    local /*0x97E50000-0x00000000*/ private @NULL Start[25296897], End, CenterLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EdgeDirection, MidPoint, CenterToMidDirection;
    local /*0x97E50000-0x00000000*/ private float DotResult;

    MidPoint = ((End - Start) * 0.5000000) + Start;
    EdgeDirection = Normal(End - Start);
    CenterToMidDirection = Normal(MidPoint - CenterLocation);
    DotResult = Abs(CenterToMidDirection Dot EdgeDirection);
    // End:0xA5
    if(DotResult > 0.5000000)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

protected function AreConnected()
{
    local /*0x97E50000-0x00000000*/ private @NULL Start[25296897], End;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Center;

    // End:0x129
    if(FindPositionBot != none)
    {
        // End:0x129
        if(FindPositionBot.CanGo(Start, End) && FindPositionBot.CanGo(End, Start))
        {
            // End:0x129
            if(Class'SPEngine.SPUtil'.static.DistFromLineSegment(Start, End, CenterActor.Location) > MinDistance)
            {
                Center = FindPositionTraversal.GetStartPoint();
                // End:0x129
                if(IsEdgeAngleGood(Start, End, Center))
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

protected function BuildConnectedPositions()
{
    local /*0x97E50000-0x00000000*/ private int SpanStart, CurSpan, NumSpan, P;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL DefaultConnectedPositions, P0, P1;

    ConnectedPositions.Length = 0;
    SpanStart = 0;
    J0x17:

    // End:0x18A [Loop If]
    if(SpanStart < Positions.Length)
    {
        ConnectedPositions.AddItem(DefaultConnectedPositions);        
        CurSpan = ConnectedPositions.Length - 1;
        ConnectedPositions[CurSpan].Positions.AddItem(Positions[SpanStart]);        
        P = SpanStart + 1;
        J0xAF:

        // End:0x174 [Loop If]
        if(P < Positions.Length)
        {
            P0 = Positions[P - 1];
            P1 = Positions[P];
            // End:0x163
            if(AreConnected(P0, P1))
            {
                ConnectedPositions[CurSpan].Positions.AddItem(Positions[P]);                                
            }
            else
            {
                // [Explicit Break]
                goto J0x174;
            }
            ++P;
            // [Loop Continue]
            goto J0xAF;
        }
        J0x174:

        SpanStart = P;
        // [Loop Continue]
        goto J0x17;
    }
    NumSpan = ConnectedPositions.Length;
    // End:0x313
    if(NumSpan > 1)
    {
        P0 = ConnectedPositions[NumSpan - 1].Positions[ConnectedPositions[NumSpan - 1].Positions.Length - 1];
        P1 = ConnectedPositions[0].Positions[0];
        // End:0x313
        if(AreConnected(P0, P1))
        {
            P = 0;
            J0x262:

            // End:0x2F2 [Loop If]
            if(P < ConnectedPositions[0].Positions.Length)
            {
                ConnectedPositions[NumSpan - 1].Positions.AddItem(ConnectedPositions[0].Positions[P]);                
                ++P;
                // [Loop Continue]
                goto J0x262;
            }
            ConnectedPositions.Remove(0, 1);            
            NumSpan = ConnectedPositions.Length;
        }
    }
    // End:0x3D7
    if(NumSpan == 1)
    {
        P0 = ConnectedPositions[0].Positions[0];
        P1 = ConnectedPositions[0].Positions[ConnectedPositions[0].Positions.Length - 1];
        // End:0x3D7
        if(AreConnected(P0, P1))
        {
            ConnectedPositions[0].bLoop = true;
        }
    }
    //return;    
}

protected function CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bVis1, bVis2;
    local /*0x97E50000-0x00000000*/ private @NULL Center, AdjustedPos;

    // End:0x74
    if(!FindPositionBot.GetFloorAdjustedPos(TestActor.Location, Center))
    {
        Center = FindPositionTraversal.GetStartPoint();
    }
    // End:0xAC
    if(!FindPositionBot.GetFloorAdjustedPos(Position, AdjustedPos))
    {
        return false;
    }
    bVis1 = CanGoCheck(Center, AdjustedPos, FindPositionBot);
    // End:0x133
    if(bVis1)
    {
        bVis2 = (TestActor == none) || LosTest(Position, TestActor);
    }
    return bVis1 && bVis2;
    //return ReturnValue;    
}

function CheckCanGo()
{
    local /*0x97E50000-0x00000000*/ private @NULL Origin[25296897], Position, Bot;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(!Bot.CanGo(Origin, Position))
    {
        return false;        
    }
    else
    {
        // End:0x73
        if(!Bot.CanGo(Position, Origin))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

protected function CheckThreat()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x97E50000-0x00000000*/ private float DistSqFromActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ThreatTest(TestActor, DistSqFromActor);
    //return ReturnValue;    
}

protected function NotifyExplorationEnded()
{
    OnFinish();
    //return;    
}

auto state StartState
{    J0x00:
    // End:0x7F [Loop If]
    if(true)
    {
        Sleep(0.0100000);
        // End:0x35
        if(int(ExpState) == int(1))
        {
            GotoState('ExplorationStarted');
        }
        // End:0x5A
        if(int(ExpState) == int(2))
        {
            GotoState('ExplorationFinished');            
        }
        else
        {
            // End:0x7C
            if(int(ExpState) == int(3))
            {
                GotoState('ExplorationAborted');
            }
        }
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

state ExplorationStarted
{    J0x00:
    // End:0x5D [Loop If]
    if(true)
    {
        Sleep(0.0100000);
        // End:0x38
        if(int(ExpState) == int(2))
        {
            GotoState('ExplorationFinished');            
        }
        else
        {
            // End:0x5A
            if(int(ExpState) == int(3))
            {
                GotoState('ExplorationAborted');
            }
        }
        // [Loop Continue]
        goto J0x00;
    }
    stop;            
}

state ExplorationFinished
{Begin:

    Sleep(0.0100000);
    BuildConnectedPositions();
    NotifyExplorationEnded();
    J0x23:

    // End:0x5B [Loop If]
    if(true)
    {
        // End:0x49
        if(int(ExpState) == int(1))
        {
            GotoState('ExplorationStarted');
        }
        Sleep(0.0100000);
        // [Loop Continue]
        goto J0x23;
    }
    stop;                    
}

state ExplorationAborted
{Begin:

    NotifyExplorationEnded();
    J0x0A:

    // End:0x42 [Loop If]
    if(true)
    {
        Sleep(0.0100000);
        // End:0x3F
        if(int(ExpState) == int(1))
        {
            GotoState('ExplorationStarted');
        }
        // [Loop Continue]
        goto J0x0A;
    }
    stop;        
}

defaultproperties
{
    CanGoBetweenPoints=CheckCanGo
    bCallScriptTick=true
}