/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendSentReq extends XDOTZLiveFriendBase;




//Page components
var Automated GuiButton  CancelRequest;

var localized string Message;

var sound ClickSound;


/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);
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
        case CancelRequest:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveCancelFriendReq");
             //class'UtilsXbox'.static.Friends_Cancel_Friend_Request();
             //Controller.CloseMenu(true);
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
    // Reference: GUIButton'XDOTZLiveFriendSentReq.CancelRequest_btn'
    begin object name=CancelRequest_btn class=Class'GUI.GUIButton'
        Caption="Cancel Request"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendSentReq.ButtonClicked
    end object
    CancelRequest=CancelRequest_btn
    Message="Do you want to cancel the request?"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendSentReq.HandleKeyEvent
}