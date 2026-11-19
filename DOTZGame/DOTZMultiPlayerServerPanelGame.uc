/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.19 $
 * @date    Oct 2003
 */
class DOTZMultiPlayerServerPanelGame extends DOTZMultiPlayerPanel;



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
    // Reference: GUILabel'DOTZMultiPlayerServerPanelGame.TimeLimitTitleLabel_lbl'
    begin object name=TimeLimitTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Time Limit:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.1000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[0]=TimeLimitTitleLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelGame.TimeLimitValue_lbl'
    begin object name=TimeLimitValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        bAcceptsInput=true
        WinTop=0.1100000
        WinLeft=0.4500000
        WinWidth=0.4000000
    end object
    Controls[1]=TimeLimitValue_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelGame.ScoreLimitTitleLabel_lbl'
    begin object name=ScoreLimitTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Score Limit:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.2400000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[2]=ScoreLimitTitleLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelGame.ScoreLimitValue_lbl'
    begin object name=ScoreLimitValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        bAcceptsInput=true
        WinTop=0.2500000
        WinLeft=0.4500000
        WinWidth=0.4000000
    end object
    Controls[3]=ScoreLimitValue_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelGame.MaxPlayersTitleLabel_lbl'
    begin object name=MaxPlayersTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Max Players:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.3800000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[4]=MaxPlayersTitleLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelGame.MaxPlayersValue_lbl'
    begin object name=MaxPlayersValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        bAcceptsInput=true
        WinTop=0.3900000
        WinLeft=0.4500000
        WinWidth=0.4000000
    end object
    Controls[5]=MaxPlayersValue_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelGame.EnemyStrengthLabel_lbl'
    begin object name=EnemyStrengthLabel_lbl class=Class'GUI.GUILabel'
        Caption="Enemy Resilience:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        WinTop=0.5200000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[6]=EnemyStrengthLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelGame.EnemyStrengthValue_lbl'
    begin object name=EnemyStrengthValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        bAcceptsInput=true
        WinTop=0.5300000
        WinLeft=0.4500000
        WinWidth=0.4000000
    end object
    Controls[7]=EnemyStrengthValue_lbl
    // Reference: GUILabel'DOTZMultiPlayerServerPanelGame.FriendlyFireTitleLabel_lbl'
    begin object name=FriendlyFireTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Friendly Fire:"
        TextFont="PlainGuiFont"
        bBoundToParent=true
        bVisible=false
        WinTop=0.6600000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[8]=FriendlyFireTitleLabel_lbl
    // Reference: BBComboBox'DOTZMultiPlayerServerPanelGame.FriendlyFireValue_lbl'
    begin object name=FriendlyFireValue_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBRoundButton"
        bBoundToParent=true
        bAcceptsInput=true
        WinTop=0.6700000
        WinLeft=0.4500000
        WinWidth=0.4000000
    end object
    Controls[9]=FriendlyFireValue_lbl
    WinTop=55.9805000
    WinHeight=0.8078130
}