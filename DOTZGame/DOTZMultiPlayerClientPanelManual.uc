/**
 * DotzMultiPlayerBase
 *
 * Intended to be a base class to organize all multiplayer related menus
 *
 * @author  Jesse LaChapelle (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    July 2004
 */
class DOTZMultiPlayerClientPanelManual extends DOTZMultiPlayerClientPanel;



//Controls
var Automated GuiLabel        IPLabel;
var Automated BBEditBox       IPValue;
var Automated GUIButton       NextButtonLabel;


var bool accept_input;
var float period;

//var Automated GuiButton  CreateMatchButton;
var string PageCaption;


/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
   NextButtonLabel.OnClick=OnNext;
}


/*****************************************************************
 * Next Button
 *****************************************************************
 */
function bool OnNext( GUIComponent Sender ) {

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    if (IPValue.GetText() == "") {
        Controller.OpenMenu("DOTZMenu.DOTZEmptyIP");
    } else {
        //password prompt is always required for clients manually connecting to lan games
        Controller.OpenMenu("DOTZMenu.DOTZCharacterSelect", IPValue.GetText(), "true");
    }
    return true;
}



//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZMultiPlayerClientPanelManual.IPLabel_lbl'
    begin object name=IPLabel_lbl class=Class'GUI.GUILabel'
        Caption="Connect to host IP:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    IPLabel=IPLabel_lbl
    // Reference: BBEditBox'DOTZMultiPlayerClientPanelManual.IPValue_lbl'
    begin object name=IPValue_lbl class=Class'BBGui.BBEditBox'
        AllowedCharSet="1234567890."
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1100000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    IPValue=IPValue_lbl
    // Reference: GUIButton'DOTZMultiPlayerClientPanelManual.NextButtonLabel_lbl'
    begin object name=NextButtonLabel_lbl class=Class'GUI.GUIButton'
        Caption="Next"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7500000
        WinLeft=0.7000000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    NextButtonLabel=NextButtonLabel_lbl
    PageCaption="Multiplayer Join"
}