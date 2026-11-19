class LPGFxMoviePlayerPauseMenu_MP extends LPGFxMoviePlayerPauseMenu
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadoutKitsOnly;

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = false;
    bResult = ViewLoader.InitViewWidget(WidgetName, WidgetPath, Widget);
    // End:0x10F
    if(bResult == true)
    {
        // End:0xB2
        if(bLoadoutKitsOnly)
        {
            // End:0xAF
            if(WidgetName == 'LoadoutKits')
            {
                ViewLoader.PushViewByName(WidgetName);
            }            
        }
        else
        {
            // End:0x10F
            if(WidgetName == 'MainMenu')
            {
                MainMenu = SPGFxUIViewSettingsMenuBase(Widget);
                ViewLoader.PushViewByName(WidgetName);
            }
        }
    }
    return bResult;
    //return ReturnValue;    
}

function PushCurrentView()
{
    // End:0x3A
    if(bLoadoutKitsOnly)
    {
        ViewLoader.PushViewByName('LoadoutKits');        
    }
    else
    {
        ViewLoader.PushViewByName('MainMenu');
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x100
    if(bLoadoutKitsOnly)
    {
        // End:0xA6
        if(ButtonName == 'XboxTypeS_Start')
        {
            // End:0x9A
            if(int(InputEvent) == int(0))
            {
                ViewLoader.PopView(true);
                ViewLoader.PushViewByName('MainMenu');
                bLoadoutKitsOnly = false;
            }
            Retval = true;
        }
        // End:0x100
        if((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
        {
            // End:0xF4
            if(int(InputEvent) == int(0))
            {
                PauseMenuClose();
            }
            Retval = true;
        }
    }
    // End:0x140
    if(Retval == false)
    {
        Retval = super.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    return Retval;
    //return ReturnValue;    
}

function PauseMenuClose()
{
    local /*0x97E50000-0x00000000*/ private bool bOldSaveProfile;

    bOldSaveProfile = bSaveProfile;
    ViewLoader.PopAllViews();
    LPPlayerController(GetPC()).RestoreShowSubtitles();
    bSaveProfile = bOldSaveProfile;
    super.PauseMenuClose();
    //return;    
}

function OnClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super(SPGFxMoviePlayerViewManager).OnClose();
    bLoadoutKitsOnly = false;
    LPPC = LPPlayerController(GetPC());
    // End:0x77
    if(LPPC != none)
    {
        LPPC.myLPHUD.SleepHUDMessage(false);
    }
    //return;    
}

defaultproperties
{
    bMPMode=true
    bSuspendRenderingOnStart=false
    bUnloadViewsOnClose=false
    bPauseGameWhileActive=false
}