//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveRemoveFriend extends XDOTZErrorPage;

var sound ClickSound;

// Error string
var localized string error_string;

/*****************************************************************
 * Opened
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);

   AddBackButton(cancel_string);
   AddSelectButton (accept_string);

   SetErrorCaption(error_string);
}

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Remove_Friend();
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsList');
}

/*****************************************************************
 * Button B pressed
 *****************************************************************
 */

function DoButtonB ()
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
    ClickSound=Sound'DOTZXInterface.Select'
    error_string="Do you really want to remove this friend? Press A to accept or B to cancel."
    OnKeyEvent=XDOTZLiveRemoveFriend.HandleKeyEvent
}