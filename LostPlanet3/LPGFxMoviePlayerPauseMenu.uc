class LPGFxMoviePlayerPauseMenu extends SPGFxMoviePlayerPauseMenu
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControlConfigMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MainMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Title;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankDeployableTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankPassiveTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMPMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRenderingSuspended;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSuspendRenderingOnStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRestoreSubtitleSetting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRestoreAudioTimerAdvanceFlag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipMenuInput;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InputFrameDelay;

function ControllerMap()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string DoneLoading[8388609];

    // End:0x2E
    if(ControlConfigMenu != none)
    {
        ControlConfigMenu.NotifyRefreshMenu();
    }
    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[9437185];

    super(SPGFxMoviePlayer).Init(Player);
    bSkipMenuInput = true;
    InputFrameDelay = 5;
    RootMC = GetVariableObject("_root");
    ViewLoader.SetRootMC(RootMC);
    ViewLoader.SetManagerMC(RootMC);
    // End:0xAF
    if(bSuspendRenderingOnStart)
    {
        SuspendRendering();
    }
    ViewLoader.LoadViews(WidgetBindings);
    SetMPMode(bMPMode);
    //return;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue, bResult;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bResult = super(SPGFxMoviePlayerViewManager).Start(StartPaused);
    ViewLoader.PopAllViews();
    PushCurrentView();
    LPPC = LPPlayerController(GetPC());
    // End:0x195
    if((LPPC != none) && int(LPPC.WorldInfo.NetMode) == int(NM_Standalone))
    {
        LPPC.PauseMailMessagePlayback(true);
        bRestoreSubtitleSetting = LPPC.IsAllowSubtitlesWhilePaused();
        LPPC.AllowSubtitlesDuringPause(false);
        bRestoreAudioTimerAdvanceFlag = LPPC.WorldInfo.bAdvanceAudioTimeDuringPause;
        LPPC.WorldInfo.bAdvanceAudioTimeDuringPause = false;
    }
    return bResult;
    //return ReturnValue;    
}

function PauseMenuClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    // End:0xF4
    if((LPPC != none) && int(LPPC.WorldInfo.NetMode) == int(NM_Standalone))
    {
        LPPC.AllowSubtitlesDuringPause(bRestoreSubtitleSetting);
        LPPC.WorldInfo.bAdvanceAudioTimeDuringPause = bRestoreAudioTimerAdvanceFlag;
        LPPC.PauseMailMessagePlayback(false);
    }
    super.PauseMenuClose();
    //return;    
}

function PushCurrentView()
{
    // End:0x39
    if(MainMenu != none)
    {
        ViewLoader.PushViewByName('MainMenu');
    }
    //return;    
}

function SetMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInMPMode[8388609];

    ActionScriptVoid("setMPMode");
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = false;
    bResult = ViewLoader.InitViewWidget(WidgetName, WidgetPath, Widget);
    // End:0xBE
    if(bResult == true)
    {
        // End:0xBE
        if(WidgetName == 'MainMenu')
        {
            MainMenu = SPGFxUIViewSettingsMenuBase(Widget);
            ViewLoader.PushViewByName(WidgetName);
        }
    }
    return bResult;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x4F
    if((ButtonName == 'XboxTypeS_Start') && int(InputEvent) == int(0))
    {
        PauseMenuClose();
        Retval = true;
    }
    // End:0x5E
    if(bSkipMenuInput)
    {
        return true;
    }
    // End:0xB3
    if(Retval == false)
    {
        Retval = ViewLoader.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    return Retval;
    //return ReturnValue;    
}

function SetEscapeDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "OnEscapeKeyPress");
    //return;    
}

function SetOptionDefaultButton()
{
    local /*0x97E50000-0x00000000*/ private bool bDisplay[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[9437185];

    // End:0x20
    if(bDisplay == false)
    {
        ASSetDefaultString("");        
    }
    else
    {
        // End:0x7F
        if(Label != "")
        {
            // End:0x6C
            if(InStr(Label, "<Strings:",, true) >= 0)
            {
                Label = GetLocalizedString(Label);
            }
            ASSetDefaultString(Label);
        }
    }
    //return;    
}

function ASSetDefaultString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string newString[8388609];

    // End:0x40
    if(MainMenu != none)
    {
        MainMenu.ActionScriptVoid("setDefaultString");
    }
    //return;    
}

function ASDisplayDefaultButton()
{
    local /*0x97E50000-0x00000000*/ private bool bDisplay[8388609];

    // End:0x44
    if(MainMenu != none)
    {
        MainMenu.ActionScriptVoid("displayDefaultButton");
    }
    //return;    
}

function SuspendRendering()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    // End:0x12
    if(bRenderingSuspended == true)
    {
        return;
    }
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x82
    if(MyEngine != none)
    {
        MyEngine.SuspendRendering(true, false, 0);
        bRenderingSuspended = true;
    }
    //return;    
}

function ResumeRendering()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    // End:0x12
    if(bRenderingSuspended == false)
    {
        return;
    }
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0xA8
    if(MyEngine != none)
    {
        bRenderingSuspended = false;
        // End:0x85
        if(!MyEngine.IsRenderingSuspendedByScript())
        {
            return;
        }
        MyEngine.SuspendRendering(false, false, 0);
    }
    //return;    
}

function FEPostAdvance()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x35
    if(InputFrameDelay > 0)
    {
        InputFrameDelay--;
        // End:0x35
        if(InputFrameDelay <= 0)
        {
            bSkipMenuInput = false;
        }
    }
    //return;    
}

defaultproperties
{
    bSuspendRenderingOnStart=true
    Priority=65
    OnPostAdvance=FEPostAdvance
}