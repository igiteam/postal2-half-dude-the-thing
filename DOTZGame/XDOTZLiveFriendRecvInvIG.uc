/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendRecvInvIG extends XDOTZLiveFriendBaseIG;




//Page components
var Automated GuiButton  AcceptInvite;
var Automated GuiButton  VoiceAttachment;
var Automated GuiButton  DeclineInvite;
var Automated GuiButton  RemoveFriend;

var localized string Message;
var localized string MessageEnd;

var string ErrorMenu;
var string AttachMenu;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    // if we are not signed in a multiplayer game, hide the invite stuff
    if (!class'UtilsXbox'.static.Messaging_Has_Voice_Attachment() ||
        class'UtilsXbox'.static.VoiceChat_Is_Local_Banned()) {
        // Hide button and move up other two
        DeclineInvite.WinTop = DeclineInvite.WinTop - 0.1;
        RemoveFriend.WinTop = RemoveFriend.WinTop - 0.1;
        RemoveComponent(VoiceAttachment, true);
        MapControls();
    }
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    SetPageMessage(Message $ " " $ class'UtilsXbox'.static.Friends_Get_Game_Name() $ MessageEnd);
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
}



/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;
    local bool isSameTitle;
    local int error;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case AcceptInvite:


             // Check for cross title join
             isSameTitle = class'UtilsXbox'.static.Friends_Is_Invitation_For_Same_Title();

             if (isSameTitle) {
                 // Check for the session being available
                 class'UtilsXbox'.static.Friends_Get_Friends_Session();

                 // Check for live sign in errors
                 error = class'UtilsXbox'.static.Get_Last_Error();
                 if (error > 0) {
                    Controller.OpenMenu(ErrorMenu);
                 } else {
                    BBGuiController(Controller).SwitchMenu("DOTZMenu.XDOTZCharacterSelectInvited", "0.0.0.0");
                 }
             } else {
                 class'UtilsXbox'.static.Friends_Accept_Invitation();
                 Controller.OpenMenu("DOTZMenu.XDOTZCrossTitleWarning", class'UtilsXbox'.static.Friends_Get_Game_Name());
             }

             return false; break;

        case VoiceAttachment:
             Controller.OpenMenu(AttachMenu);
             return false; break;

        case DeclineInvite:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveDeclineInvIG");
             //class'UtilsXbox'.static.Friends_Deny_Invitation();
             //Controller.CloseMenu(true);
             return false; break;

        case RemoveFriend:
             Controller.OpenMenu(RemoveFriendMenu);
             return false; break;
    };

   return false;
}


/*****************************************************************
 * NotifyLevelChange
 *
 *****************************************************************
 */
event NotifyLevelChange() {
    Controller.CloseMenu(true);
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZLiveFriendRecvInvIG.AcceptInvite_btn'
    begin object name=AcceptInvite_btn class=Class'GUI.GUIButton'
        Caption="Accept Invitation"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvInvIG.ButtonClicked
    end object
    AcceptInvite=AcceptInvite_btn
    // Reference: GUIButton'XDOTZLiveFriendRecvInvIG.VoiceAttachment_btn'
    begin object name=VoiceAttachment_btn class=Class'GUI.GUIButton'
        Caption="Voice Attachment"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvInvIG.ButtonClicked
    end object
    VoiceAttachment=VoiceAttachment_btn
    // Reference: GUIButton'XDOTZLiveFriendRecvInvIG.DeclineInvite_btn'
    begin object name=DeclineInvite_btn class=Class'GUI.GUIButton'
        Caption="Decline Invitation"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvInvIG.ButtonClicked
    end object
    DeclineInvite=DeclineInvite_btn
    // Reference: GUIButton'XDOTZLiveFriendRecvInvIG.RemoveFriend_btn'
    begin object name=RemoveFriend_btn class=Class'GUI.GUIButton'
        Caption="Remove Friend"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvInvIG.ButtonClicked
    end object
    RemoveFriend=RemoveFriend_btn
    Message="This friend has invited you to play"
    MessageEnd="? Your current progress will be lost."
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    AttachMenu="DOTZMenu.XDOTZLiveFriendViewVoiceIG"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendRecvInvIG.HandleKeyEvent
}