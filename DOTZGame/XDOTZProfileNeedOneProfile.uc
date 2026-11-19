//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZProfileNeedOneProfile extends XDOTZErrorPage;

var sound ClickSound;

// Error string
var localized string error_string;

/*****************************************************************
 * Opened
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);

   AddSelectButton (continue_string);
   SetErrorCaption(error_string);
}

/*****************************************************************
 * This gets called every 1/2 second
 *****************************************************************
 */

function Periodic()
{

    // CARROT: hack to get the page behind updating
    if (Controller.MenuStack.Length >= 2)
        Controller.MenuStack[Controller.MenuStack.Length-2].Timer();
}

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    Controller.CloseMenu (false);
}

/*****************************************************************
 * Button B pressed
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu (false);
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    error_string="At least one profile must be created in order to continue. Press A to continue."
    period=0.1000000
    OnKeyEvent=XDOTZProfileNeedOneProfile.HandleKeyEvent
}