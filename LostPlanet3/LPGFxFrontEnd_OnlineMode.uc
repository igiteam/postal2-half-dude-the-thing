class LPGFxFrontEnd_OnlineMode extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    abstract
    config(UI);

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

    // End:0x23
    if(int(GetLoginStatus()) == int(2))
    {
        Select_Internet(false);        
    }
    else
    {
        Cleanup();
        BuildResponseDialog("ResponseDialog_LoginFailedTitle", "ResponseDialog_LoginFailedBody");
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

function Select_Internet()
{
    local /*0x97E50000-0x00000000*/ private bool bNoParty[9437185];
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TravelURL;

    // End:0x57
    if(bNoParty)
    {
        TravelURL = "LostPlanetMPLobby?game=MPLobby?OnlineMode=Internet?DevMode";        
    }
    else
    {
        TravelURL = "LostPlanetMPLobby?game=MPLobby?OnlineMode=Internet?DevMode?Listen";
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    Status = GetLoginStatus();
    // End:0x37B
    if((int(Status) == int(0)) || int(Status) == int(1))
    {
        // End:0x2E6
        if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild())
        {
            OnlineSub.PlayerInterface.AddLoginCancelledDelegate(OnLoginCancelled);
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.AddLoginFailedDelegate(byte(Outer.GetLP().ControllerId), OnLoginFailed);
            // End:0x2E1
            if(!OnlineSub.PlayerInterface.ShowLoginUI(true, false))
            {
                Cleanup();
                BuildResponseDialog("ResponseDialog_NotLoggedInTitle", "ResponseDialog_NotLoggedInMessage");
            }
            return;            
        }
        else
        {
            MenuViewLoader.PushViewByName('OnlineLogin', self);
            LPGFxFrontEnd_OnlineLogin(MenuViewLoader.ViewStack[MenuViewLoader.ViewStack.Length - 1]).SetTravelURL(TravelURL);
            return;
        }
    }
    // End:0x44B
    if(int(OnlineSub.PlayerInterface.CanPlayOnline(byte(Outer.GetLP().ControllerId))) == int(0))
    {
        BuildResponseDialog("ResponseDialog_CannotPlayOnlineTitle", "ResponseDialog_CannotPlayOnlineMessage");
        return;
    }
    Cleanup();
    Class'Engine.WorldInfo'.static.GetWorldInfo().ForceGarbageCollection();
    Class'Engine.WorldInfo'.static.GetWorldInfo().ServerTravel(TravelURL);
    //return;    
}

function Select_LAN()
{
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TravelURL;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    Status = GetLoginStatus();
    TravelURL = "LostPlanetMPLobby?game=MPLobby?OnlineMode=LAN?DevMode";
    // End:0x26A
    if(int(Status) == int(0))
    {
        // End:0x26A
        if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild())
        {
            OnlineSub.PlayerInterface.AddLoginCancelledDelegate(OnLoginCancelled);
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.AddLoginFailedDelegate(byte(Outer.GetLP().ControllerId), OnLoginFailed);
            // End:0x268
            if(!OnlineSub.PlayerInterface.ShowLoginUI(false, false))
            {
                Cleanup();
                BuildResponseDialog("ResponseDialog_NotSignedInTitle", "ResponseDialog_NotSignedInMessage");
            }
            return;
        }
    }
    Cleanup();
    Class'Engine.WorldInfo'.static.GetWorldInfo().ForceGarbageCollection();
    Class'Engine.WorldInfo'.static.GetWorldInfo().ServerTravel(TravelURL);
    //return;    
}

function SetupLANConfirm()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x299
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.LANConfirmTitle>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.LANConfirmBody>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.LANConfirmBack>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineMode.LANConfirmProceed>");
        ConfirmMC.SetButtonOnPress(0, cbLANReject);
        ConfirmMC.SetButtonOnPress(1, cbLANConfirm);
    }
    //return;    
}

function cbLANConfirm()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    MenuViewLoader.PushViewByName('PartyLobbyLAN', self);
    Select_LAN();
    //return;    
}

function cbLANReject()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
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
    Class'LPMultiplayerManager'.static.Destroy();
    switch(Selection)
    {
        // End:0xD5
        case 'Internet':
            Select_Internet();
            // End:0x10E
            break;
        // End:0xEF
        case 'InternetNoParty':
            Select_Internet(true);
            // End:0x10E
            break;
        // End:0x108
        case 'LAN':
            SetupLANConfirm();
            // End:0x10E
            break;
        // End:0xFFFF
        default:
            // End:0x10E
            break;
            break;
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

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    //return;    
}

function PostPushFromPreviousScreen()
{
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x180
    if(LPPC != none)
    {
        OnlineSub = LPPC.OnlineSub;
        // End:0x180
        if(OnlineSub != none)
        {
            OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnLoginCancelled);
            OnlineSub.PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            OnlineSub.PlayerInterface.ClearLoginFailedDelegate(byte(Outer.GetLP().ControllerId), OnLoginFailed);
        }
    }
    //return;    
}

function OnViewClosed()
{
    Cleanup();
    super(SPGFxUIView).OnViewClosed();
    //return;    
}
