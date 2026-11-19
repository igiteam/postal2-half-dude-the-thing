//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZVoiceMailOption extends XDOTZErrorPage;

var sound ClickSound;

var Automated GUIImage   BarFront;

// Error string
var localized string error_string;

/*****************************************************************
 * Opened
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);

   SetErrorCaption(error_string);
   AddBackButton (cancel_string);
}

/*****************************************************************
 * Button B pressed
 *****************************************************************
 */

function DoButtonB ()
{

}

/*****************************************************************
 * default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    error_string="Do you want to send a voice mail attachment?"
    OnKeyEvent=XDOTZVoiceMailOption.HandleKeyEvent
}