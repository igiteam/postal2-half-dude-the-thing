class LPGFxMoviePlayerControllerMap extends SPGFxMoviePlayer
    config(UI);

enum EControllerScreens
{
    EControllerScreen_POF,          // 0
    EControllerScreen_VS,           // 1
    EControllerScreen_MAX           // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentScreen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControllerMC;

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL container, LPPC;

    false
    super.Start();
    Advance(0.0000000);
    container = GetVariableObject("_root.controls_mc");
    ControllerMC = container.GetObject("controller_mc");
    LPPC = LPPlayerController(GetPC());
    // End:0xDF
    if((LPPC != none) && LPPC.bIsInVitalSuit)
    {
        GotoScreen(1);        
    }
    else
    {
        GotoScreen(0);
    }
    return true;
    //return ReturnValue;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x83
        case 'UserControlsLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.UserControls>");
            // End:0xB59
            break;
        // End:0x8F
        case 'OnFootLabel':
        // End:0xED
        case 'VS_OnFootLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.OnFoot>");
            // End:0xB59
            break;
        // End:0xF9
        case 'VitalSuitLabel':
        // End:0x15A
        case 'VS_VitalSuitLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.VitalSuit>");
            // End:0xB59
            break;
        // End:0x166
        case 'SelectLabel':
        // End:0x1C4
        case 'VS_SelectLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.JobLog>");
            // End:0xB59
            break;
        // End:0x21F
        case 'L2Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Aim>");
            // End:0xB59
            break;
        // End:0x282
        case 'VS_L2Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.ForkArmGrab>");
            // End:0xB59
            break;
        // End:0x2E4
        case 'L1Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Unassigned>");
            // End:0xB59
            break;
        // End:0x344
        case 'VS_L1Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.WinchArm>");
            // End:0xB59
            break;
        // End:0x3A6
        case 'DPadLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Unassigned>");
            // End:0xB59
            break;
        // End:0x409
        case 'VS_DPadUpLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.TurnOnMusic>");
            // End:0xB59
            break;
        // End:0x46D
        case 'VS_DPadDownLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.TurnOffMusic>");
            // End:0xB59
            break;
        // End:0x479
        case 'LeftStickLabel':
        // End:0x4D5
        case 'VS_LeftStickLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Move>");
            // End:0xB59
            break;
        // End:0x537
        case 'LeftStickButtonLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Flashlight>");
            // End:0xB59
            break;
        // End:0x599
        case 'VS_LeftStickButtonLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Unassigned>");
            // End:0xB59
            break;
        // End:0x5A5
        case 'RightStickLabel':
        // End:0x607
        case 'VS_RightStickLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.CameraLook>");
            // End:0xB59
            break;
        // End:0x665
        case 'SquareLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Reload>");
            // End:0xB59
            break;
        // End:0x6C7
        case 'VS_SquareLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Unassigned>");
            // End:0xB59
            break;
        // End:0x723
        case 'XLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Roll>");
            // End:0xB59
            break;
        // End:0x788
        case 'VS_XLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.DrillArmSwing>");
            // End:0xB59
            break;
        // End:0x7E3
        case 'CircleLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Use>");
            // End:0xB59
            break;
        // End:0x846
        case 'VS_CircleLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.EnterExitVS>");
            // End:0xB59
            break;
        // End:0x8AA
        case 'TriangleLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.SwitchWeapon>");
            // End:0xB59
            break;
        // End:0x90D
        case 'VS_TriangleLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.PlayMessage>");
            // End:0xB59
            break;
        // End:0x96C
        case 'R1Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Grenade>");
            // End:0xB59
            break;
        // End:0x9C9
        case 'VS_R1Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Block>");
            // End:0xB59
            break;
        // End:0xA25
        case 'R2Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Fire>");
            // End:0xB59
            break;
        // End:0xA82
        case 'VS_R2Label':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Drill>");
            // End:0xB59
            break;
        // End:0xA8E
        case 'StartLabel':
        // End:0xAEB
        case 'VS_StartLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Pause>");
            // End:0xB59
            break;
        // End:0xB47
        case 'BackLabel':
            Widget.SetText("<Strings:LostPlanetGame.ControllerMap.Back>");
            // End:0xB59
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0xB59
            break;
            break;
    }
    // End:0xB98
    if(!bWasHandled)
    {
        bWasHandled = super(GFxMoviePlayer).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x4D
    if(ButtonName == 'XboxTypeS_B')
    {
        // End:0x41
        if(int(InputEvent) == int(0))
        {
            CancelControllerScreen();
        }
        Retval = true;
    }
    // End:0x91
    if(ButtonName == 'XboxTypeS_LeftShoulder')
    {
        // End:0x82
        if(int(InputEvent) == int(0))
        {
            NavLeft();
        }
        Retval = true;        
    }
    else
    {
        // End:0xD2
        if(ButtonName == 'XboxTypeS_RightShoulder')
        {
            // End:0xC6
            if(int(InputEvent) == int(0))
            {
                NavRight();
            }
            Retval = true;
        }
    }
    return Retval;
    //return ReturnValue;    
}

function GotoScreen()
{
    local /*0x97E50000-0x00000000*/ private byte NewScreen[8388609];

    CurrentScreen = NewScreen;
    switch(NewScreen)
    {
        // End:0x38
        case 0:
            GoToOnFoot();
            // End:0x4D
            break;
        // End:0x4A
        case 1:
            GoToVS();
            // End:0x4D
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function NavLeft()
{
    // End:0x20
    if(int(CurrentScreen) != int(0))
    {
        GotoScreen(0);
    }
    //return;    
}

function NavRight()
{
    // End:0x20
    if(int(CurrentScreen) != int(1))
    {
        GotoScreen(1);
    }
    //return;    
}

function GoToOnFoot()
{
    ControllerMC.ActionScriptVoid("GoToOnFoot");
    //return;    
}

function GoToVS()
{
    ControllerMC.ActionScriptVoid("GoToVS");
    //return;    
}

function CancelControllerScreen()
{
    EndSPGFxMoviePlayer();
    //return;    
}
