//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZPlayingVoiceMail extends XDOTZErrorPage;

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

   class'UtilsXbox'.static.VoiceChat_Play_Voice_Mail();
}

/*****************************************************************
 * Button A pressed
 *****************************************************************
 */

function DoButtonA ()
{

}

/*****************************************************************
 * Button B pressed
 *****************************************************************
 */

function DoButtonB ()
{
    class'UtilsXbox'.static.VoiceChat_Stop_Voice_Mail();
}

/*****************************************************************
 * This gets called every 1/2 second
 *****************************************************************
 */

function Periodic ()
{
    local bool voice_stopped;
    local float bar_width;

    voice_stopped = class'UtilsXbox'.static.VoiceChat_Is_Stopped();
    if (voice_stopped) {
        Controller.CloseMenu(true);
    }

    bar_width = class'UtilsXbox'.static.VoiceChat_Get_Voice_Mail_Time() / 15.0 * 0.8;
    if (bar_width > 0.8)
        bar_width = 0.8;

    Log ("Bar Width " $ bar_width);

    BarFront.WinWidth = bar_width;
}

/*****************************************************************
 * default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    // Reference: GUIImage'XDOTZPlayingVoiceMail.BarFront_icn'
    begin object name=BarFront_icn class=Class'GUI.GUIImage'
        Image=Texture'BBTGuiContent.General.SquareBox_Watched'
        ImageStyle=1
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4500000
        WinLeft=0.1000000
        WinWidth=0.0000000
        WinHeight=0.0500000
        RenderWeight=0.5000000
    end object
    BarFront=BarFront_icn
    error_string="Playing Voice Mail attachment. Press B to cancel."
    period=0.1000000
    OnKeyEvent=XDOTZPlayingVoiceMail.HandleKeyEvent
}