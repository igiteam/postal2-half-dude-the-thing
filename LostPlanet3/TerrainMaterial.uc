class TerrainMaterial extends Object
    hidecategories(Object);

enum ETerrainMappingType
{
    TMT_Auto,                       // 0
    TMT_XY,                         // 1
    TMT_XZ,                         // 2
    TMT_YZ,                         // 3
    TMT_MAX                         // 4
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL LocalToMapping;
var(*) /*0x30850000-0x00000000*/ private byte MappingType[65537];
var(*) /*0x30850000-0x00000000*/ private float MappingScale[65537];
var(*) /*0x30850000-0x00000000*/ private float MappingRotation[65537];
var(*) /*0x30850000-0x00000000*/ private float MappingPanU[65537];
var(*) /*0x30850000-0x00000000*/ private float MappingPanV[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL Material[65537];
var(*) /*0x1CE40000-0x00000000*/ private @NULL DisplacementMap[65537];
var(*) /*0x1CE40000-0x00000000*/ private float DisplacementScale[65537];

defaultproperties
{
    MappingScale=4.0000000
    DisplacementScale=0.2500000
}