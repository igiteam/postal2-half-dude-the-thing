class LPGFxFrontEnd_PreGameLobby extends SPGFxUIView within GFxMoviePlayer
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

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckForMatchSummary;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchSummaryNeedsShowing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchSummaryAvailable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSubMenusDisabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMessageVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobbyMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobbyGRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobbyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FocusedObject;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobbyPartyMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobbySettingsMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobbyLoadoutMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabOneListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabTwoListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabThreeListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MessageText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int frameCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string FocusedPanel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SummaryLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SelectLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InviteLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ViewLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ViewLabel2;

function SetFocusedObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL Object[8388609];

    // End:0x11
    if(!bIsTopView)
    {
        return;
    }
    // End:0x3F
    if(FocusedObject != none)
    {
        FocusedObject.OnRemoveFocus();
    }
    FocusedObject = Object;
    FocusedObject.OnReceiveFocus();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MPMgr, dummyButton;

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
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x32A
    if(!bIsInitialized)
    {
        dummyButton = GetObject("dummyButton");
        MenuViewLoader.SetSelectionFocus(dummyButton);
        bCheckForMatchSummary = true;
        LobbyMoviePlayer = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
        UpdateReplicationInfo();
        // End:0x28D
        if((MPMgr.OnlineSub != none) && NotEqual_InterfaceInterface(MPMgr.OnlineSub.SystemInterface, OnlineSystemInterface(none)))
        {
            MPMgr.OnlineSub.SystemInterface.AddConnectionStatusChangeDelegate(OnConnectionStatusChange);
            MPMgr.OnlineSub.SystemInterface.AddLinkStatusChangeDelegate(OnLinkStatusChange);
        }
        LPPC = LPPlayerController(Outer.GetPC());
        // End:0x327
        if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Client))
        {
            LPPC.SetTimer(5.0000000, false, 'CheckReplicationInfo', self);
        }        
    }
    else
    {
        // End:0x36D
        if(FocusedPanel == "rightPanel")
        {
            LobbyPartyMC.RefreshSelectedPlayer();
            UpdateStatus();
        }
    }
    LobbyMoviePlayer.SetExternalInterface(self);
    LobbyMoviePlayer.ASShowCursor(true);
    LobbyMoviePlayer.ShowBackground(false);
    ShowBackground(true);
    //return;    
}

function CheckReplicationInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x22
    if((LobbyPRI != none) && LobbyGRI != none)
    {
        return;
    }
    PC = SPPlayerController(Outer.GetPC());
    PC.ClientStopMovie(0.0000000, false, true, true);
    Class'LPMultiplayerManager'.static.GetInstance().FinishJoinTravel();
    //return;    
}

function UpdateReplicationInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x234
    if(!bIsInitialized)
    {
        MoviePlayer.CachedPlayerController = none;
        PC = LPPreGameLobbyPC(MoviePlayer.GetPC());
        // End:0x72
        if(PC == none)
        {
            return;
        }
        // End:0x184
        if(LobbyGRI == none)
        {
            LobbyGRI = LPPreGameLobbyGRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
            // End:0x184
            if(LobbyGRI != none)
            {
                LobbyGRI.OnCountdownTick.AddItem(OnCountdownTick);                
                LobbyGRI.OnLobbyStateChanged.AddItem(OnLobbyStateChanged);                
                OnLobbyStateChanged(LobbyGRI.CurrentState, LobbyGRI.PreviousState);
            }
        }
        // End:0x1C4
        if(LobbyPRI == none)
        {
            LobbyPRI = LPPreGameLobbyPRI(PC.PlayerReplicationInfo);
        }
        // End:0x225
        if(((LobbyGRI != none) && LobbyPRI != none) && int(LobbyGRI.LobbyMode) != int(0))
        {
            bIsInitialized = true;
            InitSubObjects();
        }
        // End:0x234
        if(!bIsInitialized)
        {
        }
    }
    //return;    
}

function setDisclaimerText()
{
    local /*0x97E50000-0x00000000*/ private @NULL disclaimerText[8388609];

    // End:0xEB
    if(disclaimerText != none)
    {
        // End:0xC1
        if(Class'LPGameViewportClient'.static.IsTGSDemo())
        {
            disclaimerText.SetBool("_visible", true);
            disclaimerText.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.TGSDemoDisclaimerText>"));            
        }
        else
        {
            disclaimerText.SetBool("_visible", false);
        }
    }
    //return;    
}

function OnViewUnloaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    // End:0x59
    if(LobbyPartyMC != none)
    {
        LobbyPartyMC.Cleanup();
        LobbyPartyMC.MoviePlayer = none;
        LobbyPartyMC = none;
    }
    // End:0xB2
    if(LobbySettingsMC != none)
    {
        LobbySettingsMC.Cleanup();
        LobbySettingsMC.MoviePlayer = none;
        LobbySettingsMC = none;
    }
    // End:0xEC
    if(LobbyLoadoutMC != none)
    {
        LobbyLoadoutMC.MoviePlayer = none;
        LobbyLoadoutMC = none;
    }
    // End:0x161
    if(LobbyGRI != none)
    {
        LobbyGRI.OnCountdownTick.RemoveItem(OnCountdownTick);        
        LobbyGRI.OnLobbyStateChanged.RemoveItem(OnLobbyStateChanged);        
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x2B0
    if((MPMgr.OnlineSub != none) && NotEqual_InterfaceInterface(MPMgr.OnlineSub.SystemInterface, OnlineSystemInterface(none)))
    {
        MPMgr.OnlineSub.SystemInterface.ClearConnectionStatusChangeDelegate(OnConnectionStatusChange);
        MPMgr.OnlineSub.SystemInterface.ClearLinkStatusChangeDelegate(OnLinkStatusChange);
    }
    super.OnViewUnloaded();
    //return;    
}

function NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    RefreshButtonPrompts();
    //return;    
}

function RefreshButtonPrompts()
{
    local /*0x97E50000-0x00000000*/ private bool bIsHost;

    // End:0x2E
    if(LobbySettingsMC != none)
    {
        LobbySettingsMC.RefreshButtonPrompts();
    }
    // End:0xA1
    if(StartLabel != none)
    {
        StartLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Start>"));
    }
    // End:0x11B
    if(SummaryLabel != none)
    {
        SummaryLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.MatchSummary>"));
    }
    // End:0x17E
    if(SelectLabel != none)
    {
        SelectLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
    }
    // End:0x240
    if(InviteLabel != none)
    {
        // End:0x1D6
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            InviteLabel.SetText("");            
        }
        else
        {
            InviteLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.FriendsList>"));
        }
    }
    // End:0x2B0
    if(LeftLabel != none)
    {
        LeftLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.LB>"));
    }
    // End:0x320
    if(RightLabel != none)
    {
        RightLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.RB>"));
    }
    // End:0x4AD
    if(ViewLabel != none)
    {
        // End:0x48B
        if(!Class'LPGameViewportClient'.static.IsTGSDemo())
        {
            bIsHost = int(Outer.GetPC().Role) == int(ROLE_Authority);
            // End:0x418
            if(bIsHost)
            {
                ViewLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.TogglePartyHost>"));                
            }
            else
            {
                ViewLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.TogglePartyClient>"));
            }            
        }
        else
        {
            ViewLabel.SetText("");
        }
    }
    // End:0x5F3
    if(ViewLabel2 != none)
    {
        bIsHost = int(Outer.GetPC().Role) == int(ROLE_Authority);
        // End:0x582
        if(bIsHost)
        {
            ViewLabel2.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ViewSettingsHost>"));            
        }
        else
        {
            ViewLabel2.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ViewSettingsClient>"));
        }
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Parent;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ParentName;
    local /*0x97E50000-0x00000000*/ private bool bResult, bIsHost;

    // End:0x8A
    if(WidgetName == 'panelLeft')
    {
        LobbySettingsMC = LPGFxPreGameLobbySettings(Widget);
        LobbySettingsMC.MoviePlayer = MoviePlayer;
        LobbySettingsMC.RootMC = self;
        bResult = true;        
    }
    else
    {
        // End:0x114
        if(WidgetName == 'panelRight')
        {
            LobbyPartyMC = LPGFxPreGameLobbyParty(Widget);
            LobbyPartyMC.MoviePlayer = MoviePlayer;
            LobbyPartyMC.RootMC = self;
            bResult = true;            
        }
        else
        {
            // End:0x229
            if(WidgetName == 'Sl')
            {
                Parent = Widget.GetObject("_parent");
                // End:0x226
                if(Parent != none)
                {
                    ParentName = Parent.GetString("_name");
                    // End:0x1E3
                    if(ParentName == "tab0Content")
                    {
                        TabOneListMC = GFxClikWidget(Widget);
                        bResult = true;                        
                    }
                    else
                    {
                        // End:0x226
                        if(ParentName == "tab1Content")
                        {
                            TabTwoListMC = GFxClikWidget(Widget);
                            bResult = true;
                        }
                    }
                }                
            }
            else
            {
                // End:0x2DB
                if(WidgetName == 'View')
                {
                    LobbyLoadoutMC = LPGFxLoadoutKitSelector(Widget);
                    LobbyLoadoutMC.MoviePlayer = MoviePlayer;
                    LobbyLoadoutMC.Init(self);
                    LobbySettingsMC.LoadoutMC = LobbyLoadoutMC;
                    bResult = true;                    
                }
                else
                {
                    // End:0x322
                    if(WidgetName == 'view1')
                    {
                        LobbyLoadoutMC.SelectKit(2);
                        bResult = true;                        
                    }
                    else
                    {
                        // End:0x369
                        if(WidgetName == 'view2')
                        {
                            LobbyLoadoutMC.SelectKit(3);
                            bResult = true;                            
                        }
                        else
                        {
                            // End:0x3B0
                            if(WidgetName == 'view3')
                            {
                                LobbyLoadoutMC.SelectKit(4);
                                bResult = true;                                
                            }
                            else
                            {
                                // End:0x3FB
                                if(WidgetName == 'view4')
                                {
                                    LobbyLoadoutMC.SetSelectedKit(-1, false);
                                    bResult = true;                                    
                                }
                                else
                                {
                                    // End:0x4C4
                                    if(WidgetName == 'StartLabel')
                                    {
                                        bIsHost = int(Outer.GetPC().Role) == int(ROLE_Authority);
                                        StartLabel = Widget;
                                        RefreshButtonPrompts();
                                        ASShowStartMatchButton(bIsHost && int(LobbyGRI.LobbyMode) != int(2));
                                        bResult = true;                                        
                                    }
                                    else
                                    {
                                        // End:0x507
                                        if(WidgetName == 'SummaryLabel')
                                        {
                                            SummaryLabel = Widget;
                                            RefreshButtonPrompts();
                                            bResult = true;                                            
                                        }
                                        else
                                        {
                                            // End:0x54A
                                            if(WidgetName == 'SelectLabel')
                                            {
                                                SelectLabel = Widget;
                                                RefreshButtonPrompts();
                                                bResult = true;                                                
                                            }
                                            else
                                            {
                                                // End:0x58D
                                                if(WidgetName == 'LeftLabel')
                                                {
                                                    LeftLabel = Widget;
                                                    RefreshButtonPrompts();
                                                    bResult = true;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x5D0
                                                    if(WidgetName == 'RightLabel')
                                                    {
                                                        RightLabel = Widget;
                                                        RefreshButtonPrompts();
                                                        bResult = true;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x613
                                                        if(WidgetName == 'InviteLabel')
                                                        {
                                                            InviteLabel = Widget;
                                                            RefreshButtonPrompts();
                                                            bResult = true;                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x656
                                                            if(WidgetName == 'ViewLabel')
                                                            {
                                                                ViewLabel = Widget;
                                                                RefreshButtonPrompts();
                                                                bResult = true;                                                                
                                                            }
                                                            else
                                                            {
                                                                // End:0x696
                                                                if(WidgetName == 'ViewLabel2')
                                                                {
                                                                    ViewLabel2 = Widget;
                                                                    RefreshButtonPrompts();
                                                                    bResult = true;
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
        }
    }
    InitSubObjects();
    return bResult;
    //return ReturnValue;    
}

function InitSubObjects()
{
    // End:0x2D4
    if(bIsInitialized && !bIsVisible)
    {
        // End:0x13E
        if((((LobbySettingsMC != none) && !LobbySettingsMC.bIsInitialized) && TabOneListMC != none) && TabTwoListMC != none)
        {
            LobbySettingsMC.TabOneListMC = TabOneListMC;
            LobbySettingsMC.TabTwoListMC = TabTwoListMC;
            LobbySettingsMC.TabThreeListMC = TabThreeListMC;
            LobbySettingsMC.RootMC = self;
            LobbySettingsMC.Init(LobbyGRI, LobbyPRI);
        }
        // End:0x1C4
        if((LobbyPartyMC != none) && !LobbyPartyMC.bIsInitialized)
        {
            LobbyPartyMC.RootMC = self;
            LobbyPartyMC.Init(LobbyGRI, LobbyPRI);
        }
        // End:0x2D4
        if((((LobbyPartyMC != none) && LobbyPartyMC.bIsInitialized) && LobbySettingsMC != none) && LobbySettingsMC.bIsInitialized)
        {
            bIsVisible = true;
            SetFocusedObject(LobbySettingsMC);
            SPPlayerController(Outer.GetPC()).ClientStopMovie(0.0000000, false, true, true);
            UpdateStatus();
            CheckMatchSummary();
            // End:0x2D4
            if(!bMatchSummaryNeedsShowing)
            {
                LobbyMoviePlayer.ResumeRendering();
            }
        }
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, Game;

    // End:0x2D
    if(LPGFxMoviePlayerFrontEndManager(MoviePlayer).bRenderingSuspended)
    {
        return true;
    }
    // End:0x5A
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    Retval = false;
    // End:0xB6
    if(ButtonName == 'XboxTypeS_RightTrigger')
    {
        // End:0xA7
        if(int(InputEvent) == int(0))
        {
            ASSetFocusedPanel("rightPanel");
        }
        Retval = true;        
    }
    else
    {
        // End:0x102
        if(ButtonName == 'XboxTypeS_LeftTrigger')
        {
            // End:0xF6
            if(int(InputEvent) == int(0))
            {
                ASSetFocusedPanel("leftPanel");
            }
            Retval = true;
        }
    }
    // End:0x167
    if(!Retval && FocusedObject != none)
    {
        Retval = FocusedObject.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    // End:0x3C6
    if(!Retval)
    {
        // End:0x1FB
        if((ButtonName == 'XboxTypeS_RightThumbStick') || ButtonName == 'Z')
        {
            // End:0x1EC
            if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(1) && int(InputEvent) == int(0))
            {
                ShowFriendsList();
            }
            Retval = true;            
        }
        else
        {
            // End:0x258
            if((ButtonName == 'XboxTypeS_Back') || ButtonName == 'BackSpace')
            {
                // End:0x249
                if(int(InputEvent) == int(0))
                {
                    ShowMatchSummary();
                }
                Retval = true;                
            }
            else
            {
                // End:0x2B5
                if((ButtonName == 'XboxTypeS_X') || ButtonName == 'One')
                {
                    // End:0x2A6
                    if(int(InputEvent) == int(0))
                    {
                        ShowMetagame();
                    }
                    Retval = true;                    
                }
                else
                {
                    // End:0x352
                    if((ButtonName == 'XboxTypeS_Y') || ButtonName == 'Two')
                    {
                        // End:0x343
                        if((int(LobbyPartyMC.MyGRI.LobbyMode) == int(1)) && int(InputEvent) == int(0))
                        {
                            HandleSwitchTeam();
                        }
                        Retval = true;                        
                    }
                    else
                    {
                        // End:0x3C6
                        if(ButtonName == 'SpaceBar')
                        {
                            // End:0x3BA
                            if(int(InputEvent) == int(0))
                            {
                                ASSetFocusedPanel(((FocusedPanel == "rightPanel") ? "leftPanel" : "rightPanel"));
                            }
                            Retval = true;
                        }
                    }
                }
            }
        }
    }
    // End:0x946
    if(!Retval)
    {
        // End:0x822
        if((ButtonName == 'XboxTypeS_Start') || ButtonName == 'S')
        {
            // End:0x506
            if((((int(LobbyGRI.LobbyMode) == int(2)) && int(InputEvent) == int(0)) && int(LobbyGRI.CurrentState) < int(3)) && Class'Engine.WorldInfo'.static.GetWorldInfo().Game.NumPlayers >= 2)
            {
                LobbyGRI.bHostPressedStart = true;
                LobbyGRI.SetLobbyState(3);
                return true;
            }
            // End:0x822
            if((int(LobbyGRI.LobbyMode) != int(2)) && int(InputEvent) == int(0))
            {
                // End:0x816
                if(int(LobbyGRI.CurrentState) == int(3))
                {
                    // End:0x816
                    if(int(LobbyGRI.Role) == int(ROLE_Authority))
                    {
                        LobbyGRI.UpdateOnlineGame();
                        Game = LPPreGameLobby(Class'Engine.WorldInfo'.static.GetWorldInfo().Game);
                        MPManager = Class'LPMultiplayerManager'.static.GetInstance();
                        // End:0x737
                        if(LobbyGRI.HasPRIsWithInvalidDLCs() || MPManager.CheckPlayersDLC(MPManager.GetGameSettings()))
                        {
                            // End:0x6EA
                            if((int(LobbyGRI.LobbyMode) == int(1)) && !Game.AreTeamsBalanced())
                            {
                                ShowBalancedStartPrompt();                                
                            }
                            else
                            {
                                Outer.PlaySoundFromTheme('MatchStart');
                                LobbyGRI.SetLobbyState(4);
                            }                            
                        }
                        else
                        {
                            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Msg>", "<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
                        }
                    }
                }
                Retval = true;
            }
        }
        // End:0x946
        if((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
        {
            // End:0x93A
            if(int(InputEvent) == int(0))
            {
                // End:0x89C
                if(int(LobbyGRI.CurrentState) < int(4))
                {
                    ShowExitConfirmation();                    
                }
                else
                {
                    // End:0x93A
                    if((int(LobbyGRI.CurrentState) == int(4)) && int(LobbyGRI.LobbyMode) != int(2))
                    {
                        Outer.PlaySoundFromTheme('MatchCancel');
                        LobbyGRI.SetLobbyState(3);
                    }
                }
            }
            Retval = true;
        }
    }
    return Retval;
    //return ReturnValue;    
}

function ShowBalancedStartPrompt()
{
    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('MenuDialog', self, false));
    // End:0x280
    if(ConfirmMC != none)
    {
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_PreGameLobby.BalanceTeamsOnStart_Title>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_PreGameLobby.BalanceTeamsOnStart_Message>");
        ConfirmMC.SetButtonLabel(0, "<Strings:SPGameUI.CalloutButtonText.No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:SPGameUI.CalloutButtonText.Yes>");
        ConfirmMC.SetButtonOnPress(0, cbBalancedStartNo);
        ConfirmMC.SetButtonOnPress(1, cbBalancedStartYes);
        ConfirmMC.SetDefaultFocusedButton(0);
    }
    //return;    
}

function cbBalancedStartYes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], Game;

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    Game = LPPreGameLobby(Class'Engine.WorldInfo'.static.GetWorldInfo().Game);
    Game.RebalanceTeams();
    Outer.PlaySoundFromTheme('MatchStart');
    LobbyGRI.SetLobbyState(4);
    //return;    
}

function cbBalancedStartNo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    Outer.PlaySoundFromTheme('MatchStart');
    LobbyGRI.SetLobbyState(4);
    //return;    
}

function ShowExitConfirmation()
{
    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('MenuDialog', self, false));
    // End:0x2B6
    if(ConfirmMC != none)
    {
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ExitConfirmTitle>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.ExitConfirmText>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmMC.SetButtonOnPress(0, ExitRejected);
        ConfirmMC.SetButtonOnPress(1, ExitConfirmed);
        ConfirmMC.SetDefaultFocusedButton(0);
        Outer.PlaySoundFromTheme(NavBackSoundEventName);
        ConfirmMC.ListItemPressSoundEventName = NavBackSoundEventName;
    }
    //return;    
}

function ExitConfirmed()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    MoveBackImpl();
    //return;    
}

function ExitRejected()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function MoveBackImpl()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x60
    if(FocusedObject != none)
    {
        FocusedObject.OnRemoveFocus();
    }
    LobbyPartyMC.Cleanup();
    LobbySettingsMC.Cleanup();
    GRI = LPPreGameLobbyGRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    GRI.OnCountdownTick.RemoveItem(OnCountdownTick);    
    GRI.OnLobbyStateChanged.RemoveItem(OnLobbyStateChanged);    
    // End:0x191
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        LPPC.ReturnToMainMenu();
        return;
    }
    LPPC.ReturnToLastMenu();
    //return;    
}

function OnCountdownTick()
{
    UpdateStatus();
    //return;    
}

function OnLobbyStateChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609], PrevState;
    local /*0x97E50000-0x00000000*/ private @NULL PC, WI;

    UpdateStatus();
    // End:0x181
    if(int(NewState) == int(5))
    {
        Class'LPUIDataStore_MatchSummary'.static.ResetMatchSummaryData();
        WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
        // End:0xD3
        foreach WI.AllControllers(Class'LPMenuGamePC', PC)
        {
            PC.GetStatManager().ResetStatsForPeriod(1);            
        }        
        PC = LPMenuGamePC(Outer.GetPC());
        PC.ClientShowLoadingMovie(true);
        PC.CloseFrontEnd();
        Class'Engine.WorldInfo'.static.GetWorldInfo().ForceGarbageCollection(true);
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private @NULL PregameLobby;

    frameCount++;
    // End:0x29
    if(frameCount >= 500)
    {
        frameCount = 0;
    }
    // End:0x45
    if(!bIsVisible)
    {
        UpdateReplicationInfo();        
    }
    else
    {
        LobbySettingsMC.Tick();
        LobbyPartyMC.Tick();
        UpdateMatchSummary();
    }
    // End:0x17E
    if((int(LobbyGRI.Role) == int(ROLE_Authority)) && int(LobbyGRI.LobbyMode) != int(2))
    {
        PregameLobby = LPPreGameLobby(Class'Engine.WorldInfo'.static.GetWorldInfo().Game);
        // End:0x17E
        if((PregameLobby != none) && !PregameLobby.AreTeamSizesValid())
        {
            PregameLobby.RebalanceTeams();
        }
    }
    //return;    
}

function UpdateStatus()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message;
    local /*0x97E50000-0x00000000*/ private bool bShowStart, bShowBack, bHost;

    bHost = int(LobbyGRI.Role) == int(ROLE_Authority);
    bShowStart = bHost && int(LobbyGRI.LobbyMode) != int(2);
    bShowBack = true;
    bSubMenusDisabled = false;
    ASSetBackTextOverride("");
    switch(LobbyGRI.CurrentState)
    {
        // End:0x1B5
        case 2:
            ShowLobbyMessage(false);
            Message = GetTranslation("<Strings:LostPlanetGame.PreGameLobbyMessages.WaitingForPlayers>");
            SetWaitingForPlayersText(Message);
            ShowWaitingForPlayersText(true);
            // End:0x1B2
            if(bHost && Class'Engine.WorldInfo'.static.GetWorldInfo().Game.NumPlayers >= 2)
            {
                bShowStart = true;
            }
            // End:0x558
            break;
        // End:0x294
        case 3:
            // End:0x26D
            if(int(LobbyGRI.LobbyMode) == int(2))
            {
                Message = GetTranslation("<Strings:LostPlanetGame.PreGameLobbyMessages.VoteCountdown>");
                ShowLobbyMessage(true, Message, LobbyGRI.RemCountdownSeconds);                
            }
            else
            {
                ShowLobbyMessage(false);
            }
            SetWaitingForPlayersText("");
            ShowWaitingForPlayersText(false);
            // End:0x558
            break;
        // End:0x4B5
        case 4:
            Message = GetTranslation("<Strings:LostPlanetGame.PreGameLobbyMessages.MatchCountdown>");
            ShowLobbyMessage(true, Message, LobbyGRI.RemCountdownSeconds);
            // End:0x3B9
            if(MenuViewLoader.ViewStack[MenuViewLoader.ViewStack.Length - 1] == ConfirmMC)
            {
                MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
                ConfirmMC = none;
            }
            SetWaitingForPlayersText("");
            ShowWaitingForPlayersText(false);
            // End:0x479
            if(bHost && int(LobbyGRI.LobbyMode) == int(1))
            {
                ASSetBackTextOverride(Class'LPGFxPreGameLobbyBase'.static.GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Stop>"));
                bShowStart = false;                
            }
            else
            {
                bShowBack = false;
            }
            bSubMenusDisabled = LobbyGRI.RemCountdownSeconds <= 3;
            // End:0x558
            break;
        // End:0x555
        case 5:
            bShowStart = false;
            bShowBack = false;
            ShowLobbyMessage(false);
            Message = GetTranslation("<Strings:LostPlanetGame.PreGameLobbyMessages.StartingMatch>");
            SetWaitingForPlayersText(Message);
            ShowWaitingForPlayersText(true);
            // End:0x558
            break;
        // End:0xFFFF
        default:
            break;
    }
    ASSetBackVisible(bShowBack);
    ASSetSubMenuPromptsVisible(!bSubMenusDisabled);
    ASShowMatchSummaryPrompt(!bSubMenusDisabled && bMatchSummaryAvailable);
    // End:0x5C8
    if(bHost)
    {
        ASShowStartMatchButton(bShowStart);
    }
    //return;    
}

function ShowLobbyMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[9437185];
    local /*0x97E50000-0x00000000*/ private int MessageVal[9437185];

    ""
    -1
    ASShowMatchStartingTimer(bShow);
    // End:0x65
    if(bShow)
    {
        ASSetMatchStartingText(Message);
        // End:0x65
        if(MessageVal >= 0)
        {
            ASSetMatchStartingTimer(MessageVal);
        }
    }
    // End:0xAF
    if(LobbySettingsMC != none)
    {
        LobbySettingsMC.ShowLobbyMessage(bShow, Message, MessageVal);
    }
    //return;    
}

function HandleSwitchTeam()
{
    // End:0x0F
    if(bSubMenusDisabled)
    {
        return;
    }
    MoviePlayer.PlaySoundFromTheme('SwitchTeam');
    Outer.GetPC().SwitchTeam();
    //return;    
}

function GetTranslation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609], Arg1, Arg2, Arg3, Arg4, ReturnValue,
	    Result;

    Result = TranslateString(Text);
    // End:0x5A
    if(Len(Arg1) > 0)
    {
        Result = Repl(Result, "<arg1>", Arg1);
    }
    // End:0x92
    if(Len(Arg2) > 0)
    {
        Result = Repl(Result, "<arg2>", Arg2);
    }
    // End:0xCA
    if(Len(Arg3) > 0)
    {
        Result = Repl(Result, "<arg3>", Arg3);
    }
    // End:0x102
    if(Len(Arg4) > 0)
    {
        Result = Repl(Result, "<arg4>", Arg4);
    }
    return Result;
    //return ReturnValue;    
}

function OnLinkStatusChange()
{
    local /*0x97E50000-0x00000000*/ private bool bIsConnected[8388609];

    // End:0x3D
    if(!bIsConnected)
    {
        // End:0x3D
        if(LobbyGRI != none)
        {
            LobbyGRI.StopCountdown();
        }
    }
    //return;    
}

function OnConnectionStatusChange()
{
    local /*0x97E50000-0x00000000*/ private byte ConnectionStatus[8388609];

    switch(ConnectionStatus)
    {
        // End:0x18
        case 2:
        // End:0x1D
        case 3:
        // End:0x22
        case 4:
        // End:0x27
        case 5:
        // End:0x5A
        case 6:
            // End:0x5A
            if(LobbyGRI != none)
            {
                LobbyGRI.StopCountdown();
            }
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

function ShowMatchSummary()
{
    // End:0x0F
    if(bSubMenusDisabled)
    {
        return;
    }
    // End:0x52
    if(bMatchSummaryAvailable)
    {
        MenuViewLoader.SpawnDialog('MatchSummary', self);
        bMatchSummaryNeedsShowing = false;
    }
    //return;    
}

function CheckMatchSummary()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreMatchSummary, DataStoreManager;

    // End:0x14E
    if(bCheckForMatchSummary)
    {
        bMatchSummaryAvailable = false;
        bMatchSummaryNeedsShowing = false;
        DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
        // End:0x124
        if(DataStoreManager != none)
        {
            DataStoreMatchSummary = LPUIDataStore_MatchSummary(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_MatchSummary'.default.Tag));
            bMatchSummaryAvailable = (DataStoreMatchSummary != none) && DataStoreMatchSummary.bMatchDataAvailable;
            bMatchSummaryNeedsShowing = (DataStoreMatchSummary != none) && DataStoreMatchSummary.bMatchDataNeedsShowing;
        }
        ASShowMatchSummaryPrompt(bMatchSummaryAvailable);
        bCheckForMatchSummary = false;
        UpdateMatchSummary();
    }
    //return;    
}

function UpdateMatchSummary()
{
    // End:0x47
    if(bMatchSummaryNeedsShowing && MenuViewLoader.GetViewWidgetByName('MatchSummary') != none)
    {
        ShowMatchSummary();
    }
    //return;    
}

function PlayerSelected()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], PlayerIndex;

    // End:0x40
    if(LobbyPartyMC != none)
    {
        LobbyPartyMC.PlayerSelected(TeamIndex, PlayerIndex);
    }
    //return;    
}

function OnKitClicked()
{
    local /*0x97E50000-0x00000000*/ private int ClickIndex[8388609];

    LobbyLoadoutMC.OnKitClicked(ClickIndex);
    //return;    
}

function ShowMetagame()
{
    // End:0x0F
    if(bSubMenusDisabled)
    {
        return;
    }
    ShowBackground(false);
    MetagameMC = LPGFxFrontEnd_Metagame(MenuViewLoader.SpawnDialog('Metagame', self));
    //return;    
}

function ShowFriendsList()
{
    local /*0x97E50000-0x00000000*/ private @NULL FriendsLoader;

    // End:0x0F
    if(bSubMenusDisabled)
    {
        return;
    }
    FriendsLoader = LPGFxFrontEnd_MPFriendsLoader(MenuViewLoader.SpawnDialog('FriendsLoader', self));
    // End:0x99
    if(FriendsLoader != none)
    {
        Outer.GetPC().SetTimer(0.0300000, false, 'PushFriendsList', self);
    }
    //return;    
}

function PushFriendsList()
{
    MenuViewLoader.SpawnDialog('FriendsList', MenuViewLoader.ViewStack[MenuViewLoader.ViewStack.Length - 1]);
    //return;    
}

function ShowBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showBackground");
    //return;    
}

function ASSetPanelFocus()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string panel[8388609];

    //return;    
}

function ASShowMatchSummaryPrompt()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showMatchSummaryPrompt");
    //return;    
}

function setFocusedPanel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string panel[8388609];

    Outer.PlaySoundFromTheme('LobbyPanelFocus');
    // End:0x78
    if(panel == "rightPanel")
    {
        SetFocusedObject(LobbyPartyMC);
        LobbyPartyMC.RefreshSelectedPlayer();        
    }
    else
    {
        // End:0xC3
        if(panel == "leftPanel")
        {
            SetFocusedObject(LobbySettingsMC);
            LobbySettingsMC.RenderSettingsList();
        }
    }
    //return;    
}

function setLeftPanelFocusedTab()
{
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    // End:0x56
    if(LobbySettingsMC != none)
    {
        LobbySettingsMC.SetCurrentTabIdx(TabIndex);
        LobbySettingsMC.Render();
    }
    //return;    
}

function ASSwitchPanelFocus()
{
    // End:0x40
    if(!Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        ActionScriptVoid("switchPanelFocus");
    }
    //return;    
}

function ASSetFocusedPanel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NewFocusedPanel[8388609];

    // End:0x92
    if(!Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        // End:0x92
        if(FocusedPanel != NewFocusedPanel)
        {
            FocusedPanel = NewFocusedPanel;
            ActionScriptVoid("setFocusedPanel");
            Outer.PlaySoundFromTheme('LobbyPanelFocus');
        }
    }
    //return;    
}

function ASShowStartMatchButton()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showStartMatchButton");
    //return;    
}

function ASShowMatchStartingTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x50
    if(bShow != bMessageVisible)
    {
        ActionScriptVoid("showMatchStartingTimer");
        bMessageVisible = bShow;
    }
    // End:0x88
    if(MetagameMC != none)
    {
        MetagameMC.ShowMatchStartingTimer(bShow);
    }
    //return;    
}

function ASSetMatchStartingText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string StartText[8388609];

    // End:0x4A
    if(StartText != MessageText)
    {
        ActionScriptVoid("setMatchStartingText");
        MessageText = StartText;
    }
    // End:0x81
    if(MetagameMC != none)
    {
        MetagameMC.SetMatchStartingText(StartText);
    }
    //return;    
}

function ASSetMatchStartingTimer()
{
    local /*0x97E50000-0x00000000*/ private int Time[8388609];

    // End:0xCB
    if(Time != MessageValue)
    {
        ActionScriptVoid("setMatchStartingTimer");
        MessageValue = Time;
        // End:0xCB
        if((int(LobbyGRI.CurrentState) == int(4)) && Time <= LobbyGRI.CountdownStartSoundSeconds)
        {
            MoviePlayer.PlaySoundFromTheme('MatchCountdown');
        }
    }
    // End:0x102
    if(MetagameMC != none)
    {
        MetagameMC.SetMatchStartingTimer(Time);
    }
    //return;    
}

function ASSetBackVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("setBackLabelVisible");
    //return;    
}

function ASSetBackTextOverride()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setBackLabelOverrideText");
    //return;    
}

function ASSetSubMenuPromptsVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("setSubMenuPromptsVisible");
    //return;    
}

function SetWaitingForPlayersText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[8388609];

    ActionScriptVoid("setWaitingForPlayersText");
    //return;    
}

function ShowWaitingForPlayersText()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showWaitingForPlayersText");
    //return;    
}

function NotifyShowBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    LobbyMoviePlayer.NotifyShowBackground(bShown);
    //return;    
}

function NotifyShowBlackBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    LobbyMoviePlayer.NotifyShowBlackBackground(bShown);
    //return;    
}

function NotifyShowLobbyBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    //return;    
}

function NotifyBackgroundVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609], bPrimaryVisible, bSecondaryVisible, bProxyVisible, bBlackVisible;

    // End:0x63
    if(MetagameMC != none)
    {
        MetagameMC.NotifyBackgroundVisibility(bVisible, bPrimaryVisible, bSecondaryVisible, bProxyVisible, bBlackVisible);        
    }
    else
    {
        LobbyMoviePlayer.NotifyBackgroundVisibility(bVisible, bPrimaryVisible, bSecondaryVisible, bProxyVisible, bBlackVisible);
    }
    //return;    
}

defaultproperties
{
    frameCount=500
    OptionChangedSoundEventName="NetLobbyMenuSelect"
    ListItemPressSoundEventName="NetLobbyMenuConfirm"
    ListChangeSoundEventName="NetLobbyMenuSelect"
    NavBackSoundEventName="NetLobbyMenuBack"
    SubWidgetBindings=/* Array type was not detected. */
}