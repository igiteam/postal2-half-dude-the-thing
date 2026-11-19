//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZProfileNeedActiveProfile extends XDOTZErrorPage;

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
    error_string="You must select a profile. Press A to continue."
    period=0.1000000
    OnKeyEvent=XDOTZProfileNeedActiveProfile.HandleKeyEvent
}