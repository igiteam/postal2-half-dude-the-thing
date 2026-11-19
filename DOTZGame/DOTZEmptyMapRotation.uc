//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZEmptyMapRotation extends DOTZErrorPage;

var sound ClickSound;

// Error string
var localized string error_string;
var automated GUIButton BackButton;

/*****************************************************************
 * Opened
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);
   SetErrorCaption(error_string);
}

/*****************************************************************
 * InternalOnClick
 *****************************************************************
 */

function bool InternalOnClick(GUIComponent Sender) {
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    if ( Sender == BackButton ) {
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
    ClickSound=Sound'DOTZXInterface.Select'
    error_string="You must add a map to the map rotation list in order to continue."
    // Reference: GUIButton'DOTZEmptyMapRotation.cBackButton'
    begin object name=cBackButton class=Class'GUI.GUIButton'
        Caption="Back"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3750000
        WinWidth=0.2500000
        WinHeight=0.2000000
        OnClick=DOTZEmptyMapRotation.InternalOnClick
    end object
    BackButton=cBackButton
    WinHeight=0.2500000
    OnKeyEvent=DOTZEmptyMapRotation.HandleKeyEvent
}