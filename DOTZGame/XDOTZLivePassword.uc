/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLivePassword extends XDOTZLivePage;

//Page components
var Automated GUIImage  Unfilled1;
var Automated GUIImage  Unfilled2;
var Automated GUIImage  Unfilled3;
var Automated GUIImage  Unfilled4;

var Automated GUIImage  Filled1;
var Automated GUIImage  Filled2;
var Automated GUIImage  Filled3;
var Automated GUIImage  Filled4;

var int       num_entries;
var int       entries[4];
var bool      valid_password;

// Menu locations
var string    PasswordError;
var string    ErrorMenu;
var string    SigningInMenu;

//configurable stuff
var localized string PageCaption;

var sound ClickSound;

/*****************************************************************
 * Displays the password entry
 *****************************************************************
 */

function Password_Display () {
    if (num_entries >= 1)  {
       Filled1.SetVisibility(true);
       Unfilled1.SetVisibility(false);
    } else {
       Filled1.SetVisibility(false);
       Unfilled1.SetVisibility(true);
    }

    if (num_entries >= 2)  {
       Filled2.SetVisibility(true);
       Unfilled2.SetVisibility(false);
    } else {
       Filled2.SetVisibility(false);
       Unfilled2.SetVisibility(true);
    }

    if (num_entries >= 3)  {
       Filled3.SetVisibility(true);
       Unfilled3.SetVisibility(false);
    } else {
       Filled3.SetVisibility(false);
       Unfilled3.SetVisibility(true);
    }

    if (num_entries >= 4)  {
       Filled4.SetVisibility(true);
       Unfilled4.SetVisibility(false);
    } else {
       Filled4.SetVisibility(false);
       Unfilled4.SetVisibility(true);
    }

}

/*****************************************************************
 * Converts unreal password entries into xbox live entries

    XONLINE_PASSCODE_DPAD_UP = 1
    XONLINE_PASSCODE_DPAD_DOWN = 2
    XONLINE_PASSCODE_DPAD_LEFT = 3
    XONLINE_PASSCODE_DPAD_RIGHT = 4
    XONLINE_PASSCODE_GAMEPAD_X = 5
    XONLINE_PASSCODE_GAMEPAD_Y = 6
    XONLINE_PASSCODE_GAMEPAD_LEFT_TRIGGER = 9
    XONLINE_PASSCODE_GAMEPAD_RIGHT_TRIGGER = 10

 *****************************************************************
 */

function int Translate_Password_Filled (int unreal_key) {
    switch (unreal_key) {
        case 202/*XC_X*/:              return 5;    break;
        case 203/*XC_Y*/:              return 6;    break;
        case 208/*XC_Up*/:             return 1;    break;
        case 209/*XC_Down*/:           return 2;    break;
        case 210/*XC_Left*/:           return 3;    break;
        case 211/*XC_Right*/:          return 4;    break;
        case 206/*XC_LeftTrigger*/:    return 9;    break;
        case 207/*XC_RightTrigger*/:   return 10;   break;
        default:                       return 0;    break;
    };
}

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   SetPageCaption (PageCaption);
   AddBackButton ();
   AddSelectButton ();

   Password_Display ();
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    // for keeping track of keypresses
    num_entries = 0;
    Password_Display ();

    // Set the microsoft approved caption
    SetPageCaption(PageCaption $ " " $ class'UtilsXbox'.static.Get_Current_Name());
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
 * B Button pressed
 *
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * NotifyLevelChange
 *
 *****************************************************************
 */

event NotifyLevelChange() {
    Controller.CloseMenu(true);
}

/*****************************************************************
 * Enter the password here
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {
    local int xbox_key;

    Super.HandleKeyEvent(Key,State,delta);

    if (State != 1) return false;

    xbox_key = Translate_Password_Filled(Key);

    if (xbox_key > 0) {

       entries[num_entries] = xbox_key;

       num_entries++;

       // Clamp num_entries just in case
       if (num_entries > 4)            num_entries = 4;
       else if (num_entries < 0)       num_entries = 0;


       // Check for a valid password
       if (num_entries == 4) {

           valid_password = class'UtilsXbox'.static.Check_Password (entries[0], entries[1], entries[2], entries[3]);

           if (valid_password) {
               // Attempt to sign in to live
               BBGuiController(Controller).SwitchMenu (SigningInMenu);

           } else {
               Controller.OpenMenu(PasswordError);
           }

           // Clear the password field
           num_entries = 0;
       }

       // Display the password
       Password_Display ();
       return true;
    }

    return false;
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIImage'XDOTZLivePassword.Unfilled1_img'
    begin object name=Unfilled1_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxA'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.1000000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Unfilled1=Unfilled1_img
    // Reference: GUIImage'XDOTZLivePassword.Unfilled2_img'
    begin object name=Unfilled2_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxA'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3000000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Unfilled2=Unfilled2_img
    // Reference: GUIImage'XDOTZLivePassword.Unfilled3_img'
    begin object name=Unfilled3_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxA'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.5000000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Unfilled3=Unfilled3_img
    // Reference: GUIImage'XDOTZLivePassword.Unfilled4_img'
    begin object name=Unfilled4_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxA'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.7000000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Unfilled4=Unfilled4_img
    // Reference: GUIImage'XDOTZLivePassword.Filled1_img'
    begin object name=Filled1_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxB'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.1200000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Filled1=Filled1_img
    // Reference: GUIImage'XDOTZLivePassword.Filled2_img'
    begin object name=Filled2_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxB'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3200000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Filled2=Filled2_img
    // Reference: GUIImage'XDOTZLivePassword.Filled3_img'
    begin object name=Filled3_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxB'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.5200000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Filled3=Filled3_img
    // Reference: GUIImage'XDOTZLivePassword.Filled4_img'
    begin object name=Filled4_img class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.HeadBoxB'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.7200000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Filled4=Filled4_img
    PasswordError="DOTZMenu.XDOTZLivePasswordError"
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    SigningInMenu="DOTZMenu.XDOTZLiveSigningIn"
    PageCaption="Please enter the pass code for"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLivePassword.HandleKeyEvent
}