class LPGFxFrontEnd_OptionsControlConfig extends SPGFxUIView within GFxMoviePlayer
    config(UI);

struct WidgetInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name InputWidgetName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InputWidget;

    structdefaultproperties
    {
        InputWidgetName="None"
        InputWidget=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControllerMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WidgetInfoList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string POFLabelName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSLabelName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UtilityRigLabelName;

function setConfigTabNames()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string tab1Name[8388609], tab2Name, tab3Name;

    ActionScriptVoid("setConfigTabNames");
    //return;    
}

function GetControlModeIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x32
    if(ControllerMC != none)
    {
        return ControllerMC.GetControlModeIndex();        
    }
    else
    {
        return 0;
    }
    //return ReturnValue;    
}

function ControllerMap()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string DoneLoading[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTGS;

    bIsTGS = Class'LPGameViewportClient'.static.IsTGSDemo();
    // End:0x55
    if(bIsTGS)
    {
        ASSetScreenMode("pofOnly");
        ASEnableAltControlConfigs(false);
    }
    SetScreenMode();
    NotifyRefreshMenu();
    //return;    
}

function SetScreenMode()
{
    // End:0x65
    if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
    {
        // End:0x4A
        if(LPGFxMoviePlayerPauseMenu_MP(MoviePlayer) != none)
        {
            ASSetScreenMode("multiplayer");            
        }
        else
        {
            ASSetScreenMode("singleplayer");
        }        
    }
    else
    {
        // End:0xBF
        if(LPGFxMoviePlayerFrontEndManager(MoviePlayer) != none)
        {
            // End:0xBF
            if(LPGFxMoviePlayerFrontEndManager(MoviePlayer).bShowMultiplayerControlConfig)
            {
                ASSetScreenMode("multiplayer");
            }
        }
    }
    //return;    
}

function GetCurrentPresetIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x32
    if(ControllerMC != none)
    {
        return ControllerMC.GetPresetIndex();        
    }
    else
    {
        return 0;
    }
    //return ReturnValue;    
}

function NotifyRefreshMenu()
{
    RefreshControllerMap();
    repopulateScreen();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;
    local /*0x97E50000-0x00000000*/ private int BindIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPI, LPPC;
    local /*0x97E50000-0x00000000*/ private int I, X, ConfigIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ConfigString;

    false
    'None'
    // End:0x53
    if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
    {
        LPGFxMoviePlayerPauseMenu(MoviePlayer).ControlConfigMenu = self;
    }
    LPPC = LPPlayerController(MoviePlayer.GetPC());
    LPI = LPPlayerInput(LPPC.PlayerInput);
    clearAllText();
    ConfigString = LPPC.GetControlConfigurationString();
    // End:0x19A
    if(LPI != none)
    {
        X = 0;
        J0x103:

        // End:0x19A [Loop If]
        if(X < LPI.InputConfigurations.Length)
        {
            // End:0x18C
            if(LPI.InputConfigurations[X].ProfileSettingsName == ConfigString)
            {
                ConfigIndex = X;
            }
            X++;
            // [Loop Continue]
            goto J0x103;
        }
    }
    ControllerMC.Init(self, ConfigIndex);
    // End:0x2CF
    if(WidgetInfoList.Length > 0)
    {
        I = 0;
        J0x1DE:

        // End:0x2BB [Loop If]
        if(I < LPI.InputConfigurations.Length)
        {
            BindIndex = 0;
            J0x216:

            // End:0x2AD [Loop If]
            if(BindIndex < LPI.InputConfigurations[I].ConfigurationBindings.Length)
            {
                WidgetInfoList[BindIndex].InputWidget.SetText("");
                BindIndex++;
                // [Loop Continue]
                goto J0x216;
            }
            I++;
            // [Loop Continue]
            goto J0x1DE;
        }
        RefreshControllerMap();
        repopulateScreen();
    }
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    MoviePlayer.SetExternalInterface(self);
    SetScreenMode();
    switchPages(0);
    // End:0x3C9
    if(int(LPPC.WorldInfo.NetMode) != int(NM_Standalone))
    {
        LPPC.SetShowSubtitles(false);
    }
    //return;    
}

function PageSwitched()
{
    local /*0x97E50000-0x00000000*/ private int pageNum[8388609];

    ASEnableAltControlConfigs(pageNum == 0);
    ControllerMC.CurrentControlModeIndex = pageNum;
    NotifyControlModeChange(pageNum);
    //return;    
}

function NavLeft()
{
    ControllerMC.PrevPreset();
    //return;    
}

function NavRight()
{
    ControllerMC.NextPreset();
    //return;    
}

function ResetToDefaults()
{
    ControllerMC.ResetToDefaults();
    //return;    
}

function CancelControllerScreen()
{
    OnEscapeKeyPress();
    //return;    
}

function PlayNavBackSoundEvent()
{
    // End:0x36
    if(bSoundEvents)
    {
        Outer.PlaySoundFromTheme(NavBackSoundEventName);
    }
    //return;    
}

function MoveBackImpl()
{
    PlayNavBackSoundEvent();
    // End:0x89
    if(MenuViewLoader != none)
    {
        PlayCloseAnimation();
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
        MoviePlayer.SetExternalInterface(MoviePlayer);
    }
    LPPlayerController(Outer.GetPC()).RestoreShowSubtitles();
    //return;    
}

function OnEscapeKeyPress()
{
    ControllerMC.CancelControllerScreen();
    MoveBackImpl();
    //return;    
}

function RefreshControllerMap()
{
    local /*0x97E50000-0x00000000*/ private int ConfigIndex, I;
    local /*0x97E50000-0x00000000*/ private @NULL LPI;
    local /*0x97E50000-0x00000000*/ private int BindIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x13
    if(WidgetInfoList.Length == 0)
    {        
    }
    else
    {
        LPPC = LPPlayerController(MoviePlayer.GetPC());
        // End:0x34B
        if(LPPC != none)
        {
            ConfigIndex = GetCurrentPresetIndex();
            LPI = LPPlayerInput(LPPC.PlayerInput);
            // End:0x34B
            if(LPI != none)
            {
                I = 0;
                J0xB3:

                // End:0x34B [Loop If]
                if(I < WidgetInfoList.Length)
                {
                    // End:0x10C
                    if(WidgetInfoList[I].InputWidgetName == 'ControlModeLabel')
                    {
                        HandleControlModeLabel();                        
                    }
                    else
                    {
                        // End:0x232
                        if(WidgetInfoList[I].InputWidgetName == 'PresetLabel')
                        {
                            // End:0x1F0
                            if((ControllerMC != none) && ControllerMC.CurrentControlModeIndex == 0)
                            {
                                WidgetInfoList[I].InputWidget.SetText(LPI.InputConfigurations[ConfigIndex].ConfigurationName);                                
                            }
                            else
                            {
                                WidgetInfoList[I].InputWidget.SetText("");
                            }                            
                        }
                        else
                        {
                            BindIndex = 0;
                            J0x23D:

                            // End:0x33D [Loop If]
                            if(BindIndex < LPI.InputConfigurations[ConfigIndex].ConfigurationBindings.Length)
                            {
                                // End:0x32F
                                if(WidgetInfoList[I].InputWidgetName == LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].ButtonName)
                                {
                                    HandleButtonDescription(I, ConfigIndex, BindIndex);
                                }
                                BindIndex++;
                                // [Loop Continue]
                                goto J0x23D;
                            }
                        }
                    }
                    I++;
                    // [Loop Continue]
                    goto J0xB3;
                }
            }
        }
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private int BindIndex, X, ConfigIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPI;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ConfigString;
    local /*0x97E50000-0x00000000*/ private @NULL NewWidgetInfo;
    local /*0x97E50000-0x00000000*/ private bool bPS3;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    LPI = LPPlayerInput(LPPC.PlayerInput);
    bPS3 = Class'Engine.WorldInfo'.static.IsConsoleBuild(2);
    // End:0x1E8
    if(WidgetName == 'controller_mc')
    {
        // End:0x1E5
        if(ControllerMC == none)
        {
            ControllerMC = LPGFxControllerConfig(Widget);
            // End:0x1E5
            if(ControllerMC != none)
            {
                ConfigString = LPPC.GetControlConfigurationString();
                // End:0x1BA
                if(LPI != none)
                {
                    X = 0;
                    J0x123:

                    // End:0x1BA [Loop If]
                    if(X < LPI.InputConfigurations.Length)
                    {
                        // End:0x1AC
                        if(LPI.InputConfigurations[X].ProfileSettingsName == ConfigString)
                        {
                            ConfigIndex = X;
                        }
                        X++;
                        // [Loop Continue]
                        goto J0x123;
                    }
                }
                ControllerMC.Init(self, ConfigIndex);
                return true;
            }
        }        
    }
    else
    {
        // End:0x2BB
        if(WidgetName == 'SelectLabel')
        {
            // End:0x268
            if(bPS3)
            {
                Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelectHoriz>"));                
            }
            else
            {
                Widget.SetText("<Strings:LostPlanetGame.UI.Select>");
            }
            bWasHandled = true;            
        }
        else
        {
            // End:0x385
            if(WidgetName == 'BackLabel')
            {
                // End:0x334
                if(bPS3)
                {
                    Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));                    
                }
                else
                {
                    Widget.SetText("<Strings:LostPlanetGame.UI.Back>");
                }
                bWasHandled = true;                
            }
            else
            {
                // End:0x46A
                if(WidgetName == 'DefaultsLabel')
                {
                    // End:0x40D
                    if(bPS3)
                    {
                        Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.ControllerMap.ButtonDefaults>"));                        
                    }
                    else
                    {
                        Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Defaults>");
                    }
                    bWasHandled = true;
                }
            }
        }
    }
    // End:0x69B
    if(LPPC != none)
    {
        LPI = LPPlayerInput(LPPC.PlayerInput);
        // End:0x69B
        if(LPI != none)
        {
            BindIndex = 0;
            J0x4C4:

            // End:0x69B [Loop If]
            if(BindIndex < LPI.InputConfigurations[ConfigIndex].ConfigurationBindings.Length)
            {
                // End:0x68D
                if(((((TranslateButtonNameToWidgetName(LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].ButtonName)) == WidgetName) || WidgetName == 'ControlModeLabel') || WidgetName == 'PresetLabel') || InStr(string(WidgetName), "Hold") >= 0)
                {
                    NewWidgetInfo.InputWidgetName = TranslateWidgetNameToButtonName(WidgetName);
                    NewWidgetInfo.InputWidget = Widget;
                    WidgetInfoList.AddItem(NewWidgetInfo);                    
                    NewWidgetInfo.InputWidgetName = 'None';
                    NewWidgetInfo.InputWidget = none;
                    bWasHandled = true;
                    // [Explicit Break]
                    goto J0x69B;
                }
                BindIndex++;
                // [Loop Continue]
                goto J0x4C4;
            }
        }
    }
    J0x69B:

    // End:0x6DD
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);        
    }
    else
    {
        RefreshControllerMap();
    }
    return bWasHandled;
    //return ReturnValue;    
}

function GetButtonWidgetIndex()
{
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Idx;

    Idx = 0;
    J0x0B:

    // End:0x6F [Loop If]
    if(Idx < WidgetInfoList.Length)
    {
        // End:0x61
        if(WidgetInfoList[Idx].InputWidgetName == ButtonName)
        {
            return Idx;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function HandleButtonDescription()
{
    local /*0x97E50000-0x00000000*/ private int WidgetIndex[8388609], ConfigIndex, BindIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string WidgetString, WidgetString_AdditionalDescription;
    local /*0x97E50000-0x00000000*/ private @NULL LPI;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL SPPC;
    local /*0x97E50000-0x00000000*/ private bool bIsMPHUD;

    SPPC = SPPlayerController(MoviePlayer.GetPC());
    // End:0xA9
    if((SPPC != none) && SPPC.HUDContentClass != none)
    {
        bIsMPHUD = SPPC.HUDContentClass.default.bIsMultiplayerHUD;        
    }
    else
    {
        bIsMPHUD = int(Outer.GetPC().WorldInfo.NetMode) != int(NM_Standalone);
    }
    LPI = LPPlayerInput(SPPC.PlayerInput);
    // End:0x77E
    if(LPI != none)
    {
        switch(GetControlModeIndex())
        {
            // End:0x3CA
            case 0:
                // End:0x230
                if(bIsMPHUD && LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_One_MPOverride != "")
                {
                    WidgetString = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_One_MPOverride;                    
                }
                else
                {
                    WidgetString = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_One;
                }
                // End:0x365
                if(bIsMPHUD && LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].SubDescription_One_MPOverride != "")
                {
                    WidgetString_AdditionalDescription = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].SubDescription_One_MPOverride;                    
                }
                else
                {
                    WidgetString_AdditionalDescription = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].SubDescription_One;
                }
                // End:0x77B
                break;
            // End:0x63B
            case 1:
                // End:0x4A1
                if(bIsMPHUD && LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_Two_MPOverride != "")
                {
                    WidgetString = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_Two_MPOverride;                    
                }
                else
                {
                    WidgetString = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_Two;
                }
                // End:0x5D6
                if(bIsMPHUD && LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].SubDescription_Two_MPOverride != "")
                {
                    WidgetString_AdditionalDescription = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].SubDescription_Two_MPOverride;                    
                }
                else
                {
                    WidgetString_AdditionalDescription = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].SubDescription_Two;
                }
                // End:0x77B
                break;
            // End:0x778
            case 2:
                // End:0x713
                if(bIsMPHUD && LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_Three_MPOverride != "")
                {
                    WidgetString = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_Three_MPOverride;                    
                }
                else
                {
                    WidgetString = LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].Description_Three;
                }
                // End:0x77B
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        WidgetString = "ERROR";
    }
    WidgetInfoList[WidgetIndex].InputWidget.SetText(WidgetString);
    // End:0xB0B
    if(WidgetString_AdditionalDescription != "")
    {
        switch(LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].ButtonName)
        {
            // End:0x873
            case 'XboxTypeS_Y':
                Idx = GetButtonWidgetIndex('BPad0Hold');
                // End:0xAB2
                break;
            // End:0x89F
            case 'XboxTypeS_B':
                Idx = GetButtonWidgetIndex('BPad1Hold');
                // End:0xAB2
                break;
            // End:0x8CB
            case 'XboxTypeS_A':
                Idx = GetButtonWidgetIndex('BPad2Hold');
                // End:0xAB2
                break;
            // End:0x8F7
            case 'XboxTypeS_X':
                Idx = GetButtonWidgetIndex('BPad3Hold');
                // End:0xAB2
                break;
            // End:0x923
            case 'XboxTypeS_Start':
                Idx = GetButtonWidgetIndex('StartHold');
                // End:0xAB2
                break;
            // End:0x94F
            case 'XboxTypeS_Back':
                Idx = GetButtonWidgetIndex('SelectHold');
                // End:0xAB2
                break;
            // End:0x97B
            case 'XboxTypeS_LeftTrigger':
                Idx = GetButtonWidgetIndex('L2Hold');
                // End:0xAB2
                break;
            // End:0x9A7
            case 'XboxTypeS_LeftShoulder':
                Idx = GetButtonWidgetIndex('L1Hold');
                // End:0xAB2
                break;
            // End:0x9D3
            case 'XboxTypeS_DPad_Up':
                Idx = GetButtonWidgetIndex('DPad0Hold');
                // End:0xAB2
                break;
            // End:0x9FF
            case 'XboxTypeS_DPad_Left':
                Idx = GetButtonWidgetIndex('DPad3Hold');
                // End:0xAB2
                break;
            // End:0xA2B
            case 'XboxTypeS_DPad_Down':
                Idx = GetButtonWidgetIndex('DPad2Hold');
                // End:0xAB2
                break;
            // End:0xA57
            case 'XboxTypeS_DPad_Right':
                Idx = GetButtonWidgetIndex('DPad1Hold');
                // End:0xAB2
                break;
            // End:0xA83
            case 'XboxTypeS_RightTrigger':
                Idx = GetButtonWidgetIndex('R2Hold');
                // End:0xAB2
                break;
            // End:0xAAF
            case 'XboxTypeS_RightShoulder':
                Idx = GetButtonWidgetIndex('R1Hold');
                // End:0xAB2
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0xB0B
        if(Idx > -1)
        {
            WidgetInfoList[Idx].InputWidget.SetText(WidgetString_AdditionalDescription);
        }
    }
    WidgetString = Repl(WidgetString, " ", "");
    // End:0xBA8
    if(WidgetString != "")
    {
        UpdateLine(string(TranslateButtonNameToWidgetName(LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].ButtonName)), true);        
    }
    else
    {
        UpdateLine(string(TranslateButtonNameToWidgetName(LPI.InputConfigurations[ConfigIndex].ConfigurationBindings[BindIndex].ButtonName)), false);
    }
    //return;    
}

function UpdateLine()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsVisible[8388609];

    ActionScriptVoid("showLine");
    //return;    
}

function HandleControlModeLabel()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x1AE [Loop If]
    if(I < WidgetInfoList.Length)
    {
        // End:0x1A0
        if(WidgetInfoList[I].InputWidgetName == 'ControlModeLabel')
        {
            switch(GetControlModeIndex())
            {
                // End:0xB8
                case 0:
                    WidgetInfoList[I].InputWidget.SetText(POFLabelName);
                    // End:0x19D
                    break;
                // End:0x105
                case 1:
                    WidgetInfoList[I].InputWidget.SetText(UtilityRigLabelName);
                    // End:0x19D
                    break;
                // End:0x153
                case 2:
                    WidgetInfoList[I].InputWidget.SetText(VSLabelName);
                    // End:0x19D
                    break;
                // End:0xFFFF
                default:
                    WidgetInfoList[I].InputWidget.SetText("ERROR");
                    // End:0x19D
                    break;
                    break;
            }
            // [Explicit Break]
            goto J0x1AE;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x1AE:

    //return;    
}

function NotifyPresetChanged()
{
    local /*0x97E50000-0x00000000*/ private int NewPreset[8388609], BindIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPI;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x72
    if(LPPC != none)
    {
        LPI = LPPlayerInput(LPPC.PlayerInput);
    }
    clearAllText();
    BindIndex = 0;
    J0x87:

    // End:0x11E [Loop If]
    if(BindIndex < LPI.InputConfigurations[NewPreset].ConfigurationBindings.Length)
    {
        WidgetInfoList[BindIndex].InputWidget.SetText("");
        BindIndex++;
        // [Loop Continue]
        goto J0x87;
    }
    RefreshControllerMap();
    MoviePlayer.PlaySoundFromTheme('controllerChange');
    repopulateScreen();
    return;
    //return;    
}

function NotifyControlModeChange()
{
    local /*0x97E50000-0x00000000*/ private int NewScreen[8388609], BindIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPI;
    local /*0x97E50000-0x00000000*/ private int CurrentConfiguration;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x165
    if(LPPC != none)
    {
        LPI = LPPlayerInput(LPPC.PlayerInput);
        CurrentConfiguration = GetCurrentPresetIndex();
        clearAllText();
        BindIndex = 0;
        J0x9B:

        // End:0x132 [Loop If]
        if(BindIndex < LPI.InputConfigurations[CurrentConfiguration].ConfigurationBindings.Length)
        {
            WidgetInfoList[BindIndex].InputWidget.SetText("");
            BindIndex++;
            // [Loop Continue]
            goto J0x9B;
        }
        MoviePlayer.PlaySoundFromTheme('ControllerConfigBumper');
        RefreshControllerMap();
    }
    repopulateScreen();
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x39
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x8D
    if(ControllerMC != none)
    {
        Retval = ControllerMC.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    return Retval;
    //return ReturnValue;    
}

function clearAllText()
{
    ActionScriptVoid("clearAllText");
    //return;    
}

function repopulateScreen()
{
    ActionScriptVoid("repopulateScreen");
    //return;    
}

function switchPages()
{
    local /*0x97E50000-0x00000000*/ private int pageNum[8388609];

    ActionScriptVoid("switchPages");
    //return;    
}

function TranslateWidgetNameToButtonName()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], ReturnValue;

    switch(WidgetName)
    {
        // End:0x29
        case 'DPad0':
            return 'XboxTypeS_DPad_Up';
        // End:0x3F
        case 'DPad1':
            return 'XboxTypeS_DPad_Right';
        // End:0x55
        case 'DPad2':
            return 'XboxTypeS_DPad_Down';
        // End:0x6B
        case 'DPad3':
            return 'XboxTypeS_DPad_Left';
        // End:0x81
        case 'LStick':
            return 'LStick';
        // End:0x97
        case 'L3':
            return 'XboxTypeS_LeftThumbStick';
        // End:0xAD
        case 'L1':
            return 'XboxTypeS_LeftShoulder';
        // End:0xC3
        case 'l2':
            return 'XboxTypeS_LeftTrigger';
        // End:0xD9
        case 'Select':
            return 'Select';
        // End:0xEF
        case 'Start':
            return 'XboxTypeS_Start';
        // End:0x105
        case 'R2':
            return 'XboxTypeS_RightTrigger';
        // End:0x11B
        case 'R1':
            return 'XboxTypeS_RightShoulder';
        // End:0x131
        case 'BPad0':
            return 'XboxTypeS_Y';
        // End:0x147
        case 'BPad1':
            return 'XboxTypeS_B';
        // End:0x15D
        case 'BPad2':
            return 'XboxTypeS_A';
        // End:0x173
        case 'BPad3':
            return 'XboxTypeS_X';
        // End:0x189
        case 'R3':
            return 'XboxTypeS_RightThumbStick';
        // End:0x19F
        case 'RStick':
            return 'RStick';
        // End:0x1B5
        case 'BPad0Hold':
            return 'BPad0Hold';
        // End:0x1CB
        case 'BPad1Hold':
            return 'BPad1Hold';
        // End:0x1E1
        case 'BPad2Hold':
            return 'BPad2Hold';
        // End:0x1F7
        case 'BPad3Hold':
            return 'BPad3Hold';
        // End:0xFFFF
        default:
            return WidgetName;
            break;
    }
    //return ReturnValue;    
}

function TranslateButtonNameToWidgetName()
{
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609], ReturnValue;

    switch(ButtonName)
    {
        // End:0x29
        case 'XboxTypeS_DPad_Up':
            return 'DPad0';
        // End:0x3F
        case 'XboxTypeS_DPad_Right':
            return 'DPad1';
        // End:0x55
        case 'XboxTypeS_DPad_Down':
            return 'DPad2';
        // End:0x6B
        case 'XboxTypeS_DPad_Left':
            return 'DPad3';
        // End:0x81
        case 'LStick':
            return 'LStick';
        // End:0x97
        case 'XboxTypeS_LeftThumbStick':
            return 'L3';
        // End:0xAD
        case 'XboxTypeS_LeftShoulder':
            return 'L1';
        // End:0xC3
        case 'XboxTypeS_LeftTrigger':
            return 'l2';
        // End:0xD9
        case 'Select':
            return 'Select';
        // End:0xEF
        case 'XboxTypeS_Start':
            return 'Start';
        // End:0x105
        case 'XboxTypeS_RightTrigger':
            return 'R2';
        // End:0x11B
        case 'XboxTypeS_RightShoulder':
            return 'R1';
        // End:0x131
        case 'XboxTypeS_Y':
            return 'BPad0';
        // End:0x147
        case 'XboxTypeS_B':
            return 'BPad1';
        // End:0x15D
        case 'XboxTypeS_A':
            return 'BPad2';
        // End:0x173
        case 'XboxTypeS_X':
            return 'BPad3';
        // End:0x189
        case 'XboxTypeS_RightThumbStick':
            return 'R3';
        // End:0x19F
        case 'RStick':
            return 'RStick';
        // End:0x1B5
        case 'BPad0Hold':
            return 'BPad0Hold';
        // End:0x1CB
        case 'BPad1Hold':
            return 'BPad1Hold';
        // End:0x1E1
        case 'BPad2Hold':
            return 'BPad2Hold';
        // End:0x1F7
        case 'BPad3Hold':
            return 'BPad3Hold';
        // End:0xFFFF
        default:
            return ButtonName;
            break;
    }
    //return ReturnValue;    
}

function ASSetScreenMode()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Mode[8388609];

    ActionScriptVoid("setScreenMode");
    //return;    
}

function ASEnableAltControlConfigs()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    ActionScriptVoid("enableAltControlConfigs");
    //return;    
}

defaultproperties
{
    POFLabelName="ON FOOT"
    VSLabelName="VITAL SUIT"
    UtilityRigLabelName="UTILITY RIG"
    SubWidgetBindings=/* Array type was not detected. */
}