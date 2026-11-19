class LPMultiplayerManager extends Object
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

struct native VoiceChatInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UniqueId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VoiceMuteList;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VoicePacketFilter;

    structdefaultproperties
    {
        UniqueId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        VoiceMuteList=none
        VoicePacketFilter=none
    }
};

struct native MPTimerData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoop;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FuncName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Count;

    structdefaultproperties
    {
        bLoop=false
        FuncName="None"
        Rate=0.0000000
        Count=0.0000000
    }
};

struct native InviteInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasDeferredInvite;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ControllerId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InviteResult;

    structdefaultproperties
    {
        bHasDeferredInvite=false
        ControllerId=0
        InviteResult=(GameSettings=none)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000080*/ private @NULL VfTable_FTickableObject[268566529];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAcceptedInvite;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowHostMigration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChooseOptimalHost[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableBeacons[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGroupPartyMembers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsQuickMatch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsMatchmaking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInProgress;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsCancelPending;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsTraveling;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitForPendingBandwidthTests[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRenderingSuspended;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasNextSessionToJoin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNextSessionUsePartyReservation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool PS3Invitation_bSkipStorageSelect_Original;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsJoining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReturningFromDestroyingParty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeferredInviteInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClientPartyBeacon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ClientPartyBeaconClassName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClientReservationBeacon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ClientReservationBeaconClassName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClientBandwidthTestBeacon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ClientBandwidthTestBeaconClassName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GameInterface;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HostPartyBeacon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HostPartyBeaconClassName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HostReservationBeacon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HostReservationBeaconClassName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HostBandwidthTestBeacon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HostBandwidthTestBeaconClassName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxBandwidthHistoryAgeMinutes[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinBandwidthHistoryEntries[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OwningControllerIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrevControllerIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OwningNetId;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte OnlineMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PartyOwnerInviteMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OptimalHostConnectingPlayers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OptimalHostPlayerId;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartyOwnerNetId;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartyOwnerSession;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerInterface;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FriendToJoin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SessionNameParty[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SessionNameGame[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SessionToJoin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SessionToJoinNext;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int UpstreamBandwidthTestSize[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FindGameTimeout[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SearchWaitTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float JoinFinalizeTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HostFinalizeTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MeshFinalizeTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OptimalHostWaitTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GameDeleteWaitTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxPing[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTeams[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentQuickMatchResult;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentQuickMatchStage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array QuickMatchSearchResults;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerRankRangeEqual[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerRankRangeStrict[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerRankRangeLiberal[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PresenceKeyNames[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LocallyInitiatedVoiceMuteList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VoiceChatInfoList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Timers[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ConnectionErrorCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PS3Invitation_ControllerId_Original;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PS3Invitation_InviteResult_Original;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DLCIdFilter;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnCreateGameComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnDisbandPartyRequestComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnFindOnlineGamesComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnJoinGameComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnJoinRequestComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnJoinTravelFailed__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnLeavePartyRequestComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnQuickMatchComplete__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnQuickMatchUpdate__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __PendingTravelFunc__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnDestroyDualPartySeesion__Delegate[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __QuickMatchResultsSortFunc__Delegate;

delegate OnCreateGameComplete()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

delegate OnDisbandPartyRequestComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasDisbanded[8388609];

    //return;    
}

delegate OnFindOnlineGamesComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8519681];

    //return;    
}

delegate OnJoinGameComplete()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

delegate OnJoinRequestComplete()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];

    //return;    
}

delegate OnJoinTravelFailed()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];

    //return;    
}

delegate OnLeavePartyRequestComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

delegate OnQuickMatchComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

delegate OnQuickMatchUpdate()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    //return;    
}

delegate PendingTravelFunc()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnDestroyDualPartySeesion()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

// Export ULPMultiplayerManager::execGetInstance(FFrame&, void* const)
native static function GetInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPMultiplayerManager::execDestroy(FFrame&, void* const)
native static function Destroy();

// Export ULPMultiplayerManager::execSetTimer(FFrame&, void* const)
native final function SetTimer()
{
    local /*0x97E50000-0x00000000*/ private float InRate[8388609];
    local /*0x97E50000-0x00000000*/ private bool inbLoop[9437185];
    local /*0x97E50000-0x00000000*/ private name inTimerFunc[9437185];

    'Timer'                    
}

// Export ULPMultiplayerManager::execClearTimer(FFrame&, void* const)
native final function ClearTimer()
{
    local /*0x97E50000-0x00000000*/ private name inTimerFunc[9437185];

    'Timer'            
}

// Export ULPMultiplayerManager::execClearAllTimers(FFrame&, void* const)
native final function ClearAllTimers();

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

function GetDataStoreGameSearch()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreManager, DataStoreGameSearch;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x3A
    if(DataStoreManager == none)
    {
        return none;
    }
    DataStoreGameSearch = LPUIDataStore_OnlineGameSearch(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_OnlineGameSearch'.default.Tag));
    return DataStoreGameSearch;
    //return ReturnValue;    
}

function IsInGame()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;

    GameSettings = GetGameSettings();
    // End:0x25
    if(GameSettings == none)
    {
        return false;
    }
    // End:0x84
    if(!GameSettings.HasProperty(268435477) || !GameSettings.GetIntProperty(268435477, PropValue))
    {
        return false;
    }
    SessionType = byte(PropValue);
    return int(SessionType) != int(2);
    //return ReturnValue;    
}

function IsInParty()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;

    GameSettings = GetPartySettings();
    // End:0x25
    if(GameSettings == none)
    {
        return false;
    }
    // End:0x84
    if(!GameSettings.HasProperty(268435477) || !GameSettings.GetIntProperty(268435477, PropValue))
    {
        return false;
    }
    SessionType = byte(PropValue);
    return (int(SessionType) == int(2)) || (ClientPartyBeacon != none) && int(ClientPartyBeacon.ClientBeaconState) == int(2);
    //return ReturnValue;    
}

static function GetOnlineMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return GetInstance().OnlineMode;
    //return ReturnValue;    
}

function GetLPGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Settings;

    // End:0x5C
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        Settings = LPOnlineGameSettings(GameInterface.GetGameSettings(SessionNameGame));
    }
    return Settings;
    //return ReturnValue;    
}

function GetGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x22
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return none;
    }
    return GameInterface.GetGameSettings(SessionNameGame);
    //return ReturnValue;    
}

function GetNATType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x49
    if((OnlineSub == none) || EqualEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
    {
        return 1;
    }
    return OnlineSub.SystemInterface.GetNATType();
    //return ReturnValue;    
}

function SetOnlineMode()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];

    OnlineMode = Mode;
    // End:0x36
    if(int(Mode) == int(2))
    {
        bDisableBeacons = true;        
    }
    else
    {
        bDisableBeacons = Class'LPMultiplayerManager'.default.bDisableBeacons;
    }
    //return;    
}

function GetPartyRank()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;
    local /*0x97E50000-0x00000000*/ private int Sum, I;

    BuildPartyMembers(Members);
    Sum = 0;
    I = 0;
    J0x29:

    // End:0x80 [Loop If]
    if(I < Members.Length)
    {
        Sum += Members[I].Skill;
        I++;
        // [Loop Continue]
        goto J0x29;
    }
    // End:0x92
    if(Members.Length <= 0)
    {
        return 0;
    }
    return Sum / Members.Length;
    //return ReturnValue;    
}

function GetLPPartySettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Settings;

    // End:0x5C
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        Settings = LPOnlineGameSettings(GameInterface.GetGameSettings(SessionNameParty));
    }
    return Settings;
    //return ReturnValue;    
}

function GetPartySettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Settings;

    // End:0x53
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        Settings = GameInterface.GetGameSettings(SessionNameParty);
    }
    return Settings;
    //return ReturnValue;    
}

function GetPartySize()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;

    BuildPartyMembers(Members);
    return Members.Length;
    //return ReturnValue;    
}

function GetPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ReturnValue[92274689], Members;

    BuildPartyMembers(Members);
    return Members;
    //return ReturnValue;    
}

function GetVoiceStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL VoiceInterface, LP, PC, LPPC;

    LP = GetLocalPlayer(OwningControllerIndex);
    // End:0x55
    if((LP == none) || LP.Actor == none)
    {
        return 1;
    }
    PC = LP.Actor;
    VoiceInterface = PC.GetOnlineSubsystem().VoiceInterface;
    // End:0xE1
    if(EqualEqual_InterfaceInterface(VoiceInterface, OnlineVoiceInterface(none)))
    {
        return 1;        
    }
    else
    {
        LPPC = LPPlayerController(PC);
        // End:0x140
        if((LPPC != none) && LPPC.IsPlayerLocallyMuted(UniqueId))
        {
            return 3;            
        }
        else
        {
            // End:0x192
            if(VoiceInterface.IsMuted(byte(LP.ControllerId), UniqueId))
            {
                return 0;                
            }
            else
            {
                // End:0x23D
                if(OnlineSub.AreUniqueNetIdsEqual(PC.PlayerReplicationInfo.UniqueId, UniqueId))
                {
                    return ((VoiceInterface.IsLocalPlayerTalking(byte(LP.ControllerId))) ? 2 : 0);                    
                }
                else
                {
                    return ((VoiceInterface.IsRemotePlayerTalking(UniqueId)) ? 2 : 0);
                }
            }
        }
    }
    //return ReturnValue;    
}

// Export ULPMultiplayerManager::execFindVoiceChatInfoIndex(FFrame&, void* const)
native final function FindVoiceChatInfoIndex()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerID[25296897];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function CleanUpVoiceChatInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array CurrentPartyMembers;
    local /*0x97E50000-0x00000000*/ private int NumPartyMembers, PartyMemberIndex, VoiceChatInfoIndex;
    local /*0x97E50000-0x00000000*/ private bool bIsPartOfParty;

    // End:0x134
    if(IsInParty())
    {
        BuildPartyMembers(CurrentPartyMembers);
        NumPartyMembers = CurrentPartyMembers.Length;
        VoiceChatInfoIndex = 0;
        J0x3F:

        // End:0x131 [Loop If]
        if(VoiceChatInfoIndex < VoiceChatInfoList.Length)
        {
            bIsPartOfParty = false;
            PartyMemberIndex = 0;
            J0x6E:

            // End:0xFB [Loop If]
            if(PartyMemberIndex < NumPartyMembers)
            {
                // End:0xED
                if(EqualEqual_UniqueNetIdUniqueNetId(CurrentPartyMembers[PartyMemberIndex].NetId, VoiceChatInfoList[VoiceChatInfoIndex].UniqueId))
                {
                    bIsPartOfParty = true;
                    // [Explicit Break]
                    goto J0xFB;
                }
                PartyMemberIndex++;
                // [Loop Continue]
                goto J0x6E;
            }
            J0xFB:

            // End:0x123
            if(bIsPartOfParty == false)
            {
                VoiceChatInfoList.Remove(VoiceChatInfoIndex, 1);                                
            }
            else
            {
                VoiceChatInfoIndex++;
            }
            // [Loop Continue]
            goto J0x3F;
        }        
    }
    else
    {
        VoiceChatInfoList.Remove(0, VoiceChatInfoList.Length);        
    }
    //return;    
}

// Export ULPMultiplayerManager::execGetGameViewportClient(FFrame&, void* const)
native final function GetGameViewportClient()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPMultiplayerManager::execGetWorldInfo(FFrame&, void* const)
native function GetWorldInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

protected function GetLocalPlayer()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], GVP, LP;
    local /*0x97E50000-0x00000000*/ private int I;

    GVP = GetGameViewportClient();
    I = 0;
    J0x1F:

    // End:0xB6 [Loop If]
    if(I < 4)
    {
        LP = GVP.GetPlayerOwner(I);
        // End:0xA8
        if((LP != none) && LP.ControllerId == ControllerId)
        {
            return LP;
        }
        I++;
        // [Loop Continue]
        goto J0x1F;
    }
    return none;
    //return ReturnValue;    
}

protected function GetLocalPlayerController()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LP;

    LP = GetLocalPlayer(ControllerId);
    // End:0x4B
    if(LP != none)
    {
        return LP.Actor;
    }
    return none;
    //return ReturnValue;    
}

function GetUniqueNetId()
{
    local /*0x97E50000-0x00000000*/ private int InPlayerIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], NetId;

    // End:0x8F
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.GetUniquePlayerId(byte(InPlayerIndex), NetId);
    }
    return NetId;
    //return ReturnValue;    
}

event PostInitialize()
{
    local /*0x97E50000-0x00000000*/ private @NULL GVP, LP;

    // End:0x11
    if(OnlineSub == none)
    {
        return;
    }
    GameInterface = OnlineSub.GameInterface;
    PlayerInterface = OnlineSub.PlayerInterface;
    // End:0x81
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
    }
    // End:0xA1
    if(EqualEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
    {
    }
    // End:0x1E2
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        GameInterface.AddMigrateOnlineGameCompleteDelegate(OnMigrateOnlineGameComplete);
        // End:0x1E2
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            GameInterface.AddGameInviteAcceptedDelegate(0, OnGameInviteAcceptedID0);
            GameInterface.AddGameInviteAcceptedDelegate(1, OnGameInviteAcceptedID1);
            GameInterface.AddGameInviteAcceptedDelegate(2, OnGameInviteAcceptedID2);
            GameInterface.AddGameInviteAcceptedDelegate(3, OnGameInviteAcceptedID3);
        }
    }
    // End:0x1F2
    if(bDisableBeacons)
    {        
    }
    else
    {
        // End:0x1FF
        if(bAllowHostMigration)
        {
        }
        // End:0x20C
        if(bChooseOptimalHost)
        {
        }
    }
    GVP = GetGameViewportClient();
    LP = GVP.GetPlayerOwner(0);
    OwningControllerIndex = LP.ControllerId;
    OwningNetId = GetUniqueNetId(LP.ControllerId);
    PrevControllerIndex = -1;
    //return;    
}

protected event PostDestroy()
{
    // End:0x141
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        GameInterface.ClearMigrateOnlineGameCompleteDelegate(OnMigrateOnlineGameComplete);
        // End:0x141
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            GameInterface.ClearGameInviteAcceptedDelegate(0, OnGameInviteAcceptedID0);
            GameInterface.ClearGameInviteAcceptedDelegate(1, OnGameInviteAcceptedID1);
            GameInterface.ClearGameInviteAcceptedDelegate(2, OnGameInviteAcceptedID2);
            GameInterface.ClearGameInviteAcceptedDelegate(3, OnGameInviteAcceptedID3);
        }
    }
    ClearAllTimers();
    CancelAll();
    DestroyAllClientBeacons();
    DestroyAllHostBeacons();
    DestroyOnlineGame();
    DestroyOnlineParty();
    ClearDelegates();
    ResetDLCFilter();
    //return;    
}

function ClearDelegates()
{
    __OnCreateGameComplete__Delegate = None;
    __OnDisbandPartyRequestComplete__Delegate = None;
    __OnFindOnlineGamesComplete__Delegate = None;
    __OnJoinGameComplete__Delegate = None;
    __OnJoinRequestComplete__Delegate = None;
    __OnJoinTravelFailed__Delegate = None;
    __OnLeavePartyRequestComplete__Delegate = None;
    __OnQuickMatchComplete__Delegate = None;
    __OnQuickMatchUpdate__Delegate = None;
    __PendingTravelFunc__Delegate = None;
    //return;    
}

function CancelAll()
{
    CancelFindOnlineGames();
    CancelJoinGame();
    CancelJoinParty();
    CancelHostGame();
    //return;    
}

function SetPlayerOnlineStatus()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609], NewStatus;
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, LPGameSettings;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalProperties, LocalSettings;
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x443
    if(ControllerId == OwningControllerIndex)
    {
        GameSettings = GetGameSettings();
        // End:0xC0
        if(((LastStatus != NewStatus) && NewStatus == 3) && !Class'Engine.WorldInfo'.static.IsConsoleBuild())
        {
            PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
            PC.ClientStartNetworkedVoice();
        }
        LastStatus = NewStatus;
        // End:0xF6
        if(GameSettings == none)
        {
            GameSettings = GetPartySettings();
        }
        // End:0x443
        if(GameSettings != none)
        {
            LPGameSettings = LPOnlineGameSettings(GameSettings);
            // End:0x14F
            if(LPGameSettings != none)
            {
                LPGameSettings.CalculateRequiredDLC();
            }
            Index = 0;
            J0x15A:

            // End:0x2C9 [Loop If]
            if(Index < GameSettings.LocalizedSettings.Length)
            {
                // End:0x286
                if(((Index >= GameSettings.LocalizedSettingsMappings.Length) || GameSettings.LocalizedSettings[Index].Id != GameSettings.LocalizedSettingsMappings[Index].Id) || PresenceKeyNames.Find(string(GameSettings.LocalizedSettingsMappings[Index].Name)) < )
                {                                        
                }
                else
                {
                    LocalSettings.AddItem(GameSettings.LocalizedSettings[Index]);                    
                }
                Index++;
                // [Loop Continue]
                goto J0x15A;
            }
            Index = 0;
            J0x2D4:

            // End:0x443 [Loop If]
            if(Index < GameSettings.Properties.Length)
            {
                // End:0x400
                if(((Index >= GameSettings.PropertyMappings.Length) || GameSettings.Properties[Index].PropertyId != GameSettings.PropertyMappings[Index].Id) || PresenceKeyNames.Find(string(GameSettings.PropertyMappings[Index].Name)) < )
                {                                        
                }
                else
                {
                    LocalProperties.AddItem(GameSettings.Properties[Index]);                    
                }
                Index++;
                // [Loop Continue]
                goto J0x2D4;
            }
        }
    }
    ScriptTrace();
    // End:0x4EE
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.SetOnlineStatus(byte(ControllerId), NewStatus, LocalSettings, LocalProperties);
    }
    //return;    
}

function SuspendRendering()
{
    local /*0x97E50000-0x00000000*/ private bool bBlackScreen[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    true
    // End:0x17
    if(bRenderingSuspended == true)
    {
        return;
    }
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x8F
    if(MyEngine != none)
    {
        MyEngine.SuspendRendering(true, bBlackScreen);
        bRenderingSuspended = true;
    }
    //return;    
}

function ResumeRendering()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    // End:0x24
    if((bRenderingSuspended == false) && !bForce)
    {
        return;
    }
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0xB9
    if(MyEngine != none)
    {
        bRenderingSuspended = false;
        // End:0x97
        if(!MyEngine.IsRenderingSuspendedByScript())
        {
            return;
        }
        MyEngine.SuspendRendering(false);
    }
    //return;    
}

function OnWaitingOnNetworkDialogOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL HostGameWaitingMovie[8388609];

    SuspendRendering(false);
    //return;    
}

function OpenWaitingOnNetworkDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Title[8388609], Body;
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;

    OptionArray.Length = 0;
    Class'SPEngine.SPUIManager'.static.ShowUIMessage('WaitingOnNetwork', Class'SPEngine.SPUtil'.static.GetLocalizedString(Title), Class'SPEngine.SPUtil'.static.GetLocalizedString(Body), OptionArray,,,,,,,,,, OnWaitingOnNetworkDialogOpen);
    //return;    
}

function CloseWaitingOnNetworkDialog()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3A
    if(Class'SPEngine.SPUIManager'.static.ClearUIMessage('WaitingOnNetwork'))
    {
        ResumeRendering();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function BuildHostTravelURL()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], URL;

    // End:0x2DA
    if((GameSettings != none) && (GameSettings.GetMapName() != 'None') || GameSettings.GetMapName() != 'None')
    {
        URL = string(GameSettings.GetMapName());
        switch(byte(GameSettings.GetGameType()))
        {
            // End:0xEF
            case 1:                
                URL $= "?game=EXTR";
                // End:0x16C
                break;
            // End:0x118
            case 2:                
                URL $= "?game=SCEN";
                // End:0x16C
                break;
            // End:0x140
            case 3:                
                URL $= "?game=TDM";
                // End:0x16C
                break;
            // End:0x169
            case 4:                
                URL $= "?game=SURV";
                // End:0x16C
                break;
            // End:0xFFFF
            default:
                break;
        }        
        URL $= ("?MatchGameDifficulty=" $ string(int(GameSettings.GetMatchGameDifficulty())));        
        URL $= ("?FriendlyFire=" $ string(GameSettings.GetAllowFriendlyFire()));        
        URL $= ("?RoundsToWin=" $ string(GameSettings.GetRoundsToWin()));        
        URL $= ("?ScoreLimit=" $ string(GameSettings.GetScoreLimit()));        
        URL $= ("?TimeLimit=" $ string(GameSettings.GetTimeLimit()));        
    }
    else
    {
        URL = "LostPlanetPreGameLobby?game=PreGameLobby";        
        URL $= ((int(GameSettings.GetSessionType()) == int(1)) ? "?LobbyMode=QuickMatch" : "?LobbyMode=Custom");
    }
    // End:0x3C4
    if(GameSettings.bIsLanMatch)
    {        
        URL $= "?OnlineMode=LAN";        
    }
    else
    {        
        URL $= "?OnlineMode=Internet";
    }    
    URL $= "?Listen";
    return URL;
    //return ReturnValue;    
}

function BuildPlayerReservationList()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array PlayerIds[8388609], Reservations;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerRes;

    I = 0;
    J0x0B:

    // End:0x95 [Loop If]
    if(I < PlayerIds.Length)
    {
        PlayerRes.NetId = PlayerIds[I];
        PlayerRes.DLCId = 0;
        Reservations.AddItem(PlayerRes);        
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function CheckPlayerDLC()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPRI[8388609], GameSettings;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int RequiredDLC;

    // End:0x11
    if(PlayerPRI == none)
    {
        return false;
    }
    // End:0x22
    if(GameSettings == none)
    {
        return true;
    }
    // End:0x81
    if(!GameSettings.HasProperty(268435518) || !GameSettings.GetIntProperty(268435518, RequiredDLC))
    {
        return true;
    }
    // End:0xF1
    if(RequiredDLC > 0)
    {
        // End:0xEF
        if((PlayerPRI.InstalledDLCs > 0) && (PlayerPRI.InstalledDLCs & RequiredDLC) == RequiredDLC)
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CheckPlayersDLC()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GameRep;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    GameRep = GetWorldInfo().GRI;
    I = 0;
    J0x34:

    // End:0xDE [Loop If]
    if(I < GameRep.PRIArray.Length)
    {
        PRI = LPPRI(GameRep.PRIArray[I]);
        // End:0xD0
        if((PRI != none) && !CheckPlayerDLC(PRI, GameSettings))
        {
            return false;
        }
        I++;
        // [Loop Continue]
        goto J0x34;
    }
    return true;
    //return ReturnValue;    
}

function CheckPlayersDLCForGRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I, RequiredGRIDLC;
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    RequiredGRIDLC = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetRequiredDLCIdForGRI(GRI);
    // End:0x17A
    if(RequiredGRIDLC > 0)
    {
        I = 0;
        J0x6B:

        // End:0x17A [Loop If]
        if(I < GRI.PRIArray.Length)
        {
            PRI = LPPRI(GRI.PRIArray[I]);
            // End:0x16C
            if(PRI != none)
            {
                // End:0x144
                if((PRI.InstalledDLCs > 0) && (PRI.InstalledDLCs & RequiredGRIDLC) == RequiredGRIDLC)
                {
                    return true;                    
                }
                else
                {
                    // End:0x16A
                    if(PRI.InstalledDLCs <= 0)
                    {
                        return true;
                    }
                }
                return false;
            }
            I++;
            // [Loop Continue]
            goto J0x6B;
        }
    }
    return true;
    //return ReturnValue;    
}

function CheckIsPlayerInSession()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GameRep, GameSettings, PRI;
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    WI = GetWorldInfo();
    GameRep = WI.GRI;
    // End:0xE1
    if(GameRep == none)
    {
        GameSettings = GetGameSettings();
        // End:0x82
        if(GameSettings == none)
        {
            GameSettings = GetPartySettings();
        }
        // End:0xDE
        if((GameSettings != none) && OnlineSub.AreUniqueNetIdsEqual(GameSettings.OwningPlayerId, PlayerID))
        {
            return true;
        }        
    }
    else
    {
        Index = 0;
        J0xEC:

        // End:0x1D1 [Loop If]
        if(Index < GameRep.PRIArray.Length)
        {
            PRI = GameRep.PRIArray[Index];
            // End:0x1C3
            if(OnlineSub.AreUniqueNetIdsEqual(PRI.UniqueId, PlayerID) && OnlineSub.HasValue(PlayerID))
            {
                return true;
            }
            Index++;
            // [Loop Continue]
            goto J0xEC;
        }
    }
    return false;
    //return ReturnValue;    
}

function CheckIsPlayerOnline()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;

    // End:0x48
    if((OnlineSub == none) || EqualEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        return false;
    }
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(ControllerId));
    return ((int(LoginStatus) >= int(1)) && int(OnlineMode) == int(2)) || (int(LoginStatus) == int(2)) && int(OnlineMode) == int(1);
    //return ReturnValue;    
}

function CopyCurrentPlayersFromBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL Beacon[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players[25165825];
    local /*0x97E50000-0x00000000*/ private int HostTeamOverride[9437185], PartyIndex, PlayerIndex;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerRes, CurrentPlayer;

    -1
    PartyIndex = 0;
    J0x14:

    // End:0x1FF [Loop If]
    if(PartyIndex < Beacon.Reservations.Length)
    {
        PlayerIndex = 0;
        J0x4C:

        // End:0x1F1 [Loop If]
        if(PlayerIndex < Beacon.Reservations[PartyIndex].PartyMembers.Length)
        {
            PlayerRes = Beacon.Reservations[PartyIndex].PartyMembers[PlayerIndex];
            CurrentPlayer.NetId = PlayerRes.NetId;
            CurrentPlayer.Skill = PlayerRes.Skill;
            CurrentPlayer.TeamNum = ((HostTeamOverride == -1) ? Beacon.Reservations[PartyIndex].TeamNum : HostTeamOverride);
            Players.AddItem(CurrentPlayer);            
            PlayerIndex++;
            // [Loop Continue]
            goto J0x4C;
        }
        PartyIndex++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function CopyCurrentPlayersToPlayerMembers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array CurrentPlayers[25296897], PlayerMembers;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;

    PlayerMembers.Length = CurrentPlayers.Length;
    PlayerIndex = 0;
    J0x20:

    // End:0x12D [Loop If]
    if(PlayerIndex < CurrentPlayers.Length)
    {
        PlayerMembers[PlayerIndex].TeamNum = CurrentPlayers[PlayerIndex].TeamNum;
        PlayerMembers[PlayerIndex].Skill = CurrentPlayers[PlayerIndex].Skill;
        PlayerMembers[PlayerIndex].NetId = CurrentPlayers[PlayerIndex].NetId;
        PlayerIndex++;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

function CopyPlayerMembersToCurrentPlayers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array PlayerMembers[25296897], CurrentPlayers;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;

    CurrentPlayers.Length = PlayerMembers.Length;
    PlayerIndex = 0;
    J0x20:

    // End:0x12D [Loop If]
    if(PlayerIndex < PlayerMembers.Length)
    {
        CurrentPlayers[PlayerIndex].TeamNum = PlayerMembers[PlayerIndex].TeamNum;
        CurrentPlayers[PlayerIndex].Skill = PlayerMembers[PlayerIndex].Skill;
        CurrentPlayers[PlayerIndex].NetId = PlayerMembers[PlayerIndex].NetId;
        PlayerIndex++;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

protected function CreateClientPartyBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class BeaconClass;
    local /*0x97E50000-0x00000000*/ private @NULL Beacon;

    BeaconClass = class<PartyBeaconClient>(FindObject(ClientPartyBeaconClassName, Class'Core.Class'));
    Beacon = new BeaconClass;
    // End:0x58
    if(Beacon == none)
    {
        return none;
    }
    Beacon.BeaconName = 'ClientParty';
    return Beacon;
    //return ReturnValue;    
}

protected function CreateHostPartyBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL PartySettings[8388609];
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class BeaconClass;
    local /*0x97E50000-0x00000000*/ private @NULL Beacon;

    BeaconClass = class<SPPartyBeaconHost>(FindObject(HostPartyBeaconClassName, Class'Core.Class'));
    Beacon = new BeaconClass;
    // End:0x58
    if(Beacon == none)
    {
        return none;
    }
    Beacon.InitHostBeacon(1, 128, 128, SessionName);
    Beacon.BeaconName = 'HostParty';
    Beacon.bBestFitTeamAssignment = true;
    Beacon.OnlineSessionName = SessionName;
    return Beacon;
    //return ReturnValue;    
}

protected function CreateClientReservationBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class BeaconClass;
    local /*0x97E50000-0x00000000*/ private @NULL Beacon;

    BeaconClass = class<PartyBeaconClient>(FindObject(ClientReservationBeaconClassName, Class'Core.Class'));
    Beacon = new BeaconClass;
    // End:0x58
    if(Beacon == none)
    {
        return none;
    }
    Beacon.BeaconName = 'ClientRsvp';
    return Beacon;
    //return ReturnValue;    
}

protected function CreateHostReservationBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings[8388609];
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class BeaconClass;
    local /*0x97E50000-0x00000000*/ private @NULL Beacon;

    BeaconClass = class<SPPartyBeaconHost>(FindObject(HostReservationBeaconClassName, Class'Core.Class'));
    Beacon = new BeaconClass;
    // End:0x58
    if(Beacon == none)
    {
        return none;
    }
    Beacon.InitHostBeacon(NumTeams, 128, 128, SessionName);
    Beacon.BeaconName = 'HostRsvp';
    Beacon.bBestFitTeamAssignment = true;
    Beacon.OnlineSessionName = SessionName;
    return Beacon;
    //return ReturnValue;    
}

function DestroyClientPartyBeacon()
{
    // End:0x39
    if(ClientPartyBeacon != none)
    {
        ClientPartyBeacon.DestroyBeacon();
        ClientPartyBeacon = none;
    }
    //return;    
}

function DestroyClientReservationBeacon()
{
    // End:0x39
    if(ClientReservationBeacon != none)
    {
        ClientReservationBeacon.DestroyBeacon();
        ClientReservationBeacon = none;
    }
    //return;    
}

function DestroyGameClientBeacons()
{
    DestroyClientBandwidthTestBeacon();
    DestroyClientReservationBeacon();
    //return;    
}

function DestroyAllClientBeacons()
{
    DestroyClientBandwidthTestBeacon();
    DestroyClientReservationBeacon();
    DestroyClientPartyBeacon();
    //return;    
}

function DestroyHostPartyBeacon()
{
    // End:0x39
    if(HostPartyBeacon != none)
    {
        HostPartyBeacon.DestroyBeacon();
        HostPartyBeacon = none;
    }
    //return;    
}

function DestroyHostReservationBeacon()
{
    // End:0x39
    if(HostReservationBeacon != none)
    {
        HostReservationBeacon.DestroyBeacon();
        HostReservationBeacon = none;
    }
    //return;    
}

function DestroyGameHostBeacons()
{
    DestroyHostBandwidthTestBeacon();
    DestroyHostReservationBeacon();
    //return;    
}

function DestroyAllHostBeacons()
{
    DestroyHostBandwidthTestBeacon();
    DestroyHostReservationBeacon();
    DestroyHostPartyBeacon();
    //return;    
}

simulated function DestroyOnlineGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> DestroyOnlineGameCompleteDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PartySettings;
    local /*0x97E50000-0x00000000*/ private byte Mode;

    CleanUpVoiceChatInfo();
    // End:0x9D
    if(SessionNameGame != SessionNameParty)
    {
        PartySettings = GetPartySettings();
        // End:0x9D
        if(PartySettings != none)
        {
            Mode = GetPresenceInviteMode();
            Class'LPOnlineGameSettings'.static.StaticSetInviteMode(PartySettings, Mode);
            UpdatePartySettings(PartySettings);
        }
    }
    DestroyGameClientBeacons();
    DestroyGameHostBeacons();
    return DestroyOnlineSession(SessionNameGame, DestroyOnlineGameCompleteDelegate);
    //return ReturnValue;    
}

simulated function DestroyOnlineParty()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> DestroyOnlineGameCompleteDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NullSessionInfo, ZeroId;

    PartyOwnerNetId = ZeroId;
    PartyOwnerSession = NullSessionInfo;
    DestroyClientPartyBeacon();
    DestroyHostPartyBeacon();
    return DestroyOnlineSession(SessionNameParty, DestroyOnlineGameCompleteDelegate);
    //return ReturnValue;    
}

simulated function DestroyOnlineSession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> DestroyOnlineGameCompleteDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(GameInterface.GetGameSettings(SessionName) == none)
    {
        return true;
    }
    GameInterface.AddDestroyOnlineGameCompleteDelegate(OnDestroyOnlineSession_DestroySession);
    // End:0x9B
    if(DestroyOnlineGameCompleteDelegate != none)
    {
        GameInterface.AddDestroyOnlineGameCompleteDelegate(DestroyOnlineGameCompleteDelegate);
    }
    // End:0xCB
    if(!GameInterface.DestroyOnlineGame(SessionName))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function OnDestroyOnlineSession_DestroySession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyOnlineSession_DestroySession);
    //return;    
}

function OnDestroyDualSessionParty_GameSession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyDualSessionParty_GameSession);
    // End:0x4B
    if(bWasSuccessful)
    {
        DestroyDualSessionParty_PartySession();        
    }
    else
    {
        // End:0x92
        if(__OnDestroyDualPartySeesion__Delegate != none)
        {
            OnDestroyDualPartySeesion(SessionName, false);
            __OnDestroyDualPartySeesion__Delegate = None;
        }
    }
    //return;    
}

simulated function DestroyDualSessionParty_PartySession()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9F
    if(GameInterface.GetGameSettings(SessionNameParty) != none)
    {
        // End:0x6F
        if(__OnDestroyDualPartySeesion__Delegate != none)
        {
            GameInterface.AddDestroyOnlineGameCompleteDelegate(OnDestroyDualPartySeesion);
        }
        // End:0x9F
        if(!GameInterface.DestroyOnlineGame(SessionNameParty))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function DestroyDualSessionParty()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> DestroyOnlineGameCompleteDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    __OnDestroyDualPartySeesion__Delegate = DestroyOnlineGameCompleteDelegate;
    // End:0xA6
    if(GameInterface.GetGameSettings(SessionNameGame) != none)
    {
        GameInterface.AddDestroyOnlineGameCompleteDelegate(OnDestroyDualSessionParty_GameSession);
        // End:0xA3
        if(!GameInterface.DestroyOnlineGame(SessionNameGame))
        {
            return false;
        }        
    }
    else
    {
        return DestroyDualSessionParty_PartySession();
    }
    return true;
    //return ReturnValue;    
}

function OnClientCancellationReceived_Game()
{
    local /*0x97E50000-0x00000000*/ private @NULL PartyLeader[8388609];

    // End:0x22
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return;
    }
    // End:0x59
    if(!GameInterface.UnregisterPlayer(SessionNameGame, PartyLeader))
    {
    }
    //return;    
}

function OnReservationChange_Game()
{
    UpdatePlayerCounts(SessionNameGame);
    //return;    
}

function OnReservationReceived_Game()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Reservation[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int PartyIndex;

    // End:0x62
    if(OnlineSub.PlayerInterface.IsBlocklisted(byte(OwningControllerIndex), Reservation.PartyLeader))
    {
        return 0;
    }
    PartyIndex = 0;
    J0x6D:

    // End:0x125 [Loop If]
    if(PartyIndex < Reservation.PartyMembers.Length)
    {
        // End:0x117
        if(OnlineSub.PlayerInterface.IsBlocklisted(byte(OwningControllerIndex), Reservation.PartyMembers[PartyIndex].NetId))
        {
            return 0;
        }
        PartyIndex++;
        // [Loop Continue]
        goto J0x6D;
    }
    return 6;
    //return ReturnValue;    
}

function RegisterPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC, ZeroId;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players;

    // End:0x146
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        // End:0x103
        foreach GetWorldInfo().AllControllers(Class'Engine.PlayerController', PC)
        {
            // End:0x102
            if(NotEqual_UniqueNetIdUniqueNetId(PC.PlayerReplicationInfo.UniqueId, ZeroId))
            {
                // End:0x102
                if(!PC.IsLocalPlayerController())
                {
                    Players.AddItem(PC.PlayerReplicationInfo.UniqueId);                    
                }
            }            
        }        
        // End:0x146
        if(Players.Length > 0)
        {
            GameInterface.RegisterPlayers(SessionNameGame, Players);
        }
    }
    //return;    
}

function SetDataStoreByGameType()
{
    local /*0x97E50000-0x00000000*/ private byte GameType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreSearch, DataStoreSettings;

    DataStoreSearch = GetDataStoreGameSearch();
    DataStoreSettings = GetDataStoreGameSettings();
    switch(GameType)
    {
        // End:0xFC
        case 1:
            // End:0xA8
            if(int(OnlineMode) == int(2))
            {
                DataStoreSearch.SetCurrentByName('ExtractionLAN');
                DataStoreSettings.SetCurrentByName('ExtractionLAN');                
            }
            else
            {
                DataStoreSearch.SetCurrentByName('Extraction');
                DataStoreSettings.SetCurrentByName('Extraction');
            }
            // End:0x3FE
            break;
        // End:0x1BD
        case 2:
            // End:0x169
            if(int(OnlineMode) == int(2))
            {
                DataStoreSearch.SetCurrentByName('ScenarioLAN');
                DataStoreSettings.SetCurrentByName('ScenarioLAN');                
            }
            else
            {
                DataStoreSearch.SetCurrentByName('Scenario');
                DataStoreSettings.SetCurrentByName('Scenario');
            }
            // End:0x3FE
            break;
        // End:0x27E
        case 3:
            // End:0x22A
            if(int(OnlineMode) == int(2))
            {
                DataStoreSearch.SetCurrentByName('TeamDeathmatchLAN');
                DataStoreSettings.SetCurrentByName('TeamDeathmatchLAN');                
            }
            else
            {
                DataStoreSearch.SetCurrentByName('TeamDeathMatch');
                DataStoreSettings.SetCurrentByName('TeamDeathMatch');
            }
            // End:0x3FE
            break;
        // End:0x33F
        case 4:
            // End:0x2EB
            if(int(OnlineMode) == int(2))
            {
                DataStoreSearch.SetCurrentByName('SurvivalLAN');
                DataStoreSettings.SetCurrentByName('SurvivalLAN');                
            }
            else
            {
                DataStoreSearch.SetCurrentByName('Survival');
                DataStoreSettings.SetCurrentByName('Survival');
            }
            // End:0x3FE
            break;
        // End:0xFFFF
        default:
            // End:0x3AA
            if(int(OnlineMode) == int(2))
            {
                DataStoreSearch.SetCurrentByName('DefaultLAN');
                DataStoreSettings.SetCurrentByName('DefaultLAN');                
            }
            else
            {
                DataStoreSearch.SetCurrentByName('Default');
                DataStoreSettings.SetCurrentByName('Default');
            }
            // End:0x3FE
            break;
            break;
    }
    //return;    
}

function UpdatePlayerCounts()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUpdateSettings[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, WI;

    true
    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x51
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return false;
    }
    // End:0x11B
    if(WI.Game != none)
    {
        // End:0x11B
        if(WI.Game.MaxPlayers > 10)
        {
            WI.Game.MaxPlayers = 10;
            WI.Game.MaxPlayersAllowed = 10;
        }
    }
    GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
    // End:0x168
    if(GameSettings == none)
    {
        return false;
    }
    // End:0x354
    if((SessionName == SessionNameParty) && Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        // End:0x291
        if(int(GameSettings.GetInviteMode()) > int(0))
        {
            GameSettings.NumOpenPublicConnections = 128;
            GameSettings.NumOpenPrivateConnections = 0;
            GameSettings.NumPublicConnections = 128;
            GameSettings.NumPrivateConnections = 0;
            GameSettings.SetAvailableTeamSize(GameSettings.NumOpenPublicConnections);            
        }
        else
        {
            GameSettings.NumOpenPublicConnections = 0;
            GameSettings.NumPublicConnections = 128;
            GameSettings.NumOpenPrivateConnections = 128;
            GameSettings.NumPrivateConnections = 128;
            GameSettings.SetAvailableTeamSize(GameSettings.NumOpenPrivateConnections);
        }        
    }
    else
    {
        // End:0x6CA
        if(WI.Game != none)
        {
            // End:0x540
            if(int(GameSettings.GetInviteMode()) > int(0))
            {
                GameSettings.NumOpenPublicConnections = WI.Game.MaxPlayers - WI.Game.GetNumPlayers();
                // End:0x46E
                if(GameSettings.NumOpenPublicConnections < 0)
                {
                    GameSettings.NumOpenPublicConnections = 0;
                }
                GameSettings.NumOpenPrivateConnections = 0;
                GameSettings.NumPublicConnections = WI.Game.MaxPlayers;
                GameSettings.NumPrivateConnections = 0;
                GameSettings.SetAvailableTeamSize(GameSettings.NumOpenPublicConnections);                
            }
            else
            {
                GameSettings.NumOpenPublicConnections = 0;
                GameSettings.NumPublicConnections = WI.Game.GetNumPlayers();
                GameSettings.NumOpenPrivateConnections = WI.Game.MaxPlayers - WI.Game.GetNumPlayers();
                GameSettings.NumPrivateConnections = WI.Game.MaxPlayers;
                GameSettings.SetAvailableTeamSize(GameSettings.NumOpenPrivateConnections);
            }
        }
    }
    GameSettings.SetAvgPlayerRank(GetPartyRank());
    // End:0x798
    if(bUpdateSettings)
    {
        // End:0x73D
        if((IsInParty()) && SessionName == SessionNameParty)
        {
            return UpdatePartySettings(GameSettings);            
        }
        else
        {
            // End:0x76B
            if(SessionName == SessionNameGame)
            {
                return UpdateGameSettings(GameSettings);                
            }
            else
            {
                // End:0x796
                if(SessionName == SessionNameParty)
                {
                    return UpdatePartySettings(GameSettings);
                }
            }
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function UpdatePartySettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL Settings[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte MatchState;
    local /*0x97E50000-0x00000000*/ private @NULL GameOGS, PartyOGS;

    // End:0x11
    if(Settings == none)
    {
        return false;
    }
    // End:0x22
    if(!IsInParty())
    {
        return false;
    }
    // End:0x115
    if(SessionNameParty != SessionNameGame)
    {
        GameOGS = GetLPGameSettings();
        // End:0x115
        if(GameOGS != none)
        {
            PartyOGS = LPOnlineGameSettings(Settings);
            // End:0x112
            if(PartyOGS != none)
            {
                PartyOGS.SetMapName(GameOGS.GetMapName());
                PartyOGS.SetAvgPlayerRank(GameOGS.GetAvgPlayerRank());
                ScriptTrace();                
            }            
        }
    }
    // End:0x14F
    if(!GameInterface.UpdateOnlineGame(SessionNameParty, Settings, true))
    {
        return false;
    }
    OnlineSub.DumpSessionState();
    MatchState = Class'LPOnlineGameSettings'.static.StaticGetMatchState(Settings);
    // End:0x206
    if(HostReservationBeacon != none)
    {
        // End:0x1E6
        if(int(MatchState) == int(3))
        {
            HostReservationBeacon.PauseReservationRequests(true);            
        }
        else
        {
            HostReservationBeacon.PauseReservationRequests(false);
        }
    }
    bIsTraveling = int(MatchState) == int(3);
    return true;
    //return ReturnValue;    
}

function OnDualSessionUpdateGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL PartySettings[8388609], GameSettings;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GameOGS, PartyOGS;

    // End:0x11
    if(PartySettings == none)
    {
        return false;
    }
    // End:0x22
    if(!IsInParty())
    {
        return false;
    }
    // End:0x3B
    if(SessionNameParty == SessionNameGame)
    {
        return false;
    }
    GameOGS = LPOnlineGameSettings(GameSettings);
    // End:0x11F
    if(GameOGS != none)
    {
        PartyOGS = LPOnlineGameSettings(PartySettings);
        // End:0x11C
        if(PartyOGS != none)
        {
            PartyOGS.SetMapName(GameOGS.GetMapName());
            PartyOGS.SetAvgPlayerRank(GameOGS.GetAvgPlayerRank());
            ScriptTrace();            
        }        
    }
    // End:0x159
    if(!GameInterface.UpdateOnlineGame(SessionNameParty, PartySettings, true))
    {
        return false;
    }
    OnlineSub.DumpSessionState();
    return true;
    //return ReturnValue;    
}

function UpdateGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL Settings[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(Settings == none)
    {
        return false;
    }
    // End:0x22
    if(!IsInGame())
    {
        return false;
    }
    // End:0x56
    if(SessionNameParty != SessionNameGame)
    {
        OnDualSessionUpdateGameSettings(GetLPPartySettings(), Settings);
    }
    // End:0x90
    if(!GameInterface.UpdateOnlineGame(SessionNameGame, Settings, true))
    {
        return false;
    }
    // End:0x10C
    if(HostReservationBeacon != none)
    {
        // End:0xEC
        if(int(Settings.GetMatchState()) == int(3))
        {
            HostReservationBeacon.PauseReservationRequests(true);            
        }
        else
        {
            HostReservationBeacon.PauseReservationRequests(false);
        }
    }
    bIsTraveling = int(Settings.GetMatchState()) == int(3);
    return true;
    //return ReturnValue;    
}

function GetPresenceInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Profile;
    local /*0x97E50000-0x00000000*/ private byte Mode;

    // End:0xA7
    if(IsPartyLeader())
    {
        Mode = 1;
        Profile = LPProfileSettings(OnlineSub.PlayerInterface.GetProfileSettings(byte(OwningControllerIndex)));
        // End:0xA4
        if(Profile != none)
        {
            Mode = Profile.GetMPInviteMode();
        }        
    }
    else
    {
        Mode = PartyOwnerInviteMode;
    }
    return Mode;
    //return ReturnValue;    
}

function SetPresenceInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUpdateProfile[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PartySettings, Profile, WI, PC;
    local /*0x97E50000-0x00000000*/ private bool bNeedUpdatePartySettings;

    false
    bNeedUpdatePartySettings = false;
    PartySettings = GetPartySettings();
    // End:0x95
    if(PartySettings != none)
    {
        Class'LPOnlineGameSettings'.static.StaticSetInviteMode(PartySettings, Mode);
        // End:0x89
        if(IsPartyLeader())
        {
            UpdatePlayerCounts(SessionNameParty);            
        }
        else
        {
            bNeedUpdatePartySettings = true;
        }
    }
    // End:0x14C
    if(bUpdateProfile)
    {
        Profile = LPProfileSettings(OnlineSub.PlayerInterface.GetProfileSettings(byte(OwningControllerIndex)));
        // End:0x14C
        if(Profile != none)
        {
            Profile.SetMPInviteMode(Mode);
            Profile.SetModified(true);
        }
    }
    // End:0x201
    if(IsPartyLeader())
    {
        WI = GetWorldInfo();
        // End:0x1FE
        if(WI != none)
        {
            // End:0x1FD
            foreach WI.AllControllers(Class'LPPlayerController', PC)
            {
                // End:0x1FC
                if(!PC.IsLocalPlayerController())
                {
                    PC.ClientSetPresenseInviteMode(Mode);
                }                
            }            
        }        
    }
    else
    {
        PartyOwnerInviteMode = Mode;
        // End:0x28F
        if(1 == 1)
        {
            // End:0x28F
            if(PartySettings != none)
            {
                // End:0x262
                if(int(Mode) > int(0))
                {
                    PartySettings.bAllowJoinViaPresence = true;                    
                }
                else
                {
                    PartySettings.bAllowJoinViaPresence = false;
                }
                bNeedUpdatePartySettings = true;
            }
        }
    }
    // End:0x2AF
    if(bNeedUpdatePartySettings)
    {
        UpdatePartySettings(PartySettings);
    }
    //return;    
}

function BuildPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members[25165825];
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private @NULL GameRep, PlayerRes, PRI, WI, ZeroId;

    // End:0x159
    if(HostPartyBeacon != none)
    {
        I = 0;
        J0x1A:

        // End:0x159 [Loop If]
        if(I < HostPartyBeacon.Reservations.Length)
        {
            J = 0;
            J0x52:

            // End:0x14B [Loop If]
            if(J < HostPartyBeacon.Reservations[I].PartyMembers.Length)
            {
                Members.AddItem(HostPartyBeacon.Reservations[I].PartyMembers[J]);                
                PlayerRes = HostPartyBeacon.Reservations[I].PartyMembers[J];
                J++;
                // [Loop Continue]
                goto J0x52;
            }
            I++;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    WI = GetWorldInfo();
    // End:0x485
    if((WI != none) && WI.GRI != none)
    {
        GameRep = WI.GRI;
        I = 0;
        J0x1D5:

        // End:0x485 [Loop If]
        if(I < GameRep.PRIArray.Length)
        {
            PRI = LPPRI(GameRep.PRIArray[I]);
            // End:0x477
            if(((PRI != none) && NotEqual_UniqueNetIdUniqueNetId(PRI.UniqueId, ZeroId)) && EqualEqual_UniqueNetIdUniqueNetId(PRI.PartyOwnerUniqueId, OwningNetId))
            {
                bFound = false;
                J = 0;
                J0x2CF:

                // End:0x374 [Loop If]
                if(J < Members.Length)
                {
                    // End:0x366
                    if(EqualEqual_UniqueNetIdUniqueNetId(GameRep.PRIArray[I].UniqueId, Members[J].NetId))
                    {
                        bFound = true;
                        // [Explicit Break]
                        goto J0x374;
                    }
                    J++;
                    // [Loop Continue]
                    goto J0x2CF;
                }
                J0x374:

                // End:0x384
                if(bFound)
                {                    
                }
                else
                {
                    PlayerRes.NetId = GameRep.PRIArray[I].UniqueId;
                    PlayerRes.Skill = int(LPPRI(GameRep.PRIArray[I]).PlayerRank);
                    PlayerRes.DLCId = 0;
                    Members.AddItem(PlayerRes);                    
                }
            }
            I++;
            // [Loop Continue]
            goto J0x1D5;
        }
    }
    //return;    
}

function ConvertGameToParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreGameSettings, GameSettings, Party;
    local /*0x97E50000-0x00000000*/ private byte Mode;

    // End:0x0F
    if(bInProgress)
    {
        return;
    }
    // End:0x28
    if(SessionNameGame != SessionNameParty)
    {
        return;
    }
    bInProgress = true;
    bIsCancelPending = false;
    DataStoreGameSettings = GetDataStoreGameSettings();
    GameSettings = GetLPGameSettings();
    // End:0x94
    if(!IsInGame() || GameSettings == none)
    {
        CreateParty();
        return;
    }
    KickNonPartyMembers("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>");
    DestroyGameClientBeacons();
    DestroyGameHostBeacons();
    DestroyClientPartyBeacon();
    DataStoreGameSettings.SetCurrentByName('Party');
    Party = LPPartyGameSettings(DataStoreGameSettings.GetCurrentGameSettings());
    GameSettings.CopyGameSettings(Party);
    // End:0x1CD
    if(int(OnlineMode) == int(2))
    {
        GameSettings.bShouldAdvertise = true;
    }
    // End:0x233
    if(int(GameSettings.GetInviteMode()) == int(3))
    {
        Mode = GetPresenceInviteMode();
        GameSettings.SetInviteMode(Mode);
    }
    GameSettings.SetSessionType(2);
    GameInterface.AddUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_Party);
    // End:0x304
    if(!GameInterface.UpdateOnlineGame(SessionNameGame, GameSettings, true))
    {
        GameInterface.ClearUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_Party);
        bInProgress = false;
        CreateParty();
    }
    CleanUpVoiceChatInfo();
    //return;    
}

function CreateParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreGameSettings, GameSettings;
    local /*0x97E50000-0x00000000*/ private byte Mode;
    local /*0x97E50000-0x00000000*/ private @NULL Party;

    // End:0x0F
    if(bInProgress)
    {
        return;
    }
    // End:0x1E
    if(bDisableBeacons)
    {
        return;
    }
    bInProgress = true;
    bIsCancelPending = false;
    // End:0x63
    if((GetPartySettings()) != none)
    {
        DestroyOnlineParty(OnDestroyGameComplete_Party);
        return;
    }
    OnlineSub.PlayerInterface.GetUniquePlayerId(byte(OwningControllerIndex), PartyOwnerNetId);
    DataStoreGameSettings = GetDataStoreGameSettings();
    DataStoreGameSettings.SetCurrentByName(((int(OnlineMode) == int(2)) ? 'DefaultLAN' : 'Default'));
    GameSettings = LPOnlineGameSettings(DataStoreGameSettings.GetCurrentGameSettings());
    DataStoreGameSettings.SetCurrentByName('Party');
    Party = LPPartyGameSettings(DataStoreGameSettings.GetCurrentGameSettings());
    // End:0x209
    if(int(OnlineMode) == int(2))
    {
        Party.bShouldAdvertise = true;
        Party.NumPublicConnections = 10;
        Party.NumPrivateConnections = 0;
    }
    GameSettings.CopyGameSettings(Party);
    Mode = GetPresenceInviteMode();
    GameSettings.SetInviteMode(Mode);
    GameSettings.SetSessionType(2);
    SetTimer(1.0000000, false, 'OpenWaitingOnNetworkDialog_Party');
    GameInterface.AddCreateOnlineGameCompleteDelegate(OnCreateGameComplete_Party);
    // End:0x33C
    if(!GameInterface.CreateOnlineGame(byte(OwningControllerIndex), SessionNameParty, GameSettings))
    {
        OnCreateGameComplete_Party(SessionNameParty, false);
        bInProgress = false;
        return;
    }
    //return;    
}

function CreateLocalParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL Profile[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTraining[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PCIter;

    PartyOwnerNetId = OwningNetId;
    bInProgress = true;
    bIsCancelPending = false;
    // End:0x96
    foreach GetWorldInfo().Game.LocalPlayerControllers(Class'LPPlayerController', PCIter)
    {
        PCIter.ClientRegisterWithParty();        
    }    
    bInProgress = false;
    //return;    
}

function OpenWaitingOnNetworkDialog_Party()
{
    OpenWaitingOnNetworkDialog("<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ConnectingDialog_Title>", "<Strings:LostPlanetGame.LPGFxFrontEnd_Online.CreatePartyDialog_Body>");
    //return;    
}

function OnCreateGameComplete_Party()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PartySettings, Profile, PC, PartyPCIter;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players;

    GameInterface.ClearCreateOnlineGameCompleteDelegate(OnCreateGameComplete_Party);
    GameInterface.ClearUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_Party);
    ClearTimer('OpenWaitingOnNetworkDialog_Party');
    CloseWaitingOnNetworkDialog();
    PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
    // End:0x13C
    if(!bWasSuccessful)
    {
        Profile = LPProfileSettings(PC.ProfileSettings);
        // End:0x108
        if(Profile != none)
        {
            CreateLocalParty(Profile);
        }
        bInProgress = false;
        OnCreateGameComplete(SessionName, bWasSuccessful);
        return;
    }
    PartyOwnerNetId = OwningNetId;
    PartySettings = GetLPPartySettings();
    // End:0x1CD
    foreach GetWorldInfo().Game.LocalPlayerControllers(Class'LPPlayerController', PartyPCIter)
    {
        PartyPCIter.ClientRegisterWithParty();        
    }    
    // End:0x214
    if(!bDisableBeacons && HostPartyBeacon == none)
    {
        HostPartyBeacon = CreateHostPartyBeacon(PartySettings, SessionNameParty);
    }
    // End:0x31A
    if(HostPartyBeacon != none)
    {
        BuildPartyMembers(Players);
        // End:0x28A
        if(int(HostPartyBeacon.AddPartyReservationEntry(GetUniqueNetId(OwningControllerIndex), Players, 0, true)) != int(6))
        {
            bWasSuccessful = false;
        }
        HostPartyBeacon.__OnReservationChange__Delegate = OnReservationChange_Party;
        HostPartyBeacon.__OnClientCancellationReceived__Delegate = OnClientCancellationReceived_Party;
        HostPartyBeacon.__OnSendJIPSession__Delegate = OnSendJIPSession_Party;
    }
    bInProgress = false;
    OnCreateGameComplete(SessionName, bWasSuccessful);
    //return;    
}

function OnDestroyGameComplete_Party()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    bInProgress = false;
    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGameComplete_Party);
    CreateParty();
    //return;    
}

function JoinParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL Session[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSkipBeaconCheck[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Party;
    local /*0x97E50000-0x00000000*/ private @NULL PartyLeader, PC, LPGameSettings;

    false
    Class'SPEngine.SPUIManager'.static.CloseAllUIMessageBoxes();
    bIsQuickMatch = false;
    ScriptTrace();
    // End:0x4A
    if(bInProgress)
    {
        return;
    }
    // End:0x64
    if(!CheckIsPlayerOnline(OwningControllerIndex))
    {
        return;
    }
    // End:0x1AA
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(1) && CheckIsPlayerInSession(Session.GameSettings.OwningPlayerId))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.JoinFailInSession_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        CancelJoinParty();
        return;
    }
    bInProgress = true;
    bIsCancelPending = false;
    PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
    // End:0x31E
    if(!CheckPlayerDLC(LPPRI(PC.PlayerReplicationInfo), Session.GameSettings))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.DLCNeeded_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.InviteHandlingFailed_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        CancelJoinParty();
        return;
    }
    SessionToJoin = Session;
    Session.GameSettings.SetIntProperty(268435477, 2);
    // End:0x3FE
    if(1 == 1)
    {
        LPGameSettings = LPOnlineGameSettings(Session.GameSettings);
        // End:0x3FE
        if(int(LPGameSettings.GetInviteMode()) == int(0))
        {
            Session.GameSettings.bAllowJoinViaPresence = false;
        }
    }
    // End:0x432
    if(ClientPartyBeacon != none)
    {
        DestroyClientPartyBeacon();
        SetTimer(0.1000000, false, 'OnDestroyClientPartyBeacon_JoinParty');
        return;
    }
    // End:0x463
    if(bDisableBeacons || bSkipBeaconCheck)
    {
        JoinReservedSession(SessionToJoin);
        return;
    }
    Party.Add(1);    
    Party[0].NetId = PC.PlayerReplicationInfo.UniqueId;
    Party[0].Skill = int(PC.ProfileSettings.GetPlayerRank());
    Party[0].DLCId = 0;
    PartyLeader = PC.PlayerReplicationInfo.UniqueId;
    ClientPartyBeacon = CreateClientPartyBeacon();
    // End:0x5A2
    if(ClientPartyBeacon == none)
    {
        CancelJoinParty();
        return;
    }
    ClientPartyBeacon.__OnReservationRequestComplete__Delegate = OnReservationRequestComplete_Join;
    ClientPartyBeacon.__OnJIPReservationRequestComplete__Delegate = OnJIPReservationRequestComplete_Join;
    ClientPartyBeacon.__OnHostIsReady__Delegate = OnHostIsReady_Join;
    ClientPartyBeacon.__OnHostHasCancelled__Delegate = OnHostHasCancelled_Join;
    ClientPartyBeacon.__OnReservationCountUpdated__Delegate = OnReservationCountUpdated_Join;
    ClientPartyBeacon.__OnTravelRequestReceived__Delegate = OnTravelRequestReceived_Join;
    // End:0x7DE
    if(ClientPartyBeacon.RequestReservation(SessionToJoin, PartyLeader, Party) == false)
    {
        CancelJoinParty();
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.JoinPartyFail_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    //return;    
}

function OnDestroyClientPartyBeacon_JoinParty()
{
    bInProgress = false;
    // End:0x27
    if(bIsCancelPending)
    {
        bIsCancelPending = false;
        return;
    }
    JoinParty(SessionToJoin);
    //return;    
}

function OnJoinPartyTimeout()
{
    CancelJoinParty();
    //return;    
}

function CancelJoinParty()
{
    bIsCancelPending = bInProgress;
    CleanupJoin(true);
    //return;    
}

function OnClientCancellationReceived_Party()
{
    local /*0x97E50000-0x00000000*/ private @NULL PartyLeader[8388609];

    // End:0x22
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return;
    }
    // End:0x59
    if(!GameInterface.UnregisterPlayer(SessionNameParty, PartyLeader))
    {
    }
    //return;    
}

function OnReservationChange_Party()
{
    UpdatePlayerCounts(SessionNameParty);
    //return;    
}

function OnSendJIPSession_Party()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ClientConn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bUsePartyReservation;
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings;
    local /*0x97E50000-0x00000000*/ private int MaxPlayers;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private byte PlatformInfo[140];
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;

    GameSettings = GetGameSettings();
    // End:0x25
    if(GameSettings == none)
    {
        return false;
    }
    // End:0x93
    if(GameSettings.HasProperty(268435477) && GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
    }
    // End:0xA9
    if(int(SessionType) == int(2))
    {
        return false;
    }
    // End:0xE3
    if(GameInterface.ReadPlatformSpecificSessionInfoBySessionName(SessionNameGame, PlatformInfo) == false)
    {
        return false;
    }
    bUsePartyReservation = false;
    // End:0x210
    if(bGroupPartyMembers)
    {
        PC = GetLocalPlayerController(OwningControllerIndex);
        MaxPlayers = ((GameSettings.NumPublicConnections == 0) ? GameSettings.NumPrivateConnections : GameSettings.NumPublicConnections);
        bUsePartyReservation = (PC.PlayerReplicationInfo != none) && (PC.PlayerReplicationInfo.Team.Size + 1) <= (MaxPlayers / 2);
    }
    HostPartyBeacon.SendJIPReservationResponse(Result, SessionNameGame, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo, bUsePartyReservation, ClientConn.Socket);
    return true;
    //return ReturnValue;    
}

function DisbandParty()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> RequestCompleteDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private bool bShowPrompt[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ButtonTitles;
    local /*0x97E50000-0x00000000*/ private @NULL MessageBox, LP;

    None
    true
    LP = GetLocalPlayer(OwningControllerIndex);
    // End:0x59
    if(RequestCompleteDelegate != none)
    {
        __OnDisbandPartyRequestComplete__Delegate = RequestCompleteDelegate;
    }
    // End:0x6B
    if((GetPartySize()) <= 1)
    {
        return;
    }
    // End:0x86
    if(!bShowPrompt)
    {
        HandleDisbandParty();
        return;
    }
    ButtonTitles.AddItem(Localize("CalloutButtonText", "No", "SPGameUI"));    
    ButtonTitles.AddItem(Localize("CalloutButtonText", "Yes", "SPGameUI"));    
    Class'LPUIManager'.static.ShowUIMessage('DisbandParty', Localize("MessageBoxStrings", "WarningTitle", "SPGameUI"), Localize("MessageBoxStrings", "ConfirmDisbandParty_Message", "SPGameUI"), ButtonTitles, OnOptionSelected_DisbandPartyRequest, LP, MessageBox);
    // End:0x218
    if(MessageBox == none)
    {
        // End:0x218
        if(RequestCompleteDelegate != none)
        {
            OnDisbandPartyRequestComplete(false);
            __OnDisbandPartyRequestComplete__Delegate = None;
        }
    }
    //return;    
}

function HandleDisbandParty()
{
    KickPartyMembers();
    KickNonPartyMembers("<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Message>", "<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Title>");
    // End:0xD8
    if(__OnDisbandPartyRequestComplete__Delegate != none)
    {
        OnDisbandPartyRequestComplete(true);
        __OnDisbandPartyRequestComplete__Delegate = None;
    }
    //return;    
}

simulated function DisbandAndDestroyParty()
{
    KickPartyMembers();
    SetTimer(0.2500000, true, 'UpdateDisbandAndDestroyParty');
    SetTimer(GameDeleteWaitTime, false, 'ForceDisbandAndDestroyParty');
    UpdateDisbandAndDestroyParty();
    //return;    
}

simulated function UpdateDisbandAndDestroyParty()
{
    // End:0x1A
    if((GetPartySize()) <= 1)
    {
        ForceDisbandAndDestroyParty();
    }
    //return;    
}

simulated function ForceDisbandAndDestroyParty()
{
    ClearTimer('UpdateDisbandAndDestroyParty');
    ClearTimer('ForceDisbandAndDestroyParty');
    DestroyOnlineParty();
    //return;    
}

function OnOptionSelected_DisbandPartyRequest()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x50
    if(SelectedButtonIndex == 0)
    {
        // End:0x4D
        if(__OnDisbandPartyRequestComplete__Delegate != none)
        {
            OnDisbandPartyRequestComplete(false);
            __OnDisbandPartyRequestComplete__Delegate = None;
        }        
    }
    else
    {
        HandleDisbandParty();
    }
    return true;
    //return ReturnValue;    
}

function LeaveParty()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> RequestCompleteDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ButtonTitles;
    local /*0x97E50000-0x00000000*/ private @NULL MessageBox, LP;

    None
    LP = GetLocalPlayer(OwningControllerIndex);
    // End:0x5E
    if(int(GetWorldInfo().NetMode) != int(NM_Client))
    {
        return;
    }
    // End:0x80
    if(RequestCompleteDelegate != none)
    {
        __OnLeavePartyRequestComplete__Delegate = RequestCompleteDelegate;
    }
    ButtonTitles.AddItem(Localize("CalloutButtonText", "No", "SPGameUI"));    
    ButtonTitles.AddItem(Localize("CalloutButtonText", "Yes", "SPGameUI"));    
    Class'LPUIManager'.static.ShowUIMessage('LeaveParty', Localize("MessageBoxStrings", "WarningTitle", "SPGameUI"), Localize("MessageBoxStrings", "ConfirmLeaveParty_Message", "SPGameUI"), ButtonTitles, OnOptionSelected_LeaveParty, LP, MessageBox);
    // End:0x210
    if(MessageBox == none)
    {
        // End:0x210
        if(RequestCompleteDelegate != none)
        {
            OnLeavePartyRequestComplete(false);
            __OnLeavePartyRequestComplete__Delegate = None;
        }
    }
    //return;    
}

function OnOptionSelected_LeaveParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Result;

    // End:0x1E
    if(SelectedButtonIndex == 0)
    {
        Result = false;        
    }
    else
    {
        Result = DestroyOnlineParty();
    }
    // End:0x7B
    if(__OnLeavePartyRequestComplete__Delegate != none)
    {
        OnLeavePartyRequestComplete(Result);
        __OnLeavePartyRequestComplete__Delegate = None;
    }
    return true;
    //return ReturnValue;    
}

function EndSessionMatching()
{
    DestroyClientReservationBeacon();
    //return;    
}

function HostGame()
{
    local /*0x97E50000-0x00000000*/ private bool bSetDataStoreByName[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL CurGameSettings, GameSettings, PartySettings;
    local /*0x97E50000-0x00000000*/ private int PartySize;

    true
    // End:0x31
    if(bInProgress)
    {
        OnCreateGameComplete(SessionNameGame, false);
        return false;
    }
    // End:0x68
    if(!CheckIsPlayerOnline(OwningControllerIndex))
    {
        OnCreateGameComplete(SessionNameGame, false);
        return false;
    }
    bInProgress = true;
    bIsCancelPending = false;
    // End:0xC3
    if(IsInGame())
    {
        // End:0xC1
        if(!DestroyOnlineGame(OnDestroyGameComplete_Host))
        {
            OnDestroyGameComplete_Host(SessionNameGame, false);
        }
        return true;
    }
    // End:0x129
    if(!bIsQuickMatch && bSetDataStoreByName)
    {
        GetDataStoreGameSettings().SetCurrentByName(((int(OnlineMode) == int(2)) ? 'DefaultLAN' : 'Default'));
    }
    GameSettings = LPOnlineGameSettings(GetDataStoreGameSettings().GetCurrentGameSettings());
    // End:0x18D
    if(bIsQuickMatch)
    {
        GameSettings.SetSessionType(1);        
    }
    else
    {
        GameSettings.SetSessionType(0);
    }
    // End:0x1F5
    if((int(OnlineMode) == int(2)) || bIsQuickMatch)
    {
        GameSettings.SetInviteMode(3);        
    }
    else
    {
        PartySettings = GetLPPartySettings();
        // End:0x256
        if(PartySettings != none)
        {
            GameSettings.SetInviteMode(PartySettings.GetInviteMode());
        }
    }
    PartySize = GetPartySize();
    // End:0x3B4
    if(int(GameSettings.GetInviteMode()) > int(0))
    {
        GameSettings.SetMaxPlayers(GameSettings.NumPublicConnections);
        GameSettings.NumOpenPublicConnections = GameSettings.NumPublicConnections - PartySize;
        GameSettings.NumOpenPrivateConnections = 0;
        GameSettings.SetAvailableTeamSize(Min(GameSettings.NumPublicConnections / ((bGroupPartyMembers) ? NumTeams : 1), GameSettings.NumOpenPublicConnections));        
    }
    else
    {
        GameSettings.SetMaxPlayers(GameSettings.NumPrivateConnections);
        GameSettings.NumOpenPublicConnections = 0;
        GameSettings.NumOpenPrivateConnections = GameSettings.NumPrivateConnections - PartySize;
        GameSettings.SetAvailableTeamSize(Min(GameSettings.NumPrivateConnections / ((bGroupPartyMembers) ? NumTeams : 1), GameSettings.NumOpenPrivateConnections));
    }
    GameSettings.SetMapName('None');
    // End:0x698
    if((SessionNameGame == SessionNameParty) && IsInParty())
    {
        CurGameSettings = GetLPGameSettings();
        CurGameSettings.CopyGameSettings(GameSettings);
        // End:0x5AE
        if(bIsQuickMatch)
        {
            CurGameSettings.SetSessionType(1);
            CurGameSettings.SetInviteMode(3);            
        }
        else
        {
            CurGameSettings.SetSessionType(0);
        }
        GameInterface.AddUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_Game);
        // End:0x695
        if(GameInterface.UpdateOnlineGame(SessionNameGame, CurGameSettings, true) == false)
        {
            GameInterface.ClearUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_Game);
            bInProgress = false;
            OnCreateGameComplete(SessionNameGame, false);
            return false;
        }        
    }
    else
    {
        SetTimer(1.0000000, false, 'OpenWaitingOnNetworkDialog_Game');
        GameInterface.AddCreateOnlineGameCompleteDelegate(OnCreateGameComplete_Game);
        // End:0x781
        if(GameInterface.CreateOnlineGame(byte(OwningControllerIndex), SessionNameGame, GameSettings) == false)
        {
            GameInterface.ClearCreateOnlineGameCompleteDelegate(OnCreateGameComplete_Game);
            bInProgress = false;
            OnCreateGameComplete(SessionNameGame, false);
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function CancelHostGame()
{
    bIsCancelPending = bInProgress;
    //return;    
}

function OnDestroyGameComplete_CancelHost()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGameComplete_CancelHost);
    bInProgress = false;
    bIsCancelPending = false;
    //return;    
}

function OnDestroyGameComplete_Host()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    bInProgress = false;
    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGameComplete_Host);
    // End:0x75
    if(bIsCancelPending)
    {
        bIsCancelPending = false;
        OnCreateGameComplete(SessionName, false);
        return;
    }
    HostGame();
    //return;    
}

function OpenWaitingOnNetworkDialog_Game()
{
    ScriptTrace();
    OpenWaitingOnNetworkDialog("<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ConnectingDialog_Title>", "<Strings:LostPlanetGame.LPGFxFrontEnd_Online.CreateGameDialog_Body>");
    //return;    
}

function OnCreateGameComplete_Game()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, OwningPlayerId, PartySettings;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players;
    local /*0x97E50000-0x00000000*/ private @NULL GameRep;
    local /*0x97E50000-0x00000000*/ private int PriIndex;
    local /*0x97E50000-0x00000000*/ private @NULL ZeroId;

    GameInterface.ClearCreateOnlineGameCompleteDelegate(OnCreateGameComplete_Game);
    GameInterface.ClearUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_Game);
    ClearTimer('OpenWaitingOnNetworkDialog_Game');
    CloseWaitingOnNetworkDialog();
    // End:0xC1
    if(bIsCancelPending)
    {
        bIsCancelPending = false;
        bInProgress = false;
        DestroyOnlineGame(OnDestroyGameComplete_CancelHost);
        return;
    }
    // End:0x105
    if(bWasSuccessful == false)
    {
        bInProgress = false;
        OnCreateGameComplete(SessionName, bWasSuccessful);
        return;
    }
    GameSettings = GetLPGameSettings();
    RegisterPartyMembers();
    // End:0x13C
    if(HostReservationBeacon != none)
    {
        DestroyHostReservationBeacon();
    }
    // End:0x171
    if(!bDisableBeacons)
    {
        HostReservationBeacon = CreateHostReservationBeacon(GameSettings, SessionName);
    }
    // End:0x6D0
    if(HostReservationBeacon != none)
    {
        HostReservationBeacon.bBalancedTeamAssignment = int(GameSettings.GetSessionType()) == int(0);
        // End:0x620
        if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_DedicatedServer))
        {
            // End:0x50D
            if(!bGroupPartyMembers || int(GameSettings.GetSessionType()) == int(0))
            {
                GameRep = GetWorldInfo().GRI;
                PriIndex = 0;
                J0x276:

                // End:0x4EB [Loop If]
                if(PriIndex < GameRep.PRIArray.Length)
                {
                    // End:0x4DD
                    if(NotEqual_UniqueNetIdUniqueNetId(GameRep.PRIArray[PriIndex].UniqueId, ZeroId))
                    {
                        Players.Remove(0, Players.Length);                        
                        Players.Add(1);                        
                        Players[0].NetId = GameRep.PRIArray[PriIndex].UniqueId;
                        Players[0].Skill = int(LPPRI(GameRep.PRIArray[PriIndex]).PlayerRank);
                        Players[0].DLCId = 0;
                        // End:0x4DD
                        if(int(HostReservationBeacon.AddPartyReservationEntry(Players[0].NetId, Players, 0, EqualEqual_UniqueNetIdUniqueNetId(Players[0].NetId, OwningNetId))) != int(6))
                        {
                            // End:0x4DD
                            if(EqualEqual_UniqueNetIdUniqueNetId(Players[0].NetId, OwningNetId))
                            {
                                bInProgress = false;
                                OnCreateGameComplete(SessionName, false);
                                return;
                            }
                        }
                    }
                    PriIndex++;
                    // [Loop Continue]
                    goto J0x276;
                }
                HostReservationBeacon.BalancedTeamAssignmentJiggle();                
            }
            else
            {
                BuildPartyMembers(Players);
                OwningPlayerId = GetUniqueNetId(OwningControllerIndex);
                // End:0x5A6
                if(int(HostReservationBeacon.AddPartyReservationEntry(OwningPlayerId, Players, 0, true)) != int(6))
                {
                    bInProgress = false;
                    OnCreateGameComplete(SessionName, false);
                    return;
                }
            }
            // End:0x620
            if(bAllowHostMigration || bChooseOptimalHost)
            {
                // End:0x5DB
                if(HostBandwidthTestBeacon != none)
                {
                    DestroyHostBandwidthTestBeacon();
                }
                HostBandwidthTestBeacon = CreateHostBandwidthTestBeacon(GameSettings);
                OptimalHostPlayerId = GameSettings.OwningPlayerId;
            }
        }
        HostReservationBeacon.__OnReservationChange__Delegate = OnReservationChange_Game;
        HostReservationBeacon.__OnClientCancellationReceived__Delegate = OnClientCancellationReceived_Game;
        HostReservationBeacon.__OnReservationReceived__Delegate = OnReservationReceived_Game;
        HostReservationBeacon.PauseReservationRequests(true);
    }
    OnCreateGameComplete(SessionName, bWasSuccessful);
    PartySettings = GetLPPartySettings();
    // End:0x792
    if(((PartySettings != none) && SessionNameGame != SessionNameParty) && int(GameSettings.GetInviteMode()) > int(0))
    {
        PartySettings.SetInviteMode(1);
        UpdatePartySettings(PartySettings);
    }
    SetTimer(0.1000000, false, 'HostTravel');
    __PendingTravelFunc__Delegate = HostTravel;
    //return;    
}

function HostTravel()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHasPlatformInfo;
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings;
    local /*0x97E50000-0x00000000*/ private byte PlatformInfo[140];
    local /*0x97E50000-0x00000000*/ private editfixedsize string URL;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    __PendingTravelFunc__Delegate = None;
    GameSettings = GetLPGameSettings();
    WI = GetWorldInfo();
    // End:0xA6
    if(SessionNameGame != SessionNameParty)
    {
        bHasPlatformInfo = GameInterface.ReadPlatformSpecificSessionInfoBySessionName(SessionNameGame, PlatformInfo);
        // End:0xA6
        if(!bHasPlatformInfo)
        {
        }
    }
    URL = BuildHostTravelURL(GameSettings);
    Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie(string(GameSettings.GetMapName()), byte(GameSettings.GetGameType()));
    ClearDelegates();
    bIsTraveling = true;
    WI.Game.bUseSeamlessTravel = true;
    WI.ServerTravel(URL, true);
    // End:0x224
    if(bHasPlatformInfo)
    {
        WI.Game.TellClientsToTravelToSession(SessionNameGame, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo, false);
    }
    bInProgress = false;
    bIsTraveling = false;
    return true;
    //return ReturnValue;    
}

function IsPartyLeader()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OwnerNetId;

    OnlineSub.PlayerInterface.GetUniquePlayerId(byte(OwningControllerIndex), OwnerNetId);
    return EqualEqual_UniqueNetIdUniqueNetId(OwnerNetId, PartyOwnerNetId);
    //return ReturnValue;    
}

function IsPartyMember()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x11
    if(PlayerPRI == none)
    {
        return false;
    }
    BuildPartyMembers(Members);
    I = 0;
    J0x2F:

    // End:0xD0 [Loop If]
    if(I < Members.Length)
    {
        PlayerNetId = Members[I].NetId;
        // End:0xC2
        if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(PlayerNetId, PlayerPRI.UniqueId))
        {
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x2F;
    }
    return false;
    //return ReturnValue;    
}

function KickPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[9437185], ReasonTitle;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;
    local /*0x97E50000-0x00000000*/ private @NULL PC, PlayerNetId, PRI;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x60
    if(Len(Reason) == 0)
    {
        Reason = "<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Message>";
    }
    // End:0xBC
    if(Len(ReasonTitle) == 0)
    {
        ReasonTitle = "<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Title>";
    }
    BuildPartyMembers(Members);
    // End:0x273
    foreach GetWorldInfo().AllControllers(Class'LPPlayerController', PC)
    {
        // End:0x12A
        if(PC.IsLocalPlayerController())
        {
            continue;            
        }
        PRI = LPPRI(PC.PlayerReplicationInfo);
        // End:0x16E
        if(PRI == none)
        {
            continue;            
        }
        bFound = false;
        I = 0;
        J0x185:

        // End:0x233 [Loop If]
        if(I < Members.Length)
        {
            PlayerNetId = Members[I].NetId;
            // End:0x225
            if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(PlayerNetId, PRI.UniqueId))
            {
                bFound = true;
                // [Explicit Break]
                goto J0x233;
            }
            I++;
            // [Loop Continue]
            goto J0x185;
        }
        J0x233:

        // End:0x272
        if(bFound)
        {
            PC.ClientReturnToMPLobby(Reason, ReasonTitle, true);
        }        
    }    
    //return;    
}

function KickNonPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[9437185], ReasonTitle;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;
    local /*0x97E50000-0x00000000*/ private @NULL PC, PlayerNetId, PRI;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x47
    if(Len(Reason) == 0)
    {
        Reason = "<Strings:Engine.Errors.ConnectionFailed>";
    }
    // End:0x92
    if(Len(ReasonTitle) == 0)
    {
        ReasonTitle = "<Strings:Engine.Errors.ConnectionFailed_Title>";
    }
    ScriptTrace();
    BuildPartyMembers(Members);
    // End:0x255
    foreach GetWorldInfo().AllControllers(Class'LPPlayerController', PC)
    {
        // End:0x10A
        if(PC.IsLocalPlayerController())
        {
            continue;            
        }
        PRI = LPPRI(PC.PlayerReplicationInfo);
        // End:0x14E
        if(PRI == none)
        {
            continue;            
        }
        bFound = false;
        I = 0;
        J0x165:

        // End:0x213 [Loop If]
        if(I < Members.Length)
        {
            PlayerNetId = Members[I].NetId;
            // End:0x205
            if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(PlayerNetId, PRI.UniqueId))
            {
                bFound = true;
                // [Explicit Break]
                goto J0x213;
            }
            I++;
            // [Loop Continue]
            goto J0x165;
        }
        J0x213:

        // End:0x254
        if(!bFound)
        {
            PC.ClientReturnToMPLobby(Reason, ReasonTitle, true);
        }        
    }    
    //return;    
}

function JoinFriend()
{
    local /*0x97E50000-0x00000000*/ private @NULL Friend[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FriendToJoin = Friend;
    bIsQuickMatch = false;
    // End:0x38
    if(CheckIsPlayerInSession(Friend))
    {
        return false;
    }
    // End:0x88
    if(!OnlineSub.PlayerInterface.JoinFriendGame(byte(OwningControllerIndex), Friend))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CancelJoinFriend()
{
    CancelJoinGame();
    //return;    
}

function JoinGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL Session[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceNewReservation[9437185], bSkipReservationCheck;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Party;
    local /*0x97E50000-0x00000000*/ private @NULL PartyLeader, PC;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;
    local /*0x97E50000-0x00000000*/ private @NULL ZeroId;

    !bGroupPartyMembers;    
    Class'SPEngine.SPUIManager'.static.CloseAllUIMessageBoxes();
    bIsJoining = true;
    ScriptTrace();
    // End:0x73
    if(bInProgress)
    {
        OnJoinGameComplete(SessionNameGame, false);
        return;
    }
    // End:0xAA
    if(!CheckIsPlayerOnline(OwningControllerIndex))
    {
        OnJoinGameComplete(SessionNameGame, false);
        return;
    }
    // End:0x212
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(1) && CheckIsPlayerInSession(Session.GameSettings.OwningPlayerId))
    {
        // End:0x1F3
        if(!bIsQuickMatch)
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.JoinFailInSession_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        OnJoinGameComplete(SessionNameGame, false);
        return;
    }
    // End:0x343
    if(!CheckPlayersDLC(Session.GameSettings))
    {
        // End:0x324
        if(!bIsQuickMatch)
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.DLCNeeded_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.InviteHandlingFailed_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        OnJoinGameComplete(SessionNameGame, false);
        return;
    }
    bInProgress = true;
    bIsCancelPending = false;
    SessionToJoin = Session;
    // End:0x3A2
    if(ClientReservationBeacon != none)
    {
        DestroyClientReservationBeacon();
        SetTimer(0.1000000, false, 'OnDestroyClientReservationBeacon_JoinGame');
        return;
    }
    // End:0x3D3
    if(bDisableBeacons || bSkipReservationCheck)
    {
        JoinReservedSession(SessionToJoin);
        return;
    }
    SessionType = 0;
    // End:0x476
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);        
    }
    BuildPartyMembers(Party);
    PartyLeader = (((!bForceNewReservation && int(SessionType) == int(1)) && NotEqual_UniqueNetIdUniqueNetId(PartyOwnerNetId, ZeroId)) ? PartyOwnerNetId : OwningNetId);
    // End:0x61D
    if(!bGroupPartyMembers && Party.Length > 1)
    {
        PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
        Party.Remove(0, Party.Length);        
        Party.Add(1);        
        Party[0].NetId = PC.PlayerReplicationInfo.UniqueId;
        Party[0].Skill = int(PC.ProfileSettings.GetPlayerRank());
        Party[0].DLCId = 0;
    }
    ClientReservationBeacon = CreateClientReservationBeacon();
    // End:0x682
    if(ClientReservationBeacon == none)
    {
        CleanupJoin(false);
        OnJoinGameComplete(SessionNameGame, false);
        bInProgress = false;
        bIsCancelPending = false;
        return;
    }
    ClientReservationBeacon.__OnReservationRequestComplete__Delegate = OnReservationRequestComplete_Join;
    ClientReservationBeacon.__OnJIPReservationRequestComplete__Delegate = OnJIPReservationRequestComplete_Join;
    ClientReservationBeacon.__OnHostIsReady__Delegate = OnHostIsReady_Join;
    ClientReservationBeacon.__OnHostHasCancelled__Delegate = OnHostHasCancelled_Join;
    ClientReservationBeacon.__OnReservationCountUpdated__Delegate = OnReservationCountUpdated_Join;
    ClientReservationBeacon.__OnTravelRequestReceived__Delegate = OnTravelRequestReceived_Join;
    // End:0x8F9
    if(NotEqual_UniqueNetIdUniqueNetId(PartyLeader, OwningNetId))
    {
        // End:0x8F6
        if(ClientReservationBeacon.RequestReservationUpdate(SessionToJoin, PartyLeader, Party) == false)
        {
            CleanupJoin(false);
            OnJoinGameComplete(SessionNameGame, false);
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            return;
        }        
    }
    else
    {
        // End:0xA46
        if(ClientReservationBeacon.RequestReservation(SessionToJoin, PartyLeader, Party) == false)
        {
            CleanupJoin(false);
            OnJoinGameComplete(SessionNameGame, false);
            bInProgress = false;
            bIsCancelPending = false;
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            return;
        }
    }
    //return;    
}

function CancelJoinGame()
{
    bIsCancelPending = bInProgress;
    //return;    
}

function CleanupJoin()
{
    local /*0x97E50000-0x00000000*/ private bool bIsParty[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, ZeroId;

    // End:0x2D
    if(bIsParty)
    {
        DestroyClientPartyBeacon();
        PartyOwnerNetId = ZeroId;        
    }
    else
    {
        DestroyClientReservationBeacon();
    }
    GameSettings = GameInterface.GetGameSettings(((bIsParty) ? SessionNameParty : SessionNameGame));
    // End:0x11A
    if((GameSettings == none) || NotEqual_UniqueNetIdUniqueNetId(GameSettings.OwningPlayerId, GetUniqueNetId(OwningControllerIndex)))
    {
        // End:0xFC
        if(bIsParty)
        {
            DestroyOnlineParty(OnDestroyGameComplete_CleanupJoin);            
        }
        else
        {
            DestroyOnlineGame(OnDestroyGameComplete_CleanupJoin);
        }        
    }
    else
    {
        bInProgress = false;
        bIsCancelPending = false;
    }
    bIsTraveling = false;
    bAcceptedInvite = false;
    //return;    
}

function OnDestroyGameComplete_CleanupJoin()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGameComplete_CleanupJoin);
    bInProgress = false;
    bIsCancelPending = false;
    //return;    
}

function OnDestroyClientReservationBeacon_JoinGame()
{
    bInProgress = false;
    // End:0x26
    if(bIsCancelPending)
    {
        CleanupJoin(false);
        return;
    }
    JoinGame(SessionToJoin);
    //return;    
}

function OnHostHasCancelled_Join()
{
    GetLocalPlayerController(OwningControllerIndex).ShowPlayerState();
    //return;    
}

function OnHostIsReady_Join()
{
    //return;    
}

function OnReservationCountUpdated_Join()
{
    local /*0x97E50000-0x00000000*/ private int Remaining[8388609];

    //return;    
}

function OnReservationRequestComplete_Join()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsParty;
    local /*0x97E50000-0x00000000*/ private name SessionName;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;

    // End:0xB3
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    SessionName = ((bIsParty) ? SessionNameParty : SessionNameGame);
    // End:0x12D
    if(bIsCancelPending)
    {
        // End:0x10E
        if(!bIsQuickMatch)
        {
            CleanupJoin(bIsParty);
        }
        OnJoinGameComplete(SessionName, false);
        return;
    }
    // End:0x159
    if(HandleJoinReservationRequestComplete(Result))
    {
        JoinReservedSession(SessionToJoin);        
    }
    else
    {
        CleanupJoin(bIsParty);
        bInProgress = false;
    }
    OnJoinRequestComplete(Result);
    //return;    
}

function OnJIPReservationRequestComplete_Join()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x97E50000-0x00000000*/ private bool bUsePartyReservation[8388609], bIsParty;
    local /*0x97E50000-0x00000000*/ private name OrigSessionName;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;
    local /*0x97E50000-0x00000000*/ private @NULL TravelSearch;
    local /*0x97E50000-0x00000000*/ private editfixedsize array SearchResults;
    local /*0x97E50000-0x00000000*/ private bool bIsPartyNextSession;
    local /*0x97E50000-0x00000000*/ private byte NextSessionType;

    // End:0xB3
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    OrigSessionName = ((bIsParty) ? SessionNameParty : SessionNameGame);
    // End:0x12D
    if(bIsCancelPending)
    {
        // End:0x10E
        if(!bIsQuickMatch)
        {
            CleanupJoin(bIsParty);
        }
        OnJoinGameComplete(OrigSessionName, false);
        return;
    }
    // End:0x52A
    if(HandleJoinReservationRequestComplete(Result))
    {
        TravelSearch = new SearchClass;
        // End:0x16C
        if(TravelSearch == none)
        {
            return;
        }
        // End:0x1DA
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            SearchResults = GameInterface.GetGameSearchResults();
            GameInterface.SetGameSearchResultsLengthToZero();
        }
        GameInterface.BindPlatformSpecificSessionToSearch(byte(OwningControllerIndex), TravelSearch, PlatformSpecificInfo);
        // End:0x264
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            GameInterface.AppendToGameSearchResults(SearchResults);
        }
        // End:0x34A
        if(SessionNameGame == SessionNameParty)
        {
            // End:0x334
            if(TravelSearch.Results.Length > 0)
            {
                PartyOwnerNetId = SessionToJoin.GameSettings.OwningPlayerId;
                PartyOwnerSession = SessionToJoin;
                bInProgress = false;
                JoinGame(TravelSearch.Results[0], !bUsePartyReservation);                
            }
            else
            {
                JoinReservedSession(SessionToJoin);
            }            
        }
        else
        {
            // End:0x514
            if(TravelSearch.Results.Length > 0)
            {
                SessionToJoinNext = TravelSearch.Results[0];
                // End:0x41E
                if(NotEqual_UniqueNetIdUniqueNetId(SessionToJoinNext.GameSettings.OwningPlayerId, SessionToJoin.GameSettings.OwningPlayerId))
                {
                    SessionToJoin = SessionToJoinNext;                    
                }
                else
                {
                    // End:0x4FC
                    if(bIsParty)
                    {
                        // End:0x4F9
                        if(SessionToJoinNext.GameSettings.HasProperty(268435477) && SessionToJoinNext.GameSettings.GetIntProperty(268435477, PropValue))
                        {
                            NextSessionType = byte(PropValue);
                            bIsPartyNextSession = int(NextSessionType) == int(2);
                            // End:0x4F6
                            if(!bIsPartyNextSession)
                            {
                                bHasNextSessionToJoin = true;
                            }                            
                        }                        
                    }
                }
                bNextSessionUsePartyReservation = bUsePartyReservation;                
            }
            JoinReservedSession(SessionToJoin);
        }        
    }
    else
    {
        CleanupJoin(bIsParty);
        bInProgress = false;
    }
    OnJoinRequestComplete(Result);
    //return;    
}

function HandleJoinReservationRequestComplete()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsParty;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;
    local /*0x97E50000-0x00000000*/ private bool bWasSuccess;

    bWasSuccess = false;
    // End:0xBF
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    // End:0x12F
    if(bIsParty)
    {
        ClientPartyBeacon.__OnReservationRequestComplete__Delegate = None;
        ClientPartyBeacon.__OnJIPReservationRequestComplete__Delegate = None;        
    }
    else
    {
        ClientReservationBeacon.__OnReservationRequestComplete__Delegate = None;
        ClientReservationBeacon.__OnJIPReservationRequestComplete__Delegate = None;
    }
    switch(Result)
    {
        // End:0x1A7
        case 6:
        // End:0x1BB
        case 4:
            bWasSuccess = true;
            // End:0x64A
            break;
        // End:0x2ED
        case 3:
            // End:0x2EA
            if(!bIsMatchmaking)
            {
                Class'LPUIManager'.static.DisplayErrorMessage(((bIsParty) ? "<Strings:SPGameUI.MessageBoxErrorStrings.JoinPartyFail_Message>" : "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Message>"), "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            }
            // End:0x64A
            break;
        // End:0x2F2
        case 1:
        // End:0x432
        case 2:
            // End:0x42F
            if(!bIsMatchmaking)
            {
                Class'LPUIManager'.static.DisplayErrorMessage(((bIsParty) ? "<Strings:SPGameUI.MessageBoxErrorStrings.JoinPartyFailNoSpace_Message>" : "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFailNoSpace_Message>"), "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            }
            // End:0x64A
            break;
        // End:0x564
        case 7:
            // End:0x561
            if(!bIsMatchmaking)
            {
                Class'LPUIManager'.static.DisplayErrorMessage(((bIsParty) ? "<Strings:SPGameUI.MessageBoxErrorStrings.JoinPartyFail_Message>" : "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Message>"), "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            }
            // End:0x64A
            break;
        // End:0x647
        case 8:
            // End:0x644
            if(!bIsMatchmaking)
            {
                Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.DLCNeeded_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            }
            // End:0x64A
            break;
        // End:0xFFFF
        default:
            break;
    }
    return bWasSuccess;
    //return ReturnValue;    
}

function OnTravelRequestReceived_Join()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x97E50000-0x00000000*/ private @NULL TravelSearch;

    // End:0x22
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return;
    }
    TravelSearch = new SearchClass;
    // End:0x4B
    if(TravelSearch == none)
    {
        return;
    }
    GameInterface.BindPlatformSpecificSessionToSearch(byte(OwningControllerIndex), TravelSearch, PlatformSpecificInfo);
    // End:0xAF
    if(TravelSearch.Results.Length <= 0)
    {
        return;
    }
    // End:0xE9
    if(bGroupPartyMembers)
    {
        JoinReservedSession(TravelSearch.Results[0]);        
    }
    else
    {
        JoinGame(TravelSearch.Results[0]);
    }
    //return;    
}

function JoinReservedSession()
{
    local /*0x97E50000-0x00000000*/ private @NULL Session[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsParty, bShouldDoPartyBreakupDialog;
    local /*0x97E50000-0x00000000*/ private int InviteMode;
    local /*0x97E50000-0x00000000*/ private name SessionName;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ButtonTitles;
    local /*0x97E50000-0x00000000*/ private @NULL MessageBox, LP, PC;

    PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
    // End:0x54
    if(PC != none)
    {
        PC.ClosePauseMenu();
    }
    ScriptTrace();
    LP = GetLocalPlayer(OwningControllerIndex);
    SessionToJoin = Session;
    // End:0x141
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    SessionName = ((bIsParty) ? SessionNameParty : SessionNameGame);
    // End:0x1BB
    if(bIsCancelPending)
    {
        // End:0x19C
        if(!bIsQuickMatch)
        {
            CleanupJoin(bIsParty);
        }
        OnJoinGameComplete(SessionName, false);
        return;
    }
    // End:0x327
    if(!CheckPlayerDLC(LPPRI(PC.PlayerReplicationInfo), Session.GameSettings))
    {
        // End:0x308
        if(!bIsQuickMatch)
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.DLCNeeded_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.InviteHandlingFailed_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            CleanupJoin(bIsParty);
        }
        OnJoinGameComplete(SessionName, false);
        return;
    }
    InviteMode = -1;
    // End:0x3B0
    if(Session.GameSettings.HasProperty(268435476))
    {
        Session.GameSettings.GetIntProperty(268435476, InviteMode);
    }
    // End:0x3FF
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        // End:0x3FC
        if(bIsParty && IsInParty())
        {
            bShouldDoPartyBreakupDialog = true;
        }        
    }
    else
    {
        // End:0x44C
        if(!bIsQuickMatch && (IsInParty()) || ((GetPartySize()) > 1) && !bReturningFromDestroyingParty)
        {
            bShouldDoPartyBreakupDialog = true;
        }
    }
    // End:0x774
    if(bShouldDoPartyBreakupDialog)
    {
        ButtonTitles.AddItem(Localize("CalloutButtonText", "No", "SPGameUI"));        
        ButtonTitles.AddItem(Localize("CalloutButtonText", "Yes", "SPGameUI"));        
        // End:0x518
        if(int(GetWorldInfo().NetMode) == int(NM_Client))
        {
            OnOptionSelected_LeaveParty_JoinSession(none, 1, OwningControllerIndex);
            bAcceptedInvite = false;            
        }
        else
        {
            // End:0x75D
            if((GetPartySize()) > 1)
            {
                // End:0x66C
                if((HostPartyBeacon != none) && HostPartyBeacon.GetTeamForCurrentPlayer(Session.GameSettings.OwningPlayerId) != -1)
                {
                    Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriendInSession_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
                    CleanupJoin(true);
                    bInProgress = false;
                    OnJoinGameComplete(SessionNameParty, false);
                    return;
                }
                // End:0x75A
                if(!Class'LPUIManager'.static.ShowUIMessage('DisbandParty', Localize("MessageBoxStrings", "WarningTitle", "SPGameUI"), Localize("MessageBoxStrings", "ConfirmDisbandParty_Message", "SPGameUI"), ButtonTitles, OnOptionSelected_DisbandParty_JoinSession, LP, MessageBox))
                {
                    OnOptionSelected_DisbandParty_JoinSession(none, 1, OwningControllerIndex);
                }                
            }
            else
            {
                OnOptionSelected_DisbandParty_JoinSession(none, 1, OwningControllerIndex);
            }
        }
        return;
    }
    // End:0x85C
    if(!NotifyClientsToTravel(SessionName, Session, bIsParty))
    {
        // End:0x7F0
        if(bIsParty)
        {
            // End:0x7ED
            if(ClientPartyBeacon != none)
            {
                ClientPartyBeacon.CancelReservation(GetUniqueNetId(OwningControllerIndex));
            }            
        }
        else
        {
            // End:0x831
            if(ClientReservationBeacon != none)
            {
                ClientReservationBeacon.CancelReservation(GetUniqueNetId(OwningControllerIndex));
            }
        }
        bInProgress = false;
        OnJoinGameComplete(SessionName, false);
        return;
    }
    // End:0x884
    if(HasRemotePlayers())
    {
        SetTimer(0.1000000, true, 'WaitForRemotePlayers_JoinReservedSession');
        return;
    }
    bIsTraveling = true;
    // End:0x964
    if(GameInterface.GetGameSettings(SessionName) != none)
    {
        // End:0x93E
        if(((SessionNameGame != SessionNameParty) && SessionName == SessionNameParty) && GameInterface.GetGameSettings(SessionNameGame) != none)
        {
            DestroyDualSessionParty(OnDestroyGameComplete_JoinSession);            
        }
        else
        {
            DestroyOnlineSession(SessionName, OnDestroyGameComplete_JoinSession);
        }
        return;
    }
    // End:0xAFF
    if(InviteMode != -1)
    {
        Session.GameSettings.bAllowJoinViaPresence = int(byte(InviteMode)) >= int(1);
        // End:0xAFF
        if(int(byte(InviteMode)) < int(1))
        {
            Session.GameSettings.NumPrivateConnections = Session.GameSettings.NumPublicConnections;
            Session.GameSettings.NumPublicConnections = 0;
            Session.GameSettings.NumOpenPrivateConnections = Session.GameSettings.NumOpenPublicConnections;
            Session.GameSettings.NumOpenPublicConnections = 0;
        }
    }
    // End:0xC41
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        Session.GameSettings.GetIntProperty(268435477, PropValue);
        // End:0xBAD
        if(PropValue == 1)
        {
            Session.GameSettings.SetIntProperty(268435477, 0);            
        }
        else
        {
            // End:0xC3E
            if((PropValue == 0) && EqualEqual_UniqueNetIdUniqueNetId(Session.GameSettings.OwningPlayerId, PartyOwnerNetId))
            {
                Session.GameSettings.SetIntProperty(268435477, 2);
            }
        }        
    }
    bReturningFromDestroyingParty = false;
    GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinMatchComplete);
    GameInterface.JoinOnlineGame(byte(OwningControllerIndex), SessionName, Session);
    //return;    
}

function HasRemotePlayers()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL WI, PC;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x96
    if(WI != none)
    {
        // End:0x95
        foreach WI.AllControllers(Class'Engine.PlayerController', PC)
        {
            // End:0x94
            if(!PC.IsLocalPlayerController())
            {                
                return true;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function WaitForRemotePlayers_JoinReservedSession()
{
    // End:0x35
    if(!HasRemotePlayers())
    {
        ClearTimer('WaitForRemotePlayers_JoinReservedSession');
        JoinReservedSession(SessionToJoin);
    }
    //return;    
}

function OnOptionSelected_DisbandParty_JoinSession()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x46
    if(bIsCancelPending)
    {
        // End:0x27
        if(!bIsQuickMatch)
        {
            CleanupJoin(true);
        }
        OnJoinGameComplete(SessionNameParty, false);
        return true;
    }
    // End:0x8C
    if(SelectedButtonIndex == 0)
    {
        CleanupJoin(true);
        bInProgress = false;
        OnJoinGameComplete(SessionNameParty, false);        
    }
    else
    {
        KickPartyMembers();
        KickNonPartyMembers("<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Message>", "<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Title>");
        SetTimer(0.2500000, true, 'OnOptionSelected_WaitForDisbandParty_JoinSession');
        SetTimer(GameDeleteWaitTime, false, 'OnOptionSelected_PartyDisbanded_JoinSession');
    }
    return true;
    //return ReturnValue;    
}

function OnOptionSelected_WaitForDisbandParty_JoinSession()
{
    // End:0x0F
    if(HasRemotePlayers())
    {
        return;
    }
    OnOptionSelected_PartyDisbanded_JoinSession();
    //return;    
}

function OnOptionSelected_PartyDisbanded_JoinSession()
{
    ClearTimer('OnOptionSelected_WaitForDisbandParty_JoinSession');
    ClearTimer('OnOptionSelected_PartyDisbanded_JoinSession');
    bReturningFromDestroyingParty = true;
    DestroyOnlineSession(SessionNameParty, OnDestroyPartyComplete_JoinSession);
    //return;    
}

function OnOptionSelected_LeaveParty_JoinSession()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x46
    if(bIsCancelPending)
    {
        // End:0x27
        if(!bIsQuickMatch)
        {
            CleanupJoin(true);
        }
        OnJoinGameComplete(SessionNameParty, false);
        return true;
    }
    // End:0x8C
    if(SelectedButtonIndex == 0)
    {
        CleanupJoin(true);
        bInProgress = false;
        OnJoinGameComplete(SessionNameParty, false);        
    }
    else
    {
        // End:0xF2
        if((SessionNameGame != SessionNameParty) && GameInterface.GetGameSettings(SessionNameGame) != none)
        {
            DestroyDualSessionParty(OnDestroyPartyComplete_JoinSession);            
        }
        else
        {
            DestroyOnlineSession(SessionNameParty, OnDestroyPartyComplete_JoinSession);
        }
    }
    return true;
    //return ReturnValue;    
}

function OnDestroyPartyComplete_JoinSession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyPartyComplete_JoinSession);
    // End:0x77
    if(bIsCancelPending)
    {
        // End:0x58
        if(!bIsQuickMatch)
        {
            CleanupJoin(true);
        }
        OnJoinGameComplete(SessionNameParty, false);
        return;
    }
    // End:0xBC
    if(!bWasSuccessful)
    {
        CleanupJoin(true);
        bInProgress = false;
        OnJoinGameComplete(SessionNameParty, false);
        return;
    }
    JoinReservedSession(SessionToJoin);
    //return;    
}

function NotifyClientsToTravel()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Session[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsParty[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private byte PlatformInfo[140];
    local /*0x97E50000-0x00000000*/ private @NULL WI, PC;
    local /*0x97E50000-0x00000000*/ private class SearchClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId;
    local /*0x97E50000-0x00000000*/ private int I;

    KickNonPartyMembers("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>");
    // End:0x9E
    if(GameInterface.ReadPlatformSpecificSessionInfo(Session, PlatformInfo) == false)
    {
        return false;
    }
    BuildPartyMembers(Members);
    WI = GetWorldInfo();
    SearchClass = GetDataStoreGameSearch().GetCurrentGameSearch().Class;
    ScriptTrace();
    // End:0x2B7
    foreach WI.AllControllers(Class'Engine.PlayerController', PC)
    {
        // End:0x2B6
        if((!PC.IsLocalPlayerController() && PC.IsPrimaryPlayer()) && PC.PlayerReplicationInfo != none)
        {
            I = 0;
            J0x1BB:

            // End:0x2B6 [Loop If]
            if(I < Members.Length)
            {
                PlayerNetId = Members[I].NetId;
                // End:0x2A8
                if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(PlayerNetId, PC.PlayerReplicationInfo.UniqueId))
                {
                    PC.ClientTravelToSession(SessionName, SearchClass, PlatformInfo, bIsParty);
                    // End:0x2B6
                    continue;
                }
                I++;
                // [Loop Continue]
                goto J0x1BB;
            }
        }        
    }    
    return true;
    //return ReturnValue;    
}

function OnDestroyGameComplete_JoinSession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609], bIsParty;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGameComplete_JoinSession);
    // End:0xE4
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    // End:0x133
    if(bIsCancelPending)
    {
        // End:0x114
        if(!bIsQuickMatch)
        {
            CleanupJoin(bIsParty);
        }
        OnJoinGameComplete(SessionName, false);
        return;
    }
    // End:0x181
    if(!bWasSuccessful)
    {
        CleanupJoin(bIsParty);
        OnJoinGameComplete(SessionName, false);
        bInProgress = false;
        return;
    }
    JoinReservedSession(SessionToJoin);
    //return;    
}

function OnJoinMatchComplete()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609], bIsParty;
    local /*0x97E50000-0x00000000*/ private byte InviteMode;
    local /*0x97E50000-0x00000000*/ private @NULL PartySettings;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;

    GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinMatchComplete);
    // End:0xE4
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    // End:0x133
    if(bIsCancelPending)
    {
        // End:0x114
        if(!bIsQuickMatch)
        {
            CleanupJoin(bIsParty);
        }
        OnJoinGameComplete(SessionName, false);
        return;
    }
    // End:0x19D
    if(!bWasSuccessful && !Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        CleanupJoin(bIsParty);
        OnJoinGameComplete(SessionName, false);
        return;
    }
    // End:0x1F8
    if(bIsParty)
    {
        PartyOwnerNetId = SessionToJoin.GameSettings.OwningPlayerId;
        PartyOwnerSession = SessionToJoin;
    }
    // End:0x247
    if((!bDisableBeacons && IsInGame()) && bAllowHostMigration || bChooseOptimalHost)
    {
        RequestClientBandwidthTestBeaconConnect(SessionToJoin);
    }
    // End:0x29A
    if(bHasNextSessionToJoin)
    {
        bInProgress = false;
        bHasNextSessionToJoin = false;
        JoinGame(SessionToJoinNext, !bNextSessionUsePartyReservation);
        bNextSessionUsePartyReservation = false;
        return;
    }
    // End:0x3B9
    if(SessionNameGame != SessionNameParty)
    {
        PartySettings = GetPartySettings();
        // End:0x3B9
        if(PartySettings != none)
        {
            // End:0x3B9
            if(SessionToJoin.GameSettings.HasProperty(268435476) && SessionToJoin.GameSettings.GetIntProperty(268435476, PropValue))
            {
                InviteMode = byte(PropValue);
                // End:0x3B9
                if(int(InviteMode) > int(0))
                {
                    Class'LPOnlineGameSettings'.static.StaticSetInviteMode(PartySettings, 1);
                    UpdatePartySettings(PartySettings);
                }
            }
        }
    }
    // End:0x3EB
    if(GetWorldInfo().Pauser != none)
    {
        FinishJoinTravel();        
    }
    else
    {
        SetTimer(JoinFinalizeTime, false, 'FinishJoinTravel');
        __PendingTravelFunc__Delegate = FinishJoinTravel;
    }
    OnJoinGameComplete(SessionName, true);
    //return;    
}

function ResetDLCFilter()
{
    ScriptTrace();
    DLCIdFilter = 0;
    SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AdditionalRequiredDLC = 0;
    //return;    
}

function FinishJoinTravel()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsParty;
    local /*0x97E50000-0x00000000*/ private int GameType, MapIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName;
    local /*0x97E50000-0x00000000*/ private int MatchState;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private name SessionName;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;
    local /*0x97E50000-0x00000000*/ private editfixedsize string URL;

    __PendingTravelFunc__Delegate = None;
    // End:0xCE
    if(SessionToJoin.GameSettings.HasProperty(268435477) && SessionToJoin.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);        
    }
    SessionName = ((bIsParty) ? SessionNameParty : SessionNameGame);
    // End:0x23C
    if(!GameInterface.GetResolvedConnectString(SessionName, URL))
    {
        CleanupJoin(bIsParty);
        // End:0x21E
        if(!bIsQuickMatch)
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        OnJoinTravelFailed(SessionName);
        return false;
    }
    DestroyHostReservationBeacon();
    ClearDelegates();
    PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
    PC.ClientStopMovie(0.0000000, false, true, false);
    bIsTraveling = true;
    // End:0x2EA
    if(bAcceptedInvite)
    {
        Class'SPEngine.SPUIManager'.static.ClearUIMessage('ErrorMessage');
        ResetDLCFilter();
    }    
    GetWorldInfo().ConsoleCommand("start" @ URL);
    // End:0x3A9
    if(!SessionToJoin.GameSettings.HasProperty(268435475) || !SessionToJoin.GameSettings.GetIntProperty(268435475, GameType))
    {
    }
    // End:0x42C
    if(!SessionToJoin.GameSettings.HasProperty(268435472) || !SessionToJoin.GameSettings.GetIntProperty(268435472, MatchState))
    {
    }
    // End:0x502
    if(SessionToJoin.GameSettings.HasProperty(268435467) && SessionToJoin.GameSettings.GetIntProperty(268435467, MapIndex))
    {
        // End:0x4FF
        if(MapIndex >= 0)
        {
            MapName = Class'LPMPMapList'.default.HostMapList[MapIndex].MapName;
        }        
    }
    // End:0x547
    if(MatchState == 1)
    {
        Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie(MapName, byte(GameType));        
    }
    else
    {
        Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie("", 0);
    }
    bInProgress = false;
    bIsCancelPending = false;
    bAcceptedInvite = false;
    bIsTraveling = false;
    __OnJoinTravelFailed__Delegate = None;
    return true;
    //return ReturnValue;    
}

function OnGameInviteAcceptedID0()
{
    local /*0x97E50000-0x00000000*/ private @NULL InviteResult[25296897];

    OnGameInviteAccepted(0, InviteResult);
    //return;    
}

function OnGameInviteAcceptedID1()
{
    local /*0x97E50000-0x00000000*/ private @NULL InviteResult[25296897];

    OnGameInviteAccepted(1, InviteResult);
    //return;    
}

function OnGameInviteAcceptedID2()
{
    local /*0x97E50000-0x00000000*/ private @NULL InviteResult[25296897];

    OnGameInviteAccepted(2, InviteResult);
    //return;    
}

function OnGameInviteAcceptedID3()
{
    local /*0x97E50000-0x00000000*/ private @NULL InviteResult[25296897];

    OnGameInviteAccepted(3, InviteResult);
    //return;    
}

function ProcessDeferredInvites()
{
    // End:0x83
    if(DeferredInviteInfo.bHasDeferredInvite)
    {
        OnGameInviteAccepted(DeferredInviteInfo.ControllerId, DeferredInviteInfo.InviteResult, true);
        DeferredInviteInfo.bHasDeferredInvite = false;
    }
    //return;    
}

function OnGameInviteAccepted()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InviteResult[25296897];
    local /*0x97E50000-0x00000000*/ private bool bSkipStorageSelect[9437185], bSkipChatDisabledWarning, bIsParty;
    local /*0x97E50000-0x00000000*/ private int PropValue;
    local /*0x97E50000-0x00000000*/ private byte SessionType;
    local /*0x97E50000-0x00000000*/ private @NULL InvitedFEPC, FEPC_Controller0, PC, InvitedPC, MyEngine, MPManager;

    false
    false
    PS3Invitation_ControllerId_Original = ControllerId;
    PS3Invitation_InviteResult_Original = InviteResult;
    PS3Invitation_bSkipStorageSelect_Original = bSkipStorageSelect;
    bIsQuickMatch = false;
    InvitedPC = LPPlayerController(GetLocalPlayerController(ControllerId));
    // End:0x13C
    if(InvitedPC == none)
    {
        FEPC_Controller0 = LPFrontEndPC(GetLocalPlayerController(0));
        // End:0x13C
        if((FEPC_Controller0 != none) && FEPC_Controller0.MyLPGFxMovie_FrontEnd != none)
        {
            FEPC_Controller0.MyLPGFxMovie_FrontEnd.UnregisteredControllerButtonPress(ControllerId);
            InvitedPC = LPPlayerController(GetLocalPlayerController(ControllerId));
        }
    }
    // End:0x3B7
    if(InvitedPC != none)
    {
        InvitedFEPC = LPFrontEndPC(InvitedPC);
        // End:0x3B4
        if(InvitedFEPC != none)
        {
            // End:0x3B4
            if(!InvitedFEPC.IsMenuLoaded() || InvitedFEPC.MyLPGFxMovie_FrontEnd.bShouldDeferFrontEndInvites)
            {
                DeferredInviteInfo.bHasDeferredInvite = true;
                DeferredInviteInfo.ControllerId = ControllerId;
                DeferredInviteInfo.InviteResult = InviteResult;
                // End:0x3B2
                if(InvitedFEPC.MyLPGFxMovie_FrontEnd != none)
                {
                    // End:0x3B2
                    if(InvitedFEPC.IsAtTitleScreen() && InvitedFEPC.MyLPGFxMovie_FrontEnd.ActiveController == -1)
                    {
                        // End:0x33A
                        if(InvitedFEPC.MyLPGFxMovie_FrontEnd.bTitleScreenFadeInComplete)
                        {
                            InvitedFEPC.MyLPGFxMovie_FrontEnd.StartWithPlayer(ControllerId);                            
                        }
                        else
                        {
                            // End:0x3B2
                            if(Class'LPUIManager'.static.GetLPUIManager().OpenMessageBoxes.Length > 0)
                            {
                                InvitedFEPC.MyLPGFxMovie_FrontEnd.StartWithPlayer(ControllerId);
                            }
                        }
                    }
                }
                return;
            }
        }        
    }
    bIsCancelPending = false;
    bIsTraveling = false;
    // End:0x5B2
    if(OwningControllerIndex != ControllerId)
    {
        PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
        PC.ReturnToMainMenu();
        MPManager = Class'LPMultiplayerManager'.static.GetInstance();
        MPManager.DeferredInviteInfo.bHasDeferredInvite = true;
        MPManager.DeferredInviteInfo.ControllerId = ControllerId;
        MPManager.DeferredInviteInfo.InviteResult = InviteResult;
        MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
        // End:0x586
        if(MyEngine != none)
        {
            MyEngine.CurrentCheckpoint = none;
            MyEngine.SetCurrentDeviceID(-1);
        }
        Class'SPEngine.SPUIManager'.static.ClearUIMessage('ErrorMessage');
        return;
    }
    PC = LPPlayerController(GetLocalPlayerController(OwningControllerIndex));
    // End:0x704
    if(!CheckPlayerDLC(LPPRI(PC.PlayerReplicationInfo), InviteResult.GameSettings))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.DLCNeeded_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.InviteHandlingFailed_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    SessionToJoin = InviteResult;
    OnlineMode = 1;
    // End:0x764
    if(bInProgress || bIsMatchmaking)
    {
        CancelAll();
        SetTimer(0.1000000, false, 'OnCancelAll_GameInvite');
        return;
    }
    // End:0xB5D
    if(int(OnlineSub.PlayerInterface.CanPlayOnline(byte(OwningControllerIndex))) == int(0))
    {
        // End:0x8F6
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_CannotPlayOnlineMessagePS3>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_CannotPlayOnlineTitle>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_OK>");            
        }
        else
        {
            // End:0xA3E
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_CannotPlayOnlineMessageXBOX>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_CannotPlayOnlineTitle>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_OK>");                
            }
            else
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_CannotPlayOnlineMessage>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_CannotPlayOnlineTitle>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_OK>");
            }
        }
        return;
    }
    // End:0xCDF
    if(!bSkipChatDisabledWarning)
    {
        // End:0xCDF
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            // End:0xCDF
            if(int(OnlineSub.PlayerInterface.CanCommunicate(byte(OwningControllerIndex))) == int(0))
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ChatDisabled_MessagePS3>", "<Strings:SPGameUI.MessageBoxErrorStrings.ChatDisabled_Title>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_ReallyOK>",, OnOptionSelected_ChatDisabled);
                return;
            }
        }
    }
    // End:0xE6D
    if((!bSkipStorageSelect && Class'Engine.WorldInfo'.static.IsConsoleBuild(1)) && PC.IsAtTitleScreen())
    {
        OnlineSub.PlayerInterfaceEx.AddDeviceSelectionDoneDelegate(byte(OwningControllerIndex), NotifyDeviceSelectComplete_GameInvite);
        // End:0xE1C
        if(OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(byte(OwningControllerIndex), 2097152, false, SPEngine(Class'Engine.Engine'.static.GetEngine()).GetCurrentDeviceID() != -1))
        {
            return;            
        }
        else
        {
            OnlineSub.PlayerInterfaceEx.ClearDeviceSelectionDoneDelegate(byte(OwningControllerIndex), NotifyDeviceSelectComplete_GameInvite);
        }
    }
    bAcceptedInvite = true;
    // End:0xF29
    if(InviteResult.GameSettings.HasProperty(268435477) && InviteResult.GameSettings.GetIntProperty(268435477, PropValue))
    {
        SessionType = byte(PropValue);
        bIsParty = int(SessionType) == int(2);
    }
    // End:0xF4C
    if(SessionNameGame == SessionNameParty)
    {
        bIsParty = true;
    }
    bIsTraveling = true;
    __OnJoinGameComplete__Delegate = OnJoinGameComplete_GameInvite;
    OpenWaitingOnNetworkDialog("<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ConnectingDialog_Title>", "<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ConnectingDialog_Body>");
    // End:0x10B3
    if(bIsParty)
    {
        // End:0x1090
        if(InviteResult.GameSettings.bAllowJoinViaPresence && InviteResult.GameSettings.bAllowJoinViaPresenceFriendsOnly)
        {
            PartyOwnerInviteMode = 1;            
        }
        else
        {
            PartyOwnerInviteMode = 0;
        }
        JoinParty(InviteResult);        
    }
    else
    {
        JoinGame(InviteResult);
    }
    //return;    
}

function OnOptionSelected_ChatDisabled()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    OnGameInviteAccepted(PS3Invitation_ControllerId_Original, PS3Invitation_InviteResult_Original, PS3Invitation_bSkipStorageSelect_Original, true);
    return true;
    //return ReturnValue;    
}

function OnCancelAll_GameInvite()
{
    // End:0x28
    if(bIsCancelPending)
    {
        SetTimer(0.1000000, false, 'OnCancelAll_GameInvite');
        return;
    }
    OnGameInviteAccepted(OwningControllerIndex, SessionToJoin);
    //return;    
}

function NotifyDeviceSelectComplete_GameInvite()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineCommon;

    OnlineSub.PlayerInterfaceEx.ClearDeviceSelectionDoneDelegate(byte(OwningControllerIndex), NotifyDeviceSelectComplete_GameInvite);
    // End:0x151
    if(!bWasSuccessful)
    {
        Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.FrontEnd.ConfirmNoSaveInfo>", "<Strings:LostPlanetGame.FrontEnd.ConfirmNoSaveTitle>", "<Strings:LostPlanetGame.PauseMenu.No>,<Strings:LostPlanetGame.PauseMenu.Yes>",, OnOptionSelected_ConfirmNoSave, true);
        return;
    }
    OnGameInviteAccepted(OwningControllerIndex, SessionToJoin, true);
    // End:0x1C9
    if(OnlineSub != none)
    {
        OnlineCommon = OnlineSubsystemCommonImpl(OnlineSub);
        // End:0x1C9
        if(OnlineCommon != none)
        {
            OnlineCommon.SetDeviceSelectionUIIsShown(false);
        }
    }
    //return;    
}

function OnOptionSelected_ConfirmNoSave()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x144
    if(SelectedButtonIndex == 1)
    {
        OnlineSub.PlayerInterfaceEx.AddDeviceSelectionDoneDelegate(byte(OwningControllerIndex), NotifyDeviceSelectComplete_GameInvite);
        // End:0xF3
        if(OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(byte(OwningControllerIndex), 2097152, false, SPEngine(Class'Engine.Engine'.static.GetEngine()).GetCurrentDeviceID() != -1))
        {
            return true;            
        }
        else
        {
            OnlineSub.PlayerInterfaceEx.ClearDeviceSelectionDoneDelegate(byte(OwningControllerIndex), NotifyDeviceSelectComplete_GameInvite);
        }
    }
    OnGameInviteAccepted(OwningControllerIndex, SessionToJoin, true);
    return true;
    //return ReturnValue;    
}

function OnJoinGameComplete_GameInvite()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LocPlayer, Movie;
    local /*0x97E50000-0x00000000*/ private int I;

    __OnJoinGameComplete__Delegate = None;
    CloseWaitingOnNetworkDialog();
    // End:0x4F
    if(__OnDisbandPartyRequestComplete__Delegate != none)
    {
        __OnDisbandPartyRequestComplete__Delegate = None;
    }
    bIsJoining = bWasSuccessful;
    // End:0x73
    if(bWasSuccessful)
    {
        return;
    }
    // End:0x1D4
    if((PrevControllerIndex >= 0) && PrevControllerIndex != OwningControllerIndex)
    {
        LocPlayer = GetLocalPlayer(OwningControllerIndex);
        LocPlayer.SetControllerId(PrevControllerIndex);
        // End:0x13D
        foreach Class'SPEngine.SPUtil'.static.AllMoviePlayers(Class'GFxUI.GFxMoviePlayer', Movie)
        {
            Movie.LocalPlayerOwnerIndex = PrevControllerIndex;            
        }        
        OwningControllerIndex = PrevControllerIndex;
        OwningNetId = GetUniqueNetId(PrevControllerIndex);
        PrevControllerIndex = -1;
        I = 0;
        J0x188:

        // End:0x1D4 [Loop If]
        if(I < 4)
        {
            // End:0x1B2
            if(I == OwningControllerIndex)
            {                
            }
            else
            {
                SetPlayerOnlineStatus(I, 0);
            }
            ++I;
            // [Loop Continue]
            goto J0x188;
        }
    }
    //return;    
}

function CancelFindOnlineGames()
{
    GameInterface.ClearFindOnlineGamesCompleteDelegate(OnSearchResults);
    GameInterface.CancelFindOnlineGames();
    bInProgress = false;
    //return;    
}

function FindOnlineGames()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreGameSearch, GameSearch;

    DataStoreGameSearch = GetDataStoreGameSearch();
    // End:0xA2
    if(DataStoreGameSearch.GetCurrentGameSearch() == none)
    {
        // End:0x79
        if(int(OnlineMode) == int(2))
        {
            DataStoreGameSearch.SetCurrentByName('DefaultLAN');            
        }
        else
        {
            DataStoreGameSearch.SetCurrentByName('Default');
        }
    }
    GameSearch = LPOnlineGameSearch(DataStoreGameSearch.GetCurrentGameSearch());
    // End:0x109
    if(int(OnlineMode) == int(2))
    {
        GameSearch.bIsLanQuery = true;
    }
    GameInterface.ClearFindOnlineGamesCompleteDelegate(OnSearchResults);
    GameInterface.AddFindOnlineGamesCompleteDelegate(OnSearchResults);
    // End:0x1A6
    if(!GameInterface.FindOnlineGames(byte(OwningControllerIndex), GameSearch))
    {
        return false;
    }
    SetTimer(FindGameTimeout, false, 'OnSearchResultsTimeout');
    return true;
    //return ReturnValue;    
}

function OnSearchResults()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private int NumResults;
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreGameSearch, GameSearch;

    ClearTimer('OnSearchResultsTimeout');
    DataStoreGameSearch = GetDataStoreGameSearch();
    GameSearch = LPOnlineGameSearch(DataStoreGameSearch.GetCurrentGameSearch());
    // End:0x69
    if(bWasSuccessful == false)
    {
    }
    NumResults = GameSearch.Results.Length;
    // End:0xA1
    if(NumResults == 0)
    {
    }
    // End:0x128
    if(GameSearch.bIsSearchInProgress == false)
    {
        GameInterface.ClearFindOnlineGamesCompleteDelegate(OnSearchResults);
        OnFindOnlineGamesComplete(GameSearch.Results);
    }
    //return;    
}

function OnSearchResultsTimeout()
{
    OnSearchResults(false);
    //return;    
}

function OptimalHostSelection()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], OptimalHostResult;
    local /*0x97E50000-0x00000000*/ private float BestHostingScore, ClientScore, GoodHostRatio;
    local /*0x97E50000-0x00000000*/ private int MeshClientIdx, MinutesSinceLastTest;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Weights;
    local /*0x97E50000-0x00000000*/ private @NULL Profile;
    local /*0x97E50000-0x00000000*/ private editfixedsize array BandwidthHistory;
    local /*0x97E50000-0x00000000*/ private @NULL TempBandwidthEntry;

    Weights.Length = 5;
    Weights[0] = 5.0000000;
    Weights[1] = 4.0000000;
    Weights[2] = 3.0000000;
    Weights[3] = 2.0000000;
    Weights[4] = 1.0000000;
    OptimalHostResult = GetGameSettings().OwningPlayerId;
    // End:0xA7
    if(HostBandwidthTestBeacon == none)
    {
        return OptimalHostResult;
    }
    Profile = LPProfileSettings(OnlineSub.PlayerInterface.GetProfileSettings(byte(OwningControllerIndex)));
    // End:0x22C
    if(Profile != none)
    {
        Profile.ReadBandwidthHistory(BandwidthHistory, MinutesSinceLastTest);
        // End:0x185
        if(MinutesSinceLastTest >= MaxBandwidthHistoryAgeMinutes)
        {
            BandwidthHistory.Length = 0;
            Profile.SaveBandwidthHistory(BandwidthHistory);
        }
        GoodHostRatio = 1.0000000;
        J0x194:

        // End:0x1F2 [Loop If]
        if(BandwidthHistory.Length < MinBandwidthHistoryEntries)
        {
            TempBandwidthEntry.UpstreamRate = (256 * 1024) / 8;
            BandwidthHistory.AddItem(TempBandwidthEntry);            
            // [Loop Continue]
            goto J0x194;
        }
        BestHostingScore = CalcWeightedUpstreamAvg(BandwidthHistory, Weights);
        BestHostingScore *= GoodHostRatio;
    }
    MeshClientIdx = 0;
    J0x237:

    // End:0x41D [Loop If]
    if(MeshClientIdx < HostBandwidthTestBeacon.ClientConnections.Length)
    {
        // End:0x40F
        if(HostBandwidthTestBeacon.ClientConnections[MeshClientIdx].bCanHostVs && HostBandwidthTestBeacon.ClientConnections[MeshClientIdx].BandwidthHistory.Length >= MinBandwidthHistoryEntries)
        {
            BandwidthHistory = HostBandwidthTestBeacon.ClientConnections[MeshClientIdx].BandwidthHistory;
            ClientScore = CalcWeightedUpstreamAvg(BandwidthHistory, Weights);
            ClientScore *= HostBandwidthTestBeacon.ClientConnections[MeshClientIdx].GoodHostRatio;
            // End:0x40F
            if(ClientScore > BestHostingScore)
            {
                BestHostingScore = ClientScore;
                OptimalHostResult = HostBandwidthTestBeacon.ClientConnections[MeshClientIdx].PlayerNetId;
            }
        }
        MeshClientIdx++;
        // [Loop Continue]
        goto J0x237;
    }
    return OptimalHostResult;
    //return ReturnValue;    
}

static function CalcWeightedUpstreamAvg()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array BandwidthHistory[25296897], Weights;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int BandwidthIdx, WeightIdx;
    local /*0x97E50000-0x00000000*/ private float AvgResult, CurWeight, WeightSum;

    // End:0xF6
    if(BandwidthHistory.Length > 0)
    {
        CurWeight = 1.0000000;
        BandwidthIdx = 0;
        J0x2A:

        // End:0xE2 [Loop If]
        if(BandwidthIdx < BandwidthHistory.Length)
        {
            // End:0x82
            if(WeightIdx < Weights.Length)
            {
                CurWeight = Weights[WeightIdx];
                WeightIdx++;
            }
            WeightSum += CurWeight;
            AvgResult += (float(BandwidthHistory[BandwidthIdx].UpstreamRate) * CurWeight);
            BandwidthIdx++;
            // [Loop Continue]
            goto J0x2A;
        }
        AvgResult /= WeightSum;
    }
    return AvgResult;
    //return ReturnValue;    
}

function ServerTravelToOptimalHost()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array HostPlayers, Players;

    HostReservationBeacon.__OnReservationsFull__Delegate = None;
    HostReservationBeacon.__OnReservationChange__Delegate = None;
    HostReservationBeacon.__OnReservationReceived__Delegate = None;
    OptimalHostPlayerId = OptimalHostSelection();
    // End:0xE6
    if(EqualEqual_UniqueNetIdUniqueNetId(OptimalHostPlayerId, GetGameSettings().OwningPlayerId))
    {
        HostTravel();        
    }
    else
    {
        // End:0x12E
        if(HostReservationBeacon != none)
        {
            CopyCurrentPlayersFromBeacon(HostReservationBeacon, HostPlayers);
            CopyCurrentPlayersToPlayerMembers(HostPlayers, Players);
        }
        // End:0x1F0
        if(HostBandwidthTestBeacon.RequestClientCreateNewSession(OptimalHostPlayerId, SessionNameGame, GetDataStoreGameSearch().GetCurrentGameSearch().Class, Players))
        {
            HostBandwidthTestBeacon.__OnReceivedClientCreateNewSessionResult__Delegate = OnHostMeshReceivedOptimalGameSession;
            SetTimer(OptimalHostWaitTime, false, 'HostMeshOptimalGameSessionTimeout');            
        }
        else
        {
            HostTravel();
        }
    }
    //return;    
}

function HostMeshOptimalGameSessionTimeout()
{
    HostBandwidthTestBeacon.__OnReceivedClientCreateNewSessionResult__Delegate = None;
    HostTravel();
    //return;    
}

function OnHostMeshReceivedOptimalGameSession()
{
    local /*0x97E50000-0x00000000*/ private bool bSucceeded[8388609];
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte PlatformSpecificInfo[25297036];
    local /*0x97E50000-0x00000000*/ private @NULL OptimalHostSearch;

    HostBandwidthTestBeacon.__OnReceivedClientCreateNewSessionResult__Delegate = None;
    ClearTimer('HostMeshOptimalGameSessionTimeout');
    // End:0x21C
    if(bSucceeded)
    {
        OptimalHostSearch = new SearchClass;
        // End:0x20F
        if(OnlineSub.GameInterface.BindPlatformSpecificSessionToSearch(byte(OwningControllerIndex), OptimalHostSearch, PlatformSpecificInfo))
        {
            // End:0x202
            if(OptimalHostSearch.Results.Length > 0)
            {
                SessionToJoin = OptimalHostSearch.Results[0];
                HostReservationBeacon.__OnReservationsFull__Delegate = None;
                HostReservationBeacon.__OnReservationChange__Delegate = None;
                HostReservationBeacon.__OnReservationReceived__Delegate = None;
                HostBandwidthTestBeacon.TellClientsToTravel(SessionName, SearchClass, PlatformSpecificInfo);
                SetTimer(MeshFinalizeTime, false, 'DelayedTravelHostToNewOptimalSession');
                bIsTraveling = true;                
            }
            else
            {
                HostTravel();
            }            
        }
        else
        {
            HostTravel();
        }        
    }
    else
    {
        HostTravel();
    }
    //return;    
}

function DelayedTravelHostToNewOptimalSession()
{
    DestroyGameHostBeacons();
    DestroyOnlineGame(OnDestroyGameComplete_TravelToOptimalHost);
    //return;    
}

function OnDestroyGameComplete_TravelToOptimalHost()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGameComplete_TravelToOptimalHost);
    JoinReservedSession(SessionToJoin);
    RequestClientBandwidthTestBeaconConnect(SessionToJoin);
    //return;    
}

function CreateHostBandwidthTestBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL Settings[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private class BeaconClass;
    local /*0x97E50000-0x00000000*/ private @NULL Beacon;

    BeaconClass = class<MeshBeaconHost>(FindObject(HostBandwidthTestBeaconClassName, Class'Core.Class'));
    Beacon = new BeaconClass;
    // End:0x58
    if(Beacon == none)
    {
        return none;
    }
    Beacon.BeaconName = 'HostMeshBandwidth';
    // End:0x153
    if(Beacon.InitHostBeacon(Settings.OwningPlayerId))
    {
        Beacon.__OnReceivedClientConnectionRequest__Delegate = OnHostReceivedClientConnectionRequest;
        Beacon.__OnStartedBandwidthTest__Delegate = OnHostStartedBandwidthTest;
        Beacon.__OnFinishedBandwidthTest__Delegate = OnHostFinishedBandwidthTest;        
    }
    else
    {
        Beacon.DestroyBeacon();
        Beacon = none;
    }
    return Beacon;
    //return ReturnValue;    
}

function DestroyHostBandwidthTestBeacon()
{
    // End:0x39
    if(HostBandwidthTestBeacon != none)
    {
        HostBandwidthTestBeacon.DestroyBeacon();
        HostBandwidthTestBeacon = none;
    }
    //return;    
}

function OnHostFinishedBandwidthTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609];
    local /*0x97E50000-0x00000000*/ private byte TestType[8388609], TestResult;
    local /*0x97E50000-0x00000000*/ private @NULL BandwidthStats[25296897];

    //return;    
}

function OnHostReceivedClientConnectionRequest()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewClientConnection[25296897];

    // End:0x11
    if(HostBandwidthTestBeacon == none)
    {
        return;
    }
    // End:0x9A
    if(NewClientConnection.BandwidthHistory.Length < HostBandwidthTestBeacon.MaxBandwidthHistoryEntries)
    {
        HostBandwidthTestBeacon.RequestClientBandwidthTest(NewClientConnection.PlayerNetId, 0, UpstreamBandwidthTestSize);        
    }
    //return;    
}

function OnHostStartedBandwidthTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609];
    local /*0x97E50000-0x00000000*/ private byte TestType[8388609];

    //return;    
}

function OnMigrateOnlineGameComplete()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, HostPlayerID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players;

    // End:0x11
    if(!bWasSuccessful)
    {
        return;
    }
    DestroyGameClientBeacons();
    DestroyGameHostBeacons();
    GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
    // End:0x96
    if(!bDisableBeacons)
    {
        HostReservationBeacon = CreateHostReservationBeacon(GameSettings, SessionName);
    }
    // End:0x1C0
    if(HostReservationBeacon != none)
    {
        HostReservationBeacon.__OnReservationChange__Delegate = OnReservationChange_Game;
        HostReservationBeacon.__OnClientCancellationReceived__Delegate = OnClientCancellationReceived_Game;
        HostReservationBeacon.__OnReservationReceived__Delegate = OnReservationReceived_Game;
        HostPlayerID = GetUniqueNetId(OwningControllerIndex);
        BuildPartyMembers(Players);
        // End:0x1A3
        if(int(HostReservationBeacon.AddPartyReservationEntry(HostPlayerID, Players, 0, true)) != int(6))
        {
        }
        HostBandwidthTestBeacon = CreateHostBandwidthTestBeacon(GameSettings);
    }
    //return;    
}

function CreateClientBandwidthTestBeacon()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class BeaconClass;
    local /*0x97E50000-0x00000000*/ private @NULL Beacon;

    BeaconClass = class<MeshBeaconClient>(FindObject(ClientBandwidthTestBeaconClassName, Class'Core.Class'));
    Beacon = new BeaconClass;
    // End:0x58
    if(Beacon == none)
    {
        return none;
    }
    Beacon.BeaconName = 'ClientMeshBandwidth';
    return Beacon;
    //return ReturnValue;    
}

function DestroyClientBandwidthTestBeacon()
{
    // End:0x39
    if(ClientBandwidthTestBeacon != none)
    {
        ClientBandwidthTestBeacon.DestroyBeacon();
        ClientBandwidthTestBeacon = none;
    }
    //return;    
}

function RequestClientBandwidthTestBeaconConnect()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredHost[25296897], ClientRequest, ConnectingPlayer, Profile;

    ConnectingPlayer = GetUniqueNetId(OwningControllerIndex);
    ClientRequest.PlayerNetId = ConnectingPlayer;
    ClientRequest.NatType = GetNATType();
    ClientRequest.bCanHostVs = true;
    ClientRequest.GoodHostRatio = 1.0000000;
    Profile = LPProfileSettings(OnlineSub.PlayerInterface.GetProfileSettings(byte(OwningControllerIndex)));
    // End:0x1EB
    if(Profile != none)
    {
        Profile.ReadBandwidthHistory(ClientRequest.BandwidthHistory, ClientRequest.MinutesSinceLastTest);
        // End:0x1E8
        if(ClientRequest.MinutesSinceLastTest >= MaxBandwidthHistoryAgeMinutes)
        {
            ClientRequest.BandwidthHistory.Length = 0;
            Profile.SaveBandwidthHistory(ClientRequest.BandwidthHistory);
        }        
    }
    // End:0x204
    if(ClientBandwidthTestBeacon != none)
    {
        DestroyClientBandwidthTestBeacon();
    }
    ClientBandwidthTestBeacon = CreateClientBandwidthTestBeacon();
    // End:0x229
    if(ClientBandwidthTestBeacon == none)
    {
        return;
    }
    // End:0x26C
    if(!ClientBandwidthTestBeacon.RequestConnection(DesiredHost, ClientRequest, false))
    {
        DestroyClientBandwidthTestBeacon();
        return;
    }
    ClientBandwidthTestBeacon.__OnConnectionRequestResult__Delegate = OnClientMeshConnectionRequestResult;
    ClientBandwidthTestBeacon.__OnReceivedBandwidthTestRequest__Delegate = OnClientMeshReceivedBandwidthTestRequest;
    ClientBandwidthTestBeacon.__OnReceivedBandwidthTestResults__Delegate = OnClientMeshReceivedBandwidthTestResults;
    ClientBandwidthTestBeacon.__OnTravelRequestReceived__Delegate = OnClientMeshTravelRequestReceived;
    ClientBandwidthTestBeacon.__OnCreateNewSessionRequestReceived__Delegate = OnClientMeshCreateNewSessionRequestReceived;
    //return;    
}

function OnClientMeshConnectionRequestResult()
{
    local /*0x97E50000-0x00000000*/ private byte ConnectionResult[8388609];

    ClientBandwidthTestBeacon.__OnConnectionRequestResult__Delegate = None;
    // End:0x44
    if(int(ConnectionResult) != int(0))
    {
    }
    //return;    
}

function OnClientMeshReceivedBandwidthTestRequest()
{
    local /*0x97E50000-0x00000000*/ private byte TestType[8388609];

    //return;    
}

function OnClientMeshReceivedBandwidthTestResults()
{
    local /*0x97E50000-0x00000000*/ private byte TestType[8388609], TestResult;
    local /*0x97E50000-0x00000000*/ private @NULL BandwidthStats[25296897], Profile;
    local /*0x97E50000-0x00000000*/ private editfixedsize array BandwidthHistory;
    local /*0x97E50000-0x00000000*/ private int MinutesSinceLastTest;
    local /*0x97E50000-0x00000000*/ private @NULL NewBandwidthStats;

    Profile = LPProfileSettings(OnlineSub.PlayerInterface.GetProfileSettings(byte(OwningControllerIndex)));
    // End:0x199
    if(Profile != none)
    {
        // End:0x196
        if(int(TestResult) == int(0))
        {
            NewBandwidthStats = BandwidthStats;
            Profile.ReadBandwidthHistory(BandwidthHistory, MinutesSinceLastTest);
            // End:0x101
            if(BandwidthHistory.Length < ClientBandwidthTestBeacon.MaxBandwidthHistoryEntries)
            {
                BandwidthHistory.InsertItem(0, NewBandwidthStats);                                
            }
            else
            {
                BandwidthHistory.InsertItem(0, NewBandwidthStats);                
                BandwidthHistory.Remove(ClientBandwidthTestBeacon.MaxBandwidthHistoryEntries, BandwidthHistory.Length - ClientBandwidthTestBeacon.MaxBandwidthHistoryEntries);                
            }
            Profile.SaveBandwidthHistory(BandwidthHistory);            
        }        
    }
    //return;    
}

function OnClientMeshTravelRequestReceived()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte PlatformSpecificInfo[25297036];
    local /*0x97E50000-0x00000000*/ private @NULL TravelSearch;

    // End:0x22
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return;
    }
    TravelSearch = new SearchClass;
    // End:0x4B
    if(TravelSearch == none)
    {
        return;
    }
    GameInterface.BindPlatformSpecificSessionToSearch(byte(OwningControllerIndex), TravelSearch, PlatformSpecificInfo);
    // End:0xAF
    if(TravelSearch.Results.Length <= 0)
    {
        return;
    }
    SessionToJoin = TravelSearch.Results[0];
    SetTimer(MeshFinalizeTime, false, 'DelayedTravelClientToNewHostSession');
    //return;    
}

function DelayedTravelClientToNewHostSession()
{
    JoinReservedSession(SessionToJoin);
    RequestClientBandwidthTestBeaconConnect(SessionToJoin);
    //return;    
}

function OnClientMeshCreateNewSessionRequestReceived()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players[25296897];
    local /*0x97E50000-0x00000000*/ private int PlayerIdx;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId, ZeroId, GameSettings, NewGameSettings;
    local /*0x97E50000-0x00000000*/ private byte PlatformInfo[140];

    bInProgress = true;
    bIsCancelPending = false;
    PlayerIdx = 0;
    J0x23:

    // End:0x98 [Loop If]
    if(PlayerIdx < Players.Length)
    {
        PlayerNetId = Players[PlayerIdx].NetId;
        // End:0x8A
        if(NotEqual_UniqueNetIdUniqueNetId(PlayerNetId, ZeroId))
        {
        }
        PlayerIdx++;
        // [Loop Continue]
        goto J0x23;
    }
    CopyPlayerMembersToCurrentPlayers(Players, OptimalHostConnectingPlayers);
    GetDataStoreGameSearch().SetCurrentByName(((int(OnlineMode) == int(2)) ? 'DefaultLAN' : 'Default'));
    GetDataStoreGameSettings().SetCurrentByName(((int(OnlineMode) == int(2)) ? 'DefaultLAN' : 'Default'));
    GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
    NewGameSettings = LPOnlineGameSettings(GetDataStoreGameSettings().GetCurrentGameSettings());
    // End:0x208
    if(GameSettings != none)
    {
        NewGameSettings.CopyGameSettings(GameSettings);
        DestroyOnlineGame(OnDestroyGame_ClientMesh);
        return;
    }
    GameInterface.AddCreateOnlineGameCompleteDelegate(OnCreateGameComplete_ClientMesh);
    // End:0x2F0
    if(!GameInterface.CreateOnlineGame(byte(OwningControllerIndex), SessionName, NewGameSettings))
    {
        ClientBandwidthTestBeacon.SendHostNewGameSessionResponse(false, SessionName, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo);
        bInProgress = false;
        return;
    }
    //return;    
}

function OnDestroyGame_ClientMesh()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings;
    local /*0x97E50000-0x00000000*/ private byte PlatformInfo[140];

    GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyGame_ClientMesh);
    GameSettings = LPOnlineGameSettings(GetDataStoreGameSettings().GetCurrentGameSettings());
    GameInterface.AddCreateOnlineGameCompleteDelegate(OnCreateGameComplete_ClientMesh);
    // End:0x14C
    if(!GameInterface.CreateOnlineGame(byte(OwningControllerIndex), SessionName, GameSettings))
    {
        ClientBandwidthTestBeacon.SendHostNewGameSessionResponse(false, SessionName, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo);
        bInProgress = false;
        return;
    }
    //return;    
}

function OnCreateGameComplete_ClientMesh()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings;
    local /*0x97E50000-0x00000000*/ private int PlayerIdx;
    local /*0x97E50000-0x00000000*/ private byte PlatformInfo[140];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players;
    local /*0x97E50000-0x00000000*/ private @NULL PlayersList;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Reservations;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TravelURL;

    GameInterface.ClearCreateOnlineGameCompleteDelegate(OnCreateGameComplete_ClientMesh);
    GameInterface.ClearUpdateOnlineGameCompleteDelegate(OnCreateGameComplete_ClientMesh);
    // End:0xF1
    if(!bWasSuccessful)
    {
        ClientBandwidthTestBeacon.SendHostNewGameSessionResponse(false, SessionName, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo);
        DestroyOnlineGame();
        bInProgress = false;
        return;
    }
    GameSettings = GetLPGameSettings();
    // End:0x1BC
    if(!GameInterface.ReadPlatformSpecificSessionInfoBySessionName(SessionName, PlatformInfo))
    {
        ClientBandwidthTestBeacon.SendHostNewGameSessionResponse(false, SessionName, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo);
        DestroyOnlineGame();
        bInProgress = false;
        return;
    }
    // End:0x241
    if(!ClientBandwidthTestBeacon.SendHostNewGameSessionResponse(true, SessionName, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo))
    {
        DestroyOnlineGame();
        bInProgress = false;
        return;
    }
    ClientBandwidthTestBeacon.__OnTravelRequestReceived__Delegate = None;
    ClientBandwidthTestBeacon.__OnCreateNewSessionRequestReceived__Delegate = None;
    // End:0x340
    if(ClientReservationBeacon != none)
    {
        ClientReservationBeacon.__OnHostIsReady__Delegate = None;
        ClientReservationBeacon.__OnTravelRequestReceived__Delegate = None;
        ClientReservationBeacon.__OnHostHasCancelled__Delegate = None;
    }
    PlayerIdx = 0;
    J0x34B:

    // End:0x3A4 [Loop If]
    if(PlayerIdx < OptimalHostConnectingPlayers.Length)
    {
        Players.AddItem(OptimalHostConnectingPlayers[PlayerIdx].NetId);        
        PlayerIdx++;
        // [Loop Continue]
        goto J0x34B;
    }
    // End:0x3E6
    if(Players.Length > 0)
    {
        GameInterface.RegisterPlayers(SessionNameGame, Players);
    }
    PlayersList = OnlineRecentPlayersList(OnlineSub.GetNamedInterface('RecentPlayersList'));
    // End:0x458
    if(PlayersList != none)
    {
        PlayersList.SetCurrentPlayersList(OptimalHostConnectingPlayers);
    }
    OptimalHostPlayerId = GetUniqueNetId(OwningControllerIndex);
    DestroyGameHostBeacons();
    // End:0x4B4
    if(!bDisableBeacons)
    {
        HostReservationBeacon = CreateHostReservationBeacon(GameSettings, SessionName);
    }
    // End:0x5CA
    if(HostReservationBeacon != none)
    {
        HostReservationBeacon.__OnReservationChange__Delegate = OnReservationChange_Game;
        HostReservationBeacon.__OnClientCancellationReceived__Delegate = OnClientCancellationReceived_Game;
        HostReservationBeacon.__OnReservationReceived__Delegate = OnReservationReceived_Game;
        BuildPlayerReservationList(Players, Reservations);
        // End:0x5AD
        if(int(HostReservationBeacon.AddPartyReservationEntry(OptimalHostPlayerId, Reservations, 0, true)) != int(6))
        {
        }
        HostBandwidthTestBeacon = CreateHostBandwidthTestBeacon(GameSettings);
    }
    TravelURL = BuildHostTravelURL(GameSettings);
    Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie(string(GameSettings.GetMapName()), byte(GameSettings.GetGameType()));
    bIsTraveling = true;
    GetWorldInfo().ServerTravel(TravelURL, true, true);
    GetWorldInfo().Game.TellClientsToTravelToSession(SessionNameGame, GetDataStoreGameSearch().GetCurrentGameSearch().Class, PlatformInfo, false);
    SetTimer(HostFinalizeTime, false, 'DestroyGameClientBeacons');
    bInProgress = false;
    //return;    
}

function StartQuickMatch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bInProgress)
    {
        return false;
    }
    bIsQuickMatch = true;
    SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AdditionalRequiredDLC = 0;
    CurrentQuickMatchStage = 0;
    return StartQuickMatchStage(CurrentQuickMatchStage);
    //return ReturnValue;    
}

function CancelQuickMatch()
{
    bIsCancelPending = true;
    //return;    
}

function StartQuickMatchStage()
{
    local /*0x97E50000-0x00000000*/ private int stage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DataStore, GameSearch;
    local /*0x97E50000-0x00000000*/ private byte GameType;
    local /*0x97E50000-0x00000000*/ private int MyMinRequiredDLC, MyInstalledDLC, MaxStage, Index;

    // End:0x0F
    if(bInProgress)
    {
        return false;
    }
    // End:0x6B
    if(bIsCancelPending)
    {
        OnQuickMatchUpdate(0);
        OnQuickMatchComplete(true);
        bIsMatchmaking = false;
        bIsCancelPending = false;
        bInProgress = false;
        return true;
    }
    // End:0xBA
    if(!CheckIsPlayerOnline(OwningControllerIndex))
    {
        OnQuickMatchUpdate(0);
        OnQuickMatchComplete(false);
        bIsMatchmaking = false;
        return false;
    }
    bIsMatchmaking = true;
    DataStore = GetDataStoreGameSearch();
    // End:0xF7
    if(DLCIdFilter != 0)
    {
        MaxStage = 1;        
    }
    else
    {
        MaxStage = 3;
    }
    // End:0x2EC
    if((stage >= MaxStage) || (GetPartySize()) >= 5)
    {
        bIsMatchmaking = false;
        Index = DataStore.FindSearchConfigurationIndex('Default');
        // End:0x269
        if((Index == -1) || Index == DataStore.SelectedIndex)
        {
            // End:0x1E2
            if(bGroupPartyMembers)
            {
                Index = Rand(5 - (((GetPartySize()) > 3) ? 2 : 1));                
            }
            else
            {
                Index = Rand(5 - (((GetPartySize()) > 6) ? 2 : 1));
            }
            GameType = byte(Index + 1);
            // End:0x256
            if((int(GameType) < int(1)) || int(GameType) > int(4))
            {
                GameType = 3;
            }
            SetDataStoreByGameType(GameType);
        }
        __OnCreateGameComplete__Delegate = OnCreateGameComplete_QuickMatch;
        OnQuickMatchUpdate(4);
        SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AdditionalRequiredDLC = DLCIdFilter;
        return HostGame();
    }
    GameSearch = LPOnlineGameSearch(DataStore.GetCurrentGameSearch());
    // End:0x3B0
    if(GameSearch == none)
    {
        __OnCreateGameComplete__Delegate = OnCreateGameComplete_QuickMatch;
        OnQuickMatchUpdate(4);
        SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AdditionalRequiredDLC = DLCIdFilter;
        return HostGame();
    }
    GameSearch.SetIntProperty(268435477, 1);
    GameSearch.SetIntProperty(268435478, GetPartySize());
    MyMinRequiredDLC = DLCIdFilter | SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetMinRequiredDLCIdsToJoin();
    GameSearch.SetIntProperty(268435518, MyMinRequiredDLC);
    MyInstalledDLC = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCIds();
    switch(stage)
    {
        // End:0x63E
        case 0:
            GameSearch.SetIntProperty(268435519, MyInstalledDLC);
            // End:0x5AE
            if(DLCIdFilter != 0)
            {
                GameSearch.Query.ValueIndex = GameSearch.QueryId_DLCMinRequired;
                GameSearch.FilterQuery = GameSearch.FilterQuery_DLCMinRequired;                
            }
            else
            {
                GameSearch.Query.ValueIndex = GameSearch.QueryId_DLCExact;
                GameSearch.FilterQuery = GameSearch.FilterQuery_DLCExact;
            }
            // End:0x7C2
            break;
        // End:0x6F7
        case 1:
            GameSearch.Query.ValueIndex = GameSearch.QueryId_DLCAny;
            GameSearch.SetIntProperty(268435519, 0);
            GameSearch.FilterQuery = GameSearch.FilterQuery_DLCAny;
            // End:0x7C2
            break;
        // End:0xFFFF
        default:
            GameSearch.Query.ValueIndex = GameSearch.default.Query.ValueIndex;
            GameSearch.SetIntProperty(268435519, 0);
            GameSearch.FilterQuery = GameSearch.default.FilterQuery;
            // End:0x7C2
            break;
            break;
    }
    QuickMatchSearchResults.Length = 0;
    __OnFindOnlineGamesComplete__Delegate = OnQuickMatchSearchComplete;
    // End:0x82A
    if(!FindOnlineGames())
    {
        __OnFindOnlineGamesComplete__Delegate = None;
        OnQuickMatchUpdate(0);
        return false;
    }
    OnQuickMatchUpdate(1);
    return true;
    //return ReturnValue;    
}

function StartQuickMatchNextStage()
{
    CurrentQuickMatchStage++;
    StartQuickMatchStage(CurrentQuickMatchStage);
    //return;    
}

function OnQuickMatchSearchComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8519681], FilteredResults;

    __OnFindOnlineGamesComplete__Delegate = None;
    // End:0x77
    if(bIsCancelPending)
    {
        OnQuickMatchUpdate(0);
        OnQuickMatchComplete(true);
        bIsMatchmaking = false;
        bIsCancelPending = false;
        bInProgress = false;
        return;
    }
    OnQuickMatchUpdate(2);
    FilterQuickMatchResults(Results, FilteredResults);
    FilteredResults.Sort(QuickMatchResultsSortFunc);    
    // End:0x10B
    if(FilteredResults.Length == 0)
    {
        SetTimer(SearchWaitTime, false, 'StartQuickMatchNextStage');
        OnQuickMatchUpdate(1);
        return;
    }
    QuickMatchSearchResults = FilteredResults;
    CurrentQuickMatchResult = 0;
    JoinQuickMatchGame(QuickMatchSearchResults[CurrentQuickMatchResult]);
    //return;    
}

function OnJoinGameComplete_QuickMatch()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    __OnJoinGameComplete__Delegate = None;
    // End:0x82
    if(bIsCancelPending)
    {
        OnQuickMatchUpdate(0);
        OnQuickMatchComplete(true);
        CleanupJoin(false);
        bIsMatchmaking = false;
        bIsCancelPending = false;
        bInProgress = false;
        return;
    }
    bIsJoining = bWasSuccessful;
    // End:0xC6
    if(bWasSuccessful)
    {
        bIsMatchmaking = false;
        OnQuickMatchComplete(true);
        return;
    }
    // End:0xFE
    if(!CheckIsPlayerOnline(OwningControllerIndex))
    {
        CancelQuickMatch();
        OnQuickMatchComplete(false);
        return;
    }
    CurrentQuickMatchResult++;
    // End:0x141
    if(CurrentQuickMatchResult < QuickMatchSearchResults.Length)
    {
        JoinQuickMatchGame(QuickMatchSearchResults[CurrentQuickMatchResult]);        
    }
    else
    {
        SetTimer(SearchWaitTime, false, 'StartQuickMatchNextStage');
    }
    //return;    
}

function OnJoinRequestComplete_QuickMatch()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];

    __OnJoinRequestComplete__Delegate = None;
    // End:0x5C
    if((int(Result) == int(6)) || int(Result) == int(4))
    {
        OnQuickMatchUpdate(3);
        return;
    }
    OnJoinGameComplete_QuickMatch(SessionNameGame, false);
    //return;    
}

function OnJoinTravelFailed_QuickMatch()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];

    __OnJoinTravelFailed__Delegate = None;
    OnJoinGameComplete_QuickMatch(SessionName, false);
    //return;    
}

function OnCreateGameComplete_QuickMatch()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private int DLCFilter;
    local /*0x97E50000-0x00000000*/ private @NULL CurGameSettings;

    __OnCreateGameComplete__Delegate = None;
    OnQuickMatchComplete(bWasSuccessful);
    bIsMatchmaking = false;
    // End:0x11B
    if(!bWasSuccessful)
    {
        DLCFilter = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AdditionalRequiredDLC;
        // End:0x11B
        if(DLCFilter != 0)
        {
            SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AdditionalRequiredDLC = 0;
            CurGameSettings = GetLPGameSettings();
            CurGameSettings.CalculateRequiredDLC();
        }
    }
    //return;    
}

function FilterQuickMatchResults()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8388609], newResults;
    local /*0x97E50000-0x00000000*/ private int PlayerRankRange[9437185], I, PartyAvgRank, PartySize;
    local /*0x97E50000-0x00000000*/ private @NULL ResultSettings;

    -1
    PartyAvgRank = GetPartyRank();
    PartySize = GetPartySize();
    I = 0;
    J0x3C:

    // End:0x3B3 [Loop If]
    if(I < Results.Length)
    {
        ResultSettings = LPOnlineGameSettings(Results[I].GameSettings);
        // End:0x9F
        if(ResultSettings == none)
        {            
        }
        else
        {
            // End:0xF4
            if((ResultSettings.PingInMs < 0) || ResultSettings.PingInMs >= MaxPing)
            {                
            }
            else
            {
                // End:0x121
                if(int(ResultSettings.GetSessionType()) == int(2))
                {                    
                }
                else
                {
                    // End:0x14E
                    if(int(ResultSettings.GetInviteMode()) != int(3))
                    {                        
                    }
                    else
                    {
                        // End:0x17B
                        if(int(ResultSettings.GetMatchState()) == int(3))
                        {                            
                        }
                        else
                        {
                            // End:0x1A3
                            if(ResultSettings.NumOpenPublicConnections > 10)
                            {                                
                            }
                            else
                            {
                                // End:0x1CB
                                if(ResultSettings.NumOpenPrivateConnections > 10)
                                {                                    
                                }
                                else
                                {
                                    // End:0x1F4
                                    if(ResultSettings.GetAvailableTeamSize() > 10)
                                    {                                        
                                    }
                                    else
                                    {
                                        // End:0x21B
                                        if(ResultSettings.NumOpenPublicConnections <= 0)
                                        {                                            
                                        }
                                        else
                                        {
                                            // End:0x271
                                            if((!bGroupPartyMembers && PartySize > 1) && (PartySize + 2) > ResultSettings.GetAvailableTeamSize())
                                            {                                                
                                            }
                                            else
                                            {
                                                // End:0x2B0
                                                if(bGroupPartyMembers && PartySize > ResultSettings.GetAvailableTeamSize())
                                                {                                                    
                                                }
                                                else
                                                {
                                                    // End:0x306
                                                    if((PlayerRankRange > 0) && Abs(float(PartyAvgRank - ResultSettings.GetAvgPlayerRank())) > float(PlayerRankRange / 2))
                                                    {                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x321
                                                        if(!CheckPlayersDLC(ResultSettings))
                                                        {                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x385
                                                            if(OnlineSub.PlayerInterface.IsBlocklisted(byte(OwningControllerIndex), ResultSettings.OwningPlayerId))
                                                            {                                                                
                                                            }
                                                            else
                                                            {
                                                                newResults.AddItem(Results[I]);                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x3C;
    }
    //return;    
}

delegate QuickMatchResultsSortFunc()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], ADistance, BDistance, PartyRank;
    local /*0x97E50000-0x00000000*/ private @NULL ASettings, BSettings;
    local /*0x97E50000-0x00000000*/ private int MyInstalledDLC, InstalledDLCA, InstalledDLCB;

    ASettings = LPOnlineGameSettings(A.GameSettings);
    BSettings = LPOnlineGameSettings(B.GameSettings);
    // End:0x73
    if(BSettings == none)
    {
        return -1;
    }
    // End:0x84
    if(ASettings == none)
    {
        return 1;
    }
    MyInstalledDLC = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCIds();
    InstalledDLCA = ASettings.GetInstalledDLCs();
    InstalledDLCB = BSettings.GetInstalledDLCs();
    // End:0x343
    if(MyInstalledDLC > 0)
    {
        // End:0x160
        if((InstalledDLCA == MyInstalledDLC) && InstalledDLCB == MyInstalledDLC)
        {            
        }
        else
        {
            // End:0x17C
            if(InstalledDLCA == MyInstalledDLC)
            {
                return 0;                
            }
            else
            {
                // End:0x19C
                if(InstalledDLCB == MyInstalledDLC)
                {
                    return -1;                    
                }
                else
                {
                    // End:0x317
                    if((InstalledDLCA != 0) && InstalledDLCB != 0)
                    {
                        // End:0x314
                        if(InstalledDLCA != InstalledDLCB)
                        {
                            ADistance = MyInstalledDLC & InstalledDLCA;
                            BDistance = MyInstalledDLC & InstalledDLCB;
                            // End:0x29F
                            if((ADistance == MyInstalledDLC) && BDistance == MyInstalledDLC)
                            {
                                ADistance = int(Abs(float(MyInstalledDLC - InstalledDLCA)));
                                BDistance = int(Abs(float(MyInstalledDLC - InstalledDLCB)));
                                return BDistance - ADistance;                                
                            }
                            else
                            {
                                // End:0x2BB
                                if(ADistance == MyInstalledDLC)
                                {
                                    return 1;                                    
                                }
                                else
                                {
                                    // End:0x2DB
                                    if(BDistance == MyInstalledDLC)
                                    {
                                        return -1;                                        
                                    }
                                    else
                                    {
                                        // End:0x2F7
                                        if(ADistance > BDistance)
                                        {
                                            return 0;                                            
                                        }
                                        else
                                        {
                                            // End:0x314
                                            if(ADistance < BDistance)
                                            {
                                                return -1;
                                            }
                                        }
                                    }
                                }
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x32B
                        if(InstalledDLCA != 0)
                        {
                            return 1;                            
                        }
                        else
                        {
                            // End:0x340
                            if(InstalledDLCB != 0)
                            {
                                return -1;
                            }
                        }
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x39F
        if((InstalledDLCA != 0) && InstalledDLCB != 0)
        {
            // End:0x383
            if(InstalledDLCA > InstalledDLCB)
            {
                return -1;                
            }
            else
            {
                // End:0x39C
                if(InstalledDLCA < InstalledDLCB)
                {
                    return 0;
                }
            }            
        }
        else
        {
            // End:0x3C8
            if((InstalledDLCA != 0) && InstalledDLCB == 0)
            {
                return -1;                
            }
            else
            {
                // End:0x3EA
                if((InstalledDLCA == 0) && InstalledDLCB != 0)
                {
                    return 0;
                }
            }
        }
    }
    PartyRank = GetPartyRank();
    // End:0x537
    if(Abs(float(ASettings.GetAvgPlayerRank() - BSettings.GetAvgPlayerRank())) >= float(PlayerRankRangeEqual / 2))
    {
        ADistance = int(Abs(float(PartyRank - ASettings.GetAvgPlayerRank())));
        BDistance = int(Abs(float(PartyRank - BSettings.GetAvgPlayerRank())));
        // End:0x4F6
        if(ADistance != BDistance)
        {
            return BDistance - ADistance;
        }
        return ASettings.GetAvgPlayerRank() - BSettings.GetAvgPlayerRank();
    }
    // End:0x60F
    if(((ASettings.PingInMs > 80) && BSettings.PingInMs > 80) && Abs(float(ASettings.PingInMs - BSettings.PingInMs)) > float(20))
    {
        return BSettings.PingInMs - ASettings.PingInMs;
    }
    return int(BSettings.GetMatchState()) - int(ASettings.GetMatchState());
    //return ReturnValue;    
}

function JoinQuickMatchGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL ToJoin[8388609];

    // End:0x5C
    if(bIsCancelPending)
    {
        OnQuickMatchUpdate(0);
        OnQuickMatchComplete(true);
        bIsMatchmaking = false;
        bIsCancelPending = false;
        bInProgress = false;
        return;
    }
    __OnJoinGameComplete__Delegate = OnJoinGameComplete_QuickMatch;
    __OnJoinRequestComplete__Delegate = OnJoinRequestComplete_QuickMatch;
    __OnJoinTravelFailed__Delegate = OnJoinTravelFailed_QuickMatch;
    JoinGame(ToJoin);
    //return;    
}

function PrintQuickMatchSearchResults()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL ResultSettings;

    I = 0;
    J0x0B:

    // End:0x7C [Loop If]
    if(I < Results.Length)
    {
        ResultSettings = LPOnlineGameSettings(Results[I].GameSettings);
        // End:0x6E
        if(ResultSettings == none)
        {            
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GrabOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[25165825], Result;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int StartIndex;

    StartIndex = InStr(Options, "?");
    // End:0x2C
    if(StartIndex < 0)
    {
        return false;
    }
    Options = Mid(Options, StartIndex);
    // End:0x11C
    if(Left(Options, 1) == "?")
    {
        Result = Mid(Options, 1);
        // End:0xB3
        if(InStr(Result, "?") >= 0)
        {
            Result = Left(Result, InStr(Result, "?"));
        }
        Options = Mid(Options, 1);
        // End:0x10B
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

function GetKeyValue()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Pair[8388609], Key, Value;

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

function ParseOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], InKey, ReturnValue, Pair, Key, Value;

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

function HasOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], InKey;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Pair, Key, Value;

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

function GetIntOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], ParseString;
    local /*0x97E50000-0x00000000*/ private int CurrentValue[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private editfixedsize string InOpt;

    InOpt = ParseOption(Options, ParseString);
    // End:0x42
    if(InOpt != "")
    {
        return int(InOpt);
    }
    return CurrentValue;
    //return ReturnValue;    
}

simulated function IsInProcessOfJoiningGame()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsJoining;
    //return ReturnValue;    
}

simulated function BeginInfiniteLoadTimeout()
{
    local /*0x97E50000-0x00000000*/ private float TimeOut[8388609];

    SetTimer(TimeOut, false, 'InfiniteLoadTimeout');
    //return;    
}

simulated function CancelInfiniteLoadTimeout()
{
    ClearTimer('InfiniteLoadTimeout');
    //return;    
}

simulated function InfiniteLoadTimeout()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    LP = GetLocalPlayer(OwningControllerIndex);
    // End:0x54
    if((LP == none) || LP.Actor == none)
    {
        return;
    }
    LPPlayerController(LP.Actor).ReturnToMainMenu("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>");
    //return;    
}

defaultproperties
{
    bWaitForPendingBandwidthTests=true
    ClientPartyBeaconClassName="OnlineSubsystemSteamworks.PartyBeaconClientSteam"
    ClientReservationBeaconClassName="OnlineSubsystemSteamworks.GameBeaconClientSteam"
    HostPartyBeaconClassName="SPEngine.SPPartyBeaconHostSteam"
    HostReservationBeaconClassName="SPEngine.SPGameBeaconHostSteam"
    MaxBandwidthHistoryAgeMinutes=1440
    MinBandwidthHistoryEntries=3
    SessionNameParty="Game"
    SessionNameGame="Game"
    UpstreamBandwidthTestSize=262144
    FindGameTimeout=120.0000000
    SearchWaitTime=1.5000000
    JoinFinalizeTime=1.0000000
    HostFinalizeTime=1.0000000
    MeshFinalizeTime=3.0000000
    OptimalHostWaitTime=5.0000000
    GameDeleteWaitTime=3.0000000
    MaxPing=5000
    NumTeams=2
    PresenceKeyNames=/* Array type was not detected. */
}