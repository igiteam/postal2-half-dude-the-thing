class LPPreGameLobbyGRI extends LPMenuGameGRI
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

const PROPERTY_FRIENDLYFIRE = 0x1000000A;
const PROPERTY_MAPNAME = 0x1000000B;
const PROPERTY_MATCHDIFFICULTY = 0x1000000C;
const PROPERTY_ROUNDSTOWIN = 0x1000000D;
const PROPERTY_SCORELIMIT = 0x1000000E;
const PROPERTY_TIMELIMIT = 0x1000000F;
const PROPERTY_MATCHSTATE = 0x10000010;
const PROPERTY_SCORELEFT = 0x10000011;
const PROPERTY_TIMELEFT = 0x10000012;
const PROPERTY_GAMETYPE = 0x10000013;
const PROPERTY_INVITEMODE = 0x10000014;
const PROPERTY_SESSIONTYPE = 0x10000015;
const PROPERTY_AVAIL_TEAM_SIZE = 0x10000016;
const PROPERTY_AVGPLAYERSKILL = 0x10000017;
const PROPERTY_REQUIRED_DLC = 0x1000003E;
const PROPERTY_INSTALLED_DLC = 0x1000003F;
const PROPERTY_TENGRUSHWINS = 0x20000002;
const PROPERTY_TENGCOLLECTED = 0x20000003;
const PROPERTY_TDMWINS = 0x20000004;
const PROPERTY_SCENARIO_WINS = 0x20000005;
const PROPERTY_CREDITS = 0x20000006;
const PROPERTY_PLAYTIME = 0x20000007;
const PROPERTY_REVIVALS = 0x20000008;
const PROPERTY_KILLS = 0x20000009;
const PROPERTY_SURVIVALWINS = 0x2000003D;
const SESSION_MATCH_QUERY_ALL = 0;
const SESSION_MATCH_QUERY_EXTRACTION = 2;
const SESSION_MATCH_QUERY_SCENARIO = 3;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH = 4;
const SESSION_MATCH_QUERY_PARTY = 5;
const SESSION_MATCH_QUERY_SURVIVAL = 6;
const SESSION_MATCH_QUERY_ALL_DLCEXACT = 7;
const SESSION_MATCH_QUERY_ALL_DLCANY = 8;
const SESSION_MATCH_QUERY_EXTRACTION_DLCEXACT = 10;
const SESSION_MATCH_QUERY_EXTRACTION_DLCANY = 11;
const SESSION_MATCH_QUERY_SCENARIO_DLCEXACT = 12;
const SESSION_MATCH_QUERY_SCENARIO_DLCANY = 13;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCEXACT = 14;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCANY = 15;
const SESSION_MATCH_QUERY_PARTY_DLCEXACT = 16;
const SESSION_MATCH_QUERY_PARTY_DLCANY = 17;
const SESSION_MATCH_QUERY_SURVIVAL_DLCEXACT = 20;
const SESSION_MATCH_QUERY_SURVIVAL_DLCANY = 21;
const SESSION_MATCH_QUERY_ALL_DLCMINREQUIRED = 22;
const SESSION_MATCH_QUERY_EXTRACTION_DLCMINREQUIRED = 23;
const SESSION_MATCH_QUERY_SCENARIO_DLCMINREQUIRED = 24;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCMINREQUIRED = 25;
const SESSION_MATCH_QUERY_PARTY_DLCMINREQUIRED = 26;
const SESSION_MATCH_QUERY_SURVIVAL_DLCMINREQUIRED = 27;
const CONTEXT_GAME_MODE = 0x0000800B;
const CONTEXT_PRESENCE_IDLE = 0;
const CONTEXT_PRESENCE_DEFAULT = 1;
const CONTEXT_PRESENCE_INMENU = 2;
const CONTEXT_PRESENCE_INLOBBY = 3;
const CONTEXT_PRESENCE_INGAME = 4;
const CONTEXT_PRESENCE_INCAMPAIGN = 5;

enum ELobbyMode
{
    ELM_None,                       // 0
    ELM_CustomMatch,                // 1
    ELM_QuickMatch,                 // 2
    ELM_MAX                         // 3
};

enum EPGLState
{
    ePGLSTATE_None,                 // 0
    ePGLSTATE_Initialize,           // 1
    ePGLSTATE_Waiting,              // 2
    ePGLSTATE_GameSelection,        // 3
    ePGLSTATE_StartingMatch,        // 4
    ePGLSTATE_Traveling,            // 5
    ePGLSTATE_MAX                   // 6
};

struct PlayerMapVote
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MapIdx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MapName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PRI;

    structdefaultproperties
    {
        MapIdx=0
        MapName=""
        PRI=none
    }
};

struct MPMapInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Name;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UILabel;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RequiredDLCs;

    structdefaultproperties
    {
        Name=""
        UILabel=""
        RequiredDLCs=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPTypes.EOnlineModes OnlineMode[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPreGameLobbyGRI.ELobbyMode LobbyMode[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPPreGameLobbyGRI.EPGLState CurrentState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPreGameLobbyGRI.EPGLState PreviousState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel SPTypes.ESPDifficultyLevel MatchGameDifficultySetting[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPTypes.EMPGameType GameTypeSetting[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int RemCountdownSeconds[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownStartSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownStartSoundSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownStillWaitingSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownWaitingSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private PlayerReplicationInfo HostPRI[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGameSettingsInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bAllowFriendlyFireSetting[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowVoteRecast;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bMapVoteEnabled[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapNamesInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapImagesInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapVotesInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSuspendMapSelection[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHostPressedStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int AtmosphereState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int RoundsToWinSetting[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ScoreLimitSetting[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int TimeLimitSetting[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownVoteSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel MPMapInfo MapNames[2097177];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel string MapImages[2097177];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int MapVotes[2097177];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxVotingRounds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumMaps[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumVotingMaps;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int NumVotingRounds[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayerMapVotes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel string SelectedMapName[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel string WinningMapName[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnCountdownTick;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnGameSettingsChanged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnLobbyStateChanged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnMapVoteStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnMapVoteStopped;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnMapVoteSubmitted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnWinningMapChanged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnLocalPlayerTeamChanged;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnCountdownTick__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnGameSettingsChanged__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnLobbyStateChanged__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnMapVoteStarted__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnMapVoteStopped__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnMapVoteSubmitted__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnWinningMapChanged__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __dOnLocalPlayerTeamChanged__Delegate;

delegate dOnCountdownTick()
{
    //return;    
}

delegate dOnGameSettingsChanged()
{
    //return;    
}

delegate dOnLobbyStateChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewLobbyState[8388609], PrevLobbyState;

    //return;    
}

delegate dOnMapVoteStarted()
{
    //return;    
}

delegate dOnMapVoteStopped()
{
    //return;    
}

delegate dOnMapVoteSubmitted()
{
    //return;    
}

delegate dOnWinningMapChanged()
{
    //return;    
}

delegate dOnLocalPlayerTeamChanged()
{
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    super(GameReplicationInfo).PostBeginPlay();
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    WorldInfo.ToggleHostMigration(MPMgr.bAllowHostMigration);
    //return;    
}

function SetMatchGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    MatchGameDifficultySetting = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

function SetAllowFriendlyFire()
{
    local /*0x97E50000-0x00000000*/ private bool Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    bAllowFriendlyFireSetting = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

function SetAtmosphereState()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    AtmosphereState = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

function SetGameTypeSetting()
{
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    GameTypeSetting = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

function SetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    RoundsToWinSetting = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

function SetScoreLimit()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    ScoreLimitSetting = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

function SetTimeLimit()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    TimeLimitSetting = Value;
    ExecOnGameSettingsChanged();
    //return;    
}

simulated function GetMapIdx()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Idx;

    Idx = 0;
    J0x0B:

    // End:0x6E [Loop If]
    if(Idx < NumMaps)
    {
        // End:0x60
        if(MapNames[Idx].Name ~= MapName)
        {
            return Idx;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function BuildMapList()
{
    local /*0x97E50000-0x00000000*/ private bool bResetSelection[9437185], bInDevMode;
    local /*0x97E50000-0x00000000*/ private int RandNum, I;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TmpStr;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TmpMPMapInfo;

    true
    bInDevMode = LPPreGameLobby(Class'Engine.WorldInfo'.static.GetWorldInfo().Game).bInDevMode;
    // End:0x84
    if(int(LobbyMode) == int(2))
    {
        bResetSelection = true;
    }
    I = 0;
    J0x8F:

    // End:0x152 [Loop If]
    if(I < 25)
    {
        MapNames[I].Name = "";
        MapNames[I].UILabel = "";
        MapNames[I].RequiredDLCs = 0;
        MapVotes[I] = 0;
        MapImages[I] = "";
        I++;
        // [Loop Continue]
        goto J0x8F;
    }
    NumMaps = 0;
    // End:0x198
    if(bResetSelection)
    {
        PlayerMapVotes.Remove(0, PlayerMapVotes.Length);        
        SelectedMapName = "";
        WinningMapName = "";
    }
    I = 0;
    J0x1A3:

    // End:0x3DA [Loop If]
    if(I < Class'LPMPMapList'.default.HostMapList.Length)
    {
        // End:0x223
        if(!bInDevMode && Class'LPMPMapList'.default.HostMapList[I].bIsDevMap)
        {            
        }
        else
        {
            MapNames[NumMaps].Name = Class'LPMPMapList'.default.HostMapList[I].MapName;
            MapNames[NumMaps].UILabel = Class'LPMPMapList'.default.HostMapList[I].Label;
            MapNames[NumMaps].RequiredDLCs = LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetRequiredDLCIdForMapName(MapNames[NumMaps].Name);
            MapImages[NumMaps] = Class'LPMPMapList'.default.HostMapList[I].Image;
            NumMaps++;
        }
        I++;
        // [Loop Continue]
        goto J0x1A3;
    }
    // End:0x513
    if(int(LobbyMode) == int(2))
    {
        I = 0;
        J0x3F9:

        // End:0x4F5 [Loop If]
        if(I < NumMaps)
        {
            RandNum = Rand(NumMaps);
            TmpMPMapInfo = MapNames[I];
            MapNames[I] = MapNames[RandNum];
            MapNames[RandNum] = TmpMPMapInfo;
            TmpStr = MapImages[I];
            MapImages[I] = MapImages[RandNum];
            MapImages[RandNum] = TmpStr;
            I++;
            // [Loop Continue]
            goto J0x3F9;
        }
        NumMaps = Min(NumMaps, NumVotingMaps);
    }
    bMapNamesInitialized = true;
    bMapImagesInitialized = true;
    bMapVotesInitialized = true;
    //return;    
}

function BeginMapVoting()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrPRI;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    BuildMapList();
    I = 0;
    J0x2C:

    // End:0xF4 [Loop If]
    if(I < PRIArray.Length)
    {
        CurrPRI = LPPreGameLobbyPRI(PRIArray[I]);
        // End:0xE6
        if(((CurrPRI != none) && !CurrPRI.bIsInactive) && !CurrPRI.bBot)
        {
            CurrPRI.bSubmittedMapVote = false;
        }
        I++;
        // [Loop Continue]
        goto J0x2C;
    }
    NumVotingRounds++;
    bMapVoteEnabled = true;
    ExecOnMapVoteStarted();
    StartCountdown(CountdownVoteSeconds);
    //return;    
}

function StopMapVoting()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MapCandidates;
    local /*0x97E50000-0x00000000*/ private int RandMapIdx, I;

    CalculateWinningMap();
    bMapVoteEnabled = false;
    // End:0x276
    if(Len(WinningMapName) == 0)
    {
        // End:0x4D
        if(NumVotingRounds < MaxVotingRounds)
        {
            BeginMapVoting();
            return;            
        }
        else
        {
            I = 0;
            J0x58:

            // End:0x118 [Loop If]
            if(I < NumMaps)
            {
                // End:0x10A
                if(MapVotes[I] > 0)
                {
                    // End:0x10A
                    if(LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AllPlayersHaveRequiredDLC(MapNames[I].RequiredDLCs))
                    {
                        MapCandidates.AddItem(I);                                                
                    }
                }
                I++;
                // [Loop Continue]
                goto J0x58;
            }
            // End:0x14B
            if(MapCandidates.Length > 0)
            {
                RandMapIdx = MapCandidates[Rand(MapCandidates.Length)];                
            }
            else
            {
                I = 0;
                J0x156:

                // End:0x1FD [Loop If]
                if(I < NumMaps)
                {
                    // End:0x1EF
                    if(LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AllPlayersHaveRequiredDLC(MapNames[I].RequiredDLCs))
                    {
                        MapCandidates.AddItem(I);                                                
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x156;
                }
                // End:0x230
                if(MapCandidates.Length > 0)
                {
                    RandMapIdx = MapCandidates[Rand(MapCandidates.Length)];                    
                }
                else
                {
                    BeginMapVoting();
                    return;
                }
            }
            SelectedMapName = MapNames[RandMapIdx].Name;
            CalculateWinningMap();
        }
    }
    UpdateOnlineGame();
    SetLobbyState(4);
    ExecOnMapVoteStopped();
    //return;    
}

function CalculateWinningMap()
{
    local /*0x97E50000-0x00000000*/ private int RunnerUpIdx, WinnerIndex, I;

    // End:0x18F
    if(bMapVoteEnabled)
    {
        RunnerUpIdx = -1;
        WinnerIndex = 0;
        I = 1;
        J0x32:

        // End:0x114 [Loop If]
        if(I < NumMaps)
        {
            // End:0x106
            if(LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AllPlayersHaveRequiredDLC(MapNames[I].RequiredDLCs))
            {
                // End:0x103
                if(MapVotes[I] >= MapVotes[WinnerIndex])
                {
                    RunnerUpIdx = WinnerIndex;
                    WinnerIndex = I;
                }                
            }
            I++;
            // [Loop Continue]
            goto J0x32;
        }
        // End:0x15F
        if((RunnerUpIdx >= 0) && MapVotes[RunnerUpIdx] == MapVotes[WinnerIndex])
        {
            SelectedMapName = "";            
        }
        else
        {
            SelectedMapName = MapNames[WinnerIndex].Name;
        }
    }
    // End:0x1C3
    if(SelectedMapName != WinningMapName)
    {
        WinningMapName = SelectedMapName;
        ExecOnWinningMapChanged();
    }
    //return;    
}

function CheckForMapVoteStop()
{
    local /*0x97E50000-0x00000000*/ private int PRIIdx, PRICount;
    local /*0x97E50000-0x00000000*/ private @NULL CurrPRI;
    local /*0x97E50000-0x00000000*/ private int TotalVotes, I;

    PRIIdx = 0;
    J0x0B:

    // End:0xB4 [Loop If]
    if(PRIIdx < PRIArray.Length)
    {
        CurrPRI = PRIArray[PRIIdx];
        // End:0xA6
        if(((CurrPRI != none) && !CurrPRI.bIsInactive) && !CurrPRI.bBot)
        {
            PRICount++;
        }
        PRIIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0xBF:

    // End:0x102 [Loop If]
    if(I < NumMaps)
    {
        TotalVotes += MapVotes[I];
        I++;
        // [Loop Continue]
        goto J0xBF;
    }
    // End:0x126
    if((PRICount - TotalVotes) <= 0)
    {
        StopMapVoting();
    }
    //return;    
}

function HasPlayerVoted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerMapVotes.Find('PRI', PRI) >= ;    
    //return ReturnValue;    
}

function SubmitMapVote()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int MapIdx;
    local /*0x97E50000-0x00000000*/ private @NULL PGPRI;
    local /*0x97E50000-0x00000000*/ private int VoteIdx;

    PGPRI = LPPreGameLobbyPRI(PRI);
    // End:0x43
    if((PGPRI == none) && int(CurrentState) != int(3))
    {
        return false;
    }
    // End:0x6C
    if(!bAllowVoteRecast && HasPlayerVoted(PRI))
    {
        return false;
    }
    MapIdx = GetMapIdx(MapName);
    // End:0xB3
    if((MapIdx < 0) || MapIdx >= NumMaps)
    {
        return false;
    }
    VoteIdx = PlayerMapVotes.Find('PRI', PRI);    
    // End:0x101
    if(VoteIdx < 0)
    {
        VoteIdx = PlayerMapVotes.Add(1);        
    }
    PlayerMapVotes[VoteIdx].MapIdx = MapIdx;
    PlayerMapVotes[VoteIdx].MapName = MapName;
    PlayerMapVotes[VoteIdx].PRI = PRI;
    UpdateVoteTally();
    ExecOnMapVoteSubmitted();
    // End:0x1E3
    if(((int(Role) == int(ROLE_Authority)) && bMapVoteEnabled) && !bAllowVoteRecast)
    {
        CheckForMapVoteStop();
    }
    CalculateWinningMap();
    return true;
    //return ReturnValue;    
}

function RemoveMapVote()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int VoteIdx;

    // End:0x2C
    if((int(CurrentState) != int(3)) || int(Role) != int(ROLE_Authority))
    {
        return false;
    }
    VoteIdx = PlayerMapVotes.Find('PRI', PRI);    
    // End:0x66
    if(VoteIdx < 0)
    {
        return true;
    }
    PlayerMapVotes.Remove(VoteIdx, 1);    
    UpdateVoteTally();
    ExecOnMapVoteSubmitted();
    // End:0xCD
    if(((int(Role) == int(ROLE_Authority)) && bMapVoteEnabled) && !bAllowVoteRecast)
    {
        CheckForMapVoteStop();
    }
    CalculateWinningMap();
    return true;
    //return ReturnValue;    
}

function UpdateVoteTally()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x45 [Loop If]
    if(I < NumMaps)
    {
        MapVotes[I] = 0;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0x50:

    // End:0xA8 [Loop If]
    if(I < PlayerMapVotes.Length)
    {
        MapVotes[PlayerMapVotes[I].MapIdx]++;
        I++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}

function GetGameInterface()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSubx, GameInterface;

    OnlineSubx = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x60
    if(OnlineSubx != none)
    {
        GameInterface = OnlineSubx.GameInterface;
    }
    return GameInterface;
    //return ReturnValue;    
}

function GetDataStoreGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreManager, DataStoreGameSettings;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x3A
    if(DataStoreManager == none)
    {
        return none;
    }
    DataStoreGameSettings = LPUIDataStore_OnlineGameSettings(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_OnlineGameSettings'.default.Tag));
    return DataStoreGameSettings;
    //return ReturnValue;    
}

simulated function GetMapInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xC4 [Loop If]
    if(I < Class'LPMPMapList'.default.HostMapList.Length)
    {
        // End:0xB6
        if(MapName ~= Class'LPMPMapList'.default.HostMapList[I].MapName)
        {
            Result = Class'LPMPMapList'.default.HostMapList[I];
            // [Explicit Break]
            goto J0xC4;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xC4:

    return Result;
    //return ReturnValue;    
}

function IsOkayToStart()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Game;

    // End:0x16
    if(int(LobbyMode) == int(1))
    {
        return true;
    }
    Game = SPGameInfo(WorldInfo.Game);
    // End:0x8A
    if(Game.NumPlayers >= Game.MaxPlayers)
    {
        return true;
    }
    // End:0xC7
    if(int(CurrentState) > int(2))
    {
        // End:0xC4
        if(Game.NumPlayers > 1)
        {
            return true;
        }        
    }
    else
    {
        // End:0xD6
        if(bHostPressedStart)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function PlayersLackRequiredDLC()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseStrictCheck[9437185], ReturnValue;

    return false;
    //return ReturnValue;    
}

function SetLobbyState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Game;

    // End:0x1D
    if(int(NewState) == int(CurrentState))
    {
        return;
    }
    Game = LPPreGameLobby(WorldInfo.Game);
    PreviousState = CurrentState;
    CurrentState = NewState;
    ExecOnLobbyStateChanged(NewState, PreviousState);
    switch(CurrentState)
    {
        // End:0xF2
        case 2:
            // End:0xDC
            if(int(LobbyMode) != int(1))
            {
                Game.RebalanceTeams();
            }
            StartCountdown(CountdownWaitingSeconds);
            // End:0x20C
            break;
        // End:0x177
        case 3:
            StopCountdown();
            // End:0x148
            if((int(LobbyMode) == int(2)) && !Class'LPGameViewportClient'.static.IsTGSDemo())
            {
                BeginMapVoting();                
            }
            else
            {
                BuildMapList(int(PreviousState) < int(NewState));
            }
            UpdateOnlineGame();
            // End:0x20C
            break;
        // End:0x1EC
        case 4:
            // End:0x1B0
            if(int(LobbyMode) != int(1))
            {
                Game.RebalanceTeams();
            }
            // End:0x1DD
            if(IsOkayToStart())
            {
                StartCountdown(CountdownStartSeconds);
                UpdateOnlineGame();                
            }
            else
            {
                SetLobbyState(2);
            }
            // End:0x20C
            break;
        // End:0x209
        case 5:
            UpdateOnlineGame();
            StartCountdown(1);
            // End:0x20C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SubmitHostFinishedMapSelection()
{
    // End:0x54
    if(int(CurrentState) == int(3))
    {
        // End:0x54
        if(((int(Role) == int(ROLE_Authority)) && !bMapVoteEnabled) && !bSuspendMapSelection)
        {
            CalculateWinningMap();
        }
    }
    //return;    
}

function SubmitMapSelectionByName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(MapName ~= SelectedMapName)
    {
        return false;
    }
    SelectedMapName = MapName;
    bSuspendMapSelection = PlayersLackRequiredDLC(SelectedMapName, true);
    return true;
    //return ReturnValue;    
}

simulated function RemovePRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];

    super(SPGRI).RemovePRI(PRI);
    RemoveMapVote(PRI);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    switch(VarName)
    {
        // End:0x2C
        case 'MatchGameDifficultySetting':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0x45
        case 'bAllowFriendlyFireSetting':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0x5E
        case 'AtmosphereState':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0x89
        case 'CurrentState':
            ClientExecOnLobbyStateChanged(CurrentState, PreviousState);
            // End:0x322
            break;
        // End:0xA2
        case 'GameTypeSetting':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0xCA
        case 'bMapVoteEnabled':
            // End:0xC7
            if(!bMapVoteEnabled)
            {
                ClientExecOnMapVoteStopped();
            }
            // End:0x322
            break;
        // End:0xE3
        case 'NumVotingRounds':
            ClientExecOnMapVoteStarted();
            // End:0x322
            break;
        // End:0x16A
        case 'MapVotes':
            bMapVotesInitialized = true;
            I = 0;
            J0x106:

            // End:0x14D [Loop If]
            if(I < 25)
            {
                // End:0x13F
                if(MapVotes[I] == -1)
                {
                    bMapVotesInitialized = false;
                }
                ++I;
                // [Loop Continue]
                goto J0x106;
            }
            // End:0x167
            if(bMapVotesInitialized)
            {
                ClientExecOnMapVoteSubmitted();                
            }
            // End:0x322
            break;
        // End:0x183
        case 'RemCountdownSeconds':
            ClientExecOnCountdownTick();
            // End:0x322
            break;
        // End:0x19C
        case 'RoundsToWinSetting':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0x1B5
        case 'ScoreLimitSetting':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0x1CE
        case 'SelectedMapName':
            ClientExecOnWinningMapChanged();
            // End:0x322
            break;
        // End:0x1E7
        case 'TimeLimitSetting':
            ClientExecOnGameSettingsChanged();
            // End:0x322
            break;
        // End:0x200
        case 'WinningMapName':
            ClientExecOnWinningMapChanged();
            // End:0x322
            break;
        // End:0x28E
        case 'MapNames':
            bMapNamesInitialized = true;
            I = 0;
            J0x223:

            // End:0x28B [Loop If]
            if(I < 25)
            {
                // End:0x27D
                if(MapNames[I].Name ~= "NotYetReplicated!")
                {
                    bMapNamesInitialized = false;
                }
                ++I;
                // [Loop Continue]
                goto J0x223;
            }
            // End:0x322
            break;
        // End:0x309
        case 'MapImages':
            bMapImagesInitialized = true;
            I = 0;
            J0x2B1:

            // End:0x306 [Loop If]
            if(I < 25)
            {
                // End:0x2F8
                if(MapImages[I] ~= "NotYetReplicated!")
                {
                    bMapImagesInitialized = false;
                }
                ++I;
                // [Loop Continue]
                goto J0x2B1;
            }
            // End:0x322
            break;
        // End:0xFFFF
        default:
            super(LPGRI).ReplicatedEvent(VarName);
            // End:0x322
            break;
            break;
    }
    //return;    
}

function StartCountdown()
{
    local /*0x97E50000-0x00000000*/ private int Time[8388609];

    RemCountdownSeconds = Time;
    SetTimer(1.0000000, true, 'UpdateCountdown');
    ExecOnCountdownTick();
    //return;    
}

function StopCountdown()
{
    ClearTimer('UpdateCountdown');
    //return;    
}

function UpdateCountdown()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOkayToStart, bOrigBalancedTeamAssignment;
    local /*0x97E50000-0x00000000*/ private @NULL Game, MPMgr;

    Game = LPPreGameLobby(WorldInfo.Game);
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    RemCountdownSeconds = Max(0, RemCountdownSeconds - 1);
    // End:0x492
    if(RemCountdownSeconds <= 0)
    {
        ClearTimer('UpdateCountdown');
        switch(CurrentState)
        {
            // End:0x2E1
            case 2:
                // End:0x2AF
                if(MPMgr.HostReservationBeacon != none)
                {
                    bOrigBalancedTeamAssignment = MPMgr.HostReservationBeacon.bBalancedTeamAssignment;
                    MPMgr.HostReservationBeacon.bBalancedTeamAssignment = true;
                    MPMgr.HostReservationBeacon.BalancedTeamAssignmentJiggle();
                    Game.ReconcileBeaconTeamAssignments();
                    bIsOkayToStart = IsOkayToStart();
                    MPMgr.HostReservationBeacon.bBalancedTeamAssignment = bOrigBalancedTeamAssignment;
                    // End:0x25C
                    if(MPMgr.HostReservationBeacon.bBalancedTeamAssignment)
                    {
                        MPMgr.HostReservationBeacon.BalancedTeamAssignmentJiggle();                        
                    }
                    else
                    {
                        MPMgr.HostReservationBeacon.BestFitTeamAssignmentJiggle();
                    }
                    Game.ReconcileBeaconTeamAssignments();
                }
                // End:0x2CB
                if(bIsOkayToStart)
                {
                    SetLobbyState(3);                    
                }
                else
                {
                    StartCountdown(CountdownStillWaitingSeconds);
                }
                // End:0x492
                break;
            // End:0x307
            case 3:
                // End:0x304
                if(int(LobbyMode) == int(2))
                {
                    StopMapVoting();
                }
                // End:0x492
                break;
            // End:0x44A
            case 4:
                // End:0x35C
                if(MPMgr.CheckPlayersDLC(MPMgr.GetGameSettings()))
                {
                    SetLobbyState(5);                    
                }
                else
                {
                    Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Msg>", "<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
                    SetLobbyState(3);
                }
                // End:0x492
                break;
            // End:0x48F
            case 5:
                LPPreGameLobby(WorldInfo.Game).BeginMatch();
                // End:0x492
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        ExecOnCountdownTick();
        //return;        
    }
}

function UpdateOnlineGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameInterface, MPManager, DataStore, NewGameSettings, CurGameSettings, Map;

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    // End:0x27
    if(!bGameSettingsInit)
    {
        return;
    }
    GameInterface = GetGameInterface();
    DataStore = GetDataStoreGameSettings();
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    CurGameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(MPManager.SessionNameGame));
    HostPRI = LPPreGameLobbyPRI(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor.PlayerReplicationInfo);
    Map = GetMapInfo(WinningMapName);
    switch(GameTypeSetting)
    {
        // End:0x1C4
        case 1:
            ((int(OnlineMode) == int(2)) ? DataStore.SetCurrentByName('ExtractionLAN') : DataStore.SetCurrentByName('Extraction'));
            // End:0x37A
            break;
        // End:0x232
        case 2:
            ((int(OnlineMode) == int(2)) ? DataStore.SetCurrentByName('ScenarioLAN') : DataStore.SetCurrentByName('Scenario'));
            // End:0x37A
            break;
        // End:0x2A0
        case 3:
            ((int(OnlineMode) == int(2)) ? DataStore.SetCurrentByName('TeamDeathmatchLAN') : DataStore.SetCurrentByName('TeamDeathMatch'));
            // End:0x37A
            break;
        // End:0x30E
        case 4:
            ((int(OnlineMode) == int(2)) ? DataStore.SetCurrentByName('SurvivalLAN') : DataStore.SetCurrentByName('Survival'));
            // End:0x37A
            break;
        // End:0xFFFF
        default:
            ((int(OnlineMode) == int(2)) ? DataStore.SetCurrentByName('DefaultLAN') : DataStore.SetCurrentByName('Default'));
            // End:0x37A
            break;
            break;
    }
    NewGameSettings = LPOnlineGameSettings(DataStore.GetCurrentGameSettings());
    NewGameSettings.SetupDefaultParametersBasedOnMapName(name(WinningMapName));
    // End:0x589
    if(int(LobbyMode) == int(1))
    {
        NewGameSettings.SetAllowFriendlyFire(bAllowFriendlyFireSetting);
        NewGameSettings.SetGameType(int(GameTypeSetting));
        NewGameSettings.SetMapName(name(WinningMapName));
        NewGameSettings.SetMatchGameDifficulty(MatchGameDifficultySetting);
        NewGameSettings.SetRoundsToWin(RoundsToWinSetting);
        NewGameSettings.SetScoreLimit(ScoreLimitSetting);
        // End:0x51D
        if(int(GameTypeSetting) != int(2))
        {
            NewGameSettings.SetTimeLimit(TimeLimitSetting);
        }
        // End:0x589
        if(int(OnlineMode) == int(2))
        {
            NewGameSettings.SetAtmosphereState(Map.AtmosphereStates[AtmosphereState].StateName);
        }
    }
    // End:0x5C1
    if(int(CurrentState) > int(4))
    {
        NewGameSettings.SetMatchState(3);        
    }
    else
    {
        NewGameSettings.SetMatchState(0);
    }
    // End:0x621
    if(CurGameSettings != NewGameSettings)
    {
        NewGameSettings.CopyGameSettingsToBase(CurGameSettings);
    }
    MPManager.UpdateGameSettings(CurGameSettings);
    MPManager.UpdatePlayerCounts(MPManager.SessionNameGame);
    MPManager.SetPlayerOnlineStatus(MPManager.OwningControllerIndex, 3);
    //return;    
}

simulated function NotifyLocalPlayerTeamReceived()
{
    super(Actor).NotifyLocalPlayerTeamReceived();
    ClientExecOnLocalPlayerTeamChanged();
    //return;    
}

function ExecOnCountdownTick()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnCountdownTick(Del)
    {
        dOnCountdownTick();        
    }    
    //return;    
}

reliable client simulated function ClientExecOnCountdownTick()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnCountdownTick(Del)
    {
        dOnCountdownTick();        
    }    
    //return;    
}

function ExecOnGameSettingsChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnGameSettingsChanged(Del)
    {
        dOnGameSettingsChanged();        
    }    
    //return;    
}

simulated function ClientExecOnGameSettingsChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnGameSettingsChanged(Del)
    {
        dOnGameSettingsChanged();        
    }    
    //return;    
}

function ExecOnLobbyStateChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewLobbyState[8388609], PrevLobbyState;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x3D
    foreach OnLobbyStateChanged(Del)
    {
        dOnLobbyStateChanged(NewLobbyState, PrevLobbyState);        
    }    
    //return;    
}

simulated function ClientExecOnLobbyStateChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewLobbyState[8388609], PrevLobbyState;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x3D
    foreach OnLobbyStateChanged(Del)
    {
        dOnLobbyStateChanged(NewLobbyState, PrevLobbyState);        
    }    
    //return;    
}

function ExecOnMapVoteStarted()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnMapVoteStarted(Del)
    {
        dOnMapVoteStarted();        
    }    
    //return;    
}

simulated function ClientExecOnMapVoteStarted()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnMapVoteStarted(Del)
    {
        dOnMapVoteStarted();        
    }    
    //return;    
}

function ExecOnMapVoteStopped()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnMapVoteStopped(Del)
    {
        dOnMapVoteStopped();        
    }    
    //return;    
}

simulated function ClientExecOnMapVoteStopped()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnMapVoteStopped(Del)
    {
        dOnMapVoteStopped();        
    }    
    //return;    
}

function ExecOnMapVoteSubmitted()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnMapVoteSubmitted(Del)
    {
        dOnMapVoteSubmitted();        
    }    
    //return;    
}

simulated function ClientExecOnMapVoteSubmitted()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnMapVoteSubmitted(Del)
    {
        dOnMapVoteSubmitted();        
    }    
    //return;    
}

function ExecOnWinningMapChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnWinningMapChanged(Del)
    {
        dOnWinningMapChanged();        
    }    
    //return;    
}

simulated function ClientExecOnWinningMapChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnWinningMapChanged(Del)
    {
        dOnWinningMapChanged();        
    }    
    //return;    
}

function ExecOnLocalPlayerTeamChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnLocalPlayerTeamChanged(Del)
    {
        dOnLocalPlayerTeamChanged();        
    }    
    //return;    
}

simulated function ClientExecOnLocalPlayerTeamChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Del;

    // End:0x2B
    foreach OnLocalPlayerTeamChanged(Del)
    {
        dOnLocalPlayerTeamChanged();        
    }    
    //return;    
}

defaultproperties
{
    GameTypeSetting=EMPGameType.EMPGT_TeamDeathmatch
    CountdownStartSeconds=30
    CountdownStartSoundSeconds=5
    CountdownStillWaitingSeconds=3
    CountdownWaitingSeconds=2
    bAllowVoteRecast=true
    CountdownVoteSeconds=30
    MapImages[0]="NotYetReplicated!"
    MapImages[1]="NotYetReplicated!"
    MapImages[2]="NotYetReplicated!"
    MapImages[3]="NotYetReplicated!"
    MapImages[4]="NotYetReplicated!"
    MapImages[5]="NotYetReplicated!"
    MapImages[6]="NotYetReplicated!"
    MapImages[7]="NotYetReplicated!"
    MapImages[8]="NotYetReplicated!"
    MapImages[9]="NotYetReplicated!"
    MapImages[10]="NotYetReplicated!"
    MapImages[11]="NotYetReplicated!"
    MapImages[12]="NotYetReplicated!"
    MapImages[13]="NotYetReplicated!"
    MapImages[14]="NotYetReplicated!"
    MapImages[15]="NotYetReplicated!"
    MapImages[16]="NotYetReplicated!"
    MapImages[17]="NotYetReplicated!"
    MapImages[18]="NotYetReplicated!"
    MapImages[19]="NotYetReplicated!"
    MapImages[20]="NotYetReplicated!"
    MapImages[21]="NotYetReplicated!"
    MapImages[22]="NotYetReplicated!"
    MapImages[23]="NotYetReplicated!"
    MapVotes[0]=-1
    MapVotes[1]=-1
    MapVotes[2]=-1
    MapVotes[3]=-1
    MapVotes[4]=-1
    MapVotes[5]=-1
    MapVotes[6]=-1
    MapVotes[7]=-1
    MapVotes[8]=-1
    MapVotes[9]=-1
    MapVotes[10]=-1
    MapVotes[11]=-1
    MapVotes[12]=-1
    MapVotes[13]=-1
    MapVotes[14]=-1
    MapVotes[15]=-1
    MapVotes[16]=-1
    MapVotes[17]=-1
    MapVotes[18]=-1
    MapVotes[19]=-1
    MapVotes[20]=-1
    MapVotes[21]=-1
    MapVotes[22]=-1
    MapVotes[23]=-1
    MaxVotingRounds=1
    NumVotingMaps=25
}