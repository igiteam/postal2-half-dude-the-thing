class LPGFxHUD_PauseMainMenu_MP extends SPGFxUIViewSettingsMenuBase within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPPauseMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ViewTitle[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSuicide;

function OnViewLoaded()
{
    super(SPGFxUIView).OnViewLoaded();
    LPPauseMoviePlayer = LPGFxMoviePlayerPauseMenu_MP(MoviePlayer);
    SetMPMode(LPPauseMoviePlayer.bMPMode);
    //return;    
}

function SetMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInMPMode[8388609];

    ActionScriptVoid("setMPMode");
    //return;    
}

function OnEscapeKeyPress()
{
    Outer.PlaySoundFromTheme('MenuSelect');
    super.OnEscapeKeyPress();
    //return;    
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

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, LPGameSettings, GameInterface;
    local /*0x97E50000-0x00000000*/ private bool bInternetMode;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private bool bRemoveSuicide, b360, bPS3;

    0
    bInternetMode = true;
    b360 = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
    bPS3 = Class'Engine.WorldInfo'.static.IsConsoleBuild(2);
    GameInterface = GetGameInterface();
    // End:0x143
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        GameSettings = GameInterface.GetGameSettings('Game');
        LPGameSettings = LPOnlineGameSettings(GameSettings);
        // End:0xFB
        if(LPGameSettings == none)
        {
        }
        // End:0x140
        if(GameSettings != none)
        {
            // End:0x13D
            if(!GameSettings.bIsLanMatch)
            {
                bInternetMode = true;                
            }            
        }        
    }
    HideOptionItemByName("Player List", !bInternetMode);
    HideOptionItemByName("Friends List", !bInternetMode);
    HideOptionItemByName("Invites", !bInternetMode);
    SetNumOptions(SettingsList.Length);
    // End:0x2B8
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        // End:0x2B8
        if(LPPlayerController(Outer.GetPC()).myLPHUD.ScoreboardIsShown() || LPPlayerController(Outer.GetPC()).myLPHUD.IsMunitionsLockerOpen())
        {
            RemoveOptionItemByName("Change Kits");
            SetNumOptions(SettingsList.Length);
        }
    }
    bRemoveSuicide = false;
    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x460
    if(LPPC != none)
    {
        // End:0x3C0
        if((((LPPC.MyPlayerPawn == none) || LPPC.MyPlayerPawn.HasDamageImmunityWithEffects()) || LPPC.IsInState('Dead')) || LPPC.IsInState('RoundEnded'))
        {
            bRemoveSuicide = true;            
        }
        else
        {
            // End:0x460
            if(LPPC.PlayerReplicationInfo != none)
            {
                // End:0x460
                if(LPPC.PlayerReplicationInfo.bTearOff || LPPC.PlayerReplicationInfo.bOutOfLives)
                {
                    bRemoveSuicide = true;
                }
            }
        }
    }
    HideOptionItemByName("Suicide", bRemoveSuicide);
    // End:0x4C0
    if(b360 || bPS3)
    {
        RemoveOptionItemByName("Invites");
        SetNumOptions(SettingsList.Length);
    }
    // End:0x50B
    if(!b360 && !bPS3)
    {
        RemoveOptionItemByName("Player List");
        SetNumOptions(SettingsList.Length);
    }
    super.UpdateListDataProvider(SelectedIndex);
    //return;    
}

function SetNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    ActionScriptVoid("setNumOptions");
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation && !LPPauseMoviePlayer.bLoadoutKitsOnly, previousView);
    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0xCB
    if(LPPC != none)
    {
        LPPC.myLPHUD.SleepHUDMessage(true);
    }
    UpdateTitle();
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super.OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'Resume':
            Select_Resume();
            // End:0x1E7
            break;
        // End:0xCE
        case 'Options':
            Select_Options();
            // End:0x1E7
            break;
        // End:0xE7
        case 'Audio':
            Select_Audio();
            // End:0x1E7
            break;
        // End:0x100
        case 'Video':
            Select_Video();
            // End:0x1E7
            break;
        // End:0x119
        case 'Controls':
            Select_Controls();
            // End:0x1E7
            break;
        // End:0x132
        case 'Gamma':
            Select_Gamma();
            // End:0x1E7
            break;
        // End:0x14B
        case 'ControlConfig':
            Select_ControlConfig();
            // End:0x1E7
            break;
        // End:0x164
        case 'Change Kits':
            Select_ChangeKits();
            // End:0x1E7
            break;
        // End:0x17D
        case 'Player List':
            Select_PlayerList();
            // End:0x1E7
            break;
        // End:0x196
        case 'Friends List':
            Select_FriendsList();
            // End:0x1E7
            break;
        // End:0x1AF
        case 'Invites':
            Select_Invites();
            // End:0x1E7
            break;
        // End:0x1C8
        case 'Suicide':
            Select_Suicide();
            // End:0x1E7
            break;
        // End:0x1E1
        case 'Quit':
            Select_Quit();
            // End:0x1E7
            break;
        // End:0xFFFF
        default:
            // End:0x1E7
            break;
            break;
    }
    //return;    
}

function Select_Resume()
{
    UnPause();
    //return;    
}

function Select_Options()
{
    MenuViewLoader.PushViewByName('Options', self);
    //return;    
}

function Select_Audio()
{
    MenuViewLoader.PushViewByName('OptionsAudio', self);
    //return;    
}

function Select_Video()
{
    // End:0x50
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild())
    {
        MenuViewLoader.PushViewByName('OptionsVideo', self);        
    }
    else
    {
        MenuViewLoader.PushViewByName('OptionsVideoPC', self);
    }
    //return;    
}

function Select_Controls()
{
    MenuViewLoader.PushViewByName('OptionsControls', self);
    //return;    
}

function Select_Gamma()
{
    MenuViewLoader.SpawnDialog('Gamma', self);
    //return;    
}

function Select_ControlConfig()
{
    MenuViewLoader.SpawnDialog('ControlConfig', self);
    //return;    
}

function Select_ChangeKits()
{
    MenuViewLoader.SpawnDialog('LoadoutKits', self);
    //return;    
}

function Select_PlayerList()
{
    MenuViewLoader.PushViewByName('PlayersList', self);
    //return;    
}

function Select_FriendsList()
{
    MenuViewLoader.PushViewByName('FriendsList', self);
    //return;    
}

function Select_Invites()
{
    MenuViewLoader.PushViewByName('Invites', self);
    //return;    
}

function Select_Quit()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExitDialogMC;

    bSuicide = false;
    ExitDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x6B
    if(ExitDialogMC != none)
    {
        SetUpExitDialog(ExitDialogMC);
    }
    //return;    
}

function SetUpExitDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExitDialogMC[8388609];
    local /*0x97E50000-0x00000000*/ private byte MyNetMode;

    ExitDialogMC.SetDefaultFocusedButton(0);
    ExitDialogMC.EnableDialogBackground(true);
    ExitDialogMC.SetNumberOfOptions(2);
    ExitDialogMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.MPQuitTitle>");
    MyNetMode = Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode;
    // End:0x16E
    if((int(MyNetMode) == int(1)) || int(MyNetMode) == int(2))
    {
        ExitDialogMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.MPQuitInfoHost>");        
    }
    else
    {
        ExitDialogMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.MPQuitInfo>");
    }
    ExitDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    ExitDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    ExitDialogMC.SetButtonOnPress(0, ExitDialog_SelectBack);
    ExitDialogMC.SetButtonOnPress(1, ExitDialog_SelectOK);
    //return;    
}

function Select_Suicide()
{
    local /*0x97E50000-0x00000000*/ private @NULL SuicideDialogMC;

    bSuicide = true;
    SuicideDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x6B
    if(SuicideDialogMC != none)
    {
        SetUpSuicideDialog(SuicideDialogMC);
    }
    //return;    
}

function SetUpSuicideDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL SuicideDialogMC[8388609];

    SuicideDialogMC.SetDefaultFocusedButton(0);
    SuicideDialogMC.EnableDialogBackground(true);
    SuicideDialogMC.SetNumberOfOptions(2);
    SuicideDialogMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.MPSuicideTitle>");
    SuicideDialogMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.MPSuicideInfo>");
    SuicideDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    SuicideDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    SuicideDialogMC.SetButtonOnPress(0, SuicideDialog_SelectBack);
    SuicideDialogMC.SetButtonOnPress(1, SuicideDialog_SelectOK);
    //return;    
}

function SuicideDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], LPPC;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x60
    if(LPPC != none)
    {
        LPPC.ServerSuicide();
    }
    UnPause();
    //return;    
}

function SuicideDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function NotifyViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;
    local /*0x97E50000-0x00000000*/ private @NULL InfoDialogMC;

    bHandled = super(SPGFxUIView).NotifyViewLoaded(View);
    // End:0x129
    if(bHandled == false)
    {
        // End:0x129
        if((MenuViewLoader.PendingViewLoad.ViewName == 'InfoDialog') && View.ViewName == 'InfoDialog')
        {
            InfoDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
            // End:0x11D
            if(InfoDialogMC != none)
            {
                // End:0x10A
                if(bSuicide)
                {
                    SetUpSuicideDialog(InfoDialogMC);                    
                }
                else
                {
                    SetUpExitDialog(InfoDialogMC);
                }
            }
            bHandled = true;
        }
    }
    return bHandled;
    //return ReturnValue;    
}

function ExitDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], LPPC, MPManager;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x217
    if(LPPC != none)
    {
        // End:0xA3
        if(int(LPPC.WorldInfo.NetMode) == int(NM_Standalone))
        {
            LPPC.ReturnToMainMenu();            
        }
        else
        {
            // End:0x1B0
            if(int(LPPC.Role) == int(ROLE_Authority))
            {
                MPManager = Class'LPMultiplayerManager'.static.GetInstance();
                // End:0x18E
                if(((MPManager != none) && MPManager.GetLPGameSettings() != none) && int(MPManager.GetLPGameSettings().GetSessionType()) == int(1))
                {
                    MPManager.KickNonPartyMembers();
                }
                LPPC.ReturnToPreGameLobby();                
            }
            else
            {
                // End:0x1F6
                if(Class'LPGameViewportClient'.static.IsTGSDemo())
                {
                    LPPC.ReturnToMainMenu();                    
                }
                else
                {
                    LPPC.ReturnToLastMenu();
                }
            }
        }
    }
    //return;    
}

function ExitDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function Select_BackImpl()
{
    LPPauseMoviePlayer.CheckSaveProfile();
    // End:0x31
    if((PopSettings()) == true)
    {
        return;
    }
    UnPause();
    //return;    
}

function UnPause()
{
    LPPauseMoviePlayer.PauseMenuClose();
    //return;    
}

function UpdateTitle()
{
    // End:0x62
    if(LPPauseMoviePlayer.Title != none)
    {
        LPPauseMoviePlayer.Title.SetText(ViewTitle);
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
        // End:0x60
        case 'TitleString':
            LPPauseMoviePlayer.Title = Widget;
            UpdateTitle();
            // End:0x177
            break;
        // End:0xC9
        case 'SelectString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonAcceptSelect>"));
            // End:0x177
            break;
        // End:0x12A
        case 'ConfirmString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x177
            break;
        // End:0x165
        case 'BackString':
            Widget.SetText(GetLocalizedString(""));
            // End:0x177
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x177
            break;
            break;
    }
    // End:0x1B6
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.PauseMenu.MPPauseTitle>"
    SettingsList=/* Array type was not detected. */
    bDisableRenderer3DEffects=true
}