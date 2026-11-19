/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZMPDead extends DOTZInGamePage;



//Page components
var Automated GuiButton  PlayersListButton;
var Automated GuiButton  CycleButton;
var Automated GuiButton  QuitButton;

//configurable stuff
var string PlayersListMenu;           // Xbox Live menu location
var string ScoreboardListMenu;           // Xbox Live menu location
var string QuitMenu;                  // Profile menu location

//configurable stuff
var localized string PageCaption;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    SetPageCaption (PageCaption);

    if( PlayerOwner().Level.Game == None){

        QuitButton.WinTop = QuitButton.WinTop - 0.1;

        RemoveComponent(CycleButton, true);
        MapControls();
    }

    Controller.OpenMenu(ScoreboardListMenu);
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
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

    switch (Selected) {
        case PlayersListButton:
             return Controller.OpenMenu(PlayersListMenu);
             break;

        case CycleButton:
             PlayerOwner().Level.Game.RestartGame();
             break;

        case QuitButton:
             return Controller.OpenMenu(QuitMenu);
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
    // Reference: GUIButton'DOTZMPDead.PlayersListButton_btn'
    begin object name=PlayersListButton_btn class=Class'GUI.GUIButton'
        Caption="Scoreboard"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMPDead.ButtonClicked
    end object
    PlayersListButton=PlayersListButton_btn
    // Reference: GUIButton'DOTZMPDead.CycleButton_btn'
    begin object name=CycleButton_btn class=Class'GUI.GUIButton'
        Caption="Start Next Map"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMPDead.ButtonClicked
    end object
    CycleButton=CycleButton_btn
    // Reference: GUIButton'DOTZMPDead.QuitButton_btn'
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
        OnClick=DOTZMPDead.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    PlayersListMenu="DOTZMenu.DOTZPlayersListIG"
    ScoreboardListMenu="DOTZMenu.DOTZScoreboardIG"
    QuitMenu="DOTZMenu.DOTZMPQuitGameConfirm"
    PageCaption="You Died"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinLeft=0.2500000
    WinWidth=0.5000000
    WinHeight=0.5000000
    OnKeyEvent=DOTZMPDead.HandleKeyEvent
}