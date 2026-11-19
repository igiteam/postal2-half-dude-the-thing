class LPMortarLocationExplorer extends SPTickableObject
    hidecategories(Object);

enum MortarLocExplorationStateEnum
{
    MORT_EXP_State_NotStarted,      // 0
    MORT_EXP_State_Started,         // 1
    MORT_EXP_State_Finished,        // 2
    MORT_EXP_State_Aborted,         // 3
    MORT_EXP_State_MAX              // 4
};

struct native MortarSearchRequest
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheTarget;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RequesterCtrler;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RequesterPawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxFindMortarLocTraversalDistance;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationFoundToMortarFrom;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int IndexOfLocationFoundToMortarFrom;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSearchStarted;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSearchCompleted;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMortarSpotFound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSearchStarted;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSearchEnded;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MortarLocationExplorer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> HasValidMortarArcTest;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> FindMortarSpotTraversalFinished;

    structdefaultproperties
    {
        TheTarget=none
        RequesterCtrler=none
        RequesterPawn=none
        MaxFindMortarLocTraversalDistance=1000.0000000
        LocationFoundToMortarFrom=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        IndexOfLocationFoundToMortarFrom=-1
        bSearchStarted=false
        bSearchCompleted=false
        bMortarSpotFound=false
        TimeSearchStarted=0.0000000
        TimeSearchEnded=-1.0000000
        MortarLocationExplorer=none
        HasValidMortarArcTest=None
        FindMortarSpotTraversalFinished=None
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ExpState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindLobSpotTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindPositionBot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindFlyPositionBot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FlyLocationExploreData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Positions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL CurrentMortarSearchRequest[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentMortarSearchRequestMastersIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyOnFinish;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsThreat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ThreatTest__Delegate;

delegate ThreatTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x97E50000-0x00000000*/ private float DistSqFromActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

// Export ULPMortarLocationExplorer::execDestroy(FFrame&, void* const)
native function Destroy();

// Export ULPMortarLocationExplorer::execGetMortarPositionNative(FFrame&, void* const)
native final function GetMortarPositionNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutPos[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPMortarLocationExplorer::execSetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEventNative(FFrame&, void* const)
native final function SetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEventNative()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];


}

// Export ULPMortarLocationExplorer::execStartExplorationNative(FFrame&, void* const)
native function StartExplorationNative()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPMortarLocationExplorer::execPreStartSetSearchRequestNative(FFrame&, void* const)
native function PreStartSetSearchRequestNative()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewRequest[25165825];
    local /*0x97E50000-0x00000000*/ private int InCurrentMortarSearchRequestMastersIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];


}

// Export ULPMortarLocationExplorer::execCreateTraversalNative(FFrame&, void* const)
native final function CreateTraversalNative()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPMortarLocationExplorer::execCreateFromPawnClassNameNative(FFrame&, void* const)
native static final function CreateFromPawnClassNameNative()
{
    local /*0x97E50000-0x00000000*/ private name ContentPawnClassName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InOuter[8388609], ReturnValue;


}

// Export ULPMortarLocationExplorer::execCreateNewInstanceNative(FFrame&, void* const)
native static final function CreateNewInstanceNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOuter[8388609], ReturnValue;


}

final function SetThreatFunction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    IsThreat = Callback;
    //return;    
}

final function SetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    IsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent = Callback;
    //return;    
}

function PreStartSetSearchRequest()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewRequest[8388609];
    local /*0x97E50000-0x00000000*/ private int InCurrentMortarSearchRequestMastersIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    NotifyOnFinish = Callback;
    CurrentMortarSearchRequest = NewRequest;
    CurrentMortarSearchRequestMastersIndex = InCurrentMortarSearchRequestMastersIndex;
    // End:0x19E
    if(FindLobSpotTraversal != none)
    {
        FindLobSpotTraversal.SetActor(NewRequest.TheTarget);
        FindLobSpotTraversal.SetLosFunction(NewRequest.HasValidMortarArcTest);
        FindLobSpotTraversal.SetFinishCallBack(NotifyExplorationEnded);
        FindLobSpotTraversal.SetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent(IsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent);
        FindLobSpotTraversal.StartAndBindToController(NewRequest.RequesterCtrler, NewRequest.RequesterPawn.Location, NewRequest.MaxFindMortarLocTraversalDistance);
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

    newExplorer = LPMortarLocationExplorer(Class'LPMortarLocationExplorer'.static.Create());
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

    FindLobSpotTraversal = LPKyTraversalFindLobSpot(Class'LPKyTraversalFindLobSpot'.static.Create());
    // End:0x47
    if(FindLobSpotTraversal != none)
    {
        return true;        
    }
    else
    {
        return false;
    }
    return false;
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
    if(FindLobSpotTraversal != none)
    {
        FindLobSpotTraversal.Abort();
        FindLobSpotTraversal.Destroy();
        FindLobSpotTraversal = none;
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
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    ExpState = 1;
    return false;
    //return ReturnValue;    
}

function AbortExploration()
{
    // End:0x4B
    if((FindLobSpotTraversal != none) && FindPositionBot != none)
    {
        FindLobSpotTraversal.Abort();
        ExpState = 3;
    }
    ClearAllPositions();
    //return;    
}

function ClearAllPositions()
{
    Positions.Length = 0;
    //return;    
}

function GetMortarPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutPos[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5F
    if(FindLobSpotTraversal != none)
    {
        OutPos = FindLobSpotTraversal.Point.VertexInfo.Position;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WerePositionsUpdated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(FindLobSpotTraversal != none)
    {
        return FindLobSpotTraversal.WerePositionsUpdated();
    }
    return false;
    //return ReturnValue;    
}

protected function FindLobSpotTraversalAborted()
{
    ExpState = 3;
    //return;    
}

protected function NotifyExplorationEnded()
{
    // End:0xD2
    if(int(ExpState) != int(2))
    {
        ExpState = 2;
        // End:0xAC
        if(FindLobSpotTraversal != none)
        {
            OnSearchForMortarSpotFinish(FindLobSpotTraversal.Point.VertexInfo.Position, CurrentMortarSearchRequestMastersIndex, CurrentMortarSearchRequest.RequesterPawn, self);
        }
        // End:0xD2
        if(IsInState('ExplorationFinished'))
        {
            GotoState('ExplorationFinished', 'Begin');
        }
    }
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
    NotifyExplorationEnded();
    J0x19:

    // End:0x51 [Loop If]
    if(true)
    {
        // End:0x3F
        if(int(ExpState) == int(1))
        {
            GotoState('ExplorationStarted');
        }
        Sleep(0.0100000);
        // [Loop Continue]
        goto J0x19;
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
    FlyLocationExploreData=(IdealRadius=1000.0000000,MinFormationRadius=500.0000000,MaxFormationRadius=2000.0000000,DistanceErrorBuffer=50.0000000,CostOfDistanceDeltaInsideIdealPerMeter=100.0000000,CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000,MinFormationHeightDelta=1.0000000,FormationIdealHeightDelta=10.0000000,MaxFormationHeightDelta=20.0000000,HeightErrorBuffer=50.0000000,CostOfHeightDeltaBelowIdealPerMeter=100.0000000,CostOfHeightDeltaAboveIdealPerMeter=50.0000000,bUseHeightInsteadOfPitchForEvaluations=true,MaxPitchAllowedInUU=10,IdealPitchInUU=10,MinPitchAllowedInUU=0,PitchErrorBufferInUU=5,CostOfPitchDeltaBelowIdealPerUU=1.0000000,CostOfPitchDeltaAboveIdealPerUU=1.0000000,MinRangeFromVsForFlyLocToBeValid=800.0000000)
    CurrentMortarSearchRequest=(TheTarget=none,RequesterCtrler=none,RequesterPawn=none,MaxFindMortarLocTraversalDistance=1000.0000000,LocationFoundToMortarFrom=(X=0.0000000,Y=0.0000000,Z=0.0000000),IndexOfLocationFoundToMortarFrom=-1,bSearchStarted=false,bSearchCompleted=false,bMortarSpotFound=false,TimeSearchStarted=0.0000000,TimeSearchEnded=-1.0000000,MortarLocationExplorer=none,HasValidMortarArcTest=None,FindMortarSpotTraversalFinished=None)
    bCallScriptTick=true
}