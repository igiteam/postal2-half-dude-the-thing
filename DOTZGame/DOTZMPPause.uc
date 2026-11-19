/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZMPPause extends DOTZInGamePage;



//Page components
var Automated GuiButton  ContinueButton;
var Automated GuiButton  SwitchTeamsButton;
var Automated GuiButton  PlayersListButton;
var Automated GuiButton  OptionsButton;
var Automated GuiButton  QuitButton;

//configurable stuff
var string ContinueMenu;              // Single Player menu location
var string PlayersListMenu;           // Xbox Live menu location
var string OptionsMenu;      // System Link menu location
var string QuitMenu;                  // Profile menu location

//configurable stuff
var localized string PageCaption;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    local bool bTeamGame;

    Super.Initcomponent(MyController, MyOwner);

    SetPageCaption (PageCaption);

    bTeamGame = PlayerOwner().GameReplicationInfo.bTeamGame;

    //remove the switch teams option if not a team game
    if( (PlayerOwner() != none && PlayerOwner().GameReplicationInfo != none &&
        !PlayerOwner().GameReplicationInfo.bTeamGame) ||
        (PlayerOwner() != none && PlayerOwner().GameReplicationInfo != none &&
        !PlayerOwner().GameReplicationInfo.bAllowedToSwitchTeams)){

        PlayersListButton.WinTop = PlayersListButton.WinTop - 0.1;
        OptionsButton.WinTop = OptionsButton.WinTop - 0.1;
        QuitButton.WinTop = QuitButton.WinTop - 0.1;

        RemoveComponent(SwitchTeamsButton, true);
        MapControls();
    }
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
        case ContinueButton:
             Controller.ViewportOwner.Actor.SetPause(false);
             return Controller.CloseMenu(true);
             break;

        case SwitchTeamsButton:
             Controller.OpenMenu("DOTZMenu.DOTZSwitchTeamsConfirm");
             //DoButtonB ();
             return false;
             break;

        case PlayersListButton:
             return Controller.OpenMenu(PlayersListMenu);
             break;

        case OptionsButton:
             return Controller.OpenMenu(OptionsMenu);
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
    // Reference: GUIButton'DOTZMPPause.ContinueButton_btn'
    begin object name=ContinueButton_btn class=Class'GUI.GUIButton'
        Caption="Continue"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        bFocusOnWatch=true
        OnClick=DOTZMPPause.ButtonClicked
    end object
    ContinueButton=ContinueButton_btn
    // Reference: GUIButton'DOTZMPPause.SwitchTeamsButton_btn'
    begin object name=SwitchTeamsButton_btn class=Class'GUI.GUIButton'
        Caption="Switch Teams"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        bFocusOnWatch=true
        OnClick=DOTZMPPause.ButtonClicked
    end object
    SwitchTeamsButton=SwitchTeamsButton_btn
    // Reference: GUIButton'DOTZMPPause.PlayersListButton_btn'
    begin object name=PlayersListButton_btn class=Class'GUI.GUIButton'
        Caption="Scoreboard"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMPPause.ButtonClicked
    end object
    PlayersListButton=PlayersListButton_btn
    // Reference: GUIButton'DOTZMPPause.OptionsButton_btn'
    begin object name=OptionsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZMPPause.ButtonClicked
    end object
    OptionsButton=OptionsButton_btn
    // Reference: GUIButton'DOTZMPPause.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZMPPause.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    ContinueMenu="DOTZMenu.DOTZSPLevelList"
    PlayersListMenu="DOTZMenu.DOTZPlayersListIG"
    OptionsMenu="DOTZMenu.DOTZSettingsMenuIG"
    QuitMenu="DOTZMenu.DOTZMPQuitGameConfirm"
    PageCaption="Paused"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinLeft=0.2500000
    WinWidth=0.5000000
    WinHeight=0.5000000
    OnKeyEvent=DOTZMPPause.HandleKeyEvent
}