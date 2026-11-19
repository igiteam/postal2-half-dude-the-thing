class LPGFxFrontEnd_SaveWarningMP extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleWidget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BodyTextWidget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConfirmLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton, saveWheel, DI;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    RefreshButtonPrompts();
    TitleWidget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.NoSaveWarningTitle>"));
    // End:0x189
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        BodyTextWidget.SetString("htmlText", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.PrivateMatchWarningX360>"));        
    }
    else
    {
        // End:0x22E
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            BodyTextWidget.SetString("htmlText", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.PrivateMatchWarningPS3>"));            
        }
        else
        {
            BodyTextWidget.SetString("htmlText", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.PrivateMatchWarning>"));
        }
    }
    saveWheel = GetObject("saveWheel");
    DI = saveWheel.GetDisplayInfo();
    DI.Visible = false;
    saveWheel.SetDisplayInfo(DI);
    MoviePlayer.SetExternalInterface(self);
    //return;    
}

function NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    RefreshButtonPrompts();
    //return;    
}

function RefreshButtonPrompts()
{
    // End:0x64
    if(ConfirmLabel != none)
    {
        ConfirmLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
    }
    // End:0xC5
    if(BackLabel != none)
    {
        BackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
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
        // End:0x41
        case 'TitleString':
            TitleWidget = Widget;
            // End:0xCD
            break;
        // End:0x6D
        case 'ConfirmString':
            ConfirmLabel = Widget;
            RefreshButtonPrompts();
            // End:0xCD
            break;
        // End:0x99
        case 'BackString':
            BackLabel = Widget;
            RefreshButtonPrompts();
            // End:0xCD
            break;
        // End:0xBB
        case 'BodyText':
            BodyTextWidget = Widget;
            // End:0xCD
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0xCD
            break;
            break;
    }
    // End:0x10F
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);        
    }
    return bWasHandled;
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
    // End:0x7D
    if((ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter')
    {
        // End:0x7B
        if(int(InputEvent) == int(0))
        {
            Accept();
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function Accept()
{
    MenuViewLoader.PopView();
    MenuViewLoader.PushViewByName('CustomMatchGameType', ParentView);
    //return;    
}

defaultproperties
{
    bShouldHideViewStack=false
}