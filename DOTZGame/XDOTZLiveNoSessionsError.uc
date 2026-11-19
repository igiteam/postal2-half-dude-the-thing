//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveNoSessionsError extends XDOTZErrorPage;

var sound ClickSound;

// Error string
var localized string error_string;

/*****************************************************************
 * Opened
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);

   SetErrorCaption(error_string);
   AddBackButton(cancel_string);
   AddSelectButton (create_match_string);
}

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    BBGuiController(Controller).SwitchMenu("DOTZMenu.XDOTZLiveCreateMatch");
}

/*****************************************************************
 * Button B pressed
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu( true );
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    error_string="There are no sessions currently available. Press A to create a session or press B to go back."
    OnKeyEvent=XDOTZLiveNoSessionsError.HandleKeyEvent
}