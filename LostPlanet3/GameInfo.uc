class GameInfo extends Info
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

enum EBusyIndicator
{
    BI_Quick,                       // 0
    BI_Default,                     // 1
    BI_Saving,                      // 2
    BI_MAX                          // 3
};

enum EBusyIndicatorCorner
{
    BIC_TopLeft,                    // 0
    BIC_TopRight,                   // 1
    BIC_BottomLeft,                 // 2
    BIC_BottomRight,                // 3
    BIC_MAX                         // 4
};

enum EStandbyType
{
    STDBY_Rx,                       // 0
    STDBY_Tx,                       // 1
    STDBY_BadPing,                  // 2
    STDBY_MAX                       // 3
};

struct native BusyIndicatorInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Material;
    var(*) /*0x35EA0000-0x00000000*/ private byte Corner;
    var(*) /*0x35EA0000-0x00000000*/ private float Size;
    var(*) /*0x35EA0000-0x00000000*/ private float EdgeOffsetX;
    var(*) /*0x35EA0000-0x00000000*/ private float EdgeOffsetY;
    var(*) /*0x35EA0000-0x00000000*/ private bool bShowDuringFullScreenMovies;

    structdefaultproperties
    {
        Material=none
        Corner=EBusyIndicatorCorner.BIC_TopLeft
        Size=0.0000000
        EdgeOffsetX=0.0000000
        EdgeOffsetY=0.0000000
        bShowDuringFullScreenMovies=false
    }
};

struct native GameClassShortName
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ShortName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GameClassName;

    structdefaultproperties
    {
        ShortName=""
        GameClassName=""
    }
};

struct native GameTypePrefix
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Prefix;
    var(*) /*0x35EA0000-0x00000000*/ private bool bUsesCommonPackage;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GameType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AdditionalGameTypes;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ForcedObjects;

    structdefaultproperties
    {
        Prefix=""
        bUsesCommonPackage=false
        GameType=""
        AdditionalGameTypes=none
        ForcedObjects=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private bool bRestartLevel;
var(*) /*0x35EA0000-0x00000000*/ private bool bPauseable;
var(*) /*0x35EA0000-0x00000000*/ private bool bTeamGame;
var(*) /*0x35EA0000-0x00000000*/ private bool bGameEnded;
var(*) /*0x35EA0000-0x00000000*/ private bool bOverTime;
var(*) /*0x35EA0000-0x00000000*/ private bool bDelayedStart;
var(*) /*0x35EA0000-0x00000000*/ private bool bWaitingToStartMatch;
var(*) /*0x35EA0000-0x00000000*/ private input bool bChangeLevels[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlreadyChanged;
var(*) /*0x35EA0000-0x00000000*/ private input bool bAdminCanPause[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bGameRestarted;
var(*) /*0x35EA0000-0x00000000*/ private bool bLevelChange;
var(*) /*0x35EA0000-0x00000000*/ private input bool bKickLiveIdlers[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsingArbitration;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasArbitratedHandshakeBegun;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsEndGameHandshake;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsEndGameHandshakeComplete;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasEndGameHandshakeBegun;
var(*) /*0x35EA0000-0x00000000*/ private bool bFixedPlayerStart;
var(*) /*0x35EA0000-0x00000000*/ private bool bDoFearCostFallOff;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseSeamlessTravel;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasNetworkError;
var(*) /*0x35EA0000-0x00000000*/ private bool bRequiresPushToTalk[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsStandbyCheckingEnabled[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsStandbyCheckingOn;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasStandbyCheatTriggered;
var(*) /*0x35EA0000-0x00000000*/ private bool bUsePackageNetInfo;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string CauseEventCommand;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string BugLocString;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string BugRotString;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PendingArbitrationPCs;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ArbitrationPCs;
var(*) /*0x35EA0000-0x00000000*/ private input float ArbitrationHandshakeTimeout[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float GameDifficulty[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int GoreLevel[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float GameSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float DebugSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float NonDebugSpeed;
var(*) /*0x35EA0000-0x00000000*/ private class DefaultPawnClass;
var(*) /*0x35EA0000-0x00000000*/ private class HUDType;
var(*) /*0x35EA0000-0x00000000*/ private class SecondaryHUDType;
var(*) /*0x35EA0000-0x00000000*/ private input int MaxSpectators[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxSpectatorsAllowed;
var(*) /*0x35EA0000-0x00000000*/ private int NumSpectators;
var(*) /*0x35EA0000-0x00000000*/ private input int MaxPlayers[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxPlayersAllowed;
var(*) /*0x35EA0000-0x00000000*/ private int NumPlayers;
var(*) /*0x35EA0000-0x00000000*/ private int NumBots;
var(*) /*0x35EA0000-0x00000000*/ private int NumTravellingPlayers;
var(*) /*0x35EA0000-0x00000000*/ private int CurrentID;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DefaultPlayerName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GameName;
var(*) /*0x35EA0000-0x00000000*/ private float FearCostFallOff;
var(*) /*0x35EA0000-0x00000000*/ private int GoalScore[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxLives[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int TimeLimit[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class DeathMessageClass;
var(*) /*0x35EA0000-0x00000000*/ private class GameMessageClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BaseMutator;
var(*) /*0x35EA0000-0x00000000*/ private class AccessControlClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AccessControl;
var(*) /*0x35EA0000-0x00000000*/ private class BroadcastHandlerClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BroadcastHandler;
var(*) /*0x35EA0000-0x00000000*/ private class AutoTestManagerClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyAutoTestManager;
var(*) /*0x35EA0000-0x00000000*/ private class PlayerControllerClass;
var(*) /*0x35EA0000-0x00000000*/ private class PlayerReplicationInfoClass;
var(*) /*0x254D0000-0x00000000*/ private class GameReplicationInfoClass[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameReplicationInfo;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PopulationManager;
var(*) /*0x35EA0000-0x00000000*/ private class PopulationManagerClass;
var(*) /*0x35EA0000-0x00000000*/ private input float MaxIdleTime[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MaxTimeMargin[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float TimeMarginSlack[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MinTimeMargin[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InactivePRIArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Pausers;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameInterface;
var(*) /*0x35EA0000-0x00000000*/ private class OnlineStatsWriteClass;
var(*) /*0x35EA0000-0x00000000*/ private int LeaderboardId;
var(*) /*0x35EA0000-0x00000000*/ private int ArbitratedLeaderboardId;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CoverReplicatorBase;
var(*) /*0x35EA0000-0x00000000*/ private class OnlineGameSettingsClass[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ServerOptions;
var(*) /*0x35EA0000-0x00000000*/ private int AdjustedNetSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float LastNetSpeedUpdateTime;
var(*) /*0x35EA0000-0x00000000*/ private input int TotalNetBandwidth[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int MinDynamicBandwidth[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int MaxDynamicBandwidth[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float StandbyRxCheatTime[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float StandbyTxCheatTime[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int BadPingThreshold[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PercentMissingForRxStandby[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PercentMissingForTxStandby[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PercentForBadPing[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float JoinInProgressStandbyWaitTime[1073741825];
var(*_2043150335) /*0x35EA0000-0x00000000*/ private @NULL BusyIndicators[3];
var(*) /*0x254D0000-0x00000000*/ private editfixedsize array GameInfoClassAliases[1073938433];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DefaultGameType[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DefaultMapPrefixes[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CustomMapPrefixes[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int AnimTreePoolSize[1073741825];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __CanUnpause__Delegate;

// Export UGameInfo::execGetSupportedGameTypes(FFrame&, void* const)
native function GetSupportedGameTypes()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InFilename[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutGameType[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bCheckExt[9437185], ReturnValue;

    false                    
}

// Export UGameInfo::execGetMapCommonPackageName(FFrame&, void* const)
native function GetMapCommonPackageName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InFilename[25296897], OutCommonPackageName;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PreBeginPlay()
{
    AdjustedNetSpeed = MaxDynamicBandwidth;
    SetGameSpeed(GameSpeed);
    GameReplicationInfo = Spawn(GameReplicationInfoClass);
    WorldInfo.SetGRI(GameReplicationInfo);
    InitGameReplicationInfo();
    InitCrowdPopulationManager();
    //return;    
}

function GetCoverReplicator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if((CoverReplicatorBase == none) && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        CoverReplicatorBase = Spawn(Class'CoverReplicator');
    }
    return CoverReplicatorBase;
    //return ReturnValue;    
}

event PostBeginPlay()
{
    // End:0x2B
    if(MaxIdleTime > float(0))
    {
        MaxIdleTime = FMax(MaxIdleTime, 20.0000000);
    }
    // End:0x5E
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        UpdateGameSettings();
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    Canvas.SetDrawColor(255, 255, 255);
    Canvas.DrawText("Game:" $ GameName);
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    // End:0x138
    if(WorldInfo.PopulationManager != none)
    {
        WorldInfo.PopulationManager.DisplayDebug(HUD, out_YL, out_YPos);
    }
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bGameEnded = false;
    bOverTime = false;
    InitGameReplicationInfo();
    //return;    
}

function ShouldReset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ActorToReset[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ResetLevel()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C, A, GameSeq;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array AllSeqEvents, ActivateIndices;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x94
    foreach WorldInfo.AllControllers(Class'Controller', C)
    {
        // End:0x74
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientReset();
        }
        C.Reset();        
    }    
    // End:0x11C
    foreach AllActors(Class'Actor', A)
    {
        // End:0x11B
        if(((A != self) && !A.IsA('Controller')) && ShouldReset(A))
        {
            A.Reset();
        }        
    }    
    Reset();
    GameSeq = WorldInfo.GetGameSequence();
    // End:0x236
    if(GameSeq != none)
    {
        GameSeq.Reset();
        GameSeq.FindSeqObjectsByClass(Class'SeqEvent_LevelLoaded', true, AllSeqEvents);
        ActivateIndices[0] = 2;
        I = 0;
        J0x1C9:

        // End:0x236 [Loop If]
        if(I < AllSeqEvents.Length)
        {
            SeqEvent_LevelLoaded(AllSeqEvents[I]).CheckActivate(WorldInfo, none, false, ActivateIndices);
            I++;
            // [Loop Continue]
            goto J0x1C9;
        }
    }
    //return;    
}

event Timer()
{
    BroadcastHandler.UpdateSentText();
    // End:0x36
    if(bDoFearCostFallOff)
    {
        DoNavFearCostFallOff();
    }
    //return;    
}

// Export UGameInfo::execShouldStartInCinematicMode(FFrame&, void* const)
native final function ShouldStartInCinematicMode()
{
    local /*0x35EA0000-0x00000000*/ private int OutHidePlayer[25165825], OutHideHud, OutDisableMovement, OutDisableTurning, OutDisableInput;

    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameInfo::execDoNavFearCostFallOff(FFrame&, void* const)
native final function DoNavFearCostFallOff();

function NotifyNavigationChanged()
{
    local /*0x35EA0000-0x00000000*/ private @NULL N[8388609];

    //return;    
}

event GameEnding()
{
    // End:0x2E
    if(AccessControl != none)
    {
        AccessControl.NotifyGameEnding();
    }
    ClearOnlineDelegates();
    EndLogging("serverquit");
    //return;    
}

event KickIdler()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    AccessControl.KickPlayer(PC, AccessControl.IdleKickReason);
    //return;    
}

event ForceKickPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string KickReason[8388609];

    AccessControl.ForceKickPlayer(PC, KickReason);
    //return;    
}

function InitGameReplicationInfo()
{
    GameReplicationInfo.GameClass = Class;
    GameReplicationInfo.ReceivedGameClass();
    //return;    
}

// Export UGameInfo::execGetNetworkNumber(FFrame&, void* const)
native function GetNetworkNumber()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

function GetNumPlayers()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return NumPlayers + NumTravellingPlayers;
    //return ReturnValue;    
}

delegate CanUnpause()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsPausedByDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CanUnpauseDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int FoundIndex;

    FoundIndex = Pausers.Find(CanUnpauseDelegate);    
    // End:0x35
    if(FoundIndex != -1)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetPause()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CanUnpauseDelegate[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int FoundIndex;

    CanUnpause
    // End:0x109
    if(AllowPausing(PC))
    {
        FoundIndex = Pausers.Find(CanUnpauseDelegate);        
        // End:0xA6
        if(FoundIndex == -1)
        {
            FoundIndex = Pausers.Length;
            Pausers.Length = FoundIndex + 1;
            Pausers[FoundIndex] = CanUnpauseDelegate;
        }
        // End:0x107
        if(WorldInfo.Pauser == none)
        {
            WorldInfo.Pauser = PC.PlayerReplicationInfo;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

event ClearPause()
{
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CanUnpauseCriteriaMet;

    // End:0x2E
    if(!AllowPausing() && Pausers.Length > 0)
    {
        Pausers.Length = 0;
    }
    Index = 0;
    J0x39:

    // End:0xA9 [Loop If]
    if(Index < Pausers.Length)
    {
        CanUnpauseCriteriaMet = Pausers[Index];
        // End:0x9B
        if(CanUnpause())
        {
            Pausers.Remove(Index--, 1);            
        }
        Index++;
        // [Loop Continue]
        goto J0x39;
    }
    // End:0xD9
    if(Pausers.Length == 0)
    {
        WorldInfo.Pauser = none;
    }
    //return;    
}

// Export UGameInfo::execForceClearUnpauseDelegates(FFrame&, void* const)
native final function ForceClearUnpauseDelegates()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PauseActor[8388609];


}

function DebugPause()
{
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CanUnpauseCriteriaMet;

    Index = 0;
    J0x0B:

    // End:0x67 [Loop If]
    if(Index < Pausers.Length)
    {
        CanUnpauseCriteriaMet = Pausers[Index];
        // End:0x59
        if(CanUnpause())
        {            
        }
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

event SetGameSpeed()
{
    local /*0x35EA0000-0x00000000*/ private float T[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsDebugSpeed[9437185];

    // End:0x2B
    if(bIsDebugSpeed)
    {
        DebugSpeed = FMax(T, 0.0000100);        
    }
    else
    {
        NonDebugSpeed = FMax(T, 0.0000100);
    }
    GameSpeed = DebugSpeed * NonDebugSpeed;
    GameSpeed = FMax(T, 0.0000100);
    WorldInfo.TimeDilation = GameSpeed;
    SetTimer(WorldInfo.TimeDilation, true);
    //return;    
}

static function GrabOption()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[25165825], Result;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xD1
    if(Left(Options, 1) == "?")
    {
        Result = Mid(Options, 1);
        // End:0x68
        if(InStr(Result, "?") >= 0)
        {
            Result = Left(Result, InStr(Result, "?"));
        }
        Options = Mid(Options, 1);
        // End:0xC0
        if(InStr(Options, "?") >= 0)
        {
            Options = Mid(Options, InStr(Options, "?"));            
        }
        else
        {
            Options = "";
        }
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

static function GetKeyValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Pair[8388609], Key, Value;

    // End:0x6A
    if(InStr(Pair, "=") >= 0)
    {
        Key = Left(Pair, InStr(Pair, "="));
        Value = Mid(Pair, InStr(Pair, "=") + 1);        
    }
    else
    {
        Key = Pair;
        Value = "";
    }
    //return;    
}

static function ParseOption()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], InKey, ReturnValue, Pair, Key, Value;

    J0x00:
    // End:0x68 [Loop If]
    if(GrabOption(Options, Pair))
    {
        GetKeyValue(Pair, Key, Value);
        // End:0x65
        if(Key ~= InKey)
        {
            return Value;
        }
        // [Loop Continue]
        goto J0x00;
    }
    return "";
    //return ReturnValue;    
}

static function HasOption()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], InKey;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Pair, Key, Value;

    J0x00:
    // End:0x60 [Loop If]
    if(GrabOption(Options, Pair))
    {
        GetKeyValue(Pair, Key, Value);
        // End:0x5D
        if(Key ~= InKey)
        {
            return true;
        }
        // [Loop Continue]
        goto J0x00;
    }
    return false;
    //return ReturnValue;    
}

static function GetIntOption()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], ParseString;
    local /*0x35EA0000-0x00000000*/ private int CurrentValue[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InOpt;

    InOpt = ParseOption(Options, ParseString);
    // End:0x42
    if(InOpt != "")
    {
        return int(InOpt);
    }
    return CurrentValue;
    //return ReturnValue;    
}

static event GetDefaultGameClassPath()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MapName[8388609], Options, Portal, ReturnValue;

    return PathName(default.Class);
    //return ReturnValue;    
}

static event SetGameType()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MapName[8388609], Options, Portal;
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];

    return default.Class;
    //return ReturnValue;    
}

event InitGame()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage, InOpt, LeftOpt;
    local /*0x35EA0000-0x00000000*/ private int pos;
    local /*0x35EA0000-0x00000000*/ private class ACClass;
    local /*0x35EA0000-0x00000000*/ private @NULL CurAC, GameSettings;

    MaxPlayers = Clamp(GetIntOption(Options, "MaxPlayers", MaxPlayers), 0, MaxPlayersAllowed);
    MaxSpectators = Clamp(GetIntOption(Options, "MaxSpectators", MaxSpectators), 0, MaxSpectatorsAllowed);
    GameDifficulty = FMax(0.0000000, float(GetIntOption(Options, "Difficulty", int(GameDifficulty))));
    InOpt = ParseOption(Options, "GameSpeed");
    // End:0x10A
    if(InOpt != "")
    {
        SetGameSpeed(float(InOpt));
    }
    TimeLimit = Max(0, GetIntOption(Options, "TimeLimit", TimeLimit));
    BroadcastHandler = Spawn(BroadcastHandlerClass);
    InOpt = ParseOption(Options, "AccessControl");
    // End:0x1CE
    if(InOpt != "")
    {
        ACClass = class<AccessControl>(DynamicLoadObject(InOpt, Class'Core.Class'));
    }
    // End:0x1F0
    if(ACClass == none)
    {
        ACClass = AccessControlClass;
    }
    LeftOpt = ParseOption(Options, "AdminName");
    InOpt = ParseOption(Options, "AdminPassword");
    // End:0x367
    if((int(WorldInfo.NetMode) == int(NM_ListenServer)) || int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        // End:0x2EB
        if(WorldInfo.IsInSeamlessTravel())
        {
            // End:0x2EA
            foreach DynamicActors(Class'AccessControl', CurAC)
            {
                AccessControl = CurAC;
                // End:0x2EA
                break;                
            }            
        }
        // End:0x31E
        if(AccessControl == none)
        {
            AccessControl = Spawn(ACClass);
        }
        // End:0x367
        if((AccessControl != none) && InOpt != "")
        {
            AccessControl.SetAdminPassword(InOpt);
        }
    }
    InOpt = ParseOption(Options, "Mutator");
    // End:0x45C
    if(InOpt != "")
    {
        J0x39D:

        // End:0x45C [Loop If]
        if(InOpt != "")
        {
            pos = InStr(InOpt, ",");
            // End:0x426
            if(pos > 0)
            {
                LeftOpt = Left(InOpt, pos);
                InOpt = Right(InOpt, (Len(InOpt) - pos) - 1);                
            }
            else
            {
                LeftOpt = InOpt;
                InOpt = "";
            }
            AddMutator(LeftOpt, true);
            // [Loop Continue]
            goto J0x39D;
        }
    }
    InOpt = ParseOption(Options, "GamePassword");
    // End:0x4D0
    if((InOpt != "") && AccessControl != none)
    {
        AccessControl.SetGamePassword(InOpt);
    }
    bFixedPlayerStart = (ParseOption(Options, "FixedPlayerStart")) ~= "1";
    CauseEventCommand = ParseOption(Options, "causeevent");
    // End:0x5AF
    if((ParseOption(Options, "AutoTests")) ~= "1")
    {
        // End:0x587
        if(MyAutoTestManager == none)
        {
            MyAutoTestManager = Spawn(AutoTestManagerClass);
        }
        MyAutoTestManager.InitializeOptions(Options);
    }
    BugLocString = ParseOption(Options, "BugLoc");
    BugRotString = ParseOption(Options, "BugRot");
    // End:0x639
    if(BaseMutator != none)
    {
        BaseMutator.InitMutator(Options, ErrorMessage);
    }
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x73A
    if(OnlineSub != none)
    {
        GameInterface = OnlineSub.GameInterface;
        // End:0x73A
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            GameSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
            // End:0x73A
            if(GameSettings != none)
            {
                bUsingArbitration = GameSettings.bUsesArbitration;
            }
        }
    }
    // End:0x7C9
    if(((WorldInfo.IsConsoleBuild(0) == false) && int(WorldInfo.NetMode) != int(NM_Standalone)) && GameSettings == none)
    {
        ServerOptions = Options;
        // End:0x7C9
        if(!ProcessServerLogin())
        {
            RegisterServer();
        }
    }
    //return;    
}

event NotifyPendingConnectionLost()
{
    //return;    
}

function AddMutator()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string mutname[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bUserAdded[9437185];
    local /*0x35EA0000-0x00000000*/ private class mutClass;
    local /*0x35EA0000-0x00000000*/ private @NULL mut;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x1B
    if(!AllowMutator(mutname))
    {
        return;
    }
    mutClass = class<Mutator>(DynamicLoadObject(mutname, Class'Core.Class'));
    // End:0x5C
    if(mutClass == none)
    {
        return;
    }
    // End:0x17B
    if((mutClass.default.GroupNames.Length > 0) && BaseMutator != none)
    {
        mut = BaseMutator;
        J0xA5:

        // End:0x17B [Loop If]
        if(mut != none)
        {
            I = 0;
            J0xBF:

            // End:0x150 [Loop If]
            if(I < mut.GroupNames.Length)
            {
                // End:0x142
                if(mutClass.default.GroupNames.Find(mut.GroupNames[I]) != )
                {                    
                    return;
                }
                I++;
                // [Loop Continue]
                goto J0xBF;
            }
            mut = mut.NextMutator;
            // [Loop Continue]
            goto J0xA5;
        }
    }
    mut = BaseMutator;
    J0x18E:

    // End:0x1F6 [Loop If]
    if(mut != none)
    {
        // End:0x1CB
        if(mut.Class == mutClass)
        {
            return;
        }
        mut = mut.NextMutator;
        // [Loop Continue]
        goto J0x18E;
    }
    mut = Spawn(mutClass);
    // End:0x22B
    if(mut == none)
    {
        return;
    }
    mut.bUserAdded = bUserAdded;
    // End:0x27A
    if(BaseMutator == none)
    {
        BaseMutator = mut;        
    }
    else
    {
        BaseMutator.AddMutator(mut);
    }
    //return;    
}

function RemoveMutator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL MutatorToRemove[8388609], M;

    // End:0x42
    if(BaseMutator == MutatorToRemove)
    {
        BaseMutator = MutatorToRemove.NextMutator;        
    }
    else
    {
        // End:0x10A
        if(BaseMutator != none)
        {
            M = BaseMutator;
            J0x64:

            // End:0x10A [Loop If]
            if(M != none)
            {
                // End:0xDF
                if(M.NextMutator == MutatorToRemove)
                {
                    M.NextMutator = MutatorToRemove.NextMutator;
                    // [Explicit Break]
                    goto J0x10A;
                }
                M = M.NextMutator;
                // [Loop Continue]
                goto J0x64;
            }
        }
    }
    J0x10A:

    //return;    
}

function ProcessServerTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAbsolute[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL LocalPlayer;
    local /*0x35EA0000-0x00000000*/ private bool bSeamless;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NextMap;
    local /*0x35EA0000-0x00000000*/ private @NULL NextMapGuid;
    local /*0x35EA0000-0x00000000*/ private int OptionStart;

    bLevelChange = true;
    EndLogging("mapchange");
    bSeamless = bUseSeamlessTravel && WorldInfo.TimeSeconds < 172800.0000000;
    // End:0xB3
    if(InStr(Caps(URL), "?RESTART") != -1)
    {
        NextMap = string(WorldInfo.GetPackageName());        
    }
    else
    {
        OptionStart = InStr(URL, "?");
        // End:0xF7
        if(OptionStart == -1)
        {
            NextMap = URL;            
        }
        else
        {
            NextMap = Left(URL, OptionStart);
        }
    }
    NextMapGuid = GetPackageGuid(name(NextMap));
    LocalPlayer = ProcessClientTravel(URL, NextMapGuid, bSeamless, bAbsolute);
    WorldInfo.NextURL = URL;
    // End:0x297
    if((int(WorldInfo.NetMode) == int(NM_ListenServer)) && LocalPlayer != none)
    {        
        WorldInfo.NextURL $= ((((("?Name=" $ LocalPlayer.GetDefaultURL("Name")) $ "?Class=") $ LocalPlayer.GetDefaultURL("Class")) $ "?Character=") $ LocalPlayer.GetDefaultURL("Character"));
    }
    // End:0x2CF
    if(AccessControl != none)
    {
        AccessControl.NotifyServerTravel(bSeamless);
    }
    ClearOnlineDelegates();
    // End:0x352
    if(bSeamless)
    {
        WorldInfo.SeamlessTravel(WorldInfo.NextURL, bAbsolute);
        WorldInfo.NextURL = "";        
    }
    else
    {
        // End:0x3CA
        if((int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && int(WorldInfo.NetMode) != int(NM_ListenServer))
        {
            WorldInfo.NextSwitchCountdown = 0.0000000;
        }
    }
    //return;    
}

function ProcessClientTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL NextMapGuid[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSeamless[8388609], bAbsolute;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], P, LP;

    // End:0xFA
    foreach WorldInfo.AllControllers(Class'PlayerController', P)
    {
        // End:0xA1
        if(NetConnection(P.Player) != none)
        {
            P.ClientTravel(URL, 2, bSeamless, NextMapGuid);
            // End:0xF9
            continue;
        }
        LP = P;
        P.PreClientTravel(URL, ((bAbsolute) ? 0 : 2), bSeamless);        
    }    
    return LP;
    //return ReturnValue;    
}

function RequiresPassword()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (AccessControl != none) && AccessControl.RequiresPassword();
    //return ReturnValue;    
}

event PreLogin()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], Address;
    local /*0x35EA0000-0x00000000*/ private @NULL UniqueId[8519681];
    local /*0x35EA0000-0x00000000*/ private bool bSupportsAuth[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ErrorMessage[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bSpectator, bPerfTesting;

    // End:0xA7
    if(((int(WorldInfo.NetMode) != int(NM_Standalone)) && bUsingArbitration) && bHasArbitratedHandshakeBegun)
    {
        ErrorMessage = PathName(WorldInfo.Game.GameMessageClass) $ ".ArbitrationMessage";
        return;
    }
    // End:0x113
    if((AccessControl != none) && AccessControl.IsIDBanned(UniqueId))
    {
        ErrorMessage = "Engine.AccessControl.SessionBanned";
        return;
    }
    bPerfTesting = (ParseOption(Options, "AutomatedPerfTesting")) ~= "1";
    bSpectator = (bPerfTesting || (ParseOption(Options, "SpectatorOnly")) ~= "1") || (ParseOption(Options, "CauseEvent")) ~= "FlyThrough";
    // End:0x225
    if(AccessControl != none)
    {
        AccessControl.PreLogin(Options, Address, UniqueId, bSupportsAuth, ErrorMessage, bSpectator);
    }
    //return;    
}

// Export UGameInfo::execPauseLogin(FFrame&, void* const)
native static final function PauseLogin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UGameInfo::execResumeLogin(FFrame&, void* const)
native static final function ResumeLogin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609];


}

// Export UGameInfo::execRejectLogin(FFrame&, void* const)
native static final function RejectLogin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Error[8388609];


}

function AtCapacity()
{
    local /*0x35EA0000-0x00000000*/ private bool bSpectator[8388609], ReturnValue;

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    // End:0x8C
    if(bSpectator)
    {
        return (NumSpectators >= MaxSpectators) && (int(WorldInfo.NetMode) != int(NM_ListenServer)) || NumPlayers > 0;        
    }
    else
    {
        return (MaxPlayers > 0) && (GetNumPlayers()) >= MaxPlayers;
    }
    //return ReturnValue;    
}

// Export UGameInfo::execGetNextPlayerID(FFrame&, void* const)
native final function GetNextPlayerID()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

function SpawnPlayerController()
{
    local /*0x35EA0000-0x00000000*/ private class SpawnPlayerControllerClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnLocation[8388609], SpawnRotation, StartingSpot, ReturnValue;

    return Spawn(SpawnPlayerControllerClass,,, SpawnLocation, SpawnRotation);
    //return ReturnValue;    
}

event Login()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Portal[8388609], Options;
    local /*0x35EA0000-0x00000000*/ private @NULL UniqueId[8519681];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ErrorMessage[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], StartSpot, NewPlayer;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InName, inCharacter, InPassword;
    local /*0x35EA0000-0x00000000*/ private byte InTeam;
    local /*0x35EA0000-0x00000000*/ private bool bSpectator, bAdmin, bPerfTesting;
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnRotation, ZeroId;
    local /*0x35EA0000-0x00000000*/ private bool bChangedTeam;

    bAdmin = false;
    // End:0x88
    if(bUsingArbitration && bHasArbitratedHandshakeBegun)
    {
        ErrorMessage = PathName(WorldInfo.Game.GameMessageClass) $ ".ArbitrationMessage";
        return none;
    }
    // End:0xC8
    if(BaseMutator != none)
    {
        BaseMutator.ModifyLogin(Portal, Options);
    }
    bPerfTesting = (ParseOption(Options, "AutomatedPerfTesting")) ~= "1";
    bSpectator = bPerfTesting || (ParseOption(Options, "SpectatorOnly")) ~= "1";
    InName = Left(ParseOption(Options, "Name"), 20);
    InTeam = byte(GetIntOption(Options, "Team", 255));
    InPassword = ParseOption(Options, "Password");
    // End:0x1F9
    if(AccessControl != none)
    {
        bAdmin = AccessControl.ParseAdminOptions(Options);
    }
    // End:0x27E
    if(!bAdmin && AtCapacity(bSpectator))
    {
        ErrorMessage = PathName(WorldInfo.Game.GameMessageClass) $ ".MaxedOutMessage";
        return none;
    }
    // End:0x33E
    if((WorldInfo.Game.AccessControl != none) && WorldInfo.Game.AccessControl.IsIDBanned(UniqueId))
    {
        ErrorMessage = "Engine.AccessControl.SessionBanned";
        return none;
    }
    // End:0x367
    if(bAdmin && AtCapacity(false))
    {
        bSpectator = true;
    }
    InTeam = PickTeam(InTeam, none);
    StartSpot = FindPlayerStart(none, InTeam, Portal);
    // End:0x41B
    if(StartSpot == none)
    {
        ErrorMessage = PathName(WorldInfo.Game.GameMessageClass) $ ".FailedPlaceMessage";
        return none;
    }
    SpawnRotation.Yaw = StartSpot.Rotation.Yaw;
    NewPlayer = SpawnPlayerController(PlayerControllerClass, StartSpot.Location, SpawnRotation, StartSpot);
    // End:0x525
    if(NewPlayer == none)
    {
        ErrorMessage = PathName(WorldInfo.Game.GameMessageClass) $ ".FailedSpawnMessage";
        return none;
    }
    NewPlayer.StartSpot = StartSpot;
    NewPlayer.PlayerReplicationInfo.PlayerID = GetNextPlayerID();
    // End:0x606
    if((AccessControl == none) || !AccessControl.IsPendingAuth(UniqueId))
    {
        NewPlayer.PlayerReplicationInfo.SetUniqueId(UniqueId);
    }
    // End:0x718
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && NotEqual_UniqueNetIdUniqueNetId(UniqueId, ZeroId))
    {
        WorldInfo.Game.OnlineSub.GameInterface.RegisterPlayer(PlayerReplicationInfoClass.default.SessionName, UniqueId, HasOption(Options, "bIsFromInvite"));        
    }
    RecalculateSkillRating();
    // End:0x77C
    if(InName == "")
    {
        InName = DefaultPlayerName $ string(NewPlayer.PlayerReplicationInfo.PlayerID);
    }
    bChangedTeam = ChangeTeam(NewPlayer, int(InTeam), false);
    ChangeName(NewPlayer, InName, false);
    inCharacter = ParseOption(Options, "Character");
    NewPlayer.SetCharacter(inCharacter);
    // End:0x939
    if((bSpectator || NewPlayer.PlayerReplicationInfo.bOnlySpectator) || !bChangedTeam)
    {
        NewPlayer.GotoState('Spectating');
        NewPlayer.PlayerReplicationInfo.bOnlySpectator = true;
        NewPlayer.PlayerReplicationInfo.bIsSpectator = true;
        NewPlayer.PlayerReplicationInfo.bOutOfLives = true;
        return NewPlayer;
    }
    // End:0x9A6
    if((AccessControl != none) && AccessControl.AdminLogin(NewPlayer, InPassword))
    {
        AccessControl.AdminEntered(NewPlayer);
    }
    // End:0x9E0
    if(bDelayedStart)
    {
        NewPlayer.GotoState('PlayerWaiting');
        return NewPlayer;
    }
    return NewPlayer;
    //return ReturnValue;    
}

function StartMatch()
{
    local /*0x35EA0000-0x00000000*/ private bool bFireLevelStartup[9437185], bFireLevelBegin;
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    true
    true
    // End:0x38
    if(MyAutoTestManager != none)
    {
        MyAutoTestManager.StartMatch();
    }
    // End:0x71
    foreach AllActors(Class'Actor', A)
    {
        A.MatchStarting();        
    }    
    StartHumans();
    StartBots();
    bWaitingToStartMatch = false;
    StartOnlineGame();
    WorldInfo.NotifyMatchStarted(bFireLevelStartup, bFireLevelBegin);
    //return;    
}

function StartOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x139
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        // End:0x98
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x97
            if(!PC.IsLocalPlayerController())
            {
                PC.ClientStartOnlineGame();
            }            
        }        
        GameInterface.AddStartOnlineGameCompleteDelegate(OnStartOnlineGameComplete);
        GameInterface.StartOnlineGame(PlayerReplicationInfoClass.default.SessionName);
        // End:0x136
        if(AccessControl != none)
        {
            AccessControl.NotifyStartOnlineGame();
        }        
    }
    else
    {
        GameReplicationInfo.StartMatch();
    }
    //return;    
}

function OnStartOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StatGuid;

    GameInterface.ClearStartOnlineGameCompleteDelegate(OnStartOnlineGameComplete);
    // End:0x147
    if(bWasSuccessful && NotEqual_InterfaceInterface(OnlineSub.StatsInterface, OnlineStatsInterface(none)))
    {
        StatGuid = OnlineSub.StatsInterface.GetHostStatGuid();
        // End:0x147
        if(StatGuid != "")
        {
            // End:0x146
            foreach WorldInfo.AllControllers(Class'PlayerController', PC)
            {
                // End:0x145
                if(PC.IsLocalPlayerController() == false)
                {
                    PC.ClientRegisterHostStatGuid(StatGuid);
                }                
            }            
        }
    }
    GameReplicationInfo.StartMatch();
    //return;    
}

function StartHumans()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P;

    // End:0xA1
    foreach WorldInfo.AllControllers(Class'PlayerController', P)
    {
        // End:0xA0
        if(P.Pawn == none)
        {
            // End:0x6B
            if(bGameEnded)
            {                
                return;
                // End:0xA0
                continue;
            }
            // End:0xA0
            if(P.CanRestartPlayer())
            {
                RestartPlayer(P);
            }
        }        
    }    
    //return;    
}

function StartBots()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P;

    // End:0xE8
    foreach WorldInfo.AllControllers(Class'Controller', P)
    {
        // End:0xE7
        if(P.bIsPlayer && !P.IsA('PlayerController'))
        {
            // End:0xBC
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                RestartPlayer(P);
                // End:0xE7
                continue;
            }
            P.GotoState('Dead', 'MPStart');
        }        
    }    
    //return;    
}

function RestartPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPlayer[8388609], StartSpot;
    local /*0x35EA0000-0x00000000*/ private int TeamNum, Idx;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Events;
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnedEvent, LP, PC;

    // End:0x65
    if((bRestartLevel && int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && int(WorldInfo.NetMode) != int(NM_ListenServer))
    {
        return;
    }
    TeamNum = (((NewPlayer.PlayerReplicationInfo == none) || NewPlayer.PlayerReplicationInfo.Team == none) ? 255 : NewPlayer.PlayerReplicationInfo.Team.TeamIndex);
    StartSpot = FindPlayerStart(NewPlayer, byte(TeamNum));
    // End:0x1A3
    if(StartSpot == none)
    {
        // End:0x1A1
        if(NewPlayer.StartSpot != none)
        {
            StartSpot = NewPlayer.StartSpot;            
        }
        else
        {
            return;
        }
    }
    // End:0x202
    if(NewPlayer.Pawn == none)
    {
        NewPlayer.Pawn = SpawnDefaultPawnFor(NewPlayer, StartSpot);
    }
    // End:0x29E
    if(NewPlayer.Pawn == none)
    {
        NewPlayer.GotoState('Dead');
        // End:0x29B
        if(PlayerController(NewPlayer) != none)
        {
            PlayerController(NewPlayer).ClientGotoState('Dead', 'Begin');
        }        
    }
    else
    {
        NewPlayer.Pawn.SetAnchor(StartSpot);
        // End:0x340
        if(PlayerController(NewPlayer) != none)
        {
            PlayerController(NewPlayer).TimeMargin = -0.1000000;
            StartSpot.AnchoredPawn = none;
        }
        NewPlayer.Pawn.LastStartSpot = PlayerStart(StartSpot);
        NewPlayer.Pawn.LastStartTime = WorldInfo.TimeSeconds;
        NewPlayer.Possess(NewPlayer.Pawn, false);
        NewPlayer.Pawn.PlayTeleportEffect(true, true);
        NewPlayer.ClientSetRotation(NewPlayer.Pawn.Rotation, true);
        // End:0x502
        if(!Class'WorldInfo'.static.GetWorldInfo(true).bNoDefaultInventoryForPlayer)
        {
            AddDefaultInventory(NewPlayer.Pawn);
        }
        SetPlayerDefaults(NewPlayer.Pawn);
        // End:0x67D
        if(WorldInfo.GetGameSequence() != none)
        {
            WorldInfo.GetGameSequence().FindSeqObjectsByClass(Class'SeqEvent_PlayerSpawned', true, Events);
            Idx = 0;
            J0x5A2:

            // End:0x67D [Loop If]
            if(Idx < Events.Length)
            {
                SpawnedEvent = SeqEvent_PlayerSpawned(Events[Idx]);
                // End:0x66F
                if((SpawnedEvent != none) && SpawnedEvent.CheckActivate(NewPlayer, NewPlayer))
                {
                    SpawnedEvent.SpawnPoint = StartSpot;
                    SpawnedEvent.PopulateLinkedVariableValues();
                }
                Idx++;
                // [Loop Continue]
                goto J0x5A2;
            }
        }
    }
    PC = PlayerController(NewPlayer);
    // End:0x7B8
    if(PC != none)
    {
        LP = LocalPlayer(PC.Player);
        // End:0x7B8
        if(LP != none)
        {
            LP.RemoveAllPostProcessingChains();
            LP.InsertPostProcessingChain(LP.Outer.GetWorldPostProcessChain(), -1, true);
            // End:0x7B8
            if(PC.myHUD != none)
            {
                PC.myHUD.NotifyBindPostProcessEffects();
            }
        }
    }
    //return;    
}

function SpawnDefaultPawnFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPlayer[8388609], StartSpot, ReturnValue;
    local /*0x35EA0000-0x00000000*/ private class DefaultPlayerClass;
    local /*0x35EA0000-0x00000000*/ private @NULL StartRotation, ResultPawn;

    DefaultPlayerClass = GetDefaultPlayerClass(NewPlayer, StartSpot);
    StartRotation.Yaw = StartSpot.Rotation.Yaw;
    ResultPawn = Spawn(DefaultPlayerClass,,, StartSpot.Location, StartRotation);
    // End:0xCC
    if(ResultPawn == none)
    {
    }
    return ResultPawn;
    //return ReturnValue;    
}

function GetDefaultPlayerClass()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609], StartSpot;
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];

    return DefaultPawnClass;
    //return ReturnValue;    
}

function ReplicateStreamingStatus()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private int LevelIndex;
    local /*0x35EA0000-0x00000000*/ private @NULL TheLevel;

    // End:0x339
    if((LocalPlayer(PC.Player) == none) && ChildConnection(PC.Player) == none)
    {
        // End:0xE8
        if(WorldInfo.CommittedPersistentLevelName != 'None')
        {
            PC.ClientPrepareMapChange(WorldInfo.CommittedPersistentLevelName, true, true);
            PC.ClientCommitMapChange();
        }
        // End:0x24D
        if(WorldInfo.StreamingLevels.Length > 0)
        {
            LevelIndex = 0;
            J0x118:

            // End:0x22E [Loop If]
            if(LevelIndex < WorldInfo.StreamingLevels.Length)
            {
                TheLevel = WorldInfo.StreamingLevels[LevelIndex];
                // End:0x220
                if(TheLevel != none)
                {
                    PC.ClientUpdateLevelStreamingStatus(TheLevel.PackageName, TheLevel.bShouldBeLoaded, TheLevel.bShouldBeVisible, TheLevel.bShouldBlockOnLoad);
                }
                LevelIndex++;
                // [Loop Continue]
                goto J0x118;
            }
            PC.ClientFlushLevelStreaming();
        }
        // End:0x339
        if(WorldInfo.PreparingLevelNames.Length > 0)
        {
            LevelIndex = 0;
            J0x27D:

            // End:0x339 [Loop If]
            if(LevelIndex < WorldInfo.PreparingLevelNames.Length)
            {
                PC.ClientPrepareMapChange(WorldInfo.PreparingLevelNames[LevelIndex], LevelIndex == 0, LevelIndex == (WorldInfo.PreparingLevelNames.Length - 1));
                LevelIndex++;
                // [Loop Continue]
                goto J0x27D;
            }
        }
    }
    //return;    
}

function GenericPlayerInitialization()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609], PC;

    PC = PlayerController(C);
    // End:0xF8
    if(PC != none)
    {
        UpdateBestNextHosts();
        UpdateGameplayMuteList(PC);
        PC.ClientSetHUD(HUDType);
        PC.ClientSetSecondaryHUD(SecondaryHUDType);
        ReplicateStreamingStatus(PC);
        // End:0xD9
        if(CoverReplicatorBase != none)
        {
            PC.SpawnCoverReplicator();
        }
        PC.ClientSetOnlineStatus();
    }
    // End:0x12F
    if(BaseMutator != none)
    {
        BaseMutator.NotifyLogin(C);
    }
    //return;    
}

function BestNextHostSort()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], Result;

    // End:0x11C
    if(((A.ConnectedPeers.Length == B.ConnectedPeers.Length) && A.PlayerReplicationInfo != none) && B.PlayerReplicationInfo != none)
    {
        Result = FCeil(float(B.PlayerReplicationInfo.StartTime)) - FCeil(float(A.PlayerReplicationInfo.StartTime));        
    }
    else
    {
        Result = A.ConnectedPeers.Length - B.ConnectedPeers.Length;
    }
    return Result;
    //return ReturnValue;    
}

function UpdateBestNextHosts()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SortedPCList;
    local /*0x35EA0000-0x00000000*/ private @NULL SortedPlayerIdList[10], ZeroId;
    local /*0x35EA0000-0x00000000*/ private int Idx, NumEntries;

    // End:0x104
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0x103
        if(((!PC.IsLocalPlayerController() && PC.PlayerReplicationInfo != none) && NotEqual_UniqueNetIdUniqueNetId(PC.PlayerReplicationInfo.UniqueId, ZeroId)) && PC.IsPrimaryPlayer())
        {
            SortedPCList.AddItem(PC);            
        }        
    }    
    SortedPCList.Sort(BestNextHostSort);    
    NumEntries = Min(SortedPCList.Length, 10);
    Idx = 0;
    J0x146:

    // End:0x1BC [Loop If]
    if(Idx < NumEntries)
    {
        SortedPlayerIdList[Idx] = SortedPCList[Idx].PlayerReplicationInfo.UniqueId;
        Idx++;
        // [Loop Continue]
        goto J0x146;
    }
    // End:0x248
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0x247
        if(!PC.IsLocalPlayerController())
        {
            PC.ClientUpdateBestNextHosts(SortedPlayerIdList, byte(NumEntries));
        }        
    }    
    //return;    
}

event PostLogin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Address, StatGuid;
    local /*0x35EA0000-0x00000000*/ private int pos, I;
    local /*0x35EA0000-0x00000000*/ private @NULL GameSeq;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array AllInterpActions;
    local /*0x35EA0000-0x00000000*/ private int HidePlayer, HideHUD, DisableMovement, DisableTurning, DisableInput;

    // End:0x45
    if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        NumSpectators++;        
    }
    else
    {
        // End:0x99
        if(WorldInfo.IsInSeamlessTravel() || NewPlayer.HasClientLoadedCurrentWorld())
        {
            NumPlayers++;            
        }
        else
        {
            NumTravellingPlayers++;
        }
    }
    UpdateGameSettingsCounts();
    Address = NewPlayer.GetPlayerNetworkAddress();
    pos = InStr(Address, ":");
    NewPlayer.PlayerReplicationInfo.SavedNetworkAddress = ((pos > 0) ? Left(Address, pos) : Address);
    FindInactivePRI(NewPlayer);
    // End:0x1C6
    if(!bDelayedStart)
    {
        bRestartLevel = false;
        // End:0x19E
        if(bWaitingToStartMatch)
        {
            StartMatch();            
        }
        else
        {
            RestartPlayer(NewPlayer);
        }
        bRestartLevel = default.bRestartLevel;
    }
    // End:0x251
    if(NewPlayer.Pawn != none)
    {
        NewPlayer.Pawn.ClientSetRotation(NewPlayer.Pawn.Rotation);
    }
    NewPlayer.ClientCapBandwidth(NewPlayer.Player.CurrentNetSpeed);
    UpdateNetSpeeds();
    GenericPlayerInitialization(NewPlayer);
    // End:0x3A1
    if((GameReplicationInfo.bMatchHasBegun && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.StatsInterface, OnlineStatsInterface(none)))
    {
        StatGuid = OnlineSub.StatsInterface.GetHostStatGuid();
        // End:0x3A1
        if(StatGuid != "")
        {
            NewPlayer.ClientRegisterHostStatGuid(StatGuid);
        }
    }
    // End:0x3D0
    if(bRequiresPushToTalk)
    {
        NewPlayer.ClientStopNetworkedVoice();        
    }
    else
    {
        NewPlayer.ClientStartNetworkedVoice();
    }
    // End:0x44F
    if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        NewPlayer.ClientGotoState('Spectating');
    }
    GameSeq = WorldInfo.GetGameSequence();
    // End:0x525
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'SeqAct_Interp', true, AllInterpActions);
        I = 0;
        J0x4C4:

        // End:0x525 [Loop If]
        if(I < AllInterpActions.Length)
        {
            SeqAct_Interp(AllInterpActions[I]).AddPlayerToDirectorTracks(NewPlayer);
            I++;
            // [Loop Continue]
            goto J0x4C4;
        }
    }
    // End:0x5BB
    if(ShouldStartInCinematicMode(HidePlayer, HideHUD, DisableMovement, DisableTurning, DisableInput))
    {
        NewPlayer.SetCinematicMode(true, HidePlayer == 1, HideHUD == 1, DisableMovement == 1, DisableTurning == 1, DisableInput == 1);
    }
    //return;    
}

function UpdateNetSpeeds()
{
    local /*0x35EA0000-0x00000000*/ private int NewNetSpeed;
    local /*0x35EA0000-0x00000000*/ private @NULL PC, GameSettings;

    // End:0x68
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        GameSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
    }
    // End:0xF3
    if(((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_Standalone)) || (GameSettings != none) && GameSettings.bIsLanMatch)
    {
        return;
    }
    // End:0x13B
    if((WorldInfo.TimeSeconds - LastNetSpeedUpdateTime) < 1.0000000)
    {
        SetTimer(1.0000000, false, 'UpdateNetSpeeds');
        return;
    }
    LastNetSpeedUpdateTime = WorldInfo.TimeSeconds;
    NewNetSpeed = CalculatedNetSpeed();
    // End:0x1FF
    if(AdjustedNetSpeed != NewNetSpeed)
    {
        AdjustedNetSpeed = NewNetSpeed;
        // End:0x1FE
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.SetNetSpeed(AdjustedNetSpeed);            
        }        
    }
    //return;    
}

function CalculatedNetSpeed()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return Clamp(TotalNetBandwidth / Max(NumPlayers, 1), MinDynamicBandwidth, MaxDynamicBandwidth);
    //return ReturnValue;    
}

event PreExit()
{
    // End:0x2E
    if(AccessControl != none)
    {
        AccessControl.NotifyExit();
    }
    ClearOnlineDelegates();
    //return;    
}

function Logout()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Exiting[8388609], PC;
    local /*0x35EA0000-0x00000000*/ private int PCIndex;

    PC = PlayerController(Exiting);
    // End:0x1E7
    if(PC != none)
    {
        // End:0xA1
        if((AccessControl != none) && AccessControl.AdminLogout(PlayerController(Exiting)))
        {
            AccessControl.AdminExited(PlayerController(Exiting));
        }
        // End:0xE6
        if(PC.PlayerReplicationInfo.bOnlySpectator)
        {
            NumSpectators--;            
        }
        else
        {
            // End:0x13A
            if(WorldInfo.IsInSeamlessTravel() || PC.HasClientLoadedCurrentWorld())
            {
                NumPlayers--;                
            }
            else
            {
                NumTravellingPlayers--;
            }
            UpdateGameSettingsCounts();
        }
        // End:0x17C
        if((bUsingArbitration && bHasArbitratedHandshakeBegun) && !bHasEndGameHandshakeBegun)
        {
        }
        UnregisterPlayer(PC);
        // End:0x1E4
        if(bUsingArbitration)
        {
            PCIndex = ArbitrationPCs.Find(PC);            
            // End:0x1E4
            if(PCIndex != -1)
            {
                ArbitrationPCs.Remove(PCIndex, 1);                
            }
        }        
    }
    // End:0x21E
    if(BaseMutator != none)
    {
        BaseMutator.NotifyLogout(Exiting);
    }
    // End:0x237
    if(PC != none)
    {
        UpdateNetSpeeds();
    }
    //return;    
}

function UnregisterPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609], ZeroId;

    // End:0x17A
    if((((int(WorldInfo.NetMode) != int(NM_Standalone)) && NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none))) && NotEqual_UniqueNetIdUniqueNetId(PC.PlayerReplicationInfo.UniqueId, ZeroId)) && GameInterface.GetGameSettings(PC.PlayerReplicationInfo.SessionName) != none)
    {
        GameInterface.UnregisterPlayer(PC.PlayerReplicationInfo.SessionName, PC.PlayerReplicationInfo.UniqueId);        
    }
    //return;    
}

event AcceptInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerPawn[8388609];

    //return;    
}

event AddDefaultInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    P.AddDefaultInventory();
    // End:0x43
    if(P.InvManager == none)
    {
    }
    //return;    
}

function Mutate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MutateString[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];

    // End:0x40
    if(BaseMutator != none)
    {
        BaseMutator.Mutate(MutateString, Sender);
    }
    //return;    
}

function DoesPreventPlayerValuesResetToDefault()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SetPlayerDefaults()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerPawn[8388609];

    // End:0x1BA
    if(!DoesPreventPlayerValuesResetToDefault())
    {
        PlayerPawn.AirControl = PlayerPawn.default.AirControl;
        PlayerPawn.GroundSpeed = PlayerPawn.default.GroundSpeed;
        PlayerPawn.WaterSpeed = PlayerPawn.default.WaterSpeed;
        PlayerPawn.AirSpeed = PlayerPawn.default.AirSpeed;
        PlayerPawn.Acceleration = PlayerPawn.default.Acceleration;
        PlayerPawn.AccelRate = PlayerPawn.default.AccelRate;
        PlayerPawn.JumpZ = PlayerPawn.default.JumpZ;
    }
    // End:0x1F1
    if(BaseMutator != none)
    {
        BaseMutator.ModifyPlayer(PlayerPawn);
    }
    PlayerPawn.PhysicsVolume.ModifyPlayer(PlayerPawn);
    //return;    
}

function NotifyKilled()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], Killed, KilledPawn;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    // End:0x78
    foreach WorldInfo.AllControllers(Class'Controller', C)
    {
        C.NotifyKilled(Killer, Killed, KilledPawn, DamageType);        
    }    
    //return;    
}

function Killed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], KilledPlayer, KilledPawn;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];

    // End:0x11F
    if((KilledPlayer != none) && KilledPlayer.bIsPlayer)
    {
        KilledPlayer.PlayerReplicationInfo.IncrementDeaths();
        KilledPlayer.PlayerReplicationInfo.SetNetUpdateTime(FMin(KilledPlayer.PlayerReplicationInfo.NetUpdateTime, WorldInfo.TimeSeconds + (0.3000000 * FRand())));
        BroadcastDeathMessage(Killer, KilledPlayer, DamageType);
    }
    // End:0x14A
    if(KilledPlayer != none)
    {
        ScoreKill(Killer, KilledPlayer);
    }
    DiscardInventory(KilledPawn, Killer);
    NotifyKilled(Killer, KilledPlayer, KilledPawn, DamageType);
    //return;    
}

function PreventDeath()
{
    local /*0x35EA0000-0x00000000*/ private @NULL KilledPawn[8388609], Killer;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(BaseMutator == none)
    {
        return false;
    }
    return BaseMutator.PreventDeath(KilledPawn, Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

function BroadcastDeathMessage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], Other;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];

    // End:0x68
    if((Killer == Other) || Killer == none)
    {
        BroadcastLocalized(self, DeathMessageClass, 1, none, Other.PlayerReplicationInfo, DamageType);        
    }
    else
    {
        BroadcastLocalized(self, DeathMessageClass, 0, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, DamageType);
    }
    //return;    
}

function Kick()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    // End:0x37
    if(AccessControl != none)
    {
        AccessControl.Kick(S);
    }
    //return;    
}

function KickBan()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    // End:0x37
    if(AccessControl != none)
    {
        AccessControl.KickBan(S);
    }
    //return;    
}

function CanSpectate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Viewer[8388609], ViewTarget;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ReduceDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL injured[8388609], InstigatedBy, HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private int OriginalDamage;

    OriginalDamage = Damage;
    // End:0x7B
    if(injured.PhysicsVolume.bNeutralZone || injured.InGodMode())
    {
        Damage = 0;
        return;
    }
    // End:0xF1
    if(BaseMutator != none)
    {
        BaseMutator.NetDamage(OriginalDamage, Damage, injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
    }
    //return;    
}

function CheckRelevance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(BaseMutator == none)
    {
        return true;
    }
    return BaseMutator.CheckRelevance(Other);
    //return ReturnValue;    
}

function ShouldRespawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(WorldInfo.NetMode) != int(NM_Standalone);
    //return ReturnValue;    
}

function PickupQuery()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private class ItemClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private byte bAllowPickup;

    // End:0x63
    if((BaseMutator != none) && BaseMutator.OverridePickupQuery(Other, ItemClass, Pickup, bAllowPickup))
    {
        return bool(bAllowPickup);
    }
    // End:0x8C
    if(Other.InvManager == none)
    {
        return false;        
    }
    else
    {
        return Other.InvManager.HandlePickupQuery(ItemClass, Pickup);
    }
    //return ReturnValue;    
}

function DiscardInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], Killer;

    // End:0x59
    if(Other.InvManager != none)
    {
        Other.InvManager.DiscardInventory();
    }
    //return;    
}

function ChangeName()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337];
    local /*0x35EA0000-0x00000000*/ private bool bNameChange[8388609];

    // End:0x12
    if(S == "")
    {
        return;
    }
    Other.PlayerReplicationInfo.SetPlayerName(S);
    //return;    
}

function ChangeTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private int N[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNewTeam[8388609], ReturnValue;

    return true;
    //return ReturnValue;    
}

function PickTeam()
{
    local /*0x35EA0000-0x00000000*/ private byte Current[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    return Current;
    //return ReturnValue;    
}

function SendPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];

    aPlayer.ClientTravel(URL, 2);
    //return;    
}

function GetNextMap()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

function GetTravelType()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function RestartGame()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NextMap, TransitionMapCmdLine, URLString;
    local /*0x35EA0000-0x00000000*/ private int URLMapLen, MapNameLen;

    // End:0x26
    if(bUsingArbitration)
    {
        // End:0x24
        if(bIsEndGameHandshakeComplete)
        {
            NotifyArbitratedMatchEnd();
        }
        return;
    }
    // End:0x5B
    if((BaseMutator != none) && BaseMutator.HandleRestartGame())
    {
        return;
    }
    // End:0x6A
    if(bGameRestarted)
    {
        return;
    }
    bGameRestarted = true;
    // End:0x3CF
    if(bChangeLevels && !bAlreadyChanged)
    {
        bAlreadyChanged = true;
        // End:0xFF
        if((MyAutoTestManager != none) && MyAutoTestManager.bUsingAutomatedTestingMapList)
        {
            NextMap = MyAutoTestManager.GetNextAutomatedTestingMap();            
        }
        else
        {
            NextMap = GetNextMap();
        }
        // End:0x3CF
        if(NextMap != "")
        {
            // End:0x18E
            if((MyAutoTestManager == none) || !MyAutoTestManager.bUsingAutomatedTestingMapList)
            {
                WorldInfo.ServerTravel(NextMap, GetTravelType());                
            }
            else
            {
                // End:0x2DB
                if(!MyAutoTestManager.bAutomatedTestingWithOpen)
                {
                    URLString = WorldInfo.GetLocalURL();
                    URLMapLen = Len(URLString);
                    MapNameLen = InStr(URLString, "?");
                    // End:0x247
                    if(MapNameLen != -1)
                    {
                        URLString = Right(URLString, URLMapLen - MapNameLen);
                    }
                    TransitionMapCmdLine = ((NextMap $ URLString) $ "?AutomatedTestingMapIndex=") $ string(MyAutoTestManager.AutomatedTestingMapIndex);
                    WorldInfo.ServerTravel(TransitionMapCmdLine, GetTravelType());                    
                }
                else
                {
                    TransitionMapCmdLine = (((("?AutomatedTestingMapIndex=" $ string(MyAutoTestManager.AutomatedTestingMapIndex)) $ "?NumberOfMatchesPlayed=") $ string(MyAutoTestManager.NumberOfMatchesPlayed)) $ "?NumMapListCyclesDone=") $ string(MyAutoTestManager.NumMapListCyclesDone);                    
                    ConsoleCommand(("open " $ NextMap) $ TransitionMapCmdLine);
                }
            }
            return;
        }
    }
    WorldInfo.ServerTravel("?Restart", GetTravelType());
    //return;    
}

event Broadcast()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];

    BroadcastHandler.Broadcast(Sender, msg, Type);
    //return;    
}

function BroadcastTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];

    BroadcastHandler.BroadcastTeam(Sender, msg, Type);
    //return;    
}

event BroadcastLocalized()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private class Message[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;

    BroadcastHandler.AllowBroadcastLocalized(Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

event BroadcastLocalizedTeam()
{
    local /*0x35EA0000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private class Message[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;

    BroadcastHandler.AllowBroadcastLocalizedTeam(TeamIndex, Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

function CheckModifiedEndGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Winner[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (BaseMutator != none) && !BaseMutator.CheckEndGame(Winner, Reason);
    //return ReturnValue;    
}

function CheckEndGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Winner[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL P;

    // End:0x21
    if(CheckModifiedEndGame(Winner, Reason))
    {
        return false;
    }
    // End:0x77
    foreach WorldInfo.AllControllers(Class'Controller', P)
    {
        P.GameHasEnded();        
    }    
    return true;
    //return ReturnValue;    
}

function WriteOnlineStats()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC, CurrentSettings;

    // End:0x1A0
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        CurrentSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
        // End:0x1A0
        if((CurrentSettings != none) && CurrentSettings.bUsesStats)
        {
            // End:0x11E
            foreach WorldInfo.AllControllers(Class'PlayerController', PC)
            {
                // End:0x11D
                if(PC.IsLocalPlayerController() == false)
                {
                    PC.ClientWriteLeaderboardStats(OnlineStatsWriteClass);
                }                
            }            
            // End:0x19F
            foreach WorldInfo.AllControllers(Class'PlayerController', PC)
            {
                // End:0x19E
                if(PC.IsLocalPlayerController())
                {
                    PC.ClientWriteLeaderboardStats(OnlineStatsWriteClass);
                }                
            }            
        }
    }
    //return;    
}

function WriteOnlinePlayerScores()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x6E
    if(bUsingArbitration)
    {
        // End:0x6A
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.ClientWriteOnlinePlayerScores(ArbitratedLeaderboardId);            
        }                
    }
    else
    {
        // End:0xF0
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0xEF
            if(PC.IsLocalPlayerController())
            {
                PC.ClientWriteOnlinePlayerScores(LeaderboardId);
                // End:0xF0
                break;
            }            
        }        
    }
    //return;    
}

function EndGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Winner[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[8388609];

    // End:0x2F
    if(!CheckEndGame(Winner, Reason))
    {
        bOverTime = true;
        return;
    }
    SetTimer(1.5000000, false, 'PerformEndGameHandling');
    bGameEnded = true;
    EndLogging(Reason);
    //return;    
}

function PerformEndGameHandling()
{
    // End:0x6D
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        WriteOnlineStats();
        WriteOnlinePlayerScores();
        EndOnlineGame();
        // End:0x6D
        if(bUsingArbitration)
        {
            PendingArbitrationPCs.Length = 0;
            ArbitrationPCs.Length = 0;
            NotifyArbitratedMatchEnd();
        }
    }
    //return;    
}

function EndOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    GameReplicationInfo.EndGame();
    // End:0xF6
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        // End:0xB7
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0xB6
            if(!PC.IsLocalPlayerController())
            {
                PC.ClientEndOnlineGame();
            }            
        }        
        GameInterface.EndOnlineGame(PlayerReplicationInfoClass.default.SessionName);
    }
    //return;    
}

function GameEventsPoll()
{
    //return;    
}

function EndLogging()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[8388609];

    //return;    
}

function ShouldSpawnAtStartSpot()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (((int(WorldInfo.NetMode) == int(NM_Standalone)) && Player != none) && Player.StartSpot != none) && bWaitingToStartMatch || (Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.bWaitingPlayer;
    //return ReturnValue;    
}

function FindPlayerStart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InTeam[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string IncomingName[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], N, BestStart, Tel;

    // End:0x6E
    if(BaseMutator != none)
    {
        N = BaseMutator.FindPlayerStart(Player, InTeam, IncomingName);
        // End:0x6E
        if(N != none)
        {
            return N;
        }
    }
    // End:0xED
    if(IncomingName != "")
    {
        // End:0xEC
        foreach WorldInfo.AllNavigationPoints(Class'Teleporter', Tel)
        {
            // End:0xEB
            if(string(Tel.Tag) ~= IncomingName)
            {                
                return Tel;
            }            
        }        
    }
    // End:0x1A0
    if((ShouldSpawnAtStartSpot(Player)) && (PlayerStart(Player.StartSpot) == none) || (RatePlayerStart(PlayerStart(Player.StartSpot), InTeam, Player)) >= 0.0000000)
    {
        return Player.StartSpot;
    }
    BestStart = ChoosePlayerStart(Player, InTeam);
    // End:0x217
    if((BestStart == none) && Player == none)
    {
        // End:0x216
        foreach AllActors(Class'NavigationPoint', N)
        {
            BestStart = N;
            // End:0x216
            break;            
        }        
    }
    return BestStart;
    //return ReturnValue;    
}

function ChoosePlayerStart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InTeam[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], P, BestStart;
    local /*0x35EA0000-0x00000000*/ private float BestRating, NewRating;
    local /*0x35EA0000-0x00000000*/ private byte Team;

    Team = ((((Player != none) && Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.Team != none) ? byte(Player.PlayerReplicationInfo.Team.TeamIndex) : InTeam);
    // End:0x171
    foreach WorldInfo.AllNavigationPoints(Class'PlayerStart', P)
    {
        NewRating = RatePlayerStart(P, Team, Player);
        // End:0x170
        if(NewRating > BestRating)
        {
            BestRating = NewRating;
            BestStart = P;
        }        
    }    
    return BestStart;
    //return ReturnValue;    
}

function RatePlayerStart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Team[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689], Rating;

    // End:0x2D
    if(!P.bEnabled)
    {
        return 5.0000000;        
    }
    else
    {
        Rating = 10.0000000;
        // End:0x6E
        if(P.bPrimaryStart)
        {
            Rating += 10.0000000;
        }
        // End:0xAC
        if(P.TeamIndex == int(Team))
        {
            Rating += 15.0000000;
        }
        return Rating;
    }
    //return ReturnValue;    
}

function AddObjectiveScore()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x35EA0000-0x00000000*/ private int Score[8388609];

    // End:0x3A
    if(Scorer != none)
    {
        Scorer.Score += float(Score);
    }
    // End:0x7A
    if(BaseMutator != none)
    {
        BaseMutator.ScoreObjective(Scorer, Score);
    }
    //return;    
}

function ScoreObjective()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x35EA0000-0x00000000*/ private int Score[8388609];

    AddObjectiveScore(Scorer, Score);
    CheckScore(Scorer);
    //return;    
}

function CheckScore()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ScoreKill()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], Other;

    // End:0xCE
    if((Killer == Other) || Killer == none)
    {
        // End:0xCB
        if((Other != none) && Other.PlayerReplicationInfo != none)
        {
            Other.PlayerReplicationInfo.Score -= float(1);
            Other.PlayerReplicationInfo.bForceNetUpdate = true;
        }        
    }
    else
    {
        // End:0x195
        if(Killer.PlayerReplicationInfo != none)
        {
            Killer.PlayerReplicationInfo.Score += float(1);
            Killer.PlayerReplicationInfo.bForceNetUpdate = true;
            Killer.PlayerReplicationInfo.Kills++;
        }
    }
    ModifyScoreKill(Killer, Other);
    // End:0x1F9
    if((Killer != none) || MaxLives > 0)
    {
        CheckScore(Killer.PlayerReplicationInfo);
    }
    //return;    
}

function ModifyScoreKill()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], Other;

    // End:0x40
    if(BaseMutator != none)
    {
        BaseMutator.ScoreKill(Killer, Other);
    }
    //return;    
}

function DriverEnteredVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], P;

    // End:0x40
    if(BaseMutator != none)
    {
        BaseMutator.DriverEnteredVehicle(V, P);
    }
    //return;    
}

function CanLeaveVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], P;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(BaseMutator == none)
    {
        return true;
    }
    return BaseMutator.CanLeaveVehicle(V, P);
    //return ReturnValue;    
}

function DriverLeftVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], P;

    // End:0x40
    if(BaseMutator != none)
    {
        BaseMutator.DriverLeftVehicle(V, P);
    }
    //return;    
}

function PlayerCanRestartGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function PlayerCanRestart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

static function AllowMutator()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MutatorClassName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return !Class'WorldInfo'.static.IsDemoBuild();
    //return ReturnValue;    
}

function AllowCheats()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(WorldInfo.NetMode) == int(NM_Standalone);
    //return ReturnValue;    
}

function AllowPausing()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (bPauseable || int(WorldInfo.NetMode) == int(NM_Standalone)) || bAdminCanPause && AccessControl.IsAdmin(PC);
    //return ReturnValue;    
}

event PreCommitMapChange()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PreviousMapName[8388609], NextMapName;
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185];

    //return;    
}

event PostCommitMapChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185];

    //return;    
}

function AddInactivePRI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609], PC;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL NewPRI, CurrentPRI;
    local /*0x35EA0000-0x00000000*/ private bool bIsConsole;

    // End:0x2CD
    if(!PRI.bFromPreviousLevel && !PRI.bOnlySpectator)
    {
        NewPRI = PRI.Duplicate();
        WorldInfo.GRI.RemovePRI(NewPRI);
        NewPRI.RemoteRole = ROLE_None;
        NewPRI.LifeSpan = 300.0000000;
        bIsConsole = WorldInfo.IsConsoleBuild();
        I = 0;
        J0x12B:

        // End:0x284 [Loop If]
        if(I < InactivePRIArray.Length)
        {
            CurrentPRI = InactivePRIArray[I];
            // End:0x276
            if((((CurrentPRI == none) || CurrentPRI.bDeleteMe) || !bIsConsole && CurrentPRI.SavedNetworkAddress == NewPRI.SavedNetworkAddress) || bIsConsole && Class'OnlineSubsystem'.static.AreUniqueNetIdsEqual(CurrentPRI.UniqueId, NewPRI.UniqueId))
            {
                InactivePRIArray.Remove(I, 1);                
                I--;
            }
            I++;
            // [Loop Continue]
            goto J0x12B;
        }
        InactivePRIArray[InactivePRIArray.Length] = NewPRI;
        // End:0x2CD
        if(InactivePRIArray.Length > 16)
        {
            InactivePRIArray.Remove(0, InactivePRIArray.Length - 16);            
        }
    }
    PRI.Destroy();
    RecalculateSkillRating();
    //return;    
}

function FindInactivePRI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewNetworkAddress, NewName;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL OldPRI, CurrentPRI;
    local /*0x35EA0000-0x00000000*/ private bool bIsConsole;

    // End:0x39
    if(PC.PlayerReplicationInfo.bOnlySpectator)
    {
        return false;
    }
    bIsConsole = WorldInfo.IsConsoleBuild();
    NewNetworkAddress = PC.PlayerReplicationInfo.SavedNetworkAddress;
    NewName = PC.PlayerReplicationInfo.PlayerName;
    I = 0;
    J0xE9:

    // End:0x424 [Loop If]
    if(I < InactivePRIArray.Length)
    {
        CurrentPRI = InactivePRIArray[I];
        // End:0x174
        if((CurrentPRI == none) || CurrentPRI.bDeleteMe)
        {
            InactivePRIArray.Remove(I, 1);            
            I--;            
        }
        else
        {
            // End:0x416
            if((bIsConsole && Class'OnlineSubsystem'.static.AreUniqueNetIdsEqual(CurrentPRI.UniqueId, PC.PlayerReplicationInfo.UniqueId)) || (!bIsConsole && CurrentPRI.SavedNetworkAddress ~= NewNetworkAddress) && CurrentPRI.PlayerName ~= NewName)
            {
                OldPRI = PC.PlayerReplicationInfo;
                PC.PlayerReplicationInfo = CurrentPRI;
                PC.PlayerReplicationInfo.SetOwner(PC);
                PC.PlayerReplicationInfo.RemoteRole = ROLE_SimulatedProxy;
                PC.PlayerReplicationInfo.LifeSpan = 0.0000000;
                OverridePRI(PC, OldPRI);
                WorldInfo.GRI.AddPRI(PC.PlayerReplicationInfo);
                InactivePRIArray.Remove(I, 1);                
                OldPRI.bIsInactive = true;
                OldPRI.Destroy();
                return true;
            }
        }
        I++;
        // [Loop Continue]
        goto J0xE9;
    }
    return false;
    //return ReturnValue;    
}

function OverridePRI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609], OldPRI;

    PC.PlayerReplicationInfo.OverrideWith(OldPRI);
    //return;    
}

event GetSeamlessTravelActorList()
{
    local /*0x35EA0000-0x00000000*/ private bool bToEntry[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActorList[25165825];
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x157 [Loop If]
    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        WorldInfo.GRI.PRIArray[I].bFromPreviousLevel = true;
        WorldInfo.GRI.PRIArray[I].bForceNetUpdate = true;
        ActorList[ActorList.Length] = WorldInfo.GRI.PRIArray[I];
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x1C4
    if(bToEntry)
    {
        ActorList[ActorList.Length] = WorldInfo.GRI;
        // End:0x1C4
        if(BroadcastHandler != none)
        {
            ActorList[ActorList.Length] = BroadcastHandler;
        }
    }
    // End:0x205
    if(BaseMutator != none)
    {
        BaseMutator.GetSeamlessTravelActorList(bToEntry, ActorList);
    }
    // End:0x232
    if(MyAutoTestManager != none)
    {
        ActorList[ActorList.Length] = MyAutoTestManager;
    }
    // End:0x25F
    if(AccessControl != none)
    {
        ActorList[ActorList.Length] = AccessControl;
    }
    //return;    
}

// Export UGameInfo::execSwapPlayerControllers(FFrame&, void* const)
native final function SwapPlayerControllers()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldPC[8388609], NewPC;


}

event PostSeamlessTravel()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    // End:0x107
    foreach WorldInfo.AllControllers(Class'Controller', C)
    {
        // End:0x106
        if(C.bIsPlayer)
        {
            // End:0x84
            if(PlayerController(C) == none)
            {
                HandleSeamlessTravelPlayer(C);
                // End:0x106
                continue;
            }
            // End:0xC8
            if(!C.PlayerReplicationInfo.bOnlySpectator)
            {
                NumTravellingPlayers++;
            }
            // End:0x106
            if(PlayerController(C).HasClientLoadedCurrentWorld())
            {
                HandleSeamlessTravelPlayer(C);
            }
        }        
    }    
    // End:0x14E
    if((bWaitingToStartMatch && !bDelayedStart) && (NumPlayers + NumBots) > 0)
    {
        StartMatch();
    }
    // End:0x181
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        UpdateGameSettings();
    }
    //return;    
}

function UpdateGameSettings()
{
    //return;    
}

function GetPlayerControllerClass()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609], StartSpot;
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];

    return PlayerControllerClass;
    //return ReturnValue;    
}

event HandleSeamlessTravelPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[25165825], StartRotation, StartSpot, PC, NewPC, OldPRI;

    local /*0x35EA0000-0x00000000*/ private class PCClass;

    PC = PlayerController(C);
    StartSpot = FindPlayerStart(C, C.GetTeamNum());
    PCClass = GetPlayerControllerClass(PC, StartSpot);
    // End:0x23D
    if((PC != none) && PC.Class != PCClass)
    {
        // End:0x222
        if(PC.Player != none)
        {
            NewPC = SpawnPlayerController(PCClass, PC.Location, PC.Rotation, StartSpot);
            // End:0x16E
            if(NewPC == none)
            {
                PC.Destroy();
                return;                
            }
            else
            {
                PC.CleanUpAudioComponents();
                PC.SeamlessTravelTo(NewPC);
                NewPC.SeamlessTravelFrom(PC);
                SwapPlayerControllers(PC, NewPC);
                PC = NewPC;
                C = NewPC;
            }            
        }
        else
        {
            PC.Destroy();
        }        
    }
    else
    {
        C.PlayerReplicationInfo.Reset();
        OldPRI = C.PlayerReplicationInfo;
        C.InitPlayerReplicationInfo();
        OldPRI.SeamlessTravelTo(C.PlayerReplicationInfo);
        OldPRI.Destroy();
    }
    // End:0x3CE
    if(!bTeamGame && C.PlayerReplicationInfo.Team != none)
    {
        C.PlayerReplicationInfo.Team.Destroy();
        C.PlayerReplicationInfo.Team = none;
    }
    // End:0x3E0
    if(StartSpot == none)
    {        
    }
    else
    {
        StartRotation.Yaw = StartSpot.Rotation.Yaw;
        C.SetLocation(StartSpot.Location);
        C.SetRotation(StartRotation);
    }
    C.StartSpot = StartSpot;
    // End:0x624
    if(PC != none)
    {
        PC.CleanUpAudioComponents();
        PC.ClientInitializeDataStores();
        SetSeamlessTravelViewTarget(PC);
        // End:0x5E8
        if(PC.PlayerReplicationInfo.bOnlySpectator)
        {
            PC.GotoState('Spectating');
            PC.PlayerReplicationInfo.bIsSpectator = true;
            PC.PlayerReplicationInfo.bOutOfLives = true;
            NumSpectators++;            
        }
        else
        {
            NumPlayers++;
            NumTravellingPlayers--;
            PC.GotoState('PlayerWaiting');
        }        
    }
    else
    {
        NumBots++;
        C.GotoState('RoundEnded');
    }
    GenericPlayerInitialization(C);
    //return;    
}

function SetSeamlessTravelViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    PC.SetViewTarget(PC);
    //return;    
}

function UpdateGameSettingsCounts()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;

    // End:0x128
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        GameSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
        // End:0x128
        if((GameSettings != none) && GameSettings.bIsLanMatch)
        {
            GameSettings.NumOpenPublicConnections = GameSettings.NumPublicConnections - (GetNumPlayers());
            // End:0x128
            if(GameSettings.NumOpenPublicConnections < 0)
            {
                GameSettings.NumOpenPublicConnections = 0;
            }
        }
    }
    //return;    
}

function ProcessClientRegistrationCompletion()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function StartArbitrationRegistration()
{
    //return;    
}

function StartArbitratedMatch()
{
    //return;    
}

function RegisterServerForArbitration()
{
    //return;    
}

function ArbitrationRegistrationComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function MatchIsInProgress()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyArbitratedMatchEnd()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x79
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0x78
        if(PC.IsLocalPlayerController() == false)
        {
            PC.ClientArbitratedMatchEnded();
        }        
    }    
    // End:0xF0
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0xEF
        if(PC.IsLocalPlayerController())
        {
            PC.ClientArbitratedMatchEnded();
        }        
    }    
    //return;    
}

function UpdateGameplayMuteList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    PC.bHasVoiceHandshakeCompleted = true;
    PC.ClientVoiceHandshakeComplete();
    //return;    
}

function RecalculateSkillRating()
{
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players;
    local /*0x35EA0000-0x00000000*/ private @NULL ZeroId;

    // End:0x1C8
    if(((int(WorldInfo.NetMode) != int(NM_Standalone)) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        Index = 0;
        J0x7C:

        // End:0x15C [Loop If]
        if(Index < GameReplicationInfo.PRIArray.Length)
        {
            // End:0x14E
            if(NotEqual_UniqueNetIdUniqueNetId(ZeroId, GameReplicationInfo.PRIArray[Index].UniqueId))
            {
                Players[Players.Length] = GameReplicationInfo.PRIArray[Index].UniqueId;
            }
            Index++;
            // [Loop Continue]
            goto J0x7C;
        }
        // End:0x1C8
        if(Players.Length > 0)
        {
            OnlineSub.GameInterface.RecalculateSkillRating(PlayerReplicationInfoClass.default.SessionName, Players);
        }
    }
    //return;    
}

event MatineeCancelled()
{
    //return;    
}

function ProcessServerLogin()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11B
    if(OnlineSub != none)
    {
        // End:0x11B
        if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.AddLoginFailedDelegate(0, OnLoginFailed);
            // End:0x119
            if(OnlineSub.PlayerInterface.AutoLogin() == false)
            {
                ClearAutoLoginDelegates();
                return false;
            }
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ClearAutoLoginDelegates()
{
    // End:0xC3
    if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
        OnlineSub.PlayerInterface.ClearLoginFailedDelegate(0, OnLoginFailed);
    }
    //return;    
}

function OnLoginFailed()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ErrorCode;

    ClearAutoLoginDelegates();
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    ClearAutoLoginDelegates();
    RegisterServer();
    //return;    
}

function RegisterServer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;

    // End:0x233
    if(((OnlineGameSettingsClass != none) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        GameSettings = new OnlineGameSettingsClass;
        GameSettings.UpdateFromURL(ServerOptions, self);
        // End:0x141
        if(((AccessControl != none) && (int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_ListenServer)) && GameSettings.bIsLanMatch)
        {
            AccessControl.ClearAuthDelegates(false);
        }
        OnlineSub.GameInterface.AddCreateOnlineGameCompleteDelegate(OnServerCreateComplete);
        // End:0x230
        if(!OnlineSub.GameInterface.CreateOnlineGame(0, PlayerReplicationInfoClass.default.SessionName, GameSettings))
        {
            OnlineSub.GameInterface.ClearCreateOnlineGameCompleteDelegate(OnServerCreateComplete);
        }        
    }
    //return;    
}

function OnServerCreateComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;

    GameInterface.ClearCreateOnlineGameCompleteDelegate(OnServerCreateComplete);
    // End:0x181
    if(bWasSuccessful == false)
    {
        GameSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
        // End:0x17E
        if((GameSettings != none) && GameSettings.bIsLanMatch == false)
        {
            GameSettings.bIsLanMatch = true;
            GameInterface.AddCreateOnlineGameCompleteDelegate(OnServerCreateComplete);
            // End:0x17B
            if(!GameInterface.CreateOnlineGame(0, SessionName, GameSettings))
            {
                GameInterface.ClearCreateOnlineGameCompleteDelegate(OnServerCreateComplete);
            }            
        }        
    }
    else
    {
        // End:0x248
        if(((OnlineSub.Class.Name == 'OnlineSubsystemSteamworks') && AccessControl != none) && EqualEqual_InterfaceInterface(AccessControl.CachedAuthInt, OnlineAuthInterface(none)))
        {
            AccessControl.InitAuthHooks();
            AccessControl.OnAuthReady();
        }
        UpdateGameSettings();
    }
    //return;    
}

function TellClientsToReturnToPartyHost()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC, GameSettings, RequestingPlayerId;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x2BF
    if(OnlineSub != none)
    {
        GameInterface = OnlineSub.GameInterface;
        // End:0x2BF
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            GameSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
            // End:0x102
            if(GameSettings != none)
            {
                RequestingPlayerId = GameSettings.OwningPlayerId;                
            }
            else
            {
                // End:0x1AA
                foreach LocalPlayerControllers(Class'PlayerController', PC)
                {
                    // End:0x1A9
                    if(PC.IsPrimaryPlayer() && PC.PlayerReplicationInfo != none)
                    {
                        RequestingPlayerId = PC.PlayerReplicationInfo.UniqueId;
                        // End:0x1AA
                        break;
                    }                    
                }                
            }
            // End:0x250
            foreach WorldInfo.AllControllers(Class'PlayerController', PC)
            {
                // End:0x24F
                if(!PC.IsLocalPlayerController() && PC.IsPrimaryPlayer())
                {
                    PC.ClientReturnToParty(RequestingPlayerId);
                }                
            }            
            // End:0x2BE
            foreach LocalPlayerControllers(Class'PlayerController', PC)
            {
                // End:0x2BD
                if(PC.IsPrimaryPlayer())
                {
                    PC.ClientReturnToParty(RequestingPlayerId);
                    // End:0x2BE
                    break;
                }                
            }            
        }
    }
    //return;    
}

function TellClientsPartyHostIsLeaving()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PartyHostPlayerId[8388609], PC;

    // End:0x7F
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0x7E
        if(PC.IsPrimaryPlayer())
        {
            PC.ClientNotifyPartyHostLeaving(PartyHostPlayerId);
        }        
    }    
    //return;    
}

function TellClientsToTravelToSession()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private class SearchClass[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x35EA0000-0x00000000*/ private bool bIsPartySession[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0xC1
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0xC0
        if(!PC.IsLocalPlayerController() && PC.IsPrimaryPlayer())
        {
            PC.ClientTravelToSession(SessionName, SearchClass, PlatformSpecificInfo, bIsPartySession);
        }        
    }    
    //return;    
}

exec function DoTravelTheWorld()
{
    // End:0x3C
    if(MyAutoTestManager != none)
    {
        GotoState('TravelTheWorld');
        MyAutoTestManager.DoTravelTheWorld();
    }
    //return;    
}

// Export UGameInfo::execSetBandwidthLimit(FFrame&, void* const)
native exec function SetBandwidthLimit()
{
    local /*0x35EA0000-0x00000000*/ private float AsyncIOBandwidthLimit[8388609];


}

function IsAutomatedPerfTesting()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (MyAutoTestManager != none) && MyAutoTestManager.bAutomatedPerfTesting;
    //return ReturnValue;    
}

function IsCheckingForFragmentation()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (MyAutoTestManager != none) && MyAutoTestManager.bCheckingForFragmentation;
    //return ReturnValue;    
}

function IsCheckingForMemLeaks()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (MyAutoTestManager != none) && MyAutoTestManager.bCheckingForMemLeaks;
    //return ReturnValue;    
}

function IsDoingASentinelRun()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (MyAutoTestManager != none) && MyAutoTestManager.bDoingASentinelRun;
    //return ReturnValue;    
}

function ShouldAutoContinueToNextRound()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (MyAutoTestManager != none) && MyAutoTestManager.bAutoContinueToNextRound;
    //return ReturnValue;    
}

function CheckForSentinelRun()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (MyAutoTestManager != none) && MyAutoTestManager.CheckForSentinelRun();
    //return ReturnValue;    
}

simulated exec function BeginBVT()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TagDesc[143654913];

    // End:0x34
    if(MyAutoTestManager == none)
    {
        MyAutoTestManager = Spawn(AutoTestManagerClass);
    }
    MyAutoTestManager.BeginSentinelRun("BVT", "", TagDesc);
    MyAutoTestManager.SetTimer(3.0000000, true, 'DoTimeBasedSentinelStatGathering');
    //return;    
}

// Export UGameInfo::execEnableStandbyCheatDetection(FFrame&, void* const)
native function EnableStandbyCheatDetection()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsEnabled[8388609];


}

event StandbyCheatDetected()
{
    local /*0x35EA0000-0x00000000*/ private byte StandbyType[8388609];

    //return;    
}

function OnDestroyOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x19
    if(!ProcessServerLogin())
    {
        RegisterServer();
    }
    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyOnlineGameComplete);
    //return;    
}

event OnEngineHasLoaded()
{
    //return;    
}

function InitCrowdPopulationManager()
{
    // End:0x33
    if(PopulationManagerClass != none)
    {
        PopulationManager = Spawn(PopulationManagerClass);
    }
    //return;    
}

function ClearOnlineDelegates()
{
    //return;    
}

auto state PendingMatch
{
    function MatchIsInProgress()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StartMatch()
    {
        local /*0x35EA0000-0x00000000*/ private bool bFireLevelStartup[9437185], bFireLevelBegin;

        true
        true
        // End:0x24
        if(bUsingArbitration)
        {
            StartArbitrationRegistration();            
        }
        else
        {
            global.StartMatch();
        }
        //return;        
    }

    function StartArbitrationRegistration()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL PC, HostId, GameSettings;

        // End:0x18E
        if(!bHasArbitratedHandshakeBegun)
        {
            bHasArbitratedHandshakeBegun = true;
            GameSettings = GameInterface.GetGameSettings(PlayerReplicationInfoClass.default.SessionName);
            HostId = GameSettings.OwningPlayerId;
            PendingArbitrationPCs.Length = 0;
            // End:0x176
            foreach WorldInfo.AllControllers(Class'PlayerController', PC)
            {
                // End:0x157
                if(!PC.IsLocalPlayerController())
                {
                    PC.ClientSetHostUniqueId(HostId);
                    PC.ClientRegisterForArbitration();
                    PendingArbitrationPCs[PendingArbitrationPCs.Length] = PC;
                    // End:0x175
                    continue;
                }
                ArbitrationPCs[ArbitrationPCs.Length] = PC;                
            }            
            SetTimer(ArbitrationHandshakeTimeout, false, 'ArbitrationTimeout');
        }
        //return;        
    }

    function RegisterServerForArbitration()
    {
        // End:0x92
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            GameInterface.AddArbitrationRegistrationCompleteDelegate(ArbitrationRegistrationComplete);
            GameInterface.RegisterForArbitration(PlayerReplicationInfoClass.default.SessionName);            
        }
        else
        {
            ArbitrationRegistrationComplete(PlayerReplicationInfoClass.default.SessionName, true);
        }
        //return;        
    }

    function ArbitrationRegistrationComplete()
    {
        local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
        local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

        GameInterface.ClearArbitrationRegistrationCompleteDelegate(ArbitrationRegistrationComplete);
        // End:0x4B
        if(bWasSuccessful)
        {
            StartArbitratedMatch();            
        }
        else
        {            
            ConsoleCommand("Disconnect");
        }
        //return;        
    }

    function ArbitrationTimeout()
    {
        local /*0x35EA0000-0x00000000*/ private int Index;

        Index = 0;
        J0x0B:

        // End:0x81 [Loop If]
        if(Index < PendingArbitrationPCs.Length)
        {
            AccessControl.KickPlayer(PendingArbitrationPCs[Index], GameMessageClass.default.MaxedOutMessage);
            Index++;
            // [Loop Continue]
            goto J0x0B;
        }
        PendingArbitrationPCs.Length = 0;
        RegisterServerForArbitration();
        //return;        
    }

    function StartArbitratedMatch()
    {
        bNeedsEndGameHandshake = true;
        global.StartMatch();
        //return;        
    }

    function ProcessClientRegistrationCompletion()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
        local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
        local /*0x35EA0000-0x00000000*/ private int FoundIndex;

        FoundIndex = PendingArbitrationPCs.Find(PC);        
        // End:0xBC
        if(FoundIndex != -1)
        {
            PendingArbitrationPCs.Remove(FoundIndex, 1);            
            // End:0x76
            if(bWasSuccessful)
            {
                ArbitrationPCs[ArbitrationPCs.Length] = PC;                
            }
            else
            {
                AccessControl.KickPlayer(PC, GameMessageClass.default.MaxedOutMessage);
            }
        }
        // End:0xE9
        if(PendingArbitrationPCs.Length == 0)
        {
            SetTimer(0.0000000, false, 'ArbitrationTimeout');
            RegisterServerForArbitration();
        }
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        SetTimer(0.0000000, false, 'ArbitrationTimeout');
        // End:0x64
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            GameInterface.ClearArbitrationRegistrationCompleteDelegate(ArbitrationRegistrationComplete);
        }
        //return;        
    }
    stop;    
}

state TravelTheWorld
{    stop;    
}

defaultproperties
{
    bRestartLevel=true
    bPauseable=true
    bDelayedStart=true
    bChangeLevels=true
    bKickLiveIdlers=true
    bUsePackageNetInfo=true
    GameDifficulty=1.0000000
    GameSpeed=1.0000000
    HUDType=Class'HUD'
    MaxSpectatorsAllowed=32
    MaxPlayers=10
    MaxPlayersAllowed=32
    CurrentID=1
    DefaultPlayerName="Player"
    GameName="Game"
    FearCostFallOff=0.9500000
    DeathMessageClass=Class'LocalMessage'
    GameMessageClass=Class'GameMessage'
    AccessControlClass=Class'AccessControl'
    BroadcastHandlerClass=Class'BroadcastHandler'
    AutoTestManagerClass=Class'AutoTestManager'
    PlayerControllerClass=Class'PlayerController'
    PlayerReplicationInfoClass=Class'PlayerReplicationInfo'
    GameReplicationInfoClass=Class'GameReplicationInfo'
    MaxIdleTime=120.0000000
    TimeMarginSlack=1.3500000
    MinTimeMargin=-1.0000000
    LeaderboardId=-131072
    ArbitratedLeaderboardId=-65536
    TotalNetBandwidth=32000
    MinDynamicBandwidth=4000
    MaxDynamicBandwidth=6000
    BusyIndicators[1]=(Material=Material'EngineResources.M_StreamingPause',Corner=EBusyIndicatorCorner.BIC_BottomRight,Size=0.1000000,EdgeOffsetX=0.1500000,EdgeOffsetY=0.1500000,bShowDuringFullScreenMovies=false)
    BusyIndicators[2]=(Material=Material'EngineResources.M_StreamingPause',Corner=EBusyIndicatorCorner.BIC_BottomRight,Size=0.1000000,EdgeOffsetX=0.1500000,EdgeOffsetY=0.1500000,bShowDuringFullScreenMovies=true)
    GameInfoClassAliases=/* Array type was not detected. */
    DefaultGameType="LostPlanetGame.LPGame_Generic"
    Components=none
}