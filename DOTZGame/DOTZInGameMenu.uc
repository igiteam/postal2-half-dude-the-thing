/**
 * DOTZMainMenu - the main menu for Desert Thunder, based on the Warfare
 *              "GUI" package.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.10 $
 * @date    Sept 2003
 */
class DOTZInGameMenu extends DOTZSinglePlayerBase;



//controls
var Automated GuiButton NewGameButton;
var Automated GuiButton ResumeGameButton;
var Automated GuiButton LoadGameButton;
var Automated GuiButton SaveGameButton;
var Automated GuiButton SettingsButton;
var Automated GuiButton StoryButton;
var Automated GuiButton  CreditButton;
var Automated GuiButton QuitButton;
var Automated GuiButton BonusButton;

//configurable stuff
var string NewGameLevel;     //the level to load when they press new game
var string SaveMenu;         //the location of the save menu
var string LoadMenu;         //the location of the load menu
var string SettingsMenu;     //the location of the settings menu
var string StoryMenu;        //the location of the settings menu
var string QuitConfirm;      //dialog to display when quitting
var string CreditMenu;

//internal
//var int escHack;
var string StoryType;
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
    local AdvancedGameInfo g;
    local int lChapterMax, lPageMax;

    super.Opened( sender );
    g = AdvancedGameInfo( PlayerOwner().Level.Game );
    if ( g != none ) {
        if (g.bDisableSave) SaveGameButton.MenuState = MSAT_Disabled;
        else SaveGameButton.MenuState = MSAT_Blurry;
    }

   lChapterMax = class'DOTZGameInfoBase'.static.GetBestChapter();
   lPageMax = class'DOTZGameInfoBase'.static.GetBestPage();

   BonusButton.bVisible = false;
   if (lChapterMax >= 11 && (lPageMax >= 8  || lPageMax == -1)){
    BonusButton.bVisible = true;
   }



}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   //escHack = 0;
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

      //LOAD GAME BUTTON
      case LoadGameButton:
         //escHack = 0; //may not come back from load menu to close this one.
           return Controller.OpenMenu(LoadMenu);

      //SAVE GAME BUTTON
      case SaveGameButton:
           return Controller.OpenMenu(SaveMenu);

      //SETTINGS BUTTON
      case SettingsButton:
           return Controller.OpenMenu(SettingsMenu);

      //REVIEW STORY
      case StoryButton:
           return Controller.OpenMenu(StoryMenu, "local");

      //CREDITS
      case CreditButton:
           return Controller.OpenMenu(CreditMenu);

      //QUIT BUTTON
      case QuitButton:
            return Controller.OpenMenu(QuitConfirm);

     case BonusButton:
        Console(Controller.Master.Console).ConsoleCommand( "start ZombieArena" );
        Controller.CloseMenu(false);
        return true;


   }
   return false;
}


/*****************************************************************
 * HandleKeyEvent
 *****************************************************************
 */
/*function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

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
}*/


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
    // Reference: GUIButton'DOTZInGameMenu.NewGameButton_btn'
    begin object name=NewGameButton_btn class=Class'GUI.GUIButton'
        Caption="New Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Play Marine Heavy Gunner!"
        WinTop=0.4500000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    NewGameButton=NewGameButton_btn
    // Reference: GUIButton'DOTZInGameMenu.ResumeGameButton_btn'
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
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    ResumeGameButton=ResumeGameButton_btn
    // Reference: GUIButton'DOTZInGameMenu.LoadGameButton_btn'
    begin object name=LoadGameButton_btn class=Class'GUI.GUIButton'
        Caption="Load Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Play Marine Heavy Gunner!"
        WinTop=0.5500000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    LoadGameButton=LoadGameButton_btn
    // Reference: GUIButton'DOTZInGameMenu.SaveGameButton_btn'
    begin object name=SaveGameButton_btn class=Class'GUI.GUIButton'
        Caption="Save Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Save your progress"
        WinTop=0.6000000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    SaveGameButton=SaveGameButton_btn
    // Reference: GUIButton'DOTZInGameMenu.settingsButton_btn'
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
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    SettingsButton=settingsButton_btn
    // Reference: GUIButton'DOTZInGameMenu.StoryButton_btn'
    begin object name=StoryButton_btn class=Class'GUI.GUIButton'
        Caption="The Story So Far..."
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Exit the game"
        WinTop=0.7000000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=5
        bFocusOnWatch=true
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    StoryButton=StoryButton_btn
    // Reference: GUIButton'DOTZInGameMenu.CreditButton_btn'
    begin object name=CreditButton_btn class=Class'GUI.GUIButton'
        Caption="Credits"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Credits"
        WinTop=0.7500000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=4
        bFocusOnWatch=true
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    CreditButton=CreditButton_btn
    // Reference: GUIButton'DOTZInGameMenu.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
    end object
    QuitButton=QuitButton_btn
    // Reference: GUIButton'DOTZInGameMenu.BonusButton_btn'
    begin object name=BonusButton_btn class=Class'GUI.GUIButton'
        Caption="Bonus"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8500000
        WinLeft=0.4000000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=6
        bFocusOnWatch=true
        OnClick=DOTZInGameMenu.ButtonClicked
    end object
    BonusButton=BonusButton_btn
    NewGameLevel="start CH01"
    SaveMenu="DOTZMenu.DOTZSaveMenu"
    LoadMenu="DOTZMenu.DOTZLoadMenu"
    SettingsMenu="DOTZMenu.DOTZSettingsMenu"
    StoryMenu="DOTZMenu.DOTZStoryMenu"
    QuitConfirm="DOTZMenu.DOTZQuitConfirm"
    CreditMenu="DOTZMenu.DOTZCreditsMenu"
    StoryType="local"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.MainMenuBackGround'
    bPersistent=true
    OnKeyEvent=DOTZInGameMenu.HandleKeyEvent
}