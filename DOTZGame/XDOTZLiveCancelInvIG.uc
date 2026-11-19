//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveCancelInvIG extends XDOTZLiveCancelInv;

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Cancel_Invitation();
    BBGuiController(Controller).CloseTo ('XDOTZLiveFriendsListIG');
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    OnKeyEvent=XDOTZLiveCancelInvIG.HandleKeyEvent
}