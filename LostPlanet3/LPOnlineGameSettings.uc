class LPOnlineGameSettings extends SPOnlineGameSettings
    config(Game);

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

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OnlineGameSettingsParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ScenarioGameSettingsParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExtractionGameSettingsParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamDeathmatchGameSettingsParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SurvivalGameSettingsParams;

function GetAllowFriendlyFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Value;

    // End:0x52
    if(!HasProperty(268435466) || !GetIntProperty(268435466, Value))
    {
        SetAllowFriendlyFire(bAllowFriendlyFire);
        return bAllowFriendlyFire;
    }
    return bool(Value);
    //return ReturnValue;    
}

function SetAllowFriendlyFire()
{
    local /*0x97E50000-0x00000000*/ private bool Value[8388609];

    super.SetAllowFriendlyFire(Value);
    SetIntProperty(268435466, int(Value));
    //return;    
}

function GetAtmosphereState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return OnlineGameSettingsParams.GetAtmosphereState();
    //return ReturnValue;    
}

function SetAtmosphereState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Value[8388609];

    OnlineGameSettingsParams.SetAtmosphereState(Value);
    //return;    
}

function GetAvailableTeamSize()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x48
    if(!HasProperty(268435478) || !GetIntProperty(268435478, Value))
    {
        SetAvailableTeamSize(-1);
        return -1;
    }
    return Value;
    //return ReturnValue;    
}

function SetAvailableTeamSize()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    SetIntProperty(268435478, Value);
    //return;    
}

function GetAvgPlayerRank()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x48
    if(!HasProperty(268435479) || !GetIntProperty(268435479, Value))
    {
        SetAvgPlayerRank(-1);
        return -1;
    }
    return Value;
    //return ReturnValue;    
}

function SetAvgPlayerRank()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    SetIntProperty(268435479, Value);
    //return;    
}

function GetGameType()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x51
    if(!HasProperty(268435475) || !GetIntProperty(268435475, Value))
    {
        SetGameType(GameType, true);
        return GameType;
    }
    return Value;
    //return ReturnValue;    
}

function SetGameType()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNoDLCCalc[9437185];

    false
    super.SetGameType(Value);
    SetIntProperty(268435475, Value);
    // End:0x4A
    if(!bNoDLCCalc)
    {
        CalculateInstalledDLC();
    }
    //return;    
}

function GetInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return StaticGetInviteMode(self);
    //return ReturnValue;    
}

static function StaticGetInviteMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL OGS[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Value;

    // End:0x75
    if(!OGS.HasProperty(268435476) || !OGS.GetIntProperty(268435476, Value))
    {
        StaticSetInviteMode(OGS, 3);
        return 3;
    }
    return byte(Value);
    //return ReturnValue;    
}

function SetInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];

    StaticSetInviteMode(self, Mode);
    //return;    
}

static function StaticSetInviteMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL OGS[8388609];
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];
    local /*0x97E50000-0x00000000*/ private int OriginalValue;

    // End:0x6C
    if(!OGS.HasProperty(268435476) || !OGS.GetIntProperty(268435476, OriginalValue))
    {
        OriginalValue = -1;
    }
    OGS.SetIntProperty(268435476, int(Mode));
    // End:0x1D5
    if(int(Mode) > int(0))
    {
        OGS.bAllowJoinViaPresence = true;
        OGS.bAllowJoinViaPresenceFriendsOnly = true;
        // End:0x1D2
        if((OriginalValue >= 0) && int(byte(OriginalValue)) == int(0))
        {
            OGS.NumOpenPublicConnections = OGS.NumOpenPrivateConnections;
            OGS.NumOpenPrivateConnections = 0;
            OGS.NumPublicConnections = OGS.NumPrivateConnections;
            OGS.NumPrivateConnections = 0;
        }        
    }
    else
    {
        OGS.bAllowJoinViaPresence = false;
        OGS.bAllowJoinViaPresenceFriendsOnly = false;
        // End:0x2F8
        if((OriginalValue >= 0) && int(byte(OriginalValue)) > int(0))
        {
            OGS.NumOpenPrivateConnections = OGS.NumOpenPublicConnections;
            OGS.NumOpenPublicConnections = 0;
            OGS.NumPrivateConnections = OGS.NumPublicConnections;
            OGS.NumPublicConnections = 0;
        }
    }
    //return;    
}

function GetMapName()
{
    local /*0x97E50000-0x00000000*/ private bool bNoDLCCalc[9437185];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Value;
    local /*0x97E50000-0x00000000*/ private editfixedsize string StrValue;

    // End:0x52
    if(!HasProperty(268435467) || !GetIntProperty(268435467, Value))
    {
        SetMapName(MapName, true);
        return MapName;
    }
    // End:0xAE
    if((Value < 0) || Value >= Class'LPMPMapList'.default.HostMapList.Length)
    {
        SetMapName(MapName, true);
        return MapName;
    }
    StrValue = Class'LPMPMapList'.default.HostMapList[Value].MapName;
    return name(StrValue);
    //return ReturnValue;    
}

function SetMapName()
{
    local /*0x97E50000-0x00000000*/ private name Value[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNoDLCCalc[9437185];
    local /*0x97E50000-0x00000000*/ private int IntValue;

    super.SetMapName(Value);
    IntValue = Class'LPMPMapList'.default.HostMapList.Find('MapName', string(Value));    
    SetIntProperty(268435467, IntValue);
    // End:0x86
    if(!bNoDLCCalc)
    {
        CalculateRequiredDLC();
    }
    //return;    
}

function GetMatchGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Value;

    // End:0x7C
    if(!HasProperty(268435468) || !GetIntProperty(268435468, Value))
    {
        SetMatchGameDifficulty(OnlineGameSettingsParams.GetMatchGameDifficulty());
        return OnlineGameSettingsParams.GetMatchGameDifficulty();
    }
    // End:0xD4
    if(Value < 0)
    {
        SetMatchGameDifficulty(OnlineGameSettingsParams.GetMatchGameDifficulty());
        return OnlineGameSettingsParams.GetMatchGameDifficulty();
    }
    return byte(Value);
    //return ReturnValue;    
}

function SetMatchGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];

    OnlineGameSettingsParams.SetMatchGameDifficulty(Value);
    SetIntProperty(268435468, int(Value));
    //return;    
}

function GetMatchState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return StaticGetMatchState(self);
    //return ReturnValue;    
}

static function StaticGetMatchState()
{
    local /*0x97E50000-0x00000000*/ private @NULL OGS[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Value;

    // End:0x60
    if(!OGS.HasProperty(268435472) || !OGS.GetIntProperty(268435472, Value))
    {
        return 3;
    }
    return byte(Value);
    //return ReturnValue;    
}

function SetMatchState()
{
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];

    StaticSetMatchState(self, Value);
    //return;    
}

static function StaticSetMatchState()
{
    local /*0x97E50000-0x00000000*/ private @NULL OGS[8388609];
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];
    local /*0x97E50000-0x00000000*/ private int IntValue;

    IntValue = int(Value);
    OGS.SetIntProperty(268435472, IntValue);
    //return;    
}

function GetRequiredDLC()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x35
    if(!HasProperty(268435518) || !GetIntProperty(268435518, Value))
    {
        return 0;
    }
    return Value;
    //return ReturnValue;    
}

protected function SetRequiredDLC()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    SetIntProperty(268435518, Value);
    //return;    
}

protected function SetInstalledDLCs()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    SetIntProperty(268435519, Value);
    //return;    
}

function GetInstalledDLCs()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x35
    if(!HasProperty(268435519) || !GetIntProperty(268435519, Value))
    {
        return 0;
    }
    return Value;
    //return ReturnValue;    
}

function GetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x7C
    if(!HasProperty(268435469) || !GetIntProperty(268435469, Value))
    {
        SetRoundsToWin(OnlineGameSettingsParams.GetRoundsToWin());
        return OnlineGameSettingsParams.GetRoundsToWin();
    }
    // End:0xD4
    if(Value < 0)
    {
        SetRoundsToWin(OnlineGameSettingsParams.GetRoundsToWin());
        return OnlineGameSettingsParams.GetRoundsToWin();
    }
    return Value;
    //return ReturnValue;    
}

function SetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    OnlineGameSettingsParams.SetRoundsToWin(Value);
    SetIntProperty(268435469, Value);
    //return;    
}

function GetScoreLimit()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x50
    if(!HasProperty(268435470) || !GetIntProperty(268435470, Value))
    {
        SetScoreLimit(ScoreLimit);
        return ScoreLimit;
    }
    // End:0x7C
    if(Value < 0)
    {
        SetScoreLimit(ScoreLimit);
        return ScoreLimit;
    }
    return Value;
    //return ReturnValue;    
}

function SetScoreLimit()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    super.SetScoreLimit(Value);
    SetIntProperty(268435470, Value);
    //return;    
}

function GetScoreRemaining()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x39
    if(!HasProperty(268435473) || !GetIntProperty(268435473, Value))
    {
        return -1;
    }
    return Value;
    //return ReturnValue;    
}

function SetScoreRemaining()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    Value = ((Value >= -1) ? Value : -1);
    SetIntProperty(268435473, Value);
    //return;    
}

function GetSessionType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Value;

    // End:0x42
    if(!HasProperty(268435477) || !GetIntProperty(268435477, Value))
    {
        SetSessionType(0);
        return 0;
    }
    return byte(Value);
    //return ReturnValue;    
}

function SetSessionType()
{
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];

    SetIntProperty(268435477, int(Type));
    //return;    
}

function GetTimeLimit()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x50
    if(!HasProperty(268435471) || !GetIntProperty(268435471, Value))
    {
        SetTimeLimit(TimeLimit);
        return TimeLimit;
    }
    // End:0x7C
    if(Value < 0)
    {
        SetTimeLimit(TimeLimit);
        return TimeLimit;
    }
    return Value;
    //return ReturnValue;    
}

function SetTimeLimit()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    super.SetTimeLimit(Value);
    SetIntProperty(268435471, Value);
    //return;    
}

function GetTimeRemaining()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    // End:0x39
    if(!HasProperty(268435474) || !GetIntProperty(268435474, Value))
    {
        return -1;
    }
    return Value;
    //return ReturnValue;    
}

function SetTimeRemaining()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    Value = ((Value >= -1) ? Value : -1);
    SetIntProperty(268435474, Value);
    //return;    
}

function CalculateRequiredDLC()
{
    local /*0x97E50000-0x00000000*/ private int Value;

    Value = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetRequiredDLCIdForGameSettings(self);
    SetRequiredDLC(Value);
    CalculateInstalledDLC();
    //return;    
}

function CalculateInstalledDLC()
{
    local /*0x97E50000-0x00000000*/ private int Value;

    Value = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCIds();
    SetInstalledDLCs(Value);
    ScriptTrace();
    //return;    
}

function CopyGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private byte InviteMode, SessionType;

    InviteMode = GetInviteMode();
    SessionType = GetSessionType();
    TuneDataOnlineGameSettings = Other.TuneDataOnlineGameSettings;
    bInitializedFromTuneData = Other.bInitializedFromTuneData;
    SetupDefaultParametersBasedOnMapName(Other.GetMapName());
    NumPrivateConnections = Other.NumPrivateConnections;
    NumPublicConnections = Other.NumPublicConnections;
    bAllowJoinInProgress = Other.bAllowJoinInProgress;
    bAllowInvites = Other.bAllowInvites;
    bUsesPresence = Other.bUsesPresence;
    bAllowJoinViaPresence = Other.bAllowJoinViaPresence;
    bAllowJoinViaPresenceFriendsOnly = Other.bAllowJoinViaPresenceFriendsOnly;
    bUsesArbitration = Other.bUsesArbitration;
    UpdateProperties(Other.Properties, true);
    UpdateStringSettings(Other.LocalizedSettings, true);
    SetAllowFriendlyFire(Other.GetAllowFriendlyFire());
    SetAtmosphereState(Other.GetAtmosphereState());
    SetAvailableTeamSize(Other.GetAvailableTeamSize());
    SetAvgPlayerRank(Other.GetAvgPlayerRank());
    SetGameType(Other.GetGameType());
    SetMapName(Other.GetMapName());
    SetMatchGameDifficulty(Other.GetMatchGameDifficulty());
    SetMatchState(Other.GetMatchState());
    SetMaxPlayers(Other.GetMaxPlayers());
    SetRoundsToWin(Other.GetRoundsToWin());
    SetScoreLimit(Other.GetScoreLimit());
    SetTimeLimit(Other.GetTimeLimit());
    SetSessionType(SessionType);
    SetInviteMode(InviteMode);
    CalculateRequiredDLC();
    //return;    
}

simulated function CopyGameSettingsToBase()
{
    local /*0x97E50000-0x00000000*/ private @NULL Base[25165825];

    Base.CopyGameSettings(self);
    //return;    
}

simulated function SetupDefaultParametersFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609], P;

    P = LPTuneDataOnlineGameSettings(Params);
    // End:0xAD
    if(P != none)
    {
        SetMatchGameDifficulty(P.MatchGameDifficulty.Current);
        SetRoundsToWin(P.RoundsToWin.Current);
        bInitializedFromTuneData = true;
    }
    super.SetupDefaultParametersFromTuneData(Params);
    CalculateRequiredDLC();
    //return;    
}

simulated function SetupDefaultParametersBasedOnMapName()
{
    local /*0x97E50000-0x00000000*/ private name theMapName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    SetMapName(theMapName);
    return super.SetupDefaultParametersBasedOnMapName(theMapName);
    //return ReturnValue;    
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

simulated function SetupCommandLineDefaults()
{
    local /*0x97E50000-0x00000000*/ private name theMapName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameInterface, MPManager, DataStore, NewGameSettings, CurGameSettings;

    local /*0x97E50000-0x00000000*/ private editfixedsize string CLIArgs, GameOption;

    GameInterface = GetGameInterface();
    DataStore = GetDataStoreGameSettings();
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    CurGameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(MPManager.SessionNameGame));
    CLIArgs = "?" $ Class'Engine.SPObject'.static.AppCmdLine();
    GameOption = Class'Engine.GameInfo'.static.ParseOption(CLIArgs, "Game");
    // End:0x145
    if(InStr(GameOption, " ") > 0)
    {
        GameOption = Left(GameOption, InStr(GameOption, " "));
    }
    switch(GameOption)
    {
        // End:0x18C
        case "EXTR":
            DataStore.SetCurrentByName('ExtractionLAN');
            // End:0x22C
            break;
        // End:0x1C0
        case "SCEN":
            DataStore.SetCurrentByName('ScenarioLAN');
            // End:0x22C
            break;
        // End:0x1F3
        case "TDM":
            DataStore.SetCurrentByName('TeamDeathmatchLAN');
            // End:0x22C
            break;
        // End:0x227
        case "SURV":
            DataStore.SetCurrentByName('SurvivalLAN');
            // End:0x22C
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    NewGameSettings = LPOnlineGameSettings(DataStore.GetCurrentGameSettings());
    NewGameSettings.SetupDefaultParametersBasedOnMapName(theMapName);
    NewGameSettings.CopyGameSettingsToBase(CurGameSettings);
    MPManager.UpdateGameSettings(CurGameSettings);
    //return;    
}

defaultproperties
{
    // Reference: LPOnlineGameSettingsParams'Default__LPOnlineGameSettings.OnlineGameSettingsParams0'
    begin object name=OnlineGameSettingsParams0 class=Class'LPOnlineGameSettingsParams'
    end object
    OnlineGameSettingsParams=OnlineGameSettingsParams0
    // Reference: LPScenarioGameSettingsParams'Default__LPOnlineGameSettings.ScenarioGameSettingsParams0'
    begin object name=ScenarioGameSettingsParams0 class=Class'LPScenarioGameSettingsParams'
    end object
    ScenarioGameSettingsParams=ScenarioGameSettingsParams0
    // Reference: LPExtractionGameSettingsParams'Default__LPOnlineGameSettings.ExtractionGameSettingsParams0'
    begin object name=ExtractionGameSettingsParams0 class=Class'LPExtractionGameSettingsParams'
    end object
    ExtractionGameSettingsParams=ExtractionGameSettingsParams0
    // Reference: LPTeamDeathmatchGameSettingsParams'Default__LPOnlineGameSettings.TeamDeathmatchGameSettingsParams0'
    begin object name=TeamDeathmatchGameSettingsParams0 class=Class'LPTeamDeathmatchGameSettingsParams'
    end object
    TeamDeathmatchGameSettingsParams=TeamDeathmatchGameSettingsParams0
    // Reference: LPSurvivalGameSettingsParams'Default__LPOnlineGameSettings.SurvivalGameSettingsParams0'
    begin object name=SurvivalGameSettingsParams0 class=Class'LPSurvivalGameSettingsParams'
    end object
    SurvivalGameSettingsParams=SurvivalGameSettingsParams0
    ScoreLimit=-1
    TimeLimit=-1
    NumPublicConnections=10
    bUsesPresence=false
    bAllowJoinViaPresence=false
    LocalizedSettings=/* Array type was not detected. */
    Properties=/* Array type was not detected. */
    LocalizedSettingsMappings=/* Array type was not detected. */
    PropertyMappings=/* Array type was not detected. */
}