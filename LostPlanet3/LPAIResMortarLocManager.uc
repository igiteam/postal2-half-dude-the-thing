class LPAIResMortarLocManager extends Object
    config(AI)
    editinlinenew;

const LPAIResMortarLocManager_UpdateFrequency = 1.0;
const LPAIResMortarLocManager_UpdateFlyLocFlgFrequency = 0.33;

struct native InvalidMortarLocFlagStamp
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UserMarkingInvalid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundNotViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToRemoveFoundNotViableStamp;

    structdefaultproperties
    {
        UserMarkingInvalid=none
        LastTimeFoundNotViable=0.0000000
        TimeToRemoveFoundNotViableStamp=0.0000000
    }
};

struct native ResultOfCanMortarCheck
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorTestedAsTarget;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValidLobArc;

    structdefaultproperties
    {
        ActorTestedAsTarget=none
        bValidLobArc=false
    }
};

struct native MortarFromPosition
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocOfPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChanged;
    var(0.25_Pct) /*0x97E50000-0x00000010*/ private editfixedsize array ResultsOfCanMortarChecks;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PathDataFamilyOfGraphOn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClaimedBy;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OccupiedBy;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNoPathFound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeNoPathFound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToUnflagNoPathFound;
    var(0.25_Pct) /*0x97E50000-0x00000010*/ private editfixedsize array ListOfPathInvalidLocFlagStamps;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFoundNotCombatViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundNotCombatViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToUnflagFoundNotCombatViable;
    var(0.25_Pct) /*0x97E50000-0x00000010*/ private editfixedsize array ListOfCombatInvalidLocFlagStamps;

    structdefaultproperties
    {
        LocOfPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bValid=true
        bChanged=false
        ResultsOfCanMortarChecks=none
        PathDataFamilyOfGraphOn=none
        ClaimedBy=none
        OccupiedBy=none
        bNoPathFound=false
        LastTimeNoPathFound=-1.0000000
        TimeToUnflagNoPathFound=-1.0000000
        ListOfPathInvalidLocFlagStamps=none
        bFoundNotCombatViable=false
        LastTimeFoundNotCombatViable=-1.0000000
        TimeToUnflagFoundNotCombatViable=-1.0000000
        ListOfCombatInvalidLocFlagStamps=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastExploreOrigin[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MortarFromPositions[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MortarSearchRequestList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsExploring[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewMortarFromPositionsAvailable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool TraversalRender[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDrawExplorer[536870913];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bAiMapResLogging[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bAiMapResLogToWindow[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bFlushAiMapResLogEachLine[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bMapBasedLogName[1073807361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumPositionsAvailable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextUpdateTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovementBufferBeforeRequireReexploration[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovementBufferBeforeRequireReexplorationSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AiMapResLogFile[536870913];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private float DebugTextMaxLen[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private editfixedsize array AiMapResLogFilter[1073807361];

// Export ULPAIResMortarLocManager::execGetNewMortarPositionsAndUpdateNative(FFrame&, void* const)
native function GetNewMortarPositionsAndUpdateNative()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResMortarLocManager::execStartExplorationNative(FFrame&, void* const)
native function StartExplorationNative()
{
    local /*0x97E50000-0x00000000*/ private int RequestIndex[8388609];


}

// Export ULPAIResMortarLocManager::execGetRequestsExploredMortarLocIfNewAndReadyNative(FFrame&, void* const)
native function GetRequestsExploredMortarLocIfNewAndReadyNative()
{
    local /*0x97E50000-0x00000000*/ private int RequestIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL FoundMortarPos[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResMortarLocManager::execExtractNewMortarLocationFromRequestsExplorerNative(FFrame&, void* const)
native function ExtractNewMortarLocationFromRequestsExplorerNative()
{
    local /*0x97E50000-0x00000000*/ private int RequestIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL FoundMortarPos[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResMortarLocManager::execDoesThisControllerAlreadyHaveRequestPending(FFrame&, void* const)
native function DoesThisControllerAlreadyHaveRequestPending()
{
    local /*0x97E50000-0x00000000*/ private @NULL RequesterCtrler[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResMortarLocManager::execStartSearchForBestMortarPositionForUser(FFrame&, void* const)
native function StartSearchForBestMortarPositionForUser()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheTarget[8388609], RequesterCtrler, RequesterPawn;
    local /*0x97E50000-0x00000000*/ private float MaxFindMortarLocTraversalDistance[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> HasValidMortarArcTest[8388609], FindMortarSpotTraversalFinished;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWorldInfo[8388609];

    WorldInfo = InWorldInfo;
    bIsExploring = false;
    NextUpdateTime = WorldInfo.TimeSeconds + 0.1000000;
    //return;    
}

function BeginPlay()
{
    //return;    
}

function Destroy()
{
    ShutDown();
    // End:0x31
    if(AiMapResLogFile != none)
    {
        AiMapResLogFile.Destroy();
    }
    //return;    
}

event ScriptDestoryCleanUp()
{
    ShutDown();
    //return;    
}

function ShutDown()
{
    WorldInfo = none;
    ClearOutAllMortarSearchRequests();
    ClearOutAllMortarFromPositions();
    bIsExploring = false;
    bStarted = false;
    //return;    
}

function ClearOutAllMortarFromPositions()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x124 [Loop If]
    if(iter < MortarFromPositions.Length)
    {
        MortarFromPositions[iter].ResultsOfCanMortarChecks.Length = 0;
        MortarFromPositions[iter].PathDataFamilyOfGraphOn = none;
        MortarFromPositions[iter].ClaimedBy = none;
        MortarFromPositions[iter].OccupiedBy = none;
        MortarFromPositions[iter].ListOfPathInvalidLocFlagStamps.Length = 0;
        MortarFromPositions[iter].ListOfCombatInvalidLocFlagStamps.Length = 0;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    MortarFromPositions.Length = 0;
    NumPositionsAvailable = 0;
    //return;    
}

function ClearOutAllMortarSearchRequests()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x175 [Loop If]
    if(iter < MortarSearchRequestList.Length)
    {
        // End:0xEF
        if(MortarSearchRequestList[iter].MortarLocationExplorer != none)
        {
            MortarSearchRequestList[iter].MortarLocationExplorer.AbortExploration();
            MortarSearchRequestList[iter].MortarLocationExplorer.Destroy();
            MortarSearchRequestList[iter].MortarLocationExplorer = none;
        }
        MortarSearchRequestList[iter].TheTarget = none;
        MortarSearchRequestList[iter].RequesterCtrler = none;
        MortarSearchRequestList[iter].RequesterPawn = none;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    MortarSearchRequestList.Length = 0;
    //return;    
}

function FindMortarLocRequestForRequesterPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL RequesterPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iter, indexOfReq;

    indexOfReq = -1;
    iter = 0;
    J0x1A:

    // End:0x8A [Loop If]
    if(iter < MortarSearchRequestList.Length)
    {
        // End:0x7C
        if(MortarSearchRequestList[iter].RequesterPawn == RequesterPawn)
        {
            indexOfReq = iter;
            // [Explicit Break]
            goto J0x8A;
        }
        ++iter;
        // [Loop Continue]
        goto J0x1A;
    }
    J0x8A:

    return indexOfReq;
    //return ReturnValue;    
}

function FindMortarLocRequestForThisLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationOfMortarPos[25296897];
    local /*0x97E50000-0x00000000*/ private int IndexOfLostMortarLoc[9437185], ReturnValue, iter, numOfReq, indexOfReq;

    local /*0x97E50000-0x00000000*/ private float distFromTestLocToLostLoc;

    -1
    indexOfReq = -1;
    // End:0xA4
    if((IndexOfLostMortarLoc >= 0) && IndexOfLostMortarLoc < MortarSearchRequestList.Length)
    {
        distFromTestLocToLostLoc = VSize(LocationOfMortarPos - MortarSearchRequestList[IndexOfLostMortarLoc].LocationFoundToMortarFrom);
        // End:0xA4
        if(distFromTestLocToLostLoc < 0.1000000)
        {
            indexOfReq = IndexOfLostMortarLoc;
        }
    }
    // End:0x15D
    if(indexOfReq < 0)
    {
        numOfReq = MortarSearchRequestList.Length;
        iter = 0;
        J0xD2:

        // End:0x15D [Loop If]
        if(iter < numOfReq)
        {
            distFromTestLocToLostLoc = VSize(LocationOfMortarPos - MortarSearchRequestList[iter].LocationFoundToMortarFrom);
            // End:0x14F
            if(distFromTestLocToLostLoc < 0.1000000)
            {
                indexOfReq = iter;
                // [Explicit Break]
                goto J0x15D;
            }
            ++iter;
            // [Loop Continue]
            goto J0xD2;
        }
    }
    J0x15D:

    return indexOfReq;
    //return ReturnValue;    
}

function NotifyMortarLocaionGivenUpOrLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationOfMortarPos[25296897];
    local /*0x97E50000-0x00000000*/ private int IndexOfLostMortarLoc[9437185], iter, numOfPos, indexOfPositionLost;
    local /*0x97E50000-0x00000000*/ private float distFromTestLocToLostLoc;
    local /*0x97E50000-0x00000000*/ private int indexOfRequestForThisLocation;

    -1
    indexOfPositionLost = -1;
    // End:0xA4
    if((IndexOfLostMortarLoc >= 0) && IndexOfLostMortarLoc < MortarFromPositions.Length)
    {
        distFromTestLocToLostLoc = VSize(LocationOfMortarPos - MortarFromPositions[IndexOfLostMortarLoc].LocOfPos);
        // End:0xA4
        if(distFromTestLocToLostLoc < 0.1000000)
        {
            indexOfPositionLost = IndexOfLostMortarLoc;
        }
    }
    // End:0x15D
    if(indexOfPositionLost < 0)
    {
        numOfPos = MortarFromPositions.Length;
        iter = 0;
        J0xD2:

        // End:0x15D [Loop If]
        if(iter < numOfPos)
        {
            distFromTestLocToLostLoc = VSize(LocationOfMortarPos - MortarFromPositions[iter].LocOfPos);
            // End:0x14F
            if(distFromTestLocToLostLoc < 0.1000000)
            {
                indexOfPositionLost = iter;
                // [Explicit Break]
                goto J0x15D;
            }
            ++iter;
            // [Loop Continue]
            goto J0xD2;
        }
    }
    J0x15D:

    // End:0x296
    if(indexOfPositionLost >= 0)
    {
        indexOfRequestForThisLocation = FindMortarLocRequestForThisLocation(LocationOfMortarPos, indexOfPositionLost);
        MortarFromPositions.Remove(indexOfPositionLost, 1);        
        --NumPositionsAvailable;
        // End:0x27E
        if(MortarSearchRequestList[indexOfRequestForThisLocation].MortarLocationExplorer != none)
        {
            MortarSearchRequestList[indexOfRequestForThisLocation].MortarLocationExplorer.AbortExploration();
            MortarSearchRequestList[indexOfRequestForThisLocation].MortarLocationExplorer.Destroy();
            MortarSearchRequestList[indexOfRequestForThisLocation].MortarLocationExplorer = none;
        }
        MortarSearchRequestList.Remove(indexOfRequestForThisLocation, 1);                
    }
    //return;    
}

function RemoveAllMortarLocationsAndRequestsForThisUser()
{
    local /*0x97E50000-0x00000000*/ private @NULL RequesterCtrler[8388609];
    local /*0x97E50000-0x00000000*/ private int iter, numOfPos, numOfRequests;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mortarFromPositionsToRemove, mortarSearchRequestToRemoveList;

    // End:0x11
    if(RequesterCtrler == none)
    {
        return;
    }
    numOfRequests = MortarSearchRequestList.Length;
    iter = 0;
    J0x30:

    // End:0x175 [Loop If]
    if(iter < numOfRequests)
    {
        // End:0x167
        if(MortarSearchRequestList[iter].RequesterCtrler == RequesterCtrler)
        {
            // End:0x147
            if(MortarSearchRequestList[iter].MortarLocationExplorer != none)
            {
                MortarSearchRequestList[iter].MortarLocationExplorer.AbortExploration();
                MortarSearchRequestList[iter].MortarLocationExplorer.Destroy();
                MortarSearchRequestList[iter].MortarLocationExplorer = none;
            }
            mortarSearchRequestToRemoveList.AddItem(MortarSearchRequestList[iter]);            
        }
        ++iter;
        // [Loop Continue]
        goto J0x30;
    }
    numOfRequests = mortarSearchRequestToRemoveList.Length;
    iter = 0;
    J0x194:

    // End:0x1D9 [Loop If]
    if(iter < numOfRequests)
    {
        MortarSearchRequestList.RemoveItem(mortarSearchRequestToRemoveList[iter]);        
        ++iter;
        // [Loop Continue]
        goto J0x194;
    }
    mortarSearchRequestToRemoveList.Length = 0;
    numOfPos = MortarFromPositions.Length;
    iter = 0;
    J0x204:

    // End:0x2E8 [Loop If]
    if(iter < numOfPos)
    {
        // End:0x2DA
        if((MortarFromPositions[iter].ClaimedBy == RequesterCtrler.myAIPawn) || MortarFromPositions[iter].OccupiedBy == RequesterCtrler.myAIPawn)
        {
            mortarFromPositionsToRemove.AddItem(MortarFromPositions[iter]);            
            --NumPositionsAvailable;
        }
        ++iter;
        // [Loop Continue]
        goto J0x204;
    }
    numOfPos = mortarFromPositionsToRemove.Length;
    iter = 0;
    J0x307:

    // End:0x34C [Loop If]
    if(iter < numOfPos)
    {
        MortarFromPositions.RemoveItem(mortarFromPositionsToRemove[iter]);        
        ++iter;
        // [Loop Continue]
        goto J0x307;
    }
    mortarSearchRequestToRemoveList.Length = 0;
    //return;    
}

function IsThisValidIndexForThisPawn()
{
    local /*0x97E50000-0x00000000*/ private int IndexOfRequest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL RequesterPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5F
    if((IndexOfRequest >= 0) && IndexOfRequest < MortarSearchRequestList.Length)
    {
        // End:0x5F
        if(MortarSearchRequestList[IndexOfRequest].RequesterPawn == RequesterPawn)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected event AddResultOfCanMortarCheck()
{
    local /*0x97E50000-0x00000000*/ private int IndexOfMortarFromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InActorTestedAsTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInValidLobArc[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL newResults;

    // End:0x99
    if(IndexOfMortarFromLocation < MortarFromPositions.Length)
    {
        newResults.ActorTestedAsTarget = InActorTestedAsTarget;
        newResults.bValidLobArc = bInValidLobArc;
        MortarFromPositions[IndexOfMortarFromLocation].ResultsOfCanMortarChecks.AddItem(newResults);        
    }
    //return;    
}

protected function ExplorationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationFound[25296897];
    local /*0x97E50000-0x00000000*/ private int IndexOfMortarFromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SearchRequesterPawn[8388609], MortarLocationExplorerDone;
    local /*0x97E50000-0x00000000*/ private int validIndexOfRequestersSearchJustFinished;

    validIndexOfRequestersSearchJustFinished = -1;
    // End:0x18C
    if(MortarLocationExplorerDone != none)
    {
        // End:0x53
        if(IsThisValidIndexForThisPawn(IndexOfMortarFromLocation, SearchRequesterPawn))
        {
            validIndexOfRequestersSearchJustFinished = IndexOfMortarFromLocation;            
        }
        else
        {
            validIndexOfRequestersSearchJustFinished = FindMortarLocRequestForRequesterPawn(SearchRequesterPawn);
        }
        // End:0x18C
        if(validIndexOfRequestersSearchJustFinished >= 0)
        {
            // End:0x189
            if(MortarSearchRequestList[validIndexOfRequestersSearchJustFinished].MortarLocationExplorer == MortarLocationExplorerDone)
            {
                // End:0x186
                if(MortarSearchRequestList[validIndexOfRequestersSearchJustFinished].bSearchStarted)
                {
                    // End:0x183
                    if(!MortarSearchRequestList[validIndexOfRequestersSearchJustFinished].bSearchCompleted)
                    {
                        // End:0x180
                        if(MortarSearchRequestList[validIndexOfRequestersSearchJustFinished].MortarLocationExplorer.WerePositionsUpdated())
                        {
                            MortarSearchRequestList[validIndexOfRequestersSearchJustFinished].bSearchCompleted = true;
                            bNewMortarFromPositionsAvailable = true;                            
                        }                        
                    }                    
                }                
            }            
        }
    }
    bIsExploring = false;
    //return;    
}

protected function ExtractNewMortarLocationFromRequestsExplorer()
{
    local /*0x97E50000-0x00000000*/ private int RequestIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL FoundMortarPos[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL tempPos;

    // End:0x210
    if(RequestIndex < MortarSearchRequestList.Length)
    {
        // End:0x210
        if(MortarSearchRequestList[RequestIndex].MortarLocationExplorer != none)
        {
            MortarSearchRequestList[RequestIndex].MortarLocationExplorer.GetMortarPosition(tempPos);
            FoundMortarPos.bValid = true;
            FoundMortarPos.LocOfPos = tempPos;
            FoundMortarPos.bNoPathFound = false;
            FoundMortarPos.LastTimeNoPathFound = -1.0000000;
            FoundMortarPos.TimeToUnflagNoPathFound = -1.0000000;
            FoundMortarPos.ListOfPathInvalidLocFlagStamps.Length = 0;
            FoundMortarPos.bFoundNotCombatViable = false;
            FoundMortarPos.LastTimeFoundNotCombatViable = -1.0000000;
            FoundMortarPos.TimeToUnflagFoundNotCombatViable = -1.0000000;
            FoundMortarPos.ListOfCombatInvalidLocFlagStamps.Length = 0;
            FoundMortarPos.ClaimedBy = none;
            FoundMortarPos.OccupiedBy = none;
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function GetNewMortarPositionsAndUpdate()
{
    local /*0x97E50000-0x00000000*/ private int RequestIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> CurDel;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL FoundMortarPos;

    // End:0x2A2
    if(bNewMortarFromPositionsAvailable)
    {
        RequestIndex = 0;
        J0x18:

        // End:0x296 [Loop If]
        if(RequestIndex < MortarSearchRequestList.Length)
        {
            // End:0x288
            if(GetRequestsExploredMortarLocIfNewAndReady(RequestIndex, FoundMortarPos))
            {
                CurDel = MortarSearchRequestList[RequestIndex].FindMortarSpotTraversalFinished;
                OnSearchForMortarSpotFinish(FoundMortarPos.LocOfPos, RequestIndex, MortarSearchRequestList[RequestIndex].RequesterPawn, MortarSearchRequestList[RequestIndex].MortarLocationExplorer);
                MortarSearchRequestList[RequestIndex].bMortarSpotFound = true;
                MortarSearchRequestList[RequestIndex].LocationFoundToMortarFrom = FoundMortarPos.LocOfPos;
                MortarSearchRequestList[RequestIndex].IndexOfLocationFoundToMortarFrom = MortarFromPositions.Length;
                FoundMortarPos.ClaimedBy = MortarSearchRequestList[RequestIndex].RequesterPawn;
                FoundMortarPos.OccupiedBy = MortarSearchRequestList[RequestIndex].RequesterPawn;
                ++NumPositionsAvailable;
                MortarFromPositions.AddItem(FoundMortarPos);                
                AddResultOfCanMortarCheck(MortarFromPositions.Length - 1, MortarSearchRequestList[RequestIndex].TheTarget, true);                
            }
            ++RequestIndex;
            // [Loop Continue]
            goto J0x18;
        }
        bNewMortarFromPositionsAvailable = false;
    }
    //return;    
}

protected function GetRequestsExploredMortarLocIfNewAndReady()
{
    local /*0x97E50000-0x00000000*/ private int RequestIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL FoundMortarPos[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xF8
    if(MortarSearchRequestList[RequestIndex].MortarLocationExplorer != none)
    {
        // End:0xF5
        if(int(MortarSearchRequestList[RequestIndex].MortarLocationExplorer.ExpState) == int(2))
        {
            // End:0xF2
            if(MortarSearchRequestList[RequestIndex].bSearchCompleted)
            {
                // End:0xEF
                if(!MortarSearchRequestList[RequestIndex].bMortarSpotFound)
                {
                    // End:0xEC
                    if(ExtractNewMortarLocationFromRequestsExplorer(RequestIndex, FoundMortarPos))
                    {
                        return true;                        
                    }                    
                }                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsThisLocationClaimedOrOccupiedByOtherKnownActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int locIndex;
    local /*0x97E50000-0x00000000*/ private float distanceFromTestLocToKnownMortarLoc;

    locIndex = 0;
    J0x0B:

    // End:0xDC [Loop If]
    if(locIndex < MortarFromPositions.Length)
    {
        // End:0xCE
        if((MortarFromPositions[locIndex].ClaimedBy != none) || MortarFromPositions[locIndex].OccupiedBy != none)
        {
            distanceFromTestLocToKnownMortarLoc = VSize(LocationToTest - MortarFromPositions[locIndex].LocOfPos);
            // End:0xCE
            if(distanceFromTestLocToKnownMortarLoc < float(100))
            {
                return true;
            }
        }
        ++locIndex;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

protected function InternalIsThisLocationIndexValidForMortarAttackingActor()
{
    local /*0x97E50000-0x00000000*/ private int InIndexOfMortarLocToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ActorToAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter, numOfResults;

    numOfResults = MortarFromPositions[InIndexOfMortarLocToTest].ResultsOfCanMortarChecks.Length;
    iter = 0;
    J0x3C:

    // End:0xFB [Loop If]
    if(iter < numOfResults)
    {
        // End:0xED
        if(ActorToAttack == MortarFromPositions[InIndexOfMortarLocToTest].ResultsOfCanMortarChecks[iter].ActorTestedAsTarget)
        {
            // End:0xED
            if(MortarFromPositions[InIndexOfMortarLocToTest].ResultsOfCanMortarChecks[iter].bValidLobArc)
            {
                return true;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x3C;
    }
    return false;
    //return ReturnValue;    
}

function IsThisLocationValidForMortarAttackingActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[25296897];
    local /*0x97E50000-0x00000000*/ private int InIndexOfMortarLocToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ActorToAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter, numOfPos, indexOfPositionTesting;
    local /*0x97E50000-0x00000000*/ private float distFromTestLocToLostLoc;

    indexOfPositionTesting = -1;
    // End:0x9E
    if((InIndexOfMortarLocToTest >= 0) && InIndexOfMortarLocToTest < MortarFromPositions.Length)
    {
        distFromTestLocToLostLoc = VSize(LocationToTest - MortarFromPositions[InIndexOfMortarLocToTest].LocOfPos);
        // End:0x9B
        if(distFromTestLocToLostLoc < 0.1000000)
        {
            indexOfPositionTesting = InIndexOfMortarLocToTest;
        }        
    }
    else
    {
        // End:0xAF
        if(InIndexOfMortarLocToTest < 0)
        {
            return false;
        }
    }
    // End:0x168
    if(indexOfPositionTesting < 0)
    {
        numOfPos = MortarFromPositions.Length;
        iter = 0;
        J0xDD:

        // End:0x168 [Loop If]
        if(iter < numOfPos)
        {
            distFromTestLocToLostLoc = VSize(LocationToTest - MortarFromPositions[iter].LocOfPos);
            // End:0x15A
            if(distFromTestLocToLostLoc < 0.1000000)
            {
                indexOfPositionTesting = iter;
                // [Explicit Break]
                goto J0x168;
            }
            ++iter;
            // [Loop Continue]
            goto J0xDD;
        }
    }
    J0x168:

    // End:0x179
    if(indexOfPositionTesting < 0)
    {
        return false;
    }
    // End:0x1A9
    if(indexOfPositionTesting >= 0)
    {
        // End:0x1A9
        if(InternalIsThisLocationIndexValidForMortarAttackingActor(indexOfPositionTesting, ActorToAttack))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

event AiMapResLog_Internal()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LogText[142606337];
    local /*0x97E50000-0x00000000*/ private name LogCategory[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    //return;    
}

defaultproperties
{
    MovementBufferBeforeRequireReexploration=600.0000000
    MovementBufferBeforeRequireReexplorationSq=360000.0000000
}