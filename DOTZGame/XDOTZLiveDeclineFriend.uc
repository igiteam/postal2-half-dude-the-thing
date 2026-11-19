//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveDeclineFriend extends XDOTZErrorPage;

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
   AddSelectButton (decline_string);

   SetErrorCaption(error_string);
}

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Deny_Friend_Request();
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
    error_string="Do you really want to decline this friend request? Press A to decline or B to cancel."
    OnKeyEvent=XDOTZLiveDeclineFriend.HandleKeyEvent
}