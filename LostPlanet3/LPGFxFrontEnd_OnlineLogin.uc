class LPGFxFrontEnd_OnlineLogin extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TravelURL;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OldTypeKey[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UsernameTextField;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PasswordTextField;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UserName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Password;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CreatedUsername;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CreatedPassword;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TermsAndConditionsButton;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExitOnTopmost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDialogActive;

function SetTravelURL()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string _url[8388609];

    TravelURL = _url;
    //return;    
}

function ErrorResponseDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ErrorPostfix[8388609];
    local /*0x97E50000-0x00000000*/ private bool bExitOnDone[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    false
    // End:0x14
    if(bDialogActive)
    {
        return;
    }
    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x274
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(1);
        ConfirmMC.SetTitle(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineLogin.ErrorResponseDialogTitle_" $ ErrorPostfix) $ ">");
        ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineLogin.ErrorResponseDialogBody_" $ ErrorPostfix) $ ">");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineLogin.ErrorResponseDialog_OK>");
        ConfirmMC.SetButtonOnPress(0, cbErrorResponseDialog_OK);
        bExitOnTopmost = bExitOnDone;
        bDialogActive = true;
    }
    //return;    
}

function cbErrorResponseDialog_OK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    bDialogActive = false;
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    LPGFxMoviePlayerFrontEndManager(MoviePlayer).bIsInGamespyLoginScreen = false;
    //return;    
}

function ValidateName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InName[8388609], outErrorPrefix;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iAt, iDot, I, C, L;

    L = Len(InName);
    // End:0x39
    if(L <= 0)
    {
        outErrorPrefix = "Invalid";
        return false;
    }
    iAt = InStr(InName, "@");
    iDot = InStr(InName, ".");
    // End:0x23E
    if((iAt > 0) && iDot > 0)
    {
        // End:0x104
        if((((iAt > iDot) || iAt == 0) || iDot == (iAt + 1)) || InStr(InName, "..") >= 0)
        {
            outErrorPrefix = "Malformed";
            return false;
        }
        I = 0;
        J0x10F:

        // End:0x23B [Loop If]
        if(I < L)
        {
            C = Asc(InName);
            // End:0x202
            if((((((((C == 37) || C == 43) || C == 45) || C == 46) || C == 95) || (C >= 48) && C <= 57) || (C >= 64) && C <= 90) || (C >= 97) && C <= 122)
            {                
            }
            else
            {
                outErrorPrefix = "Invalid";
                return false;
            }
            InName = Right(InName, 1);
            ++I;
            // [Loop Continue]
            goto J0x10F;
        }        
    }
    else
    {
        I = 0;
        J0x249:

        // End:0x375 [Loop If]
        if(I < L)
        {
            C = Asc(InName);
            // End:0x33C
            if((((((((C == 37) || C == 43) || C == 45) || C == 46) || C == 95) || (C >= 48) && C <= 57) || (C >= 64) && C <= 90) || (C >= 97) && C <= 122)
            {                
            }
            else
            {
                outErrorPrefix = "Invalid";
                return false;
            }
            InName = Right(InName, 1);
            ++I;
            // [Loop Continue]
            goto J0x249;
        }
    }
    outErrorPrefix = "";
    return true;
    //return ReturnValue;    
}

function GetLoginStatus()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LP;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    LPPC = LPPlayerController(Outer.GetPC());
    LP = LocalPlayer(LPPC.Player);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(LP.ControllerId));
    return LoginStatus;
    //return ReturnValue;    
}

function cbLoginChanged()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC, LPS;

    ShowBusyIcon(false);
    Outer.GetPC().ClearTimer('LoginTimedOut', self);
    // End:0x1D0
    if(int(GetLoginStatus()) == int(2))
    {
        LPC = LPPlayerController(MoviePlayer.GetPC());
        // End:0xD1
        if(LPC != none)
        {
            LPS = LPProfileSettings(LPC.ProfileSettings);
        }
        // End:0x182
        if(LPS != none)
        {
            LPS.SetOnlineAccountUsername(UserName);
            LPS.SetOnlineAccountPassword(Password);
            UserName = LPS.GetOnlineAccountUsername();
            Password = LPS.GetOnlineAccountPassword();
        }
        Cleanup();
        Class'Engine.WorldInfo'.static.GetWorldInfo().ServerTravel(TravelURL);        
    }
    else
    {
        ErrorResponseDialog("LoginFailed", false);
    }
    //return;    
}

function cbLoginFailed()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609], ErrorCode;

    ShowBusyIcon(false);
    Outer.GetPC().ClearTimer('LoginTimedOut', self);
    ErrorResponseDialog("LoginFailed", false);
    //return;    
}

function LoginTimedOut()
{
    Outer.GetPC().ClearTimer('LoginTimedOut', self);
    ShowBusyIcon(false);
    ErrorResponseDialog("LoginFailed", false);
    //return;    
}

function AttemptLogin()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize string errorPrefix;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    LPGFxMoviePlayerFrontEndManager(MoviePlayer).bIsInGamespyLoginScreen = false;
    bOk = ValidateName(UserName, errorPrefix);
    // End:0x7E
    if(!bOk)
    {
        ErrorResponseDialog(errorPrefix $ "Nick", false);
        return;
    }
    // End:0xAD
    if(Len(Password) <= 0)
    {
        ErrorResponseDialog("InvalidPassword", false);
        return;
    }
    LPGFxMoviePlayerFrontEndManager(MoviePlayer).bIsInGamespyLoginScreen = true;
    ShowBusyIcon(true);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.AddLoginChangeDelegate(cbLoginChanged);
    OnlineSub.PlayerInterface.AddLoginFailedDelegate(byte(Outer.GetLP().ControllerId), cbLoginFailed);
    Outer.GetPC().SetTimer(10.0000000, false, 'LoginTimedOut', self);
    // End:0x2B3
    if(!OnlineSub.PlayerInterface.Login(byte(Outer.GetLP().ControllerId), UserName, Password, false))
    {
        ShowBusyIcon(false);
        ErrorResponseDialog("LoginFailed", false);
        return;
    }
    //return;    
}

function cbCreateCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte ErrorCode[8388609];

    ShowBusyIcon(false);
    Outer.GetPC().ClearTimer('CreateTimedOut', self);
    switch(ErrorCode)
    {
        // End:0x95
        case 0:
            UserName = CreatedUsername;
            Password = CreatedPassword;
            AttemptLogin();
            // End:0x127
            break;
        // End:0x9A
        case 2:
        // End:0xBB
        case 4:
            ErrorResponseDialog("CreateFailed", false);
            // End:0x127
            break;
        // End:0xDF
        case 3:
            ErrorResponseDialog("InvalidPassword", false);
            // End:0x127
            break;
        // End:0xFE
        case 5:
            ErrorResponseDialog("UniqueNick", false);
            // End:0x127
            break;
        // End:0x103
        case 6:
        // End:0x108
        case 1:
        // End:0xFFFF
        default:
            ErrorResponseDialog("CreateFailed", true);
            // End:0x127
            break;
            break;
    }
    //return;    
}

function CreateTimedOut()
{
    Outer.GetPC().ClearTimer('CreateTimedOut', self);
    ShowBusyIcon(false);
    ErrorResponseDialog("CreateFailed", false);
    //return;    
}

function AttemptAccountCreation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NickName[8388609], Email, createPass, confirmPass, country, dobDay,
	    dobMonth, dobYear;

    local /*0x97E50000-0x00000000*/ private bool bAcceptTerms[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize string errorPrefix;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    LPGFxMoviePlayerFrontEndManager(MoviePlayer).bIsInGamespyLoginScreen = false;
    bOk = ValidateName(NickName, errorPrefix);
    // End:0x7E
    if(!bOk)
    {
        ErrorResponseDialog(errorPrefix $ "Nick", false);
        return;
    }
    bOk = ValidateName(Email, errorPrefix);
    // End:0xD3
    if(!bOk)
    {
        ErrorResponseDialog(errorPrefix $ "Email", false);
        return;
    }
    // End:0x102
    if(Len(createPass) <= 0)
    {
        ErrorResponseDialog("InvalidPassword", false);
        return;
    }
    // End:0x138
    if(createPass != confirmPass)
    {
        ErrorResponseDialog("MatchingPassword", false);
        return;
    }
    // End:0x161
    if(!bAcceptTerms)
    {
        ErrorResponseDialog("AcceptTerms", false);
        return;
    }
    LPGFxMoviePlayerFrontEndManager(MoviePlayer).bIsInGamespyLoginScreen = true;
    CreatedUsername = NickName;
    CreatedPassword = createPass;
    ShowBusyIcon(true);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.AccountInterface.AddCreateOnlineAccountCompletedDelegate(cbCreateCompleted);
    Outer.GetPC().SetTimer(10.0000000, false, 'CreateTimedOut', self);
    // End:0x2E5
    if(!OnlineSub.AccountInterface.CreateOnlineAccount(NickName, createPass, Email))
    {
        ShowBusyIcon(false);
        ErrorResponseDialog("CreateFailed", false);
        return;
    }
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    bDialogActive = false;
    Outer.GetPC().ClearTimer('LoginTimedOut', self);
    Outer.GetPC().ClearTimer('CreateTimedOut', self);
    ShowBusyIcon(false);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ClearLoginChangeDelegate(cbLoginChanged);
    OnlineSub.PlayerInterface.ClearLoginFailedDelegate(byte(Outer.GetLP().ControllerId), cbLoginFailed);
    OnlineSub.AccountInterface.ClearCreateOnlineAccountCompletedDelegate(cbCreateCompleted);
    OnViewClosed();
    Outer.SetExternalInterface(MoviePlayer);
    LPGFxMoviePlayerFrontEndManager(MoviePlayer).bIsInGamespyLoginScreen = false;
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPC, LPS;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x1E9
    if(bPlayOpenAnimation)
    {
        bDialogActive = false;
        Outer.SetExternalInterface(self);
        ShowCreateAccount(false);
        DisableTabConsole();
        LPC = LPPlayerController(MoviePlayer.GetPC());
        // End:0xEF
        if(LPC != none)
        {
            LPS = LPProfileSettings(LPC.ProfileSettings);
        }
        // End:0x1E6
        if(LPS != none)
        {
            UserName = LPS.GetOnlineAccountUsername();
            Password = LPS.GetOnlineAccountPassword();
            // End:0x19B
            if((UsernameTextField != none) && Len(UserName) > 0)
            {
                UsernameTextField.SetText(UserName);
            }
            // End:0x1E6
            if((PasswordTextField != none) && Len(Password) > 0)
            {
                PasswordTextField.SetText(Password);
            }
        }        
    }
    else
    {
        // End:0x20C
        if(previousView == 'InfoDialog')
        {
            bDialogActive = false;
        }
        // End:0x223
        if(bExitOnTopmost)
        {
            OnEscapeKeyPress();
        }
    }
    //return;    
}

function OnViewClosed()
{
    EnableTabConsole();
    Cleanup();
    super.OnViewClosed();
    //return;    
}

function DisableTabConsole()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPGVC;

    LP = Class'SPEngine.SPUtil'.static.GetPlayerOwner(0);
    // End:0xF3
    if(LP != none)
    {
        LPGVC = LPGameViewportClient(LP.ViewportClient);
        // End:0xF3
        if(LPGVC != none)
        {
            OldTypeKey = LPGVC.ViewportConsole.TypeKey;
            LPGVC.ViewportConsole.TypeKey = 'None';
        }
    }
    //return;    
}

function EnableTabConsole()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPGVC;

    LP = Class'SPEngine.SPUtil'.static.GetPlayerOwner(0);
    // End:0xB6
    if(LP != none)
    {
        LPGVC = LPGameViewportClient(LP.ViewportClient);
        // End:0xB6
        if(LPGVC != none)
        {
            LPGVC.ViewportConsole.TypeKey = OldTypeKey;
        }
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;

    LocalizedString = GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineLogin.Widget_" $ string(WidgetName)) $ ">");
    switch(WidgetName)
    {
        // End:0xA8
        case 'termsButton':
            SetTermsRadioButtonText(LocalizedString);
            TermsAndConditionsButton = Widget;
            return true;
        // End:0xEB
        case 'loginID':
            UsernameTextField = Widget;
            Widget.SetText("");
            return true;
        // End:0x12E
        case 'loginPassword':
            PasswordTextField = Widget;
            Widget.SetText("");
            return true;
        // End:0x14F
        case 'createButton':
            SetCreateAccountButtonText(LocalizedString);
            return true;
        // End:0x170
        case 'cancelIDCreationButton':
            SetCancelIDCreationButtonText(LocalizedString);
            return true;
        // End:0x191
        case 'createNewAccountButton':
            SetNewAccountButtonText(LocalizedString);
            return true;
        // End:0x1B2
        case 'acceptButton':
            SetAcceptButtonText(LocalizedString);
            return true;
        // End:0x1D3
        case 'cancelButton':
            SetCancelButtonText(LocalizedString);
            return true;
        // End:0xFFFF
        default:
            // End:0x217
            if(IsLocalizationSuccessful(LocalizedString))
            {
                Widget.SetText(LocalizedString);
                return true;
            }
            return super.WidgetInitialized(WidgetName, WidgetPath, Widget);
            break;
    }
    //return ReturnValue;    
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
    return false;
    //return ReturnValue;    
}

function ShowBusyIcon()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showBusyIcon");
    //return;    
}

function RequestLogin()
{
    ActionScriptVoid("acceptButtonClicked");
    //return;    
}

function SetAcceptButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string T[8388609];

    ActionScriptVoid("setAcceptButtonText");
    //return;    
}

function SetCancelButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string T[8388609];

    ActionScriptVoid("setCancelButtonText");
    //return;    
}

function SetLoginIdHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setLoginIdHeaderText");
    //return;    
}

function SetLoginPasswordHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setLoginPasswordHeaderText");
    //return;    
}

function SetNewAccountButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setNewAccountButtonText");
    //return;    
}

function SetCancelIDCreationButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setCancelIDCreationButtonText");
    //return;    
}

function SetCreateAccountButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setCreateAccountButtonText");
    //return;    
}

function AddCountryDropdownOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("addCountryDropdownOption");
    //return;    
}

function AddDayDropdownOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("addDayDropdownOption");
    //return;    
}

function AddMonthDropdownOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("addMonthDropdownOption");
    //return;    
}

function AddYearDropdownOption()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("addYearDropdownOption");
    //return;    
}

function SetTermsRadioButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setTermsRadioButtonText");
    //return;    
}

function SetTOSText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setTOSText");
    //return;    
}

function SetMessageText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    ActionScriptVoid("setMessageText");
    //return;    
}

function ShowCreateAccount()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;

    ActionScriptVoid("bShowCreateAccount");
    // End:0x52
    if(bShow)
    {
        dummyButton = GetObject("nicknameField");        
    }
    else
    {
        dummyButton = GetObject("loginID");
        // End:0xB4
        if(dummyButton != none)
        {
            dummyButton = dummyButton.GetObject("textField");
        }
    }
    // End:0xEB
    if(dummyButton != none)
    {
        MenuViewLoader.SetSelectionFocus(dummyButton);
    }
    //return;    
}

function LoginScreen()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Option[8388609], loginID, Email, pass, confirmPass, country,
	    dobDay, dobMonth, dobYear;

    local /*0x97E50000-0x00000000*/ private bool bAcceptTerms[8388609];

    switch(Option)
    {
        // End:0x58
        case "AcceptClicked":
            UserName = loginID;
            Password = pass;
            AttemptLogin();
            // End:0x161
            break;
        // End:0x77
        case "CancelClicked":
            OnEscapeKeyPress();
            // End:0x161
            break;
        // End:0xB1
        case "CancelAccountCreationClicked":
            ShowBusyIcon(false);
            ShowCreateAccount(false);
            // End:0x161
            break;
        // End:0xE6
        case "CreateNewAccountClicked":
            ShowBusyIcon(false);
            ShowCreateAccount(false);
            // End:0x161
            break;
        // End:0x15E
        case "CreateAccountClicked":
            AttemptAccountCreation(loginID, Email, pass, confirmPass, country, dobDay, dobMonth, dobYear, bAcceptTerms);
            // End:0x161
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}
