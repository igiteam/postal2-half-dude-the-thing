/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZSPPause extends DOTZInGamePage;



//Page components
var Automated GuiButton  ContinueButton;
var Automated GuiButton  LoadButton;
var Automated GuiButton  SaveButton;
var Automated GuiButton  OptionsButton;
var Automated GuiButton  QuitButton;

//configurable stuff
var string ContinueMenu;              // Single Player menu location
var string LoadMenu;
var string SaveMenu;
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
    Super.Initcomponent(MyController, MyOwner);

    SetPageCaption (PageCaption);
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

     // Add a delay before accepting input
    accept_input = false;
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

        case LoadButton:
             return Controller.OpenMenu(LoadMenu);
             break;

        case SaveButton:
             return Controller.OpenMenu(SaveMenu);
             break;

        //case LoadButton:
             //return Controller.OpenMenu(LoadMenu,"true");
             //break;

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
    //Controller.CloseMenu(true);
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZSPPause.ContinueButton_btn'
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
        OnClick=DOTZSPPause.ButtonClicked
    end object
    ContinueButton=ContinueButton_btn
    // Reference: GUIButton'DOTZSPPause.LoadButton_btn'
    begin object name=LoadButton_btn class=Class'GUI.GUIButton'
        Caption="Load Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=DOTZSPPause.ButtonClicked
    end object
    LoadButton=LoadButton_btn
    // Reference: GUIButton'DOTZSPPause.SaveButton_btn'
    begin object name=SaveButton_btn class=Class'GUI.GUIButton'
        Caption="Save Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=DOTZSPPause.ButtonClicked
    end object
    SaveButton=SaveButton_btn
    // Reference: GUIButton'DOTZSPPause.OptionsButton_btn'
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
        OnClick=DOTZSPPause.ButtonClicked
    end object
    OptionsButton=OptionsButton_btn
    // Reference: GUIButton'DOTZSPPause.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=4
        bFocusOnWatch=true
        OnClick=DOTZSPPause.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    ContinueMenu="DOTZMenu.DOTZSPLevelList"
    LoadMenu="DOTZMenu.DOTZLoadMenuIG"
    SaveMenu="DOTZMenu.DOTZSaveMenu"
    OptionsMenu="DOTZMenu.DOTZSettingsMenuIG"
    QuitMenu="DOTZMenu.DOTZQuitGameConfirm"
    PageCaption="Paused"
    ClickSound=Sound'DOTZXInterface.Select'
    period=0.1000000
    WinTop=0.2500000
    WinLeft=0.2500000
    WinWidth=0.5000000
    WinHeight=0.5000000
    OnKeyEvent=DOTZSPPause.HandleKeyEvent
}