class LPGFxMoviePlayerFrontEndManager extends SPGFxMoviePlayerViewManager
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

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SessionName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DesiredLocalPlayerCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Title;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Description;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SecondaryDisplay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FocusViewLoaders;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FocusViewLoaderIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FocusViewLoaderSoundEventName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DisplayContent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControlsMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipTitleScreen[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInStartScreen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInGamespyLoginScreen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayLobbyMusic;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTitleScreenFadeInComplete;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldDeferFrontEndInvites;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowCheatMapList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMemoryCheckpointExists;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckpointSlot0Exists;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckpointSlot1Exists;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckpointSlot2Exists;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRenderingSuspended;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowMultiplayerControlConfig;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSaveWarningLoaded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSaveWarningShown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldDisplayBootupSequence;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialMainMenuBootUpDone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldDisableDLCAutoRefresh;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInstallingDLC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableDLCUpdateChecking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceDLCUpdate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceDLCUpdateAfterRenderingDelay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BestiarySceneCaptureTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie_MunitionsLocker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_MunitionsLocker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ActiveController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MainMenuMusic;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPLobbyMusic;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankDeployableTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankPassiveTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DefaultViewName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LoadedInfoArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CheckpointEnumerationViewSubscribers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ResumeRenderingFrameDelay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotifyDeviceSelectCompleteOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ButtonIconStrings;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DLCInstallMessageBox;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __NotifyDeviceSelectCompleteDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CheckpointTimeCompare__Delegate;

function SetRegionalTrademark()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Region, trademarkType;

    Region = Class'SPEngine.SPUtil'.static.GetRegionExt();
    trademarkType = "TM";
    // End:0x7E
    if(((Region == "NA") || Region == "JP") || Region == "AS")
    {
        trademarkType = "R";
    }
    ASSetTrademarkType(trademarkType);
    //return;    
}

function ASSetTrademarkType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string trademarkType[8388609];

    ActionScriptVoid("SetTrademarkType");
    //return;    
}

function @NULL Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;
    local /*0x97E50000-0x00000400*/ private @NULL AkC, WI, MPMgr, LPPC, DLCManager;

    false
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    LPPC = LPPlayerController(GetPC());
    // End:0x9C
    if(MPMgr.__PendingTravelFunc__Delegate != none)
    {
        // End:0x9C
        if(MPMgr.PendingTravelFunc())
        {
            return true;
        }
    }
    super.Start();
    Advance(0.0000000);
    SetRegionalTrademark();
    // End:0xD9
    if(!bInitialized)
    {
        ConfigFrontEnd();
    }
    ViewLoader.ViewLoaderID = "primary";
    FocusViewLoaders.AddItem(ViewLoader);    
    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    bIsMP = int(WI.NetMode) != int(NM_Standalone);
    SessionName = GetSessionName();
    // End:0x1DB
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1) || Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        ASShowCursor(false);
    }
    SetImageSubstitutions();
    SetSecondaryDisplayMPMode(false);
    SetStartText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.StartMenuPC>"));
    SetStartButtonVisible(false);
    bIsInStartScreen = true;
    bShouldDeferFrontEndInvites = true;
    bIsInGamespyLoginScreen = false;
    // End:0x2D3
    if(bPlayLobbyMusic)
    {
        AkC = Class'AkAudio.AkComponent'.static.CreateAkComponent(MPLobbyMusic, LPPC,, true, true);
        AkC.bAutoDestroy = true;        
    }
    else
    {
        AkC = Class'AkAudio.AkComponent'.static.CreateAkComponent(MainMenuMusic, LPPC,, true, true);
        AkC.bAutoDestroy = true;
    }
    // End:0x34E
    if(ShouldSkipTitleScreen())
    {
        SkipTitleScreen();        
    }
    else
    {
        ResumeRendering(true);
    }
    LPPC.ClientStopMovie(0.0000000, false, true, true);
    // End:0x466
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        // End:0x466
        if(RootMC != none)
        {
            RootMC.SetBool("bShouldDisplayDemoDisclaimer", true);
            RootMC.SetString("DemoDisclaimerText", GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.TGSDemoDisclaimerText>"));
        }
    }
    LPPC.AddGamepadUpdateMoviePlayerSubscriber(self);
    // End:0x4F5
    if(bShouldDisableDLCAutoRefresh)
    {
        DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
        // End:0x4F5
        if(DLCManager != none)
        {
            DLCManager.bAutoRefreshDisabled = true;
        }
    }
    return true;
    //return ReturnValue;    
}

event NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];
    local /*0x97E50000-0x00000000*/ private int I, J;

    I = 0;
    J0x0B:

    // End:0x131 [Loop If]
    if(I < FocusViewLoaders.Length)
    {
        J = 0;
        J0x2E:

        // End:0x123 [Loop If]
        if(J < FocusViewLoaders[I].ViewData.Length)
        {
            // End:0x115
            if(FocusViewLoaders[I].ViewData[J].ViewWidget != none)
            {
                FocusViewLoaders[I].ViewData[J].ViewWidget.NotifyUsingGamepad(bGamepad);
            }
            J++;
            // [Loop Continue]
            goto J0x2E;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    RefreshButtonIcons();
    //return;    
}

function ShouldSkipTitleScreen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bSkipTitleScreen)
    {
        return true;
    }
    return Class'LPUIDataStore_FrontEnd'.static.ShouldSkipTitleScreen();
    //return ReturnValue;    
}

function SkipTitleScreen()
{
    bIsInStartScreen = false;
    bIsInGamespyLoginScreen = false;
    ActionScriptVoid("SkipIntro");
    Class'LPUIDataStore_FrontEnd'.static.SetSkipTitleScreen(false);
    ActiveController = GetLP().ControllerId;
    SuspendRendering();
    //return;    
}

function FloatingAimInit()
{
    local /*0x97E50000-0x00000000*/ private @NULL FloatingAimMC;

    FloatingAimMC = GetVariableObject("_root.displaySecondary.displayContent.floatingAim.aimBoundary");
    ControlsMenu.FloatingAimInit(FloatingAimMC);
    //return;    
}

function ConfigFrontEnd()
{
    RootMC = GetVariableObject("_root");
    ManagerMC = RootMC.GetObject("displayPrimary");
    // End:0xF2
    if((RootMC != none) && ManagerMC != none)
    {
        bInitialized = true;
        ViewLoader.SetRootMC(RootMC);
        ViewLoader.SetManagerMC(ManagerMC);
        ViewLoader.LoadViews();
    }
    SetSecondaryDisplayMPMode(false);
    //return;    
}

function SuspendRendering()
{
    local /*0x97E50000-0x00000000*/ private bool bBlackScreen[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    true
    // End:0x1F
    if(ResumeRenderingFrameDelay > 0)
    {
        ResumeRenderingFrameDelay = 0;
    }
    // End:0x31
    if(bRenderingSuspended == true)
    {
        return;
    }
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0xA9
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

function SetResumeRenderingFrameDelay()
{
    local /*0x97E50000-0x00000000*/ private int Frames[8388609];

    ResumeRenderingFrameDelay = Frames;
    //return;    
}

function ConditionalShowLoginUI()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdvanceTitleScreen[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CLIArgs, UserName, Password;
    local /*0x97E50000-0x00000000*/ private bool bAdvanceTitleScreenDeferred;

    false
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x477
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(ControllerId));
        // End:0x2B3
        if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(0))
        {
            CLIArgs = Class'Engine.SPObject'.static.AppCmdLine();
            UserName = Class'Engine.SPObject'.static.ParseCmdLineOption(CLIArgs, "-Login=");
            Password = Class'Engine.SPObject'.static.ParseCmdLineOption(CLIArgs, "-Password=");
            // End:0x287
            if((((int(GetPC().Role) == int(ROLE_Authority)) && (int(LoginStatus) == int(1)) || int(LoginStatus) == int(0)) && Len(UserName) > 0) && Len(Password) > 0)
            {
                // End:0x284
                if(!OnlineSub.PlayerInterface.Login(byte(ControllerId), UserName, Password, false))
                {
                    // End:0x282
                    if(bAdvanceTitleScreen && !bAdvanceTitleScreenDeferred)
                    {
                        AdvanceTitleScreen();
                    }
                    return false;
                }                
            }
            else
            {
                // End:0x2B0
                if(int(LoginStatus) == int(2))
                {
                    NotifyLoginChange(byte(ControllerId));
                }
            }            
        }
        else
        {
            // End:0x304
            if(Class'LPGameViewportClient'.static.IsTGSDemo())
            {
                LPPlayerController(GetPC()).ClientShowLoadingMovie(true);
            }
            // End:0x423
            if((int(LoginStatus) == int(0)) && int(GetPC().Role) == int(ROLE_Authority))
            {
                // End:0x3E9
                if(bAdvanceTitleScreen)
                {
                    OnlineSub.PlayerInterface.AddLoginChangeDelegate(AdvanceTitleScreenAfterNotifyLoginChange);
                    OnlineSub.PlayerInterface.AddLoginCancelledDelegate(AdvanceTitleScreenAfterNotifyLoginCancelled);
                    bAdvanceTitleScreenDeferred = true;
                }
                OnlineSub.PlayerInterface.ShowLoginUI(false, false);                
            }
            else
            {
                // End:0x459
                if(int(LoginStatus) == int(2))
                {
                    NotifyLoginChange(byte(ControllerId));
                    SelectDevice();                    
                }
                else
                {
                    // End:0x477
                    if(int(LoginStatus) == int(1))
                    {
                        SelectDevice();
                    }
                }
            }
        }
    }
    // End:0x49F
    if(bAdvanceTitleScreen && !bAdvanceTitleScreenDeferred)
    {
        AdvanceTitleScreen();
    }
    return false;
    //return ReturnValue;    
}

function AdvanceTitleScreen()
{
    bIsInStartScreen = false;
    bIsInGamespyLoginScreen = false;
    //return;    
}

function AdvanceTitleScreenAfterNotifyLoginChange()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    ClearAdvanceTitleScreenDelegates();
    LP = LocalPlayer(GetPC().Player);
    // End:0x88
    if((LP != none) && LP.ControllerId == int(LocalUserNum))
    {
        SelectDevice();        
    }
    AdvanceTitleScreen();
    //return;    
}

function AdvanceTitleScreenAfterNotifyLoginCancelled()
{
    ClearAdvanceTitleScreenDelegates();
    SelectDevice();
    AdvanceTitleScreen();
    //return;    
}

function ClearAdvanceTitleScreenDelegates()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xFB
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.ClearLoginChangeDelegate(AdvanceTitleScreenAfterNotifyLoginChange);
        OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(AdvanceTitleScreenAfterNotifyLoginCancelled);
    }
    //return;    
}

function NotifyLoginChange()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x123
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(LocalUserNum);
        // End:0x123
        if(int(LoginStatus) == int(2))
        {
            // End:0x123
            if(OnlineSub.Patcher != none)
            {
                OnlineSub.Patcher.DownloadFiles();
            }
        }
    }
    //return;    
}

function NotifyLoginCancelled()
{
    //return;    
}

function SelectDevice()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId;
    local /*0x97E50000-0x00000000*/ private bool bIsXboxBuild;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, Engine;
    local /*0x97E50000-0x00000000*/ private bool bForceShowUI;

    bIsXboxBuild = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
    // End:0x1B7
    if(bIsXboxBuild)
    {
        ControllerId = ActiveController;
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x1B7
        if(OnlineSub != none)
        {
            // End:0x1B7
            if(int(OnlineSub.PlayerInterface.GetLoginStatus(byte(ControllerId))) != int(0))
            {
                Engine = SPEngine(Class'Engine.Engine'.static.GetEngine());
                // End:0x1AC
                if(!Engine.IsCurrentDeviceValid())
                {
                    bForceShowUI = Engine.GetCurrentDeviceID() != -1;
                    OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(byte(ControllerId), 2097152, false, bForceShowUI);
                    return;                    
                }
                else
                {
                    GetCheckpointEnumeration(true);
                }
            }
        }
    }
    //return;    
}

function ShowBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showBackground");
    //return;    
}

function SetStartButtonVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("SetStartButtonVisible");
    //return;    
}

function SetStartText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg[8388609];

    ActionScriptVoid("SetStartText");
    //return;    
}

function ShowBlackBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showBlackBackground");
    //return;    
}

function QueryBackgroundVisibility()
{
    ActionScriptVoid("queryBackgroundVisibility");
    //return;    
}

function NotifyShowBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    //return;    
}

function NotifyShowBlackBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    //return;    
}

function NotifyBackgroundVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bIsVisible[8388609], bPrimaryVisible, bSecondaryVisible, bProxyVisible, bBlackVisible;

    //return;    
}

function UpdateViewLayout()
{
    ActionScriptVoid("updateViewLayout");
    //return;    
}

function ASShowCursor()
{
    local /*0x97E50000-0x00000000*/ private bool bShowCursor[8388609];

    ActionScriptVoid("showCursor");
    //return;    
}

function setButtonIcon()
{
    local /*0x97E50000-0x00000000*/ private int iButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    ButtonIconStrings[iButtonIndex] = Label;
    Label = GetLocalizedString(Label);
    ASSetButtonIcon(iButtonIndex, Label);
    //return;    
}

function showButtonIcon()
{
    local /*0x97E50000-0x00000000*/ private int iButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ASShowButtonIcon(iButtonIndex, bShow);
    //return;    
}

function ASSetButtonIcon()
{
    local /*0x97E50000-0x00000000*/ private int iButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    ActionScriptVoid("setButtonIcon");
    //return;    
}

function ASShowButtonIcon()
{
    local /*0x97E50000-0x00000000*/ private int iButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showButtonIcon");
    //return;    
}

function RefreshButtonIcons()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x61 [Loop If]
    if(I < ButtonIconStrings.Length)
    {
        ASSetButtonIcon(I, GetLocalizedString(ButtonIconStrings[I]));
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function PostWidgetInit()
{
    //return;    
}

final function FEPostAdvance()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TopMostFocusedFrontEndScreen, DLCManager, UIManagerInstance, LPPC;

    // End:0x9C
    if((FocusViewLoaderIndex >= 0) && FocusViewLoaderIndex < FocusViewLoaders.Length)
    {
        TopMostFocusedFrontEndScreen = LPGFxFrontEnd_Screen(FocusViewLoaders[FocusViewLoaderIndex].GetTopMostview());
        // End:0x9C
        if(TopMostFocusedFrontEndScreen != none)
        {
            TopMostFocusedFrontEndScreen.FocusedTick(DeltaTime);
        }
    }
    // End:0x2E4
    if(bEnableDLCUpdateChecking)
    {
        DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
        // End:0x2E4
        if(DLCManager != none)
        {
            // End:0x2E4
            if(!bIsInstallingDLC && !DLCManager.bIsCheckingDLCForUpdates)
            {
                // End:0x2E4
                if((((DLCManager.bStorageDeviceChanged || DLCManager.bContentChanged) || DLCManager.bLoginChanged) || bForceDLCUpdateAfterRenderingDelay && !bRenderingSuspended || ResumeRenderingFrameDelay <= 1) || bForceDLCUpdate)
                {
                    LPPC = LPPlayerController(GetPC());
                    UIManagerInstance = Class'LPUIManager'.static.GetLPUIManager();
                    TopMostFocusedFrontEndScreen = LPGFxFrontEnd_Screen(FocusViewLoaders[FocusViewLoaderIndex].GetTopMostview());
                    // End:0x2E4
                    if(((((UIManagerInstance != none) && (UIManagerInstance.OpenMessageBoxes.Length == 0) || DLCInstallMessageBox != none) && LPPC != none) && !LPPC.bIsExternalUIOpen) && TopMostFocusedFrontEndScreen != none)
                    {
                        CheckForDLCUpdate();
                    }
                }
            }
        }
    }
    // End:0x327
    if(bRenderingSuspended && ResumeRenderingFrameDelay > 0)
    {
        ResumeRenderingFrameDelay--;
        // End:0x327
        if(ResumeRenderingFrameDelay <= 0)
        {
            ResumeRendering();
        }
    }
    // End:0x3B8
    if(bShouldDisplayBootupSequence)
    {
        // End:0x398
        if(ShouldShowSaveWarning())
        {
            // End:0x395
            if(bSaveWarningLoaded && !bSaveWarningShown)
            {
                ViewLoader.SpawnDialog('SaveWarning');
                bSaveWarningShown = true;
            }            
        }
        else
        {
            ConditionalShowLoginUI(ActiveController, true);
            bShouldDisplayBootupSequence = false;
        }
    }
    //return;    
}

function OnSaveWarningClosed()
{
    SetBootupSaveWarningShown(true);
    //return;    
}

function SetBootupSaveWarningShown()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PersistentGameDataStore;

    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x8A
    if(PersistentGameDataStore != none)
    {
        PersistentGameDataStore.bBootupSaveWarningShown = bShown;
    }
    //return;    
}

function ShouldShowSaveWarning()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function FrontEndBegin()
{
    // End:0x19
    if(!bInitialized)
    {
        ConfigFrontEnd();
    }
    //return;    
}

function HelpButtonsRevealed()
{
    setButtonIcon(0, "");
    setButtonIcon(1, "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>");
    setButtonIcon(2, "");
    setButtonIcon(3, "");
    setButtonIcon(4, "");
    setButtonIcon(5, "");
    //return;    
}

function SetOptionSelectButton()
{
    local /*0x97E50000-0x00000000*/ private bool bDisplay[8388609];

    // End:0x4B
    if(bDisplay)
    {
        setButtonIcon(1, "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>");        
    }
    else
    {
        setButtonIcon(1, "");
    }
    //return;    
}

function SetOptionBackButton()
{
    local /*0x97E50000-0x00000000*/ private bool bDisplay[8388609];

    // End:0x43
    if(bDisplay)
    {
        setButtonIcon(0, "<Strings:LostPlanetGame.UI.ButtonBack>");        
    }
    else
    {
        setButtonIcon(0, "");
    }
    //return;    
}

function SetOptionDefaultButton()
{
    local /*0x97E50000-0x00000000*/ private bool bDisplay[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[9437185];

    // End:0x22
    if(bDisplay == false)
    {
        setButtonIcon(3, "");        
    }
    else
    {
        // End:0x47
        if(Label != "")
        {
            setButtonIcon(3, Label);
        }
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = false;
    bResult = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    // End:0xB6
    if(bResult == true)
    {
        // End:0x90
        if(WidgetName == DefaultViewName)
        {
            ViewLoader.PushViewByName(DefaultViewName);            
        }
        else
        {
            // End:0xB3
            if(WidgetName == 'SaveWarning')
            {
                bSaveWarningLoaded = true;
            }
        }        
    }
    else
    {
        // End:0x10A
        if(SecondaryDisplay != none)
        {
            bResult = SecondaryDisplay.WidgetInitialized(WidgetName, WidgetPath, Widget);
        }
        // End:0x377
        if(bResult == false)
        {
            bResult = true;
            switch(WidgetName)
            {
                // End:0x253
                case 'displaySecondary':
                    SecondaryDisplay = LPGFx_FrontendSecondaryDisplay(Widget);
                    // End:0x250
                    if(SecondaryDisplay != none)
                    {
                        DisplayContent = SecondaryDisplay.GetObject("displayContent");
                        SetWidgetPathBinding(SecondaryDisplay, WidgetPath);
                        SecondaryDisplay.Init(self);
                        SecondaryDisplay.ViewLoader.ViewLoaderID = "secondary";
                        FocusViewLoaders.AddItem(SecondaryDisplay.ViewLoader);                        
                    }
                    // End:0x377
                    break;
                // End:0x2B0
                case 'StartButton':
                    Widget.SetText("<Strings:LostPlanetGame.FrontEnd.PressStart>");
                    // End:0x377
                    break;
                // End:0x303
                case 'SelectLabel':
                    Widget.SetText("<Strings:LostPlanetGame.UI.Select>");
                    // End:0x377
                    break;
                // End:0x312
                case 'ConfirmLabel':
                    // End:0x377
                    break;
                // End:0x321
                case 'BackLabel':
                    // End:0x377
                    break;
                // End:0x343
                case 'Title':
                    Title = Widget;
                    // End:0x377
                    break;
                // End:0x365
                case 'Description':
                    Description = Widget;
                    // End:0x377
                    break;
                // End:0xFFFF
                default:
                    bResult = false;
                    // End:0x377
                    break;
                    break;
            }
        }
    }
    return bResult;
    //return ReturnValue;    
}

function LaunchDemoGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MPManager, DataStoreGameSearch, OnlineSub;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;

    // End:0x31C
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x93
        if((OnlineSub == none) || EqualEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            return;
        }
        LoginStatus = DemoGetLoginStatus();
        // End:0x143
        if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild())
        {
            J0xE1:

            // End:0x143 [Loop If]
            if(int(LoginStatus) == int(0))
            {
                OnlineSub.PlayerInterface.ShowLoginUI(false, false);
                LoginStatus = DemoGetLoginStatus();
                // [Loop Continue]
                goto J0xE1;
            }
        }
        LPPC = LPPlayerController(GetPC());
        // End:0x1E4
        if((LPPreGameLobby(LPPC.WorldInfo.Game) != none) || int(LPPC.WorldInfo.NetMode) != int(NM_Standalone))
        {
            return;
        }
        LPPC.ClientShowLoadingMovie(true);
        MPManager = Class'LPMultiplayerManager'.static.GetInstance();
        DataStoreGameSearch = MPManager.GetDataStoreGameSearch();
        DataStoreGameSearch.SetCurrentByName('ScenarioLAN');
        MPManager.SetOnlineMode(2);
        MPManager.__OnFindOnlineGamesComplete__Delegate = DemoOnSearchComplete;
        // End:0x31A
        if(!MPManager.FindOnlineGames())
        {
            LPPC.ReturnToMainMenu();
        }
        return;
    }
    //return;    
}

function DemoGetLoginStatus()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LP;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    LPPC = LPPlayerController(GetPC());
    LP = LocalPlayer(LPPC.Player);
    OnlineSub = LPPC.OnlineSub;
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(LP.ControllerId));
    return LoginStatus;
    //return ReturnValue;    
}

function DemoOnSearchComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8519681];
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private int NumResults;
    local /*0x97E50000-0x00000000*/ private @NULL Result;
    local /*0x97E50000-0x00000000*/ private int BestGameToJoin, NextBestGameToJoin;
    local /*0x97E50000-0x00000000*/ private @NULL ResultSettings;

    BestGameToJoin = -1;
    NextBestGameToJoin = -1;
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnFindOnlineGamesComplete__Delegate = None;
    NumResults = Results.Length;
    // End:0xA6
    if(NumResults == 0)
    {
        DemoHost();
        return;
    }
    I = 0;
    J0xB2:

    // End:0x269 [Loop If]
    if(int(I) < NumResults)
    {
        Result = Results[int(I)];
        ResultSettings = LPOnlineGameSettings(Result.GameSettings);
        // End:0x12B
        if(ResultSettings == none)
        {            
        }
        else
        {
            // End:0x158
            if(int(ResultSettings.GetSessionType()) == int(2))
            {                
            }
            else
            {
                // End:0x185
                if(int(ResultSettings.GetInviteMode()) == int(3))
                {                    
                }
                else
                {
                    // End:0x1B2
                    if(int(ResultSettings.GetMatchState()) == int(3))
                    {                        
                    }
                    else
                    {
                        // End:0x1D9
                        if(ResultSettings.NumOpenPublicConnections == 0)
                        {                            
                        }
                        else
                        {
                            // End:0x201
                            if(ResultSettings.NumOpenPublicConnections > 10)
                            {                                
                            }
                            else
                            {
                                // End:0x243
                                if(int(ResultSettings.GetMatchState()) == int(1))
                                {
                                    NextBestGameToJoin = int(I);                                    
                                }
                                else
                                {
                                    BestGameToJoin = int(I);
                                    // [Explicit Break]
                                    goto J0x269;
                                }
                            }
                        }
                    }
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0xB2;
    }
    J0x269:

    // End:0x29C
    if((BestGameToJoin < 0) && NextBestGameToJoin >= 0)
    {
        BestGameToJoin = NextBestGameToJoin;
    }
    // End:0x2B7
    if(BestGameToJoin < 0)
    {
        DemoHost();
        return;
    }
    MPManager.__OnJoinRequestComplete__Delegate = DemoOnJoinRequestComplete;
    MPManager.JoinGame(Results[BestGameToJoin]);
    //return;    
}

function DemoOnJoinRequestComplete()
{
    local /*0x97E50000-0x00000000*/ private byte Result[8388609];

    Class'LPMultiplayerManager'.static.GetInstance().__OnJoinRequestComplete__Delegate = None;
    switch(Result)
    {
        // End:0x5E
        case 6:
        // End:0x66
        case 4:
            // End:0xA6
            break;
        // End:0x6B
        case 3:
        // End:0x70
        case 1:
        // End:0xA3
        case 7:
            LPPlayerController(GetPC()).ReturnToMainMenu();
            // End:0xA6
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function DemoHost()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, DataStoreGameSettings, MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    DataStoreGameSettings = MPManager.GetDataStoreGameSettings();
    DataStoreGameSettings.SetCurrentByName('DefaultLAN');
    GameSettings = LPOnlineGameSettings(DataStoreGameSettings.GetCurrentGameSettings());
    GameSettings.SetGameType(2);
    MPManager.__OnCreateGameComplete__Delegate = DemoOnCreateGameComplete;
    // End:0x14E
    if(!MPManager.HostGame())
    {
        LPPlayerController(GetPC()).ReturnToMainMenu();
    }
    //return;    
}

function DemoOnCreateGameComplete()
{
    local /*0x97E50000-0x00000000*/ private name Session[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnCreateGameComplete__Delegate = None;
    // End:0x95
    if(!bWasSuccessful)
    {
        LPPlayerController(GetPC()).ReturnToMainMenu();
        return;
    }
    GameSettings = LPOnlineGameSettings(MPManager.GameInterface.GetGameSettings(MPManager.SessionNameGame));
    // End:0x10C
    if(GameSettings == none)
    {
        return;
    }
    GameSettings.SetInviteMode(0);
    // End:0x15A
    if(!MPManager.UpdateGameSettings(GameSettings))
    {
    }
    //return;    
}

function TitleScreenFadeInComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    bTitleScreenFadeInComplete = true;
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xCA
    if(MPMgr != none)
    {
        // End:0xCA
        if(MPMgr.DeferredInviteInfo.bHasDeferredInvite)
        {
            // End:0xCA
            if(ActiveController == -1)
            {
                StartWithPlayer(MPMgr.DeferredInviteInfo.ControllerId);                
            }
        }
    }
    //return;    
}

function TitleScreenNotifyButtonPress()
{
    PlaySoundFromTheme('NewGame');
    //return;    
}

function TitleScreenComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    // End:0x11
    if(!bIsInStartScreen)
    {
        return;
    }
    // End:0x2B
    if(ActiveController < 0)
    {
        ActiveController = 0;
    }
    SuspendRendering();
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.OwningControllerIndex = ActiveController;
    MPManager.OwningNetId = MPManager.GetUniqueNetId(ActiveController);
    bShouldDisplayBootupSequence = true;
    MPManager.SetPlayerOnlineStatus(GetLP().ControllerId, 2);
    LaunchDemoGame();
    //return;    
}

delegate NotifyDeviceSelectCompleteDelegate()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function NotifyDeviceSelectComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, PC, MyEngine;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DeviceName;
    local /*0x97E50000-0x00000000*/ private int DeviceID;

    // End:0x2E
    if(NotifyDeviceSelectCompleteOverride != none)
    {
        NotifyDeviceSelectCompleteDelegate(bWasSuccessful);
        return;
    }
    PC = LPPlayerController(GetPC());
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x257
    if(bWasSuccessful)
    {
        // End:0x254
        if(PC != none)
        {
            MyEngine = SPEngine(PC.Player.Outer);
            // End:0x254
            if((MyEngine != none) && OnlineSub != none)
            {
                DeviceID = OnlineSub.PlayerInterfaceEx.GetDeviceSelectionResults(byte(LocalPlayer(PC.Player).ControllerId), DeviceName);
                PC.ProfileSettings.SetCurrentDeviceID(DeviceID);
                MyEngine.SetCurrentDeviceID(DeviceID);
                PC.OnlinePlayerData.StorageProvider.OnDeviceSelectionComplete(bWasSuccessful);
                PC.SaveProfile();
            }
        }        
    }
    else
    {
        // End:0x285
        if(!PC.IsAtTitleScreen())
        {
            ConfirmNoStorageDevice();
        }
        PC.OnlinePlayerData.StorageProvider.ReadData(OnlineSub.PlayerInterface, byte(PC.OnlinePlayerData.StorageProvider.PlayerControllerId), -1, PC.OnlinePlayerData.StorageProvider.Profile);
    }
    GetCheckpointEnumeration(true);
    //return;    
}

function ConfirmNoStorageDevice()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ButtonTitles;

    ButtonTitles.AddItem("<Strings:LostPlanetGame.PauseMenu.Yes>");    
    ButtonTitles.AddItem("<Strings:LostPlanetGame.PauseMenu.No>");    
    Class'LPUIManager'.static.ShowUIMessage('ConfirmNoStorage', "<Strings:LostPlanetGame.FrontEnd.ConfirmNoSaveTitle>", "<Strings:LostPlanetGame.FrontEnd.ConfirmNoSaveInfo>", ButtonTitles, ConfirmNoStorageOnOptionSelected);
    //return;    
}

function ConfirmNoStorageOnOptionSelected()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(SelectedButtonIndex == 0)
    {
        SelectDevice();
    }
    return true;
    //return ReturnValue;    
}

function DestroyAllLocalPlayersExceptDefault()
{
    local /*0x97E50000-0x00000000*/ private @NULL GVP;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LP, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    GVP = GetGameViewportClient();
    I = 0;
    J0x48:

    // End:0x13B [Loop If]
    if(I < 4)
    {
        LP = GVP.GetPlayerOwner(I);
        // End:0x12D
        if((LP != none) && LP.ControllerId != ActiveController)
        {
            MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 0);
            GVP.RemovePlayer(LP);
        }
        ++I;
        // [Loop Continue]
        goto J0x48;
    }
    //return;    
}

function IsHostGameEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = LPPlayerController(GetPC());
    return PC.bHostGameEnabled;
    //return ReturnValue;    
}

function GetSessionName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return GetPC().PlayerReplicationInfo.PlayerName;
    //return ReturnValue;    
}

event OnClose()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, DLCManager;

    super.OnClose();
    CleanUpCheckpointEnumeration();
    ClearAdvanceTitleScreenDelegates();
    // End:0xED
    if(bShouldDisableDLCAutoRefresh)
    {
        DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
        // End:0xED
        if(DLCManager != none)
        {
            DLCManager.__OnDLCCheckComplete__Delegate = None;
            DLCManager.__ONRefreshDLCCompleteCBFinished__Delegate = None;
            DLCManager.bAutoRefreshDisabled = false;
        }
    }
    // End:0x160
    if(DLCInstallMessageBox != none)
    {
        LPGFxMoviePlayerMessageBox(DLCInstallMessageBox).__OnMessageBoxOpen__Delegate = None;
        DLCInstallMessageBox.Close();
        DLCInstallMessageBox = none;
    }
    I = 0;
    J0x16B:

    // End:0x1BA [Loop If]
    if(I < FocusViewLoaders.Length)
    {
        FocusViewLoaders[I].UnloadViews();
        I++;
        // [Loop Continue]
        goto J0x16B;
    }
    ControlsMenu = none;
    Title = none;
    Description = none;
    SecondaryDisplay = none;
    DisplayContent = none;
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.CancelFindOnlineGames();
    SetExternalInterface(none);
    ResumeRendering(true);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MPMgr, DLCManager;

    Retval = false;
    // End:0x45
    if((bIsInStartScreen && ActiveController >= 0) && ActiveController != ControllerId)
    {
        return true;
    }
    DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    // End:0xAA
    if(DLCManager != none)
    {
        // End:0xAA
        if(DLCManager.bIsCheckingDLCForUpdates)
        {
            return true;
        }
    }
    // End:0xB9
    if(bIsInstallingDLC)
    {
        return true;
    }
    // End:0x143
    if((ButtonName == 'F9') && int(InputEvent) == int(1))
    {
        LPPC = LPPlayerController(GetPC());
        // End:0x141
        if(LPPC != none)
        {            
            LPPC.ConsoleCommand("shot");
        }
        return false;
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x1FA
    if(MPMgr != none)
    {
        // End:0x1FA
        if((MPMgr.DeferredInviteInfo.bHasDeferredInvite || MPMgr.bInProgress) || MPMgr.bIsTraveling)
        {
            return true;
        }
    }
    // End:0x272
    if((FocusViewLoaderIndex >= 0) && FocusViewLoaderIndex < FocusViewLoaders.Length)
    {
        Retval = FocusViewLoaders[FocusViewLoaderIndex].FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    // End:0x36F
    if((Retval == false) && int(InputEvent) == int(0))
    {
        // End:0x2BF
        if(ButtonName == 'XboxTypeS_RightTrigger')
        {
            FocusNextViewLoader(1);            
        }
        else
        {
            // End:0x2EA
            if(ButtonName == 'XboxTypeS_LeftTrigger')
            {
                FocusNextViewLoader(-1);                
            }
            else
            {
                // End:0x30E
                if(ButtonName == 'SpaceBar')
                {
                    FocusNextViewLoader(1, true);
                }
            }
        }
        // End:0x36F
        if(bIsInStartScreen && ActiveController < 0)
        {
            // End:0x36F
            if((ButtonName == 'XboxTypeS_Start') || ButtonName == 'Enter')
            {
                StartWithPlayer(ControllerId);
            }
        }
    }
    // End:0x392
    if(ButtonName == 'SpaceBar')
    {
        Retval = true;
    }
    return Retval;
    //return ReturnValue;    
}

function StartWithPlayer()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine, OnlineSub;

    ActiveController = -1;
    UnregisteredControllerButtonPress(ControllerId);
    ActiveController = ControllerId;
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x9E
    if(MyEngine != none)
    {
        MyEngine.CurrentUserID = ActiveController;
    }
    CachedPlayerController = none;
    CachedLocalPlayer = none;
    DestroyAllLocalPlayersExceptDefault();
    GetPC().RegisterPlayerDataStores();
    // End:0x162
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x162
        if(OnlineSub != none)
        {
            OnlineSub.SetActiveController(ActiveController);
        }
    }
    GoToMainMenu();
    //return;    
}

function GoToMainMenu()
{
    ActionScriptVoid("StartClicked");
    TitleScreenNotifyButtonPress();
    //return;    
}

function UnregisteredControllerButtonPress()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Eng;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Ignored;
    local /*0x97E50000-0x00000000*/ private bool bWasPlayerFound;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    // End:0x289
    if(bIsInStartScreen && ActiveController < 0)
    {
        Eng = SPEngine(Class'Engine.Engine'.static.GetEngine());
        PlayerIndex = 0;
        J0x5B:

        // End:0xF0 [Loop If]
        if(PlayerIndex < Eng.GamePlayers.Length)
        {
            // End:0xE2
            if(Eng.GamePlayers[PlayerIndex].ControllerId == ControllerId)
            {
                bWasPlayerFound = true;
                // [Explicit Break]
                goto J0xF0;
            }
            PlayerIndex++;
            // [Loop Continue]
            goto J0x5B;
        }
        J0xF0:

        // End:0x287
        if(!bWasPlayerFound)
        {
            LP = Eng.GamePlayers[0].ViewportClient.CreatePlayer(ControllerId, Ignored, true);
            PlayerIndex = 0;
            J0x172:

            // End:0x237 [Loop If]
            if(PlayerIndex < Eng.GamePlayers.Length)
            {
                // End:0x229
                if(Eng.GamePlayers[PlayerIndex] == LP)
                {
                    Eng.GamePlayers[0].ViewportClient.BecomePrimaryPlayer(PlayerIndex);
                }
                PlayerIndex++;
                // [Loop Continue]
                goto J0x172;
            }
            LocalPlayerOwnerIndex = 0;
            Eng.CurrentCheckpoint = none;
            Eng.SetCurrentDeviceID(-1);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NonPrimaryControllerButtonPress()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609], PlayerID;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Eng;

    // End:0xF6
    if(bIsInStartScreen && ActiveController < 0)
    {
        Eng = SPEngine(Class'Engine.Engine'.static.GetEngine());
        Eng.GamePlayers[0].ViewportClient.BecomePrimaryPlayer(PlayerID);
        LocalPlayerOwnerIndex = 0;
        Eng.CurrentCheckpoint = none;
        Eng.SetCurrentDeviceID(-1);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function FocusNextViewLoader()
{
    local /*0x97E50000-0x00000000*/ private int Increment[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLoop[9437185], bForceRefresh;
    local /*0x97E50000-0x00000000*/ private int tempIndex;

    false
    false
    tempIndex = FocusViewLoaderIndex;
    J0x1D:

    tempIndex += Increment;
    // End:0x72
    if(tempIndex > (FocusViewLoaders.Length - 1))
    {
        tempIndex = ((bLoop) ? 0 : FocusViewLoaderIndex);        
    }
    else
    {
        // End:0xB0
        if(tempIndex < 0)
        {
            tempIndex = ((bLoop) ? FocusViewLoaders.Length - 1 : FocusViewLoaderIndex);
        }
    }
    // End:0x1D
    if(!((tempIndex == FocusViewLoaderIndex) || FocusViewLoaders[tempIndex].ViewStack.Length > 0))
        goto J0x1D;
    // End:0x123
    if(tempIndex != FocusViewLoaderIndex)
    {
        PlaySoundFromTheme(FocusViewLoaderSoundEventName);
    }
    FocusViewLoaderByIndex(tempIndex, bForceRefresh);
    //return;    
}

function PushSecondaryViewByName()
{
    local /*0x97E50000-0x00000000*/ private bool bFocusNewView[8388609];
    local /*0x97E50000-0x00000000*/ private name TargetViewName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ParentView[9437185];
    local /*0x97E50000-0x00000000*/ private bool bAutoSpawnOnLoad[9437185], ReturnValue, bRetval;

    true
    bRetval = false;
    // End:0xE0
    if(SecondaryDisplay != none)
    {
        bRetval = SecondaryDisplay.ViewLoader.PushViewByName(TargetViewName, ParentView, bAutoSpawnOnLoad);
        // End:0xA9
        if(bRetval && bFocusNewView == false)
        {
            FocusMainViewLoader(true);            
        }
        else
        {
            // End:0xE0
            if(!bRetval)
            {
                SecondaryDisplay.PendingViewName = TargetViewName;
            }
        }
    }
    return bRetval;
    //return ReturnValue;    
}

function FocusViewLoaderByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceRefresh[9437185];
    local /*0x97E50000-0x00000000*/ private int I, PreviousIndex;

    false
    // End:0x2F
    if(!bForceRefresh && Index == FocusViewLoaderIndex)
    {
        return;
    }
    PreviousIndex = FocusViewLoaderIndex;
    I = 0;
    J0x4D:

    // End:0x14C [Loop If]
    if(I < FocusViewLoaders.Length)
    {
        // End:0xEE
        if(I == Index)
        {
            FocusViewLoaderIndex = I;
            FocusViewLoaders[I].SetViewFocus(true);
            NotifyViewLoaderFocused(FocusViewLoaders[I].ViewLoaderID);            
        }
        else
        {
            // End:0x13E
            if((I == PreviousIndex) || bForceRefresh)
            {
                FocusViewLoaders[I].SetViewFocus(false);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x4D;
    }
    //return;    
}

function NotifyViewLoaderFocused()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string viewLoaderName[8388609];

    ActionScriptVoid("NotifyViewLoaderFocused");
    //return;    
}

function FocusMainViewLoader()
{
    local /*0x97E50000-0x00000000*/ private bool bForceRefresh[9437185];
    local /*0x97E50000-0x00000000*/ private int I;

    false
    I = 0;
    J0x10:

    // End:0x77 [Loop If]
    if(I < FocusViewLoaders.Length)
    {
        // End:0x69
        if(FocusViewLoaders[I] == ViewLoader)
        {
            FocusViewLoaderByIndex(I, bForceRefresh);
            // [Explicit Break]
            goto J0x77;
        }
        I++;
        // [Loop Continue]
        goto J0x10;
    }
    J0x77:

    //return;    
}

function FocusSecondaryViewLoader()
{
    local /*0x97E50000-0x00000000*/ private bool bForceRefresh[9437185];
    local /*0x97E50000-0x00000000*/ private int I;

    false
    I = 0;
    J0x10:

    // End:0x89 [Loop If]
    if(I < FocusViewLoaders.Length)
    {
        // End:0x7B
        if(FocusViewLoaders[I] == SecondaryDisplay.ViewLoader)
        {
            FocusViewLoaderByIndex(I, bForceRefresh);
        }
        I++;
        // [Loop Continue]
        goto J0x10;
    }
    //return;    
}

function SetSecondaryDisplayMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bIsMPMode[8388609];

    ActionScriptVoid("setMPMode");
    //return;    
}

function ShowMPConnectingToLobby()
{
    ActionScriptVoid("ShowConnectingToLobby");
    //return;    
}

function SetMPConnectingToLobbyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Field1Waiting[8388609], Field2Waiting, Field3Waiting, Field4Waiting, Field1Progress, Field2Progress,
	    Field3Progress, Field4Progress, Field1Complete, Field2Complete, Field3Complete,
	    Field4Complete;

    ActionScriptVoid("SetConnectingToLobbyText");
    //return;    
}

function SetMPLobbyConnectionProgress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string field1State[8388609], field2State, field3State, field4State;

    ActionScriptVoid("setLobbyConnectionProgress");
    //return;    
}

function ProcessDeferredInvites()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    bShouldDeferFrontEndInvites = false;
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x63
    if(MPMgr != none)
    {
        MPMgr.ProcessDeferredInvites();
    }
    //return;    
}

function CheckForDLCUpdate()
{
    local /*0x97E50000-0x00000000*/ private @NULL DLCManager;

    DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    // End:0x127
    if(DLCManager != none)
    {
        // End:0x127
        if(!DLCManager.bIsCheckingDLCForUpdates)
        {
            SuspendRendering(false);
            bForceDLCUpdate = false;
            bForceDLCUpdateAfterRenderingDelay = false;
            DLCManager.bContentChanged = false;
            DLCManager.bLoginChanged = false;
            DLCManager.bStorageDeviceChanged = false;
            bShouldDeferFrontEndInvites = true;
            DLCManager.CheckForDLCUpdateAsync(DLCCheckCompleteCB);
        }
    }
    //return;    
}

function DLCCheckCompleteCB()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldRefreshDLC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;
    local /*0x97E50000-0x00000000*/ private @NULL TopMostMainMenu, DLCManager;

    DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    // End:0x2DC
    if(DLCManager != none)
    {
        // End:0x207
        if(bShouldRefreshDLC)
        {
            // End:0x1A9
            if(DLCInstallMessageBox == none)
            {
                // End:0x75
                if(bRenderingSuspended)
                {
                    ResumeRendering();
                }
                OptionArray.Length = 0;
                Class'SPEngine.SPUIManager'.static.ShowUIMessage('DLCInstallation', "<Strings:LostPlanetGame.MessageBoxStrings.DLCInstallation_Title>", "<Strings:LostPlanetGame.MessageBoxStrings.DLCInstallation_Message>", OptionArray, None, none, DLCInstallMessageBox,, false,, true, true,, OnDLCMessageBoxOpen);
                bIsInstallingDLC = true;
                DLCManager.__ONRefreshDLCCompleteCBFinished__Delegate = RefreshDLCCompleteCBFinished;                
            }
            else
            {
                bIsInstallingDLC = true;
                DLCManager.__ONRefreshDLCCompleteCBFinished__Delegate = RefreshDLCCompleteCBFinished2;
                DLCManager.RefreshDLC();
            }            
        }
        else
        {
            // End:0x241
            if(DLCInstallMessageBox != none)
            {
                DLCInstallMessageBox.Close();
                DLCInstallMessageBox = none;
            }
            // End:0x2CF
            if(bInitialMainMenuBootUpDone)
            {
                TopMostMainMenu = LPGFxFrontEnd_MainMenu(FocusViewLoaders[FocusViewLoaderIndex].GetTopMostview());
                // End:0x2CC
                if((TopMostMainMenu == none) || TopMostMainMenu.bInitialFrameDelayDone)
                {
                    SetResumeRenderingFrameDelay(12);                    
                }                
            }
            ProcessDeferredInvites();
        }        
    }
    else
    {
        // End:0x316
        if(DLCInstallMessageBox != none)
        {
            DLCInstallMessageBox.Close();
            DLCInstallMessageBox = none;
        }
        // End:0x332
        if(bInitialMainMenuBootUpDone)
        {
            SetResumeRenderingFrameDelay(12);            
        }
        ProcessDeferredInvites();
    }
    //return;    
}

function OnDLCMessageBoxOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609], PC, DLCManager;

    DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    // End:0xAE
    if(DLCManager != none)
    {
        PC = GetPC();
        // End:0x8F
        if(PC != none)
        {
            PC.SetTimer(1.0000000, false, 'MsgBoxDelayedDLCUpdate', self);            
        }
        else
        {
            DLCManager.RefreshDLC();
        }
    }
    //return;    
}

function MsgBoxDelayedDLCUpdate()
{
    local /*0x97E50000-0x00000000*/ private @NULL DLCManager;

    DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    // End:0x60
    if(DLCManager != none)
    {
        DLCManager.RefreshDLC();
    }
    //return;    
}

function RefreshDLCCompleteCBFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL TopMostFocusedFrontEndScreen;

    bIsInstallingDLC = false;
    // End:0xA0
    if((FocusViewLoaderIndex >= 0) && FocusViewLoaderIndex < FocusViewLoaders.Length)
    {
        TopMostFocusedFrontEndScreen = LPGFxFrontEnd_Screen(FocusViewLoaders[FocusViewLoaderIndex].GetTopMostview());
        // End:0xA0
        if(TopMostFocusedFrontEndScreen != none)
        {
            TopMostFocusedFrontEndScreen.UpdateListDataProvider();
        }
    }
    bForceDLCUpdate = true;
    ResumeRendering();
    SuspendRendering(false);
    //return;    
}

function RefreshDLCCompleteCBFinished2()
{
    local /*0x97E50000-0x00000000*/ private @NULL TopMostFocusedFrontEndScreen;

    bIsInstallingDLC = false;
    // End:0xA0
    if((FocusViewLoaderIndex >= 0) && FocusViewLoaderIndex < FocusViewLoaders.Length)
    {
        TopMostFocusedFrontEndScreen = LPGFxFrontEnd_Screen(FocusViewLoaders[FocusViewLoaderIndex].GetTopMostview());
        // End:0xA0
        if(TopMostFocusedFrontEndScreen != none)
        {
            TopMostFocusedFrontEndScreen.UpdateListDataProvider();
        }
    }
    DLCInstallMessageBox.Close();
    DLCInstallMessageBox = none;
    SetResumeRenderingFrameDelay(12);
    ProcessDeferredInvites();
    //return;    
}

function PromptedForCompatPack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;
    local /*0x97E50000-0x00000000*/ private @NULL DLCManager;

    DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    // End:0x32B
    if(DLCManager != none)
    {
        // End:0x32B
        if(DLCManager.GetDLCInfoByName("CompatPack") == none)
        {
            // End:0xF6
            if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(2))
            {
                OptionArray.AddItem("<Strings:LostPlanetGame.MessageBoxStrings.CompatPackRequiredMsgBtnDownloadPS3>");                                
            }
            else
            {
                // End:0x178
                if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(1))
                {
                    OptionArray.AddItem("<Strings:LostPlanetGame.MessageBoxStrings.CompatPackRequiredMsgBtnDownloadXbox>");                    
                }
            }
            OptionArray.AddItem("<Strings:LostPlanetGame.MessageBoxStrings.CompatPackRequiredMsgBtnProceed>");            
            OptionArray.AddItem("<Strings:LostPlanetGame.MessageBoxStrings.ReturnToMainMenu_Title>");            
            Class'SPEngine.SPUIManager'.static.ShowUIMessage('CompatPackRequired', "<Strings:LostPlanetGame.MessageBoxStrings.CompatPackRequiredTitle>", "<Strings:LostPlanetGame.MessageBoxStrings.CompatPackRequiredMsg>", OptionArray, OnOptionSelected_CompatPackReqd, LocalPlayer(GetPC().Player),,, false,, true, true,, None);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function OnOptionSelected_CompatPackReqd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private @NULL TopMostMainMenu;

    TopMostMainMenu = LPGFxFrontEnd_MainMenu(FocusViewLoaders[FocusViewLoaderIndex].GetTopMostview());
    // End:0xAD
    if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(0))
    {
        // End:0x7C
        if(SelectedButtonIndex == 0)
        {
            OpenOnlineStore();            
        }
        else
        {
            // End:0xAA
            if(SelectedButtonIndex == 1)
            {
                TopMostMainMenu.TravelToMPLobby_Proceed();
            }
        }        
    }
    else
    {
        // End:0x150
        if(SelectedButtonIndex == 0)
        {
            Status = TopMostMainMenu.GetLoginStatus();
            // End:0x131
            if((int(Status) == int(0)) || int(Status) == int(1))
            {
                TopMostMainMenu.PopPCOnlineLogin();                
            }
            else
            {
                TopMostMainMenu.TravelToMPLobby_Proceed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function OpenOnlineStore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    LPPC = LPPlayerController(GetPC());
    LP = LocalPlayer(LPPC.Player);
    OnlineSub = LPPC.OnlineSub;
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(LP.ControllerId));
    // End:0x45C
    if((int(LoginStatus) == int(2)) && !OnlineSub.PlayerInterface.IsGuestLogin(byte(LP.ControllerId)))
    {
        // End:0x306
        if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(2))
        {
            // End:0x306
            if(int(OnlineSub.PlayerInterface.CanPlayOnline(byte(LP.ControllerId))) != int(2))
            {
                OptionArray.AddItem("<Strings:LostPlanetGame.FrontEnd.Continue>");                
                Class'SPEngine.SPUIManager'.static.ShowUIMessage('OnlineStoreRestricted', "<Strings:LostPlanetGame.MessageBoxStrings.OnlineStoreAccessRestrictedTitle>", "<Strings:LostPlanetGame.MessageBoxStrings.OnlineStoreAccessRestrictedMessagePS3>", OptionArray, None, LP,,, false,, true, true,, None);
                return false;
            }
        }
        // End:0x3C8
        if(NotEqual_InterfaceInterface(OnlineSub.NP, SPOnlineNPInterface(none)))
        {
            MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
            // End:0x389
            if(!MPMgr.DestroyOnlineGame())
            {
            }
            OnlineSub.NP.ExecuteStoreBrowse(0, "");
            return true;            
        }
        else
        {
            // End:0x459
            if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
            {
                OnlineSub.PlayerInterfaceEx.ShowContentMarketplaceUI(byte(LP.ControllerId));
                return true;                
            }
        }        
    }
    else
    {
        // End:0x5F4
        if((Class'SPEngine.SPUtil'.static.IsConsoleBuild(2) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnlineStoreNotifyLoginChange);
            OnlineSub.PlayerInterface.AddLoginFailedDelegate(byte(LP.ControllerId), OnlineStoreNotifyLoginFailed);
            OnlineSub.PlayerInterface.AddLoginCancelledDelegate(OnlineStoreNotifyLoginCancelled);
            OnlineSub.PlayerInterface.ShowLoginUI(false, false);            
        }
        else
        {
            PromptForOnlineStoreRequiresLogin();
        }
    }
    return false;
    //return ReturnValue;    
}

function PromptForOnlineStoreRequiresLogin()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg;
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;

    // End:0x7C
    if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(2))
    {
        msg = "<Strings:LostPlanetGame.MessageBoxStrings.OnlineStoreLogInRequiredMsgPS3>";        
    }
    else
    {
        msg = "<Strings:LostPlanetGame.MessageBoxStrings.OnlineStoreLogInRequiredMsgXbox>";
    }
    OptionArray.AddItem("<Strings:LostPlanetGame.FrontEnd.Continue>");    
    Class'SPEngine.SPUIManager'.static.ShowUIMessage('OnlineStoreNeedsLogin', "<Strings:LostPlanetGame.MessageBoxStrings.OnlineStoreLogInRequiredTitle>", msg, OptionArray, None, LocalPlayer(GetPC().Player),,, false,, true, true,, None);
    //return;    
}

function OnlineStoreNotifyLoginChange()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    LPPC = LPPlayerController(GetPC());
    LP = LocalPlayer(LPPC.Player);
    OnlineSub = LPPC.OnlineSub;
    // End:0x2DA
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.ClearLoginChangeDelegate(OnlineStoreNotifyLoginChange);
        OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnlineStoreNotifyLoginCancelled);
        OnlineSub.PlayerInterface.ClearLoginFailedDelegate(byte(GetLP().ControllerId), OnlineStoreNotifyLoginFailed);
        // End:0x2D7
        if((LP != none) && LP.ControllerId == int(LocalUserNum))
        {
            LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(LP.ControllerId));
            // End:0x2CA
            if((int(LoginStatus) == int(2)) && !OnlineSub.PlayerInterface.IsGuestLogin(byte(LP.ControllerId)))
            {
                OpenOnlineStore();                
            }
            else
            {
                PromptForOnlineStoreRequiresLogin();
            }            
        }        
    }
    else
    {
        PromptForOnlineStoreRequiresLogin();
    }
    //return;    
}

function OnlineStoreNotifyLoginFailed()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609], ErrorCode;

    OnlineStoreNotifyLoginCancelled();
    //return;    
}

function OnlineStoreNotifyLoginCancelled()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x162
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.ClearLoginChangeDelegate(OnlineStoreNotifyLoginChange);
        OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnlineStoreNotifyLoginCancelled);
        OnlineSub.PlayerInterface.ClearLoginFailedDelegate(byte(GetLP().ControllerId), OnlineStoreNotifyLoginFailed);
    }
    PromptForOnlineStoreRequiresLogin();
    //return;    
}

function AddCheckpointEnumerationSubscriber()
{
    local /*0x97E50000-0x00000000*/ private @NULL screen[8388609];

    // End:0x36
    if(CheckpointEnumerationViewSubscribers.Find(screen) == )
    {        
        CheckpointEnumerationViewSubscribers.AddItem(screen);        
    }
    //return;    
}

function GetCheckpointEnumeration()
{
    local /*0x97E50000-0x00000000*/ private bool bRefresh[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AdditionalSlotIndices;

    true
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x119
    if(GameDataStore.CheckpointEnumerator != none)
    {
        SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCCheckpointSlots(AdditionalSlotIndices);
        GameDataStore.CheckpointEnumerator.GetCheckpointEnumeration(CheckpointEnumerationDelegate, bRefresh, AdditionalSlotIndices);
    }
    //return;    
}

function CheckpointEnumerationDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InLoadedInfoArray[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine, CPInfo;
    local /*0x97E50000-0x00000000*/ private bool bSavingEnabled;

    bSavingEnabled = Class'LPCheckpoint'.static.CanSaveCheckpoints();
    LoadedInfoArray = InLoadedInfoArray;    
    LoadedInfoArray.Sort(CheckpointTimeCompare);    
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0xA8
    if(MyEngine == none)
    {
        return;
    }
    bMemoryCheckpointExists = MyEngine.CurrentCheckpoint != none;
    bCheckpointSlot0Exists = false;
    bCheckpointSlot1Exists = false;
    bCheckpointSlot2Exists = false;
    // End:0x289
    if(bSavingEnabled)
    {
        I = 0;
        J0x110:

        // End:0x289 [Loop If]
        if(I < InLoadedInfoArray.Length)
        {
            CPInfo = MyEngine.GetCheckpointSlotInfo(InLoadedInfoArray[I].SlotIndex);
            // End:0x27B
            if(((InLoadedInfoArray[I].DisplayName != "") || CPInfo.Status.bIsCorruptFile) || CPInfo.Status.bNotOwnedByUser)
            {
                switch(InLoadedInfoArray[I].SlotIndex)
                {
                    // End:0x251
                    case 0:
                        bCheckpointSlot0Exists = true;
                        // End:0x27B
                        break;
                    // End:0x264
                    case 1:
                        bCheckpointSlot1Exists = true;
                        // End:0x27B
                        break;
                    // End:0x278
                    case 2:
                        bCheckpointSlot2Exists = true;
                        // End:0x27B
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
                I++;
                // [Loop Continue]
                goto J0x110;
            }/* !MISMATCHING REMOVE, tried Loop got Type:Else Position:0x27B! */
        }/* !MISMATCHING REMOVE, tried If got Type:Loop Position:0x110! */
        I = 0;
        J0x294:

        // End:0x2FC [Loop If]
        if(I < CheckpointEnumerationViewSubscribers.Length)
        {
            // End:0x2EE
            if(CheckpointEnumerationViewSubscribers[I] != none)
            {
                CheckpointEnumerationViewSubscribers[I].NotifyCheckpointEnumerationComplete();
            }
            I++;
            // [Loop Continue]
            goto J0x294;
        }
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x0F8! */
}

function CleanUpCheckpointEnumeration()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore;

    CheckpointEnumerationViewSubscribers.Length = 0;
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0xC6
    if(GameDataStore.CheckpointEnumerator != none)
    {
        GameDataStore.CheckpointEnumerator.ClearCheckpointEnumerationDelegate(CheckpointEnumerationDelegate);
    }
    //return;    
}

delegate CheckpointTimeCompare()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iCompareResult;

    iCompareResult = Class'SPEngine.SPCheckpoint'.static.CheckpointTimeCompare(A.CheckpointSaveTime, B.CheckpointSaveTime);
    return ((iCompareResult >= 0) ? 0 : -1);
    //return ReturnValue;    
}

function CheckForCheckPoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;
    local /*0x97E50000-0x00000000*/ private bool bSavingEnabled;
    local /*0x97E50000-0x00000000*/ private int I;

    bSavingEnabled = Class'LPCheckpoint'.static.CanSaveCheckpoints();
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x6E
    if(MyEngine == none)
    {
        return;
    }
    bMemoryCheckpointExists = MyEngine.CurrentCheckpoint != none;
    // End:0xD0
    if(!bSavingEnabled)
    {
        bCheckpointSlot0Exists = false;
        bCheckpointSlot1Exists = false;
        bCheckpointSlot2Exists = false;        
    }
    else
    {
        bCheckpointSlot0Exists = MyEngine.CheckpointExists("SPCheckpoint0", "SaveSlot" $ string(0), 0);
        bCheckpointSlot1Exists = MyEngine.CheckpointExists("SPCheckpoint0", "SaveSlot" $ string(1), 1);
        bCheckpointSlot2Exists = MyEngine.CheckpointExists("SPCheckpoint0", "SaveSlot" $ string(2), 2);
    }
    I = 0;
    J0x1C7:

    // End:0x22F [Loop If]
    if(I < CheckpointEnumerationViewSubscribers.Length)
    {
        // End:0x221
        if(CheckpointEnumerationViewSubscribers[I] != none)
        {
            CheckpointEnumerationViewSubscribers[I].NotifyCheckpointEnumerationComplete();
        }
        I++;
        // [Loop Continue]
        goto J0x1C7;
    }
    //return;    
}

function GetCheckpointDescription()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Header[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], CheckpointDescription, RegionalTimeStamp;
    local /*0x97E50000-0x00000000*/ private int Hour, Min, Sec;

    Hour = FFloor(float(Header.CheckpointSaveTime.SecondsSinceMidnight / 3600));
    Min = FFloor(float((Header.CheckpointSaveTime.SecondsSinceMidnight % 3600) / 60));
    Sec = FFloor(float(Header.CheckpointSaveTime.SecondsSinceMidnight % 60));
    RegionalTimeStamp = Class'SPEngine.SPUtil'.static.RegionalTimeStampFromTime(Header.CheckpointSaveTime.Year, Header.CheckpointSaveTime.Month, Header.CheckpointSaveTime.Day, Hour, Min, Sec);
    CheckpointDescription = (((Header.DisplayName $ " - ") @ RegionalTimeStamp) $ "\n") $ Header.TimePlayed;
    return CheckpointDescription;
    //return ReturnValue;    
}

defaultproperties
{
    ActiveController=-1
    DefaultViewName="MainMenu"
    ImageSubstitutions=/* Array type was not detected. */
    bCaptureInput=true
    TimingMode=GFxTimingMode.TM_Real
    Priority=20
    WidgetBindings=/* Array type was not detected. */
    OnPostAdvance=FEPostAdvance
}