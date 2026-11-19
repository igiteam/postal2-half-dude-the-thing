/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendRecvReq extends XDOTZLiveFriendBase;




//Page components
var Automated GuiButton  AcceptRequest;
var Automated GuiButton  VoiceAttachment;
var Automated GuiButton  DeclineRequest;
var Automated GuiButton  BlockRequest;

var localized string Message;

var sound ClickSound;

//configurable stuff
var string BlockFriendMenu;    // Single Player menu location
var string AttachMenu;



/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    // if we are not signed in a multiplayer game, hide the invite stuff
    if (!class'UtilsXbox'.static.Messaging_Has_Voice_Attachment() ||
        class'UtilsXbox'.static.VoiceChat_Is_Local_Banned()) {        // Hide button and move up other two
        DeclineRequest.WinTop = DeclineRequest.WinTop - 0.075;
        BlockRequest.WinTop = BlockRequest.WinTop - 0.075;
        RemoveComponent(VoiceAttachment, true);
        MapControls();
    }
}


/**
 * Happens every time the menu is opened, not just the first.
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

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case AcceptRequest:
             class'UtilsXbox'.static.Friends_Accept_Friend_Request();
             Controller.CloseMenu(true);
             return false; break;

        case VoiceAttachment:
             Controller.OpenMenu(AttachMenu);
             return false; break;

        case DeclineRequest:
             //class'UtilsXbox'.static.Friends_Deny_Friend_Request();
             //Controller.CloseMenu(true);
             Controller.OpenMenu("DOTZMenu.XDOTZLiveDeclineFriend");
             return false; break;

        case BlockRequest:
             Controller.OpenMenu(BlockFriendMenu);
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
    // Reference: GUIButton'XDOTZLiveFriendRecvReq.AcceptRequest_btn'
    begin object name=AcceptRequest_btn class=Class'GUI.GUIButton'
        Caption="Accept Request"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvReq.ButtonClicked
    end object
    AcceptRequest=AcceptRequest_btn
    // Reference: GUIButton'XDOTZLiveFriendRecvReq.VoiceAttachment_btn'
    begin object name=VoiceAttachment_btn class=Class'GUI.GUIButton'
        Caption="Voice Attachment"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5750000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvReq.ButtonClicked
    end object
    VoiceAttachment=VoiceAttachment_btn
    // Reference: GUIButton'XDOTZLiveFriendRecvReq.DeclineRequest_btn'
    begin object name=DeclineRequest_btn class=Class'GUI.GUIButton'
        Caption="Decline Request"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvReq.ButtonClicked
    end object
    DeclineRequest=DeclineRequest_btn
    // Reference: GUIButton'XDOTZLiveFriendRecvReq.BlockRequest_btn'
    begin object name=BlockRequest_btn class=Class'GUI.GUIButton'
        Caption="Block Requests"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7250000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendRecvReq.ButtonClicked
    end object
    BlockRequest=BlockRequest_btn
    Message="This player has requested to be added to your friends list. What do you want to do?"
    ClickSound=Sound'DOTZXInterface.Select'
    BlockFriendMenu="DOTZMenu.XDOTZLiveBlockFriend"
    AttachMenu="DOTZMenu.XDOTZLiveFriendViewVoice"
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendRecvReq.HandleKeyEvent
}