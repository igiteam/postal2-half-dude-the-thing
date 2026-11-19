/**
 * QuitConfirm - YES/NO to quit confirmation.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.2 $
 * @date    Sept 2003
 */
class DOTZQuitConfirm extends DOTZErrorPage;



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
   if ( Sender == YesButton ) PlayerOwner().ConsoleCommand( "exit" );
   else Controller.CloseMenu(false);
   return true;
}




// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZQuitConfirm.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="Yes"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.2000000
        OnClick=DOTZQuitConfirm.InternalOnClick
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZQuitConfirm.cNoButton'
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
        OnClick=DOTZQuitConfirm.InternalOnClick
    end object
    NoButton=cNoButton
    quit_string="Are you sure you want to exit the game?"
    ClickSound=Sound'DOTZXInterface.Select'
    WinHeight=0.2500000
}