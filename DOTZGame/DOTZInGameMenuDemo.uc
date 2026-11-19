/**
 * DOTZMainMenu - the main menu for Desert Thunder, based on the Warfare
 *              "GUI" package.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.10 $
 * @date    Sept 2003
 */
class DOTZInGameMenuDemo extends DOTZDemo;



//controls
var Automated GuiButton NewGameButton;
var Automated GuiButton ResumeGameButton;
var Automated GuiButton SettingsButton;
var Automated GuiButton QuitButton;
var Automated GuiButton BonusButton;

//configurable stuff
var string NewGameLevel;     //the level to load when they press new game
var string SettingsMenu;     //the location of the settings menu
var string QuitConfirm;      //dialog to display when quitting

//internal
var int escHack;
var sound ClickSound;


/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
}

/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened( sender );
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   escHack = 0;
   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
}


/*****************************************************************
 * ButtonCllicked
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
   local GUIButton Selected;

   if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
   if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

      switch (Selected) {

      //NEW GAME BUTTON
        case NewGameButton:
           Console(Controller.Master.Console).ConsoleCommand( NewGameLevel );
           Controller.CloseAll(false);
           return true;

      //RESUME GAME BUTTON
      case ResumeGameButton:
         Controller.ViewportOwner.Actor.Level.Game
            .SetPause( false, Controller.ViewportOwner.Actor );
         Controller.CloseAll( false );
          return true;

      //SETTINGS BUTTON
      case SettingsButton:
           return Controller.OpenMenu(SettingsMenu);

      //QUIT BUTTON
      case QuitButton:
            return Controller.OpenMenu(QuitConfirm);

   }
   return false;
}


/*****************************************************************
 * HandleKeyEvent
 *****************************************************************
 */
function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

   if (Key==0x1B) { //esc
      escHack += 1;
      if (escHack ==2){
         //           escHack = 0;
         Controller.ViewportOwner.Actor.Level.Game
            .SetPause( false, Controller.ViewportOwner.Actor );
           Controller.CloseAll(false);
      }
   }
   //@@@ need to do something about the button-skipping problem here?
   return true;
}


/*****************************************************************
 * NotifyLevelChange
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
    // Reference: GUIButton'DOTZInGameMenuDemo.NewGameButton_btn'
    begin object name=NewGameButton_btn class=Class'GUI.GUIButton'
        Caption="New Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="LOTD"
        WinTop=0.4500000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=DOTZInGameMenuDemo.ButtonClicked
    end object
    NewGameButton=NewGameButton_btn
    // Reference: GUIButton'DOTZInGameMenuDemo.ResumeGameButton_btn'
    begin object name=ResumeGameButton_btn class=Class'GUI.GUIButton'
        Caption="Resume"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Play Marine Heavy Gunner!"
        WinTop=0.5000000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZInGameMenuDemo.ButtonClicked
    end object
    ResumeGameButton=ResumeGameButton_btn
    // Reference: GUIButton'DOTZInGameMenuDemo.settingsButton_btn'
    begin object name=settingsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Change settings"
        WinTop=0.6500000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=4
        bFocusOnWatch=true
        OnClick=DOTZInGameMenuDemo.ButtonClicked
    end object
    SettingsButton=settingsButton_btn
    // Reference: GUIButton'DOTZInGameMenuDemo.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
    end object
    QuitButton=QuitButton_btn
    NewGameLevel="start CH10"
    SettingsMenu="DOTZMenu.DOTZSettingsMenu"
    QuitConfirm="DOTZMenu.DOTZQuitConfirm"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.MainMenuBackGround'
    bPersistent=true
    OnKeyEvent=DOTZInGameMenuDemo.HandleKeyEvent
}