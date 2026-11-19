/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendBaseIG extends XDOTZLiveFriendsListBaseIG;




//Page components
var Automated GUILabel   Message;

//configurable stuff
var string RemoveFriendMenu;    // Single Player menu location
var string InviteFriendMenu;    // Single Player menu location
var string RecordVoiceMenu;    // Single Player menu location
var string PlayVoiceMenu;    // Single Player menu location
var string ClearVoiceMenu;    // Single Player menu location
var string InviteVoiceMenu;


// Sound
var sound ClickSound;

/*****************************************************************
 * Add page message
 *****************************************************************
 */

function SetPageMessage(string m) {
    Message.Caption = m;
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    local string gamer_tag;

    super.Opened(Sender);

    gamer_tag = class'UtilsXbox'.static.Friends_Get_Gamer_Tag();
    SetPageCaption(gamer_tag);

    AddBackButton ();
    AddSelectButton ();
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
 * NotifyLevelChange
 *
 *****************************************************************
 */
event NotifyLevelChange() {
    Controller.CloseMenu(true);
}

/*****************************************************************
 * B Button pressed
 *
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * DefaultProperties
 *
 *****************************************************************
 */

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZLiveFriendBaseIG.Message_lbl'
    begin object name=Message_lbl class=Class'GUI.GUILabel'
        TextFont="XBigFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.3000000
        RenderWeight=0.9000000
    end object
    Message=Message_lbl
    RemoveFriendMenu="DOTZMenu.XDOTZLiveRemoveFriendIG"
    RecordVoiceMenu="DOTZMenu.XDOTZRecordingVoiceMail"
    PlayVoiceMenu="DOTZMenu.XDOTZPlayingVoiceMail"
    ClearVoiceMenu="DOTZMenu.XDOTZClearingVoiceMail"
    InviteVoiceMenu="DOTZMenu.XDOTZLiveFriendVoiceMailOptionIG"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinLeft=0.1500000
    WinWidth=0.7000000
    WinHeight=0.5000000
}