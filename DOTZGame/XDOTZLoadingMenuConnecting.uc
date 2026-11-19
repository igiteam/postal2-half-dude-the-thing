//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLoadingMenuConnecting extends XDOTZLoadingMenu;

var int iteration;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);

   SetTimer(0.1,true);
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

function Timer ()
{
    ++iteration;
    if (iteration == 45) {
        if (!Controller.CheckExists('XDOTZMPDisconnect') && !Controller.CheckExists('XDOTZMPFailed')) {
            Controller.OpenMenu("DOTZMenu.XDOTZMPCancelConnect");
        }
    }
}

/*****************************************************************
 * Default properties.
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    OnKeyEvent=XDOTZLoadingMenuConnecting.HandleKeyEvent
}