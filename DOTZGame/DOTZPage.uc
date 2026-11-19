//-----------------------------------------------------------
//
//-----------------------------------------------------------

class DOTZPage extends DOTZPageBase;

var Automated GUILabel   PageCaption;

var Automated GUIButton   BackButtonLabel;
var Automated GUIButton   NextButtonLabel;

var sound ClickSound;


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
    //BackButtonImage.SetVisibility(true);
    BackButtonLabel.bVisible = true;
    BackButtonLabel.bNeverFocus = false;
    MapControls();
}

function AddNextButton() {
    //NextButtonImage.SetVisibility(true);
    NextButtonLabel.bVisible = true;
    NextButtonLabel.bNeverFocus = false;
    MapControls();
}

/*****************************************************************
 *****************************************************************
 */

function Click_Back ()
{
    Controller.CloseMenu(true);
    Log("Click Back");
}


function Click_Next ()
{
    Log("Click Next");
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
    //Log(" *** Button down " $ Key);

    if (Key == 27) {  //Esc
        // Unpause if this is the last menu
        if (BBGUIController(Controller).GetMenuStackSize() != 1) {
            Controller.CloseMenu(true);
        }


    }

    return true;
}

/*****************************************************************
 * ButtonClicked
 *****************************************************************
 */

function bool ButtonClickedBase( GUIComponent Sender ) {
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    if (Sender == BackButtonLabel)
        Click_Back();
    else if (Sender == NextButtonLabel)
        Click_Next();

    return true;
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZPage.PageCaption_lbl'
    begin object name=PageCaption_lbl class=Class'GUI.GUILabel'
        TextFont="BigGuiFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.0650000
        WinLeft=0.0700000
        WinWidth=0.8000000
        WinHeight=0.1000000
    end object
    PageCaption=PageCaption_lbl
    // Reference: GUIButton'DOTZPage.BackButtonLabel_lbl'
    begin object name=BackButtonLabel_lbl class=Class'GUI.GUIButton'
        Caption="Back"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.9100000
        WinLeft=0.1000000
        WinWidth=0.2000000
        WinHeight=0.0500000
        OnClick=DOTZPage.ButtonClickedBase
    end object
    BackButtonLabel=BackButtonLabel_lbl
    // Reference: GUIButton'DOTZPage.NextButtonLabel_lbl'
    begin object name=NextButtonLabel_lbl class=Class'GUI.GUIButton'
        Caption="Next"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.9100000
        WinLeft=0.7000000
        WinWidth=0.2000000
        WinHeight=0.0500000
        OnClick=DOTZPage.ButtonClickedBase
    end object
    NextButtonLabel=NextButtonLabel_lbl
    ClickSound=Sound'DOTZXInterface.Select'
    bRequire640x480=false
    bAllowedAsLast=true
    WinHeight=1.0000000
}