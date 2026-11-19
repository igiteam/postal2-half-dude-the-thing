/**
 * QuitConfirm - YES/NO to quit confirmation.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.2 $
 * @date    Sept 2003
 */
class DOTZMPQuitGameConfirm extends DOTZErrorPage;



var automated GUIButton YesButton;
var automated GUIButton NoButton;

var localized string quit_string;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);
    SetErrorCaption(quit_string);
}

/*****************************************************************
 * InternalOnClick
 *****************************************************************
 */

function bool InternalOnClick(GUIComponent Sender) {
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    if ( Sender == YesButton ) {
        Controller.OpenMenu("DOTZMenu.DOTZLoadingMenu");
       // class'MasterServerUplink'.default.DoUplink = false;
// 	     class'MasterServerUplink'.default.LANPort= 0;
//	     class'MasterServerUplink'.default.LANServerPort=0;
//        class'MasterServerUplink'.static.StaticSaveConfig();
        PlayerOwner().ConsoleCommand("Disconnect");
        PlayerOwner().ConsoleCommand("start MainMenu.dz");
        //PlayerOwner().ClientTravel("MainMenu.dz",TRAVEL_Relative, false);
        //PlayerOwner().Level.ServerTravel("MainMenu.dz",false);
        //PlayerOwner().Level.ServerTravel("?Loadnamed=MainMenu.dz",  false);
    } else {
        Controller.CloseMenu(false);
    }
    return true;
}




// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZMPQuitGameConfirm.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="Yes"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.2000000
        OnClick=DOTZMPQuitGameConfirm.InternalOnClick
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZMPQuitGameConfirm.cNoButton'
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
        OnClick=DOTZMPQuitGameConfirm.InternalOnClick
    end object
    NoButton=cNoButton
    quit_string="Are you sure you wish to quit?"
    ClickSound=Sound'DOTZXInterface.Select'
    WinHeight=0.2500000
}