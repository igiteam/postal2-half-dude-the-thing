/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveFriendSentInv extends XDOTZLiveFriendBase;




//Page components
//var Automated GuiButton  CancelInvite;
var Automated GuiButton  RemoveFriend;

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
        /*case CancelInvite:
             class'UtilsXbox'.static.Friends_Cancel_Invitation();
             Controller.CloseMenu(true);
             return false; break;*/

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
    // Reference: GUIButton'XDOTZLiveFriendSentInv.RemoveFriend_btn'
    begin object name=RemoveFriend_btn class=Class'GUI.GUIButton'
        Caption="Remove Friend"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0749000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLiveFriendSentInv.ButtonClicked
    end object
    RemoveFriend=RemoveFriend_btn
    Message="What do you want to do with this friend?"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveFriendSentInv.HandleKeyEvent
}