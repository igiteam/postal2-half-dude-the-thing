/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendOnlineIG extends XDOTZLiveFriendBaseIG;




//Page components
var Automated GuiButton  InviteFriend;
var Automated GuiButton  RemoveFriend;
var Automated GuiButton  JoinFriend;

var localized string Message;
var string ErrorMenu;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    // if we are not signed in a multiplayer game, hide the invite stuff
    if (class'UtilsXbox'.static.Get_Reboot_Type() == 5 ||
        class'UtilsXbox'.static.Get_Reboot_Type() == 1 ||
        class'UtilsXbox'.static.Get_Reboot_Type() == 2) {      // 5 is single player game
        // Hide button and move up other two
        RemoveFriend.WinTop = RemoveFriend.WinTop - 0.1;
        RemoveComponent(InviteFriend, true);
        MapControls();
    }

    if (!class'UtilsXbox'.static.Friends_Is_Joinable()) {
        RemoveComponent(JoinFriend, true);
        MapControls();
    }
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    SetPageMessage(Message);
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
        case JoinFriend:
             // Check for cross title join
             isSameTitle = class'UtilsXbox'.static.Friends_Is_Invitation_For_Same_Title();

             // Check for the session being available
             class'UtilsXbox'.static.Friends_Get_Friends_Session();

             // Check for live sign in errors
             error = class'UtilsXbox'.static.Get_Last_Error();
             if (error > 0) {
                 Controller.OpenMenu(ErrorMenu);
             } else {

                 if (isSameTitle) {
                     if (class'UtilsXbox'.static.Get_Reboot_Type() == 5) {      // 5 is single player game

                        // Display loading screen
                        Controller.OpenMenu("DOTZMenu.XDOTZQuitConfirmJoining");

                     } else if (class'UtilsXbox'.static.Get_Reboot_Type() == 1 || class'UtilsXbox'.static.Get_Reboot_Type() == 3) {
                        // Display loading screen
                        Controller.OpenMenu("DOTZMenu.XDOTZHostQuitConfirmJoining");
                     } else {

                         //class'UtilsXbox'.static.Friends_Accept_Invitation();

                         // Reboot to live client
                         class'UtilsXbox'.static.Set_Reboot_Type(4);   // Is live client

                         // Display loading screen
                         //Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");

                         // Joining a friend
                         class'UtilsXbox'.static.Live_Client_Set_Joining_Friend(true);
                         class'UtilsXbox'.static.Live_Client_Set_Joining_Cross(false);

                         // Reboot!
                         //Console(Controller.Master.Console).ConsoleCommand("reboot");  // URL not part of command on xbox
                        // 0.0.0.0 Gets replaced with the real IP after reboot
                        // PlayerOwner().Level.ServerTravel("0.0.0.0", false);

                         Controller.OpenMenu("DOTZMenu.XDOTZCharacterSelect", "0.0.0.0");
                     }
                 } else {
                     class'UtilsXbox'.static.Friends_Join_Friend();
                     Controller.OpenMenu("DOTZMenu.XDOTZCrossTitleWarningJoining", class'UtilsXbox'.static.Friends_Get_Game_Name());
                 }
             }

             return false; break;

        case InviteFriend:
             if (!class'UtilsXbox'.static.VoiceChat_Is_Local_Banned()) {
                BBGuiController(Controller).SwitchMenu(InviteVoiceMenu);
             } else {
                class'UtilsXbox'.static.Friends_Send_Invitation_With_Voice();
                Controller.CloseMenu(false);
             }
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
    // Reference: GUIButton'XDOTZLiveFriendOnlineIG.InviteFriend_btn'
    begin object name=InviteFriend_btn class=Class'GUI.GUIButton'
        Caption="Invite Friend"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendOnlineIG.ButtonClicked
    end object
    InviteFriend=InviteFriend_btn
    // Reference: GUIButton'XDOTZLiveFriendOnlineIG.RemoveFriend_btn'
    begin object name=RemoveFriend_btn class=Class'GUI.GUIButton'
        Caption="Remove Friend"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendOnlineIG.ButtonClicked
    end object
    RemoveFriend=RemoveFriend_btn
    // Reference: GUIButton'XDOTZLiveFriendOnlineIG.JoinFriend_btn'
    begin object name=JoinFriend_btn class=Class'GUI.GUIButton'
        Caption="Join Friend"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendOnlineIG.ButtonClicked
    end object
    JoinFriend=JoinFriend_btn
    Message="What do you want to do with this friend?"
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendOnlineIG.HandleKeyEvent
}