//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveCancelFriendReqIG extends XDOTZLiveCancelFriendReq;

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Cancel_Friend_Request();
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsListIG');
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    OnKeyEvent=XDOTZLiveCancelFriendReqIG.HandleKeyEvent
}