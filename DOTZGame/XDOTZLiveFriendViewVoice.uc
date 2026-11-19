/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendViewVoice extends XDOTZLiveFriendBase;




//Page components
var Automated GuiButton  PlayVoiceAttachment;
var Automated GuiButton  OffensiveMessageFeedback;

var localized string Message;

var string ErrorMenu;
var string OffensiveMsgMenu;    // Single Player menu location

var sound ClickSound;


/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    class'UtilsXbox'.static.Messaging_Download_Voice_Attachment();
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    SetPageMessage(Message $ " " $ class'UtilsXbox'.static.Friends_Get_Game_Name());


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

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case PlayVoiceAttachment:
             Controller.OpenMenu(PlayVoiceMenu);
             return false; break;

        case OffensiveMessageFeedback:
             Controller.OpenMenu(   OffensiveMsgMenu,
                                    class'UtilsXbox'.static.Messaging_Get_Sender_Gamertag(),
                                    class'UtilsXbox'.static.Messaging_Get_Sender_XUID() );
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
    // Reference: GUIButton'XDOTZLiveFriendViewVoice.PlayVoiceAttachment_btn'
    begin object name=PlayVoiceAttachment_btn class=Class'GUI.GUIButton'
        Caption="Play Voice Attachment"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendViewVoice.ButtonClicked
    end object
    PlayVoiceAttachment=PlayVoiceAttachment_btn
    // Reference: GUIButton'XDOTZLiveFriendViewVoice.OffensiveMessageFeedback_btn'
    begin object name=OffensiveMessageFeedback_btn class=Class'GUI.GUIButton'
        Caption="Offensive Message"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5750000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendViewVoice.ButtonClicked
    end object
    OffensiveMessageFeedback=OffensiveMessageFeedback_btn
    Message="Voice mail attachment"
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    OffensiveMsgMenu="DOTZMenu.XDOTZLiveComplaintOffensiveMsg"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendViewVoice.HandleKeyEvent
}