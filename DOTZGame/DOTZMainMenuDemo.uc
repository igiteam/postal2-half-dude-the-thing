/**
 * DOTZMainMenu - the main menu for DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.18 $
 * @date    Sept 2003
 */
class DOTZMainMenuDemo extends DOTZDemo;



//Page components
var Automated GuiButton  SinglePlayerButton;
var Automated GuiButton  JoinButton;
var Automated GuiButton  HostButton;
var Automated GuiButton  ProfilesButton;
var Automated GuiButton  SettingsButton;
var Automated GuiButton  QuitButton;

//configurable stuff
var string SinglePlayerMenu;
var string JoinMenu;
var string HostMenu;
var string ProfilesMenu;
var string SettingsMenu;
var string QuitMenu;

var sound ClickSound;
var string LevelNameTxt;


 /*****************************************************************
  * InitComponent
  *****************************************************************
  */
function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   JoinButton.MenuState = MSAT_Disabled;
   HostButton.MenuState = MSAT_Disabled;
   ProfilesButton.MenuState = MSAT_Disabled;
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened( Sender );
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

    switch (Selected)
    {

        //SINGLEPLAYER GAME BUTTON
        case SinglePlayerButton:
            Controller.OpenMenu(SinglePlayerMenu);
               // Display loading screen
             //Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu",LevelNameTxt);
             PlayerOwner().Level.ServerTravel("CH10.dz",false);
            //Console(Controller.Master.Console).ConsoleCommand( NewGameLevel );
            //Controller.CloseMenu(false);
            //Controller.OpenMenu("DOTZMenu.DOTZLoadingMenu",,"DOTZTStory.Chapter1.1Page1"); //,"DOTZTStory.Chapter11.11Load");
            return true;

        //JOIN GAME BUTTON
        case JoinButton:
            return true; //Controller.OpenMenu(JoinMenu); break;

        //HOST BUTTON
        case HostButton:
            return true; // Controller.OpenMenu(HostMenu); break;

        //PROFILES BUTTON
        case ProfilesButton:
            return true; // Controller.OpenMenu(ProfilesMenu); break;

        //SETTINGS BUTTON
        case SettingsButton:
            return Controller.OpenMenu(SettingsMenu); break;

        //QUIT BUTTON
        case QuitButton:
            return Controller.OpenMenu(QuitMenu); break;
    }
   return false;
}


/*****************************************************************
 * HandleKeyEven
 * It was like this when I got here
 *****************************************************************
 */
function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

   return true;
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
    // Reference: GUIButton'DOTZMainMenuDemo.SinglePlayerButton_btn'
    begin object name=SinglePlayerButton_btn class=Class'GUI.GUIButton'
        Caption="Play Demo"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Play Land of the Dead Single Player!"
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=DOTZMainMenuDemo.ButtonClicked
    end object
    SinglePlayerButton=SinglePlayerButton_btn
    // Reference: GUIButton'DOTZMainMenuDemo.JoinGameButton_btn'
    begin object name=JoinGameButton_btn class=Class'GUI.GUIButton'
        Caption="Play Online / LAN Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Join a Land of the Dead Multiplayer match."
        WinTop=0.5500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenuDemo.ButtonClicked
    end object
    JoinButton=JoinGameButton_btn
    // Reference: GUIButton'DOTZMainMenuDemo.HostGameButton_btn'
    begin object name=HostGameButton_btn class=Class'GUI.GUIButton'
        Caption="Host Multiplayer Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Set up a Land of the Dead Multiplayer match."
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenuDemo.ButtonClicked
    end object
    HostButton=HostGameButton_btn
    // Reference: GUIButton'DOTZMainMenuDemo.ProfilesButton_btn'
    begin object name=ProfilesButton_btn class=Class'GUI.GUIButton'
        Caption="Profiles"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Change your profile information."
        WinTop=0.6500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenuDemo.ButtonClicked
    end object
    ProfilesButton=ProfilesButton_btn
    // Reference: GUIButton'DOTZMainMenuDemo.settingsButton_btn'
    begin object name=settingsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Change your game settings."
        WinTop=0.7000000
        WinLeft=0.2500000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZMainMenuDemo.ButtonClicked
    end object
    SettingsButton=settingsButton_btn
    // Reference: GUIButton'DOTZMainMenuDemo.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Exit the game."
        WinTop=0.7500000
        WinLeft=0.2500000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenuDemo.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    SinglePlayerMenu="DOTZMenu.DOTZSPMainMenu"
    JoinMenu="DOTZMenu.DOTZMultiplayer"
    HostMenu="DOTZMenu.DOTZBaseCreateMatch"
    ProfilesMenu="DOTZMenu.DOTZProfileMenu"
    SettingsMenu="DOTZMenu.DOTZSettingsMenu"
    QuitMenu="DOTZMenu.DOTZQuitConfirm"
    ClickSound=Sound'DOTZXInterface.Select'
    LevelNameTxt="Loading... Theater"
    Background=Texture'DOTZTInterface.Menu.MainMenuBackGround'
    OnKeyEvent=DOTZMainMenuDemo.HandleKeyEvent
}