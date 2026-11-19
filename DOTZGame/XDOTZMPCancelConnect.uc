/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZMPCancelConnect extends XDOTZInGamePage;



//Page components
var Automated GUILabel   ErrorMessage;        // The error message to be displayed

//configurable stuff
var localized string PageCaption;
var localized string GeneralError;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    SetPageCaption (PageCaption);
    AddContinueButton ();
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    ErrorMessage.Caption = GeneralError;

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
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    DoButtonB ();
}

/*****************************************************************
 * Continue if B pressed too
 *
 *****************************************************************
 */

function DoButtonB ()
{
    class'UtilsXbox'.static.Set_Reboot_Type(6);   // IS_RETURN_FROM_SINGLE_PLAYER

    // Display loading screen
    Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");

    // Reboot!
    Console(Controller.Master.Console).ConsoleCommand("reboot");  // URL not part of command on xbox
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
    // Reference: GUILabel'XDOTZMPCancelConnect.ErrorMessage_lbl'
    begin object name=ErrorMessage_lbl class=Class'GUI.GUILabel'
        TextFont="BigGuiFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage=ErrorMessage_lbl
    PageCaption="Connecting..."
    GeneralError="This game session is full or no longer available. Press A to continue."
    ClickSound=Sound'DOTZXInterface.Select'
    period=3.0000000
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=XDOTZMPCancelConnect.HandleKeyEvent
}