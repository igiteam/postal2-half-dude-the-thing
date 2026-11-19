class LPGFxFrontEnd_MPFriendsList extends LPGFxHUD_PauseMPFriendsList within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Title;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    SetMPMode(true);
    //return;    
}

function UpdateTitle()
{
    Title.GetObject("textField").SetText(ViewTitle);
    //return;    
}

function SetMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInMPMode[8388609];

    ActionScriptVoid("setMPMode");
    //return;    
}

function Select_Friend()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x2DB
    if(ConfirmMC != none)
    {
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ConfirmInviteFriend_Title>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ConfirmInviteFriend_Body>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ConfirmInviteFriend_Confirm>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ConfirmInviteFriend_No>");
        ConfirmMC.SetButtonOnPress(0, InviteFriendYes);
        ConfirmMC.SetButtonOnPress(1, InviteFriendNo);
        ConfirmMC.SetDefaultFocusedButton(0);
    }
    //return;    
}

function InviteFriendYes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], OnlineSub, Uid;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    Uid = Friends[CurrentSelectedFriendIndex].UniqueId;
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    // End:0x1EB
    if(!OnlineSub.PlayerInterface.SendGameInviteToFriend(byte(Outer.GetLP().ControllerId), Uid, GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.MPInviteMessage>")))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorSendGameInvite_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
    }
    //return;    
}

function InviteFriendNo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
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
        // End:0x4B
        case 'TitleString':
            Title = Widget;
            UpdateTitle();
            // End:0x163
            break;
        // End:0xBF
        case 'DefaultString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Invite>"));
            // End:0x163
            break;
        // End:0xF0
        case 'ConfirmString':
            Widget.SetText("");
            // End:0x163
            break;
        // End:0x151
        case 'BackString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x163
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x163
            break;
            break;
    }
    // End:0x1A2
    if(!bWasHandled)
    {
        bWasHandled = super(LPGFxFrontEnd_Screen).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

defaultproperties
{
    bShouldHideViewStack=false
    PushTransitionTime=0.0000000
}