/**
 * XDOTZKeyboard - Virtual keyboard for name input.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZKeyboard extends XDOTZProfileBase;



 // Left border for action keys
       // Width of action keys

      // Where do the keys start on the left side
        // Top border of keyboard
           // Height of keys
           // Width of keys
           // 6 * KEYSWIDTH + KEYSBORDERLEFT
           // 8 * KEYSWIDTH + KEYSBORDERLEFT

const MAX_PROFILE_LEN = 10;

//Page components
var Automated GuiButton  ShiftButton;
var Automated GuiButton  CapsLockButton;

var Automated GuiButton  SpaceButton;
var Automated GuiButton  BackspaceButton;

var Automated GuiButton  DoneButton;

var Automated GuiLabel   CurrentNameLabel;

var int                  CurrentKeyboard; // 0 - lowercase, 1 - uppercase shift, 2 - uppercase caps, 3 - symbols

// Profiles
//var Profiler profiles;


struct KeyButton {
    var GuiButton    guibutton;
    var string       lowercaselabel;
    var string       uppercaselabel;
    var string       symbollabel;
};

var Automated KeyButton keyboardlayout[40];

var sound ClickSound;

//configurable stuff
var localized string PageCaption;

/*****************************************************************
 * GetChar
 * Given the index of the key, the appropriate character is
 * returned.
 *****************************************************************
 */

function string GetKeyboardChar(int button_index) {
    if (CurrentKeyboard == 0)
       return keyboardlayout[button_index].lowercaselabel;

    if (CurrentKeyboard == 1 || CurrentKeyboard == 2)
       return keyboardlayout[button_index].uppercaselabel;

    if (CurrentKeyboard == 3)
       return keyboardlayout[button_index].symbollabel;
}

/*****************************************************************
 * LayoutKeyboard
 *****************************************************************
 */

// This function lays out the GUI buttons for the keyboard programatically
function LayoutKeyboard () {
   local float button_width;
   local int button_index;
   local float xpos;
   local float ypos;

   button_width = ( - 0.29) / 10.0;

   for (button_index = 0; button_index < 36; ++button_index) {
       xpos = 0.29 + (0.045 + 0.015) * (button_index % 10);
       ypos = 0.3 + (0.06 + 0.015) * (button_index / 10);

       keyboardlayout[button_index].guibutton = GUIButton(AddComponent("BBGui.BBXButtonBorder"));

       //keyboardlayout[button_index].guibutton =
       keyboardlayout[button_index].guibutton.Caption = GetKeyboardChar(button_index);
       keyboardlayout[button_index].guibutton.Hint = "";
       keyboardlayout[button_index].guibutton.OnClick = ButtonClicked;
       //keyboardlayout[button_index].guibutton.StyleName = "BBTextButton";
       keyboardlayout[button_index].guibutton.TabOrder = 1;
       keyboardlayout[button_index].guibutton.bBoundToParent = true;
       keyboardlayout[button_index].guibutton.bScaleToParent = true;
       keyboardlayout[button_index].guibutton.WinWidth = 0.045;
       keyboardlayout[button_index].guibutton.WinHeight = 0.06;
       keyboardlayout[button_index].guibutton.WinLeft = xpos + 0.01;
       keyboardlayout[button_index].guibutton.WinTop = ypos + 0.01;
       keyboardlayout[button_index].guibutton.bFocusOnWatch = true;

       //AppendComponent(keyboardlayout[button_index].guibutton);
   }

   MapControls();
}

function RelabelKeyboard () {
    local int button_index;

    for (button_index = 0; button_index < 36; ++button_index) {
        keyboardlayout[button_index].guibutton.Caption = GetKeyboardChar(button_index);
    }
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
 * X Button pressed
 *
 *****************************************************************
 */

function DoButtonX ()
{
     if (len(CurrentNameLabel.Caption) > 0) {
         CurrentNameLabel.Caption = Left(CurrentNameLabel.Caption, len(CurrentNameLabel.Caption)-1);
     }
}

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);
   // init my components...

   //profiles = new(self) class'Profiler';

   SetPageCaption (PageCaption);

   AddBackButton ();
   AddBackspaceButton();

   CurrentNameLabel.Caption = "";

   LayoutKeyboard();
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
}

/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied
 * here.
 *
 * Param1 - the menu to load
 * Param2 - the name of the sub menu to load on top of the first menu
 *****************************************************************
 */
/*event HandleParameters( String param1, String param2 ) {

    if (param1 != ""){
        Controller.OpenMenu(param1);
    }
} */


/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */

function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;
    local int button_index;
    local bool existing;

    local int profile_count;
    local int p;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;


   	PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        // Accept and cancel
        case DoneButton:
             existing = false;

             profile_count = DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();

             for (p = 0; p < profile_count; ++p) {
                if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileName(p) == CurrentNameLabel.Caption) {
                    existing = true;
                    break;
                }
             }

             if (CurrentNameLabel.Caption != ""){
                if (existing) {
                    return BBGuiController(Controller).SwitchMenu("DOTZMenu.XDOTZProfileAlreadyOne");
                } else {
                    DOTZPlayerControllerBase(PlayerOwner()).NewProfile(CurrentNameLabel.Caption);

                    DOTZPlayerControllerBase(PlayerOwner()).SetDifficultyLevel(1);
                    DOTZPlayerControllerBase(PlayerOwner()).SetInvertLook(false);
                    //DOTZPlayerControllerBase(PlayerOwner()).SetVoiceThruSpeakers(false);
                    DOTZPlayerControllerBase(PlayerOwner()).SetVoiceMasking(false);
                    DOTZPlayerControllerBase(PlayerOwner()).SetUseSubtitles(false);
                    DOTZPlayerControllerBase(PlayerOwner()).SetUseVibration(true);
                    DOTZPlayerControllerBase(PlayerOwner()).SetControllerSensitivity(4);

                    return BBGuiController(Controller).SwitchMenu("DOTZMenu.XDOTZProfileEditSettings");
                }
             }
             break;

        // Alternate keyboards
        case ShiftButton:
             // Alternate uppercase and lowercase (Shift)
             if (CurrentKeyboard == 0)
                 CurrentKeyboard = 1;
             else
                 CurrentKeyboard = 0;

             RelabelKeyboard();
             return true;
             break;

        case CapsLockButton:
             // Alternate uppercase and lowercase (Caps lock)
             if (CurrentKeyboard == 0)
                 CurrentKeyboard = 2;
             else
                 CurrentKeyboard = 0;

             RelabelKeyboard();
             return true;
             break;

        // Space and backspace
        case SpaceButton:
             if (Len(CurrentNameLabel.Caption) < MAX_PROFILE_LEN) {
               CurrentNameLabel.Caption = CurrentNameLabel.Caption $ " ";
             }
             return true;
             break;

        case BackspaceButton:
             DoButtonX ();
             return true;
             break;

        default:
             for (button_index = 0; button_index < 36; ++button_index)
                 if (keyboardlayout[button_index].guibutton == Selected) {
                     // Append the character if the string isn't at the limit
                     if (Len(CurrentNameLabel.Caption) < MAX_PROFILE_LEN) {
                        CurrentNameLabel.Caption = CurrentNameLabel.Caption $ GetKeyboardChar(button_index);
                     }

                     // If shifted, switch back to lowercase
                     if (CurrentKeyboard == 1) {
                         CurrentKeyboard = 0;
                         RelabelKeyboard();
                     }

                     return true;
                 }
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
    // Reference: GUIButton'XDOTZKeyboard.ShiftButton_btn'
    begin object name=ShiftButton_btn class=Class'GUI.GUIButton'
        Caption="Shift"
        StyleName="BBXRoundReadable"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Shift Key"
        WinTop=0.3100000
        WinLeft=0.1100000
        WinWidth=0.1700000
        WinHeight=0.0600000
        bFocusOnWatch=true
        OnClick=XDOTZKeyboard.ButtonClicked
    end object
    ShiftButton=ShiftButton_btn
    // Reference: GUIButton'XDOTZKeyboard.CapsLockButton_btn'
    begin object name=CapsLockButton_btn class=Class'GUI.GUIButton'
        Caption="Caps Lock"
        StyleName="BBXRoundReadable"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Caps Lock"
        WinTop=0.3850000
        WinLeft=0.1100000
        WinWidth=0.1700000
        WinHeight=0.0600000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZKeyboard.ButtonClicked
    end object
    CapsLockButton=CapsLockButton_btn
    // Reference: GUIButton'XDOTZKeyboard.SpaceButton_btn'
    begin object name=SpaceButton_btn class=Class'GUI.GUIButton'
        Caption="Space"
        StyleName="BBXRoundReadable"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Insert a space"
        WinTop=0.4600000
        WinLeft=0.1100000
        WinWidth=0.1700000
        WinHeight=0.0600000
        bFocusOnWatch=true
        OnClick=XDOTZKeyboard.ButtonClicked
    end object
    SpaceButton=SpaceButton_btn
    // Reference: GUIButton'XDOTZKeyboard.BackspaceButton_btn'
    begin object name=BackspaceButton_btn class=Class'GUI.GUIButton'
        Caption="Backspace"
        StyleName="BBXRoundReadable"
        bBoundToParent=true
        bScaleToParent=true
        Hint="Delete a character"
        WinTop=0.5350000
        WinLeft=0.1100000
        WinWidth=0.1700000
        WinHeight=0.0600000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZKeyboard.ButtonClicked
    end object
    BackspaceButton=BackspaceButton_btn
    // Reference: GUIButton'XDOTZKeyboard.DoneButton_btn'
    begin object name=DoneButton_btn class=Class'GUI.GUIButton'
        Caption="Done"
        StyleName="BBXRoundReadable"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6500000
        WinLeft=0.2000000
        WinWidth=0.6000000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZKeyboard.ButtonClicked
    end object
    DoneButton=DoneButton_btn
    // Reference: GUILabel'XDOTZKeyboard.CurrentNameLabel_lbl'
    begin object name=CurrentNameLabel_lbl class=Class'GUI.GUILabel'
        Caption="CarrotsRule"
        TextAlign=1
        StyleName="BBXSquareButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.1000000
    end object
    CurrentNameLabel=CurrentNameLabel_lbl
    keyboardlayout[0]=(GUIButton=none,lowercaselabel="1",uppercaselabel="1",symbollabel="!")
    keyboardlayout[1]=(GUIButton=none,lowercaselabel="2",uppercaselabel="2",symbollabel="@")
    keyboardlayout[2]=(GUIButton=none,lowercaselabel="3",uppercaselabel="3",symbollabel="#")
    keyboardlayout[3]=(GUIButton=none,lowercaselabel="4",uppercaselabel="4",symbollabel="$")
    keyboardlayout[4]=(GUIButton=none,lowercaselabel="5",uppercaselabel="5",symbollabel="%")
    keyboardlayout[5]=(GUIButton=none,lowercaselabel="6",uppercaselabel="6",symbollabel="^")
    keyboardlayout[6]=(GUIButton=none,lowercaselabel="7",uppercaselabel="7",symbollabel="&")
    keyboardlayout[7]=(GUIButton=none,lowercaselabel="8",uppercaselabel="8",symbollabel="*")
    keyboardlayout[8]=(GUIButton=none,lowercaselabel="9",uppercaselabel="9",symbollabel="(")
    keyboardlayout[9]=(GUIButton=none,lowercaselabel="0",uppercaselabel="0",symbollabel=")")
    keyboardlayout[10]=(GUIButton=none,lowercaselabel="a",uppercaselabel="A",symbollabel="?")
    keyboardlayout[11]=(GUIButton=none,lowercaselabel="b",uppercaselabel="B",symbollabel="?")
    keyboardlayout[12]=(GUIButton=none,lowercaselabel="c",uppercaselabel="C",symbollabel="?")
    keyboardlayout[13]=(GUIButton=none,lowercaselabel="d",uppercaselabel="D",symbollabel="?")
    keyboardlayout[14]=(GUIButton=none,lowercaselabel="e",uppercaselabel="E",symbollabel="?")
    keyboardlayout[15]=(GUIButton=none,lowercaselabel="f",uppercaselabel="F",symbollabel="?")
    keyboardlayout[16]=(GUIButton=none,lowercaselabel="g",uppercaselabel="G",symbollabel="?")
    keyboardlayout[17]=(GUIButton=none,lowercaselabel="h",uppercaselabel="H",symbollabel="?")
    keyboardlayout[18]=(GUIButton=none,lowercaselabel="i",uppercaselabel="I",symbollabel="?")
    keyboardlayout[19]=(GUIButton=none,lowercaselabel="j",uppercaselabel="J",symbollabel="?")
    keyboardlayout[20]=(GUIButton=none,lowercaselabel="k",uppercaselabel="K",symbollabel="?")
    keyboardlayout[21]=(GUIButton=none,lowercaselabel="l",uppercaselabel="L",symbollabel="?")
    keyboardlayout[22]=(GUIButton=none,lowercaselabel="m",uppercaselabel="M",symbollabel="?")
    keyboardlayout[23]=(GUIButton=none,lowercaselabel="n",uppercaselabel="N",symbollabel="?")
    keyboardlayout[24]=(GUIButton=none,lowercaselabel="o",uppercaselabel="O",symbollabel="?")
    keyboardlayout[25]=(GUIButton=none,lowercaselabel="p",uppercaselabel="P",symbollabel="?")
    keyboardlayout[26]=(GUIButton=none,lowercaselabel="q",uppercaselabel="Q",symbollabel="?")
    keyboardlayout[27]=(GUIButton=none,lowercaselabel="r",uppercaselabel="R",symbollabel="?")
    keyboardlayout[28]=(GUIButton=none,lowercaselabel="s",uppercaselabel="S",symbollabel="?")
    keyboardlayout[29]=(GUIButton=none,lowercaselabel="t",uppercaselabel="T",symbollabel="?")
    keyboardlayout[30]=(GUIButton=none,lowercaselabel="u",uppercaselabel="U",symbollabel="?")
    keyboardlayout[31]=(GUIButton=none,lowercaselabel="v",uppercaselabel="V",symbollabel="?")
    keyboardlayout[32]=(GUIButton=none,lowercaselabel="w",uppercaselabel="W",symbollabel="?")
    keyboardlayout[33]=(GUIButton=none,lowercaselabel="x",uppercaselabel="X",symbollabel="?")
    keyboardlayout[34]=(GUIButton=none,lowercaselabel="y",uppercaselabel="Y",symbollabel="?")
    keyboardlayout[35]=(GUIButton=none,lowercaselabel="z",uppercaselabel="Z",symbollabel="?")
    ClickSound=Sound'DOTZXInterface.Select'
    PageCaption="Edit Profile"
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZKeyboard.HandleKeyEvent
}