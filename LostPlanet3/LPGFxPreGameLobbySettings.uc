class LPGFxPreGameLobbySettings extends LPGFxPreGameLobbyBase within GFxMoviePlayer
    config(UI);

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
const SID_GameType = 1;
const SID_Map = 2;
const SID_MatchGameDifficulty = 3;
const SID_FriendlyFire = 4;
const SID_RoundsToWin = 5;
const SID_ScoreLimit = 6;
const SID_TimeLimit = 7;
const SID_AtmosphereState = 8;

enum ETabType
{
    ETT_CharacterSelect,            // 0
    ETT_GameSettings,               // 1
    ETT_MapVote,                    // 2
    ETT_LoadoutKit,                 // 3
    ETT_MAX                         // 4
};

struct CharacterSkinData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ClassName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name UnlockName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Image[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PackageName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;

    structdefaultproperties
    {
        ClassName=""
        UnlockName="None"
        Image=""
        PackageName=""
        Label=""
    }
};

struct ListRowData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Id;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Index;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RowMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGreyed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisabled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ValueLabels;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Values;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PoolInfo;

    structdefaultproperties
    {
        Id=0
        Index=0
        Label=""
        RowMC=none
        bGreyed=false
        bDisabled=false
        ValueLabels=none
        Values=none
        PoolInfo=(MC=none,RendererDataProvider=none)
    }
};

struct GameSettingsRowData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Id[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Index[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ValueLabels;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Values[1073741825];

    structdefaultproperties
    {
        Id=0
        Index=0
        Label=""
        ValueLabels=none
        Values=none
    }
};

struct GameTypeSettingsData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Type[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Data[1073741825];

    structdefaultproperties
    {
        Type=EMPGameType.EMPGT_Default
        Data=none
    }
};

struct TabData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ListMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MovieClip;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Type;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DataProvider;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEventHandlersRegistered;

    structdefaultproperties
    {
        Label=""
        ListMC=none
        MovieClip=none
        Type=ETabType.ETT_CharacterSelect
        DataProvider=none
        bEventHandlersRegistered=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentSelectionIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL CurrentTab;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentTabIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapVoteFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowGameModeSelection[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCharSelectInvalid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPendingInvalidCharSelectionNotification;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifiedInvalidCharSelection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentWeaponsInvalid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPendingInvalidWeaponSelectionNotification;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifiedInvalidWeaponSelection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRenderedFirstTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SettingsListData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabOneMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabOneListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabTwoMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabTwoListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabThreeMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabThreeListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Tabs;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SkinChooserTabLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array NevecSkins[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PirateSkins[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string GameSettingsTabLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL GameTypeData[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GameTypeSettings[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MapAtmosphereStateLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MapSelectLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MapVoteTabLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MapVotedForName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LoadoutKitTabLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastOnlineUpdate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OnlineUpdateCooldown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int bPendingDeferredCharValidation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InvalidCharSelectionMessageBox;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int bPendingDeferredWeaponValidation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InvalidWeaponsMessageBox;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string NoMapTexturePath;

function ClearSettingsListData()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PoolInfoDefault;

    Idx = 0;
    J0x0B:

    // End:0x12A [Loop If]
    if(Idx < SettingsListData.Length)
    {
        // End:0xBC
        if(int(CurrentTab.Type) != int(3))
        {
            // End:0xBC
            if(Tabs[CurrentTabIdx].DataProvider != none)
            {
                Tabs[CurrentTabIdx].DataProvider.SetElementObject(Idx, none);
            }
        }
        PushSettingsListObjectPool(SettingsListData[Idx].PoolInfo);
        SettingsListData[Idx].PoolInfo = PoolInfoDefault;
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x1BA
    if(int(CurrentTab.Type) != int(3))
    {
        // End:0x1BA
        if(Tabs[CurrentTabIdx].DataProvider != none)
        {
            Tabs[CurrentTabIdx].DataProvider.SetArraySize(0);
        }
    }
    SettingsListData.Length = 0;
    //return;    
}

function SetCurrentTabIdx()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTGS, bHost;

    // End:0x5A
    if(bIsInitialized && CurrentTabIdx != Index)
    {
        SuppressDefaultSoundEvents(true);
        MoviePlayer.PlaySoundFromTheme('LobbyTabSelect');
    }
    CurrentTabIdx = Index;
    // End:0x98
    if((Index < 0) || Index >= Tabs.Length)
    {
        return;
    }
    CurrentTab = Tabs[CurrentTabIdx];
    bIsTGS = Class'LPGameViewportClient'.static.IsTGSDemo();
    bHost = int(MyPRI.Role) == int(ROLE_Authority);
    switch(CurrentTab.Type)
    {
        // End:0x1A8
        case 0:
            ASSetLeftPanelLayoutType(CurrentTabIdx, "skinChooser");
            ASSetSelectVisible(!bIsTGS);
            BuildCharSelectList();
            // End:0x19A
            if(bIsTGS)
            {
                CurrentSelectionIdx = -1;                
            }
            else
            {
                UpdateCharSelectIndex();
            }
            // End:0x2D4
            break;
        // End:0x248
        case 1:
            ASSetLeftPanelLayoutType(CurrentTabIdx, "matchSettings");
            ASSetSelectVisible(bHost);
            BuildGameSettingsList(MyGRI.GameTypeSetting);
            ReadGameSettings();
            CurrentSelectionIdx = ((bIsHost) ? ((bIsTGS) ? 2 : 0) : -1);
            // End:0x2D4
            break;
        // End:0x2BE
        case 2:
            ASSetLeftPanelLayoutType(CurrentTabIdx, "voting");
            ASSetSelectVisible(true);
            // End:0x2B1
            if(MyGRI.bMapVoteEnabled || bMapVoteFinished)
            {
                BuildMapVoteList();                
            }
            else
            {
                ClearSettingsListData();
            }
            // End:0x2D4
            break;
        // End:0x2D1
        case 3:
            ASSetSelectVisible(true);
            // End:0x2D4
            break;
        // End:0xFFFF
        default:
            break;
    }
    RegisterEventHandlers();
    bIsDirty = true;
    //return;    
}

function SetCurrentSelectionIdx()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609], Direction, I, NewIdx;

    1
    // End:0x29
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        return;
    }
    // End:0x42
    if(CurrentSelectionIdx == Index)
    {
        return;
    }
    // End:0x5F
    if(Index < 0)
    {
        Index = 0;        
    }
    else
    {
        // End:0x8E
        if(Index >= SettingsListData.Length)
        {
            Index = SettingsListData.Length - 1;
        }
    }
    // End:0x26E
    if(SettingsListData[Index].bDisabled)
    {
        NewIdx = -1;
        // End:0x19A
        if(Direction >= 0)
        {
            I = Index;
            J0xE9:

            // End:0x197 [Loop If]
            if(I < SettingsListData.Length)
            {
                // End:0x189
                if(!SettingsListData[I].bDisabled || (int(CurrentTab.Type) == int(2)) && I == (SettingsListData.Length - 1))
                {
                    NewIdx = I;
                    // [Explicit Break]
                    goto J0x197;
                }
                ++I;
                // [Loop Continue]
                goto J0xE9;
            }
            J0x197:
            
        }
        else
        {
            I = Index;
            J0x1AD:

            // End:0x246 [Loop If]
            if(I >= 0)
            {
                // End:0x238
                if(!SettingsListData[I].bDisabled || (int(CurrentTab.Type) == int(2)) && I == 0)
                {
                    NewIdx = I;
                    // [Explicit Break]
                    goto J0x246;
                }
                --I;
                // [Loop Continue]
                goto J0x1AD;
            }
        }
        J0x246:

        // End:0x25B
        if(NewIdx == -1)
        {
            return;
        }
        Index = NewIdx;
    }
    // End:0x287
    if(CurrentSelectionIdx == Index)
    {
        return;
    }
    CurrentSelectionIdx = Index;
    // End:0x2B4
    if(CurrentSelectionIdx < 0)
    {
        CurrentSelectionIdx = 0;
    }
    // End:0x2E3
    if(CurrentSelectionIdx >= SettingsListData.Length)
    {
        CurrentSelectionIdx = SettingsListData.Length - 1;
    }
    bIsDirty = true;
    //return;    
}

function GetCurrentSelectionOptionIdx()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return SettingsListData[CurrentSelectionIdx].Index;
    //return ReturnValue;    
}

function SetCurrentSelectionOptionIdx()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609], PrevIndex;

    // End:0x237
    if((CurrentSelectionIdx >= 0) && CurrentSelectionIdx < SettingsListData.Length)
    {
        // End:0x5F
        if(SettingsListData[CurrentSelectionIdx].Index == Index)
        {
            return;
        }
        PrevIndex = SettingsListData[CurrentSelectionIdx].Index;
        SettingsListData[CurrentSelectionIdx].Index = Index;
        // End:0x113
        if(SettingsListData[CurrentSelectionIdx].Index < 0)
        {
            SettingsListData[CurrentSelectionIdx].Index = 0;
        }
        // End:0x1B6
        if(SettingsListData[CurrentSelectionIdx].Index >= SettingsListData[CurrentSelectionIdx].Values.Length)
        {
            SettingsListData[CurrentSelectionIdx].Index = SettingsListData[CurrentSelectionIdx].Values.Length - 1;
        }
        bIsDirty = SettingsListData[CurrentSelectionIdx].Index != PrevIndex;
        // End:0x237
        if(bIsInitialized && bIsDirty)
        {
            MoviePlayer.PlaySoundFromTheme('LobbyMenuOptionChange');
        }
    }
    //return;    
}

function InitCommon()
{
    local /*0x97E50000-0x00000000*/ private bool bIsTGSDemo;
    local /*0x97E50000-0x00000000*/ private byte GameType;
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, GameSettings;

    bIsDirty = true;
    bIsTGSDemo = Class'LPGameViewportClient'.static.IsTGSDemo();
    MyGRI.OnGameSettingsChanged.AddItem(OnGameSettingsChanged);    
    MyGRI.OnLobbyStateChanged.AddItem(OnLobbyStateChanged);    
    MyGRI.OnMapVoteStarted.AddItem(OnMapVoteStarted);    
    MyGRI.OnMapVoteStopped.AddItem(OnMapVoteStopped);    
    MyGRI.OnMapVoteSubmitted.AddItem(OnMapVoteSubmitted);    
    MyGRI.OnWinningMapChanged.AddItem(OnWinningMapChanged);    
    MyGRI.OnLocalPlayerTeamChanged.AddItem(OnLocalPlayerTeamChanged);    
    MyGRI.RegisterOnPRIAddedDelegate(cbOnPRIAdded);
    MyGRI.RegisterOnPRIRemovedDelegate(cbOnPRIRemoved);
    MyGRI.RegisterOnPRIDLCChangedDelegate(cbOnPRIDLCChanged);
    TabOneMC = GetObject("tab0Content");
    TabTwoMC = GetObject("tab1Content");
    TabThreeMC = GetObject("tab2Content");
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x4C1
    if(bIsHost && NotEqual_InterfaceInterface(MyGameInfo.GameInterface, OnlineGameInterface(none)))
    {
        GameSettings = LPOnlineGameSettings(MPManager.GetDataStoreGameSettings().GetCurrentGameSettings());
        GameType = byte(GameSettings.GetGameType());
        // End:0x455
        if((int(GameType) < int(1)) || int(GameType) > int(4))
        {
            GameType = 3;
            MPManager.GetDataStoreGameSettings().SetCurrentByName('TeamDeathMatch');
            GameSettings = LPOnlineGameSettings(MPManager.GetDataStoreGameSettings().GetCurrentGameSettings());
            MPManager.UpdateGameSettings(GameSettings);
        }
        BuildGameSettingsList(((bIsTGSDemo) ? 2 : GameType));
        MyGRI.SetGameTypeSetting(((bIsTGSDemo) ? 2 : GameType));
        WriteGameSettings(true);        
    }
    else
    {
        // End:0x4DA
        if(!bIsHost)
        {
            UpdateGameTypeString();
        }
    }
    RefreshButtonPrompts();
    OnLobbyStateChanged(MyGRI.CurrentState, MyGRI.PreviousState);
    //return;    
}

function InitCustomMatch()
{
    local /*0x97E50000-0x00000000*/ private byte GameType;
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, Tab;

    RefreshButtonPrompts();
    GameSettings = Class'LPMultiplayerManager'.static.GetInstance().GetLPGameSettings();
    // End:0x58
    if(GameSettings == none)
    {
    }
    // End:0xBC
    if(GameSettings.GetGameType() == 2)
    {
        MyGRI.SetTimeLimit(GameSettings.GetTimeLimit());
    }
    // End:0x328
    if(int(MyGRI.Role) == int(ROLE_Authority))
    {
        MyGRI.WinningMapName = string(GameSettings.GetMapName());
        MyGRI.SelectedMapName = MyGRI.WinningMapName;
        // End:0x328
        if(MyGRI.WinningMapName != "None")
        {
            GameType = byte(GameSettings.GetGameType());
            BuildGameSettingsList(GameType);
            MyGRI.SetGameTypeSetting(GameType);
            MyGRI.SetAllowFriendlyFire(GameSettings.GetAllowFriendlyFire());
            MyGRI.SetMatchGameDifficulty(GameSettings.GetMatchGameDifficulty());
            MyGRI.SetRoundsToWin(GameSettings.GetRoundsToWin());
            MyGRI.SetScoreLimit(GameSettings.GetScoreLimit());
            MyGRI.SetTimeLimit(GameSettings.GetTimeLimit());
        }
    }
    MyGRI.bGameSettingsInit = true;
    MyGRI.UpdateOnlineGame();
    Tab.Label = GameSettingsTabLabel;
    Tab.ListMC = TabOneListMC;
    Tab.MovieClip = TabOneMC;
    Tab.Type = 1;
    Tabs.AddItem(Tab);    
    Tab.Label = SkinChooserTabLabel;
    Tab.ListMC = TabTwoListMC;
    Tab.MovieClip = TabTwoMC;
    Tab.Type = 0;
    Tabs.AddItem(Tab);    
    Tab.Label = LoadoutKitTabLabel;
    Tab.ListMC = none;
    Tab.MovieClip = TabThreeMC;
    Tab.Type = 3;
    Tabs.AddItem(Tab);    
    ASSetNumTabs(Tabs.Length);
    ASSetTabText(GetLocalizedString(Tabs[0].Label), GetLocalizedString(Tabs[1].Label), GetLocalizedString(Tabs[2].Label));
    ASSetLeftPanelFocusedTab(0);
    Update();
    Render();
    //return;    
}

function InitQuickMatch()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, Tab;

    RefreshButtonPrompts();
    GameSettings = Class'LPMultiplayerManager'.static.GetInstance().GetLPGameSettings();
    // End:0x58
    if(GameSettings == none)
    {
    }
    MyGRI.SetAllowFriendlyFire(GameSettings.GetAllowFriendlyFire());
    MyGRI.SetGameTypeSetting(byte(GameSettings.GetGameType()));
    MyGRI.SetMatchGameDifficulty(GameSettings.GetMatchGameDifficulty());
    MyGRI.SetRoundsToWin(GameSettings.GetRoundsToWin());
    MyGRI.SetScoreLimit(GameSettings.GetScoreLimit());
    MyGRI.SetTimeLimit(GameSettings.GetTimeLimit());
    MyGRI.bGameSettingsInit = true;
    MyGRI.UpdateOnlineGame();
    Tab.Label = MapVoteTabLabel;
    Tab.ListMC = TabOneListMC;
    Tab.MovieClip = TabOneMC;
    Tab.Type = 2;
    Tabs.AddItem(Tab);    
    Tab.Label = SkinChooserTabLabel;
    Tab.ListMC = TabTwoListMC;
    Tab.MovieClip = TabTwoMC;
    Tab.Type = 0;
    Tabs.AddItem(Tab);    
    Tab.Label = LoadoutKitTabLabel;
    Tab.ListMC = none;
    Tab.MovieClip = TabThreeMC;
    Tab.Type = 3;
    Tabs.AddItem(Tab);    
    ASSetNumTabs(Tabs.Length);
    ASSetTabText(GetLocalizedString(Tabs[0].Label), GetLocalizedString(Tabs[1].Label), GetLocalizedString(Tabs[2].Label));
    ASSetLeftPanelFocusedTab(0);
    // End:0x4C9
    if(MyGRI.bMapVoteEnabled)
    {
        OnMapVoteStarted();
    }
    Update();
    Render();
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentMovie;

    // End:0x28B
    if(bIsInitialized)
    {
        // End:0x31
        if(bPendingDeferredCharValidation > 0)
        {
            bPendingDeferredCharValidation = 0;
            NotifyInvalidCharSelection();
        }
        // End:0x14C
        if(bPendingInvalidCharSelectionNotification)
        {
            // End:0x14C
            if(!bNotifiedInvalidCharSelection)
            {
                // End:0x14C
                if((((((MyLPPC != none) && !MyLPPC.bIsExternalUIOpen) && MyFrontEndManager != none) && !MyFrontEndManager.bRenderingSuspended) && UIManagerInstance != none) && UIManagerInstance.OpenMessageBoxes.Length == 0)
                {
                    MyLPPC.GetCurrentMovie(CurrentMovie);
                    // End:0x14C
                    if(Len(CurrentMovie) <= 0)
                    {
                        DisplayInvalidCharSelectionMsg();
                        bPendingInvalidCharSelectionNotification = false;
                        bNotifiedInvalidCharSelection = true;
                    }
                }
            }
        }
        // End:0x170
        if(bPendingDeferredWeaponValidation > 0)
        {
            bPendingDeferredWeaponValidation = 0;
            NotifyInvalidWeaponSelection();
        }
        // End:0x28B
        if(bPendingInvalidWeaponSelectionNotification)
        {
            // End:0x28B
            if(!bNotifiedInvalidWeaponSelection)
            {
                // End:0x28B
                if((((((MyLPPC != none) && !MyLPPC.bIsExternalUIOpen) && MyFrontEndManager != none) && !MyFrontEndManager.bRenderingSuspended) && UIManagerInstance != none) && UIManagerInstance.OpenMessageBoxes.Length == 0)
                {
                    MyLPPC.GetCurrentMovie(CurrentMovie);
                    // End:0x28B
                    if(Len(CurrentMovie) <= 0)
                    {
                        DisplayInvalidWeaponSelectionMsg();
                        bPendingInvalidWeaponSelectionNotification = false;
                        bNotifiedInvalidWeaponSelection = true;
                    }
                }
            }
        }
    }
    //return;    
}

function HasValidCharacterSelection()
{
    local /*0x97E50000-0x00000000*/ private int bNeedsDeferredValidation[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPProfile;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PreferredPawnClassName;

    bNeedsDeferredValidation = 0;
    // End:0x17F
    if(((((MyLPPC != none) && MyLPPC.bProfileHasBeenLoaded) && MyGRI != none) && MyGRI.bServerPirateSkinsInitialized) && MyGRI.bServerNevecSkinsSkinsInitialized)
    {
        LPProfile = LPProfileSettings(MyLPPC.ProfileSettings);
        // End:0x171
        if(LPProfile != none)
        {
            PreferredPawnClassName = LPProfile.GetPreferredPawnClass(MyPRI.Team.TeamIndex);
            // End:0x16E
            if(Len(PreferredPawnClassName) > 0)
            {
                return MyLPPC.IsValidSkinForServer(PreferredPawnClassName, true);
            }            
        }
        else
        {
            bNeedsDeferredValidation = 1;
        }        
    }
    else
    {
        bNeedsDeferredValidation = 1;
    }
    return true;
    //return ReturnValue;    
}

function NotifyInvalidCharSelection()
{
    local /*0x97E50000-0x00000000*/ private bool bIsCurrentlyInvalid;

    bIsCurrentlyInvalid = !HasValidCharacterSelection(bPendingDeferredCharValidation);
    // End:0x31
    if(bPendingDeferredCharValidation > 0)
    {
        return;
    }
    // End:0x7F
    if(bIsCurrentlyInvalid && !bCharSelectInvalid)
    {
        bCharSelectInvalid = bIsCurrentlyInvalid;
        bPendingInvalidCharSelectionNotification = true;
        bNotifiedInvalidCharSelection = false;        
    }
    else
    {
        // End:0xCD
        if(!bIsCurrentlyInvalid && bCharSelectInvalid)
        {
            bCharSelectInvalid = bIsCurrentlyInvalid;
            bPendingInvalidCharSelectionNotification = false;
            bNotifiedInvalidCharSelection = false;            
        }
        else
        {
            // End:0x121
            if(bIsCurrentlyInvalid && bCharSelectInvalid)
            {
                // End:0x121
                if(!bPendingInvalidCharSelectionNotification && !bNotifiedInvalidCharSelection)
                {
                    bPendingInvalidCharSelectionNotification = true;
                    bNotifiedInvalidCharSelection = false;
                }
            }
        }
    }
    //return;    
}

function DisplayInvalidCharSelectionMsg()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;

    OptionArray.AddItem("<Strings:SPGameUI.CalloutButtonText.Continue>");    
    Class'SPEngine.SPUIManager'.static.ShowUIMessage('InvalidSkinSelection', "<Strings:LostPlanetGame.MessageBoxStrings.DLCInvalidSkin_Title>", "<Strings:LostPlanetGame.MessageBoxStrings.DLCInvalidSkin_Message>", OptionArray, OnSelected_InvalidCharMsg, none, InvalidCharSelectionMessageBox,, false,, true, true,, None);
    //return;    
}

function OnSelected_InvalidCharMsg()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    InvalidCharSelectionMessageBox = none;
    return true;
    //return ReturnValue;    
}

function HasValidWeaponSelection()
{
    local /*0x97E50000-0x00000000*/ private int bNeedsDeferredValidation[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TheKitty;

    bNeedsDeferredValidation = 0;
    // End:0x2E9
    if(((((MyLPPC != none) && MyLPPC.bServerWeaponsInitialized) && LoadoutMC != none) && LoadoutMC.KitManager != none) && LoadoutMC.KitManager.bLoadedFromProfile)
    {
        TheKitty = LoadoutMC.KitManager.GetLoadout(LoadoutMC.KitManager.GetDefaultLoadoutIndex());
        // End:0x2DB
        if(TheKitty != none)
        {
            // End:0x1BC
            if(!MyLPPC.IsValidWeaponForServer(TheKitty.GetWeaponPath(0), true) || !TheKitty.VerifyWeapon(TheKitty.GetWeaponPath(0)))
            {
                return false;
            }
            // End:0x249
            if(!MyLPPC.IsValidWeaponForServer(TheKitty.GetWeaponPath(1), true) || !TheKitty.VerifyWeapon(TheKitty.GetWeaponPath(1)))
            {
                return false;
            }
            // End:0x2D8
            if(!MyLPPC.IsValidWeaponForServer(TheKitty.GetWeaponPath(2), true) || !TheKitty.VerifyWeapon(TheKitty.GetWeaponPath(2)))
            {
                return false;
            }            
        }
        else
        {
            bNeedsDeferredValidation = 1;
        }        
    }
    else
    {
        bNeedsDeferredValidation = 1;
    }
    return true;
    //return ReturnValue;    
}

function ResetInvalidWeaponNotification()
{
    bCurrentWeaponsInvalid = false;
    bPendingInvalidWeaponSelectionNotification = false;
    bNotifiedInvalidWeaponSelection = false;
    //return;    
}

function NotifyInvalidWeaponSelection()
{
    local /*0x97E50000-0x00000000*/ private bool bIsCurrentlyInvalid;

    bIsCurrentlyInvalid = !HasValidWeaponSelection(bPendingDeferredWeaponValidation);
    // End:0x31
    if(bPendingDeferredWeaponValidation > 0)
    {
        return;
    }
    // End:0x7F
    if(bIsCurrentlyInvalid && !bCurrentWeaponsInvalid)
    {
        bCurrentWeaponsInvalid = bIsCurrentlyInvalid;
        bPendingInvalidWeaponSelectionNotification = true;
        bNotifiedInvalidWeaponSelection = false;        
    }
    else
    {
        // End:0xCD
        if(!bIsCurrentlyInvalid && bCurrentWeaponsInvalid)
        {
            bCurrentWeaponsInvalid = bIsCurrentlyInvalid;
            bPendingInvalidWeaponSelectionNotification = false;
            bNotifiedInvalidWeaponSelection = false;            
        }
        else
        {
            // End:0x121
            if(bIsCurrentlyInvalid && bCurrentWeaponsInvalid)
            {
                // End:0x121
                if(!bPendingInvalidWeaponSelectionNotification && !bNotifiedInvalidWeaponSelection)
                {
                    bPendingInvalidWeaponSelectionNotification = true;
                    bNotifiedInvalidWeaponSelection = false;
                }
            }
        }
    }
    //return;    
}

function DisplayInvalidWeaponSelectionMsg()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;

    OptionArray.AddItem("<Strings:SPGameUI.CalloutButtonText.Continue>");    
    Class'SPEngine.SPUIManager'.static.ShowUIMessage('InvalidWpnSelection', "<Strings:LostPlanetGame.MessageBoxStrings.DLCInvalidWeapon_Title>", "<Strings:LostPlanetGame.MessageBoxStrings.DLCInvalidWeapon_Message>", OptionArray, OnSelected_InvalidWpnMsg, none, InvalidWeaponsMessageBox,, false,, true, true,, None);
    //return;    
}

function OnSelected_InvalidWpnMsg()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    InvalidWeaponsMessageBox = none;
    return true;
    //return ReturnValue;    
}

function RefreshButtonPrompts()
{
    ASSetKitSelectionButtonText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Exit>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ProgressionSphere>"), GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Customize>"));
    switch(MyGRI.LobbyMode)
    {
        // End:0x371
        case 1:
            ASSetMPLobbyButtonText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Exit>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ProgressionSphere>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.SwitchTeam>"));
            ASSetTeamSelectionButtonText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Exit>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ProgressionSphere>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.SwitchTeam>"));
            // End:0x527
            break;
        // End:0x521
        case 2:
            ASSetMPLobbyButtonText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Exit>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ProgressionSphere>"), "");
            ASSetTeamSelectionButtonText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Exit>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ProgressionSphere>"), "");
            // End:0x527
            break;
        // End:0xFFFF
        default:
            // End:0x527
            break;
            break;
    }
    ASSetLeftPanelFocusedTab(0);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    MyGRI.OnGameSettingsChanged.RemoveItem(OnGameSettingsChanged);    
    MyGRI.OnLobbyStateChanged.RemoveItem(OnLobbyStateChanged);    
    MyGRI.OnMapVoteStarted.RemoveItem(OnMapVoteStarted);    
    MyGRI.OnMapVoteStopped.RemoveItem(OnMapVoteStopped);    
    MyGRI.OnMapVoteSubmitted.RemoveItem(OnMapVoteSubmitted);    
    MyGRI.OnWinningMapChanged.RemoveItem(OnWinningMapChanged);    
    MyGRI.OnLocalPlayerTeamChanged.RemoveItem(OnLocalPlayerTeamChanged);    
    MyGRI.UnRegisterOnPRIAddedDelegate(cbOnPRIAdded);
    MyGRI.UnRegisterOnPRIRemovedDelegate(cbOnPRIRemoved);
    MyGRI.UnRegisterOnPRIDLCChangedDelegate(cbOnPRIDLCChanged);
    LoadoutMC.OnKitSelectorClosed();
    // End:0x24E
    if(LoadoutMC != none)
    {
        LoadoutMC.MoviePlayer = none;
        LoadoutMC = none;
    }
    InvalidWeaponsMessageBox = none;
    InvalidCharSelectionMessageBox = none;
    Idx = 0;
    J0x26F:

    // End:0x326 [Loop If]
    if(Idx < Tabs.Length)
    {
        // End:0x318
        if(Tabs[Idx].DataProvider != none)
        {
            Tabs[Idx].DataProvider.SetArraySize(0);
            Tabs[Idx].DataProvider = none;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x26F;
    }
    ClearSettingsListObjectPool();
    //return;    
}

function BuildCharSelectList()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL SkinDLCClassInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize array SkinList;

    ClearSettingsListData();
    // End:0x59
    if(MyPRI.Team.TeamIndex == 0)
    {
        SkinList = NevecSkins;        
    }
    else
    {
        SkinList = PirateSkins;
    }
    I = 0;
    J0x77:

    // End:0x2A0 [Loop If]
    if(I < SkinList.Length)
    {
        // End:0x292
        if(MyLPPC.IsUnlockedMP(SkinList[I].UnlockName))
        {
            SettingsListData.Add(1);            
            SettingsListData[SettingsListData.Length - 1].Id = I;
            SettingsListData[SettingsListData.Length - 1].Label = GetLocalizedString(SkinList[I].Label);
            // End:0x265
            if(MyGRI.GetSkinDLClassInfo(SkinList[I].ClassName, SkinDLCClassInfo))
            {
                // End:0x235
                if(!DLCMan.AllPlayersHaveRequiredDLC(SkinDLCClassInfo.RequiredDLCs))
                {
                    SettingsListData[SettingsListData.Length - 1].bDisabled = true;                    
                }
                else
                {
                    SettingsListData[SettingsListData.Length - 1].bDisabled = false;
                }                
            }
            else
            {
                SettingsListData[SettingsListData.Length - 1].bDisabled = true;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x77;
    }
    //return;    
}

function ShouldUpdateCharSelectList()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCurrentDisabled;
    local /*0x97E50000-0x00000000*/ private int I, SavedCurrentSelectionIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL SkinDLCClassInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize array SkinList;

    // End:0x29
    if(int(CurrentTab.Type) != int(0))
    {
        return false;
    }
    // End:0x78
    if(MyPRI.Team.TeamIndex == 0)
    {
        SkinList = NevecSkins;        
    }
    else
    {
        SkinList = PirateSkins;
    }
    I = 0;
    J0x96:

    // End:0x293 [Loop If]
    if(I < SettingsListData.Length)
    {
        // End:0x285
        if((SettingsListData[I].Id >= 0) && SettingsListData[I].Id < SkinList.Length)
        {
            // End:0x285
            if(MyLPPC.IsUnlockedMP(SkinList[SettingsListData[I].Id].UnlockName))
            {
                bCurrentDisabled = false;
                // End:0x241
                if(MyGRI.GetSkinDLClassInfo(SkinList[SettingsListData[I].Id].ClassName, SkinDLCClassInfo))
                {
                    // End:0x23E
                    if(!DLCMan.AllPlayersHaveRequiredDLC(SkinDLCClassInfo.RequiredDLCs))
                    {
                        bCurrentDisabled = true;
                    }                    
                }
                else
                {
                    bCurrentDisabled = true;
                }
                // End:0x285
                if(SettingsListData[I].bDisabled != bCurrentDisabled)
                {
                    return true;
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x96;
    }
    SavedCurrentSelectionIdx = CurrentSelectionIdx;
    UpdateCharSelectIndex();
    // End:0x2DD
    if(CurrentSelectionIdx != SavedCurrentSelectionIdx)
    {
        CurrentSelectionIdx = SavedCurrentSelectionIdx;
        return true;
    }
    CurrentSelectionIdx = SavedCurrentSelectionIdx;
    return false;
    //return ReturnValue;    
}

function UpdateCharSelectIndex()
{
    local /*0x97E50000-0x00000000*/ private bool bTestOnly[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPProfile;
    local /*0x97E50000-0x00000000*/ private editfixedsize array SkinList;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PreferredPawnClassName, DefaultPawnClassName;
    local /*0x97E50000-0x00000000*/ private int PrevSelectionIdx, I, CurrentSkinId, DefaultIdx;

    false
    PrevSelectionIdx = CurrentSelectionIdx;
    CurrentSkinId = -1;
    // End:0x9E
    if(MyPRI.Team.TeamIndex == 0)
    {
        SkinList = NevecSkins;
        DefaultPawnClassName = Class'LPPRI'.default.DesiredNevecPawnClassName;        
    }
    else
    {
        SkinList = PirateSkins;
        DefaultPawnClassName = Class'LPPRI'.default.DesiredPiratePawnClassName;
    }
    // End:0xEB
    if(SkinList.Length <= 0)
    {
        return;
    }
    DefaultIdx = -1;
    I = 0;
    J0x105:

    // End:0x175 [Loop If]
    if(I < SkinList.Length)
    {
        // End:0x167
        if(SkinList[I].ClassName ~= DefaultPawnClassName)
        {
            DefaultIdx = I;
            // [Explicit Break]
            goto J0x175;
        }
        I++;
        // [Loop Continue]
        goto J0x105;
    }
    J0x175:

    // End:0x1B7
    if(DefaultIdx < 0)
    {
        DefaultIdx = 0;
        DefaultPawnClassName = SkinList[0].ClassName;
    }
    // End:0x3D6
    if(MyLPPC != none)
    {
        LPProfile = LPProfileSettings(MyLPPC.ProfileSettings);
        // End:0x3D6
        if(LPProfile != none)
        {
            PreferredPawnClassName = LPProfile.GetPreferredPawnClass(MyPRI.Team.TeamIndex);
            // End:0x3D6
            if(Len(PreferredPawnClassName) > 0)
            {
                I = 0;
                J0x27E:

                // End:0x34C [Loop If]
                if(I < SkinList.Length)
                {
                    // End:0x33E
                    if(SkinList[I].ClassName ~= PreferredPawnClassName)
                    {
                        // End:0x328
                        if(MyLPPC.IsUnlockedMP(SkinList[I].UnlockName))
                        {
                            CurrentSkinId = I;                            
                        }
                        else
                        {
                            CurrentSkinId = DefaultIdx;
                        }
                        // [Explicit Break]
                        goto J0x34C;
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x27E;
                }
                J0x34C:

                // End:0x3D6
                if(CurrentSkinId >= 0)
                {
                    I = 0;
                    J0x366:

                    // End:0x3D6 [Loop If]
                    if(I < SettingsListData.Length)
                    {
                        // End:0x3C8
                        if(SettingsListData[I].Id == CurrentSkinId)
                        {
                            CurrentSelectionIdx = I;
                            // [Explicit Break]
                            goto J0x3D6;
                        }
                        I++;
                        // [Loop Continue]
                        goto J0x366;
                    }
                }
            }
        }
    }
    J0x3D6:

    // End:0x4BE
    if((CurrentSelectionIdx >= 0) && CurrentSelectionIdx < SettingsListData.Length)
    {
        // End:0x4BE
        if(SettingsListData[CurrentSelectionIdx].bDisabled)
        {
            CurrentSkinId = -1;
            I = 0;
            J0x443:

            // End:0x4AB [Loop If]
            if(I < SettingsListData.Length)
            {
                // End:0x49D
                if(!SettingsListData[I].bDisabled)
                {
                    CurrentSkinId = I;
                    // [Explicit Break]
                    goto J0x4AB;
                }
                ++I;
                // [Loop Continue]
                goto J0x443;
            }
            J0x4AB:

            CurrentSelectionIdx = CurrentSkinId;
        }
    }
    // End:0x4EF
    if(PrevSelectionIdx != CurrentSelectionIdx)
    {
        // End:0x4EF
        if(!bTestOnly)
        {
            SuppressDefaultSoundEvents(true);
        }
    }
    //return;    
}

function CanChangeGameType()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bAllowGameModeSelection || Class'LPMultiplayerManager'.static.GetInstance().GetGameSettings().bIsLanMatch;
    //return ReturnValue;    
}

function BuildGameSettingsList()
{
    local /*0x97E50000-0x00000000*/ private byte GameType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL CurrentGameSettings;
    local /*0x97E50000-0x00000000*/ private int I, iGameTypeIndex;

    CurrentGameSettings = GetGameTypeSettingsData(((Class'LPGameViewportClient'.static.IsTGSDemo()) ? 2 : GameType));
    ClearSettingsListData();
    // End:0x12C
    if(CanChangeGameType())
    {
        SettingsListData.Add(1);        
        SettingsListData[SettingsListData.Length - 1] = ConvertGameSettingsRowData(GameTypeData);
        SettingsListData[SettingsListData.Length - 1].Index = SettingsListData[SettingsListData.Length - 1].Values.Find(int(GameType));        
        iGameTypeIndex = SettingsListData[SettingsListData.Length - 1].Index;        
    }
    else
    {
        iGameTypeIndex = GameTypeData.Values.Find(int(GameType));        
    }
    ASSetGameTypeText(GetLocalizedString(GameTypeData.ValueLabels[iGameTypeIndex]));
    SettingsListData.Add(1);    
    SettingsListData[SettingsListData.Length - 1].Id = 2;
    SettingsListData[SettingsListData.Length - 1].Label = GetLocalizedString(MapSelectLabel);
    I = 0;
    J0x21D:

    // End:0x561 [Loop If]
    if(I < MyGRI.NumMaps)
    {
        // End:0x31E
        if(DLCMan.AllPlayersHaveRequiredDLC(MyGRI.MapNames[I].RequiredDLCs))
        {
            SettingsListData[SettingsListData.Length - 1].ValueLabels.AddItem(GetLocalizedString(MyGRI.MapNames[I].UILabel));                        
        }
        else
        {
            // End:0x3F1
            if(DLCMan.HasDLCIds(MyGRI.MapNames[I].RequiredDLCs))
            {
                SettingsListData[SettingsListData.Length - 1].ValueLabels.AddItem(GetLocalizedString(MyGRI.MapNames[I].UILabel));                                
            }
            else
            {
                SettingsListData[SettingsListData.Length - 1].ValueLabels.AddItem(GetLocalizedString("<Strings:LostPlanetGame.PreGameLobby.NoDLCForMapLabel>"));                
            }
        }
        SettingsListData[SettingsListData.Length - 1].Values.AddItem(I);        
        // End:0x553
        if(name(MyGRI.WinningMapName) == name(MyGRI.MapNames[I].Name))
        {
            SettingsListData[SettingsListData.Length - 1].Index = SettingsListData[SettingsListData.Length - 1].Values.Length - 1;
        }
        I++;
        // [Loop Continue]
        goto J0x21D;
    }
    // End:0x610
    if(!DLCMan.AllPlayersHaveRequiredDLC(MyGRI.MapNames[SettingsListData[SettingsListData.Length - 1].Index].RequiredDLCs))
    {
        SettingsListData[SettingsListData.Length - 1].bGreyed = true;
    }
    I = 0;
    J0x61B:

    // End:0x6A8 [Loop If]
    if(I < CurrentGameSettings.Data.Length)
    {
        SettingsListData.Add(1);        
        SettingsListData[SettingsListData.Length - 1] = ConvertGameSettingsRowData(CurrentGameSettings.Data[I]);
        I++;
        // [Loop Continue]
        goto J0x61B;
    }
    bIsDirty = true;
    //return;    
}

function GetGameTypeSettingsData()
{
    local /*0x97E50000-0x00000000*/ private byte GameType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x89 [Loop If]
    if(I < GameTypeSettings.Length)
    {
        // End:0x7B
        if(int(GameTypeSettings[I].Type) == int(GameType))
        {
            Result = GameTypeSettings[I];
            // [Explicit Break]
            goto J0x89;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x89:

    return Result;
    //return ReturnValue;    
}

function BuildMapVoteList()
{
    local /*0x97E50000-0x00000000*/ private int I;

    ClearSettingsListData();
    CurrentSelectionIdx = 0;
    bIsDirty = true;
    // End:0x2CA
    if(bMapVoteFinished)
    {
        I = MyGRI.GetMapIdx(MyGRI.WinningMapName);
        // End:0x2C7
        if(I >= 0)
        {
            SettingsListData.Add(1);            
            SettingsListData[0].Id = I;
            // End:0x17E
            if(DLCMan.AllPlayersHaveRequiredDLC(MyGRI.MapNames[I].RequiredDLCs))
            {
                SettingsListData[0].Label = GetLocalizedString(MyGRI.MapNames[I].UILabel);                
            }
            else
            {
                SettingsListData[0].bDisabled = true;
                // End:0x263
                if(DLCMan.HasDLCIds(MyGRI.MapNames[I].RequiredDLCs))
                {
                    SettingsListData[0].Label = GetLocalizedString(MyGRI.MapNames[I].UILabel);                    
                }
                else
                {
                    SettingsListData[0].Label = GetLocalizedString("<Strings:LostPlanetGame.PreGameLobby.NoDLCForMapLabel>");
                }
            }            
        }        
    }
    else
    {
        I = 0;
        J0x2D5:

        // End:0x625 [Loop If]
        if(I < MyGRI.NumMaps)
        {
            SettingsListData.Add(1);            
            SettingsListData[I].Id = I;
            SettingsListData[I].Values.AddItem(MyGRI.MapVotes[I]);            
            // End:0x45D
            if(DLCMan.AllPlayersHaveRequiredDLC(MyGRI.MapNames[I].RequiredDLCs))
            {
                SettingsListData[I].Label = GetLocalizedString(MyGRI.MapNames[I].UILabel);                
            }
            else
            {
                // End:0x529
                if(DLCMan.HasDLCIds(MyGRI.MapNames[I].RequiredDLCs))
                {
                    SettingsListData[I].Label = GetLocalizedString(MyGRI.MapNames[I].UILabel);                    
                }
                else
                {
                    SettingsListData[I].Label = GetLocalizedString("<Strings:LostPlanetGame.PreGameLobby.NoDLCForMapLabel>");
                }
                SettingsListData[I].bDisabled = true;
            }
            // End:0x617
            if(MapVotedForName ~= MyGRI.MapNames[I].Name)
            {
                CurrentSelectionIdx = I;
            }
            I++;
            // [Loop Continue]
            goto J0x2D5;
        }
        // End:0x6D1
        if(SettingsListData[CurrentSelectionIdx].bDisabled)
        {
            CurrentSelectionIdx = -1;
            I = 0;
            J0x669:

            // End:0x6D1 [Loop If]
            if(I < SettingsListData.Length)
            {
                // End:0x6C3
                if(!SettingsListData[I].bDisabled)
                {
                    CurrentSelectionIdx = I;
                    // [Explicit Break]
                    goto J0x6D1;
                }
                ++I;
                // [Loop Continue]
                goto J0x669;
            }
        }
    }
    J0x6D1:

    //return;    
}

function ShouldRebuildMapVoteList()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x29
    if(int(CurrentTab.Type) != int(2))
    {
        return false;
    }
    I = 0;
    J0x34:

    // End:0x106 [Loop If]
    if(I < SettingsListData.Length)
    {
        // End:0xF8
        if(!DLCMan.AllPlayersHaveRequiredDLC(MyGRI.MapNames[SettingsListData[I].Id].RequiredDLCs))
        {
            // End:0xF8
            if(!SettingsListData[I].bDisabled)
            {
                return true;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x34;
    }
    return false;
    //return ReturnValue;    
}

function RebuildMapVoteList()
{
    // End:0x3B
    if(int(CurrentTab.Type) == int(2))
    {
        BuildMapVoteList();
        Render();
    }
    //return;    
}

function RegisterEventHandlers()
{
    // End:0x24
    if(CurrentTab.ListMC == none)
    {
        return;
    }
    // End:0x50
    if(Tabs[CurrentTabIdx].bEventHandlersRegistered)
    {
        return;
    }
    switch(CurrentTab.Type)
    {
        // End:0x16B
        case 0:
            CurrentTab.ListMC.AddEventListener('CLIK_change', OnSettingsListChange_CharacterSelect);
            CurrentTab.ListMC.AddEventListener('CLIK_itemChange', OnSettingsOptionChanged_CharacterSelect);
            CurrentTab.ListMC.AddEventListener('CLIK_itemPress', OnSettingsListPress_CharacterSelect);
            // End:0x44D
            break;
        // End:0x260
        case 1:
            CurrentTab.ListMC.AddEventListener('CLIK_change', OnSettingsListChange_GameSettings);
            CurrentTab.ListMC.AddEventListener('CLIK_itemChange', OnSettingsOptionChanged_GameSettings);
            CurrentTab.ListMC.AddEventListener('CLIK_itemPress', OnSettingsListPress_GameSettings);
            // End:0x44D
            break;
        // End:0x355
        case 2:
            CurrentTab.ListMC.AddEventListener('CLIK_change', OnSettingsListChange_MapVote);
            CurrentTab.ListMC.AddEventListener('CLIK_itemChange', OnSettingsOptionChanged_MapVote);
            CurrentTab.ListMC.AddEventListener('CLIK_itemPress', OnSettingsListPress_MapVote);
            // End:0x44D
            break;
        // End:0x44A
        case 3:
            CurrentTab.ListMC.AddEventListener('CLIK_change', OnSettingsListChange_LoadoutKit);
            CurrentTab.ListMC.AddEventListener('CLIK_itemChange', OnSettingsOptionChanged_LoadoutKit);
            CurrentTab.ListMC.AddEventListener('CLIK_itemPress', OnSettingsListPress_LoadoutKit);
            // End:0x44D
            break;
        // End:0xFFFF
        default:
            break;
    }
    Tabs[CurrentTabIdx].bEventHandlersRegistered = true;
    //return;    
}

function UnregisterEventHandlers()
{
    // End:0x24
    if(CurrentTab.ListMC == none)
    {
        return;
    }
    CurrentTab.ListMC.RemoveAllEventListeners("CLIK_change");
    CurrentTab.ListMC.RemoveAllEventListeners("change");
    CurrentTab.ListMC.RemoveAllEventListeners("CLIK_itemChange");
    CurrentTab.ListMC.RemoveAllEventListeners("itemChange");
    CurrentTab.ListMC.RemoveAllEventListeners("CLIK_itemPress");
    CurrentTab.ListMC.RemoveAllEventListeners("itemPress");
    //return;    
}

function ConvertGameSettingsRowData()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL RowData[8388609], ReturnValue, Result;
    local /*0x97E50000-0x00000000*/ private int I;

    Result.Id = RowData.Id;
    Result.Index = ((RowData.Index >= 0) ? RowData.Index : 0);
    Result.Label = GetLocalizedString(RowData.Label);
    I = 0;
    J0xE5:

    // End:0x16E [Loop If]
    if(I < RowData.ValueLabels.Length)
    {
        Result.ValueLabels.AddItem(GetLocalizedString(RowData.ValueLabels[I]));        
        I++;
        // [Loop Continue]
        goto J0xE5;
    }
    I = 0;
    J0x179:

    // End:0x1F8 [Loop If]
    if(I < RowData.Values.Length)
    {
        Result.Values.AddItem(RowData.Values[I]);        
        I++;
        // [Loop Continue]
        goto J0x179;
    }
    return Result;
    //return ReturnValue;    
}

function ConvertMapAtmosphereRowData()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Map[8388609], ReturnValue, Result;
    local /*0x97E50000-0x00000000*/ private int I;

    Result.Id = 8;
    Result.Index = 0;
    Result.Label = GetLocalizedString(MapAtmosphereStateLabel);
    I = 0;
    J0x78:

    // End:0x13D [Loop If]
    if(I < Map.AtmosphereStates.Length)
    {
        Result.Values.AddItem(I);        
        Result.ValueLabels.AddItem(GetLocalizedString(Map.AtmosphereStates[I].Label));        
        I++;
        // [Loop Continue]
        goto J0x78;
    }
    return Result;
    //return ReturnValue;    
}

function FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval, bNoUpdate;

    Retval = false;
    // End:0x37
    if(int(MyGRI.CurrentState) == int(5))
    {
        return true;
    }
    // End:0x11B
    if(int(CurrentTab.Type) == int(3))
    {
        // End:0x77
        if(ButtonName == 'One')
        {
            return false;
        }
        // End:0x11B
        if((ButtonName != 'XboxTypeS_X') && (ButtonName != 'XboxTypeS_Y') || !LPGFxFrontEnd_PreGameLobby(RootMC).bSubMenusDisabled)
        {
            Retval = LoadoutMC.FilterButtonInput(ControllerId, ButtonName, InputEvent);
        }
    }
    // End:0x3EE
    if(Retval == false)
    {
        // End:0x3EE
        if((ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter')
        {
            // End:0x3E2
            if(int(InputEvent) == int(0))
            {
                // End:0x202
                if(int(CurrentTab.Type) == int(0))
                {
                    // End:0x1F3
                    if((CurrentSelectionIdx >= 0) && !SettingsListData[CurrentSelectionIdx].bDisabled)
                    {
                        PlayItemSelectedSound();
                        SetSelectedCharacter(CurrentSelectionIdx);                        
                    }
                    else
                    {
                        bNoUpdate = true;
                    }                    
                }
                else
                {
                    // End:0x263
                    if((int(CurrentTab.Type) == int(1)) && int(MyGRI.CurrentState) == int(3))
                    {
                        bNoUpdate = true;                        
                    }
                    else
                    {
                        // End:0x2AD
                        if(int(CurrentTab.Type) == int(3))
                        {
                            LoadoutMC.SetDefaultLoadout();                            
                        }
                        else
                        {
                            // End:0x3E2
                            if((int(CurrentTab.Type) == int(2)) && MyGRI.bMapVoteEnabled)
                            {
                                // End:0x3D6
                                if((CurrentSelectionIdx >= 0) && !SettingsListData[CurrentSelectionIdx].bDisabled)
                                {
                                    PlayItemSelectedSound();
                                    MapVotedForName = MyGRI.MapNames[SettingsListData[CurrentSelectionIdx].Id].Name;
                                    MyPRI.SubmitMapVote(MapVotedForName);
                                    RebuildMapVoteList();                                    
                                }
                                else
                                {
                                    bNoUpdate = true;
                                }
                            }
                        }
                    }
                }
            }
            Retval = true;
        }
    }
    // End:0x8DA
    if(Retval == false)
    {
        // End:0x8DA
        if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
        {
            // End:0x471
            if((ButtonName == 'XboxTypeS_LeftShoulder') || ButtonName == 'Three')
            {
                PreviousTab();
                Retval = true;                
            }
            else
            {
                // End:0x4B7
                if((ButtonName == 'XboxTypeS_RightShoulder') || ButtonName == 'Four')
                {
                    NextTab();
                    Retval = true;
                }
            }
            // End:0x5EA
            if((((ButtonName == 'XBoxTypeS_LeftStick_Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down')
            {
                // End:0x583
                if(int(CurrentTab.Type) == int(1))
                {
                    // End:0x580
                    if(int(MyGRI.CurrentState) == int(3))
                    {
                        SetCurrentSelectionIdx(CurrentSelectionIdx + 1, 1);
                    }                    
                }
                else
                {
                    // End:0x5C4
                    if(int(CurrentTab.Type) == int(2))
                    {
                        SetCurrentSelectionIdx(CurrentSelectionIdx + 1, 1);                        
                    }
                    else
                    {
                        SetCurrentSelectionIdx(CurrentSelectionIdx + 1, 1);
                    }
                }
                Retval = true;                
            }
            else
            {
                // End:0x729
                if((((ButtonName == 'XBoxTypeS_LeftStick_Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up')
                {
                    // End:0x6BA
                    if(int(CurrentTab.Type) == int(1))
                    {
                        // End:0x6B7
                        if(int(MyGRI.CurrentState) == int(3))
                        {
                            SetCurrentSelectionIdx(CurrentSelectionIdx - 1, -1);
                        }                        
                    }
                    else
                    {
                        // End:0x6FF
                        if(int(CurrentTab.Type) == int(2))
                        {
                            SetCurrentSelectionIdx(CurrentSelectionIdx - 1, -1);                            
                        }
                        else
                        {
                            SetCurrentSelectionIdx(CurrentSelectionIdx - 1, -1);
                        }
                    }
                    Retval = true;                    
                }
                else
                {
                    // End:0x803
                    if((((ButtonName == 'XBoxTypeS_LeftStick_Left') || ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'Left')
                    {
                        // End:0x7F4
                        if((int(CurrentTab.Type) == int(1)) && int(MyGRI.CurrentState) == int(3))
                        {
                            SetCurrentSelectionOptionIdx((GetCurrentSelectionOptionIdx()) - 1);
                        }
                        Retval = true;                        
                    }
                    else
                    {
                        // End:0x8DA
                        if((((ButtonName == 'XBoxTypeS_LeftStick_Right') || ButtonName == 'Gamepad_LeftStick_Right') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'Right')
                        {
                            // End:0x8CE
                            if((int(CurrentTab.Type) == int(1)) && int(MyGRI.CurrentState) == int(3))
                            {
                                SetCurrentSelectionOptionIdx((GetCurrentSelectionOptionIdx()) + 1);
                            }
                            Retval = true;
                        }
                    }
                }
            }
        }
    }
    // End:0x936
    if(Retval && !bNoUpdate)
    {
        // End:0x936
        if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
        {
            Update();
            Render();
        }
    }
    return Retval;
    //return ReturnValue;    
}

function PlayItemSelectedSound()
{
    MoviePlayer.PlaySoundFromTheme(LPGFxFrontEnd_PreGameLobby(RootMC).ListItemPressSoundEventName);
    //return;    
}

function NextTab()
{
    RootMC.ActionScriptVoid("RightBumper");
    //return;    
}

function cbOnPRIAdded()
{
    local /*0x97E50000-0x00000000*/ private @NULL AddedPRI[8388609];

    UpdateOnPRIChanged();
    NotifyInvalidCharSelection();
    NotifyInvalidWeaponSelection();
    //return;    
}

function cbOnPRIRemoved()
{
    local /*0x97E50000-0x00000000*/ private @NULL RemovedPRI[8388609];

    UpdateOnPRIChanged();
    NotifyInvalidCharSelection();
    NotifyInvalidWeaponSelection();
    //return;    
}

function cbOnPRIDLCChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSPPRI[8388609];

    UpdateOnPRIChanged();
    NotifyInvalidCharSelection();
    NotifyInvalidWeaponSelection();
    //return;    
}

function UpdateOnPRIChanged()
{
    // End:0x11
    if(!bIsInitialized)
    {
        return;
    }
    Update();
    // End:0x70
    if(int(CurrentTab.Type) == int(0))
    {
        // End:0x70
        if(ShouldUpdateCharSelectList())
        {
            BuildCharSelectList();
            UpdateCharSelectIndex();
            bIsDirty = true;
        }
    }
    Render();
    //return;    
}

function OnGameSettingsChanged()
{
    // End:0x0F
    if(bIsHost)
    {
        return;
    }
    // End:0x43
    if(int(CurrentTab.Type) == int(1))
    {
        UpdateGameSettings();        
    }
    else
    {
        UpdateGameTypeString();
    }
    Render();
    //return;    
}

function OnLobbyStateChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewLobbyState[8388609], PrevLobbyState;

    switch(NewLobbyState)
    {
        // End:0x50
        case 2:
            // End:0x4D
            if(int(MyGRI.LobbyMode) == int(2))
            {
                ASbEnableLeftPanelTabs(1, false);
            }
            // End:0x1C6
            break;
        // End:0x112
        case 3:
            // End:0x8A
            if(int(MyGRI.LobbyMode) == int(2))
            {
                ASbEnableLeftPanelTabs(1, false);
            }
            // End:0xFC
            if(int(PrevLobbyState) < int(NewLobbyState))
            {
                // End:0xFC
                if((int(MyGRI.LobbyMode) == int(2)) && MyGRI.bMapVoteEnabled)
                {
                    OnMapVoteStarted();
                }
            }
            SetCurrentTabIdx(CurrentTabIdx);
            // End:0x1C6
            break;
        // End:0x1C3
        case 4:
            // End:0x14C
            if(int(MyGRI.LobbyMode) == int(2))
            {
                ASbEnableLeftPanelTabs(1, true);
            }
            MyLPPC.SendServerPlayerPreferences();
            // End:0x1C0
            if(int(CurrentTab.Type) == int(0))
            {
                // End:0x1C0
                if(ShouldUpdateCharSelectList())
                {
                    BuildCharSelectList();
                    UpdateCharSelectIndex();
                    bIsDirty = true;
                }
            }
            // End:0x1C6
            break;
        // End:0xFFFF
        default:
            break;
    }
    Update();
    Render();
    //return;    
}

function OnMapVoteStarted()
{
    SetCurrentTabIdx(0);
    MapVotedForName = "";
    bMapVoteFinished = false;
    RebuildMapVoteList();
    //return;    
}

function OnMapVoteStopped()
{
    bMapVoteFinished = true;
    RebuildMapVoteList();
    //return;    
}

function OnMapVoteSubmitted()
{
    //return;    
}

event OnReceiveFocus()
{
    switch(MyGRI.CurrentState)
    {
        // End:0x2D
        case 2:
        // End:0x6A
        case 3:
            // End:0x67
            if(int(MyGRI.LobbyMode) == int(2))
            {
                ASbEnableLeftPanelTabs(1, false);
            }
            // End:0x6D
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xDC
    if(int(CurrentTab.Type) == int(1))
    {
        CurrentSelectionIdx = ((bIsHost && !Class'LPGameViewportClient'.static.IsTGSDemo()) ? 0 : -1);        
    }
    else
    {
        // End:0x111
        if(int(CurrentTab.Type) == int(0))
        {
            UpdateCharSelectIndex();            
        }
        else
        {
            CurrentSelectionIdx = 0;
        }
    }
    //return;    
}

event OnRemoveFocus()
{
    CurrentSelectionIdx = -1;
    //return;    
}

function OnWinningMapChanged()
{
    // End:0x7D
    if((MyGRI != none) && int(MyGRI.LobbyMode) == int(2))
    {
        // End:0x7A
        if((int(CurrentTab.Type) == int(2)) && bMapVoteFinished)
        {
            RebuildMapVoteList();
        }        
    }
    else
    {
        Update();
        Render();
    }
    //return;    
}

function OnLocalPlayerTeamChanged()
{
    // End:0x44
    if(int(CurrentTab.Type) == int(0))
    {
        SetCurrentTabIdx(CurrentTabIdx);
        Render();
    }
    //return;    
}

function OnSettingsListPress_CharacterSelect()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(0))
    {
        OnSettingsListPress(ev);
    }
    //return;    
}

function OnSettingsListPress_GameSettings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(1))
    {
        OnSettingsListPress(ev);
    }
    //return;    
}

function OnSettingsListPress_MapVote()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(2))
    {
        OnSettingsListPress(ev);
    }
    //return;    
}

function OnSettingsListPress_LoadoutKit()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(3))
    {
        OnSettingsListPress(ev);
    }
    //return;    
}

function OnSettingsListPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private bool bItemSelected;

    // End:0x24D
    if(bIsInitialized)
    {
        bItemSelected = false;
        // End:0x69
        if(CurrentSelectionIdx != ev.Index)
        {
            CurrentSelectionIdx = ev.Index;
        }
        // End:0xEF
        if(int(CurrentTab.Type) == int(0))
        {
            // End:0xEC
            if((CurrentSelectionIdx >= 0) && !SettingsListData[CurrentSelectionIdx].bDisabled)
            {
                bItemSelected = true;
                SetSelectedCharacter(CurrentSelectionIdx);
            }            
        }
        else
        {
            // End:0x217
            if((int(CurrentTab.Type) == int(2)) && MyGRI.bMapVoteEnabled)
            {
                // End:0x217
                if((CurrentSelectionIdx >= 0) && !SettingsListData[CurrentSelectionIdx].bDisabled)
                {
                    bItemSelected = true;
                    MapVotedForName = MyGRI.MapNames[SettingsListData[CurrentSelectionIdx].Id].Name;
                    MyPRI.SubmitMapVote(MapVotedForName);
                    RebuildMapVoteList();
                }
            }
        }
        // End:0x24D
        if(bItemSelected)
        {
            SuppressDefaultSoundEvents(true);
            PlayItemSelectedSound();
            Update();
            Render();
        }
    }
    //return;    
}

function OnSettingsListChange_CharacterSelect()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(0))
    {
        OnSettingsListChange(ev);
    }
    //return;    
}

function OnSettingsListChange_GameSettings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(1))
    {
        OnSettingsListChange(ev);
    }
    //return;    
}

function OnSettingsListChange_MapVote()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(2))
    {
        OnSettingsListChange(ev);
    }
    //return;    
}

function OnSettingsListChange_LoadoutKit()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(3))
    {
        OnSettingsListChange(ev);
    }
    //return;    
}

function OnSettingsListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x50
    if(CurrentSelectionIdx != ev.Index)
    {
        CurrentSelectionIdx = ev.Index;
    }
    // End:0x95
    if(bIsInitialized && bSoundEvents)
    {
        MoviePlayer.PlaySoundFromTheme('LobbyMenuChange');
    }
    //return;    
}

function OnSettingsOptionChanged_CharacterSelect()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(0))
    {
        OnSettingsOptionChanged(ev);
    }
    //return;    
}

function OnSettingsOptionChanged_GameSettings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(1))
    {
        OnSettingsOptionChanged(ev);
    }
    //return;    
}

function OnSettingsOptionChanged_MapVote()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(2))
    {
        OnSettingsOptionChanged(ev);
    }
    //return;    
}

function OnSettingsOptionChanged_LoadoutKit()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(int(CurrentTab.Type) == int(3))
    {
        OnSettingsOptionChanged(ev);
    }
    //return;    
}

function OnSettingsOptionChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x36
    if(bIsInitialized)
    {
        MoviePlayer.PlaySoundFromTheme('LobbyMenuOptionChange');
    }
    //return;    
}

function PreviousTab()
{
    RootMC.ActionScriptVoid("LeftBumper");
    //return;    
}

function Render()
{
    // End:0x11
    if(!bIsDirty)
    {
        return;
    }
    RenderImage();
    RenderSettingsList();
    SuppressDefaultSoundEvents(false);
    bIsDirty = false;
    // End:0x6B
    if(!bRenderedFirstTime)
    {
        NotifyInvalidCharSelection();
        NotifyInvalidWeaponSelection();
        bRenderedFirstTime = true;
    }
    //return;    
}

function RenderImage()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bDisabled;

    // End:0x14F
    if(int(CurrentTab.Type) == int(0))
    {
        ASSetLeftPanelSkinTeam(MyPRI.Team.TeamIndex);
        // End:0xF6
        if(MyPRI.Team.TeamIndex == 0)
        {
            SetLeftPanelImage(CurrentTabIdx, NevecSkins[SettingsListData[CurrentSelectionIdx].Id].Image);            
        }
        else
        {
            SetLeftPanelImage(CurrentTabIdx, PirateSkins[SettingsListData[CurrentSelectionIdx].Id].Image);
        }        
    }
    else
    {
        // End:0x3B2
        if(int(CurrentTab.Type) == int(1))
        {
            // End:0x1B7
            if(int(MyGRI.CurrentState) == int(2))
            {
                SetLeftPanelImage(CurrentTabIdx, "");                
            }
            else
            {
                bDisabled = false;
                // End:0x25E
                if(int(CurrentTab.Type) == int(2))
                {
                    // End:0x25B
                    if(CurrentSelectionIdx >= 0)
                    {
                        // End:0x25B
                        if(SettingsListData[CurrentSelectionIdx].bGreyed || SettingsListData[CurrentSelectionIdx].bDisabled)
                        {
                            bDisabled = true;
                        }
                    }                    
                }
                else
                {
                    // End:0x348
                    if(int(CurrentTab.Type) == int(1))
                    {
                        I = 0;
                        J0x290:

                        // End:0x348 [Loop If]
                        if(I < SettingsListData.Length)
                        {
                            // End:0x33A
                            if(SettingsListData[I].Id == 2)
                            {
                                // End:0x33A
                                if(SettingsListData[I].bGreyed || SettingsListData[I].bDisabled)
                                {
                                    bDisabled = true;
                                    // [Explicit Break]
                                    goto J0x348;
                                }
                            }
                            ++I;
                            // [Loop Continue]
                            goto J0x290;
                        }
                    }
                }
                J0x348:

                // End:0x374
                if(bDisabled)
                {
                    SetLeftPanelImage(CurrentTabIdx, NoMapTexturePath);                    
                }
                else
                {
                    SetLeftPanelImage(CurrentTabIdx, GetMapImage(MyGRI.WinningMapName));
                }
            }            
        }
        else
        {
            // End:0x5A8
            if(int(CurrentTab.Type) == int(2))
            {
                // End:0x4B5
                if(int(MyGRI.CurrentState) == int(3))
                {
                    // End:0x477
                    if(SettingsListData[CurrentSelectionIdx].bDisabled || SettingsListData[CurrentSelectionIdx].bGreyed)
                    {
                        SetLeftPanelImage(CurrentTabIdx, NoMapTexturePath);                        
                    }
                    else
                    {
                        SetLeftPanelImage(CurrentTabIdx, MyGRI.MapImages[CurrentSelectionIdx]);
                    }                    
                }
                else
                {
                    // End:0x593
                    if(int(MyGRI.CurrentState) >= int(4))
                    {
                        // End:0x555
                        if((SettingsListData.Length > 0) && SettingsListData[0].bDisabled || SettingsListData[0].bGreyed)
                        {
                            SetLeftPanelImage(CurrentTabIdx, NoMapTexturePath);                            
                        }
                        else
                        {
                            SetLeftPanelImage(CurrentTabIdx, GetMapImage(MyGRI.WinningMapName));
                        }                        
                    }
                    else
                    {
                        SetLeftPanelImage(CurrentTabIdx, "");
                    }
                }
            }
        }
    }
    //return;    
}

function RenderSettingsList()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, RendererDataProvider;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PreferredPawnClassName;
    local /*0x97E50000-0x00000000*/ private int I, J;

    // End:0x24
    if(CurrentTab.ListMC == none)
    {
        return;
    }
    // End:0x90
    if(Tabs[CurrentTabIdx].DataProvider != none)
    {
        Tabs[CurrentTabIdx].DataProvider.SetArraySize(0);        
    }
    else
    {
        Tabs[CurrentTabIdx].DataProvider = Outer.CreateArray();
    }
    DataProvider = Tabs[CurrentTabIdx].DataProvider;
    // End:0x1B4
    if(int(CurrentTab.Type) == int(0))
    {
        PreferredPawnClassName = LPProfileSettings(LPPlayerController(Outer.GetPC()).ProfileSettings).GetPreferredPawnClass(int(MyPRI.GetTeamNum()));
    }
    I = 0;
    J0x1BF:

    // End:0xE11 [Loop If]
    if(I < SettingsListData.Length)
    {
        SettingsListData[I].PoolInfo = PopSettingsListObjectPool();
        SettingsListData[I].RowMC = SettingsListData[I].PoolInfo.MC;
        SettingsListData[I].RowMC.SetString("control", "");
        SettingsListData[I].RowMC.SetString("label", "");
        SettingsListData[I].RowMC.SetBool("bUpdateFromUnreal", false);
        SettingsListData[I].RowMC.SetBool("current", false);
        SettingsListData[I].RowMC.SetBool("isDisabled", false);
        SettingsListData[I].RowMC.SetBool("optionStepperGrayed", false);
        SettingsListData[I].RowMC.SetFloat("optIndex", 0.0000000);
        SettingsListData[I].RowMC.SetBool("bNumericCombo", false);
        SettingsListData[I].RowMC.SetObject("dataProvider", none);
        // End:0x57F
        if(int(CurrentTab.Type) == int(1))
        {
            SettingsListData[I].RowMC.SetString("control", "stepper");
        }
        SettingsListData[I].RowMC.SetString("label", SettingsListData[I].Label);
        SettingsListData[I].RowMC.SetBool("bUpdateFromUnreal", true);
        RendererDataProvider = SettingsListData[I].PoolInfo.RendererDataProvider;
        RendererDataProvider.SetArraySize(0);
        J = 0;
        J0x6A7:

        // End:0x7D4 [Loop If]
        if(J < SettingsListData[I].Values.Length)
        {
            // End:0x76C
            if(J < SettingsListData[I].ValueLabels.Length)
            {
                RendererDataProvider.SetElementString(J, SettingsListData[I].ValueLabels[J]);                
            }
            else
            {
                RendererDataProvider.SetElementString(J, string(SettingsListData[I].Values[J]));
            }
            J++;
            // [Loop Continue]
            goto J0x6A7;
        }
        // End:0x823
        if(SettingsListData[I].Values.Length == 0)
        {
            RendererDataProvider.SetElementString(0, "");
        }
        // End:0xA19
        if(int(CurrentTab.Type) == int(0))
        {
            // End:0x8B4
            if((I == 0) && PreferredPawnClassName == "")
            {
                SettingsListData[I].RowMC.SetBool("current", true);                
            }
            else
            {
                // End:0x983
                if(MyPRI.Team.TeamIndex == 0)
                {
                    SettingsListData[I].RowMC.SetBool("current", NevecSkins[SettingsListData[I].Id].ClassName ~= PreferredPawnClassName);                    
                }
                else
                {
                    SettingsListData[I].RowMC.SetBool("current", PirateSkins[SettingsListData[I].Id].ClassName ~= PreferredPawnClassName);
                }
            }            
        }
        else
        {
            // End:0xB0C
            if(int(CurrentTab.Type) == int(2))
            {
                SettingsListData[I].RowMC.SetBool("current", MyGRI.bMapVoteEnabled && MyGRI.MapNames[SettingsListData[I].Id].Name ~= MapVotedForName);
            }
        }
        // End:0xB82
        if(SettingsListData[I].bDisabled)
        {
            SettingsListData[I].RowMC.SetBool("isDisabled", true);            
        }
        else
        {
            // End:0xC01
            if(SettingsListData[I].bGreyed)
            {
                SettingsListData[I].RowMC.SetBool("optionStepperGrayed", true);                
            }
            else
            {
                SettingsListData[I].RowMC.SetBool("optionStepperGrayed", false);
            }
        }
        SettingsListData[I].RowMC.SetObject("dataProvider", RendererDataProvider);
        SettingsListData[I].RowMC.SetFloat("optIndex", float(SettingsListData[I].Index));
        SettingsListData[I].RowMC.SetBool("bNumericCombo", ((SettingsListData[I].Index < SettingsListData[I].ValueLabels.Length) ? true : false));
        DataProvider.SetElementObject(I, SettingsListData[I].RowMC);
        I++;
        // [Loop Continue]
        goto J0x1BF;
    }
    I = SettingsListData.Length - 1;
    J0xE28:

    // End:0xE75 [Loop If]
    if(I >= 0)
    {
        PushSettingsListObjectPool(SettingsListData[I].PoolInfo);
        I--;
        // [Loop Continue]
        goto J0xE28;
    }
    CurrentTab.ListMC.SetObject("dataProvider", none);
    CurrentTab.ListMC.SetString("wrapping", ((SettingsListData.Length > 0) ? "wrap" : "normal"));
    CurrentTab.ListMC.SetObject("dataProvider", DataProvider);
    CurrentTab.ListMC.SetFloat("selectedIndex", float(CurrentSelectionIdx));
    //return;    
}

function ReadGameSettings()
{
    local /*0x97E50000-0x00000000*/ private int I, J;

    I = 0;
    J0x0B:

    // End:0x8F9 [Loop If]
    if(I < SettingsListData.Length)
    {
        switch(SettingsListData[I].Id)
        {
            // End:0x149
            case 8:
                // End:0x146
                if(MyGRI.AtmosphereState != SettingsListData[I].Values[SettingsListData[I].Index])
                {
                    SettingsListData[I].Index = Max(SettingsListData[I].Values.Find(MyGRI.AtmosphereState));
                    0                    
                    bIsDirty = true;
                }
                // End:0x8EB
                break;
            // End:0x243
            case 3:
                // End:0x240
                if(int(MyGRI.MatchGameDifficultySetting) != SettingsListData[I].Values[SettingsListData[I].Index])
                {
                    SettingsListData[I].Index = Max(SettingsListData[I].Values.Find(int(MyGRI.MatchGameDifficultySetting)));
                    0                    
                    bIsDirty = true;
                }
                // End:0x8EB
                break;
            // End:0x312
            case 4:
                // End:0x30F
                if(int(MyGRI.bAllowFriendlyFireSetting) != SettingsListData[I].Values[SettingsListData[I].Index])
                {
                    SettingsListData[I].Index = int(MyGRI.bAllowFriendlyFireSetting);
                    bIsDirty = true;
                }
                // End:0x8EB
                break;
            // End:0x606
            case 2:
                // End:0x496
                if(MyGRI.WinningMapName != SettingsListData[I].ValueLabels[SettingsListData[I].Index])
                {
                    J = 0;
                    J0x392:

                    // End:0x48A [Loop If]
                    if(J < MyGRI.NumMaps)
                    {
                        // End:0x47C
                        if(MyGRI.MapNames[J].Name ~= MyGRI.WinningMapName)
                        {
                            SettingsListData[I].Index = Max(SettingsListData[I].Values.Find(J));
                            0                            
                            // [Explicit Break]
                            goto J0x48A;
                        }
                        J++;
                        // [Loop Continue]
                        goto J0x392;
                    }
                    J0x48A:

                    bIsDirty = true;
                }
                // End:0x603
                if(SettingsListData[I].Index >= 0)
                {
                    // End:0x5A4
                    if(!DLCMan.AllPlayersHaveRequiredDLC(MyGRI.MapNames[SettingsListData[I].Index].RequiredDLCs))
                    {
                        // End:0x5A1
                        if(!SettingsListData[I].bGreyed)
                        {
                            SettingsListData[I].bGreyed = true;
                            bIsDirty = true;
                        }                        
                    }
                    else
                    {
                        // End:0x603
                        if(SettingsListData[I].bGreyed)
                        {
                            SettingsListData[I].bGreyed = false;
                            bIsDirty = true;
                        }
                    }
                }
                // End:0x8EB
                break;
            // End:0x6FC
            case 5:
                // End:0x6F9
                if(MyGRI.RoundsToWinSetting != SettingsListData[I].Values[SettingsListData[I].Index])
                {
                    SettingsListData[I].Index = Max(SettingsListData[I].Values.Find(MyGRI.RoundsToWinSetting));
                    0                    
                    bIsDirty = true;
                }
                // End:0x8EB
                break;
            // End:0x7F2
            case 6:
                // End:0x7EF
                if(MyGRI.ScoreLimitSetting != SettingsListData[I].Values[SettingsListData[I].Index])
                {
                    SettingsListData[I].Index = Max(SettingsListData[I].Values.Find(MyGRI.ScoreLimitSetting));
                    0                    
                    bIsDirty = true;
                }
                // End:0x8EB
                break;
            // End:0x8E8
            case 7:
                // End:0x8E5
                if(MyGRI.TimeLimitSetting != SettingsListData[I].Values[SettingsListData[I].Index])
                {
                    SettingsListData[I].Index = Max(SettingsListData[I].Values.Find(MyGRI.TimeLimitSetting));
                    0                    
                    bIsDirty = true;
                }
                // End:0x8EB
                break;
            // End:0xFFFF
            default:
                break;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function WriteGameSettings()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185], bForceUpdateOnline, bUpdateOnlineGame;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL RowData;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x13
    if(!bIsHost)
    {
        return;
    }
    I = 0;
    J0x1E:

    // End:0x751 [Loop If]
    if(I < SettingsListData.Length)
    {
        RowData = SettingsListData[I];
        switch(RowData.Id)
        {
            // End:0x150
            case 8:
                // End:0x14D
                if(bForce || MyGRI.AtmosphereState != RowData.Values[RowData.Index])
                {
                    MyGRI.SetAtmosphereState(RowData.Values[RowData.Index]);
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0x2AD
            case 2:
                // End:0x2AA
                if(bForce || MyGRI.WinningMapName != MyGRI.MapNames[RowData.Values[RowData.Index]].Name)
                {
                    // End:0x29E
                    if(MyGRI.SubmitMapSelectionByName(MyGRI.MapNames[RowData.Values[RowData.Index]].Name))
                    {
                        MyGRI.SubmitHostFinishedMapSelection();
                    }
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0x388
            case 3:
                // End:0x385
                if(bForce || int(MyGRI.MatchGameDifficultySetting) != RowData.Values[RowData.Index])
                {
                    MyGRI.SetMatchGameDifficulty(byte(RowData.Values[RowData.Index]));
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0x49E
            case 4:
                // End:0x49B
                if(bForce || int(MyGRI.bAllowFriendlyFireSetting) != RowData.Values[RowData.Index])
                {
                    switch(RowData.Values[RowData.Index])
                    {
                        // End:0x465
                        case 0:
                            MyGRI.SetAllowFriendlyFire(false);
                            // End:0x48F
                            break;
                        // End:0x48C
                        case 1:
                            MyGRI.SetAllowFriendlyFire(true);
                            // End:0x48F
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0x575
            case 5:
                // End:0x572
                if(bForce || MyGRI.RoundsToWinSetting != RowData.Values[RowData.Index])
                {
                    MyGRI.SetRoundsToWin(RowData.Values[RowData.Index]);
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0x64C
            case 6:
                // End:0x649
                if(bForce || MyGRI.ScoreLimitSetting != RowData.Values[RowData.Index])
                {
                    MyGRI.SetScoreLimit(RowData.Values[RowData.Index]);
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0x723
            case 7:
                // End:0x720
                if(bForce || MyGRI.TimeLimitSetting != RowData.Values[RowData.Index])
                {
                    MyGRI.SetTimeLimit(RowData.Values[RowData.Index]);
                    bUpdateOnlineGame = true;
                }
                // End:0x726
                break;
            // End:0xFFFF
            default:
                break;
        }
        SettingsListData[I] = RowData;
        I++;
        // [Loop Continue]
        goto J0x1E;
    }
    // End:0x81F
    if(bUpdateOnlineGame)
    {
        // End:0x7C8
        if(bForceUpdateOnline || Class'Engine.WorldInfo'.static.GetWorldInfo().RealTimeSeconds > (LastOnlineUpdate + OnlineUpdateCooldown))
        {
            UpdateOnlineGame();            
        }
        else
        {
            Outer.GetLP().Actor.SetTimer(OnlineUpdateCooldown, false, 'UpdateOnlineGame', self);
        }
    }
    //return;    
}

function Update()
{
    // End:0x34
    if(int(CurrentTab.Type) == int(1))
    {
        UpdateGameSettings();        
    }
    else
    {
        // End:0x65
        if(int(CurrentTab.Type) == int(2))
        {
            UpdateMapVote();
        }
    }
    //return;    
}

function UpdateGameSettings()
{
    local /*0x97E50000-0x00000000*/ private bool bForceWrite;

    // End:0x152
    if(bIsHost)
    {
        bForceWrite = false;
        // End:0x13D
        if((CanChangeGameType()) && int(MyGRI.GameTypeSetting) != SettingsListData[0].Values[SettingsListData[0].Index])
        {
            BuildGameSettingsList(byte(SettingsListData[0].Values[SettingsListData[0].Index]));
            MyGRI.SetGameTypeSetting(byte(SettingsListData[0].Values[SettingsListData[0].Index]));
            bForceWrite = true;
        }
        WriteGameSettings(bForceWrite);
    }
    // End:0x1EB
    if((CanChangeGameType()) && int(MyGRI.GameTypeSetting) != SettingsListData[0].Values[SettingsListData[0].Index])
    {
        BuildGameSettingsList(MyGRI.GameTypeSetting);
    }
    ReadGameSettings();
    //return;    
}

function UpdateGameTypeString()
{
    ASSetGameTypeText(GetLocalizedString([GameTypeData.Values.Find(int(MyGRI.GameTypeSetting))], GameTypeData.ValueLabels));
    //return;    
}

function UpdateMapVote()
{
    // End:0x52
    if(int(MyGRI.CurrentState) == int(2))
    {
        // End:0x4F
        if(SettingsListData.Length > 0)
        {
            ClearSettingsListData();
            bIsDirty = true;
        }        
    }
    else
    {
        // End:0xD3
        if(int(MyGRI.CurrentState) == int(3))
        {
            // End:0xBC
            if(MyGRI.bMapVoteEnabled && SettingsListData.Length == 0)
            {
                BuildMapVoteList();                
            }
            else
            {
                // End:0xD3
                if(ShouldRebuildMapVoteList())
                {
                    BuildMapVoteList();
                }
            }
        }
    }
    // End:0xEA
    if(bIsDirty)
    {
        RenderImage();
    }
    //return;    
}

function UpdateOnlineGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, GameSettings;

    MyGameInfo.UpdateOnlineGame();
    LastOnlineUpdate = Class'Engine.WorldInfo'.static.GetWorldInfo().RealTimeSeconds;
    Outer.GetLP().Actor.ClearTimer('UpdateOnlineGame', self);
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    GameSettings = LPOnlineGameSettings(MPManager.GetDataStoreGameSettings().GetCurrentGameSettings());
    // End:0x1A7
    if((MPManager != none) && GameSettings != none)
    {
        // End:0x1A7
        if(GameSettings.GetGameType() == 2)
        {
            MyGRI.SetTimeLimit(GameSettings.GetTimeLimit());
        }
    }
    //return;    
}

function GetMapImage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xB7 [Loop If]
    if(I < MyGRI.NumMaps)
    {
        // End:0xA9
        if(MyGRI.MapNames[I].Name ~= MapName)
        {
            return MyGRI.MapImages[I];
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return "";
    //return ReturnValue;    
}

function SetLeftPanelImage()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImagePath[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UILoader;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImageSourcePath;

    UILoader = ASGetLeftPanelImageLoader(Tab);
    // End:0x101
    if(UILoader != none)
    {
        // End:0xDA
        if(ImagePath != "")
        {
            // End:0xB0
            if(DynamicLoadObject(ImagePath, Class'Engine.Texture2D') != none)
            {
                ImageSourcePath = "img://" $ ImagePath;
                UILoader.SetString("source", ImageSourcePath);                
            }
            else
            {
                UILoader.ActionScriptVoid("unload");
            }            
        }
        else
        {
            UILoader.ActionScriptVoid("unload");
        }
    }
    //return;    
}

function SetSelectedCharacter()
{
    local /*0x97E50000-0x00000000*/ private int CharacterIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPProfile;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x287
    if(LPPC != none)
    {
        LPProfile = LPProfileSettings(LPPC.ProfileSettings);
        // End:0x287
        if(LPProfile != none)
        {
            // End:0x152
            if(MyPRI.Team.TeamIndex == 0)
            {
                LPProfile.SetPreferredPawnClass(MyPRI.Team.TeamIndex, NevecSkins[SettingsListData[CurrentSelectionIdx].Id].ClassName);                
            }
            else
            {
                LPProfile.SetPreferredPawnClass(MyPRI.Team.TeamIndex, PirateSkins[SettingsListData[CurrentSelectionIdx].Id].ClassName);
            }
            LPProfile.SetModified(true);
            LPPC.ServerSetPlayerPreferences(LPProfile.GetPreferredPawnClass(0), LPProfile.GetPreferredPawnClass(1));
            UpdateCharSelectIndex();
            bIsDirty = true;
            NotifyInvalidCharSelection();
        }
    }
    //return;    
}

function ASGetLeftPanelImageLoader()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return RootMC.ActionScriptObject("getLeftPanelImageLoader");
    //return ReturnValue;    
}

function ASSetNumTabs()
{
    local /*0x97E50000-0x00000000*/ private int tabIdx[8388609];

    //return;    
}

function ASSetLeftPanelLayoutType()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string layoutType[8388609];

    //return;    
}

function ASSetLeftPanelImage()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImageName[8388609];

    RootMC.ActionScriptVoid("setLeftPanelImage");
    //return;    
}

function ASSetLeftPanelSkinTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];

    RootMC.ActionScriptVoid("setLeftPanelSkinTeam");
    //return;    
}

function ASSetLeftPanelFocusedTab()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609];

    RootMC.ActionScriptVoid("setLeftPanelFocusedTab");
    //return;    
}

function ASSetLeftPanelNumFields()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609], Num;

    RootMC.ActionScriptVoid("setLeftPanelNumFields");
    //return;    
}

function ASSetTabText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Tab1[8388609], Tab2, Tab3;

    RootMC.ActionScriptVoid("setTabText");
    //return;    
}

function ASSetMPLobbyButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string A[8388609], B, X, Y;

    RootMC.ActionScriptVoid("setMPLobbyButtonText");
    //return;    
}

function ASSetKitSelectionButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string A[8388609], B, X, Y;

    RootMC.ActionScriptVoid("setKitSelectionButtonText");
    //return;    
}

function ASSetTeamSelectionButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string A[8388609], B, X, Y;

    RootMC.ActionScriptVoid("setTeamSelectionButtonText");
    //return;    
}

function ASSetGameTypeText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    RootMC.ActionScriptVoid("setMatchTypeText");
    //return;    
}

function ASSetMatchSummaryText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    RootMC.ActionScriptVoid("setMatchSummaryText");
    //return;    
}

function ASSetSelectVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    RootMC.ActionScriptVoid("setSelectLabelVisible");
    //return;    
}

function ASSetVisibility()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obj[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = Obj.GetDisplayInfo();
    DI.Visible = bVisible;
    Obj.SetDisplayInfo(DI);
    //return;    
}

function ASbEnableLeftPanelTabs()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsEnabled[8388609];

    RootMC.ActionScriptVoid("bEnableLeftPanelTabs");
    //return;    
}

function ShowLobbyMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[9437185];
    local /*0x97E50000-0x00000000*/ private int MessageVal[9437185];

    ""
    -1
    // End:0x59
    if(LoadoutMC != none)
    {
        LoadoutMC.ShowLobbyMessage(bShow, Message, MessageVal);
    }
    //return;    
}

defaultproperties
{
    SkinChooserTabLabel="CHARACTER SELECT"
    NevecSkins=/* Array type was not detected. */
    PirateSkins=/* Array type was not detected. */
    GameSettingsTabLabel="MATCH SETTINGS"
    GameTypeData=(Id=1,Index=0,Label="<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.GameTypeDataLabel>",ValueLabels=/* Array type was not detected. */,Values=/* Array type was not detected. */)
    GameTypeSettings=/* Array type was not detected. */
    MapAtmosphereStateLabel="Environment State"
    MapSelectLabel="Map"
    MapVoteTabLabel="MAP VOTE"
    LoadoutKitTabLabel="KIT CONFIGURATION"
    OnlineUpdateCooldown=3.0000000
    NoMapTexturePath="MPLobbyImages.NoMap"
}