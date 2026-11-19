/**
 * XDOTZSPDeadDemo - demo dead menu
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    June 24, 2005
 */

class XDOTZSPDeadDemo extends XDOTZInGamePage;



//Page components
var Automated GuiButton  RevertToLastSaveButton;
var Automated GuiButton  QuitButton;

//configurable stuff
var localized string PageCaption;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);


    Log(self $ "InitComponent");
    SetPageCaption (PageCaption);
    //AddBackButton ();
    AddSelectButton ();
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    //don't exactly know what is going on here, but if you leave this
    //page and return to it, it seems to have nothing focused properly
    //so rather than understanding the problem, we 'fix' it by force as
    //is the game development way apparently.
    SetFocus(RevertToLastSaveButton);
    RevertToLastSaveButton.SetFocus(none);

}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
}



function Periodic ()
{
    super.Periodic();
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

    PlayerOwner().PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {

        case RevertToLastSaveButton:
             return Controller.OpenMenu("");
             break;

        case QuitButton:
             Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");
             Controller.ConsoleCommand("RestartLevel");
             break;
    };

   return false;
}

/*****************************************************************
 * Continue if B pressed too
 *
 *****************************************************************
 */

function DoButtonB ()
{

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
    // Reference: GUIButton'XDOTZSPDeadDemo.RevertToLastSaveButton_btn'
    begin object name=RevertToLastSaveButton_btn class=Class'GUI.GUIButton'
        Caption="Load Game"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        OnClick=XDOTZSPDeadDemo.ButtonClicked
    end object
    RevertToLastSaveButton=RevertToLastSaveButton_btn
    // Reference: GUIButton'XDOTZSPDeadDemo.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZSPDeadDemo.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    PageCaption="You Died Loser"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=XDOTZSPDeadDemo.HandleKeyEvent
}