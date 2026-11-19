class LPGFxFrontEnd_CommunityUpdate extends SPGFxUIView within GFxMoviePlayer
    config(UI);

struct CommunityUpdateInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UpdateTitle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UpdateText;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int StartDate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int StartMonth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int StartYear;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EndDate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EndMonth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EndYear;

    structdefaultproperties
    {
        UpdateTitle=""
        UpdateText=""
        StartDate=0
        StartMonth=0
        StartYear=0
        EndDate=0
        EndMonth=0
        EndYear=0
    }
};

struct EnvironmentConditionInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ConditionName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ImageName;

    structdefaultproperties
    {
        ConditionName=""
        DisplayName=""
        ImageName=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array EnvironmentConditionList[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CommunityUpdates[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentConditions[1073741825];

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
    SetEnvironmentImage(GetConditionsImageName());
    Outer.SetExternalInterface(self);
    //return;    
}

function OnViewClosed()
{
    Outer.SetExternalInterface(MoviePlayer);
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
        // End:0x8B
        case 'TitleString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.CommunityUpdate>"));
            // End:0x256
            break;
        // End:0xEF
        case 'ConfirmString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
            // End:0x256
            break;
        // End:0x150
        case 'BackString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x256
            break;
        // End:0x1BE
        case 'CurConditionsString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.CurrentConditions>"));
            // End:0x256
            break;
        // End:0x201
        case 'ConditionsString':
            Widget.SetText(GetLocalizedString(GetConditionsDisplayName()));
            // End:0x256
            break;
        // End:0x244
        case 'BodyText':
            Widget.SetString("htmlText", BuildHTMLBodyText());
            // End:0x256
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x256
            break;
            break;
    }
    // End:0x298
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
            MoveToNext();
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function MoveToNext()
{
    // End:0x9E
    if(MenuViewLoader != none)
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
        MenuViewLoader.PushViewByName('PartyLobbyInternet', MenuViewLoader.GetViewWidgetByName('OnlineMode'));
    }
    //return;    
}

function GetConditionsDisplayName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(Idx < EnvironmentConditionList.Length)
    {
        // End:0x7E
        if(CurrentConditions == EnvironmentConditionList[Idx].ConditionName)
        {
            return EnvironmentConditionList[Idx].DisplayName;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return ReturnValue;    
}

function GetConditionsImageName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(Idx < EnvironmentConditionList.Length)
    {
        // End:0x7E
        if(CurrentConditions == EnvironmentConditionList[Idx].ConditionName)
        {
            return EnvironmentConditionList[Idx].ImageName;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return ReturnValue;    
}

function BuildHTMLBodyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], HTMLString;
    local /*0x97E50000-0x00000000*/ private @NULL LP;
    local /*0x97E50000-0x00000000*/ private int Idx;

    LP = MoviePlayer.GetLP();
    Idx = 0;
    J0x34:

    // End:0x38C [Loop If]
    if(Idx < CommunityUpdates.Length)
    {
        HTMLString = HTMLString $ "<p align=\"right\">";
        // End:0x24C
        if(CommunityUpdates[Idx].StartDate > 0)
        {
            HTMLString = (((((HTMLString $ "<b><font color='#00BFFF'>") $ string(CommunityUpdates[Idx].StartMonth)) $ "/") $ string(CommunityUpdates[Idx].StartDate)) $ "/") $ string(CommunityUpdates[Idx].StartYear);
            // End:0x226
            if(CommunityUpdates[Idx].EndDate > 0)
            {
                HTMLString = (((((HTMLString $ " - ") $ string(CommunityUpdates[Idx].EndMonth)) $ "/") $ string(CommunityUpdates[Idx].EndDate)) $ "/") $ string(CommunityUpdates[Idx].EndYear);
            }
            HTMLString = HTMLString $ "</b></font><br>";
        }
        HTMLString = ((HTMLString $ "<b><font color='#4169E1'>") $ Class'GFxUI.GFxObject'.static.TranslateString(CommunityUpdates[Idx].UpdateTitle, LP.GetTranslationContext())) $ "</font></b><br>";
        HTMLString = (HTMLString $ Class'GFxUI.GFxObject'.static.TranslateString(CommunityUpdates[Idx].UpdateText, LP.GetTranslationContext())) $ "</p><br><br>";
        Idx++;
        // [Loop Continue]
        goto J0x34;
    }
    return HTMLString;
    //return ReturnValue;    
}

function MoveBackImpl()
{
    SPPlayerController(Outer.GetPC()).ReturnToMainMenu();
    //return;    
}

function SetEnvironmentImage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EnvImageName[8388609];

    ActionScriptVoid("SetEnvironmentImage");
    //return;    
}

defaultproperties
{
    EnvironmentConditionList=/* Array type was not detected. */
    CommunityUpdates=/* Array type was not detected. */
    CurrentConditions="Clear"
}