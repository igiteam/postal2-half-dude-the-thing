/**
 *
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.8 $
 * @date    Sept 2003
 */
class DOTZSettingsMenuIG extends DOTZInGamePage;



//controls
var Automated GUIImage      titleLogo;
var Automated GUITabControl TabC;
var Automated GUITitleBar   TabFooter;
var Automated GUIButton     BackButton;
//var Automated GUILabel      Title;

var Automated GUIButton   BackButtonLabel;

//tab text
var localized string VideoTxt;
var localized string AudioTxt;
var localized string ControlTxt;
//var localized string GameTxt;

//tab panels
var string VideoPanel;
var string AudioPanel;
var string ControlsPanel;
//var string GamePanel;
var sound ClickSound;

var string PageCaption;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   local int i;
   Super.Initcomponent(MyController, MyOwner);

   SetPageCaption(PageCaption);
   //AddBackButton();
   //AddNextButton();

   TabC.AddTab( VideoTxt,VideoPanel,,
                "Settings that effect the visual experience" );
   TabC.AddTab( AudioTxt,AudioPanel,,
                "Settings that effect the audible experience" );
   TabC.AddTab( ControlTxt ,ControlsPanel,,
                "Game controls settings" );
  // TabC.AddTab( GameTxt,GamePanel,,
  //              "Game settings" );

   for ( i = 0; i < TabC.TabStack.length; ++i ) {
      TabC.TabStack[i].Style = MyController.getStyle("BBTabButton");
   }

}


/*****************************************************************
 * Closed
 *****************************************************************
 */
 event Closed( GUIComponent Sender, bool bCancelled ) {
   Super.Closed( Sender, bCancelled );
   Controller.MouseEmulation( false );
}

/*****************************************************************
 * TabChange
 *****************************************************************
 */
function TabChange( GUIComponent Sender ) {
   if ( GUITabButton(Sender) == none ) return;
  	PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
}

/*****************************************************************
 * NotifyLevelChange
 *****************************************************************
 */
event NotifyLevelChange() {
   Controller.CloseMenu( true );
}

/*****************************************************************
 * ButtonClicked
 *****************************************************************
 */

function bool ButtonClickedBack( GUIComponent Sender ) {
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    if (Sender == BackButtonLabel) {
        Controller.CloseMenu(true);
    }

    return true;
}

//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUITabControl'DOTZSettingsMenuIG.MyTabs'
    begin object name=MyTabs class=Class'GUI.GUITabControl'
        bDockPanels=true
        TabHeight=0.0500000
        bAcceptsInput=true
        WinTop=0.1400000
        WinLeft=0.0800000
        WinHeight=48.0000000
        OnChange=DOTZSettingsMenuIG.TabChange
    end object
    TabC=MyTabs
    // Reference: GUIButton'DOTZSettingsMenuIG.BackButtonLabel_lbl'
    begin object name=BackButtonLabel_lbl class=Class'GUI.GUIButton'
        Caption="Back"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8700000
        WinLeft=0.0750000
        WinWidth=0.2000000
        WinHeight=0.0500000
        OnClick=DOTZSettingsMenuIG.ButtonClickedBack
    end object
    BackButtonLabel=BackButtonLabel_lbl
    VideoTxt="Video Settings"
    AudioTxt="Audio Settings"
    ControlTxt="Control Settings"
    VideoPanel="DOTZMenu.DOTZVideoSettings"
    AudioPanel="DOTZMenu.DOTZAudioSettings"
    ControlsPanel="DOTZMenu.DOTZControlSettings"
    ClickSound=Sound'DOTZXInterface.Select'
    PageCaption="Settings"
    // Reference: GUIButton'DOTZSettingsMenuIG.InGameBackground_btn'
    begin object name=InGameBackground_btn class=Class'GUI.GUIButton'
        StyleName="BBHorizontalBarSolid"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinTop=0.1900000
        WinLeft=0.0500000
        WinWidth=0.9000000
        WinHeight=0.7700000
        RenderWeight=0.1000000
    end object
    InGameBackground=InGameBackground_btn
    WinTop=0.0000000
    WinLeft=0.0000000
    WinWidth=1.0000000
    WinHeight=1.0000000
}