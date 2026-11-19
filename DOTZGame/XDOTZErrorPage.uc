//-----------------------------------------------------------
//  XDOTZErrorPage - Base class for error pages
//-----------------------------------------------------------

class XDOTZErrorPage extends XDOTZPageBase;

var automated GUIButton  ErrorBackground;     // Button placed in the background
var Automated GUILabel   BackButtonLabel;     // Back button label text
var Automated GUILabel   SelectButtonLabel;   // Select button label text
var Automated GUILabel   ErrorMessage;        // The error message to be displayed

var Automated GUIImage   BackButtonImage;     // The "B" button image
var Automated GUIImage   SelectButtonImage;   // The "A" button image

var sound ClickSound;

// Button strings for error boxes
var localized string cancel_string;                     // "Cancel"
var localized string back_string;                       // "Back"
var localized string accept_string;                     // "Accept"
var localized string decline_string;                    // "Decline"
var localized string continue_string;                   // "Continue"
var localized string dashboard_string;                  // "Dashboard"
var localized string new_account_string;                // "New Account"
var localized string troubleshooter_string;             // "Troubleshooter"
var localized string try_again_string;                  // "Try again"
var localized string update_string;                     // "Update"
var localized string create_match_string;               // "Create a new match"
var localized string recovery_string;                   // "Account Recovery"
var localized string read_now_string;                   // "Read now"
var localized string read_later_string;                 // "Read later"
var localized string join_string;                       // "Join later"
var localized string attach_voice;                      // "Attach Voice Message"
var localized string continue_no_save_string;           // "Continue without saving"
var localized string free_blocks_string;                // "Free more blocks"
var localized string switch_teams;                      // "Switch Teams"

var bool accept_input;
var float period;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);
    FixButtonLocations();
}

/*****************************************************************
 * Sets the caption displayed at the top of the page
 *****************************************************************
 */

function SetErrorCaption(string caption) {
    ErrorMessage.Caption = caption;
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
    Super.Closed(Sender,bCancelled);
    XDotzPlayerController(PlayerOwner()).bPauseRumble = false;
}

/*****************************************************************
 * Adds back and select buttons
 *****************************************************************
 */

function AddBackButton(string label) {
    BackButtonImage.SetVisibility(true);
    BackButtonLabel.SetVisibility(true);
    BackButtonLabel.Caption = label;
}

function AddSelectButton(string label) {
    SelectButtonImage.SetVisibility(true);
    SelectButtonLabel.SetVisibility(true);
    SelectButtonLabel.Caption = label;
}

function FixOneButton(GUIComponent c){
    c.WinWidth = c.WinWidth / WinWidth;
    c.WinHeight = c.WinHeight / WinHeight;
    c.WinLeft = c.WinLeft / WinWidth;
    c.WinTop = 1.0 - (1.0 - c.WinTop) / WinHeight;
}

function FixButtonLocations() {
    FixOneButton(BackButtonLabel);
    FixOneButton(SelectButtonLabel);
    FixOneButton(BackButtonImage);
    FixOneButton(SelectButtonImage);
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
    accept_input = false;
    Log("Not Accepting input...");
    XDotzPlayerController(PlayerOwner()).bPauseRumble = true;
    class'UtilsXbox'.static.Stop_Rumble();
    SetTimer(0.1,false);
}



/*****************************************************************
 * Introduces a short pause before accepting keystrokes
 *****************************************************************
 */

function Timer ()
{
    if (accept_input == false ) {
        accept_input = true;
        SetTimer(period,true);
        Log("Accepting input...");
    } else {
        Periodic();
    }
}

function Periodic()
{
    super.Periodic();
}

/*****************************************************************
 * HandleKeyEven
 * Intercepts A and B presses
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

    // A short pause
    if (!accept_input) return false;

    // Key down only
    if (State != 1) return false;

    Log(" *** Button down " $ Key);

    if (Key == 200) {
       DoButtonA();
       return true;
    } else if (Key == 201 || Key==213) {
       DoButtonB();
       return true;
    } else if (Key == 202) {
       DoButtonX();
       return true;
    } else if (Key == 212) {
       DoButtonStart();
       return true;
    }

    return true;
}

function DoButtonA ()
{
   XDotzPlayerController(PlayerOwner()).bPauseRumble = false;
}

function DoButtonB ()
{
   XDotzPlayerController(PlayerOwner()).bPauseRumble = false;
}

function DoButtonX ()
{
   XDotzPlayerController(PlayerOwner()).bPauseRumble = false;
}

function DoButtonStart()
{
   XDotzPlayerController(PlayerOwner()).bPauseRumble = false;
}

/*****************************************************************
 * default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZErrorPage.ErrorBackground_btn'
    begin object name=ErrorBackground_btn class=Class'GUI.GUIButton'
        StyleName="BBHorizontalBarSolid"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinHeight=1.0000000
        RenderWeight=0.1000000
    end object
    ErrorBackground=ErrorBackground_btn
    // Reference: GUILabel'XDOTZErrorPage.BackButtonLabel_lbl'
    begin object name=BackButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Cancel"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.8900000
        WinLeft=0.0800000
        WinWidth=0.4000000
        WinHeight=0.1000000
        RenderWeight=0.5000000
    end object
    BackButtonLabel=BackButtonLabel_lbl
    // Reference: GUILabel'XDOTZErrorPage.SelectButtonLabel_lbl'
    begin object name=SelectButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="OK"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.8900000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.1000000
        RenderWeight=0.5000000
    end object
    SelectButtonLabel=SelectButtonLabel_lbl
    // Reference: GUILabel'XDOTZErrorPage.ErrorMessage_lbl'
    begin object name=ErrorMessage_lbl class=Class'GUI.GUILabel'
        TextFont="XBigFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage=ErrorMessage_lbl
    // Reference: GUIImage'XDOTZErrorPage.BackButtonImage_icn'
    begin object name=BackButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.B'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.8900000
        WinLeft=0.0300000
        WinWidth=0.0700000
        WinHeight=0.0700000
        RenderWeight=0.5000000
    end object
    BackButtonImage=BackButtonImage_icn
    // Reference: GUIImage'XDOTZErrorPage.SelectButtonImage_icn'
    begin object name=SelectButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.A'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.8900000
        WinLeft=0.4000000
        WinWidth=0.0700000
        WinHeight=0.0700000
        RenderWeight=0.5000000
    end object
    SelectButtonImage=SelectButtonImage_icn
    ClickSound=Sound'DOTZXInterface.Select'
    cancel_string="Cancel"
    back_string="Back"
    accept_string="Accept"
    decline_string="Decline"
    continue_string="Continue"
    dashboard_string="Xbox Dashboard"
    new_account_string="Create New Account"
    troubleshooter_string="Troubleshooter"
    try_again_string="Try Again"
    update_string="Update"
    create_match_string="Create a new match"
    recovery_string="Account Recovery"
    read_now_string="Read Now"
    read_later_string="Read Later"
    join_string="Join"
    attach_voice="Attach Voice Message"
    continue_no_save_string="Continue Without Saving"
    free_blocks_string="Free More Blocks"
    switch_teams="Switch Teams"
    period=0.5000000
    bRequire640x480=false
    bAllowedAsLast=true
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.5000000
}