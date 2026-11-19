//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLiveMessage extends XDOTZErrorPage;

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
   AddBackButton (read_later_string);
   AddSelectButton (read_now_string);
}

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{
    //class'UtilsXbox'.static.Do_Message_Check();
    Controller.OpenMenu("DOTZMenu.XDOTZLiveMessageConfirm");
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
    error_string="You have a new Xbox Live message. Press A to read now or B to read later."
    OnKeyEvent=XDOTZLiveMessage.HandleKeyEvent
}