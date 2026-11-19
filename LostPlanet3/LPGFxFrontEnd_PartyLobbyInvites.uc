class LPGFxFrontEnd_PartyLobbyInvites extends SPGFxUIView within GFxMoviePlayer
    config(UI);

enum InviteViewMode
{
    eInviteViewMode_Party,          // 0
    eInviteViewMode_Friends,        // 1
    eInviteViewMode_Inbox,          // 2
    eInviteViewMode_MAX             // 3
};

enum InviteMessageType
{
    eInviteMessageType_FriendInvite,// 0
    eInviteMessageType_GameInvite,  // 1
    eInviteMessageType_MAX          // 2
};

struct InviteTablePresenceInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Description;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOnline;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJoinable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasInvitedYou;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInParty;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInLiveParty;

    structdefaultproperties
    {
        Description=""
        bOnline=false
        bJoinable=false
        bHasInvitedYou=false
        bIsInParty=false
        bIsInLiveParty=false
    }
};

struct InvitePlayerInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PresenceInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PingQuality;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VoiceStatus;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalPlayTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalCurrency;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string country;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MetagamePercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMe;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerID;

    structdefaultproperties
    {
        PlayerName=""
        PresenceInfo=(Description="",bOnline=false,bJoinable=false,bHasInvitedYou=false,bIsInParty=false,bIsInLiveParty=false)
        PingQuality=0
        VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled
        TotalPlayTime=0.0000000
        TotalCurrency=0
        country=""
        MetagamePercent=0.0000000
        bMe=false
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
    }
};

struct InboxEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PriIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReceivedDateTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayerInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MessageType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageIndex;

    structdefaultproperties
    {
        PriIndex=0
        ReceivedDateTime=0.0000000
        PlayerInfo=(PlayerName="",PresenceInfo=(Description="",bOnline=false,bJoinable=false,bHasInvitedYou=false,bIsInParty=false,bIsInLiveParty=false),PingQuality=0,VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled,TotalPlayTime=0.0000000,TotalCurrency=0,country="",MetagamePercent=0.0000000,bMe=false,PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none)))
        MessageType=InviteMessageType.eInviteMessageType_FriendInvite
        MessageIndex=0
    }
};

struct InviteTableEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PriIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayerInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL InboxEntry;

    structdefaultproperties
    {
        PriIndex=0
        PlayerInfo=(PlayerName="",PresenceInfo=(Description="",bOnline=false,bJoinable=false,bHasInvitedYou=false,bIsInParty=false,bIsInLiveParty=false),PingQuality=0,VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled,TotalPlayTime=0.0000000,TotalCurrency=0,country="",MetagamePercent=0.0000000,bMe=false,PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none)))
        InboxEntry=(PriIndex=0,ReceivedDateTime=0.0000000,PlayerInfo=(PlayerName="",PresenceInfo=(Description="",bOnline=false,bJoinable=false,bHasInvitedYou=false,bIsInParty=false,bIsInLiveParty=false),PingQuality=0,VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled,TotalPlayTime=0.0000000,TotalCurrency=0,country="",MetagamePercent=0.0000000,bMe=false,PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))),MessageType=InviteMessageType.eInviteMessageType_FriendInvite,MessageIndex=0)
    }
};

struct InviteWidgetItem
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Widget;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentState;

    structdefaultproperties
    {
        Widget=none
        bCurrentState=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CurrentView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OutstandingInvites;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentViewMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AGFxObject;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleHeaderWidget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL ContextMenuEntry;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SavedSelectedIndex[3];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ViewBuilder;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ContextBuilder;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ViewMonitor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMessagesWaiting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPS3;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool b360;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInExternalParty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDialogOpen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WidgetList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPFrontEndMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPFrontEndPartyLobby;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrontEndViewLoader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentDialog;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContextMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastReadFriendsTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReadFriendsFrequency;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnBuildCurrentView__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnBuildContextMenu__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnMonitorCurrentView__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnContextMenuVisible__Delegate;

delegate OnBuildCurrentView()
{
    //return;    
}

delegate OnBuildContextMenu()
{
    //return;    
}

delegate OnMonitorCurrentView()
{
    //return;    
}

function OnViewUnloaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, PRI, PartyPRI;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    LPFrontEndMoviePlayer = none;
    LPFrontEndPartyLobby = none;
    FrontEndViewLoader = none;
    // End:0x89
    if(NotEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
    {
        ClearPartyMemberListChangedDelegate();
    }
    ClearReadFriendsCompleteDelegate();
    // End:0x14E
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().GRI.PRIArray(PRI)
    {
        PartyPRI = LPPartyPRI(PRI);
        // End:0x11A
        if(PartyPRI == none)
        {
            continue;            
        }
        else
        {
            PartyPRI.MPPlayerInfoChangedDelegates.RemoveItem(OnPRIChanged);                        
        }
    }    
    super.OnViewUnloaded();
    //return;    
}

function LaunchAddFriendScreen()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x0F
    if(bPS3)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xE2
    if(!Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild(2))
    {
        OnlineSub.PlayerInterface.ShowFriendsUI(byte(Outer.GetLP().ControllerId));
        return;
    }
    // End:0x18A
    if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild())
    {
        OnlineSub.PlayerInterface.ShowFriendsUI(byte(Outer.GetLP().ControllerId));        
    }
    else
    {
        CurrentDialog = FrontEndViewLoader.SpawnDialog('OnlineAddFriend', self);
        bDialogOpen = CurrentDialog != none;
    }
    //return;    
}

function LaunchSendInvitesToExternalParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x71
    if((OnlineSub == none) || EqualEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
    {
        return;
    }
    // End:0x14F
    if(OnlineSub.PartyChatInterface.IsInPartyChat(byte(Outer.GetLP().ControllerId)))
    {
        // End:0x14F
        if(!OnlineSub.PartyChatInterface.SendPartyGameInvites(byte(Outer.GetLP().ControllerId)))
        {
        }
    }
    //return;    
}

function LaunchCommunityScreen()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x0F
    if(bPS3)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PartyChatInterface.ShowCommunitySessionsUI(byte(Outer.GetLP().ControllerId));
    //return;    
}

function LaunchInvitesScreen()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x11
    if(!bPS3)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xB5
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.OpenInvites();
    }
    //return;    
}

function IsInPartyChat()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x11
    if(!b360)
    {
        return false;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    return OnlineSub.PartyChatInterface.IsInPartyChat(byte(Outer.GetLP().ControllerId));
    //return ReturnValue;    
}

function IsInExternalParty()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Members;

    // End:0x11
    if(!IsInPartyChat())
    {
        return false;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PartyChatInterface.GetPartyMembersInformation(Members);
    return Members.Length > 1;
    //return ReturnValue;    
}

function IsViewFocused()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !bDialogOpen && LPFrontEndMoviePlayer.FocusViewLoaderIndex == 1;
    //return ReturnValue;    
}

function OnViewLoaded()
{
    super.OnViewLoaded();
    LPFrontEndMoviePlayer = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    FrontEndViewLoader = LPFrontEndMoviePlayer.FocusViewLoaders[0];
    //return;    
}

function Startup()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Messages;

    bPS3 = Class'Engine.WorldInfo'.static.IsConsoleBuild(2);
    b360 = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x11B
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(0))
    {
        OnlineSub.PlayerInterface.GetFriendMessages(byte(Outer.GetLP().ControllerId), Messages);
    }
    bMessagesWaiting = Messages.Length > 0;
    RequestView(0);
    ShowNewInvite(bMessagesWaiting);
    SetUpButtonLegend();
    SetPartyTabText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_partyListTabText>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_friendsListTabText>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_invitesTabText>"));
    //return;    
}

function SetUpButtonLegend()
{
    ActionScriptVoid("SetUpButtonLegend");
    //return;    
}

function RequestView()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];

    switch(Mode)
    {
        // End:0x33
        case 0:
            SwitchTabs("partyListTab");
            // End:0x7A
            break;
        // End:0x55
        case 1:
            SwitchTabs("friendsListTab");
            // End:0x7A
            break;
        // End:0x77
        case 2:
            SwitchTabs("invitesListTab");
            // End:0x7A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function BuildCurrentView()
{
    CurrentView.Length = 0;
    // End:0x2E
    if(ViewBuilder != none)
    {
        OnBuildCurrentView();
    }
    // End:0x46
    if(IsViewFocused())
    {
        SetViewFocus(true);
    }
    //return;    
}

function BuildContextMenu()
{
    // End:0x22
    if(ContextBuilder != none)
    {
        OnBuildContextMenu();
    }
    //return;    
}

event Tick()
{
    // End:0x22
    if(ViewMonitor != none)
    {
        OnMonitorCurrentView();
    }
    UpdateInvites();
    // End:0x4A
    if(int(CurrentViewMode) == int(0))
    {
        UpdateVoiceStatus();
    }
    //return;    
}

function GetInviteRequestTypeFromEnum()
{
    local /*0x97E50000-0x00000000*/ private byte it[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    switch(it)
    {
        // End:0x27
        case 0:
            return "friendInvite";
        // End:0x39
        case 1:
            return "gameInvite";
        // End:0xFFFF
        default:
            return "none";
            break;
    }
    //return ReturnValue;    
}

function BuildCurrentViewFromPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, PRI, LPPRI, PInfo;

    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0x50
    if(GRI == none)
    {
        return;
    }
    SetNumPartyMembers(0);
    ForcePartyUpdate();
    CurrentView.Length = 0;
    // End:0x12D
    foreach GRI.PRIArray(PRI)
    {
        LPPRI = LPPartyPRI(PRI);
        // End:0xCC
        if(LPPRI == none)
        {
            continue;            
        }
        else
        {
            PInfo = BuildPlayerInfoFromPRI(LPPRI);
            LPPRI.AddMPPlayerInfoChangedDelegate(OnPRIChanged);
            cbAddPartyMember(PInfo);            
        }
    }    
    SetNumPartyMembers(CurrentView.Length);
    ForcePartyUpdate();
    ShowPartyMenu(true);
    bInExternalParty = IsInExternalParty();
    // End:0x275
    if(bInExternalParty && b360)
    {
        LPFrontEndMoviePlayer.setButtonIcon(12, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonImportParty>");
        LPFrontEndMoviePlayer.setButtonIcon(9, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonViewLiveParty>");        
    }
    else
    {
        // End:0x31E
        if(b360)
        {
            LPFrontEndMoviePlayer.setButtonIcon(12, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonInviteFriends>");
            LPFrontEndMoviePlayer.setButtonIcon(9, "");            
        }
        else
        {
            LPFrontEndMoviePlayer.setButtonIcon(12, ((bPS3) ? "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonViewInvites>" : ""));
            LPFrontEndMoviePlayer.setButtonIcon(9, "");
        }
    }
    // End:0x4FD
    if(int(Outer.GetPC().Role) == int(ROLE_Authority))
    {
        LPFrontEndMoviePlayer.setButtonIcon(10, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HelpLegend_AccessFilter>");
        LPFrontEndMoviePlayer.setButtonIcon(11, ((CurrentView.Length > 1) ? "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonDisbandParty>" : ""));        
    }
    else
    {
        LPFrontEndMoviePlayer.setButtonIcon(11, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonLeaveParty>");
    }
    LPFrontEndMoviePlayer.setButtonIcon(6, "<Strings:LostPlanetGame.UI.ButtonBack>");
    LPFrontEndMoviePlayer.setButtonIcon(7, "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>");
    LPFrontEndMoviePlayer.setButtonIcon(8, "<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ViewSettingsHost>");
    LPFrontEndMoviePlayer.setButtonIcon(13, "");
    //return;    
}

function BuildPlayerInfoFromPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609], ReturnValue, PInfo, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    PInfo.PlayerName = PRI.GetHumanReadableName();
    PInfo.bMe = Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(Outer.GetPC().PlayerReplicationInfo.UniqueId, PRI.UniqueId);
    PInfo.PingQuality = ((PInfo.bMe) ? 5 : Class'LPMenuGamePRI'.static.ConvertPRIPing(PRI.Ping));
    PInfo.country = "USA";
    PInfo.MetagamePercent = float(PRI.MetagamePercent);
    PInfo.TotalCurrency = PRI.GetMPCreditsEarned();
    PInfo.TotalPlayTime = PRI.GetTotalPlayTime();
    PInfo.PresenceInfo.bJoinable = false;
    PInfo.PresenceInfo.bHasInvitedYou = false;
    PInfo.PresenceInfo.bOnline = true;
    PInfo.PresenceInfo.Description = "Need to fetch this from somewhere";
    PInfo.PlayerID = PRI.UniqueId;
    PInfo.VoiceStatus = MPMgr.GetVoiceStatus(PInfo.PlayerID);
    return PInfo;
    //return ReturnValue;    
}

function OnPRIChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChangedPRI[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;

    Index = 0;
    J0x0B:

    // End:0x31D [Loop If]
    if(Index < CurrentView.Length)
    {
        // End:0x30F
        if(EqualEqual_UniqueNetIdUniqueNetId(CurrentView[Index].PlayerInfo.PlayerID, ChangedPRI.UniqueId) && CurrentView[Index].PlayerInfo.PlayerName == ChangedPRI.GetHumanReadableName())
        {
            CurrentView[Index].PlayerInfo = BuildPlayerInfoFromPRI(ChangedPRI);
            SetPartyMemberData(1 + CurrentView[Index].PriIndex, CurrentView[Index].PlayerInfo.PlayerName, int(CurrentView[Index].PlayerInfo.MetagamePercent), int(CurrentView[Index].PlayerInfo.TotalPlayTime), CurrentView[Index].PlayerInfo.TotalCurrency, CurrentView[Index].PlayerInfo.country, CurrentView[Index].PlayerInfo.PingQuality, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(CurrentView[Index].PlayerInfo.VoiceStatus));
            ForcePartyUpdate();
        }
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function UpdateVoiceStatus()
{
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;
    local /*0x97E50000-0x00000000*/ private byte VoiceStatus;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    Index = 0;
    J0x34:

    // End:0x309 [Loop If]
    if(Index < CurrentView.Length)
    {
        VoiceStatus = MPMgr.GetVoiceStatus(CurrentView[Index].PlayerInfo.PlayerID);
        // End:0x2FB
        if(int(VoiceStatus) != int(CurrentView[Index].PlayerInfo.VoiceStatus))
        {
            CurrentView[Index].PlayerInfo.VoiceStatus = VoiceStatus;
            SetPartyMemberData(1 + CurrentView[Index].PriIndex, CurrentView[Index].PlayerInfo.PlayerName, int(CurrentView[Index].PlayerInfo.MetagamePercent), int(CurrentView[Index].PlayerInfo.TotalPlayTime), CurrentView[Index].PlayerInfo.TotalCurrency, CurrentView[Index].PlayerInfo.country, CurrentView[Index].PlayerInfo.PingQuality, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(VoiceStatus));
            ForcePartyUpdate();
        }
        Index++;
        // [Loop Continue]
        goto J0x34;
    }
    //return;    
}

function UpdateInvites()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Messages;
    local /*0x97E50000-0x00000000*/ private bool bInbox;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.GetFriendMessages(byte(Outer.GetLP().ControllerId), Messages);
    bInbox = Messages.Length > 0;
    // End:0xF7
    if(bInbox != bMessagesWaiting)
    {
        bMessagesWaiting = bInbox;
        ShowNewInvite(bMessagesWaiting);
    }
    //return;    
}

function MonitorCurrentViewFromPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, PRI;
    local /*0x97E50000-0x00000000*/ private int iPRIIndex, iCount;
    local /*0x97E50000-0x00000000*/ private bool bChanged;

    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0x50
    if(GRI == none)
    {
        return;
    }
    // End:0xFA
    foreach GRI.PRIArray(PRI, iPRIIndex)
    {
        // End:0xAB
        if(iPRIIndex >= CurrentView.Length)
        {
            bChanged = true;            
        }
        else
        {
            // End:0xEE
            if(CurrentView[iPRIIndex].PriIndex != iPRIIndex)
            {
                bChanged = true;                
            }
            else
            {
                ++iCount;                
            }
        }
    }    
    // End:0x120
    if(bInExternalParty != (IsInExternalParty()))
    {
        bChanged = true;
    }
    // End:0x151
    if(bChanged || iCount != CurrentView.Length)
    {
        BuildCurrentView();
    }
    //return;    
}

function BuildContextMenuFromPRI()
{
    local /*0x97E50000-0x00000000*/ private bool bIsFriend;
    local /*0x97E50000-0x00000000*/ private int OptionIndex, FocusIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TE;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Actions;
    local /*0x97E50000-0x00000000*/ private byte A;

    TE = ContextMenuEntry;
    ContextMenu.InitFromPRI(LPPRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI.PRIArray[TE.PriIndex]));
    bIsFriend = ContextMenu.IsPlayerFriend();
    OptionIndex = 0;
    FocusIndex = 0;
    // End:0x152
    if(TE.PlayerInfo.bMe)
    {
        Actions.AddItem(6);        
        // End:0x14F
        if(b360 || bPS3)
        {
            Actions.AddItem(5);            
        }        
    }
    else
    {
        // End:0x295
        if(int(Outer.GetPC().WorldInfo.NetMode) == int(NM_Client))
        {
            Actions.AddItem(1);            
            // End:0x1E7
            if(!bIsFriend && !b360)
            {
                Actions.AddItem(10);                                
            }
            else
            {
                // End:0x216
                if(!b360 && !bPS3)
                {
                    Actions.AddItem(11);                    
                }
            }
            Actions.AddItem(6);            
            // End:0x250
            if(b360 || bPS3)
            {
                Actions.AddItem(5);                
            }
            // End:0x292
            if(ContextMenu.OptionInfo[0].bIsDisabled)
            {
                FocusIndex = 1;
            }            
        }
        else
        {
            Actions.AddItem(4);            
            Actions.AddItem(1);            
            // End:0x2E5
            if(!bIsFriend && !b360)
            {
                Actions.AddItem(10);                                
            }
            else
            {
                // End:0x314
                if(!b360 && !bPS3)
                {
                    Actions.AddItem(11);                    
                }
            }
            Actions.AddItem(6);            
            // End:0x34E
            if(b360 || bPS3)
            {
                Actions.AddItem(5);                
            }
        }
    }
    SetSubMenuNumOptions(Actions.Length);
    // End:0x39E
    foreach Actions(A, OptionIndex)
    {
        SetSubMenuOptionType(OptionIndex, A);        
    }    
    ContextMenu.SetFocusedOption(FocusIndex);
    //return;    
}

function KickPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC, WorldInfo;

    WorldInfo = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x14F
    foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
    {
        // End:0x14E
        if(EqualEqual_UniqueNetIdUniqueNetId(PC.PlayerReplicationInfo.UniqueId, PlayerID))
        {
            PC.ClientReturnToMPLobby("<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Message>", "<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Title>", true);            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function BuildCurrentViewFromFriends()
{
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Friends;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize array PartyMembers, PInfos;
    local /*0x97E50000-0x00000000*/ private @NULL OwnerNetId;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OwnerNetId = Class'LPMultiplayerManager'.static.GetInstance().GetUniqueNetId(Outer.GetLP().ControllerId);
    CurrentView.Length = 0;
    OnlineSub.PlayerInterface.GetFriendsList(byte(Outer.GetLP().ControllerId), Friends);
    Index = 0;
    J0x129:

    // End:0x1A3 [Loop If]
    if(Index < Friends.Length)
    {
        // End:0x195
        if(Friends[Index].bIsOnline)
        {
            PInfos.AddItem(ConvertFriendToPlayerInfo(Friends[Index]));            
        }
        Index++;
        // [Loop Continue]
        goto J0x129;
    }
    // End:0x346
    if(NotEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
    {
        OnlineSub.PartyChatInterface.GetPartyMembersInformation(PartyMembers);
        Index = 0;
        J0x221:

        // End:0x346 [Loop If]
        if(Index < PartyMembers.Length)
        {
            // End:0x30E
            if(EqualEqual_UniqueNetIdUniqueNetId(OwnerNetId, PartyMembers[Index].UniqueId) || OnlineSub.PlayerInterface.IsFriend(byte(Outer.GetLP().ControllerId), PartyMembers[Index].UniqueId))
            {                
            }
            else
            {
                PInfos.AddItem(ConvertPartyMemberToPlayerInfo(PartyMembers[Index]));                
            }
            Index++;
            // [Loop Continue]
            goto J0x221;
        }
    }
    SetNumFriends(PInfos.Length);
    Index = 0;
    J0x365:

    // End:0x3A8 [Loop If]
    if(Index < PInfos.Length)
    {
        cbAddFriend(PInfos[Index]);
        Index++;
        // [Loop Continue]
        goto J0x365;
    }
    LPFrontEndMoviePlayer.setButtonIcon(6, "<Strings:LostPlanetGame.UI.ButtonBack>");
    LPFrontEndMoviePlayer.setButtonIcon(7, ((PInfos.Length > 0) ? "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>" : ""));
    LPFrontEndMoviePlayer.setButtonIcon(8, "<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ViewSettingsHost>");
    LPFrontEndMoviePlayer.setButtonIcon(9, "");
    // End:0x58A
    if(int(Outer.GetPC().Role) == int(ROLE_Authority))
    {
        LPFrontEndMoviePlayer.setButtonIcon(10, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HelpLegend_AccessFilter>");
    }
    LPFrontEndMoviePlayer.setButtonIcon(11, ((bPS3) ? "" : "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonAddFriend>"));
    LPFrontEndMoviePlayer.setButtonIcon(12, ((bPS3) ? "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_buttonViewInvites>" : ""));
    LPFrontEndMoviePlayer.setButtonIcon(13, "");
    //return;    
}

function MonitorCurrentViewFromFriends()
{
    local /*0x97E50000-0x00000000*/ private float CurrentTime;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    CurrentTime = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds;
    // End:0x74
    if(bDialogOpen || CurrentTime < (LastReadFriendsTime + float(ReadFriendsFrequency)))
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.AddReadFriendsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadFriendsComplete_MonitorCurrentViewFromFriends);
    OnlineSub.PlayerInterface.ReadFriendsList(byte(Outer.GetLP().ControllerId));
    LastReadFriendsTime = CurrentTime;
    //return;    
}

function ClearReadFriendsCompleteDelegate()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xE9
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        I = 0;
        J0x7A:

        // End:0xE9 [Loop If]
        if(I < 4)
        {
            OnlineSub.PlayerInterface.ClearReadFriendsCompleteDelegate(byte(I), OnReadFriendsComplete_MonitorCurrentViewFromFriends);
            I++;
            // [Loop Continue]
            goto J0x7A;
        }
    }
    //return;    
}

function ClearPartyMemberListChangedDelegate()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xE9
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
    {
        I = 0;
        J0x7A:

        // End:0xE9 [Loop If]
        if(I < 4)
        {
            OnlineSub.PartyChatInterface.ClearPartyMemberListChangedDelegate(byte(I), OnPartyMemberListChanged);
            I++;
            // [Loop Continue]
            goto J0x7A;
        }
    }
    //return;    
}

function OnReadFriendsComplete_MonitorCurrentViewFromFriends()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Friend;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Friends, OnlineFriends;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, PInfo;
    local /*0x97E50000-0x00000000*/ private bool bChanged;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    ClearReadFriendsCompleteDelegate();
    OnlineSub.PlayerInterface.GetFriendsList(byte(Outer.GetLP().ControllerId), Friends);
    Index = 0;
    J0xB4:

    // End:0x124 [Loop If]
    if(Index < Friends.Length)
    {
        // End:0x116
        if(Friends[Index].bIsOnline)
        {
            OnlineFriends.AddItem(Friends[Index]);            
        }
        Index++;
        // [Loop Continue]
        goto J0xB4;
    }
    bChanged = OnlineFriends.Length != CurrentView.Length;
    // End:0x5CD
    if(!bChanged)
    {
        // End:0x5CC
        foreach OnlineFriends(Friend, iIndex)
        {
            PInfo = ConvertFriendToPlayerInfo(Friend);
            // End:0x201
            if(NotEqual_UniqueNetIdUniqueNetId(CurrentView[iIndex].PlayerInfo.PlayerID, PInfo.PlayerID))
            {
                bChanged = true;                
            }
            else
            {
                // End:0x26A
                if(CurrentView[iIndex].PlayerInfo.PlayerName != PInfo.PlayerName)
                {
                    bChanged = true;                    
                }
                else
                {
                    // End:0x2FB
                    if(CurrentView[iIndex].PlayerInfo.PresenceInfo.bOnline != PInfo.PresenceInfo.bOnline)
                    {
                        bChanged = true;                        
                    }
                    else
                    {
                        // End:0x38A
                        if(CurrentView[iIndex].PlayerInfo.PresenceInfo.Description != PInfo.PresenceInfo.Description)
                        {
                            bChanged = true;                            
                        }
                        else
                        {
                            // End:0x41B
                            if(CurrentView[iIndex].PlayerInfo.PresenceInfo.bIsInLiveParty != PInfo.PresenceInfo.bIsInLiveParty)
                            {
                                bChanged = true;                                
                            }
                            else
                            {
                                // End:0x4AC
                                if(CurrentView[iIndex].PlayerInfo.PresenceInfo.bIsInParty != PInfo.PresenceInfo.bIsInParty)
                                {
                                    bChanged = true;                                    
                                }
                                else
                                {
                                    // End:0x53D
                                    if(CurrentView[iIndex].PlayerInfo.PresenceInfo.bJoinable != PInfo.PresenceInfo.bJoinable)
                                    {
                                        bChanged = true;                                        
                                    }
                                    else
                                    {
                                        // End:0x5CB
                                        if(CurrentView[iIndex].PlayerInfo.PresenceInfo.bHasInvitedYou != PInfo.PresenceInfo.bHasInvitedYou)
                                        {
                                            bChanged = true;
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
    // End:0x5E4
    if(bChanged)
    {
        BuildCurrentView();
    }
    //return;    
}

function BuildContextMenuFromFriends()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TE;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private bool bHost;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Actions;
    local /*0x97E50000-0x00000000*/ private byte A;

    TE = ContextMenuEntry;
    iIndex = 0;
    ContextMenu.InitFromUniqueID(TE.PlayerInfo.PlayerID, TE.PlayerInfo.PlayerName);
    bHost = int(Outer.GetPC().WorldInfo.NetMode) != int(NM_Client);
    // End:0x122
    if(bHost)
    {
        // End:0x122
        if(!b360)
        {
            Actions.AddItem(7);            
        }
    }
    // End:0x18B
    if(TE.PlayerInfo.PresenceInfo.bHasInvitedYou && !bPS3)
    {
        Actions.AddItem(8);                
    }
    else
    {
        // End:0x1EF
        if(TE.PlayerInfo.PresenceInfo.bJoinable)
        {
            // End:0x1EF
            if(!b360)
            {
                Actions.AddItem(2);                
            }
        }
    }
    // End:0x21E
    if(!b360 && !bPS3)
    {
        Actions.AddItem(11);        
    }
    Actions.AddItem(6);    
    // End:0x258
    if(b360 || bPS3)
    {
        Actions.AddItem(5);        
    }
    SetSubMenuNumOptions(Actions.Length);
    // End:0x2A8
    foreach Actions(A, iIndex)
    {
        SetSubMenuOptionType(iIndex, A);        
    }    
    //return;    
}

function ConvertFriendToPlayerInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Friend[8388609], ReturnValue, ZeroId, PInfo, MPMgr, LivePartyInfo;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    PInfo.PlayerID = Friend.UniqueId;
    PInfo.PlayerName = Friend.NickName;
    PInfo.PresenceInfo.bJoinable = (NotEqual_UniqueNetIdUniqueNetId(Friend.UniqueId, ZeroId) && Friend.bIsJoinable) && Friend.bIsPlayingThisGame;
    PInfo.PresenceInfo.bHasInvitedYou = (NotEqual_UniqueNetIdUniqueNetId(Friend.UniqueId, ZeroId) && Friend.bHasInvitedYou) && Friend.bIsPlayingThisGame;
    PInfo.PresenceInfo.bOnline = Friend.bIsOnline;
    // End:0x29D
    if(Friend.bIsPlayingThisGame)
    {
        PInfo.PresenceInfo.Description = Friend.PresenceInfo;
    }
    // End:0x46A
    if(NotEqual_InterfaceInterface(MPMgr.OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)) && MPMgr.OnlineSub.PartyChatInterface.GetPartyMemberInformation(Friend.UniqueId, LivePartyInfo))
    {
        PInfo.PresenceInfo.bIsInLiveParty = true;
        // End:0x46A
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            PInfo.PresenceInfo.Description = (GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ExtPartyPrefix_Xbox>")) @ PInfo.PresenceInfo.Description;
        }
    }
    PInfo.VoiceStatus = MPMgr.GetVoiceStatus(PInfo.PlayerID);
    return PInfo;
    //return ReturnValue;    
}

function ConvertPartyMemberToPlayerInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Member[8388609], ReturnValue, PInfo, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    PInfo.PlayerID = Member.UniqueId;
    PInfo.PlayerName = Member.NickName;
    PInfo.PresenceInfo.bIsInLiveParty = true;
    PInfo.PresenceInfo.bJoinable = Member.bIsPlayingThisGame && Member.bIsInGameSession;
    PInfo.PresenceInfo.bHasInvitedYou = false;
    PInfo.PresenceInfo.bOnline = true;
    // End:0x244
    if(Member.bIsPlayingThisGame)
    {
        PInfo.PresenceInfo.Description = GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.FriendInLP3>");        
    }
    else
    {
        PInfo.PresenceInfo.Description = GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.FriendInUnknown>");
    }
    // End:0x3A5
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        PInfo.PresenceInfo.Description = (GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ExtPartyPrefix_Xbox>")) @ PInfo.PresenceInfo.Description;
    }
    PInfo.VoiceStatus = MPMgr.GetVoiceStatus(PInfo.PlayerID);
    return PInfo;
    //return ReturnValue;    
}

function OnPartyMemberListChanged()
{
    local /*0x97E50000-0x00000000*/ private bool bJoinedOrLeft[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerID[8388609];

    BuildCurrentView();
    //return;    
}

function BuildCurrentViewFromInbox()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Message;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Messages;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, InboxItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ItemsToBeAdded;
    local /*0x97E50000-0x00000000*/ private int MessageIndex;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    CurrentView.Length = 0;
    ItemsToBeAdded.Length = 0;
    OnlineSub.PlayerInterface.GetFriendMessages(byte(Outer.GetLP().ControllerId), Messages);
    // End:0x24C
    foreach Messages(Message, MessageIndex)
    {
        // End:0x24B
        if(((Message.bIsFriendInvite || Message.bIsGameInvite) && !Message.bWasAccepted) && !Message.bWasDenied)
        {
            InboxItem.PlayerInfo = ConvertMessageToPlayerInfo(Message);
            InboxItem.MessageIndex = MessageIndex;
            // End:0x1F6
            if(Message.bIsFriendInvite)
            {
                InboxItem.MessageType = 0;                
            }
            else
            {
                // End:0x235
                if(Message.bIsGameInvite)
                {
                    InboxItem.MessageType = 1;
                }
            }
            ItemsToBeAdded.AddItem(InboxItem);            
        }        
    }    
    SetNumInvites(ItemsToBeAdded.Length);
    // End:0x28C
    foreach ItemsToBeAdded(InboxItem)
    {
        cbAddInboxMessage(InboxItem);        
    }    
    LPFrontEndMoviePlayer.setButtonIcon(6, "<Strings:LostPlanetGame.UI.ButtonBack>");
    LPFrontEndMoviePlayer.setButtonIcon(7, ((ItemsToBeAdded.Length > 0) ? "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>" : ""));
    LPFrontEndMoviePlayer.setButtonIcon(8, "<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ViewSettingsHost>");
    LPFrontEndMoviePlayer.setButtonIcon(9, "");
    // End:0x46F
    if(int(Outer.GetPC().Role) == int(ROLE_Authority))
    {
        LPFrontEndMoviePlayer.setButtonIcon(10, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HelpLegend_AccessFilter>");
    }
    LPFrontEndMoviePlayer.setButtonIcon(11, "");
    LPFrontEndMoviePlayer.setButtonIcon(12, "");
    LPFrontEndMoviePlayer.setButtonIcon(13, "");
    //return;    
}

function MonitorCurrentViewFromInbox()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Message;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Messages;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, InboxItem;
    local /*0x97E50000-0x00000000*/ private int MessageIndex;
    local /*0x97E50000-0x00000000*/ private bool bChanged;
    local /*0x97E50000-0x00000000*/ private int iMessageCount;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.GetFriendMessages(byte(Outer.GetLP().ControllerId), Messages);
    // End:0x303
    foreach Messages(Message, MessageIndex)
    {
        // End:0x302
        if(((Message.bIsFriendInvite || Message.bIsGameInvite) && !Message.bWasAccepted) && !Message.bWasDenied)
        {
            InboxItem.PlayerInfo = ConvertMessageToPlayerInfo(Message);
            InboxItem.MessageIndex = MessageIndex;
            // End:0x1C3
            if(iMessageCount > CurrentView.Length)
            {
                bChanged = true;
                // [Explicit Continue]
                goto J0x303;
            }
            InboxItem.MessageType = ((Message.bIsFriendInvite) ? 0 : 1);
            // End:0x25C
            if(CurrentView[iMessageCount].InboxEntry.MessageIndex != MessageIndex)
            {
                bChanged = true;                
            }
            else
            {
                // End:0x2DD
                if(NotEqual_UniqueNetIdUniqueNetId(CurrentView[iMessageCount].PlayerInfo.PlayerID, InboxItem.PlayerInfo.PlayerID))
                {
                    bChanged = true;
                }
            }
            // End:0x2F7
            if(bChanged)
            {
                BuildCurrentView();                
                return;
            }
            ++iMessageCount;
        }        
    }
    J0x303:
    
    //return;    
}

function BuildContextMenuFromInbox()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TE, InboxItem;

    TE = ContextMenuEntry;
    InboxItem = TE.InboxEntry;
    ContextMenu.InitFromUniqueID(TE.PlayerInfo.PlayerID, TE.PlayerInfo.PlayerName);
    ContextMenu.DialogMessageIndex = InboxItem.MessageIndex;
    SetSubMenuNumOptions(2);
    // End:0x141
    if(int(InboxItem.MessageType) == int(0))
    {
        SetSubMenuOptionType(0, 12);
        SetSubMenuOptionType(1, 13);        
    }
    else
    {
        // End:0x182
        if(int(InboxItem.MessageType) == int(1))
        {
            SetSubMenuOptionType(0, 8);
            SetSubMenuOptionType(1, 9);
        }
    }
    //return;    
}

function ConvertMessageToPlayerInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Message[8388609], ReturnValue, PInfo;

    PInfo.PlayerID = Message.SendingPlayerId;
    PInfo.PlayerName = Message.SendingPlayerNick;
    PInfo.PresenceInfo.Description = Message.Message;
    return PInfo;
    //return ReturnValue;    
}

function cbAddInboxMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Message[8388609], TE;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName, playerMessage, RequestType;

    TE.PriIndex = CurrentView.Length;
    TE.PlayerInfo = Message.PlayerInfo;
    TE.InboxEntry = Message;
    CurrentView.AddItem(TE);    
    PlayerName = Message.PlayerInfo.PlayerName;
    playerMessage = ((Class'Engine.WorldInfo'.static.IsConsoleBuild(0)) ? Message.PlayerInfo.PresenceInfo.Description : " ");
    RequestType = GetInviteRequestTypeFromEnum(Message.MessageType);
    // End:0x19E
    if(Len(PlayerName) == 0)
    {
        PlayerName = "Unknown";
    }
    // End:0x1BC
    if(Len(playerMessage) == 0)
    {
        playerMessage = " ";
    }
    SetInviteData(1 + TE.PriIndex, PlayerName, playerMessage, RequestType);
    //return;    
}

function cbAddPartyMember()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayerInfo[8388609], TE;

    TE.PriIndex = CurrentView.Length;
    TE.PlayerInfo = PlayerInfo;
    CurrentView.AddItem(TE);    
    SetNumPartyMembers(CurrentView.Length);
    SetPartyMemberData(1 + TE.PriIndex, TE.PlayerInfo.PlayerName, int(TE.PlayerInfo.MetagamePercent), int(TE.PlayerInfo.TotalPlayTime), TE.PlayerInfo.TotalCurrency, TE.PlayerInfo.country, TE.PlayerInfo.PingQuality, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(TE.PlayerInfo.VoiceStatus));
    //return;    
}

function cbAddFriend()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayerInfo[8388609], TE;

    TE.PriIndex = CurrentView.Length;
    TE.PlayerInfo = PlayerInfo;
    CurrentView.AddItem(TE);    
    SetFriendData(1 + TE.PriIndex, TE.PlayerInfo.PlayerName, TE.PlayerInfo.PresenceInfo.Description, TE.PlayerInfo.PresenceInfo.bOnline, TE.PlayerInfo.PresenceInfo.bIsInLiveParty);
    //return;    
}

delegate OnContextMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    bDialogOpen = bVisible;
    // End:0x8E
    if(bVisible)
    {
        // End:0x64
        if((SelectedIndex < 0) || SelectedIndex > CurrentView.Length)
        {
            CloseSubMenu();
            EnablePartyPreLobbyTab();
            return;            
        }
        else
        {
            ContextMenuEntry = CurrentView[SelectedIndex];
        }
        BuildContextMenu();        
    }
    else
    {
        CloseSubMenu();
    }
    SetButtonPromptsVisible(!bDialogOpen);
    //return;    
}

function OnListItemSelected()
{
    local /*0x97E50000-0x00000000*/ private int ListIndex[8388609];

    LPFrontEndMoviePlayer.FocusSecondaryViewLoader();
    SelectedIndex = ListIndex;
    SavedSelectedIndex[int(CurrentViewMode)] = SelectedIndex;
    // End:0x6A
    if(CanShowSubMenu())
    {
        ShowSubMenu(true);
    }
    //return;    
}

function SelectNextListItem()
{
    SelectedIndex = Min(SelectedIndex + 1, CurrentView.Length - 1);
    SavedSelectedIndex[int(CurrentViewMode)] = SelectedIndex;
    SetConfirmPromptVisible(CanShowSubMenu());
    SetSelectedListItem(SelectedIndex);
    //return;    
}

function SelectPrevListItem()
{
    SelectedIndex = Max(SelectedIndex - 1, 0);
    SavedSelectedIndex[int(CurrentViewMode)] = SelectedIndex;
    SetConfirmPromptVisible(CanShowSubMenu());
    SetSelectedListItem(SelectedIndex);
    //return;    
}

function switchedToTab()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TabName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    switch(TabName)
    {
        // End:0xAD
        case "partyListTab":
            CurrentViewMode = 0;
            ViewBuilder = BuildCurrentViewFromPRI;
            ContextBuilder = BuildContextMenuFromPRI;
            ViewMonitor = MonitorCurrentViewFromPRI;
            // End:0x1A1
            break;
        // End:0x120
        case "friendsListTab":
            CurrentViewMode = 1;
            ViewBuilder = BuildCurrentViewFromFriends;
            ContextBuilder = BuildContextMenuFromFriends;
            ViewMonitor = MonitorCurrentViewFromFriends;
            // End:0x1A1
            break;
        // End:0x19E
        case "invitesListTab":
            CurrentViewMode = 2;
            ViewBuilder = BuildCurrentViewFromInbox;
            ContextBuilder = BuildContextMenuFromInbox;
            ViewMonitor = MonitorCurrentViewFromInbox;
            ShowNewInvite(false);
            // End:0x1A1
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x275
    if((TabName == "friendsListTab") && NotEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
    {
        OnlineSub.PartyChatInterface.AddPartyMemberListChangedDelegate(byte(Outer.GetLP().ControllerId), OnPartyMemberListChanged);        
    }
    else
    {
        ClearPartyMemberListChangedDelegate();
    }
    BuildCurrentView();
    //return;    
}

function UnrealLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    LPFrontEndPartyLobby = LPGFxFrontEnd_PartyLobby(FrontEndViewLoader.ViewStack[FrontEndViewLoader.ViewStack.Length - 1]);
    MoviePlayer.SetExternalInterface(self);
    // End:0xF8
    if(bPlayOpenAnimation)
    {
        Startup();
        Outer.GetPC().SetTimer(0.1000000, true, 'Tick', self);
    }
    CloseSubMenu();
    EnablePartyPreLobbyTab();
    SetPartyPreLobbyFocused(false);
    bDialogOpen = false;
    LPFrontEndMoviePlayer.setButtonIcon(14, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_bumperLeft>");
    LPFrontEndMoviePlayer.setButtonIcon(15, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_bumperRight>");
    //return;    
}

function OnViewClosed()
{
    Outer.GetPC().ClearTimer('Tick', self);
    super.OnViewClosed();
    Outer.SetExternalInterface(MoviePlayer);
    //return;    
}

function OnViewStackPositionChanged()
{
    local /*0x97E50000-0x00000000*/ private name nextViewName[9437185];

    'None'
    CloseSubMenu();
    EnablePartyPreLobbyTab();
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    WI.Widget = Widget;
    WI.bCurrentState = Widget.GetBool("disabled");
    WidgetList.AddItem(WI);    
    LocalizedString = GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_" $ string(WidgetName)) $ ">");
    // End:0x12B
    if(IsLocalizationSuccessful(LocalizedString))
    {
        Widget.SetText(LocalizedString);
        return true;
    }
    return super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    //return ReturnValue;    
}

function OnEscapeKeyPress()
{
    LPFrontEndPartyLobby.PlayNavBackSoundEvent();
    CurrentDialog = LPFrontEndPartyLobby.ConfirmExitDialog();
    bDialogOpen = CurrentDialog != none;
    //return;    
}

function MoveBackImpl()
{
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x75
    if(bDialogOpen)
    {
        return CurrentDialog.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    // End:0xDE
    if(ButtonName == 'XboxTypeS_RightThumbStick')
    {
        // End:0xDC
        if(int(InputEvent) == int(0))
        {
            // End:0xDC
            if(((int(CurrentViewMode) == int(0)) && b360) && IsInExternalParty())
            {
                LaunchCommunityScreen();
            }
        }
        return true;
    }
    // End:0x23C
    if((((((((((((((ButtonName == 'XBoxTypeS_LeftStick_Left') || ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XBoxTypeS_RightStick_Left') || ButtonName == 'Gamepad_RightStick_Left') || ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'Left') || ButtonName == 'XBoxTypeS_LeftStick_Right') || ButtonName == 'Gamepad_LeftStick_Right') || ButtonName == 'XBoxTypeS_RightStick_Right') || ButtonName == 'Gamepad_RightStick_Right') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'Right') || ButtonName == 'NumPadFour') || ButtonName == 'NumPadSeven')
    {
        return true;
    }
    // End:0x306
    if((((((ButtonName == 'XBoxTypeS_LeftStick_Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XBoxTypeS_RightStick_Up') || ButtonName == 'Gamepad_RightStick_Up') || ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up')
    {
        // End:0x304
        if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
        {
            SelectPrevListItem();
        }
        return true;
    }
    // End:0x3D0
    if((((((ButtonName == 'XBoxTypeS_LeftStick_Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XBoxTypeS_RightStick_Down') || ButtonName == 'Gamepad_RightStick_Down') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down')
    {
        // End:0x3CE
        if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
        {
            SelectNextListItem();
        }
        return true;
    }
    // End:0x441
    if(ButtonName == 'XboxTypeS_A')
    {
        // End:0x43C
        if(int(InputEvent) == int(0))
        {
            // End:0x43C
            if(CanShowSubMenu())
            {
                Outer.PlaySoundFromTheme(ListItemPressSoundEventName);
                ShowSubMenu(true);
            }
        }
        return true;        
    }
    else
    {
        // End:0x47B
        if(ButtonName == 'XboxTypeS_B')
        {
            // End:0x476
            if(int(InputEvent) == int(0))
            {
                OnEscapeKeyPress();
            }
            return true;            
        }
        else
        {
            // End:0x599
            if((ButtonName == 'XboxTypeS_X') || ButtonName == 'One')
            {
                // End:0x594
                if((int(CurrentViewMode) == int(0)) && int(InputEvent) == int(0))
                {
                    // End:0x54E
                    if(int(Outer.GetPC().Role) == int(ROLE_Authority))
                    {
                        Class'LPMultiplayerManager'.static.GetInstance().DisbandParty();                        
                    }
                    else
                    {
                        Class'LPMultiplayerManager'.static.GetInstance().LeaveParty(OnLeavePartyRequestComplete);
                    }
                }
                return true;                
            }
            else
            {
                // End:0x649
                if(ButtonName == 'XboxTypeS_Y')
                {
                    // End:0x644
                    if(int(InputEvent) == int(0))
                    {
                        // End:0x5DE
                        if(bPS3)
                        {
                            LaunchInvitesScreen();                            
                        }
                        else
                        {
                            // End:0x626
                            if(int(CurrentViewMode) == int(0))
                            {
                                // End:0x60C
                                if(IsInExternalParty())
                                {
                                    LaunchSendInvitesToExternalParty();                                    
                                }
                                else
                                {
                                    // End:0x623
                                    if(b360)
                                    {
                                        LaunchAddFriendScreen();
                                    }
                                }                                
                            }
                            else
                            {
                                // End:0x644
                                if(int(CurrentViewMode) == int(1))
                                {
                                    LaunchAddFriendScreen();
                                }
                            }
                        }
                    }
                    return true;                    
                }
                else
                {
                    // End:0x699
                    if(ButtonName == 'Two')
                    {
                        // End:0x694
                        if((int(InputEvent) == int(1)) && int(CurrentViewMode) == int(1))
                        {
                            LaunchAddFriendScreen();
                        }
                        return true;                        
                    }
                    else
                    {
                        // End:0x71B
                        if((ButtonName == 'XboxTypeS_LeftShoulder') || ButtonName == 'Three')
                        {
                            // End:0x716
                            if(int(InputEvent) == int(0))
                            {
                                Outer.PlaySoundFromTheme('NetLobbyBumper');
                                NavTab("left");
                            }
                            return true;                            
                        }
                        else
                        {
                            // End:0x79E
                            if((ButtonName == 'XboxTypeS_RightShoulder') || ButtonName == 'Four')
                            {
                                // End:0x799
                                if(int(InputEvent) == int(0))
                                {
                                    Outer.PlaySoundFromTheme('NetLobbyBumper');
                                    NavTab("right");
                                }
                                return true;                                
                            }
                            else
                            {
                                // End:0x865
                                if((ButtonName == 'XboxTypeS_Back') || ButtonName == 'BackSpace')
                                {
                                    // End:0x863
                                    if((int(InputEvent) == int(0)) && int(Outer.GetPC().Role) == int(ROLE_Authority))
                                    {
                                        CurrentDialog = LPFrontEndPartyLobby.AccessFilterDialog();
                                        bDialogOpen = CurrentDialog != none;
                                    }
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function OnLeavePartyRequestComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0xF6
    if(bWasSuccessful)
    {
        Class'LPMultiplayerManager'.static.GetInstance().ClearDelegates();
        PC = LPPlayerController(Outer.GetPC());
        // End:0xA8
        if(PC != none)
        {
            PC.ReturnToMPLobby(,,, true);            
        }
        else
        {            
            Outer.GetPC().ConsoleCommand("start ?Closed");
        }
    }
    //return;    
}

function SwitchTabs()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TabName[8388609];

    ActionScriptVoid("switchTabs");
    //return;    
}

function NavTab()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Direction[8388609];

    ActionScriptVoid("tab");
    //return;    
}

function SetSelectedListItem()
{
    local /*0x97E50000-0x00000000*/ private int SelectionIndex[8388609];

    ActionScriptVoid("SetSelectionIndex");
    //return;    
}

function SetButtonPromptsVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("setButtonPromptsVisible");
    //return;    
}

function SetConfirmPromptVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("setConfirmPromptVisible");
    //return;    
}

function ShowPartyMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("showPartyMenu");
    //return;    
}

function SetNumPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    ActionScriptVoid("setNumPartyMembers");
    //return;    
}

function SetPartyMemberData()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x97E50000-0x00000000*/ private int iMetagamePercent[8388609], iPlayTimeInSeconds, iPlayersCredits;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayersCountry[8388609];
    local /*0x97E50000-0x00000000*/ private int iPlayersPingQuality[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayersVoiceStatus[8388609];

    ActionScriptVoid("setPlayerData");
    //return;    
}

function ForcePartyUpdate()
{
    ActionScriptVoid("forcePartyUpdate");
    //return;    
}

function SetNumFriends()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    ActionScriptVoid("setNumFriends");
    //return;    
}

function SetFriendData()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendName[8388609], PresenceInfo;
    local /*0x97E50000-0x00000000*/ private bool bOnline[8388609], bInLiveParty;

    ActionScriptVoid("updateFriendData");
    //return;    
}

function SetNumInvites()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    ActionScriptVoid("setNumInvites");
    //return;    
}

function SetInviteData()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string SenderName[8388609], SenderMessage, RequestType;

    ActionScriptVoid("updateInviteData");
    //return;    
}

function ShowNewInvite()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("showNewInvite");
    //return;    
}

function ShowSubMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    // End:0x117
    if(bVisible && !bDialogOpen)
    {
        // End:0x6D
        if(ContextMenu == none)
        {
            ContextMenu = LPGFxFrontEnd_ContextMenu(FrontEndViewLoader.SpawnDialog('ContextMenu', self));            
        }
        else
        {
            FrontEndViewLoader.ConfigureTargetDialog(ContextMenu);
        }
        // End:0x101
        if(ContextMenu != none)
        {
            ContextMenu.OnMenuVisibleDelegate = self.OnContextMenuVisible;
            ContextMenu.ShowMenu();
        }
        CurrentDialog = ContextMenu;        
    }
    else
    {
        // End:0x130
        if(!bVisible)
        {
            CloseSubMenu();
        }
    }
    bDialogOpen = bVisible;
    //return;    
}

function SetSubMenuNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    // End:0x37
    if(ContextMenu != none)
    {
        ContextMenu.SetNumOptions(iCount);
    }
    //return;    
}

function SetSubMenuOptionType()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private byte OptionType[8388609];

    // End:0x40
    if(ContextMenu != none)
    {
        ContextMenu.SetOptionType(iIndex, OptionType);
    }
    //return;    
}

function UpdateSubMenuOption()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string OptionName[8388609], OptionString;

    // End:0x40
    if(ContextMenu != none)
    {
        ContextMenu.SetOptionText(iIndex, OptionString);
    }
    //return;    
}

function DisableSubMenuOption()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDisabled[8388609];

    // End:0x41
    if(ContextMenu != none)
    {
        ContextMenu.SetOptionDisabled(iIndex, bDisabled);
    }
    //return;    
}

function CloseSubMenu()
{
    // End:0x3E
    if((ContextMenu != none) && bDialogOpen)
    {
        ContextMenu.ShowMenu(false);
    }
    MoviePlayer.SetExternalInterface(self);
    MenuViewLoader.SetEscapeDelegate(self.OnEscapeKeyPress);
    //return;    
}

function CanShowSubMenu()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (SelectedIndex >= 0) && CurrentView.Length > SelectedIndex;
    //return ReturnValue;    
}

function SetViewFocus()
{
    local /*0x97E50000-0x00000000*/ private bool bFocus[8388609];

    super.SetViewFocus(bFocus);
    SetPartyPreLobbyFocused(bFocus);
    MoviePlayer.SetExternalInterface(self);
    // End:0x75
    if(bFocus)
    {
        EnablePartyPreLobbyTab();
        RefreshSelectedListItem();
        bDialogOpen = false;
    }
    //return;    
}

function RefreshSelectedListItem()
{
    SelectedIndex = ((CurrentView.Length > 1) ? Min(SavedSelectedIndex[int(CurrentViewMode)], CurrentView.Length - 1) : 0);
    SavedSelectedIndex[int(CurrentViewMode)] = SelectedIndex;
    SetSelectedListItem(SelectedIndex);
    //return;    
}

function SetPartyTabText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PartyTab[8388609], FriendsTab, InvitesTab;

    ActionScriptVoid("setPartyTabText");
    //return;    
}

function HideInvitesTab()
{
    ActionScriptVoid("HideInvitesTab");
    //return;    
}

function SetPartyPreLobbyFocused()
{
    local /*0x97E50000-0x00000000*/ private bool bFocus[8388609];

    ActionScriptVoid("bPrePartyIsFocused");
    //return;    
}

function EnablePartyPreLobbyTab()
{
    ActionScriptVoid("enablePartyPreLobbyTab");
    //return;    
}

function BlockInputFlag()
{
    local /*0x97E50000-0x00000000*/ private bool _b[8388609];

    ActionScriptVoid("blockInputFlag");
    //return;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;

    BlockInputFlag(bDisableComponents);
    Index = 0;
    J0x1F:

    // End:0x177 [Loop If]
    if(Index < WidgetList.Length)
    {
        // End:0xFC
        if(bDisableComponents)
        {
            WidgetList[Index].bCurrentState = WidgetList[Index].Widget.GetBool("disabled");
            WidgetList[Index].Widget.SetBool("disabled", true);            
        }
        else
        {
            WidgetList[Index].Widget.SetBool("disabled", WidgetList[Index].bCurrentState);
        }
        Index++;
        // [Loop Continue]
        goto J0x1F;
    }
    // End:0x1D1
    if(!bDisableComponents)
    {
        dummyButton = GetObject("partyListTab");
        MenuViewLoader.SetSelectionFocus(dummyButton);
    }
    super.DisableSubComponents(bDisableComponents);
    //return;    
}

defaultproperties
{
    ReadFriendsFrequency=3
    ListItemPressSoundEventName="NetLobbyMenuConfirm"
    ListChangeSoundEventName="NetLobbyRtPanelSelect"
    NavBackSoundEventName="NetLobbyMenuBack"
}