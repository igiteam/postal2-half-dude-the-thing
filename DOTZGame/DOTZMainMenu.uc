/**
 * DOTZMainMenu - the main menu for DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.18 $
 * @date    Sept 2003
 */
class DOTZMainMenu extends DOTZPage
    implements( VideoNotification );



//Page components
var Automated GuiButton  SinglePlayerButton;
var Automated GuiButton  JoinButton;
var Automated GuiButton  HostButton;
var Automated GuiButton  ProfilesButton;
var Automated GuiButton  SettingsButton;
var Automated GuiButton  QuitButton;
var Automated GuiButton  MovieTrailerButton;

//configurable stuff
var string SinglePlayerMenu;
var string JoinMenu;
var string HostMenu;
var string ProfilesMenu;
var string SettingsMenu;
var string QuitMenu;
var string NeedProfileMenu;

var sound ClickSound;


var VideoPlayer testVideo;

var bool bVideoIsPlaying;
var bool musicCancelled;


 /*****************************************************************
  * InitComponent
  *****************************************************************
  */
function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);
    // init my components...

    // init my components...
    testVideo = new(self) class'BinkVideoPlayer';
    testVideo.RegisterForNotification(self); //let me know when a video ends
    Controller.OpenMenu("DOTZMenu.DOTZSelectProfile");
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
  // if (PlayerOwner().Level.NetMode != NM_StandAlone){
  //    PlayerOwner().ConsoleCommand("Disconnect");
  /// }
   PlayerOwner().ConsoleCommand("Cancel");
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
 * This gets called every 1/2 second
 *****************************************************************
 */

function Periodic ()
{
    super.Periodic();

    // Fire off the video after a while
    if (!testVideo.VideoIsPlaying()) {

        // Restart music if it was cancelled
        if (musicCancelled) {
            PlayerOwner().PlayMusic(PlayerOwner().Level.Song,0.1);
            musicCancelled = false;
        }

    }
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

    // if movie is playing, stop movie
    if(testVideo.VideoIsPlaying())
    {
        testVideo.StopVideo();
        accept_input = false;
        return true;
    }

    switch (Selected)
    {

        //SINGLEPLAYER GAME BUTTON
        case SinglePlayerButton:

            if (DOTZPlayerControllerBase(PlayerOwner()).IsLoadedProfileValid())
                return Controller.OpenMenu(SinglePlayerMenu);
            else
                return Controller.OpenMenu(NeedProfileMenu);

            break;

        //JOIN GAME BUTTON
        case JoinButton:

            if (DOTZPlayerControllerBase(PlayerOwner()).IsLoadedProfileValid())
                return Controller.OpenMenu(JoinMenu);
            else
                return Controller.OpenMenu(NeedProfileMenu);

            break;

        //HOST BUTTON
        case HostButton:

            if (DOTZPlayerControllerBase(PlayerOwner()).IsLoadedProfileValid())
                return Controller.OpenMenu(HostMenu);
            else
                return Controller.OpenMenu(NeedProfileMenu);

            break;

        //PROFILES BUTTON
        case ProfilesButton:
            return Controller.OpenMenu(ProfilesMenu); break;

        //SETTINGS BUTTON
        case SettingsButton:
            return Controller.OpenMenu(SettingsMenu); break;

        case MovieTrailerButton:
            if (!bVideoIsPlaying){
                bVideoIsPlaying = true;
                testVideo.PlayVideo("MovieTrailer.bik");

                PlayerOwner().StopAllMusic(0.1);
                musicCancelled = true;

            } else {
                testVideo.StopVideo();
                return true;
            }
            break;

        //QUIT BUTTON
        case QuitButton:
            return Controller.OpenMenu(QuitMenu); break;
    }
   return false;
}

function VideoComplete(bool completed){
   bVideoIsPlaying = false;
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
    // Reference: GUIButton'DOTZMainMenu.SinglePlayerButton_btn'
    begin object name=SinglePlayerButton_btn class=Class'GUI.GUIButton'
        Caption="Single Player"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Play Land of the Dead Single Player!"
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    SinglePlayerButton=SinglePlayerButton_btn
    // Reference: GUIButton'DOTZMainMenu.JoinGameButton_btn'
    begin object name=JoinGameButton_btn class=Class'GUI.GUIButton'
        Caption="Join Multiplayer Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Join a Land of the Dead Multiplayer match."
        WinTop=0.5500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    JoinButton=JoinGameButton_btn
    // Reference: GUIButton'DOTZMainMenu.HostGameButton_btn'
    begin object name=HostGameButton_btn class=Class'GUI.GUIButton'
        Caption="Host Multiplayer Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Set up a Land of the Dead Multiplayer match."
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    HostButton=HostGameButton_btn
    // Reference: GUIButton'DOTZMainMenu.ProfilesButton_btn'
    begin object name=ProfilesButton_btn class=Class'GUI.GUIButton'
        Caption="Profiles"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Change your profile information."
        WinTop=0.6500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    ProfilesButton=ProfilesButton_btn
    // Reference: GUIButton'DOTZMainMenu.settingsButton_btn'
    begin object name=settingsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Change your game settings."
        WinTop=0.7000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    SettingsButton=settingsButton_btn
    // Reference: GUIButton'DOTZMainMenu.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Exit Game"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Exit the game."
        WinTop=0.8000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    // Reference: GUIButton'DOTZMainMenu.MovieTrailerButton_btn'
    begin object name=MovieTrailerButton_btn class=Class'GUI.GUIButton'
        Caption="Movie Trailer"
        StyleName="BBTextButton"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Play the movie trailer."
        WinTop=0.7500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=DOTZMainMenu.ButtonClicked
    end object
    MovieTrailerButton=MovieTrailerButton_btn
    SinglePlayerMenu="DOTZMenu.DOTZSPMainMenu"
    JoinMenu="DOTZMenu.DOTZJoinMenu"
    HostMenu="DOTZMenu.DOTZBaseCreateMatch"
    ProfilesMenu="DOTZMenu.DOTZProfileMenu"
    SettingsMenu="DOTZMenu.DOTZSettingsMenu"
    QuitMenu="DOTZMenu.DOTZQuitConfirm"
    NeedProfileMenu="DOTZMenu.DOTZProfileForceSelect"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.MainMenuBackGround'
    OnKeyEvent=DOTZMainMenu.HandleKeyEvent
}