/**
 * XDOTZMainMenuzzzDemo - the main menu for Xbox DOTZ Demo, based on the Warfare
 *              "GUI" package.
 * - ripped off of XDOTZMainMenu for the original Xbox DOTZ
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    June 20, 2005
 */

class XDOTZMainMenuDemo extends XDOTZDemo;




//Page components
var Automated GuiButton  SinglePlayerButton;
var Automated GuiButton  XboxLiveButton;
var Automated GuiButton  SystemLinkButton;
var Automated GuiButton  ProfileButton;
var Automated GuiButton  ExitButton;

var config bool bFirstRun;

//configurable stuff
var string SinglePlayerMenu;    // Single Player menu location
var string ProfileMenu;         // Profile menu location
var string ExitConfirmMenu;     // Exit confirmation menu
var string InitialScreen;

var sound ClickSound;

var VideoPlayer testVideo;
var int menuMusicHandle;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);


    // init my components...
    testVideo = new(self) class'BinkVideoPlayer';

    LiveCaption.bVisible = false;
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender )
{
    super.Opened(Sender);


    // If this is the first time, launch the initial screen demo
    /*
    bFirstRun = class'XDOTZMainMenuDemo'.default.bFirstRun;
    if(bFirstRun)
    {
        class'XDOTZMainMenuDemo'.default.bFirstRun = false;
        class'XDOTZMainMenuDemo'.static.StaticSaveConfig();
        Controller.OpenMenu(InitialScreen);
    }
    */
    if(menuMusicHandle == -1)
    {
        // Play menu music if first time opened
        menuMusicHandle = PlayerOwner().PlayMusic("Z16", 0.5);
    }

    if(class'Profiler'.static.GetValue("bAlreadyRan") != "true")
    {
        class'Profiler'.static.SetValue("bAlreadyRan", "true");
        Controller.OpenMenu(InitialScreen);
    }

    // If its launched by CDX, show the exit game option
    if(class'UtilsXbox'.static.Get_Demo_Mode() == 1)
    {
        ExitButton.SetVisibility(true);

        // Manually link the buttons to each other
        SinglePlayerButton.SetLinks(ExitButton,ProfileButton,none,none);
        ProfileButton.SetLinks(SinglePlayerButton,ExitButton,none,none);
        ExitButton.SetLinks(ProfileButton, SinglePlayerButton,none,none);

    } else
    {
        ExitButton.SetVisibility(false);
        // Manually link the buttons to each other
        SinglePlayerButton.SetLinks(ProfileButton,ProfileButton,none,none);
        ProfileButton.SetLinks(SinglePlayerButton,SinglePlayerButton,none,none);
        //ExitButton.SetLinks(ProfileButton, SinglePlayerButton,none,none);

    }
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
    if(menuMusicHandle != -1)
    {
        PlayerOwner().StopMusic(menuMusicHandle, 0.0);
        menuMusicHandle = -1;
    }
    Super.Closed(Sender,bCancelled);
    Controller.MouseEmulation(false);
}

/*****************************************************************
 * This gets called every 1/2 second
 *****************************************************************
 */

function Periodic ()
{
    //super.Periodic();
}

function SetLoginName()
{
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
        case SinglePlayerButton:
             // Unpause game and close menu
             Controller.ViewportOwner.Actor.Level.Game
                .SetPause( false, Controller.ViewportOwner.Actor );
             return Controller.CloseMenu(true);
             break;

        case ProfileButton:
             Controller.OpenMenu(ProfileMenu);
             break;

        case ExitButton:
             Controller.OpenMenu(ExitConfirmMenu);
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
    // Reference: GUIButton'XDOTZMainMenuDemo.SinglePlayerButton_btn'
    begin object name=SinglePlayerButton_btn class=Class'GUI.GUIButton'
        Caption="Single Player"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZMainMenuDemo.ButtonClicked
    end object
    SinglePlayerButton=SinglePlayerButton_btn
    // Reference: GUIButton'XDOTZMainMenuDemo.XboxLiveButton_btn'
    begin object name=XboxLiveButton_btn class=Class'GUI.GUIButton'
        Caption="Xbox Live"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinTop=0.5600000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
    end object
    XboxLiveButton=XboxLiveButton_btn
    // Reference: GUIButton'XDOTZMainMenuDemo.SystemLinkButton_btn'
    begin object name=SystemLinkButton_btn class=Class'GUI.GUIButton'
        Caption="System Link"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinTop=0.6200000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=2
    end object
    SystemLinkButton=SystemLinkButton_btn
    // Reference: GUIButton'XDOTZMainMenuDemo.ProfileButton_btn'
    begin object name=ProfileButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6800000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZMainMenuDemo.ButtonClicked
    end object
    ProfileButton=ProfileButton_btn
    // Reference: GUIButton'XDOTZMainMenuDemo.ExitButton_btn'
    begin object name=ExitButton_btn class=Class'GUI.GUIButton'
        Caption="Exit Demo"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.7400000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=4
        bFocusOnWatch=true
        OnClick=XDOTZMainMenuDemo.ButtonClicked
    end object
    ExitButton=ExitButton_btn
    SinglePlayerMenu="DOTZMenu.XDOTZSPMainMenu"
    ProfileMenu="DOTZMenu.XDOTZProfileEditSettingsDemo"
    ExitConfirmMenu="DOTZMenu.XDOTZExitDemo"
    InitialScreen="DOTZMenu.XDOTZInitialScreenDemo"
    ClickSound=Sound'DOTZXInterface.Select'
    menuMusicHandle=-1
    period=0.5000000
    Background=Texture'DOTZTInterface.Menu.MainMenuBackGround'
    OnKeyEvent=XDOTZMainMenuDemo.HandleKeyEvent
}