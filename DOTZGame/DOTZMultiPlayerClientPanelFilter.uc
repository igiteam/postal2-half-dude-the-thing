/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.19 $
 * @date    Oct 2003
 */
class DOTZMultiPlayerClientPanelFilter extends DOTZMultiPlayerClientPanel;



// internal
var private bool bInitialized;
var sound ClickSound;

const FILTER_GAMETYPE = 0;
const FILTER_FULLSERVER = 2;
const FILTER_PASSWORD = 4;

//persistant storage related to the server panel
var config bool bNoPassword;
var config bool bNoFull;

/****************************************************************
 * InitComponent
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner) {

   Super.InitComponent(MyController,MyOwner);

   //gametype box
   BBComboBox(Controls[FILTER_GAMETYPE]).AddItem("Any",,"");
   BBComboBox(Controls[FILTER_GAMETYPE]).AddItem("DeathMatch/Team Deathmatch",,"DOTZDeathMatch");
   BBComboBox(Controls[FILTER_GAMETYPE]).AddItem("Capture the Flag",,"DOTZCaptureTheFl");
   BBComboBox(Controls[FILTER_GAMETYPE]).AddItem("Invasion",,"DOTZInvasion");

   //full server check box
   if (self.default.bNoFull == true){
      moCheckBox(Controls[FILTER_FULLSERVER]).Checked(true);
      moCheckBox(Controls[FILTER_FULLSERVER]).bChecked = true;
   }

   //password filter check box
   if (self.default.bNoPassword == true){
      moCheckBox(Controls[FILTER_PASSWORD]).Checked(true);  //state of the graphic
      moCheckBox(Controls[FILTER_PASSWORD]).bChecked = true; // state of the component
   }

   bInitialized = true;
}


/*****************************************************************
 * OnCloseBrowser
 *****************************************************************
 */
function OnCloseBrowser(){
   super.OnCloseBrowser();
   default.bNoFull     = moCheckBox(Controls[FILTER_FULLSERVER]).IsChecked();
   default.bNoPassword = moCheckBox(Controls[FILTER_PASSWORD]).IsChecked();
   self.static.StaticSaveConfig();
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: BBComboBox'DOTZMultiPlayerClientPanelFilter.matchtype_cbox'
    begin object name=matchtype_cbox class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        WinTop=0.1200000
        WinLeft=0.4400000
        WinWidth=0.4000000
    end object
    Controls[0]=matchtype_cbox
    // Reference: GUILabel'DOTZMultiPlayerClientPanelFilter.GameType_lbl'
    begin object name=GameType_lbl class=Class'GUI.GUILabel'
        Caption="Game Type:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.1000000
        WinLeft=0.2500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[1]=GameType_lbl
    // Reference: moCheckBox'DOTZMultiPlayerClientPanelFilter.FullServers_check'
    begin object name=FullServers_check class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="PlainGuiFont"
        IniOption="@internal"
        StyleName="BBTextButton"
        bNeverFocus=true
        WinTop=0.2800000
        WinLeft=0.6700000
        WinWidth=0.0700000
        WinHeight=0.1000000
    end object
    Controls[2]=FullServers_check
    // Reference: GUILabel'DOTZMultiPlayerClientPanelFilter.FullServer_lbl'
    begin object name=FullServer_lbl class=Class'GUI.GUILabel'
        Caption="No Full Servers:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.2500000
        WinLeft=0.2500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[3]=FullServer_lbl
    // Reference: moCheckBox'DOTZMultiPlayerClientPanelFilter.Password_check'
    begin object name=Password_check class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="PlainGuiFont"
        IniOption="@internal"
        StyleName="BBTextButton"
        bNeverFocus=true
        WinTop=0.4300000
        WinLeft=0.6700000
        WinWidth=0.0700000
        WinHeight=0.1000000
    end object
    Controls[4]=Password_check
    // Reference: GUILabel'DOTZMultiPlayerClientPanelFilter.Password_lbl'
    begin object name=Password_lbl class=Class'GUI.GUILabel'
        Caption="No Password Servers:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.4000000
        WinLeft=0.2500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[5]=Password_lbl
}