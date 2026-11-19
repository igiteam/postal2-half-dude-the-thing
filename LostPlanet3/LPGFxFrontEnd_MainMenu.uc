class LPGFxFrontEnd_MainMenu extends LPGFxFrontEnd_MainMenuCommon within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTriggerPressed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLeftTriggerPressed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialDLCCheckDone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialFrameDelayDone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPendingPlayOnline;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MPTravelURL;

function Select_Campaign()
{
    MenuViewLoader.PushViewByName('Campaign', self);
    //return;    
}

function Select_LoadCheckpoint()
{
    MenuViewLoader.PushViewByName('LoadGame', self);
    //return;    
}

function Select_CheckpointList()
{
    MenuViewLoader.PushViewByName('CheckpointList', self);
    //return;    
}

function Select_Options()
{
    MenuViewLoader.PushViewByName('Options', self);
    //return;    
}

function Select_Cinematics()
{
    MenuViewLoader.PushViewByName('CinematicGallery', self);
    LPGFxFrontEnd_CinematicGallery(MenuViewLoader.ViewStack[MenuViewLoader.ViewStack.Length - 1]).PostPushFromPreviousScreen(bTriggerPressed);
    //return;    
}

function Select_Credits()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    LPPC.ClientShowLoadingMovie(true);
    Class'LPUIDataStore_FrontEnd'.static.SetSkipTitleScreen(true);
    // End:0x119
    if(LPProfileSettings(LPPC.ProfileSettings).HasCompletedCampaign())
    {        
        LPPC.ConsoleCommand("start credits_p?SAVEPLAYER?PlayerStartName=skippable");        
    }
    else
    {
        // End:0x188
        if(bTriggerPressed)
        {            
            LPPC.ConsoleCommand("start credits_p?SAVEPLAYER?PlayerStartName=skippable");            
        }
        else
        {            
            LPPC.ConsoleCommand("start credits_p?SAVEPLAYER?PlayerStartName=menu");
        }
    }
    //return;    
}

function Select_PlayOnline()
{
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x39
    if(bTriggerPressed)
    {
        MenuViewLoader.PushViewByName('OnlineModeLANInternet', self);
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    Status = GetLoginStatus();
    // End:0x2C3
    if((int(Status) == int(0)) || int(Status) == int(1))
    {
        // End:0x279
        if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild())
        {
            OnlineSub.PlayerInterface.AddLoginCancelledDelegate(OnLoginCancelled);
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.AddLoginFailedDelegate(byte(Outer.GetLP().ControllerId), OnLoginFailed);
            // End:0x276
            if(!OnlineSub.PlayerInterface.ShowLoginUI(true, false))
            {
                Cleanup();
                BuildResponseDialog("ResponseDialog_NotLoggedInTitle", "ResponseDialog_NotLoggedInMessage");
            }            
        }
        else
        {
            // End:0x2B7
            if(!bLeftTriggerPressed && LPGFxMoviePlayerFrontEndManager(MoviePlayer).PromptedForCompatPack())
            {
                return;
            }
            PopPCOnlineLogin();
        }
        return;
    }
    TravelToMPLobby();
    //return;    
}

function PopPCOnlineLogin()
{
    BuildResponseDialog("ResponseDialog_NotLoggedInTitle", "ResponseDialog_NotLoggedInMessage");
    //return;    
}

function Select_Bestiary()
{
    MenuViewLoader.PushViewByName('Bestiary', self);
    //return;    
}

function Select_Command()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xBB
    if(LPPC != none)
    {
        // End:0xAF
        if(Command != "Exit")
        {
            LPPC.ClientShowLoadingMovie(true);            
            LPPC.ConsoleCommand(Command);            
        }
        else
        {
            Select_Exit();
        }
        return;
    }
    //return;    
}

function Select_OnlineStore()
{
    LPFrontEndMoviePlayer.OpenOnlineStore();
    //return;    
}

function Select_Exit()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExitDialogMC;

    ExitDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x230
    if(ExitDialogMC != none)
    {
        ExitDialogMC.SetDefaultFocusedButton(0);
        ExitDialogMC.EnableDialogBackground(true);
        ExitDialogMC.SetNumberOfOptions(2);
        ExitDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.Exit>");
        ExitDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ExitDesc>");
        ExitDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ExitDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ExitDialogMC.SetButtonOnPress(0, ExitDialog_SelectBack);
        ExitDialogMC.SetButtonOnPress(1, ExitDialog_SelectOK);
    }
    //return;    
}

function ExitDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], LPPC;

    LPPC = LPPlayerController(Outer.GetPC());    
    LPPC.ConsoleCommand("Exit");
    //return;    
}

function ExitDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView();
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'Campaign':
            Select_Campaign();
            // End:0x1A9
            break;
        // End:0xCE
        case 'Options':
            Select_Options();
            // End:0x1A9
            break;
        // End:0xE7
        case 'Play Online':
            Select_PlayOnline();
            // End:0x1A9
            break;
        // End:0x100
        case 'Bestiary':
            Select_Bestiary();
            // End:0x1A9
            break;
        // End:0x119
        case 'Exit':
            Select_Exit();
            // End:0x1A9
            break;
        // End:0x158
        case 'Command':
            Select_Command(mySettingsList[SelectedIndex].CommandString);
            // End:0x1A9
            break;
        // End:0x171
        case 'Cinematics':
            Select_Cinematics();
            // End:0x1A9
            break;
        // End:0x18A
        case 'Credits':
            Select_Credits();
            // End:0x1A9
            break;
        // End:0x1A3
        case 'OnlineStore':
            Select_OnlineStore();
            // End:0x1A9
            break;
        // End:0xFFFF
        default:
            // End:0x1A9
            break;
            break;
    }
    //return;    
}

function OnEscapeKeyPress()
{
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL DLCManager;

    0
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    LPFrontEndMoviePlayer.bInitialMainMenuBootUpDone = true;
    // End:0x24B
    if(ListMC != none)
    {
        DLCManager = SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
        // End:0x1EE
        if(!LPFrontEndMoviePlayer.bIsInstallingDLC && (DLCManager == none) || (DLCManager != none) && !DLCManager.bIsCheckingDLCForUpdates)
        {
            // End:0x1CA
            if(!bInitialDLCCheckDone)
            {
                bInitialDLCCheckDone = true;
                DLCManager.bLoginChanged = false;
                DLCManager.bContentChanged = false;
                DLCManager.bStorageDeviceChanged = false;
                LPFrontEndMoviePlayer.bEnableDLCUpdateChecking = true;
                LPFrontEndMoviePlayer.bForceDLCUpdateAfterRenderingDelay = true;
                LPFrontEndMoviePlayer.SetResumeRenderingFrameDelay(16);                
            }
            else
            {
                LPFrontEndMoviePlayer.SetResumeRenderingFrameDelay(16);
            }            
        }
        else
        {
            // End:0x23F
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
            {
                bInitialDLCCheckDone = true;
                LPFrontEndMoviePlayer.bEnableDLCUpdateChecking = true;
            }
        }
        bInitialFrameDelayDone = true;
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
        // End:0xE7
        case 'UserName':
            // End:0xE4
            if(UserNameTxt == none)
            {
                UserLabelTxt = Widget.GetObject("label");
                UserNameTxt = Widget.GetObject("textField");
                UserLabelTxt.SetText("");
                UserNameTxt.SetText("");
            }
            // End:0xF9
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0xF9
            break;
            break;
    }
    // End:0x138
    if(!bWasHandled)
    {
        bWasHandled = super(LPGFxFrontEnd_Screen).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bPendingPlayOnline)
    {
        return true;
    }
    // End:0x33
    if(LPFrontEndMoviePlayer.bRenderingSuspended)
    {
        return true;
    }
    // End:0x60
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0xCE
    if((ButtonName == 'XboxTypeS_RightTrigger') || ButtonName == 'Right')
    {
        bTriggerPressed = (int(InputEvent) == int(0)) || int(InputEvent) == int(2);
        bTriggerPressed = false;
    }
    // End:0x13C
    if((ButtonName == 'XboxTypeS_LeftTrigger') || ButtonName == 'Left')
    {
        bLeftTriggerPressed = (int(InputEvent) == int(0)) || int(InputEvent) == int(2);
        bLeftTriggerPressed = false;
    }
    return false;
    //return ReturnValue;    
}

function OnViewLoaded()
{
    super.OnViewLoaded();
    CheckForCheckPoints();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, UIManagerInstance;

    false
    'None'
    super(LPGFxFrontEnd_Screen).OnTopMostView(bPlayOpenAnimation, previousView);
    bTriggerPressed = false;
    bPendingPlayOnline = false;
    Class'LPMultiplayerManager'.static.GetInstance().ResetDLCFilter();
    // End:0x23C
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionBackButton(false);
        // End:0x23C
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            // End:0x23C
            if(!bInitialDLCCheckDone)
            {
                bInitialDLCCheckDone = true;
                LPFrontEndMoviePlayer.bEnableDLCUpdateChecking = true;
                LPPC = LPPlayerController(Outer.GetPC());
                UIManagerInstance = Class'LPUIManager'.static.GetLPUIManager();
                // End:0x21B
                if((((UIManagerInstance != none) && (UIManagerInstance.OpenMessageBoxes.Length == 0) || LPFrontEndMoviePlayer.DLCInstallMessageBox != none) && LPPC != none) && !LPPC.bIsExternalUIOpen)
                {
                    LPFrontEndMoviePlayer.CheckForDLCUpdate();                    
                }
                else
                {
                    LPFrontEndMoviePlayer.bForceDLCUpdate = true;
                }
            }
        }
    }
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    Cleanup();
    //return;    
}

function OnViewStackPositionChanged()
{
    local /*0x97E50000-0x00000000*/ private name nextViewName[9437185];

    'None'
    super(LPGFxFrontEnd_Screen).OnViewStackPositionChanged(nextViewName);
    // End:0x7F
    if((nextViewName != 'SaveWarning') && nextViewName != 'InfoDialog')
    {
        // End:0x7F
        if(LPFrontEndMoviePlayer != none)
        {
            LPFrontEndMoviePlayer.SetOptionBackButton(true);
        }
    }
    //return;    
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
        ConfirmMC.SetButtonOnPress(0, cbErrorResponseDialog_OK);
    }
    //return;    
}

function cbErrorResponseDialog_OK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, LPPC;

    bPendingPlayOnline = false;
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x208
    if(LPPC != none)
    {
        OnlineSub = LPPC.OnlineSub;
        // End:0x208
        if(OnlineSub != none)
        {
            OnlineSub.PlayerInterface.ClearReadPlayerStorageCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadPlayerStorageComplete);
            OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnLoginCancelled);
            OnlineSub.PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.ClearLoginFailedDelegate(byte(Outer.GetLP().ControllerId), OnLoginFailed);
        }
    }
    Class'SPEngine.SPUIManager'.static.CloseAllUIMessageBoxes();
    //return;    
}

function GetLoginStatus()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LP;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    LPPC = LPPlayerController(Outer.GetPC());
    LP = LocalPlayer(LPPC.Player);
    OnlineSub = LPPC.OnlineSub;
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(LP.ControllerId));
    return LoginStatus;
    //return ReturnValue;    
}

function OnLoginCancelled()
{
    Cleanup();
    BuildResponseDialog("ResponseDialog_LoginFailedTitle", "ResponseDialog_LoginFailedBody");
    //return;    
}

function OnLoginChange()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC, LP;

    PC = LPPlayerController(Outer.GetPC());
    Cleanup();
    LP = LocalPlayer(PC.Player);
    // End:0x21B
    if((LP != none) && LP.ControllerId == int(LocalUserNum))
    {
        // End:0x1AE
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            PC.DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);
            return;
        }
        // End:0x1D0
        if(int(GetLoginStatus()) == int(2))
        {
            TravelToMPLobby();            
        }
        else
        {
            BuildResponseDialog("ResponseDialog_LoginFailedTitle", "ResponseDialog_LoginFailedBody");
        }
    }
    //return;    
}

function OnLoginFailed()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609], ErrorCode;

    Cleanup();
    BuildResponseDialog("ResponseDialog_LoginFailedTitle", "ResponseDialog_LoginFailedBody");
    //return;    
}

function ReadPlayerStorage()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private int DeviceID;

    // End:0x1AD
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        PC = LPPlayerController(Outer.GetPC());
        PC.ProfileSettings.GetProfileSettingValueInt(52, DeviceID);
        PC.OnlinePlayerData.StorageProvider.ReadData(Class'Engine.GameEngine'.static.GetOnlineSubsystem().PlayerInterface, byte(PC.OnlinePlayerData.StorageProvider.PlayerControllerId), DeviceID, PC.OnlinePlayerData.StorageProvider.Profile);
    }
    //return;    
}

function TravelToMPLobby()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private bool bTravel;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    bTravel = true;
    // End:0x253
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        // End:0x253
        if(int(OnlineSub.PlayerInterface.CanPlayOnline(byte(Outer.GetLP().ControllerId))) == int(2))
        {
            // End:0x253
            if(int(OnlineSub.PlayerInterface.CanCommunicate(byte(Outer.GetLP().ControllerId))) != int(2))
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ChatDisabled_MessagePS3>", "<Strings:SPGameUI.MessageBoxErrorStrings.ChatDisabled_Title>", "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.ResponseDialog_ReallyOK>",, TravelToMPLobby_Confirmed);
                bTravel = false;
            }
        }
    }
    // End:0x26D
    if(bTravel)
    {
        TravelToMPLobby_Confirmed(none, 0, 0);
    }
    //return;    
}

function TravelToMPLobby_Confirmed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xF9
    if(int(OnlineSub.PlayerInterface.CanPlayOnline(byte(Outer.GetLP().ControllerId))) == int(0))
    {
        BuildResponseDialog("ResponseDialog_CannotPlayOnlineTitle", "ResponseDialog_CannotPlayOnlineMessage");
        return true;
    }
    // End:0x12E
    if(!bLeftTriggerPressed && FrontEndManager.PromptedForCompatPack())
    {
        return true;
    }
    TravelToMPLobby_Proceed();
    return true;
    //return ReturnValue;    
}

function TravelToMPLobby_Proceed()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xE2
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        bPendingPlayOnline = true;
        OnlineSub.PlayerInterface.AddReadPlayerStorageCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadPlayerStorageComplete);
        ReadPlayerStorage();        
    }
    else
    {
        TravelToMPLobby_CreateParty();
    }
    //return;    
}

function TravelToMPLobby_CreateParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xAB
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        bPendingPlayOnline = true;
        MPMgr.__OnCreateGameComplete__Delegate = OnCreateGameComplete_CreateParty;
        MPMgr.CreateParty();        
    }
    else
    {
        OnCreateGameComplete_CreateParty('Party', true);
    }
    //return;    
}

function OnReadPlayerStorageComplete()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    Class'Engine.GameEngine'.static.GetOnlineSubsystem().PlayerInterface.ClearReadPlayerStorageCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadPlayerStorageComplete);
    TravelToMPLobby_CreateParty();
    //return;    
}

function OnCreateGameComplete_CreateParty()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, OnlineSub;
    local /*0x97E50000-0x00000000*/ private byte Status;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.__OnCreateGameComplete__Delegate = None;
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    Status = GetLoginStatus();
    // End:0x2AF
    if((int(Status) == int(0)) || int(Status) == int(1))
    {
        // End:0x299
        if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild())
        {
            OnlineSub.PlayerInterface.AddLoginCancelledDelegate(OnLoginCancelled);
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.AddLoginFailedDelegate(byte(Outer.GetLP().ControllerId), OnLoginFailed);
            // End:0x296
            if(!OnlineSub.PlayerInterface.ShowLoginUI(true, false))
            {
                Cleanup();
                BuildResponseDialog("ResponseDialog_NotLoggedInTitle", "ResponseDialog_NotLoggedInMessage");
            }            
        }
        else
        {
            PopPCOnlineLogin();
            Cleanup();
        }
        return;
    }
    Cleanup();
    Class'Engine.WorldInfo'.static.GetWorldInfo().ForceGarbageCollection();
    Class'Engine.WorldInfo'.static.GetWorldInfo().ServerTravel(MPTravelURL, true);
    //return;    
}

defaultproperties
{
    MPTravelURL="LostPlanetMPLobby?game=MPLobby?OnlineMode=Internet?Listen"
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.MainMenu>"
    SettingsList=/* Array type was not detected. */
}