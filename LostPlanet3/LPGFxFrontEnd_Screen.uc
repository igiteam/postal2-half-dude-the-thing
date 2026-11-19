class LPGFxFrontEnd_Screen extends SPGFxUIViewSettingsMenuBase within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ViewTitle[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackBtn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FooterMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LogoMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HelpTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AcceptButtonHelpText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CancelButtonHelpText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AcceptButtonImage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CancelButtonImage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UserLabelTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UserNameTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPFrontEndMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OptionChangedSoundEventNameMP[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ListItemPressSoundEventNameMP[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ListChangeSoundEventNameMP[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NavBackSoundEventNameMP[1073741825];

function NotifyCheckpointEnumerationComplete()
{
    //return;    
}

function OnViewUnloaded()
{
    LPFrontEndMoviePlayer = none;
    super(SPGFxUIView).OnViewUnloaded();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    UpdateTitle();
    SuppressDefaultSoundEvents(false);
    //return;    
}

function OnViewStackPositionChanged()
{
    local /*0x97E50000-0x00000000*/ private name nextViewName[9437185];

    super.OnViewStackPositionChanged(nextViewName);
    SuppressDefaultSoundEvents(true);
    //return;    
}

function OnViewActivated()
{
    // End:0x42
    if(ListMC != none)
    {
        ListMC.SetFloat("selectedIndex", 0.0000000);
    }
    //return;    
}

function UpdateTitle()
{
    local /*0x97E50000-0x00000000*/ private @NULL ManagerTitleMC;

    // End:0x3A
    if(LPFrontEndMoviePlayer != none)
    {
        ManagerTitleMC = LPFrontEndMoviePlayer.Title;        
    }
    else
    {
        // End:0x83
        if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
        {
            ManagerTitleMC = LPGFxMoviePlayerPauseMenu(MoviePlayer).Title;
        }
    }
    // End:0xDD
    if(ManagerTitleMC != none)
    {
        ManagerTitleMC.GetObject("textField").SetText(ViewTitle);
    }
    //return;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];

    // End:0x1B
    if(bIsTopView != bDisableComponents)
    {
        return;
    }
    super.DisableSubComponents(bDisableComponents);
    // End:0x71
    if(BackBtn != none)
    {
        BackBtn.SetBool("disabled", bDisableComponents);
    }
    //return;    
}

function RefreshListFocus()
{
    UpdateListDataProvider();
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Description;
    local /*0x97E50000-0x00000000*/ private @NULL ManagerDescriptionMC;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    mySettingsList = GetSettingsList();
    // End:0x4B
    if(LPFrontEndMoviePlayer != none)
    {
        ManagerDescriptionMC = LPFrontEndMoviePlayer.Description;
    }
    // End:0x15A
    if(ManagerDescriptionMC != none)
    {
        Description = "";
        // End:0x15A
        if(mySettingsList.Length > 0)
        {
            SelectedIndex = 0;
            // End:0x15A
            if(ListMC != none)
            {
                SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
                SelectedIndex = GetSettingsListIndexFromDataIndex(SelectedIndex);
                // End:0x101
                if(SelectedIndex < 0)
                {
                    SelectedIndex = 0;
                }
                Description = mySettingsList[SelectedIndex].Description;
                ManagerDescriptionMC.SetText(Description);
            }
        }
    }
    //return;    
}

function UpdateSoundEvents()
{
    // End:0x7F
    if((LPFrontEndMoviePlayer != none) && LPFrontEndMoviePlayer.bIsMP)
    {
        OptionChangedSoundEventName = OptionChangedSoundEventNameMP;
        ListItemPressSoundEventName = ListItemPressSoundEventNameMP;
        ListChangeSoundEventName = ListChangeSoundEventNameMP;
        NavBackSoundEventName = NavBackSoundEventNameMP;
    }
    SuppressDefaultSoundEvents(true);
    //return;    
}

function SuppressDefaultSoundEvents()
{
    local /*0x97E50000-0x00000000*/ private bool bSuppress[8388609];

    bSoundEvents = ((bSuppress) ? false : default.bSoundEvents);
    //return;    
}

function OnViewLoaded()
{
    super(SPGFxUIView).OnViewLoaded();
    LPFrontEndMoviePlayer = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    UpdateSoundEvents();
    //return;    
}

function FocusIn_BackButton()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x31
    if(InfoTxt != none)
    {
        InfoTxt.SetText("");
    }
    //return;    
}

function UpdateHelpButtonImages()
{
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
        // End:0x10D
        case 'Help':
            HelpTxt = Widget.GetObject("textField");
            UpdateHelpButtonImages();
            HelpTxt.SetString("htmlText", (((((("<img vspace='-5' src='" $ AcceptButtonImage) $ "'>") @ AcceptButtonHelpText) @ "&nbsp;&nbsp;<img vspace='-5' src='") $ CancelButtonImage) $ "'>") @ CancelButtonHelpText);
            // End:0x335
            break;
        // End:0x189
        case 'Title':
            // End:0x186
            if(TitleMC == none)
            {
                TitleMC = Widget;
                TitleMC.GetObject("textField").SetText(ViewTitle);
            }
            // End:0x335
            break;
        // End:0x27D
        case 'back':
            BackBtn = GFxClikWidget(Widget.GetObject("btn", Class'GFxUI.GFxClikWidget'));
            BackBtn.SetString("label", "BACK");
            BackBtn.AddEventListener('CLIK_press', Select_Back);
            BackBtn.AddEventListener('CLIK_focusIn', FocusIn_BackButton);
            // End:0x335
            break;
        // End:0x29F
        case 'footer':
            FooterMC = Widget;
            // End:0x335
            break;
        // End:0x2F2
        case 'Info':
            // End:0x2EF
            if(InfoTxt == none)
            {
                InfoTxt = Widget.GetObject("textField");
            }
            // End:0x335
            break;
        // End:0x323
        case 'logo':
            // End:0x320
            if(LogoMC == none)
            {
                LogoMC = Widget;
            }
            // End:0x335
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x335
            break;
            break;
    }
    // End:0x374
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function FocusedTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function IsOptionDefaultsButton()
{
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if((ButtonName == 'XboxTypeS_X') || ButtonName == 'BackSpace')
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ConfirmDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialogMC;

    ConfirmDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', none, false));
    // End:0x24B
    if(ConfirmDialogMC != none)
    {
        ConfirmDialogMC.SetDefaultFocusedButton(0);
        ConfirmDialogMC.EnableDialogBackground(true);
        ConfirmDialogMC.SetNumberOfOptions(2);
        ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmDefaultsTitle>");
        ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmDefaultsInfo>");
        ConfirmDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmDialogMC.SetButtonOnPress(0, ConfirmDefaults_No);
        ConfirmDialogMC.SetButtonOnPress(1, ConfirmDefaults_Yes);
    }
    //return;    
}

function ConfirmDefaults_No()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function ConfirmDefaults_Yes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    ResetSettingsToDefaults();
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function ResetSettingsToDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, ProfileSettings;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private int I, ProfileSettingId;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x153
    if(LPPC != none)
    {
        ProfileSettings = LPProfileSettings(LPPC.ProfileSettings);
        // End:0x153
        if(ProfileSettings != none)
        {
            mySettingsList = GetSettingsList();
            I = 0;
            J0xA0:

            // End:0x112 [Loop If]
            if(I < mySettingsList.Length)
            {
                ProfileSettingId = mySettingsList[I].ProfileSettingId;
                ResetProfileSettingToDefault(ProfileSettings, ProfileSettingId);
                I++;
                // [Loop Continue]
                goto J0xA0;
            }
            LPPC.UpdateLocalCacheOfProfileSettings();
            UpdateListDataProvider();
            // End:0x153
            if(bIsTopView)
            {
                UpdateDescription();
            }
        }
    }
    //return;    
}

function ResetProfileSettingToDefault()
{
    local /*0x97E50000-0x00000000*/ private @NULL ProfileSettings[8388609];
    local /*0x97E50000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x97E50000-0x00000000*/ private byte ProfileMappingType;
    local /*0x97E50000-0x00000000*/ private int out_int, out_ListIndex;
    local /*0x97E50000-0x00000000*/ private float out_Float;
    local /*0x97E50000-0x00000000*/ private byte DataType;

    // End:0x200
    if(ProfileSettingId > 0)
    {
        // End:0x200
        if(ProfileSettings.GetProfileSettingMappingType(ProfileSettingId, ProfileMappingType))
        {
            // End:0xC5
            if(int(ProfileMappingType) == int(3))
            {
                ProfileSettings.GetProfileSettingDefaultId(ProfileSettingId, out_int, out_ListIndex);
                ProfileSettings.SetProfileSettingValueId(ProfileSettingId, out_int);                
            }
            else
            {
                // End:0x200
                if(int(ProfileMappingType) == int(0))
                {
                    DataType = ProfileSettings.GetProfileSettingDefaultType(ProfileSettingId);
                    // End:0x184
                    if(int(DataType) == int(1))
                    {
                        ProfileSettings.GetProfileSettingDefaultInt(ProfileSettingId, out_int);
                        ProfileSettings.SetProfileSettingValueInt(ProfileSettingId, out_int);                        
                    }
                    else
                    {
                        // End:0x1FD
                        if(int(DataType) == int(5))
                        {
                            ProfileSettings.GetProfileSettingDefaultFloat(ProfileSettingId, out_Float);
                            ProfileSettings.SetProfileSettingValueFloat(ProfileSettingId, out_Float);                            
                        }
                    }                    
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    OptionChangedSoundEventNameMP="NetLobbyMenuSelect"
    ListItemPressSoundEventNameMP="NetLobbyMenuConfirm"
    ListChangeSoundEventNameMP="NetLobbyMenuSelect"
    NavBackSoundEventNameMP="NetLobbyMenuBack"
    SubWidgetBindings=/* Array type was not detected. */
}