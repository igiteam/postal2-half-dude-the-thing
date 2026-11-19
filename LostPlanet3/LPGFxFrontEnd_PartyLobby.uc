class LPGFxFrontEnd_PartyLobby extends LPGFxFrontEnd_Screen within GFxMoviePlayer
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

enum PartyAccessFilter
{
    ePartyAccessFilter_InviteOnly,  // 0
    ePartyAccessFilter_InviteFriends,// 1
    ePartyAccessFilter_MAX          // 2
};

struct PartyEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PriIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MetagamePercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PingQuality;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VoiceStatus;

    structdefaultproperties
    {
        PriIndex=0
        MetagamePercent=0
        PlayerName=""
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        PingQuality=0
        VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled
    }
};

struct DLCFilterItem
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DLCId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DLCName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayDescription;

    structdefaultproperties
    {
        DLCId=0
        DLCName=""
        DisplayName=""
        DisplayDescription=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLANLobby;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMessagesWaiting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPushedInvitesScreen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CurrentView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AccessFilter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DLCFilters;

function Startup()
{
    // End:0x4A
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_ListenServer))
    {
        AttemptPartyTransition();
    }
    //return;    
}

function BuildCurrentView()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, PRI, LPPRI, PInfo;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private bool bMe;

    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    CurrentView.Length = 0;
    // End:0x301
    foreach GRI.PRIArray(PRI, iIndex)
    {
        LPPRI = LPMenuGamePRI(PRI);
        // End:0xAE
        if(LPPRI == none)
        {
            continue;            
        }
        else
        {
            bMe = Outer.GetPC().PlayerReplicationInfo == LPPRI;
            PInfo.PriIndex = iIndex;
            PInfo.PlayerName = LPPRI.GetHumanReadableName();
            PInfo.PingQuality = ((bMe) ? 5 : Class'LPMenuGamePRI'.static.ConvertPRIPing(LPPRI.Ping));
            PInfo.MetagamePercent = LPPRI.MetagamePercent;
            PInfo.VoiceStatus = 2;
            PInfo.PlayerID = LPPRI.UniqueId;
            CurrentView.AddItem(PInfo);            
            SetPartyMemberData(1 + iIndex, PInfo.PlayerName, PInfo.MetagamePercent, PInfo.PingQuality, GetVoiceStatusFromEnum(PInfo.VoiceStatus));            
        }
    }    
    SetNumPartyMembers(CurrentView.Length);
    ForcePartyUpdate();
    ShowPartyMenu(true);
    //return;    
}

function GetAccessFilterLobbyHeader()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], ret;

    switch(AccessFilter)
    {
        // End:0x7B
        case 0:
            ret = "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.AccessFilterLobbyHeader_InviteOnly>";
            // End:0xE9
            break;
        // End:0xE6
        case 1:
            ret = "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.AccessFilterLobbyHeader_InviteFriends>";
            // End:0xE9
            break;
        // End:0xFFFF
        default:
            break;
    }
    return GetLocalizedString(ret);
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

function GetPlayerInterface()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSubx, PlayerInterface;

    OnlineSubx = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x60
    if(OnlineSubx != none)
    {
        PlayerInterface = OnlineSubx.PlayerInterface;
    }
    return PlayerInterface;
    //return ReturnValue;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, PRI;
    local /*0x97E50000-0x00000000*/ private int iPRIIndex, iCount;
    local /*0x97E50000-0x00000000*/ private bool bChanged, bInbox;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Messages;

    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0xE9
    foreach GRI.PRIArray(PRI, iPRIIndex)
    {
        // End:0x9A
        if(iPRIIndex >= CurrentView.Length)
        {
            bChanged = true;            
        }
        else
        {
            // End:0xDD
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
    // End:0x11B
    if(bChanged || iCount != CurrentView.Length)
    {
        BuildCurrentView();
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.GetFriendMessages(byte(Outer.GetLP().ControllerId), Messages);
    bInbox = Messages.Length > 0;
    // End:0x212
    if(bInbox != bMessagesWaiting)
    {
        ShowHideMailboxIndicator(bInbox);
        bMessagesWaiting = bInbox;
    }
    //return;    
}

function AttemptPartyTransition()
{
    // End:0x0F
    if(PartyHasNonLocalPlayers())
    {
        return;
    }
    TransitionToParty();
    //return;    
}

function TransitionToParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x12B
    if(!MPManager.IsInParty())
    {
        // End:0xD9
        if(MPManager.GameInterface.GetGameSettings(MPManager.SessionNameParty) != none)
        {
            MPManager.DestroyOnlineParty(OnDestroyOnlineGameComplete_CreateParty);            
        }
        else
        {
            MPManager.__OnCreateGameComplete__Delegate = OnCreateGameComplete_CreateParty;
            MPManager.CreateParty();
        }        
    }
    else
    {
        OnCreateGameComplete_CreateParty(MPManager.SessionNameParty, true);
    }
    //return;    
}

function OnDestroyOnlineGameComplete_CreateParty()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyOnlineGameComplete_CreateParty);
    TransitionToParty();
    //return;    
}

function OnCreateGameComplete_CreateParty()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, PartySettings;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnCreateGameComplete__Delegate = None;
    // End:0x146
    if(bWasSuccessful)
    {
        PartySettings = MPManager.GetPartySettings();
        // End:0x146
        if(PartySettings != none)
        {
            Class'LPOnlineGameSettings'.static.StaticSetMatchState(PartySettings, 0);
            MPManager.UpdatePlayerCounts(SessionName);
            MPManager.SetPlayerOnlineStatus(Outer.GetLP().ControllerId, 2);
        }
    }
    //return;    
}

function PartyHasNonLocalPlayers()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int PRIIdx;
    local /*0x97E50000-0x00000000*/ private @NULL PartyGRI, CurrPRI, CurrController;

    PartyGRI = LPPartyGRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0x16C
    if(PartyGRI != none)
    {
        PRIIdx = 0;
        J0x62:

        // End:0x16C [Loop If]
        if(PRIIdx < PartyGRI.PRIArray.Length)
        {
            CurrPRI = PartyGRI.PRIArray[PRIIdx];
            // End:0x15E
            if((CurrPRI != none) && !CurrPRI.bIsInactive)
            {
                CurrController = LPPlayerController(CurrPRI.Owner);
                // End:0x15E
                if((CurrController != none) && !CurrController.IsLocalPlayerController())
                {
                    return true;
                }
            }
            PRIIdx++;
            // [Loop Continue]
            goto J0x62;
        }
    }
    return false;
    //return ReturnValue;    
}

function OnExitWaitingDialogOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExitWaitingMovie[8388609];

    LPFrontEndMoviePlayer.SuspendRendering(false);
    //return;    
}

function OpenExitWaitingDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;

    OptionArray.Length = 0;
    Class'SPEngine.SPUIManager'.static.ShowUIMessage('ExitWaiting', Class'SPEngine.SPUtil'.static.GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ExitWaitDialog_Title>"), Class'SPEngine.SPUtil'.static.GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ExitWaitDialog_Body>"), OptionArray, Outer.,,,,,,,,,, OnExitWaitingDialogOpen);
    //return;    
}

function CloseExitWaitingDialog()
{
    LPFrontEndMoviePlayer.ResumeRendering();
    Class'SPEngine.SPUIManager'.static.ClearUIMessage('ExitWaiting');
    //return;    
}

private final function ExitToMainMenuInternal()
{
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    Class'LPUIDataStore_FrontEnd'.static.SetSkipTitleScreen(true);
    SPPlayerController(Outer.GetPC()).ReturnToMainMenu();
    //return;    
}

function ExitWaitLoop()
{
    // End:0x8D
    if(!Class'LPMultiplayerManager'.static.GetInstance().bInProgress)
    {
        Outer.GetPC().ClearTimer('ExitWaitLoop', self);
        CloseExitWaitingDialog();
        ExitToMainMenuInternal();
    }
    //return;    
}

function ExitToMainMenu()
{
    // End:0x83
    if(Class'LPMultiplayerManager'.static.GetInstance().bInProgress)
    {
        Outer.GetPC().SetTimer(0.1000000, true, 'ExitWaitLoop', self);
        OpenExitWaitingDialog();        
    }
    else
    {
        ExitToMainMenuInternal();
    }
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL DLCMan, MPMgr, CurrDLCInfo, MenuGame, DLCFI;

    local /*0x97E50000-0x00000000*/ private int MyInstalledDLC;
    local /*0x97E50000-0x00000000*/ private bool bFirst;
    local /*0x97E50000-0x00000000*/ private int Idx;

    false
    'None'
    // End:0x96
    if(bPlayOpenAnimation)
    {
        // End:0x96
        if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
        {
            Class'LPMultiplayerManager'.static.GetInstance().bIsJoining = false;
        }
    }
    Class'LPUIDataStore_MatchSummary'.static.ResetMatchSummaryData();
    // End:0x4DF
    if((((previousView != 'InfoDialog') && previousView != 'MenuDialog') && previousView != 'ContextMenu') && previousView != 'OnlineAddFriend')
    {
        // End:0x224
        if((LPFrontEndMoviePlayer != none) && !bLANLobby)
        {
            // End:0x1C1
            if(LPFrontEndMoviePlayer.DisplayContent == none)
            {
                LPFrontEndMoviePlayer.DisplayContent = Outer.GetVariableObject("_root.displaySecondary.displayContent");
            }
            // End:0x224
            if(LPFrontEndMoviePlayer.DisplayContent != none)
            {
                LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("partyList");
            }
        }
        // End:0x2E0
        if(!bLANLobby && int(Outer.GetPC().Role) == int(ROLE_Authority))
        {
            LPFrontEndMoviePlayer.setButtonIcon(3, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HelpLegend_AccessFilter>");
        }
        LPFrontEndMoviePlayer.setButtonIcon(4, "<Strings:LostPlanetGame.UI.ButtonMetagame>");
        LPFrontEndMoviePlayer.setButtonIcon(2, "<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.TogglePartyHost>");
        LPFrontEndMoviePlayer.setButtonIcon(1, "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>");
        LPFrontEndMoviePlayer.setButtonIcon(0, "<Strings:LostPlanetGame.UI.ButtonBack>");
        ShowHideMailboxIndicator(false);
        Startup();
        // End:0x4DC
        if(((LPFrontEndMoviePlayer != none) && LPFrontEndMoviePlayer.SecondaryDisplay != none) && !bPushedInvitesScreen)
        {
            LPFrontEndMoviePlayer.PushSecondaryViewByName(false, 'SecondaryManagePartyInvites', self);
            LPFrontEndMoviePlayer.SetSecondaryDisplayMPMode(true);
            bPushedInvitesScreen = true;
        }        
    }
    else
    {
        SetPartyFilterText(GetAccessFilterLobbyHeader());
    }
    MenuGame = LPMenuGame(Class'Engine.WorldInfo'.static.GetWorldInfo().Game);
    // End:0x585
    if((MenuGame == none) || !MenuGame.bInDevMode)
    {
        RemoveOptionItemByName("JoinMatch");
    }
    DLCMan = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    MyInstalledDLC = DLCMan.GetDLCIds();
    DLCFilters.Length = 0;
    // End:0x613
    if(MyInstalledDLC == 0)
    {
        RemoveOptionItemByName("MapFilter");        
    }
    else
    {
        bFirst = true;
        Idx = 0;
        J0x62A:

        // End:0x8F8 [Loop If]
        if(Idx < DLCMan.InstalledDLCInfoInstanced.Length)
        {
            CurrDLCInfo = LPDLCInfoBase(DLCMan.InstalledDLCInfoInstanced[Idx]);
            // End:0x8EA
            if(CurrDLCInfo.bCanBeFiltered == 1)
            {
                // End:0x7E8
                if(bFirst)
                {
                    DLCFI.DLCId = 0;
                    DLCFI.DLCName = "Default";
                    DLCFI.DisplayName = "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MapFilterDefault>";
                    DLCFI.DisplayDescription = "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MapFilterDesc>";
                    DLCFilters.AddItem(DLCFI);                    
                    bFirst = false;
                }
                DLCFI.DLCId = CurrDLCInfo.DLCId;
                DLCFI.DLCName = CurrDLCInfo.DLCName;
                DLCFI.DisplayName = CurrDLCInfo.DisplayName;
                DLCFI.DisplayDescription = CurrDLCInfo.DisplayDescription;
                DLCFilters.AddItem(DLCFI);                
            }
            ++Idx;
            // [Loop Continue]
            goto J0x62A;
        }
        // End:0x91D
        if(DLCFilters.Length == 0)
        {
            RemoveOptionItemByName("MapFilter");
        }
    }
    // End:0x94C
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionBackButton(true);
    }
    SPPlayerController(Outer.GetPC()).ClientStopMovie(0.0000000, false, true, true);
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.SetPlayerOnlineStatus(Outer.GetLP().ControllerId, 2);
    MPMgr.OwningNetId = MPMgr.GetUniqueNetId(MPMgr.OwningControllerIndex);
    MPMgr.ResetDLCFilter();
    // End:0xAD2
    if(LPFrontEndMoviePlayer.FocusViewLoaderIndex == 1)
    {
        LPFrontEndMoviePlayer.FocusSecondaryViewLoader(true);        
    }
    else
    {
        super.OnTopMostView(bPlayOpenAnimation, previousView);
        Outer.SetExternalInterface(self);
    }
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private float StepperSelectedIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data;

    SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
    SelectedIndex = GetSettingsListIndexFromDataIndex(SelectedIndex);
    mySettingsList = GetSettingsList();
    // End:0x1AC
    if(mySettingsList[SelectedIndex].OptionName == "MapFilter")
    {
        // End:0x1AC
        if(LPFrontEndMoviePlayer != none)
        {
            Data = ListDataProvider.GetElementObject(SelectedIndex);
            StepperSelectedIndex = Data.GetFloat("optIndex");
            // End:0x1AC
            if((StepperSelectedIndex >= float(0)) && StepperSelectedIndex < float(DLCFilters.Length))
            {
                LPFrontEndMoviePlayer.Description.SetText(GetLocalizedString(DLCFilters[int(StepperSelectedIndex)].DisplayDescription));
                return;
            }
        }
    }
    super.UpdateDescription();
    //return;    
}

function OnViewStackPositionChanged()
{
    local /*0x97E50000-0x00000000*/ private name nextViewName[9437185];

    'None'
    super.OnViewStackPositionChanged(nextViewName);
    // End:0x8C
    if((((nextViewName != 'InfoDialog') && nextViewName != 'MenuDialog') && nextViewName != 'ContextMenu') && nextViewName != 'OnlineAddFriend')
    {
        Cleanup();
    }
    Outer.SetExternalInterface(MoviePlayer);
    //return;    
}

function OnViewClosed()
{
    Cleanup();
    super(SPGFxUIView).OnViewClosed();
    //return;    
}

function Cleanup()
{
    LPFrontEndMoviePlayer.setButtonIcon(2, "");
    LPFrontEndMoviePlayer.setButtonIcon(3, "");
    LPFrontEndMoviePlayer.setButtonIcon(4, "");
    LPFrontEndMoviePlayer.setButtonIcon(5, "");
    Outer.GetPC().ClearTimer('Tick', self);
    // End:0x105
    if(!bLANLobby)
    {
        SetNumPartyMembers(0);
        ForcePartyUpdate();
        ShowPartyMenu(false);
        ShowHideMailboxIndicator(false);
    }
    // End:0x188
    if(((LPFrontEndMoviePlayer != none) && LPFrontEndMoviePlayer.DisplayContent != none) && !bLANLobby)
    {
        LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("default");
    }
    // End:0x1EB
    if(bPushedInvitesScreen)
    {
        LPFrontEndMoviePlayer.SecondaryDisplay.ViewLoader.PopView();
        bPushedInvitesScreen = false;
    }
    // End:0x219
    if(MoviePlayer != none)
    {
        MoviePlayer.CheckSaveProfile();
    }
    //return;    
}

function ConfirmExitDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x2B7
    if(ConfirmMC != none)
    {
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ConfirmExitDialog_Title>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ConfirmExitDialog_Body>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ConfirmExitDialog_No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ConfirmExitDialog_Confirm>");
        ConfirmMC.SetButtonOnPress(0, cbConfirmExitDialog_Remain);
        ConfirmMC.SetButtonOnPress(1, cbConfirmExitDialog_Exit);
        ConfirmMC.SetDefaultFocusedButton(0);
    }
    return ConfirmMC;
    //return ReturnValue;    
}

function cbConfirmExitDialog_Exit()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    ExitToMainMenu();
    //return;    
}

function cbConfirmExitDialog_Remain()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function AccessFilterDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], ConfirmMC, MPManager;

    SuppressDefaultSoundEvents(true);
    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('MenuDialog', self, true));
    // End:0x34F
    if(ConfirmMC != none)
    {
        Outer.PlaySoundFromTheme('NetLobbyAccessFilter');
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.AccessFilterDialogTitle>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.AccessFilterDialogBody>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.AccessFilterDialogInviteOnly>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.AccessFilterDialogInviteFriends>");
        ConfirmMC.SetButtonOnPress(0, cbAccessFilterDialog_InviteOnly);
        ConfirmMC.SetButtonOnPress(1, cbAccessFilterDialog_InviteFriends);
        MPManager = Class'LPMultiplayerManager'.static.GetInstance();
        ConfirmMC.SetDefaultFocusedButton(((int(MPManager.GetPresenceInviteMode()) == int(0)) ? 0 : 1));
    }
    SuppressDefaultSoundEvents(false);
    return ConfirmMC;
    //return ReturnValue;    
}

function cbAccessFilterDialog_InviteOnly()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;

    AccessFilter = 0;
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.SetPresenceInviteMode(0, true);
    MPManager.SetPlayerOnlineStatus(Outer.GetLP().ControllerId, 2);
    //return;    
}

function cbAccessFilterDialog_InviteFriends()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;

    AccessFilter = 1;
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.SetPresenceInviteMode(1, true);
    MPManager.SetPlayerOnlineStatus(Outer.GetLP().ControllerId, 2);
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    RefreshFocus(ev.Index);
    switch(Selection)
    {
        // End:0x104
        case 'PublicMatch':
            Select_PublicMatch();
            // End:0x267
            break;
        // End:0x11D
        case 'PrivateMatch':
            Select_PrivateMatch();
            // End:0x267
            break;
        // End:0x136
        case 'Play':
            Select_Play();
            // End:0x267
            break;
        // End:0x170
        case 'QuickMatch':
            MPManager.bIsQuickMatch = true;
            Select_Quickmatch();
            // End:0x267
            break;
        // End:0x1AA
        case 'CustomMatch':
            MPManager.bIsQuickMatch = false;
            Select_Custom();
            // End:0x267
            break;
        // End:0x1E4
        case 'HostMatch':
            MPManager.bIsQuickMatch = false;
            Select_Host();
            // End:0x267
            break;
        // End:0x1FD
        case 'JoinMatch':
            Select_Join();
            // End:0x267
            break;
        // End:0x216
        case 'Records':
            Select_Records();
            // End:0x267
            break;
        // End:0x22F
        case 'Options':
            Select_Options();
            // End:0x267
            break;
        // End:0x248
        case 'Metagame':
            Select_Metagame();
            // End:0x267
            break;
        // End:0x261
        case 'LoadoutKits':
            Select_LoadoutKits();
            // End:0x267
            break;
        // End:0xFFFF
        default:
            // End:0x267
            break;
            break;
    }
    //return;    
}

function OnListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    RefreshFocus(ev.Index);
    super(SPGFxUIViewSettingsMenuBase).OnListChange(ev);
    //return;    
}

function RefreshFocus()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL FrontEndManager;

    -1
    FrontEndManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    // End:0x6A
    if(FrontEndManager.FocusViewLoaderIndex != 0)
    {
        FrontEndManager.FocusViewLoaderByIndex(0);
    }
    // End:0xC3
    if((ListMC != none) && SelectedIndex >= 0)
    {
        ListMC.SetFloat("selectedIndex", float(SelectedIndex));
    }
    //return;    
}

function Select_BackImpl()
{
    PlayNavBackSoundEvent();
    ConfirmExitDialog();
    //return;    
}

function Select_Custom()
{
    // End:0x117
    if(int(Outer.GetPC().Role) != int(ROLE_Authority))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PartyHostOnlyAction_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoAccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    MenuViewLoader.PushViewByName('SaveWarning', self);
    //return;    
}

function Select_Host()
{
    // End:0x117
    if(int(Outer.GetPC().Role) != int(ROLE_Authority))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PartyHostOnlyAction_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoAccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    Class'LPMultiplayerManager'.static.GetInstance().bIsQuickMatch = false;
    Class'LPMultiplayerManager'.static.GetInstance().HostGame(false);
    //return;    
}

function Select_Join()
{
    // End:0x117
    if(int(Outer.GetPC().Role) != int(ROLE_Authority))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PartyHostOnlyAction_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoAccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    MenuViewLoader.PushViewByName('JoinMapList', self);
    //return;    
}

function Select_Metagame()
{
    MenuViewLoader.SpawnDialog('Metagame', self);
    //return;    
}

function Select_LoadoutKits()
{
    MenuViewLoader.SpawnDialog('LoadoutKits', self);
    //return;    
}

function Select_Quickmatch()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x117
    if(int(Outer.GetPC().Role) != int(ROLE_Authority))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PartyHostOnlyAction_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoAccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x221
    if((OnlineSub == none) || int(OnlineSub.PlayerInterface.CanPlayOnline(byte(Outer.GetLP().ControllerId))) != int(2))
    {
        BuildResponseDialog("ResponseDialog_CannotPlayOnlineTitle", "ResponseDialog_CannotPlayOnlineMessage");
        return;
    }
    MenuViewLoader.PushViewByName('QuickmatchGameType', self);
    //return;    
}

function Select_Options()
{
    MenuViewLoader.PushViewByName('Options', self);
    //return;    
}

function Select_Play()
{
    MenuViewLoader.PushViewByName('OnlineGameType', self);
    //return;    
}

function Select_PrivateMatch()
{
    // End:0x117
    if(int(Outer.GetPC().Role) != int(ROLE_Authority))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PartyHostOnlyAction_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoAccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    MenuViewLoader.PushViewByName('SaveWarning', self);
    //return;    
}

function Select_PublicMatch()
{
    local /*0x97E50000-0x00000000*/ private int RequiredDLC;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, MPManager, DLCMan;

    // End:0x117
    if(int(Outer.GetPC().Role) != int(ROLE_Authority))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PartyHostOnlyAction_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoAccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x2EF
    if(MPManager.DLCIdFilter != 0)
    {
        DLCMan = LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
        RequiredDLC = MPManager.DLCIdFilter | DLCMan.GetMinRequiredDLCIdsToJoin();
        // End:0x2EF
        if(!DLCMan.AllPlayersHaveRequiredDLC(RequiredDLC))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Msg>", "<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            return;
        }
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x3F9
    if((OnlineSub == none) || int(OnlineSub.PlayerInterface.CanPlayOnline(byte(Outer.GetLP().ControllerId))) != int(2))
    {
        BuildResponseDialog("ResponseDialog_CannotPlayOnlineTitle", "ResponseDialog_CannotPlayOnlineMessage");
        return;
    }
    MenuViewLoader.PushViewByName('PublicMatchMenu', self);
    //return;    
}

function Select_Records()
{
    MenuViewLoader.PushViewByName('PlayerRecords', self);
    //return;    
}

function ShouldAbsorbLeftRightInput()
{
    local /*0x97E50000-0x00000000*/ private bool bLeft[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private float StepperSelectedIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data, StepperDataProvider;
    local /*0x97E50000-0x00000000*/ private int NumMapPackOptions;

    // End:0x1C2
    if(ListMC != none)
    {
        SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
        SelectedIndex = GetSettingsListIndexFromDataIndex(SelectedIndex);
        mySettingsList = GetSettingsList();
        // End:0x1C2
        if(mySettingsList[SelectedIndex].OptionName == "MapFilter")
        {
            Data = ListDataProvider.GetElementObject(SelectedIndex);
            StepperSelectedIndex = Data.GetFloat("optIndex");
            // End:0x139
            if(bLeft)
            {
                // End:0x136
                if(StepperSelectedIndex > float(0))
                {
                    return false;
                }                
            }
            else
            {
                StepperDataProvider = Data.GetObject("dataProvider");
                NumMapPackOptions = int(StepperDataProvider.GetFloat("length"));
                // End:0x1C2
                if(StepperSelectedIndex < float(NumMapPackOptions - 1))
                {
                    return false;
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function SetupSettingsObject()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Option[8388609], ReturnValue, TempObj, RendererDataProvider;
    local /*0x97E50000-0x00000000*/ private int DefaultIndex, SavedMapPackID, I;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, ProfileSettings;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x72
    if(LPPC != none)
    {
        ProfileSettings = LPProfileSettings(LPPC.ProfileSettings);
    }
    // End:0x669
    if(Option.OptionName == "MapFilter")
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", Option.FriendlyName);
        TempObj.SetString("control", Option.OptionType);
        RendererDataProvider = Outer.CreateArray();
        DefaultIndex = 0;
        SavedMapPackID = 0;
        // End:0x1D0
        if(ProfileSettings != none)
        {
            SavedMapPackID = ProfileSettings.GetMapPackFilterID();
        }
        Class'LPMultiplayerManager'.static.GetInstance().DLCIdFilter = 0;
        I = 0;
        J0x211:

        // End:0x331 [Loop If]
        if(I < DLCFilters.Length)
        {
            RendererDataProvider.SetElementString(I, GetLocalizedString(DLCFilters[I].DisplayName));
            // End:0x323
            if(DLCFilters[I].DLCId == SavedMapPackID)
            {
                DefaultIndex = I;
                Class'LPMultiplayerManager'.static.GetInstance().DLCIdFilter = DLCFilters[I].DLCId;
            }
            ++I;
            // [Loop Continue]
            goto J0x211;
        }
        TempObj.SetObject("dataProvider", RendererDataProvider);
        TempObj.SetFloat("optIndex", float(DefaultIndex));
        TempObj.SetFloat("prevOptIndex", float(DefaultIndex));
        TempObj.SetFloat("minimum", Option.RawValueMin);
        TempObj.SetFloat("maximum", Option.RawValueMax);
        TempObj.SetFloat("value", 0.0000000);
        TempObj.SetFloat("prevValue", 0.0000000);
        TempObj.SetFloat("snapInterval", Option.SliderSnapInterval);
        TempObj.SetBool("bUpdateFromUnreal", true);
        TempObj.SetBool("bNumericCombo", Option.bNumericCombo);
        TempObj.SetBool("bEditableCombo", Option.bEditableCombo);
        TempObj.SetFloat("editBoxMaxLength", float(Option.EditBoxMaxLength));
        TempObj.SetBool("isDisabled", Option.bDisabled);
        return TempObj;
    }
    return super(SPGFxUIViewSettingsMenuBase).SetupSettingsObject(Option);
    //return ReturnValue;    
}

function OnOptionChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], Data;
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private float StepperSelectedIndex, StepperPrevIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, ProfileSettings;

    Data = ListDataProvider.GetElementObject(ev.Index);
    SettingsListIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    // End:0x379
    if(mySettingsList[SettingsListIndex].OptionName == "MapFilter")
    {
        StepperSelectedIndex = Data.GetFloat("optIndex");
        StepperPrevIndex = Data.GetFloat("prevOptIndex");
        // End:0x377
        if(StepperSelectedIndex != StepperPrevIndex)
        {
            Data.SetFloat("prevOptIndex", StepperSelectedIndex);
            ListDataProvider.SetElementObject(ev.Index, Data);
            ListMC.SetObject("dataProvider", ListDataProvider);
            // End:0x227
            if(bSoundEvents)
            {
                Outer.PlaySoundFromTheme(OptionChangedSoundEventName);
            }
            LPPC = LPPlayerController(Outer.GetPC());
            // End:0x299
            if(LPPC != none)
            {
                ProfileSettings = LPProfileSettings(LPPC.ProfileSettings);
            }
            Class'LPMultiplayerManager'.static.GetInstance().DLCIdFilter = DLCFilters[int(StepperSelectedIndex)].DLCId;
            ProfileSettings.SetMapPackFilterID(DLCFilters[int(StepperSelectedIndex)].DLCId);
            // End:0x36D
            if(MoviePlayer != none)
            {
                MoviePlayer.bSaveProfile = true;
            }
            UpdateDescription();
        }
        return;
    }
    super(SPGFxUIViewSettingsMenuBase).OnOptionChanged(ev);
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    // End:0x48
    if(ListMC != none)
    {
        LPFrontEndMoviePlayer.SetResumeRenderingFrameDelay(2);
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x31
            break;
            break;
    }
    // End:0x70
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(LPFrontEndMoviePlayer.bRenderingSuspended)
    {
        return true;
    }
    // End:0x35
    if(!bIsTopView)
    {
        return true;
    }
    // End:0x62
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x109
    if((((((ButtonName == 'XBoxTypeS_LeftStick_Left') || ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XBoxTypeS_RightStick_Left') || ButtonName == 'Gamepad_RightStick_Left') || ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'Left')
    {
        // End:0x106
        if(ShouldAbsorbLeftRightInput(true))
        {
            return true;
        }        
    }
    else
    {
        // End:0x1AD
        if((((((ButtonName == 'XBoxTypeS_LeftStick_Right') || ButtonName == 'Gamepad_LeftStick_Right') || ButtonName == 'XBoxTypeS_RightStick_Right') || ButtonName == 'Gamepad_RightStick_Right') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'Right')
        {
            // End:0x1AD
            if(ShouldAbsorbLeftRightInput(false))
            {
                return true;
            }
        }
    }
    // End:0x1C6
    if(ButtonName == 'Tab')
    {
        return true;
    }
    // End:0x1FD
    if(ButtonName == 'XboxTypeS_B')
    {
        // End:0x1FB
        if(int(InputEvent) == int(0))
        {
            Select_BackImpl();
        }
        return true;
    }
    // End:0x24D
    if((ButtonName == 'XboxTypeS_X') || ButtonName == 'One')
    {
        // End:0x24B
        if(int(InputEvent) == int(0))
        {
            Select_Metagame();
        }
        return true;
    }
    // End:0x2ED
    if(!bLANLobby)
    {
        // End:0x2ED
        if((ButtonName == 'XboxTypeS_Back') || ButtonName == 'BackSpace')
        {
            // End:0x2EB
            if((int(InputEvent) == int(0)) && int(Outer.GetPC().Role) == int(ROLE_Authority))
            {
                AccessFilterDialog();
            }
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function DisplayContentActive()
{
    // End:0x0F
    if(bLANLobby)
    {
        return;
    }
    // End:0xAA
    if((LPFrontEndMoviePlayer != none) && LPFrontEndMoviePlayer.DisplayContent == none)
    {
        LPFrontEndMoviePlayer.DisplayContent = Outer.GetVariableObject("_root.displaySecondary.displayContent");
    }
    // End:0x10D
    if(LPFrontEndMoviePlayer.DisplayContent != none)
    {
        LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("partyList");
    }
    //return;    
}

function PartyListInit()
{
    // End:0x1A
    if(bLANLobby)
    {
        ShowPartyMenu(false);
        return;
    }
    BuildCurrentView();
    SetPartyFilterText(GetAccessFilterLobbyHeader());
    SetPartyHeaderText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.PartyLobbyHeader>"));
    bMessagesWaiting = false;
    ShowHideMailboxIndicator(bMessagesWaiting);
    Outer.GetPC().SetTimer(0.1000000, true, 'Tick', self);
    //return;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];

    // End:0x68
    if(ListMC != none)
    {
        SetViewFocus(!bDisableComponents);
        // End:0x65
        if(bDisableComponents && !Class'Engine.WorldInfo'.static.IsConsoleBuild(0))
        {
            DisableAllItemRenderers(true);
        }        
    }
    else
    {
        super.DisableSubComponents(bDisableComponents);
    }
    //return;    
}

function SetViewFocus()
{
    local /*0x97E50000-0x00000000*/ private bool bFocus[8388609];

    // End:0x40
    if(bFocus && !Class'Engine.WorldInfo'.static.IsConsoleBuild(0))
    {
        DisableAllItemRenderers(false);
    }
    super(SPGFxUIViewSettingsMenuBase).SetViewFocus(bFocus);
    //return;    
}

function ShowPartyMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    MoviePlayer.ActionScriptVoid("showPartyMenu");
    //return;    
}

function SetNumPartyMembers()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    MoviePlayer.ActionScriptVoid("setNumPartyMembers");
    //return;    
}

function SetPartyMemberData()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x97E50000-0x00000000*/ private int iMetagamePercent[8388609], iPlayersPingQuality;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayersVoiceStatus[8388609];

    MoviePlayer.ActionScriptVoid("setPlayerData");
    //return;    
}

function ForcePartyUpdate()
{
    MoviePlayer.ActionScriptVoid("forcePartyUpdate");
    //return;    
}

function SetPartyHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg[8388609];

    MoviePlayer.ActionScriptVoid("SetPartyHeaderText");
    //return;    
}

function SetPartyFilterText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg[8388609];

    MoviePlayer.ActionScriptVoid("SetPartyFilterText");
    //return;    
}

function ShowHideMailboxIndicator()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    MoviePlayer.ActionScriptVoid("ShowHideMailboxIndicator");
    //return;    
}

function UnrealLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg[8388609];

    //return;    
}

static function GetVoiceStatusFromEnum()
{
    local /*0x97E50000-0x00000000*/ private byte VS[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    switch(VS)
    {
        // End:0x22
        case 0:
            return "enabled";
        // End:0x32
        case 1:
            return "disabled";
        // End:0x40
        case 2:
            return "active";
        // End:0x4D
        case 3:
            return "muted";
        // End:0xFFFF
        default:
            return "disabled";
            break;
    }
    //return ReturnValue;    
}

function BuildResponseDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Title[8388609], Body;
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x31F
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(1);
        ConfirmMC.SetTitle(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode." $ Title) $ ">");
        // End:0x19A
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode." $ Body) $ "PS3>");            
        }
        else
        {
            // End:0x227
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode." $ Body) $ "XBOX>");                
            }
            else
            {
                ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode." $ Body) $ ">");
            }
        }
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_OK>");
        ConfirmMC.SetButtonOnPress(0, cbResponseDialogOK);
    }
    //return;    
}

function cbResponseDialogOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}
