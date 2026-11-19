class LPGFxFrontEnd_PlayerProfile extends SPGFxUIView within GFxMoviePlayer
    config(UI);

function GetLocalizedString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LP;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;

    LP = MoviePlayer.GetLP();
    LocalizedString = Class'GFxUI.GFxObject'.static.TranslateString(("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerProfile." $ Label) $ ">", LP.GetTranslationContext());
    return LocalizedString;
    //return ReturnValue;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    //return;    
}

function OnEscapeKeyPress()
{
    MoveBackImpl();
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
        // End:0x2B
        case 'TitleString':
        // End:0x37
        case 'ConfirmString':
        // End:0x43
        case 'BackString':
        // End:0x87
        case 'textDesc':
            Widget.SetText(GetLocalizedString(string(WidgetName)));
            // End:0x99
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x99
            break;
            break;
    }
    // End:0xDB
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
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    // End:0x2D
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    bResult = false;
    // End:0x7A
    if(int(InputEvent) == int(1))
    {
        // End:0x7A
        if(ButtonName == 'XboxTypeS_B')
        {
            MoveBackImpl();
            bResult = true;
        }
    }
    return bResult;
    //return ReturnValue;    
}
