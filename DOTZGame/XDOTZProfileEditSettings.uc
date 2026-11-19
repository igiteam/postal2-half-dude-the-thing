/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZProfileEditSettings extends XDOTZProfileBase;



//Page components
var Automated GuiLabel   NameTitleLabel;
var Automated GuiLabel   InvertLookTitleLabel;
var Automated GuiLabel   DifficultyTitleLabel;
//var Automated GuiLabel   VoiceThruSpeakersLabel;
var Automated GuiLabel   VoiceMaskingLabel;
var Automated GuiLabel   UseSubtitlesLabel;
var Automated GuiLabel   UseVibrationLabel;
var Automated GuiLabel   ControllerSensitivityLabel;

var Automated BBXSelectBox   InvertLookValue;
var Automated BBXSelectBox   DifficultyValue;
//var Automated BBXSelectBox   VoiceThruSpeakersValue;
var Automated BBXSelectBox   VoiceMaskingValue;
var Automated BBXSelectBox   UseSubtitlesValue;
var Automated BBXSelectBox   UseVibrationValue;
var Automated BBXSelectBox   ControllerSensitivityValue;
var Automated GuiLabel       NameButton;

// Configurable
var string KeyboardMenu;         // Profile menu location

//configurable stuff
var localized string PageCaption;

var localized string Normaltxt;
var localized string Invertedtxt;
var localized string Easytxt;
var localized string Hardtxt;
//var localized string Speakerstxt;
var localized string HeadSettxt;
var localized string Anonymoustxt;
var localized string Ontxt;
var localized string Offtxt;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   SetPageCaption (PageCaption);
   AddButtons();

   // Make sure values are all loaded
   //DOTZPlayerControllerBase(PlayerOwner()).SetProfileConfiguration();

   // Set up controls
   InitDynamicValues();

   InvertLookValue.AddItem(Normaltxt);
   InvertLookValue.AddItem(Invertedtxt);
   InvertLookValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetInvertLook()));

   DifficultyValue.AddItem(Easytxt);
   DifficultyValue.AddItem(Normaltxt);
   DifficultyValue.AddItem(Hardtxt);
   DifficultyValue.SetIndex(DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel());

   //VoiceThruSpeakersValue.AddItem(Speakerstxt);
   //VoiceThruSpeakersValue.AddItem(Headsettxt);
   //VoiceThruSpeakersValue.SetIndex(int(!DOTZPlayerControllerBase(PlayerOwner()).GetVoiceThruSpeakers()));

   VoiceMaskingValue.AddItem(Normaltxt);
   VoiceMaskingValue.AddItem(Anonymoustxt);
   VoiceMaskingValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetVoiceMasking()));

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

   SetFocus(DifficultyValue);
   DifficultyValue.SetFocus(none);

}

/*****************************************************************
 * InitDynamicValues
 * So we can initialize from other delegates too
 *****************************************************************
 */
function AddButtons(){
   //AddBackButton ();
   //AddSelectButton ();
   AddSaveButton ();
}

/*****************************************************************
 * InitDynamicValues
 * So we can initialize from other delegates too
 *****************************************************************
 */
function InitDynamicValues(){
   NameButton.Caption = DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName();
}


/*****************************************************************
 * HandleActivate
 * Delegate for the menu OnActivate event.
 *****************************************************************
 */
function HandleActivate(){
   InitDynamicValues();
}

/*****************************************************************
 * HandleDifficultyChange
 * This code clearly assumes that the index of the combobox is the
 * value of the difficulty 0-3
 *****************************************************************
 */
function HandleDifficultyChange(GUIComponent diffbox){
  DOTZPlayerControllerBase(PlayerOwner()).SetDifficultyLevel(BBXSelectBox(diffbox).GetIndex());
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
 * HandleVoiceThruSpeakersChange
 *****************************************************************
 */
/*function HandleVoiceThruSpeakersChange(GUIComponent voicethruspeakersbox){
  DOTZPlayerControllerBase(PlayerOwner()).SetVoiceThruSpeakers(!bool(BBXSelectBox(voicethruspeakersbox).GetIndex()));
} */

/*****************************************************************
 * HandleVoiceMaskingChange
 *****************************************************************
 */
function HandleVoiceMaskingChange(GUIComponent voicemaskingbox){
  DOTZPlayerControllerBase(PlayerOwner()).SetVoiceMasking(bool(BBXSelectBox(voicemaskingbox).GetIndex()));
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
    BBGuiController(Controller).CloseTo ('XDOTZMainMenu');
}

/*****************************************************************
 * X Button pressed
 *****************************************************************
 */
function DoButtonA ()
{
   //be sure to update your setting when you exit
    HandleDifficultyChange(DifficultyValue);
    HandleInvertChange(InvertLookValue);
    //HandleVoiceThruSpeakersChange(VoiceThruSpeakersValue);
    HandleVoiceMaskingChange(VoiceMaskingValue);
    HandleUseSubtitlesChange(UseSubtitlesValue);
    HandleUseVibrationChange(UseVibrationValue);
    HandleControllerSensitivityChange(ControllerSensitivityValue);

    Log ("Sens " $ ControllerSensitivityValue.GetIndex());

    DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();

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



/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZProfileEditSettings.NameTitleLabel_lbl'
    begin object name=NameTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Name:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.1200000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    NameTitleLabel=NameTitleLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.InvertLookTitleLabel_lbl'
    begin object name=InvertLookTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Invert Look:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.4800000
        WinLeft=0.1200000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    InvertLookTitleLabel=InvertLookTitleLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.DifficultyTitleLabel_lbl'
    begin object name=DifficultyTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Single Player Difficulty:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2700000
        WinLeft=0.1200000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    DifficultyTitleLabel=DifficultyTitleLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.VoiceMaskingLabel_lbl'
    begin object name=VoiceMaskingLabel_lbl class=Class'GUI.GUILabel'
        Caption="Voice Mask:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.4100000
        WinLeft=0.1200000
        WinWidth=0.3000000
        WinHeight=0.1000000
    end object
    VoiceMaskingLabel=VoiceMaskingLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.UseSubtitlesLabel_lbl'
    begin object name=UseSubtitlesLabel_lbl class=Class'GUI.GUILabel'
        Caption="Subtitles:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.3400000
        WinLeft=0.1200000
        WinWidth=0.3000000
        WinHeight=0.1000000
    end object
    UseSubtitlesLabel=UseSubtitlesLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.VibrationLabel_lbl'
    begin object name=VibrationLabel_lbl class=Class'GUI.GUILabel'
        Caption="Controller Vibration:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.5500000
        WinLeft=0.1200000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    UseVibrationLabel=VibrationLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.ControllerSensitivityLabel_lbl'
    begin object name=ControllerSensitivityLabel_lbl class=Class'GUI.GUILabel'
        Caption="Controller Sensitivity:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.6200000
        WinLeft=0.1200000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    ControllerSensitivityLabel=ControllerSensitivityLabel_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettings.InvertLookValue_lbl'
    begin object name=InvertLookValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.5000000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    InvertLookValue=InvertLookValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettings.DifficultyValue_lbl'
    begin object name=DifficultyValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.2900000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    DifficultyValue=DifficultyValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettings.VoiceMaskingValue_lbl'
    begin object name=VoiceMaskingValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.4300000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    VoiceMaskingValue=VoiceMaskingValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettings.UseSubtitlesValue_lbl'
    begin object name=UseSubtitlesValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.3600000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    UseSubtitlesValue=UseSubtitlesValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettings.VibrationValue_lbl'
    begin object name=VibrationValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.5700000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    UseVibrationValue=VibrationValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettings.ControllerSensitivityValue_lbl'
    begin object name=ControllerSensitivityValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.6400000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    ControllerSensitivityValue=ControllerSensitivityValue_lbl
    // Reference: GUILabel'XDOTZProfileEditSettings.NameButton_btn'
    begin object name=NameButton_btn class=Class'GUI.GUILabel'
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2200000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    NameButton=NameButton_btn
    KeyboardMenu="DOTZMenu.XDOTZKeyboard"
    PageCaption="Settings"
    Normaltxt="Normal"
    Invertedtxt="Inverted"
    Easytxt="Easy"
    Hardtxt="Hard"
    Anonymoustxt="Anonymous"
    Ontxt="On"
    Offtxt="Off"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnActivate=XDOTZProfileEditSettings.HandleActivate
    OnKeyEvent=XDOTZProfileEditSettings.HandleKeyEvent
}