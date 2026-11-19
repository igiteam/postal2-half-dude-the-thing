//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZLivePlayerVoiceMailOptionIG extends XDOTZLivePlayerBaseIG;



var sound ClickSound;

var Automated GuiButton  Yes_Button;
var Automated GuiButton  No_Button;

var localized string Message;

/*****************************************************************
 * Opened
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);

   SetPageMessage(Message);
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
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case Yes_Button:
            BBGuiController(Controller).SwitchMenu("DOTZMenu.XDOTZLivePlayerRequestVoiceIG",Gamertag,Xuid);
            return false; break;

        case No_Button:
            class'UtilsXbox'.static.Friends_Send_Friend_Request_With_Voice(Xuid);
            Controller.CloseMenu(true);
            return false; break;
    };

   return false;
}

/*****************************************************************
 * default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    // Reference: GUIButton'XDOTZLivePlayerVoiceMailOptionIG.Yes_Button_btn'
    begin object name=Yes_Button_btn class=Class'GUI.GUIButton'
        Caption="Yes"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerVoiceMailOptionIG.ButtonClicked
    end object
    Yes_Button=Yes_Button_btn
    // Reference: GUIButton'XDOTZLivePlayerVoiceMailOptionIG.No_Button_btn'
    begin object name=No_Button_btn class=Class'GUI.GUIButton'
        Caption="No"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerVoiceMailOptionIG.ButtonClicked
    end object
    No_Button=No_Button_btn
    Message="Do you want to send a voice mail attachment?"
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLivePlayerVoiceMailOptionIG.HandleKeyEvent
}