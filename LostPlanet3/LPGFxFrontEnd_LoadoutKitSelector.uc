class LPGFxFrontEnd_LoadoutKitSelector extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadoutsInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPendingShow;

function OnViewUnloaded()
{
    // End:0x59
    if(LoadoutMC != none)
    {
        LoadoutMC.OnKitSelectorClosed();
        LoadoutMC.MoviePlayer = none;
        LoadoutMC = none;
    }
    super.OnViewUnloaded();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MoviePlayer.SetExternalInterface(self);
    // End:0x94
    if(!IsMenuLevel())
    {
        Outer.GetPC().SetShowSubtitles(false);
    }
    // End:0xAE
    if(bLoadoutsInit)
    {
        ShowLoadouts();        
    }
    else
    {
        bPendingShow = true;
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    // End:0x7A
    if(WidgetName == 'SelectLabel')
    {
        Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
        bResult = true;        
    }
    else
    {
        // End:0xF2
        if(WidgetName == 'CancelLabel')
        {
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            bResult = true;            
        }
        else
        {
            // End:0x1AF
            if(WidgetName == 'RenameLabel')
            {
                Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Rename>"));
                SetWidgetVisible(Widget, (IsMenuLevel()) && Class'LPGFxLoadoutKitSelector'.default.bKitRenamingEnabled);
                bResult = true;                
            }
            else
            {
                // End:0x24B
                if(WidgetName == 'CustomizeLabel')
                {
                    Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Customize>"));
                    SetWidgetVisible(Widget, IsMenuLevel());
                    bResult = true;                    
                }
                else
                {
                    // End:0x2C7
                    if(WidgetName == 'AssignLabel')
                    {
                        Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.Assign>"));
                        bResult = true;                        
                    }
                    else
                    {
                        // End:0x372
                        if(WidgetName == 'view1')
                        {
                            LoadoutMC = LPGFxLoadoutKitSelector(Widget);
                            LoadoutMC.MoviePlayer = MoviePlayer;
                            LoadoutMC.Init(self);
                            LoadoutMC.SelectKit(2);
                            bResult = true;                            
                        }
                        else
                        {
                            // End:0x3B9
                            if(WidgetName == 'view2')
                            {
                                LoadoutMC.SelectKit(3);
                                bResult = true;                                
                            }
                            else
                            {
                                // End:0x400
                                if(WidgetName == 'view3')
                                {
                                    LoadoutMC.SelectKit(4);
                                    bResult = true;                                    
                                }
                                else
                                {
                                    // End:0x446
                                    if(WidgetName == 'view4')
                                    {
                                        bLoadoutsInit = true;
                                        // End:0x43A
                                        if(bPendingShow)
                                        {
                                            ShowLoadouts();
                                        }
                                        bResult = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x485
    if(!bResult)
    {
        bResult = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bResult;
    //return ReturnValue;    
}

function IsMenuLevel()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPMenuGameGRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI) != none;
    //return ReturnValue;    
}

function SetWidgetVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = Widget.GetDisplayInfo();
    DI.Visible = bVisible;
    Widget.SetDisplayInfo(DI);
    //return;    
}

function ShowLoadouts()
{
    local /*0x97E50000-0x00000000*/ private @NULL focusObj;

    bPendingShow = false;
    focusObj = GetObject("View");
    MenuViewLoader.SetSelectionFocus(focusObj);
    LoadoutMC.SetSelectedKit();
    LoadoutMC.RepositionButtonPrompts();
    //return;    
}

function OnKitClicked()
{
    local /*0x97E50000-0x00000000*/ private int ClickIndex[8388609];

    LoadoutMC.OnKitClicked(ClickIndex);
    //return;    
}

function OnViewClosed()
{
    LoadoutMC.OnKitSelectorClosed();
    Cleanup();
    super(SPGFxUIView).OnViewClosed();
    //return;    
}

function Cleanup()
{
    // End:0x79
    if(IsMenuLevel())
    {
        LPFrontEndMoviePlayer.setButtonIcon(2, "");
        LPFrontEndMoviePlayer.setButtonIcon(4, "");
        LPFrontEndMoviePlayer.setButtonIcon(5, "");        
    }
    else
    {
        LPPlayerController(Outer.GetPC()).RestoreShowSubtitles();
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    bResult = LoadoutMC.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    return bResult;
    //return ReturnValue;    
}

defaultproperties
{
    SubWidgetBindings=/* Array type was not detected. */
}