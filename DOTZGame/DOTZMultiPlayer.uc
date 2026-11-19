/**
 * DotzMultiPlayerBase
 *
 * Intended to be a base class to organize all multiplayer related menus
 *
 * @author  Jesse LaChapelle (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    July 2004
 */
class DOTZMultiPlayer extends DOTZMultiPlayerBase;



//Controls
var Automated GuiLabel        IPLabel;
var Automated BBEditBox       IPValue;

var sound clickSound;

//var Automated GuiButton  CreateMatchButton;
var string PageCaption;


/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);

   SetPageCaption(PageCaption);
   AddBackButton();
   AddNextButton();
}

/*****************************************************************
 * Next Button
 *****************************************************************
 */

function Click_Next ()
{
    Controller.OpenMenu("DOTZMenu.DOTZCharacterSelect", IPValue.GetText()
            //$ "?XGAMERTAG=" $ EncodeStringURL(class'UtilsXbox'.static.Get_Current_Name())
            //$ "?XUID=" $ class'UtilsXbox'.static.Get_Current_ID()
            //$ "?XNADDR=" $ class'UtilsXbox'.static.Get_Current_Address()
        );

}

//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZMultiPlayer.IPLabel_lbl'
    begin object name=IPLabel_lbl class=Class'GUI.GUILabel'
        Caption="Connect to host IP:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    IPLabel=IPLabel_lbl
    // Reference: BBEditBox'DOTZMultiPlayer.IPValue_lbl'
    begin object name=IPValue_lbl class=Class'BBGui.BBEditBox'
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4100000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    IPValue=IPValue_lbl
    ClickSound=Sound'DOTZXInterface.Select'
    PageCaption="Multiplayer Join"
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    RenderWeight=0.1000000
    OnKeyEvent=DOTZMultiPlayer.HandleKeyEvent
}