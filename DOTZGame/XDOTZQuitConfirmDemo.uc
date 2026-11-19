/**
 * QuitConfirmDemo - YES/NO to quit confirmation.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.2 $
 * @date    Sept 2003
 */
class XDOTZQuitConfirmDemo extends XDOTZErrorPage;


var localized string QuitMessage;
var localized string Quit_string;

/*****************************************************************
 * Opened
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);
  AddBackButton(cancel_string);
  AddSelectButton(quit_string);
  SetErrorCaption(QuitMessage);
}


/*****************************************************************
 * DoButtonA
 *****************************************************************
 */
function DoButtonA(){
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   // Display loading screen
   Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenuDemo");
   //Controller.ConsoleCommand("RestartLevel");
   //Console(Controller.Master.Console).ConsoleCommand("RestartLevel");
}

/*****************************************************************
 * DoButtonB
 *****************************************************************
 */
function DoButtonB(){
   Controller.CloseMenu(false);
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    QuitMessage="Are you sure you wish to quit?"
    quit_string="Quit"
    OnKeyEvent=XDOTZQuitConfirmDemo.HandleKeyEvent
}