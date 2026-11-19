/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZMainMenu extends XDOTZPage
    implements( VideoNotification );




//Page components
var Automated GuiButton  SinglePlayerButton;
var Automated GuiButton  XboxLiveButton;
var Automated GuiButton  SystemLinkButton;
var Automated GuiButton  SettingsButton;
var Automated GuiButton  ProfileButton;
var Automated GuiButton  TrailerButton;

var Automated GUIImage   FriendsRequestNotification;
var Automated GUIImage   FriendsInviteNotification;

//configurable stuff
var string SinglePlayerMenu;    // Single Player menu location
var string XboxLiveMenu;        // Xbox Live menu location
var string XboxLiveSignInMenu;        // Xbox Live menu location
var string SystemLinkMenu;      // System Link menu location
var string SettingsMenu;
var string ProfileMenu;         // Profile menu location
var string ProfileSelectMenu;         // Profile menu location
var string ProfileNeedOneMenu;         // Profile menu location

var sound ClickSound;

var VideoPlayer testVideo;

var bool LastNetCablePlugged;

var int ProfilesPos;
var int SettingsPos;


var bool bVideoIsPlaying;
var bool musicCancelled;

var string param1saved;
var string param2saved;


// Profiles
//var Profiler profiles;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    local int reboot_type;

    Super.Initcomponent(MyController, MyOwner);

    //profiles = new(self) class'DOTZProfiler';

    // init my components...
    testVideo = new(self) class'BinkVideoPlayer';
    testVideo.RegisterForNotification(self); //let me know when a video ends

    reboot_type = class'UtilsXbox'.static.Get_Reboot_Type();

    // Check cross title thingy
    if (reboot_type == 0 && class'UtilsXbox'.static.Is_Cross_Title_Invite()) {
        Controller.OpenMenu ("DOTZMenu.XDOTZCrossTitleCheck", class'UtilsXbox'.static.Cross_Invited_Friend(), class'UtilsXbox'.static.Cross_Friend());
    }


    FixSLMenu ();
    Refresh_Icons ();
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    local int reboot_type;
    local int desired_space;
    local int available_space;
    local int used_space;

    super.Opened(Sender);

    reboot_type = class'UtilsXbox'.static.Get_Reboot_Type();

    // Check for enough free space. 60 blocks arbitrary.
    if (class'UtilsXbox'.static.Get_Save_Enable()) {
        class'UtilsXbox'.static.Refresh_Memory_Unit();
        used_space = class'UtilsXbox'.static.Get_All_Containers_Size(60);

        if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() > 0) {
            desired_space = 60 * DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();
        } else {
            desired_space = 60;
        }
        Log("Desired space " $ desired_space );

        // Adjust used and desired space
        /*if (used_space > desired_space)
            used_space = desired_space;
        desired_space += 60;*/

        available_space = class'UtilsXbox'.static.Get_Total_Free_Blocks() + used_space;
        Log("Available space " $ available_space );

        if (available_space < desired_space) {
            Controller.OpenMenu ("DOTZMenu.XDOTZNeedBlocksError", string(desired_space - available_space), string(desired_space - used_space));
            // Disable saving
            class'AdvancedGameInfo'.default.bAutoSaveDisabled = true;
            class'UtilsXbox'.static.Set_Save_Enable(false);

            Log("Saves are disabled");
        } else {
             // Enable saving
            class'AdvancedGameInfo'.default.bAutoSaveDisabled = false;
            class'UtilsXbox'.static.Set_Save_Enable(true);

            Log("Saves are enabled");
        }
    }

    // Update profiles menu
    if (!class'UtilsXbox'.static.Get_Save_Enable()) {
        RemoveComponent(SettingsButton, true);
        RemoveComponent(ProfileButton, true);
        MapControls();
    } else {
        if (!DOTZPlayerControllerBase(PlayerOwner()).IsLoadedProfileValid()) {
            SettingsButton.bVisible = false;
            SettingsButton.bNeverFocus = true;
            MapControls();
        } else {
            SettingsButton.bVisible = true;
            SettingsButton.bNeverFocus = false;
            MapControls();
        }
    }

    if (class'UtilsXbox'.static.Get_Save_Enable()) {
        if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() <= 0) {
            Log("Open Profile menu 1");
            Controller.OpenMenu (ProfileMenu);
        }
    }

    // Update profiles menu
    /*if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() <= 0) {
        ProfileButton.bNeverFocus = true;
        ProfileButton.bVisible = false;
        MapControls();
    } else {
        ProfileButton.bNeverFocus = false;
        ProfileButton.bVisible = true;
        MapControls();
    }*/

}

/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied here.
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    // if param1 == ProfileHack then the use wanted to go to the profiles menu instead
    // of selecting one in the intro screen.

    if (class'UtilsXbox'.static.Get_Save_Enable() && param1 == "ProfileHack") {
        Log("Open Profile menu 3");
        Controller.OpenMenu(ProfileMenu);
        param1saved = "";
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
 * This gets called every 1/2 second
 *****************************************************************
 */

function Refresh_Icons ()
{
    class'UtilsXbox'.static.Friends_Refresh_List();

    if (class'UtilsXbox'.static.Is_Signed_In()) {
        if (class'UtilsXbox'.static.Friends_Is_Any_Recv_Invitation()) {
            FriendsRequestNotification.bVisible = false;
            FriendsInviteNotification.bVisible = true;
        } else if (class'UtilsXbox'.static.Friends_Is_Any_Recv_Friend_Request()) {
            FriendsRequestNotification.bVisible = true;
            FriendsInviteNotification.bVisible = false;
        } else {
            FriendsRequestNotification.bVisible = false;
            FriendsInviteNotification.bVisible = false;
        }
    } else {
        FriendsRequestNotification.bVisible = false;
        FriendsInviteNotification.bVisible = false;
    }
}

/*****************************************************************
 * Dims the system link menu if it is unavailable
 *****************************************************************
 */

function FixSLMenu () {
    local bool CurNetCablePlugged;

    CurNetCablePlugged = !class'UtilsXbox'.static.Network_Is_Unplugged();

    if (CurNetCablePlugged && !LastNetCablePlugged) {
        SystemLinkButton.bVisible = true;
        SystemLinkButton.bNeverFocus = false;
        MapControls();

        // CARROT HACK!!!!
        SetFocus(SinglePlayerButton);
        SinglePlayerButton.SetFocus(none);
    } else if (!CurNetCablePlugged && LastNetCablePlugged) {
        SystemLinkButton.bVisible = false;
        SystemLinkButton.bNeverFocus = true;
        MapControls();

        // CARROT HACK!!!!
        SetFocus(SinglePlayerButton);
        SinglePlayerButton.SetFocus(none);
    }

    LastNetCablePlugged = CurNetCablePlugged;
}


/*****************************************************************
 * This gets called every 1/2 second
 *****************************************************************
 */

function Periodic ()
{
    super.Periodic();
    FixSLMenu ();
    Refresh_Icons ();

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
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;
    if (!accept_input) return false;

    // Cancel auto sign in if live menu selected
    class'UtilsXbox'.static.Cancel_Sign_In();
    class'UtilsXbox'.static.Set_Last_Error(0);

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    // If movie is playing, stop movie
    if(testVideo.VideoIsPlaying())
    {
        testVideo.StopVideo();
        accept_input = false;
        return true;
    }

    switch (Selected) {
        case SinglePlayerButton:
             return Controller.OpenMenu(SinglePlayerMenu);
             break;

        case XboxLiveButton:
             // if we are signed in, skip the sign in menu
             if (class'UtilsXbox'.static.Is_Signed_In()) {
                 Controller.OpenMenu(XboxLiveSignInMenu);
                 Controller.OpenMenu(XboxLiveMenu);
             } else {
                 Controller.OpenMenu(XboxLiveSignInMenu);
             }

             return false;
             break;

        case SystemLinkButton:
             return Controller.OpenMenu(SystemLinkMenu);
             break;

        case SettingsButton:
             return Controller.OpenMenu(SettingsMenu);
             break;

        case ProfileButton:
             Controller.OpenMenu(ProfileMenu);
             break;

        case TrailerButton:
             if (!bVideoIsPlaying){
               bVideoIsPlaying = true;
               testVideo.PlayVideo("MovieTrailer.bik");

               PlayerOwner().StopAllMusic(0.1);
               musicCancelled = true;

             } else {
               testVideo.StopVideo();
               return true;
             }

             accept_input = false;

             break;
    };

   return false;
}

function VideoComplete(bool completed){
   bVideoIsPlaying = false;
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
    // Reference: GUIButton'XDOTZMainMenu.SinglePlayerButton_btn'
    begin object name=SinglePlayerButton_btn class=Class'GUI.GUIButton'
        Caption="Single Player"
        StyleName="BBXTextButton"
        bScaleToParent=true
        WinTop=0.4900000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0590000
        bFocusOnWatch=true
        OnClick=XDOTZMainMenu.ButtonClicked
    end object
    SinglePlayerButton=SinglePlayerButton_btn
    // Reference: GUIButton'XDOTZMainMenu.XboxLiveButton_btn'
    begin object name=XboxLiveButton_btn class=Class'GUI.GUIButton'
        Caption="Xbox Live"
        StyleName="BBXTextButton"
        bScaleToParent=true
        WinTop=0.5500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0590000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZMainMenu.ButtonClicked
    end object
    XboxLiveButton=XboxLiveButton_btn
    // Reference: GUIButton'XDOTZMainMenu.SystemLinkButton_btn'
    begin object name=SystemLinkButton_btn class=Class'GUI.GUIButton'
        Caption="System Link"
        StyleName="BBXTextButton"
        bScaleToParent=true
        WinTop=0.6100000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0590000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=XDOTZMainMenu.ButtonClicked
    end object
    SystemLinkButton=SystemLinkButton_btn
    // Reference: GUIButton'XDOTZMainMenu.settingsButton_btn'
    begin object name=settingsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBXTextButton"
        bScaleToParent=true
        WinTop=0.6700000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0590000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZMainMenu.ButtonClicked
    end object
    SettingsButton=settingsButton_btn
    // Reference: GUIButton'XDOTZMainMenu.ProfileButton_btn'
    begin object name=ProfileButton_btn class=Class'GUI.GUIButton'
        Caption="Profiles"
        StyleName="BBXTextButton"
        bScaleToParent=true
        WinTop=0.7300000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0590000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZMainMenu.ButtonClicked
    end object
    ProfileButton=ProfileButton_btn
    // Reference: GUIButton'XDOTZMainMenu.TrailerButton_btn'
    begin object name=TrailerButton_btn class=Class'GUI.GUIButton'
        Caption="Movie Trailer"
        StyleName="BBXTextButton"
        bScaleToParent=true
        WinTop=0.7900000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0590000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZMainMenu.ButtonClicked
    end object
    TrailerButton=TrailerButton_btn
    // Reference: GUIImage'XDOTZMainMenu.FriendsRequestNotification_icn'
    begin object name=FriendsRequestNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.FriendRequest'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.5400000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsRequestNotification=FriendsRequestNotification_icn
    // Reference: GUIImage'XDOTZMainMenu.FriendsInviteNotification_icn'
    begin object name=FriendsInviteNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.Invite'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.5400000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsInviteNotification=FriendsInviteNotification_icn
    SinglePlayerMenu="DOTZMenu.XDOTZSPMainMenu"
    XboxLiveMenu="DOTZMenu.XDOTZLiveMultiplayer"
    XboxLiveSignInMenu="DOTZMenu.XDOTZLiveSignIn"
    SystemLinkMenu="DOTZMenu.XDOTZSLMainMenu"
    SettingsMenu="DOTZMenu.XDOTZProfileEditSettingsMain"
    ProfileMenu="DOTZMenu.XDOTZProfileMain"
    ProfileSelectMenu="DOTZMenu.XDOTZProfileSelectForce"
    ProfileNeedOneMenu="DOTZMenu.XDOTZProfileNeedOneProfile"
    ClickSound=Sound'DOTZXInterface.Select'
    LastNetCablePlugged=true
    period=0.0500000
    Background=Texture'DOTZTInterface.Menu.MainMenuBackGround'
    OnKeyEvent=XDOTZMainMenu.HandleKeyEvent
}