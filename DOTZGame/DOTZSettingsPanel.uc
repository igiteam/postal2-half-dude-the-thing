//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZSettingsPanel extends GUITabPanel;

/*****************************************************************
 * ShowPanel
 *****************************************************************
 */
function ShowPanel(bool bShow){
    local int c;

    Super.ShowPanel(bShow);

    for (c = 0; c < Controls.Length; ++c)
        Controls[c].SetVisibility(bShow);
}

