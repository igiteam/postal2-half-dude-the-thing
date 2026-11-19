class AutoTestManager extends Info
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x35EA0000-0x00000000*/ private bool bAutomatedPerfTesting;
var(*) /*0x35EA0000-0x00000000*/ private bool bAutoContinueToNextRound;
var(*) /*0x35EA0000-0x00000000*/ private bool bUsingAutomatedTestingMapList;
var(*) /*0x35EA0000-0x00000000*/ private bool bAutomatedTestingWithOpen;
var(*) /*0x35EA0000-0x00000000*/ private input bool bExitOnCyclesComplete[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckingForFragmentation;
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckingForMemLeaks;
var(*) /*0x35EA0000-0x00000000*/ private bool bDoingASentinelRun;
var(*) /*0x35EA0000-0x00000000*/ private bool bSentinelStreamingLevelStillLoading[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int AutomatedPerfRemainingTime;
var(*) /*0x35EA0000-0x00000000*/ private int AutomatedTestingMapIndex;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array AutomatedMapTestingList[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int NumAutomatedMapTestingCycles[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int NumberOfMatchesPlayed;
var(*) /*0x35EA0000-0x00000000*/ private int NumMapListCyclesDone;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AutomatedTestingExecCommandToRunAtStartMatch;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AutomatedMapTestingTransitionMap;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SentinelTaskDescription;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SentinelTaskParameter;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SentinelTagDesc;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SentinelPC[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SentinelTravelArray[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int SentinelNavigationIdx[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int SentinelIdx[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int NumRotationsIncrement[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int TravelPointsIncrement[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int NumMinutesPerMap[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CommandsToRunAtEachTravelTheWorldNode[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string CommandStringToExec[536870913];

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetTimer(1.0000000, true);
    //return;    
}

event Timer()
{
    // End:0x63
    if((bAutomatedPerfTesting && AutomatedPerfRemainingTime > 0) && !bAutoContinueToNextRound)
    {
        AutomatedPerfRemainingTime--;
        // End:0x63
        if(AutomatedPerfRemainingTime <= 0)
        {            
            ConsoleCommand("EXIT");
        }
    }
    //return;    
}

function InitializeOptions()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], InOpt;

    AutomatedPerfRemainingTime = 60 * WorldInfo.Game.TimeLimit;
    bAutomatedPerfTesting = (WorldInfo.Game.ParseOption(Options, "AutomatedPerfTesting") ~= "1") || WorldInfo.Game.ParseOption(Options, "gAPT") ~= "1";
    bCheckingForFragmentation = (WorldInfo.Game.ParseOption(Options, "CheckingForFragmentation") ~= "1") || WorldInfo.Game.ParseOption(Options, "gCFF") ~= "1";
    bCheckingForMemLeaks = (WorldInfo.Game.ParseOption(Options, "CheckingForMemLeaks") ~= "1") || WorldInfo.Game.ParseOption(Options, "gCFML") ~= "1";
    bDoingASentinelRun = (WorldInfo.Game.ParseOption(Options, "DoingASentinelRun") ~= "1") || WorldInfo.Game.ParseOption(Options, "gDASR") ~= "1";
    SentinelTaskDescription = WorldInfo.Game.ParseOption(Options, "SentinelTaskDescription");
    // End:0x3C0
    if(SentinelTaskDescription == "")
    {
        SentinelTaskDescription = WorldInfo.Game.ParseOption(Options, "gSTD");
    }
    SentinelTaskParameter = WorldInfo.Game.ParseOption(Options, "SentinelTaskParameter");
    // End:0x47B
    if(SentinelTaskParameter == "")
    {
        SentinelTaskParameter = WorldInfo.Game.ParseOption(Options, "gSTP");
    }
    SentinelTagDesc = WorldInfo.Game.ParseOption(Options, "SentinelTagDesc");
    // End:0x531
    if(SentinelTagDesc == "")
    {
        SentinelTagDesc = WorldInfo.Game.ParseOption(Options, "gSTDD");
    }
    InOpt = WorldInfo.Game.ParseOption(Options, "AutoContinueToNextRound");
    // End:0x5B7
    if(InOpt != "")
    {
        bAutoContinueToNextRound = bool(InOpt);
    }
    InOpt = WorldInfo.Game.ParseOption(Options, "bUsingAutomatedTestingMapList");
    // End:0x643
    if(InOpt != "")
    {
        bUsingAutomatedTestingMapList = bool(InOpt);
    }
    // End:0x66C
    if(bUsingAutomatedTestingMapList)
    {
        // End:0x66C
        if(AutomatedMapTestingList.Length == 0)
        {
            bUsingAutomatedTestingMapList = false;
        }
    }
    InOpt = WorldInfo.Game.ParseOption(Options, "bAutomatedTestingWithOpen");
    // End:0x6F4
    if(InOpt != "")
    {
        bAutomatedTestingWithOpen = bool(InOpt);
    }
    AutomatedTestingExecCommandToRunAtStartMatch = WorldInfo.Game.ParseOption(Options, "AutomatedTestingExecCommandToRunAtStartMatch");
    AutomatedMapTestingTransitionMap = WorldInfo.Game.ParseOption(Options, "AutomatedMapTestingTransitionMap");
    InOpt = WorldInfo.Game.ParseOption(Options, "AutomatedTestingMapIndex");
    // End:0x858
    if(InOpt != "")
    {
        AutomatedTestingMapIndex = int(InOpt);
    }
    // End:0x96D
    if(bAutomatedTestingWithOpen)
    {
        InOpt = WorldInfo.Game.ParseOption(Options, "NumberOfMatchesPlayed");
        // End:0x8E8
        if(InOpt != "")
        {
            NumberOfMatchesPlayed = int(InOpt);
        }
        InOpt = WorldInfo.Game.ParseOption(Options, "NumMapListCyclesDone");
        // End:0x96A
        if(InOpt != "")
        {
            NumMapListCyclesDone = int(InOpt);
        }        
    }
    else
    {
        AutomatedMapTestingTransitionMap = "";
    }
    //return;    
}

// Export UAutoTestManager::execBeginSentinelRun(FFrame&, void* const)
native function BeginSentinelRun()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TaskDescription[8519681], TaskParameter, TagDesc;


}

// Export UAutoTestManager::execAddSentinelPerTimePeriodStats(FFrame&, void* const)
native function AddSentinelPerTimePeriodStats()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLocation[8519681], InRotation;


}

// Export UAutoTestManager::execEndSentinelRun(FFrame&, void* const)
native function EndSentinelRun()
{
    local /*0x35EA0000-0x00000000*/ private byte RunResult[8388609];


}

function DoTravelTheWorld()
{
    GotoState('TravelTheWorld');
    //return;    
}

// Export UAutoTestManager::execDoSentinelActionPerLoadedMap(FFrame&, void* const)
native function DoSentinelActionPerLoadedMap();

// Export UAutoTestManager::execHandlePerLoadedMapAudioStats(FFrame&, void* const)
native function HandlePerLoadedMapAudioStats();

// Export UAutoTestManager::execGetTravelLocations(FFrame&, void* const)
native function GetTravelLocations()
{
    local /*0x35EA0000-0x00000000*/ private name LevelName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array TravelPoints[25165825];


}

// Export UAutoTestManager::execDoSentinel_MemoryAtSpecificLocation(FFrame&, void* const)
native function DoSentinel_MemoryAtSpecificLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLocation[8519681], InRotation;


}

// Export UAutoTestManager::execDoSentinel_PerfAtSpecificLocation(FFrame&, void* const)
native function DoSentinel_PerfAtSpecificLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLocation[25296897], InRotation;


}

// Export UAutoTestManager::execDoSentinel_ViewDependentMemoryAtSpecificLocation(FFrame&, void* const)
native function DoSentinel_ViewDependentMemoryAtSpecificLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLocation[25296897], InRotation;


}

function DoTimeBasedSentinelStatGathering()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC, ViewLocation, ViewRotation;

    // End:0x23
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        // End:0x23
        break;        
    }    
    PC.GetPlayerViewPoint(ViewLocation, ViewRotation);
    // End:0xF7
    if((SentinelTaskDescription != "FlyThrough") && SentinelTaskDescription != "FlyThroughSplitScreen")
    {
        // End:0xF7
        if(PC.Pawn != none)
        {
            ViewLocation = PC.Pawn.Location;
        }
    }
    AddSentinelPerTimePeriodStats(ViewLocation, ViewRotation);
    //return;    
}

// Export UAutoTestManager::execDoMemoryTracking(FFrame&, void* const)
native function DoMemoryTracking();

event StartAutomatedMapTestTimer()
{
    SetTimer(5.0000000, true, 'StartAutomatedMapTestTimerWorker');
    //return;    
}

function StartAutomatedMapTestTimerWorker()
{
    local /*0x35EA0000-0x00000000*/ private int LevelIdx;

    // End:0xB2
    if(WorldInfo != none)
    {
        LevelIdx = 0;
        J0x1A:

        // End:0x9B [Loop If]
        if(LevelIdx < WorldInfo.StreamingLevels.Length)
        {
            // End:0x8D
            if(WorldInfo.StreamingLevels[LevelIdx].bHasLoadRequestPending == true)
            {
                return;
            }
            ++LevelIdx;
            // [Loop Continue]
            goto J0x1A;
        }
        // End:0xB2
        if(bCheckingForMemLeaks)
        {
            DoMemoryTracking();
        }
    }
    ClearTimer('StartAutomatedMapTestTimerWorker');
    SetTimer(15.0000000, false, 'CloseAutomatedMapTestTimer');
    //return;    
}

function CloseAutomatedMapTestTimer()
{
    // End:0x57
    if(Len(AutomatedMapTestingTransitionMap) > 0)
    {
        // End:0x54
        if(AutomatedTestingMapIndex < 0)
        {
            WorldInfo.Game.RestartGame();
        }        
    }
    else
    {
        WorldInfo.Game.RestartGame();
    }
    //return;    
}

function IncrementAutomatedTestingMapIndex()
{
    // End:0x3D
    if(bUsingAutomatedTestingMapList == true)
    {
        // End:0x23
        if(bAutomatedTestingWithOpen == true)
        {            
        }
        else
        {
            // End:0x3D
            if(AutomatedTestingMapIndex >= 0)
            {
                AutomatedTestingMapIndex++;
            }
        }
    }
    //return;    
}

function IncrementNumberOfMatchesPlayed()
{
    NumberOfMatchesPlayed++;
    //return;    
}

function GetNextAutomatedTestingMap()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689], MapName;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private bool bResetMapIndex;

    // End:0x2E7
    if(bUsingAutomatedTestingMapList)
    {
        // End:0x62
        if((AutomatedTestingMapIndex >= 0) && Len(AutomatedMapTestingTransitionMap) > 0)
        {
            AutomatedTestingMapIndex++;
            AutomatedTestingMapIndex *= float(-1);
            MapName = AutomatedMapTestingTransitionMap;            
        }
        else
        {
            // End:0x85
            if(Len(AutomatedMapTestingTransitionMap) > 0)
            {
                AutomatedTestingMapIndex *= float(-1);
            }
            // End:0xBF
            if(AutomatedTestingMapIndex >= AutomatedMapTestingList.Length)
            {
                AutomatedTestingMapIndex = 0;
                NumMapListCyclesDone++;
                bResetMapIndex = true;
            }
            MapName = AutomatedMapTestingList[AutomatedTestingMapIndex];
        }
        // End:0x182
        if(bAutomatedTestingWithOpen == true)
        {
            // End:0x17F
            if((NumMapListCyclesDone >= NumAutomatedMapTestingCycles) && NumAutomatedMapTestingCycles != 0)
            {
                // End:0x158
                if(bCheckingForMemLeaks)
                {                    
                    ConsoleCommand("DEFERRED_STOPMEMTRACKING_AND_DUMP");
                }
                // End:0x17F
                if(bExitOnCyclesComplete)
                {                    
                    ConsoleCommand("EXIT");
                }
            }            
        }
        else
        {
            // End:0x2DC
            foreach WorldInfo.AllControllers(Class'PlayerController', PC)
            {
                // End:0x20B
                if(bResetMapIndex)
                {
                    PC.PlayerReplicationInfo.AutomatedTestingData.NumMapListCyclesDone++;
                }
                // End:0x2DB
                if((PC.PlayerReplicationInfo.AutomatedTestingData.NumMapListCyclesDone >= NumAutomatedMapTestingCycles) && NumAutomatedMapTestingCycles != 0)
                {
                    // End:0x2B4
                    if(bCheckingForMemLeaks)
                    {                        
                        ConsoleCommand("DEFERRED_STOPMEMTRACKING_AND_DUMP");
                    }
                    // End:0x2DB
                    if(bExitOnCyclesComplete)
                    {                        
                        ConsoleCommand("EXIT");
                    }
                }                
            }            
        }
        return MapName;
    }
    return "";
    //return ReturnValue;    
}

function StartMatch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x1A
    if(bAutomatedTestingWithOpen)
    {
        IncrementNumberOfMatchesPlayed();        
    }
    else
    {
        // End:0x71
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.IncrementNumberOfMatchesPlayed();
            // End:0x71
            break;            
        }        
    }
    IncrementAutomatedTestingMapIndex();
    // End:0xAB
    if(bCheckingForFragmentation)
    {        
        ConsoleCommand("MemFragCheck");
    }
    // End:0xD8
    if(AutomatedTestingExecCommandToRunAtStartMatch != "")
    {        
        ConsoleCommand(AutomatedTestingExecCommandToRunAtStartMatch);
    }
    //return;    
}

function CheckForSentinelRun()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9C
    if(bDoingASentinelRun)
    {
        // End:0x64
        if(SentinelTaskDescription ~= "TravelTheWorld")
        {
            WorldInfo.Game.DoTravelTheWorld();
            return true;            
        }
        else
        {
            BeginSentinelRun(SentinelTaskDescription, SentinelTaskParameter, SentinelTagDesc);
            SetTimer(3.0000000, true, 'DoTimeBasedSentinelStatGathering');
        }
    }
    return false;
    //return ReturnValue;    
}

state TravelTheWorld
{
    ignores PrintOutTravelWorldTimes;

    function BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL PC;

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x68
        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            SentinelPC = PC;
            SentinelPC.Sentinel_SetupForGamebasedTravelTheWorld();
            // End:0x68
            break;            
        }        
        SentinelPC.bIsUsingStreamingVolumes = false;
        BeginSentinelRun(SentinelTaskDescription, SentinelTaskParameter, SentinelTagDesc);
        //return;        
    }

    function CalcTravelTheWorldTime()
    {
        local /*0x35EA0000-0x00000000*/ private int NumTravelLocations[8519681], NumRotations;
        local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689], TotalTimeInSeconds, PerTravelLocTime;

        TotalTimeInSeconds += (float(WorldInfo.StreamingLevels.Length) * 2.0000000);
        TotalTimeInSeconds += 10.0000000;
        TotalTimeInSeconds += (float(WorldInfo.StreamingLevels.Length) * 10.0000000);
        TotalTimeInSeconds += 10.0000000;
        TotalTimeInSeconds += 10.0000000;
        PerTravelLocTime = (((((0.5000000 + 4.0000000) + 1.0000000) + 0.5000000) + 1.0000000) + (float(NumRotations) * 1.5000000)) + (float(NumRotations) * 1.5000000);
        TotalTimeInSeconds += (PerTravelLocTime * float(NumTravelLocations));
        return TotalTimeInSeconds;
        //return ReturnValue;        
    }

    function SetIncrementsForLoops()
    {
        local /*0x35EA0000-0x00000000*/ private float NumTravelLocations[8519681], TimeWeGetInSeconds;

        TimeWeGetInSeconds = float(NumMinutesPerMap * 60);
        // End:0x7A
        if((CalcTravelTheWorldTime(int(NumTravelLocations), 8)) < TimeWeGetInSeconds)
        {
            TravelPointsIncrement = 1;
            NumRotationsIncrement = 1;
            PrintOutTravelWorldTimes(int(CalcTravelTheWorldTime(int(NumTravelLocations), 8)));            
        }
        else
        {
            // End:0xDC
            if((CalcTravelTheWorldTime(int(NumTravelLocations), 4)) < TimeWeGetInSeconds)
            {
                TravelPointsIncrement = 1;
                NumRotationsIncrement = 2;
                PrintOutTravelWorldTimes(int(CalcTravelTheWorldTime(int(NumTravelLocations), 4)));                
            }
            else
            {
                TravelPointsIncrement = int((CalcTravelTheWorldTime(int(NumTravelLocations), 4)) / TimeWeGetInSeconds);
                NumRotationsIncrement = 2;
                PrintOutTravelWorldTimes(int(CalcTravelTheWorldTime(int(NumTravelLocations / float(TravelPointsIncrement)), 4)));
            }
        }
        //return;        
    }
Begin:

    SentinelPC.Sentinel_PreAcquireTravelTheWorldPoints();
    SentinelIdx = 0;
    J0x2A:

    // End:0xC4 [Loop If]
    if(SentinelIdx < WorldInfo.StreamingLevels.Length)
    {
        SentinelPC.ClientUpdateLevelStreamingStatus(WorldInfo.StreamingLevels[SentinelIdx].PackageName, false, false, true);
        ++SentinelIdx;
        // [Loop Continue]
        goto J0x2A;
    }
    Sleep(10.0000000);
    WorldInfo.ForceGarbageCollection(true);
    SentinelIdx = 0;
    J0xF7:

    // End:0x36C [Loop If]
    if(SentinelIdx < WorldInfo.StreamingLevels.Length)
    {
        SentinelPC.ClientUpdateLevelStreamingStatus(WorldInfo.StreamingLevels[SentinelIdx].PackageName, true, true, true);
        Sleep(7.0000000);
        GetTravelLocations(WorldInfo.StreamingLevels[SentinelIdx].PackageName, SentinelPC, SentinelTravelArray);
        DoSentinelActionPerLoadedMap();        
        SentinelPC.ConsoleCommand("FractureAllMeshesToMaximizeMemoryUsage");        
        SentinelPC.ConsoleCommand("stat memory");
        Sleep(0.5000000);
        DoSentinel_MemoryAtSpecificLocation(vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));        
        SentinelPC.ConsoleCommand("stat memory");
        SentinelPC.ClientUpdateLevelStreamingStatus(WorldInfo.StreamingLevels[SentinelIdx].PackageName, false, false, true);
        Sleep(3.0000000);
        WorldInfo.ForceGarbageCollection(true);
        ++SentinelIdx;
        // [Loop Continue]
        goto J0xF7;
    }
    // End:0x505
    if(WorldInfo.StreamingLevels.Length == 0)
    {
        GetTravelLocations(WorldInfo.StreamingLevels[SentinelIdx].PackageName, SentinelPC, SentinelTravelArray);
        DoSentinelActionPerLoadedMap();        
        SentinelPC.ConsoleCommand("FractureAllMeshesToMaximizeMemoryUsage");        
        SentinelPC.ConsoleCommand("stat memory");
        Sleep(0.5000000);
        DoSentinel_MemoryAtSpecificLocation(vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));        
        SentinelPC.ConsoleCommand("stat memory");
        Sleep(3.0000000);
        WorldInfo.ForceGarbageCollection(true);
    }
    SetIncrementsForLoops(float(SentinelTravelArray.Length));
    SentinelIdx = 0;
    J0x526:

    // End:0x5F7 [Loop If]
    if(SentinelIdx < WorldInfo.StreamingLevels.Length)
    {
        // End:0x5E9
        if(LevelStreamingAlwaysLoaded(WorldInfo.StreamingLevels[SentinelIdx]) != none)
        {
            SentinelPC.ClientUpdateLevelStreamingStatus(WorldInfo.StreamingLevels[SentinelIdx].PackageName, true, true, true);
        }
        ++SentinelIdx;
        // [Loop Continue]
        goto J0x526;
    }
    SentinelPC.bIsUsingStreamingVolumes = true;
    Sleep(10.0000000);
    SentinelPC.Sentinel_PostAcquireTravelTheWorldPoints();
    Sleep(10.0000000);
    SentinelTravelArray.AddItem(SentinelTravelArray[0]);    
    SentinelNavigationIdx = 0;
    J0x66A:

    // End:0xB76 [Loop If]
    if(SentinelNavigationIdx < SentinelTravelArray.Length)
    {
        SentinelPC.SetLocation(SentinelTravelArray[SentinelNavigationIdx]);
        SentinelPC.SetRotation(rot(0, 0, 0));
        Sleep(0.5000000);
        J0x6E1:

        bSentinelStreamingLevelStillLoading = false;
        SentinelIdx = 0;
        J0x6F8:

        // End:0x78E [Loop If]
        if(SentinelIdx < WorldInfo.StreamingLevels.Length)
        {
            // End:0x780
            if(WorldInfo.StreamingLevels[SentinelIdx].bHasLoadRequestPending == true)
            {
                bSentinelStreamingLevelStillLoading = true;
                Sleep(1.0000000);
                // [Explicit Break]
                goto J0x78E;
            }
            ++SentinelIdx;
            // [Loop Continue]
            goto J0x6F8;
        }
        J0x78E:

        // End:0x6E1
        if(!(bSentinelStreamingLevelStillLoading == false))
            goto J0x6E1;
        WorldInfo.ForceGarbageCollection(true);
        Sleep(1.0000000);
        // End:0x7F7
        if(SentinelNavigationIdx == 0)
        {            
            ConsoleCommand("MemLeakCheck");
        }        
        SentinelPC.ConsoleCommand("stat memory");
        Sleep(0.5000000);
        DoSentinel_MemoryAtSpecificLocation(SentinelPC.Location, SentinelPC.Rotation);        
        SentinelPC.ConsoleCommand("stat memory");        
        SentinelPC.ConsoleCommand("stat scenerendering");        
        SentinelPC.ConsoleCommand("stat streaming");
        Sleep(1.0000000);
        SentinelIdx = 0;
        J0x93B:

        // End:0x9F1 [Loop If]
        if(SentinelIdx < 8)
        {
            SentinelPC.SetRotation(rot(0, 1, 0) * float(8192 * SentinelIdx));
            Sleep(1.5000000);
            DoSentinel_ViewDependentMemoryAtSpecificLocation(SentinelPC.Location, SentinelPC.Rotation);
            SentinelIdx += NumRotationsIncrement;
            // [Loop Continue]
            goto J0x93B;
        }        
        SentinelPC.ConsoleCommand("stat scenerendering");        
        SentinelPC.ConsoleCommand("stat streaming");
        SentinelIdx = 0;
        J0xA73:

        // End:0xB29 [Loop If]
        if(SentinelIdx < 8)
        {
            SentinelPC.SetRotation(rot(0, 1, 0) * float(8192 * SentinelIdx));
            Sleep(1.5000000);
            DoSentinel_PerfAtSpecificLocation(SentinelPC.Location, SentinelPC.Rotation);
            SentinelIdx += NumRotationsIncrement;
            // [Loop Continue]
            goto J0xA73;
        }
        // End:0xB5E
        foreach CommandsToRunAtEachTravelTheWorldNode(CommandStringToExec)
        {            
            ConsoleCommand(CommandStringToExec);            
        }        
        SentinelNavigationIdx += TravelPointsIncrement;
        // [Loop Continue]
        goto J0x66A;
    }    
    ConsoleCommand("MemLeakCheck");    
    ConsoleCommand("exit");
    stop;        
}

state SentinelHandleCauseEventCommand
{    J0x00:
    bSentinelStreamingLevelStillLoading = false;
    SentinelIdx = 0;
    J0x17:

    // End:0xAD [Loop If]
    if(SentinelIdx < WorldInfo.StreamingLevels.Length)
    {
        // End:0x9F
        if(WorldInfo.StreamingLevels[SentinelIdx].bHasLoadRequestPending == true)
        {
            bSentinelStreamingLevelStillLoading = true;
            Sleep(1.0000000);
            // [Explicit Break]
            goto J0xAD;
        }
        ++SentinelIdx;
        // [Loop Continue]
        goto J0x17;
    }
    J0xAD:

    // End:0x00
    if(!(bSentinelStreamingLevelStillLoading == false))
        goto J0x00;
    // End:0x193
    if(WorldInfo.Game.CauseEventCommand != "")
    {
        // End:0x192
        foreach WorldInfo.AllControllers(Class'PlayerController', SentinelPC)
        {            
            SentinelPC.ConsoleCommand("ce " $ WorldInfo.Game.CauseEventCommand);
            // End:0x192
            break;            
        }        
    }
    // End:0x1E7
    if((SentinelTaskDescription == "FlyThrough") || SentinelTaskDescription == "FlyThroughSplitScreen")
    {
        SetTimer(0.5000000, true, 'DoTimeBasedSentinelStatGathering');
    }
    stop;                    
}

defaultproperties
{
    NumMinutesPerMap=50
}