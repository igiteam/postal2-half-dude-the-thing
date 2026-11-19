//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZMultiPlayerPanel extends GUITabPanel;

var int Temp;

var sound ClickSound;

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


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
}