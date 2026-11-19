/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.19 $
 * @date    Oct 2003
 */
class DOTZMultiPlayerServerPanelMaps extends DOTZMultiPlayerPanel;



var sound ClickSound;


/****************************************************************
 * InitComponent
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner) {
    super.InitComponent(MyController, MyOwner);
}

//===========================================================================
// defaultproperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    // Reference: GUILabel'DOTZMultiPlayerServerPanelMaps.GametypeTitleLabel_lbl'
    begin object name=GametypeTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Game Type:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.1000000
        WinLeft=0.2000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[0]=GametypeTitleLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelMaps.GametypeValue_lbl'
    begin object name=GametypeValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        WinTop=0.1100000
        WinLeft=0.3500000
        WinWidth=0.4000000
    end object
    Controls[1]=GametypeValue_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelMaps.List2_lbl'
    begin object name=List2_lbl class=Class'GUI.GUILabel'
        Caption="Available Maps:"
        TextFont="PlainGuiFont"
        WinTop=0.2700000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0600000
    end object
    Controls[2]=List2_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelMaps.List1_lbl'
    begin object name=List1_lbl class=Class'GUI.GUILabel'
        Caption="Chosen Maps:"
        TextFont="PlainGuiFont"
        WinTop=0.2700000
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0600000
    end object
    Controls[3]=List1_lbl
    // Reference: BBListBox'DOTZMultiPlayerServerPanelMaps.AllMaps'
    begin object name=AllMaps class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        StyleName="BBRoundButton"
        bNeverFocus=true
        WinTop=0.3400000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.4500000
    end object
    Controls[4]=AllMaps
    // Reference: BBListBox'DOTZMultiPlayerServerPanelMaps.SelectedMaps'
    begin object name=SelectedMaps class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        StyleName="BBRoundButton"
        bNeverFocus=true
        WinTop=0.3400000
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.4500000
    end object
    Controls[5]=SelectedMaps
    Controls[6]=none
    // Reference: GUIButton'DOTZMultiPlayerServerPanelMaps.Map_Up'
    begin object name=Map_Up class=Class'GUI.GUIButton'
        Caption="Up"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3500000
        WinLeft=0.4250000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[7]=Map_Up
    // Reference: GUIButton'DOTZMultiPlayerServerPanelMaps.Map_Add'
    begin object name=Map_Add class=Class'GUI.GUIButton'
        Caption="Add"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.4250000
        WinLeft=0.4250000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[8]=Map_Add
    // Reference: GUIButton'DOTZMultiPlayerServerPanelMaps.Map_AddAll'
    begin object name=Map_AddAll class=Class'GUI.GUIButton'
        Caption="Add All"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.5000000
        WinLeft=0.4250000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[9]=Map_AddAll
    // Reference: GUIButton'DOTZMultiPlayerServerPanelMaps.Map_Remove'
    begin object name=Map_Remove class=Class'GUI.GUIButton'
        Caption="Remove"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.5750000
        WinLeft=0.4250000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[10]=Map_Remove
    // Reference: GUIButton'DOTZMultiPlayerServerPanelMaps.Map_RemoveAll'
    begin object name=Map_RemoveAll class=Class'GUI.GUIButton'
        Caption="Remove All"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.6500000
        WinLeft=0.4250000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[11]=Map_RemoveAll
    // Reference: GUIButton'DOTZMultiPlayerServerPanelMaps.Map_Down'
    begin object name=Map_Down class=Class'GUI.GUIButton'
        Caption="Down"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.7250000
        WinLeft=0.4250000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[12]=Map_Down
    WinTop=55.9805000
    WinHeight=0.8078130
}