//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZSwitchTeamsConfirm extends DOTZErrorPage;

var sound ClickSound;

// Error string
var localized string error_string;

// Profiles
//var Profiler profiles;

var automated GUIButton YesButton;
var automated GUIButton NoButton;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
}

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
    if ( Sender == YesButton ) {
        PlayerOwner().SwitchTeam();
        Controller.CloseMenu(true);
    } else {
        Controller.CloseMenu(false);
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
    error_string="Do you really want to switch teams?"
    // Reference: GUIButton'DOTZSwitchTeamsConfirm.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="Yes"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.2000000
        OnClick=DOTZSwitchTeamsConfirm.InternalOnClick
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZSwitchTeamsConfirm.cNoButton'
    begin object name=cNoButton class=Class'GUI.GUIButton'
        Caption="No"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.2000000
        WinWidth=0.2500000
        WinHeight=0.2000000
        TabOrder=1
        OnClick=DOTZSwitchTeamsConfirm.InternalOnClick
    end object
    NoButton=cNoButton
    WinHeight=0.2500000
    OnKeyEvent=DOTZSwitchTeamsConfirm.HandleKeyEvent
}