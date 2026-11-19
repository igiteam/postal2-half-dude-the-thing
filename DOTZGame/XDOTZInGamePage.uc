//-----------------------------------------------------------
//  XDOTZErrorPage - Base class for error pages
//-----------------------------------------------------------

class XDOTZInGamePage extends XDOTZPageBase;

var Automated GUILabel   PageCaption;
var automated GUIButton  InGameBackground;     // Button placed in the background

var Automated GUILabel   BackButtonLabel;
var Automated GUILabel   SelectButtonLabel;

var Automated GUIImage   BackButtonImage;
var Automated GUIImage   SelectButtonImage;

var localized string continue_string;                   // "Continue"
var localized string save_string;                   // "Continue"
var localized string appear_offline_string;             // "Appear Offline"
var localized string appear_online_string;              // "Appear Online"

var sound ClickSound;

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
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
    Super.Closed(Sender,bCancelled);
    XDotzPlayerController(PlayerOwner()).bPauseRumble = false;
    Controller.MouseEmulation(false);
   log(self $ " Opened");
}


/*****************************************************************
 * Sets the caption displayed at the top of the page
 *****************************************************************
 */

function SetPageCaption(string caption) {
    PageCaption.Caption = caption;
}

/*****************************************************************
 * Adds back and accept buttons
 *****************************************************************
 */

function AddBackButton() {
    BackButtonImage.SetVisibility(true);
    BackButtonLabel.SetVisibility(true);
}

function AddSelectButton() {
    SelectButtonImage.SetVisibility(true);
    SelectButtonLabel.SetVisibility(true);
}

function AddContinueButton() {
    SelectButtonImage.SetVisibility(true);
    SelectButtonLabel.SetVisibility(true);
    SelectButtonLabel.Caption = continue_string;
}

function AddSaveButton() {
    SelectButtonImage.SetVisibility(true);
    SelectButtonLabel.SetVisibility(true);
    SelectButtonLabel.Caption = save_string;
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
    SetTimer(0.05,false);
    XDotzPlayerController(PlayerOwner()).bPauseRumble = true;
    class'UtilsXbox'.static.Stop_Rumble();

   log(self $ " Opened");
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

}

/*****************************************************************
 * HandleKeyEven
 * Intercepts A and B presses
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {


   Log("HandleKeyEvent");
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
    }

   //for working with PC
    if (Key == 13){ //Enter
      DoButtonA();
    } else if (Key == 27){  //Esc
      DoButtonB();
    }

    return true;
}

/*****************************************************************
 *****************************************************************
 */

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

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZInGamePage.PageCaption_lbl'
    begin object name=PageCaption_lbl class=Class'GUI.GUILabel'
        TextFont="XBigFont"
        bMultiLine=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.1200000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.1000000
    end object
    PageCaption=PageCaption_lbl
    // Reference: GUIButton'XDOTZInGamePage.InGameBackground_btn'
    begin object name=InGameBackground_btn class=Class'GUI.GUIButton'
        StyleName="BBHorizontalBarSolid"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinHeight=1.0000000
        RenderWeight=0.1000000
    end object
    InGameBackground=InGameBackground_btn
    // Reference: GUILabel'XDOTZInGamePage.BackButtonLabel_lbl'
    begin object name=BackButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Back"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8900000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
        RenderWeight=0.5000000
    end object
    BackButtonLabel=BackButtonLabel_lbl
    // Reference: GUILabel'XDOTZInGamePage.SelectButtonLabel_lbl'
    begin object name=SelectButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Select"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8900000
        WinLeft=0.3500000
        WinWidth=0.4000000
        WinHeight=0.1000000
        RenderWeight=0.5000000
    end object
    SelectButtonLabel=SelectButtonLabel_lbl
    // Reference: GUIImage'XDOTZInGamePage.BackButtonImage_icn'
    begin object name=BackButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.B'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8900000
        WinLeft=0.1000000
        WinWidth=0.0700000
        WinHeight=0.0700000
        RenderWeight=0.5000000
    end object
    BackButtonImage=BackButtonImage_icn
    // Reference: GUIImage'XDOTZInGamePage.SelectButtonImage_icn'
    begin object name=SelectButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.A'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8900000
        WinLeft=0.3000000
        WinWidth=0.0700000
        WinHeight=0.0700000
        RenderWeight=0.5000000
    end object
    SelectButtonImage=SelectButtonImage_icn
    continue_string="Continue"
    save_string="Save Settings"
    appear_offline_string="Appear Offline"
    appear_online_string="Appear Online"
    ClickSound=Sound'DOTZXInterface.Select'
    period=0.5000000
    bRequire640x480=false
    bAllowedAsLast=true
    WinTop=0.1000000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.8500000
}