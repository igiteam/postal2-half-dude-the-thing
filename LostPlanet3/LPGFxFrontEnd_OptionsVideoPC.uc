class LPGFxFrontEnd_OptionsVideoPC extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Settings;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WindowMode_Windowed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WindowMode_FullScreen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AAMode_1X;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AAMode_2X;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AAMode_4X;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string On;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Off;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Detail_Level1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Detail_Level2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Detail_Level3;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Detail_Level4;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Detail_Level5;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnsavedChanges;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x90
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(true, "<Strings:LostPlanetGame.FrontEnd.OptionDefaults>");
    }
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    // End:0x3A
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(false);
    }
    //return;    
}

function Select_BackImpl()
{
    bUnsavedChanges = HasUnappliedChanges();
    // End:0x2E
    if(bUnsavedChanges)
    {
        ConfirmUnsavedChanges();
        return;
    }
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x63
    if(IsOptionDefaultsButton(ButtonName))
    {
        // End:0x61
        if(int(InputEvent) == int(0))
        {
            ConfirmDefaults();
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnViewLoaded()
{
    super.OnViewLoaded();
    // End:0x31
    if(Settings == none)
    {
        Settings = new Class'LPSettingsWrapper';
    }
    Settings.InitFromGlobalSettings();
    bUnsavedChanges = false;
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private bool bIsMPHUD;

    0
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x46
    if(bUnsavedChanges)
    {
        return;
    }
    // End:0x137
    if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
    {
        // End:0xAF
        if(LPPC != none)
        {
            bIsMPHUD = LPPC.HUDContentClass.default.bIsMultiplayerHUD;            
        }
        else
        {
            bIsMPHUD = int(Outer.GetPC().WorldInfo.NetMode) != int(NM_Standalone);
        }
        // End:0x137
        if(bIsMPHUD == false)
        {
            RemoveOptionItemByName("CreditsForDamage");
        }
    }
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
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
        case 'Gamma':
            Select_Gamma();
            // End:0xD4
            break;
        // End:0xCE
        case 'Apply':
            ConfirmApplySettings();
            // End:0xD4
            break;
        // End:0xFFFF
        default:
            // End:0xD4
            break;
            break;
    }
    //return;    
}

function Select_Gamma()
{
    MenuViewLoader.SpawnDialog('Gamma', self);
    //return;    
}

function SetupSettingsObject()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Option[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Values;
    local /*0x97E50000-0x00000000*/ private @NULL TempObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DefaultValue;
    local /*0x97E50000-0x00000000*/ private int DefaultIndex;
    local /*0x97E50000-0x00000000*/ private @NULL RendererDataProvider;
    local /*0x97E50000-0x00000000*/ private float DefaultRawValue;
    local /*0x97E50000-0x00000000*/ private int newOptIndex;

    TempObj = Outer.CreateObject("Object");
    TempObj.SetString("label", Option.FriendlyName);
    TempObj.SetString("control", Option.OptionType);
    RendererDataProvider = Outer.CreateArray();
    // End:0x272
    if(Option.OptionName == "Resolution")
    {
        Settings.GetSupportedResoultions(Values);
        I = 0;
        J0x144:

        // End:0x1A5 [Loop If]
        if(I < Values.Length)
        {
            RendererDataProvider.SetElementString(I, Values[I]);
            I++;
            // [Loop Continue]
            goto J0x144;
        }
        TempObj.SetObject("dataProvider", RendererDataProvider);
        newOptIndex = Settings.CurrentResolution;
        TempObj.SetFloat("optIndex", float(newOptIndex));
        TempObj.SetFloat("prevOptIndex", float(newOptIndex));        
    }
    else
    {
        // End:0x3C6
        if(Option.OptionName == "WindowMode")
        {
            RendererDataProvider.SetElementString(0, WindowMode_Windowed);
            RendererDataProvider.SetElementString(1, WindowMode_FullScreen);
            TempObj.SetObject("dataProvider", RendererDataProvider);
            newOptIndex = ((Settings.bFullScreen) ? 1 : 0);
            TempObj.SetFloat("optIndex", float(newOptIndex));
            TempObj.SetFloat("prevOptIndex", float(newOptIndex));            
        }
        else
        {
            // End:0x572
            if(Option.OptionName == "AntiAlias")
            {
                RendererDataProvider.SetElementString(0, AAMode_1X);
                RendererDataProvider.SetElementString(1, AAMode_2X);
                RendererDataProvider.SetElementString(2, AAMode_4X);
                TempObj.SetObject("dataProvider", RendererDataProvider);
                // End:0x4D8
                if(Settings.MultiSamples == 4)
                {
                    newOptIndex = 2;                    
                }
                else
                {
                    newOptIndex = Settings.MultiSamples - 1;
                }
                TempObj.SetFloat("optIndex", float(newOptIndex));
                TempObj.SetFloat("prevOptIndex", float(newOptIndex));                
            }
            else
            {
                // End:0x6C1
                if(Option.OptionName == "VSync")
                {
                    RendererDataProvider.SetElementString(0, Off);
                    RendererDataProvider.SetElementString(1, On);
                    TempObj.SetObject("dataProvider", RendererDataProvider);
                    newOptIndex = ((Settings.bVsync) ? 1 : 0);
                    TempObj.SetFloat("optIndex", float(newOptIndex));
                    TempObj.SetFloat("prevOptIndex", float(newOptIndex));                    
                }
                else
                {
                    // End:0x894
                    if(Option.OptionName == "TextureQuality")
                    {
                        RendererDataProvider.SetElementString(0, Detail_Level1);
                        RendererDataProvider.SetElementString(1, Detail_Level2);
                        RendererDataProvider.SetElementString(2, Detail_Level3);
                        RendererDataProvider.SetElementString(3, Detail_Level4);
                        RendererDataProvider.SetElementString(4, Detail_Level5);
                        TempObj.SetObject("dataProvider", RendererDataProvider);
                        newOptIndex = Clamp(Settings.TextureLevel, 0, 4);
                        TempObj.SetFloat("optIndex", float(newOptIndex));
                        TempObj.SetFloat("prevOptIndex", float(newOptIndex));                        
                    }
                    else
                    {
                        // End:0xA64
                        if(Option.OptionName == "WorldDetail")
                        {
                            RendererDataProvider.SetElementString(0, Detail_Level1);
                            RendererDataProvider.SetElementString(1, Detail_Level2);
                            RendererDataProvider.SetElementString(2, Detail_Level3);
                            RendererDataProvider.SetElementString(3, Detail_Level4);
                            RendererDataProvider.SetElementString(4, Detail_Level5);
                            TempObj.SetObject("dataProvider", RendererDataProvider);
                            newOptIndex = Clamp(Settings.WorldLevel, 0, 4);
                            TempObj.SetFloat("optIndex", float(newOptIndex));
                            TempObj.SetFloat("prevOptIndex", float(newOptIndex));                            
                        }
                        else
                        {
                            // End:0xBB8
                            if(Option.OptionName == "MotionBlur")
                            {
                                RendererDataProvider.SetElementString(0, Off);
                                RendererDataProvider.SetElementString(1, On);
                                TempObj.SetObject("dataProvider", RendererDataProvider);
                                newOptIndex = ((Settings.bMotionBlur) ? 1 : 0);
                                TempObj.SetFloat("optIndex", float(newOptIndex));
                                TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                
                            }
                            else
                            {
                                // End:0xD0E
                                if(Option.OptionName == "DepthOfField")
                                {
                                    RendererDataProvider.SetElementString(0, Off);
                                    RendererDataProvider.SetElementString(1, On);
                                    TempObj.SetObject("dataProvider", RendererDataProvider);
                                    newOptIndex = ((Settings.bDepthOfField) ? 1 : 0);
                                    TempObj.SetFloat("optIndex", float(newOptIndex));
                                    TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                    
                                }
                                else
                                {
                                    // End:0xE68
                                    if(Option.OptionName == "AmbientOcclusion")
                                    {
                                        RendererDataProvider.SetElementString(0, Off);
                                        RendererDataProvider.SetElementString(1, On);
                                        TempObj.SetObject("dataProvider", RendererDataProvider);
                                        newOptIndex = ((Settings.bAmbientOcclusion) ? 1 : 0);
                                        TempObj.SetFloat("optIndex", float(newOptIndex));
                                        TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                        
                                    }
                                    else
                                    {
                                        // End:0xFB7
                                        if(Option.OptionName == "Bloom")
                                        {
                                            RendererDataProvider.SetElementString(0, Off);
                                            RendererDataProvider.SetElementString(1, On);
                                            TempObj.SetObject("dataProvider", RendererDataProvider);
                                            newOptIndex = ((Settings.bBloom) ? 1 : 0);
                                            TempObj.SetFloat("optIndex", float(newOptIndex));
                                            TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                            
                                        }
                                        else
                                        {
                                            // End:0x110C
                                            if(Option.OptionName == "LightShafts")
                                            {
                                                RendererDataProvider.SetElementString(0, Off);
                                                RendererDataProvider.SetElementString(1, On);
                                                TempObj.SetObject("dataProvider", RendererDataProvider);
                                                newOptIndex = ((Settings.bLightShafts) ? 1 : 0);
                                                TempObj.SetFloat("optIndex", float(newOptIndex));
                                                TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                                
                                            }
                                            else
                                            {
                                                // End:0x1264
                                                if(Option.OptionName == "DynamicShadows")
                                                {
                                                    RendererDataProvider.SetElementString(0, Off);
                                                    RendererDataProvider.SetElementString(1, On);
                                                    TempObj.SetObject("dataProvider", RendererDataProvider);
                                                    newOptIndex = ((Settings.bDynamicShadows) ? 1 : 0);
                                                    TempObj.SetFloat("optIndex", float(newOptIndex));
                                                    TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                                    
                                                }
                                                else
                                                {
                                                    // End:0x1435
                                                    if(Option.OptionName == "ShadowDetail")
                                                    {
                                                        RendererDataProvider.SetElementString(0, Detail_Level1);
                                                        RendererDataProvider.SetElementString(1, Detail_Level2);
                                                        RendererDataProvider.SetElementString(2, Detail_Level3);
                                                        RendererDataProvider.SetElementString(3, Detail_Level4);
                                                        RendererDataProvider.SetElementString(4, Detail_Level5);
                                                        TempObj.SetObject("dataProvider", RendererDataProvider);
                                                        newOptIndex = Clamp(Settings.ShadowLevel, 0, 4);
                                                        TempObj.SetFloat("optIndex", float(newOptIndex));
                                                        TempObj.SetFloat("prevOptIndex", float(newOptIndex));                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x16A8
                                                        if(Option.ProfileSettingId > 0)
                                                        {
                                                            PopulateOptionDataProviderForIndex(Option.ProfileSettingId, Option.OptionType, RendererDataProvider, DefaultValue, DefaultIndex, DefaultRawValue);
                                                            TempObj.SetObject("dataProvider", RendererDataProvider);
                                                            newOptIndex = DefaultIndex;
                                                            TempObj.SetFloat("optIndex", float(newOptIndex));
                                                            TempObj.SetFloat("prevOptIndex", float(newOptIndex));
                                                            TempObj.SetFloat("minimum", Option.RawValueMin);
                                                            TempObj.SetFloat("maximum", Option.RawValueMax);
                                                            TempObj.SetFloat("value", DefaultRawValue);
                                                            TempObj.SetFloat("prevValue", DefaultRawValue);
                                                            TempObj.SetFloat("snapInterval", Option.SliderSnapInterval);                                                            
                                                        }
                                                        else
                                                        {
                                                            TempObj.SetFloat("optIndex", 0.0000000);
                                                            TempObj.SetFloat("prevOptIndex", 0.0000000);
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
    TempObj.SetBool("bUpdateFromUnreal", true);
    TempObj.SetBool("bNumericCombo", Option.bNumericCombo);
    TempObj.SetBool("bEditableCombo", Option.bEditableCombo);
    TempObj.SetFloat("editBoxMaxLength", float(Option.EditBoxMaxLength));
    return TempObj;
    //return ReturnValue;    
}

function OnOptionChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    super(SPGFxUIViewSettingsMenuBase).OnOptionChanged(ev);
    //return;    
}

function OnListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    super(SPGFxUIViewSettingsMenuBase).OnListChange(ev);
    //return;    
}

function ConfirmUnsavedChanges()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog;

    ConfirmDialog = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x5F
    if(ConfirmDialog != none)
    {
        SetUpConfirmUnsavedChangesDialog(ConfirmDialog);
    }
    //return;    
}

function SetUpConfirmUnsavedChangesDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog[8388609];

    ConfirmDialog.SetDefaultFocusedButton(0);
    ConfirmDialog.EnableDialogBackground(true);
    ConfirmDialog.SetNumberOfOptions(2);
    ConfirmDialog.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsVideoPC.UnsavedChangesTitle>");
    ConfirmDialog.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsVideoPC.UnsavedChangesInfo>");
    ConfirmDialog.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    ConfirmDialog.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    ConfirmDialog.SetButtonOnPress(0, ConfirmUnsavedChanges_SelectBack);
    ConfirmDialog.SetButtonOnPress(1, ConfirmUnsavedChanges_SelectOK);
    //return;    
}

function ConfirmUnsavedChanges_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function ConfirmUnsavedChanges_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    bUnsavedChanges = false;
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    Select_BackImpl();
    //return;    
}

function ConfirmationTimeOut()
{
    CancelSettingsChange();
    //return;    
}

function ConfirmApplySettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog;

    ApplySettings();
    Outer.GetPC().SetTimer(30.0000000, false, 'ConfirmationTimeOut', self);
    ConfirmDialog = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0xA7
    if(ConfirmDialog != none)
    {
        SetUpConfirmDialog(ConfirmDialog);
    }
    //return;    
}

function SetUpConfirmDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog[8388609];

    ConfirmDialog.SetDefaultFocusedButton(0);
    ConfirmDialog.EnableDialogBackground(true);
    ConfirmDialog.SetNumberOfOptions(2);
    ConfirmDialog.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsVideoPC.ConfirmTitle>");
    ConfirmDialog.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsVideoPC.ConfirmInfo>");
    ConfirmDialog.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    ConfirmDialog.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    ConfirmDialog.SetButtonOnPress(0, ConfirmDialog_SelectBack);
    ConfirmDialog.SetButtonOnPress(1, ConfirmDialog_SelectOK);
    //return;    
}

function NotifyViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog;

    bHandled = super(SPGFxUIView).NotifyViewLoaded(View);
    // End:0x106
    if(bHandled == false)
    {
        // End:0x106
        if((MenuViewLoader.PendingViewLoad.ViewName == 'InfoDialog') && View.ViewName == 'InfoDialog')
        {
            ConfirmDialog = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
            // End:0xFA
            if(ConfirmDialog != none)
            {
                SetUpConfirmDialog(ConfirmDialog);
            }
            bHandled = true;
        }
    }
    return bHandled;
    //return ReturnValue;    
}

function ConfirmDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    Outer.GetPC().ClearTimer('ConfirmationTimeOut', self);
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    bUnsavedChanges = false;
    //return;    
}

function ConfirmDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    CancelSettingsChange();
    //return;    
}

function CancelSettingsChange()
{
    Outer.GetPC().ClearTimer('ConfirmationTimeOut', self);
    Settings.RestoreSettings();
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function HasUnappliedChanges()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Data;
    local /*0x97E50000-0x00000000*/ private int I, setting;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private float DataProviderLength;
    local /*0x97E50000-0x00000000*/ private int SettingsIndex;
    local /*0x97E50000-0x00000000*/ private bool bTemp;
    local /*0x97E50000-0x00000000*/ private float fTemp;

    mySettingsList = GetSettingsList();
    DataProviderLength = ListDataProvider.GetFloat("length");
    I = 0;
    J0x50:

    // End:0x95E [Loop If]
    if(float(I) < DataProviderLength)
    {
        SettingsIndex = GetSettingsListIndexFromDataIndex(I);
        // End:0xB2
        if((SettingsIndex < 0) || SettingsIndex >= mySettingsList.Length)
        {            
        }
        else
        {
            Data = ListDataProvider.GetElementObject(I);
            // End:0x182
            if(mySettingsList[SettingsIndex].OptionName == "Resolution")
            {
                fTemp = Data.GetFloat("optIndex");
                // End:0x17F
                if(float(Settings.CurrentResolution) != fTemp)
                {
                    return true;
                }                
            }
            else
            {
                // End:0x225
                if(mySettingsList[SettingsIndex].OptionName == "WindowMode")
                {
                    bTemp = Data.GetFloat("optIndex") == float(1);
                    // End:0x222
                    if(Settings.bFullScreen != bTemp)
                    {
                        return true;
                    }                    
                }
                else
                {
                    // End:0x2FD
                    if(mySettingsList[SettingsIndex].OptionName == "AntiAlias")
                    {
                        setting = int(Data.GetFloat("optIndex"));
                        // End:0x2B2
                        if(setting == 2)
                        {
                            fTemp = 4.0000000;                            
                        }
                        else
                        {
                            fTemp = float(setting + 1);
                        }
                        // End:0x2FA
                        if(float(Settings.MultiSamples) != fTemp)
                        {
                            return true;
                        }                        
                    }
                    else
                    {
                        // End:0x39B
                        if(mySettingsList[SettingsIndex].OptionName == "VSync")
                        {
                            bTemp = Data.GetFloat("optIndex") == float(1);
                            // End:0x398
                            if(Settings.bVsync != bTemp)
                            {
                                return true;
                            }                            
                        }
                        else
                        {
                            // End:0x43C
                            if(mySettingsList[SettingsIndex].OptionName == "TextureQuality")
                            {
                                fTemp = Data.GetFloat("optIndex");
                                // End:0x439
                                if(float(Settings.TextureLevel) != fTemp)
                                {
                                    return true;
                                }                                
                            }
                            else
                            {
                                // End:0x4DA
                                if(mySettingsList[SettingsIndex].OptionName == "WorldDetail")
                                {
                                    fTemp = Data.GetFloat("optIndex");
                                    // End:0x4D7
                                    if(float(Settings.WorldLevel) != fTemp)
                                    {
                                        return true;
                                    }                                    
                                }
                                else
                                {
                                    // End:0x57D
                                    if(mySettingsList[SettingsIndex].OptionName == "MotionBlur")
                                    {
                                        bTemp = Data.GetFloat("optIndex") == float(1);
                                        // End:0x57A
                                        if(Settings.bMotionBlur != bTemp)
                                        {
                                            return true;
                                        }                                        
                                    }
                                    else
                                    {
                                        // End:0x622
                                        if(mySettingsList[SettingsIndex].OptionName == "DepthOfField")
                                        {
                                            bTemp = Data.GetFloat("optIndex") == float(1);
                                            // End:0x61F
                                            if(Settings.bDepthOfField != bTemp)
                                            {
                                                return true;
                                            }                                            
                                        }
                                        else
                                        {
                                            // End:0x6CB
                                            if(mySettingsList[SettingsIndex].OptionName == "AmbientOcclusion")
                                            {
                                                bTemp = Data.GetFloat("optIndex") == float(1);
                                                // End:0x6C8
                                                if(Settings.bAmbientOcclusion != bTemp)
                                                {
                                                    return true;
                                                }                                                
                                            }
                                            else
                                            {
                                                // End:0x769
                                                if(mySettingsList[SettingsIndex].OptionName == "Bloom")
                                                {
                                                    bTemp = Data.GetFloat("optIndex") == float(1);
                                                    // End:0x766
                                                    if(Settings.bBloom != bTemp)
                                                    {
                                                        return true;
                                                    }                                                    
                                                }
                                                else
                                                {
                                                    // End:0x80D
                                                    if(mySettingsList[SettingsIndex].OptionName == "LightShafts")
                                                    {
                                                        bTemp = Data.GetFloat("optIndex") == float(1);
                                                        // End:0x80A
                                                        if(Settings.bLightShafts != bTemp)
                                                        {
                                                            return true;
                                                        }                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x8B4
                                                        if(mySettingsList[SettingsIndex].OptionName == "DynamicShadows")
                                                        {
                                                            bTemp = Data.GetFloat("optIndex") == float(1);
                                                            // End:0x8B1
                                                            if(Settings.bDynamicShadows != bTemp)
                                                            {
                                                                return true;
                                                            }                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x950
                                                            if(mySettingsList[SettingsIndex].OptionName == "ShadowDetail")
                                                            {
                                                                fTemp = Data.GetFloat("optIndex");
                                                                // End:0x950
                                                                if(float(Settings.ShadowLevel) != fTemp)
                                                                {
                                                                    return true;
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
        I++;
        // [Loop Continue]
        goto J0x50;
    }
    return false;
    //return ReturnValue;    
}

function ApplySettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data;
    local /*0x97E50000-0x00000000*/ private int I, setting;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private float DataProviderLength;
    local /*0x97E50000-0x00000000*/ private int SettingsIndex;

    Settings.PushSettings();
    mySettingsList = GetSettingsList();
    DataProviderLength = ListDataProvider.GetFloat("length");
    I = 0;
    J0x6F:

    // End:0x836 [Loop If]
    if(float(I) < DataProviderLength)
    {
        SettingsIndex = GetSettingsListIndexFromDataIndex(I);
        // End:0xD1
        if((SettingsIndex < 0) || SettingsIndex >= mySettingsList.Length)
        {            
        }
        else
        {
            Data = ListDataProvider.GetElementObject(I);
            // End:0x188
            if(mySettingsList[SettingsIndex].OptionName == "Resolution")
            {
                Settings.CurrentResolution = int(Data.GetFloat("optIndex"));                
            }
            else
            {
                // End:0x210
                if(mySettingsList[SettingsIndex].OptionName == "WindowMode")
                {
                    Settings.bFullScreen = Data.GetFloat("optIndex") == float(1);                    
                }
                else
                {
                    // End:0x2DD
                    if(mySettingsList[SettingsIndex].OptionName == "AntiAlias")
                    {
                        setting = int(Data.GetFloat("optIndex"));
                        // End:0x2AF
                        if(setting == 2)
                        {
                            Settings.MultiSamples = 4;                            
                        }
                        else
                        {
                            Settings.MultiSamples = setting + 1;
                        }                        
                    }
                    else
                    {
                        // End:0x360
                        if(mySettingsList[SettingsIndex].OptionName == "VSync")
                        {
                            Settings.bVsync = Data.GetFloat("optIndex") == float(1);                            
                        }
                        else
                        {
                            // End:0x3E8
                            if(mySettingsList[SettingsIndex].OptionName == "TextureQuality")
                            {
                                Settings.TextureLevel = int(Data.GetFloat("optIndex"));                                
                            }
                            else
                            {
                                // End:0x46D
                                if(mySettingsList[SettingsIndex].OptionName == "WorldDetail")
                                {
                                    Settings.WorldLevel = int(Data.GetFloat("optIndex"));                                    
                                }
                                else
                                {
                                    // End:0x4F5
                                    if(mySettingsList[SettingsIndex].OptionName == "MotionBlur")
                                    {
                                        Settings.bMotionBlur = Data.GetFloat("optIndex") == float(1);                                        
                                    }
                                    else
                                    {
                                        // End:0x57F
                                        if(mySettingsList[SettingsIndex].OptionName == "DepthOfField")
                                        {
                                            Settings.bDepthOfField = Data.GetFloat("optIndex") == float(1);                                            
                                        }
                                        else
                                        {
                                            // End:0x60D
                                            if(mySettingsList[SettingsIndex].OptionName == "AmbientOcclusion")
                                            {
                                                Settings.bAmbientOcclusion = Data.GetFloat("optIndex") == float(1);                                                
                                            }
                                            else
                                            {
                                                // End:0x690
                                                if(mySettingsList[SettingsIndex].OptionName == "Bloom")
                                                {
                                                    Settings.bBloom = Data.GetFloat("optIndex") == float(1);                                                    
                                                }
                                                else
                                                {
                                                    // End:0x719
                                                    if(mySettingsList[SettingsIndex].OptionName == "LightShafts")
                                                    {
                                                        Settings.bLightShafts = Data.GetFloat("optIndex") == float(1);                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x7A5
                                                        if(mySettingsList[SettingsIndex].OptionName == "DynamicShadows")
                                                        {
                                                            Settings.bDynamicShadows = Data.GetFloat("optIndex") == float(1);                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x828
                                                            if(mySettingsList[SettingsIndex].OptionName == "ShadowDetail")
                                                            {
                                                                Settings.ShadowLevel = int(Data.GetFloat("optIndex"));
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
        goto J0x6F;
    }
    Settings.ApplySettings();
    //return;    
}

function ResetSettingsToDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private float Gamma;

    Settings.SetToDefaults();
    LPPC = LPPlayerController(Outer.GetPC());
    super.ResetSettingsToDefaults();
    ResetProfileSettingToDefault(LPProfileSettings(LPPC.ProfileSettings), LPPC.ProfileSettings.49);
    Gamma = LPPC.ProfileSettings.GetGammaSetting();
    LPPC.SetGamma(Gamma);
    UpdateListDataProvider();
    //return;    
}

defaultproperties
{
    WindowMode_Windowed="WINDOWED"
    WindowMode_FullScreen="FULL SCREEN"
    AAMode_1X="1xMSAA"
    AAMode_2X="2xMSAA"
    AAMode_4X="4xMSAA"
    On="ON"
    Off="OFF"
    Detail_Level1="REALLY LOW"
    Detail_Level2="LOW"
    Detail_Level3="MEDIUM"
    Detail_Level4="HIGH"
    Detail_Level5="VERY HIGH"
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.Video>"
    SettingsList=/* Array type was not detected. */
}