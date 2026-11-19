/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZOptionsIGSP extends XDOTZInGamePage;



//Page components
var Automated GuiLabel   InvertLookTitleLabel;
var Automated GuiLabel   UseSubtitlesLabel;
var Automated GuiLabel   UseVibrationLabel;
var Automated GuiLabel   ControllerSensitivityLabel;

var Automated BBXSelectBox   InvertLookValue;
var Automated BBXSelectBox   UseSubtitlesValue;
var Automated BBXSelectBox   UseVibrationValue;
var Automated BBXSelectBox   ControllerSensitivityValue;

// Configurable
var string KeyboardMenu;         // Profile menu location

//configurable stuff
var localized string PageCaption;

var localized string Normaltxt;
var localized string Invertedtxt;
var localized string Easytxt;
var localized string Hardtxt;
var localized string Ontxt;
var localized string Offtxt;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   SetPageCaption (PageCaption);
   AddBackButton ();
   AddSaveButton();

   // Make sure values are all loaded
   //DOTZPlayerControllerBase(PlayerOwner()).SetProfileConfiguration();

   InvertLookValue.AddItem(Normaltxt);
   InvertLookValue.AddItem(Invertedtxt);
   InvertLookValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetInvertLook()));

   UseSubtitlesValue.AddItem(Offtxt);
   UseSubtitlesValue.AddItem(Ontxt);
   UseSubtitlesValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetUseSubtitles()));

   UseVibrationValue.AddItem(Offtxt);
   UseVibrationValue.AddItem(Ontxt);
   UseVibrationValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetUseVibration()));

   ControllerSensitivityValue.AddItem("1");
   ControllerSensitivityValue.AddItem("2");
   ControllerSensitivityValue.AddItem("3");
   ControllerSensitivityValue.AddItem("4");
   ControllerSensitivityValue.AddItem("5");
   ControllerSensitivityValue.AddItem("6");
   ControllerSensitivityValue.AddItem("7");
   ControllerSensitivityValue.AddItem("8");
   ControllerSensitivityValue.AddItem("9");
   ControllerSensitivityValue.AddItem("10");
   ControllerSensitivityValue.SetIndex(DOTZPlayerControllerBase(PlayerOwner()).GetControllerSensitivity());


   SetFocus(UseSubtitlesValue);
   UseSubtitlesValue.SetFocus(none);
}


/*****************************************************************
 * HandleActivate
 * Delegate for the menu OnActivate event.
 *****************************************************************
 */
function HandleActivate(){


}

/*****************************************************************
 * HandleInvertChange
 * This assumes your index implies a boolean value. index 0 = false
 *****************************************************************
 */
function HandleInvertChange(GUIComponent invertbox){
  DOTZPlayerControllerBase(PlayerOwner()).SetInvertLook(bool(BBXSelectBox(invertbox).GetIndex()));
}

/*****************************************************************
 * HandleUseSubtitlesChange
 * This assumes your index implies a boolean value.
 *****************************************************************
 */
function HandleUseSubtitlesChange(GUIComponent usesubtitlesbox){
  DOTZPlayerControllerBase(PlayerOwner()).SetUseSubtitles(bool(BBXSelectBox(usesubtitlesbox).GetIndex()));
}

/*****************************************************************
 * HandleUseVibrationChange
 * This assumes your index implies a boolean value.
 *****************************************************************
 */
function HandleUseVibrationChange(GUIComponent usevibrationbox){
  DOTZPlayerControllerBase(PlayerOwner()).SetUseVibration(bool(BBXSelectBox(usevibrationbox).GetIndex()));
}

/*****************************************************************
 * HandleControllerSensitivityChange
 * This assumes your index implies a boolean value.
 *****************************************************************
 */
function HandleControllerSensitivityChange(GUIComponent sensitivitybox){
  DOTZPlayerControllerBase(PlayerOwner()).SetControllerSensitivity(BBXSelectBox(sensitivitybox).GetIndex());
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
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
 * Close menus
 *
 *****************************************************************
 */
function CloseMenu ()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * X Button pressed
 *****************************************************************
 */
function DoButtonA ()
{
   //be sure to update your setting when you exit
    HandleInvertChange(InvertLookValue);
    HandleUseSubtitlesChange(UseSubtitlesValue);
    HandleUseVibrationChange(UseVibrationValue);
    HandleControllerSensitivityChange(ControllerSensitivityValue);

    DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();

    CloseMenu ();
}

/*****************************************************************
 * X Button pressed
 *****************************************************************
 */
function DoButtonB ()
{
    CloseMenu ();
}

/*****************************************************************
 * NotifyLevelChange
 *****************************************************************
 */
event NotifyLevelChange()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    /*local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case NameButton:
             return Controller.OpenMenu(KeyboardMenu);

             return false;
             break;
    };*/

   return false;
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZOptionsIGSP.InvertLookTitleLabel_lbl'
    begin object name=InvertLookTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Invert Look:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.3000000
        WinLeft=0.0750000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    InvertLookTitleLabel=InvertLookTitleLabel_lbl
    // Reference: GUILabel'XDOTZOptionsIGSP.UseSubtitlesLabel_lbl'
    begin object name=UseSubtitlesLabel_lbl class=Class'GUI.GUILabel'
        Caption="Subtitles:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.0750000
        WinWidth=0.3000000
        WinHeight=0.1000000
    end object
    UseSubtitlesLabel=UseSubtitlesLabel_lbl
    // Reference: GUILabel'XDOTZOptionsIGSP.VibrationLabel_lbl'
    begin object name=VibrationLabel_lbl class=Class'GUI.GUILabel'
        Caption="Controller Vibration:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.4000000
        WinLeft=0.0750000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    UseVibrationLabel=VibrationLabel_lbl
    // Reference: GUILabel'XDOTZOptionsIGSP.ControllerSensitivityLabel_lbl'
    begin object name=ControllerSensitivityLabel_lbl class=Class'GUI.GUILabel'
        Caption="Controller Sensitivity:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.5000000
        WinLeft=0.0750000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    ControllerSensitivityLabel=ControllerSensitivityLabel_lbl
    // Reference: BBXSelectBox'XDOTZOptionsIGSP.InvertLookValue_lbl'
    begin object name=InvertLookValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3200000
        WinLeft=0.4800000
        WinWidth=0.4750000
        WinHeight=0.0900000
    end object
    InvertLookValue=InvertLookValue_lbl
    // Reference: BBXSelectBox'XDOTZOptionsIGSP.UseSubtitlesValue_lbl'
    begin object name=UseSubtitlesValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2200000
        WinLeft=0.4800000
        WinWidth=0.4750000
        WinHeight=0.0900000
    end object
    UseSubtitlesValue=UseSubtitlesValue_lbl
    // Reference: BBXSelectBox'XDOTZOptionsIGSP.VibrationValue_lbl'
    begin object name=VibrationValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4200000
        WinLeft=0.4800000
        WinWidth=0.4750000
        WinHeight=0.0900000
    end object
    UseVibrationValue=VibrationValue_lbl
    // Reference: BBXSelectBox'XDOTZOptionsIGSP.ControllerSensitivityValue_lbl'
    begin object name=ControllerSensitivityValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5200000
        WinLeft=0.4800000
        WinWidth=0.4750000
        WinHeight=0.0900000
    end object
    ControllerSensitivityValue=ControllerSensitivityValue_lbl
    KeyboardMenu="DOTZMenu.XDOTZKeyboard"
    PageCaption="Settings"
    Normaltxt="Normal"
    Invertedtxt="Inverted"
    Easytxt="Easy"
    Hardtxt="Hard"
    Ontxt="On"
    Offtxt="Off"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2000000
    WinHeight=0.6000000
    OnKeyEvent=XDOTZOptionsIGSP.HandleKeyEvent
}