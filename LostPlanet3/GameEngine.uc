class GameEngine extends Engine
    transient
    config(Engine);

enum EFullyLoadPackageType
{
    FULLYLOAD_Map,                  // 0
    FULLYLOAD_Game_PreLoadClass,    // 1
    FULLYLOAD_Game_PostLoadClass,   // 2
    FULLYLOAD_Always,               // 3
    FULLYLOAD_Mutator,              // 4
    FULLYLOAD_MAX                   // 5
};

struct native transient URL
{
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string Protocol;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string Host;
    var(*) /*0x35EA0000-0x00000010*/ private int Port;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string Map;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array Op;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string Portal;
    var(*) /*0x35EA0000-0x00000010*/ private int Valid;

    structdefaultproperties
    {
        Protocol=""
        Host=""
        Port=0
        Map=""
        Op=none
        Portal=""
        Valid=0
    }
};

struct native LevelStreamingStatus
{
    var(*) /*0x35EA0000-0x00000000*/ private name PackageName;
    var(*) /*0x35EA0000-0x00000000*/ private bool bShouldBeLoaded;
    var(*) /*0x35EA0000-0x00000000*/ private bool bShouldBeVisible;

    structdefaultproperties
    {
        PackageName="None"
        bShouldBeLoaded=false
        bShouldBeVisible=false
    }
};

struct native FullyLoadedPackagesInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private byte FullyLoadType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Tag;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PackagesToLoad;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LoadedObjects;

    structdefaultproperties
    {
        FullyLoadType=EFullyLoadPackageType.FULLYLOAD_Map
        Tag=""
        PackagesToLoad=none
        LoadedObjects=none
    }
};

struct native NamedNetDriver
{
    var(*) /*0x35EA0000-0x00000000*/ private name NetDriverName;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NetDriver[268566529];

    structdefaultproperties
    {
        NetDriverName="None"
    }
};

struct native AnimTag
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Tag;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Contains;

    structdefaultproperties
    {
        Tag=""
        Contains=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL GPendingLevel;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PendingLevelPlayerControllerClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL LastURL;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL LastRemoteURL;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ServerActors[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TravelURL;
var(*) /*0x35EA0000-0x00000000*/ private byte TravelType;
var(*) /*0x35EA0000-0x00000000*/ private bool bWorldWasLoadedThisTick[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckForMovieCapture[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bTriggerPostLoadMap[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bStartedLoadMapMovie[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipProcessingAlreadyLoadedLevelsOnPrepareMapChange;
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldCommitPendingMapChange[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bClearAnimSetLinkupCachesOnLoadMap[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableSecondaryDisplay[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableSecondaryViewport[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnlineSubsystem[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DLCEnumerator[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DownloadableContentEnumeratorClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DLCManager[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DownloadableContentManagerClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LevelNamesToKeepOnCommitMapChange;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LevelsToKeepOnCommitMapChange[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExtraParamsOnCommitMapChange;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LevelsToLoadForPendingMapChange[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LoadedLevelsForPendingMapChange[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PendingMapChangeFailureDescription[131073];
var(*) /*0x35EA0000-0x00000000*/ private float MaxDeltaTime[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SecondaryViewportClientClassName[1073741825];
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array SecondaryViewportClients;
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array SecondaryViewportFrames;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PendingLevelStreamingStatusUpdates[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ObjectReferencers[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PackagesToFullyLoad;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NamedNetDrivers[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimTags[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PendingAsyncOpenTextureMovies[536870913];

// Export UGameEngine::execCreateNamedNetDriver(FFrame&, void* const)
native final function CreateNamedNetDriver()
{
    local /*0x35EA0000-0x00000000*/ private name NetDriverName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameEngine::execDestroyNamedNetDriver(FFrame&, void* const)
native final function DestroyNamedNetDriver()
{
    local /*0x35EA0000-0x00000000*/ private name NetDriverName[8388609];


}

// Export UGameEngine::execGetOnlineSubsystem(FFrame&, void* const)
native static final function GetOnlineSubsystem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UGameEngine::execGetDLCEnumerator(FFrame&, void* const)
native static final function GetDLCEnumerator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UGameEngine::execGetDLCManager(FFrame&, void* const)
native static final function GetDLCManager()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UGameEngine::execHasSecondaryScreenActive(FFrame&, void* const)
native static final function HasSecondaryScreenActive()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    PendingLevelPlayerControllerClassName="LostPlanetGame.LPPCPendingLevel"
    LastURL=(Protocol="",Host="",Port=0,Map="",Op=none,Portal="",Valid=1)
    LastRemoteURL=(Protocol="",Host="",Port=0,Map="",Op=none,Portal="",Valid=1)
    DownloadableContentEnumeratorClassName="LostPlanetGame.LPDownloadableContentEnumeratorPC"
    DownloadableContentManagerClassName="LostPlanetGame.LPDownloadableContentManager"
    ExtraParamsOnCommitMapChange=(bMakeKeptLevelsVisibleOnCommitPendingMapChange=false,bShouldKeepSameLevelsOnCommitPendingMapChange=false,bMakeSameLevelsVisibleOnCommitPendingMapChange=false,bReCreatePlayerPawn=false,bReCreatePlayerHUD=false,bNoKismetLevelStartup=false,bFadeOutBeforeCommit=true,bFadeInAfterCommit=true,FadeOutTime=1.0000000,FadeInTime=1.0000000,CommitPendingMapChangePlayerStartTagName="None")
    MaxDeltaTime=0.0500000
}