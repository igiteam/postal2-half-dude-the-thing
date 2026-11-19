/**
 * XDOTZProfileEditSettingsDemo - Profile Edit Demo version
 *  -ripped from XDOTZProfileEditSettings
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    June 20, 2005
 */

class XDOTZProfileEditSettingsDemo extends XDOTZDemo;



//Page components
var Automated GuiLabel   NameTitleLabel;
var Automated GuiLabel   InvertLookTitleLabel;
var Automated GuiLabel   DifficultyTitleLabel;
var Automated GuiLabel   UseSubtitlesLabel;
var Automated GuiLabel   UseVibrationLabel;

var Automated GuiLabel    NameButton;
var Automated BBXSelectBox   InvertLookValue;
var Automated BBXSelectBox   DifficultyValue;
var Automated BBXSelectBox   UseSubtitlesValue;
var Automated BBXSelectBox   UseVibrationValue;

// Configurable
var string KeyboardMenu;         // Profile menu location

//configurable stuff
var localized string PageCaption;

var localized string Normaltxt;
var localized string Invertedtxt;
var localized string Easytxt;
var localized string Hardtxt;
var localized string Speakerstxt;
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
   AddBackButton ();
   //AddSelectButton ();

   // Set up controls
   InitDynamicValues();

   // Load up profile info from DemoProfile
   DOTZPlayerControllerBase(PlayerOwner()).DemoProfileConfig();

   InvertLookValue.AddItem(Normaltxt);
   InvertLookValue.AddItem(Invertedtxt);
   InvertLookValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetInvertLook()));

   DifficultyValue.AddItem(Easytxt);
   DifficultyValue.AddItem(Normaltxt);
   DifficultyValue.AddItem(Hardtxt);
   DifficultyValue.SetIndex(DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel());

   UseSubtitlesValue.AddItem(Offtxt);
   UseSubtitlesValue.AddItem(Ontxt);
   UseSubtitlesValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetUseSubtitles()));

   UseVibrationValue.AddItem(Offtxt);
   UseVibrationValue.AddItem(Ontxt);
   UseVibrationValue.SetIndex(int(DOTZPlayerControllerBase(PlayerOwner()).GetUseVibration()));

   LiveCaption.bVisible = false;
}




/*****************************************************************
 * InitDynamicValues
 * So we can initialize from other delegates too
 *****************************************************************
 */
function InitDynamicValues(){
   //NameButton.Caption = DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName();
}


/*****************************************************************
 * HandleActivate
 * Delegate for the menu OnActivate event.
 *****************************************************************
 */
function HandleActivate(){
   //InitDynamicValues();
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

   //be sure to update your setting when you exit
   HandleDifficultyChange(DifficultyValue);
   HandleInvertChange(InvertLookValue);
   HandleUseSubtitlesChange(UseSubtitlesValue);
   HandleUseVibrationChange(UseVibrationValue);
   // Note: properly save to demo profile
   DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();

   Controller.MouseEmulation(false);
}

/*****************************************************************
 * A Button pressed
 *****************************************************************
 */
function DoButtonA ()
{

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
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);



   return false;
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

function SetLoginName()
{
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZProfileEditSettingsDemo.NameTitleLabel_lbl'
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
    // Reference: GUILabel'XDOTZProfileEditSettingsDemo.InvertLookTitleLabel_lbl'
    begin object name=InvertLookTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Invert Look:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.3600000
        WinLeft=0.1200000
        WinWidth=0.3000000
        WinHeight=0.1000000
    end object
    InvertLookTitleLabel=InvertLookTitleLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettingsDemo.DifficultyTitleLabel_lbl'
    begin object name=DifficultyTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Single Player Difficulty:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2800000
        WinLeft=0.1200000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    DifficultyTitleLabel=DifficultyTitleLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettingsDemo.VibrationLabel_lbl'
    begin object name=VibrationLabel_lbl class=Class'GUI.GUILabel'
        Caption="Controller Vibration:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.4400000
        WinLeft=0.1200000
        WinWidth=0.3000000
        WinHeight=0.1000000
    end object
    UseVibrationLabel=VibrationLabel_lbl
    // Reference: GUILabel'XDOTZProfileEditSettingsDemo.NameButton_btn'
    begin object name=NameButton_btn class=Class'GUI.GUILabel'
        Caption="Demo Profile"
        StyleName="BBXRoundReadable"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2200000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.0600000
        RenderWeight=0.9000000
    end object
    NameButton=NameButton_btn
    // Reference: BBXSelectBox'XDOTZProfileEditSettingsDemo.InvertLookValue_lbl'
    begin object name=InvertLookValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.3800000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
        TabOrder=3
    end object
    InvertLookValue=InvertLookValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettingsDemo.DifficultyValue_lbl'
    begin object name=DifficultyValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.3000000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
        TabOrder=1
        bFocusOnWatch=true
    end object
    DifficultyValue=DifficultyValue_lbl
    // Reference: BBXSelectBox'XDOTZProfileEditSettingsDemo.VibrationValue_lbl'
    begin object name=VibrationValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.4600000
        WinLeft=0.4800000
        WinWidth=0.4000000
        WinHeight=0.0600000
        TabOrder=4
    end object
    UseVibrationValue=VibrationValue_lbl
    KeyboardMenu="DOTZMenu.XDOTZKeyboard"
    PageCaption="Settings"
    Normaltxt="Normal"
    Invertedtxt="Inverted"
    Easytxt="Easy"
    Hardtxt="Hard"
    Speakerstxt="Speakers"
    HeadSettxt="Xbox Communicator"
    Anonymoustxt="Anonymous"
    Ontxt="On"
    Offtxt="Off"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnActivate=XDOTZProfileEditSettingsDemo.HandleActivate
    OnKeyEvent=XDOTZProfileEditSettingsDemo.HandleKeyEvent
}