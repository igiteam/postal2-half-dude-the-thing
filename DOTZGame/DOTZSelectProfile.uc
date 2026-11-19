/**
 * QuitConfirm - YES/NO to quit confirmation.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.2 $
 * @date    Sept 2003
 */
class DOTZSelectProfile extends DOTZErrorPage;



var automated GUIButton SelectButton;
var Automated BBListBox ProfileList;

var localized string msg_string;

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
 * Refresh the accounts list
 *****************************************************************
 */
function Refresh_Profiles_List ()
{
    local int profile_count;
    local int current;
    local int p;
    local string tmp;

    current = 0;
    profile_count = DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();

    ProfileList.List.Clear();
    for (p = 0; p < profile_count; ++p)
    {
        // Need to toss out the .prof
        tmp = DOTZPlayerControllerBase(PlayerOwner()).GetProfileName(p);
        //DOTZPlayerControllerBase(PlayerOwner()).ReplaceText(tmp, ".prof", "");
        ProfileList.List.Add(tmp);

        // Select the current profile
        if (tmp == DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName()) {
            current = p;
        }
    }

    Log("Setting selection to item " $ current);
    ProfileList.List.SetIndex(current);
    ProfileList.bHasFocus = true;
}

/*****************************************************************
 * Closed
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    // Check if this menu needs to be displayed
    if ( DOTZPlayerControllerBase(PlayerOwner()).IsLoadedProfileValid() ) {
        Controller.CloseMenu(true);
    }

    Refresh_Profiles_List();

    if ( ProfileList.List.ItemCount == 0) {
        Controller.CloseMenu(true);
    }

    if ( ProfileList.List.ItemCount == 1) {
        ProfileList.List.Index = 0;
        InternalOnClick(SelectButton);  // Fake a button press
    }
}

/*****************************************************************
 * InternalOnClick
 *****************************************************************
 */

function bool InternalOnClick(GUIComponent Sender) {
    local int list_index;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    if ( Sender == SelectButton ) {

        // Load up the selected profile
        list_index = ProfileList.List.Index;
        if (list_index >= 0 && list_index < ProfileList.List.ItemCount) {
            if (DOTZPlayerControllerBase(PlayerOwner()).LoadProfile(list_index))
                Controller.CloseMenu(true);
        }
    }
    return true;
}




// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZSelectProfile.cSelectButton'
    begin object name=cSelectButton class=Class'GUI.GUIButton'
        Caption="Select"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8500000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.1000000
        OnClick=DOTZSelectProfile.InternalOnClick
    end object
    SelectButton=cSelectButton
    // Reference: BBListBox'DOTZSelectProfile.ProfileList_box'
    begin object name=ProfileList_box class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.6000000
    end object
    ProfileList=ProfileList_box
    msg_string="Select a profile:"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2000000
    WinLeft=0.2500000
    WinWidth=0.5000000
    WinHeight=0.6000000
}