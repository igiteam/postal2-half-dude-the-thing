/**
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.3 $
 * @date    Sept 2003
 */
class DOTZSaveConfirm extends DOTZErrorPage;

var string OldSaveName;
var string Owner;

var localized string SaveMessage;
var localized string SaveMessageOver;
var localized string save_string;

var automated GUIButton YesButton;
var automated GUIButton NoButton;

/*****************************************************************
 * Opened
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);
}


/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied here.
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    OldSaveName = param1;
    Owner = param2;

    if (OldSaveName == "") {
        SetErrorCaption(SaveMessage);
    } else {
        SetErrorCaption(SaveMessageOver);
    }
}

/*****************************************************************
 * InternalOnClick
 *****************************************************************
 */

function bool InternalOnClick(GUIComponent Sender) {
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    if ( Sender == YesButton ) {

        PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
        AdvancedGameInfo(PlayerOwner().Level.Game).SaveOverGame(OldSaveName, Owner, 0);

        //the save slot protects itself so that nothing can happen until the
        //next tick. However there is no next tick if you are paused (as you are now)
        //so if you want to save to another slot, then you need to reset the save
        //var manually
        AdvancedGameInfo(PlayerOwner().Level.Game).bSaveInProgress = false;
        BBGUIController(Controller).CloseTo('DOTZSPPause');
    } else {
        Controller.CloseMenu(false);
    }
    return true;
}

//===========================================================================
// defaultproperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    SaveMessage="Save your progress?"
    SaveMessageOver="Are you sure you want to overwrite this game?"
    save_string="Save"
    // Reference: GUIButton'DOTZSaveConfirm.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="Save"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.2000000
        OnClick=DOTZSaveConfirm.InternalOnClick
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZSaveConfirm.cNoButton'
    begin object name=cNoButton class=Class'GUI.GUIButton'
        Caption="Cancel"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.2000000
        WinWidth=0.2500000
        WinHeight=0.2000000
        TabOrder=1
        OnClick=DOTZSaveConfirm.InternalOnClick
    end object
    NoButton=cNoButton
    WinHeight=0.2500000
    OnKeyEvent=DOTZSaveConfirm.HandleKeyEvent
}