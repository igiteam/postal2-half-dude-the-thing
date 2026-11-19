//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveDeclineInvIG extends XDOTZLiveDeclineInv;

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Deny_Invitation();
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsListIG');
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    OnKeyEvent=XDOTZLiveDeclineInvIG.HandleKeyEvent
}