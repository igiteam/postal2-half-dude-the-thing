/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.19 $
 * @date    Oct 2003
 */
class DOTZMultiPlayerServerPanelServer extends DOTZMultiPlayerPanel;



var sound ClickSound;


/****************************************************************
 * InitComponent
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner) {
    super.InitComponent(MyController, MyOwner);
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    // Reference: GUILabel'DOTZMultiPlayerServerPanelServer.ServerNameTitleLabel_lbl'
    begin object name=ServerNameTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Server Name:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.1000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[0]=ServerNameTitleLabel_lbl
    // Reference: BBEditBox'DOTZMultiPlayerServerPanelServer.ServerName_lbl'
    begin object name=ServerName_lbl class=Class'BBGui.BBEditBox'
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1100000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    Controls[1]=ServerName_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelServer.NetworkLabel_lbl'
    begin object name=NetworkLabel_lbl class=Class'GUI.GUILabel'
        Caption="Advertise to:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.2400000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[2]=NetworkLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelServer.NetworkValue_lbl'
    begin object name=NetworkValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        bAcceptsInput=true
        WinTop=0.2500000
        WinLeft=0.4500000
        WinWidth=0.4000000
    end object
    Controls[3]=NetworkValue_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelServer.ReqPasswordLabel_lbl'
    begin object name=ReqPasswordLabel_lbl class=Class'GUI.GUILabel'
        Caption="Requires Password:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.3800000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[4]=ReqPasswordLabel_lbl
    // Reference: BBCheckBoxButton'DOTZMultiPlayerServerPanelServer.ReqPassword_box1'
    begin object name=ReqPassword_box1 class=Class'BBGui.BBCheckBoxButton'
        bNeverFocus=true
        WinTop=0.4000000
        WinLeft=0.4500000
        WinWidth=0.0350000
    end object
    Controls[5]=ReqPassword_box1
    // Reference: GUILabel'DOTZMultiPlayerServerPanelServer.ServerPasswordLabel_lbl'
    begin object name=ServerPasswordLabel_lbl class=Class'GUI.GUILabel'
        Caption="Server Password:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.5200000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[6]=ServerPasswordLabel_lbl
    // Reference: BBEditBox'DOTZMultiPlayerServerPanelServer.ServerPassword_lbl'
    begin object name=ServerPassword_lbl class=Class'BBGui.BBEditBox'
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5300000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    Controls[7]=ServerPassword_lbl
    WinTop=55.9805000
    WinHeight=0.8078130
}