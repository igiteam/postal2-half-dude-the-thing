//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveBlockFriendIG extends XDOTZLiveBlockFriend;

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Block_Friend_Request();
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsListIG');
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    OnKeyEvent=XDOTZLiveBlockFriendIG.HandleKeyEvent
}