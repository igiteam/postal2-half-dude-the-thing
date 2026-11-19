/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZSPDead extends DOTZInGamePage;



//Page components
var Automated GuiButton  RevertToLastSaveButton;
var Automated GuiButton  QuitButton;

//configurable stuff
var string LoadMenu;      // System Link menu location

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
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    Log(self $ "Opened");

    //don't exactly know what is going on here, but if you leave this
    //page and return to it, it seems to have nothing focused properly
    //so rather than understanding the problem, we 'fix' it by force as
    //is the game development way apparently.
    SetFocus(RevertToLastSaveButton);
    RevertToLastSaveButton.SetFocus(none);

    //MapControls();
//    RevertToLastSaveButton.MenuState = MSAT_Focused;

}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
    Log(self $ "Closed");
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

    PlayerOwner().PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case RevertToLastSaveButton:
            return Controller.OpenMenu(LoadMenu);
            break;

        case QuitButton:
            Controller.OpenMenu("DOTZMenu.DOTZLoadingMenu");
            PlayerOwner().Level.ServerTravel("MainMenu.dz",false);
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
    // Reference: GUIButton'DOTZSPDead.RevertToLastSaveButton_btn'
    begin object name=RevertToLastSaveButton_btn class=Class'GUI.GUIButton'
        Caption="Load Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=DOTZSPDead.ButtonClicked
    end object
    RevertToLastSaveButton=RevertToLastSaveButton_btn
    // Reference: GUIButton'DOTZSPDead.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZSPDead.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    LoadMenu="DOTZMenu.DOTZLoadMenuIG"
    PageCaption="You Died Loser"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinLeft=0.2500000
    WinWidth=0.5000000
    WinHeight=0.5000000
    OnKeyEvent=DOTZSPDead.HandleKeyEvent
}