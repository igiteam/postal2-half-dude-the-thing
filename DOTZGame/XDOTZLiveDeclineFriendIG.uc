//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveDeclineFriendIG extends XDOTZLiveDeclineFriend;

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Deny_Friend_Request();
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsListIG');
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    OnKeyEvent=XDOTZLiveDeclineFriendIG.HandleKeyEvent
}