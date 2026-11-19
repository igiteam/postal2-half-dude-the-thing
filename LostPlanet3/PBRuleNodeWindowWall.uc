class PBRuleNodeWindowWall extends PBRuleNodeBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x3B830000-0x00000000*/ private float CellMaxSizeX[65537];
var(*) /*0x3B830000-0x00000000*/ private float CellMaxSizeZ[65537];
var(*) /*0x3B830000-0x00000000*/ private float WindowSizeX[65537];
var(*) /*0x3B830000-0x00000000*/ private float WindowSizeZ[65537];
var(*) /*0x3B830000-0x00000000*/ private float WindowPosX[65537];
var(*) /*0x3B830000-0x00000000*/ private float WindowPosZ[65537];
var(*) /*0x3B830000-0x00000000*/ private bool bScaleWindowWithCell[65537];
var(*) /*0x3B830000-0x00000000*/ private float YOffset[65537];
var(*) /*0x3B830000-0x00000000*/ private @NULL Material[65537];

defaultproperties
{
    CellMaxSizeX=512.0000000
    CellMaxSizeZ=512.0000000
    WindowSizeX=128.0000000
    WindowSizeZ=232.0000000
    WindowPosX=0.5000000
    WindowPosZ=0.5000000
}