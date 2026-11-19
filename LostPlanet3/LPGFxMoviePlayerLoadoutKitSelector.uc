class LPGFxMoviePlayerLoadoutKitSelector extends SPGFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutKitSWF;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnCloseDelegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnKitSelectorClosed__Delegate;

delegate OnKitSelectorClosed()
{
    //return;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue, bNoLoadErrors;

    bNoLoadErrors = super.Start(StartPaused);
    SetImageSubstitutions();
    return bNoLoadErrors;
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
        // End:0x87
        case 'SelectLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelectHoriz>"));
            // End:0x2C8
            break;
        // End:0xEC
        case 'AssignLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Assign>"));
            // End:0x2C8
            break;
        // End:0x154
        case 'CustomizeLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Customize>"));
            // End:0x2C8
            break;
        // End:0x1D9
        case 'RenameLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Rename>"));
            Widget.SetVisible(false);
            // End:0x2C8
            break;
        // End:0x23A
        case 'BackLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x2C8
            break;
        // End:0x2B6
        case 'View':
            LoadoutMC = LPGFxLoadoutKitSelector(Widget);
            LoadoutMC.MoviePlayer = self;
            LoadoutMC.Init(GetVariableObject("_root"));
            // End:0x2C8
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x2C8
            break;
            break;
    }
    // End:0x307
    if(!bWasHandled)
    {
        bWasHandled = super(GFxMoviePlayer).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

event PostWidgetInit()
{
    super(GFxMoviePlayer).PostWidgetInit();
    // End:0x38
    if(LoadoutMC != none)
    {
        LoadoutMC.RepositionButtonPrompts();
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;

    bHandled = LoadoutMC.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    // End:0xAF
    if(!bHandled)
    {
        // End:0xAF
        if((ButtonName == 'XboxTypeS_Back') || ButtonName == 'XboxTypeS_B')
        {
            // End:0xA3
            if(int(InputEvent) == int(0))
            {
                Close(false);
            }
            bHandled = true;
        }
    }
    return bHandled;
    //return ReturnValue;    
}

function OnClose()
{
    LoadoutMC.OnKitSelectorClosed();
    OnKitSelectorClosed();
    super.OnClose();
    //return;    
}

defaultproperties
{
    bCaptureInput=true
    Priority=30
    WidgetBindings=/* Array type was not detected. */
}