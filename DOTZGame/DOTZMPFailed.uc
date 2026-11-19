/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZMPFailed extends DOTZInGamePage;



//Page components
var Automated GuiButton  QuitButton;
//var Automated GuiButton  PlayersListButton;
var Automated GUILabel   ErrorMessage;        // The error message to be displayed


//configurable stuff
var string PlayersListMenu;           // Xbox Live menu location
var string QuitMenu;                  // Profile menu location

var string LastURL;

//configurable stuff
var localized string PageCaption;
var localized string FailedCaption;

var int tickcount;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    Log("DOTZMPFailed InitComponent Called");
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    // CARROT HACK!!!!
    SetFocus(QuitButton);
    QuitButton.SetFocus(none);
}

/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied
 * here.
 *
 * Param1 - Alternate text
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    ErrorMessage.Caption = param1;

    Log("param1" @ param1);
    Log("default" @  class'AccessControl'.default.NeedPassword);

    if (param1 == class'AccessControl'.default.NeedPassword ||
        param1 == class'AccessControl'.default.WrongPassword) {
        Log("Show prompt for password");

        BBGuiController(Controller).SwitchMenu("DOTZMenu.DOTZGetPassword", default.LastURL);
    }

    //if (ErrorMessage.Caption == "You need to enter a password to join this game."){
//      BBGuiController(Controller).SwitchMenu("DOTZMenu.DOTZGetPassword",);
  //  }
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
 * HandleKeyEven
 * Intercepts A and B presses
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {
    return true;
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

    Log("DOTZMPFailed ButtonClicked Called");

    switch (Selected) {
        //case PlayersListButton:
        //     return Controller.OpenMenu(PlayersListMenu);
        //     break;

         case QuitButton:
            Controller.OpenMenu("DOTZMenu.DOTZLoadingMenu");
            //PlayerOwner().ConsoleCommand("Disconnect");
            PlayerOwner().ConsoleCommand("start MainMenu.dz");
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
    // Reference: GUIButton'DOTZMPFailed.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZMPFailed.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    // Reference: GUILabel'DOTZMPFailed.ErrorMessage_lbl'
    begin object name=ErrorMessage_lbl class=Class'GUI.GUILabel'
        TextFont="BigGuiFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage=ErrorMessage_lbl
    PlayersListMenu="DOTZMenu.DOTZPlayersListIG"
    QuitMenu="DOTZMenu.XDOTZSPLevelList"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=DOTZMPFailed.HandleKeyEvent
}