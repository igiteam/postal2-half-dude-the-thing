//-----------------------------------------------------------
//
//-----------------------------------------------------------

class XDOTZPage extends XDOTZPageBase;

var Automated GUILabel   PageCaption;
var Automated GUILabel   LiveCaption;

var Automated GUILabel   BackButtonLabel;
var Automated GUILabel   SelectButtonLabel;
var Automated GUILabel   ContinueButtonLabel;
var Automated GUILabel   NextButtonLabel;
var Automated GUILabel   SignUpButtonLabel;
var Automated GUILabel   NewProfileButtonLabel;
var Automated GUILabel   RefreshButtonLabel;
var Automated GUILabel   SaveButtonLabel;
var Automated GUILabel   BackspaceButtonLabel;

var Automated GUIImage   BackButtonImage;
var Automated GUIImage   SelectButtonImage;
var Automated GUIImage   XButtonImage;

//configurable stuff
var localized string LoggedIn;        // Single Player menu location
var localized string NeedPassword;    // Single Player menu location
var localized string FailedSignIn;
var localized string NotSignedIn;

var sound ClickSound;

var bool accept_input;
var float period;

/*****************************************************************
 * This gets called every 1/2 second
 *****************************************************************
 */

function Periodic ()
{
    super.Periodic();

    SetLoginName();
}

/*****************************************************************
 * Sets the caption displayed at the top of the page
 *****************************************************************
 */

function SetPageCaption(string caption) {
    PageCaption.Caption = caption;
}

function SetLoginName()
{

    // Done in player controller
    /*if (class'UtilsXbox'.static.Get_Captured_Controller() >= 0
        && !class'UtilsXbox'.static.Check_Captured_Controller()) {
        // Open unplugged controller menu
        Controller.OpenMenu("DOTZMenu.XDOTZNoController");
    } */



    if (class'UtilsXbox'.static.Network_Is_Unplugged()) {
        // CARROT: Sign out done in error box
        //class'UtilsXbox'.static.Sign_Out();
        LiveCaption.Caption = FailedSignIn;
        return;
    }

    if (class'UtilsXbox'.static.Is_Signed_In())
        LiveCaption.Caption = LoggedIn $ " " $ class'UtilsXbox'.static.Get_Current_Name();
    else if (class'UtilsXbox'.static.Is_Auto_Need_Password())
        LiveCaption.Caption = NeedPassword;
    else if (class'UtilsXbox'.static.Is_Auto_Failed())
        LiveCaption.Caption = FailedSignIn;
    else
        LiveCaption.Caption = NotSignedIn;

   //LoggedIn;
   //NeedPassword;
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
    ContinueButtonLabel.SetVisibility(true);
}

function AddNextButton() {
    XButtonImage.SetVisibility(true);
    NextButtonLabel.SetVisibility(true);
}

function AddRefreshButton() {
    XButtonImage.SetVisibility(true);
    RefreshButtonLabel.SetVisibility(true);
}

function AddSignUpButton() {
    XButtonImage.SetVisibility(true);
    SignUpButtonLabel.SetVisibility(true);
}

function AddNewProfileButton() {
    XButtonImage.SetVisibility(true);
    NewProfileButtonLabel.SetVisibility(true);
}

function AddSaveButton() {
    SelectButtonImage.SetVisibility(true);
    SaveButtonLabel.SetVisibility(true);
}

function AddBackspaceButton() {
    XButtonImage.SetVisibility(true);
    BackspaceButtonLabel.SetVisibility(true);
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
    accept_input = false;
    Log("Not Accepting input...");
    SetTimer(0.05,false);

    SetLoginName();
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


/*****************************************************************
 * HandleKeyEven
 * It was like this when I got here
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

    //for working with PC
    if (Key == 13){ //Enter
      DoButtonA();
    } else if (Key == 27){  //Esc
      DoButtonB();
    } else if  (Key == 32){
      DoButtonStart();
    }


    return true;
}

function DoButtonA ()
{

}

function DoButtonB ()
{

}

function DoButtonX ()
{

}

function DoButtonStart ()
{
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZPage.PageCaption_lbl'
    begin object name=PageCaption_lbl class=Class'GUI.GUILabel'
        TextFont="XBigFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.1230000
        WinLeft=0.1550000
        WinWidth=0.8000000
        WinHeight=0.1000000
    end object
    PageCaption=PageCaption_lbl
    // Reference: GUILabel'XDOTZPage.LiveCaption_lbl'
    begin object name=LiveCaption_lbl class=Class'GUI.GUILabel'
        TextAlign=2
        TextFont="XPlainSmFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.0850000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.0100000
    end object
    LiveCaption=LiveCaption_lbl
    // Reference: GUILabel'XDOTZPage.BackButtonLabel_lbl'
    begin object name=BackButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Back"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.2050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    BackButtonLabel=BackButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.SelectButtonLabel_lbl'
    begin object name=SelectButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Select"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.4050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    SelectButtonLabel=SelectButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.ContinueButtonLabel_lbl'
    begin object name=ContinueButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Continue"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.4050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    ContinueButtonLabel=ContinueButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.NextButtonLabel_lbl'
    begin object name=NextButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Next"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.6050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    NextButtonLabel=NextButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.SignUpButtonLabel_lbl'
    begin object name=SignUpButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Create New Account"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.6050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    SignUpButtonLabel=SignUpButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.NewProfileButtonLabel_lbl'
    begin object name=NewProfileButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="New Profile"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.6050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    NewProfileButtonLabel=NewProfileButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.RefreshButtonLabel_lbl'
    begin object name=RefreshButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Refresh"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.6050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    RefreshButtonLabel=RefreshButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.SaveButtonLabel_lbl'
    begin object name=SaveButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Save Settings"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.4050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    SaveButtonLabel=SaveButtonLabel_lbl
    // Reference: GUILabel'XDOTZPage.BackspaceButtonLabel_lbl'
    begin object name=BackspaceButtonLabel_lbl class=Class'GUI.GUILabel'
        Caption="Backspace"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.6050000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    BackspaceButtonLabel=BackspaceButtonLabel_lbl
    // Reference: GUIImage'XDOTZPage.BackButtonImage_icn'
    begin object name=BackButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.B'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.1550000
        WinWidth=0.0700000
        WinHeight=0.0700000
    end object
    BackButtonImage=BackButtonImage_icn
    // Reference: GUIImage'XDOTZPage.SelectButtonImage_icn'
    begin object name=SelectButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.A'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.3550000
        WinWidth=0.0700000
        WinHeight=0.0700000
    end object
    SelectButtonImage=SelectButtonImage_icn
    // Reference: GUIImage'XDOTZPage.XButtonImage_icn'
    begin object name=XButtonImage_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.Buttons.X'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.8500000
        WinLeft=0.5550000
        WinWidth=0.0700000
        WinHeight=0.0700000
    end object
    XButtonImage=XButtonImage_icn
    LoggedIn="Signed-In:"
    NeedPassword="Not Signed-In: Pass code Needed"
    FailedSignIn="Sign-In Failed"
    NotSignedIn="Not Signed-In"
    ClickSound=Sound'DOTZXInterface.Select'
    period=0.1000000
    bRequire640x480=false
    bAllowedAsLast=true
    WinHeight=1.0000000
}