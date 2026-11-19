/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendSendInviteVoiceIG extends XDOTZLiveFriendBaseIG;




//Page components

var Automated GuiButton  ClearVoiceMail;
var Automated GuiButton  RecordVoiceMail;
var Automated GuiButton  PlayVoiceMail;
var Automated GuiButton  InviteFriend;

var localized string Message;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    class'UtilsXbox'.static.VoiceChat_Clear_Voice_Mail();
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

   class'UtilsXbox'.static.VoiceChat_Clear_Voice_Mail();
}

/*****************************************************************
 * B Button pressed
 *
 *****************************************************************
 */

function DoButtonB ()
{
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsListIG');
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case InviteFriend:
             class'UtilsXbox'.static.Friends_Send_Invitation_With_Voice();
             BBGuiController(Controller).CloseTo('XDOTZLiveFriendsListIG');
             return false; break;

        case ClearVoiceMail:
             Controller.OpenMenu(ClearVoiceMenu);
             return false; break;

        case RecordVoiceMail:
             if (class'UtilsXbox'.static.VoiceChat_Is_Local_Enabled()) {
                Controller.OpenMenu(RecordVoiceMenu);
             }
             return false; break;

        case PlayVoiceMail:
             if (class'UtilsXbox'.static.VoiceChat_Is_Local_Enabled()) {
                Controller.OpenMenu(PlayVoiceMenu);
             }
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
    // Reference: GUIButton'XDOTZLiveFriendSendInviteVoiceIG.ClearVoiceMail_btn'
    begin object name=ClearVoiceMail_btn class=Class'GUI.GUIButton'
        Caption="Clear Voice Mail"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendSendInviteVoiceIG.ButtonClicked
    end object
    ClearVoiceMail=ClearVoiceMail_btn
    // Reference: GUIButton'XDOTZLiveFriendSendInviteVoiceIG.RecordVoiceMail_btn'
    begin object name=RecordVoiceMail_btn class=Class'GUI.GUIButton'
        Caption="Record Voice Mail"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendSendInviteVoiceIG.ButtonClicked
    end object
    RecordVoiceMail=RecordVoiceMail_btn
    // Reference: GUIButton'XDOTZLiveFriendSendInviteVoiceIG.PlayVoiceMail_btn'
    begin object name=PlayVoiceMail_btn class=Class'GUI.GUIButton'
        Caption="Play Voice Mail"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendSendInviteVoiceIG.ButtonClicked
    end object
    PlayVoiceMail=PlayVoiceMail_btn
    // Reference: GUIButton'XDOTZLiveFriendSendInviteVoiceIG.InviteFriend_btn'
    begin object name=InviteFriend_btn class=Class'GUI.GUIButton'
        Caption="Invite Friend"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendSendInviteVoiceIG.ButtonClicked
    end object
    InviteFriend=InviteFriend_btn
    Message="Do you want to attach a voice message?"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendSendInviteVoiceIG.HandleKeyEvent
}