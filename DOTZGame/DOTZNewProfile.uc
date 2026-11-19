/**
 * QuitConfirm - YES/NO to quit confirmation.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.2 $
 * @date    Sept 2003
 */
class DOTZNewProfile extends DOTZErrorPage;



var automated GUIButton CreateButton;
var automated GUIButton CancelButton;
var automated GUIEditBox NameEditBox;

var localized string msg_string;
var localized string valid_chars_string;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    SetErrorCaption(msg_string);
}

/*****************************************************************
 * InternalOnClick
 *****************************************************************
 */

function bool InternalOnClick(GUIComponent Sender) {
    local int profile_count;
    local int p;
    local bool existing;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    if ( Sender == CreateButton ) {
         existing = false;

         profile_count = DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();

         for (p = 0; p < profile_count; ++p) {
            if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileName(p) == NameEditBox.GetText()) {
                existing = true;
                break;
            }
         }

         Log("Creating profile " $ NameEditBox.GetText());

         if (NameEditBox.GetText() != ""){
            if (existing) {
                return BBGuiController(Controller).SwitchMenu("DOTZMenu.XDOTZProfileAlreadyOne");
            } else {
                Log("Creating profile " $ NameEditBox.GetText());
                DOTZPlayerControllerBase(PlayerOwner()).NewProfile(NameEditBox.GetText());

                DOTZPlayerControllerBase(PlayerOwner()).SetDifficultyLevel(1);
                DOTZPlayerControllerBase(PlayerOwner()).SetInvertLook(false);
                //DOTZPlayerControllerBase(PlayerOwner()).SetVoiceThruSpeakers(false);
                DOTZPlayerControllerBase(PlayerOwner()).SetVoiceMasking(false);
                DOTZPlayerControllerBase(PlayerOwner()).SetUseSubtitles(true);
                DOTZPlayerControllerBase(PlayerOwner()).SetUseVibration(true);
                DOTZPlayerControllerBase(PlayerOwner()).SetControllerSensitivity(4);

                Controller.CloseMenu(false);
            }
         }

    } else {
        Controller.CloseMenu(false);
    }
    return true;
}

/*****************************************************************
 * InternalOnClick
 *****************************************************************
 */



// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZNewProfile.cCreateButton'
    begin object name=cCreateButton class=Class'GUI.GUIButton'
        Caption="Create"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.6500000
        WinWidth=0.2500000
        WinHeight=0.1200000
        OnClick=DOTZNewProfile.InternalOnClick
    end object
    CreateButton=cCreateButton
    // Reference: GUIButton'DOTZNewProfile.cCancelButton'
    begin object name=cCancelButton class=Class'GUI.GUIButton'
        Caption="Cancel"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.1500000
        WinWidth=0.2500000
        WinHeight=0.1200000
        TabOrder=1
        OnClick=DOTZNewProfile.InternalOnClick
    end object
    CancelButton=cCancelButton
    // Reference: BBEditBox'DOTZNewProfile.cNameEditBox'
    begin object name=cNameEditBox class=Class'BBGui.BBEditBox'
        AllowedCharSet="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890 "
        MaxWidth=15
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3500000
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.1200000
    end object
    NameEditBox=cNameEditBox
    msg_string="Enter a name for the new profile:"
    ClickSound=Sound'DOTZXInterface.Select'
}