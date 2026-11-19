/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLivePlayerFeedbackIG extends XDOTZLivePlayerBaseIG;




//Page components
var Automated GuiButton     GreatSessionButton;
var Automated GuiButton     GoodAttitudeButton;

var Automated GuiButton     BadNameButton;
var Automated GuiButton     CursingButton;
var Automated GuiButton     ScreamingButton;
var Automated GuiButton     CheatingButton;
var Automated GuiButton     ThreatsButton;

var localized string Message;

var sound ClickSound;

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
}

/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied
 * here.
 *
 * Param1 - the menu to load
 * Param2 - the name of the sub menu to load on top of the first menu
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    super.HandleParameters(param1, param2);

    SetPageMessage(Message $ " " $ Gamertag);
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
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

	/*
    GREAT_SESSION = 0
	GOOD_ATTITUDE = 1
	BAD_NAME = 2
	CURSING = 3
	SCREAMING = 4
	CHEATING = 5
	THREATS = 6
	*/

    switch (Selected) {
        case GreatSessionButton:
             class'UtilsXbox'.static.Friends_Send_Feedback(Gamertag, Xuid, 0);
             BBGuiController(Controller).CloseTo ('XDOTZLivePlayerSelectIG');
             return false;
             break;

        case GoodAttitudeButton:
             class'UtilsXbox'.static.Friends_Send_Feedback(Gamertag, Xuid, 1);
             BBGuiController(Controller).CloseTo ('XDOTZLivePlayerSelectIG');
             return false;
             break;

        case BadNameButton:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveComplaintBadName", Gamertag, Xuid);
             return false;
             break;

        case CursingButton:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveComplaintCursing", Gamertag, Xuid);
             return false;
             break;

        case ScreamingButton:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveComplaintScreaming", Gamertag, Xuid);
             return false;
             break;

        case CheatingButton:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveComplaintCheating", Gamertag, Xuid);
             return false;
             break;

        case ThreatsButton:
             Controller.OpenMenu("DOTZMenu.XDOTZLiveComplaintThreats", Gamertag, Xuid);
             return false;
             break;
    };

   return false;
}


/*****************************************************************
 * NotifyLevelChange
 *
 *****************************************************************
 */
event NotifyLevelChange() {
    Controller.CloseMenu(true);
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.GreatSessionButton_btn'
    begin object name=GreatSessionButton_btn class=Class'GUI.GUIButton'
        Caption="Great Session"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    GreatSessionButton=GreatSessionButton_btn
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.GoodAttitudeButton_btn'
    begin object name=GoodAttitudeButton_btn class=Class'GUI.GUIButton'
        Caption="Good Attitude"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    GoodAttitudeButton=GoodAttitudeButton_btn
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.BadNameButton_btn'
    begin object name=BadNameButton_btn class=Class'GUI.GUIButton'
        Caption="Bad Name"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.5000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    BadNameButton=BadNameButton_btn
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.CursingButton_btn'
    begin object name=CursingButton_btn class=Class'GUI.GUIButton'
        Caption="Cursing or Lewdness"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7000000
        WinLeft=0.5000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    CursingButton=CursingButton_btn
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.ScreamingButton_btn'
    begin object name=ScreamingButton_btn class=Class'GUI.GUIButton'
        Caption="Screaming"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.5000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    ScreamingButton=ScreamingButton_btn
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.CheatingButton_btn'
    begin object name=CheatingButton_btn class=Class'GUI.GUIButton'
        Caption="Cheating"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.5000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    CheatingButton=CheatingButton_btn
    // Reference: GUIButton'XDOTZLivePlayerFeedbackIG.ThreatsButton_btn'
    begin object name=ThreatsButton_btn class=Class'GUI.GUIButton'
        Caption="Threats or Harassment"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.5000000
        WinWidth=0.5000000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZLivePlayerFeedbackIG.ButtonClicked
    end object
    ThreatsButton=ThreatsButton_btn
    Message="Feedback for"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLivePlayerFeedbackIG.HandleKeyEvent
}