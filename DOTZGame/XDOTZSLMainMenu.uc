/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZSLMainMenu extends XDOTZLivePage;



//Page components
var Automated GuiButton  HostButton;
var Automated GuiButton  JoinButton;

//configurable stuff
var string HostMenu;
var string JoinMenu;
var string ErrorMenu;

//configurable stuff
var localized string PageCaption;


var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   SetPageCaption (PageCaption);
   AddBackButton ();
   AddSelectButton ();
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);


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
        case HostButton:
             return Controller.OpenMenu(HostMenu);
             break;

        case JoinButton:
             return Controller.OpenMenu(JoinMenu);
             break;

    };

   return false;
}

/*****************************************************************
 * B Button pressed
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * NotifyLevelChange
 *****************************************************************
 */

event NotifyLevelChange()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZSLMainMenu.HostButton_btn'
    begin object name=HostButton_btn class=Class'GUI.GUIButton'
        Caption="Create match"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZSLMainMenu.ButtonClicked
    end object
    HostButton=HostButton_btn
    // Reference: GUIButton'XDOTZSLMainMenu.JoinButton_btn'
    begin object name=JoinButton_btn class=Class'GUI.GUIButton'
        Caption="Join match"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZSLMainMenu.ButtonClicked
    end object
    JoinButton=JoinButton_btn
    HostMenu="DOTZMenu.XDOTZSLCreateMatch"
    JoinMenu="DOTZMenu.XDOTZSLJoin"
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    PageCaption="System Link"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZSLMainMenu.HandleKeyEvent
}