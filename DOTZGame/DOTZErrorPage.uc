//-----------------------------------------------------------
//  XDOTZErrorPage - Base class for error pages
//-----------------------------------------------------------

class DOTZErrorPage extends DOTZPageBase;

var automated GUIButton  ErrorBackground;     // Button placed in the background
var Automated GUILabel   BackButtonLabel;     // Back button label text
var Automated GUILabel   SelectButtonLabel;   // Select button label text
var Automated GUILabel   ErrorMessage;        // The error message to be displayed

var Automated GUIImage   BackButtonImage;     // The "B" button image
var Automated GUIImage   SelectButtonImage;   // The "A" button image

var sound ClickSound;

// Button strings for error boxes
var localized string cancel_string;                     // "Cancel"
var localized string accept_string;                     // "Accept"
var localized string continue_string;                   // "Continue"
var localized string switch_teams;                      // "Switch Teams"

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
 * HandleKeyEven
 * Intercepts A and B presses
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

    // A short pause
    if (!accept_input) return false;

    // Key down only
    if (State != 1) return false;

    if (Key == 27) {  //Esc
        Controller.CloseMenu(true);
    }


    return true;
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZErrorPage.ErrorBackground_btn'
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
    // Reference: GUILabel'DOTZErrorPage.BackButtonLabel_lbl'
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
    // Reference: GUILabel'DOTZErrorPage.SelectButtonLabel_lbl'
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
    // Reference: GUILabel'DOTZErrorPage.ErrorMessage_lbl'
    begin object name=ErrorMessage_lbl class=Class'GUI.GUILabel'
        TextFont="PlainGuiFont"
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
    // Reference: GUIImage'DOTZErrorPage.BackButtonImage_icn'
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
    // Reference: GUIImage'DOTZErrorPage.SelectButtonImage_icn'
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
    accept_string="Accept"
    continue_string="Continue"
    switch_teams="Switch Teams"
    bRequire640x480=false
    bAllowedAsLast=true
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.5000000
}