class MaterialExpressionTerrainLayerCoords extends MaterialExpression
    collapsecategories
    hidecategories(Object,Object);

enum ETerrainCoordMappingType
{
    TCMT_Auto,                      // 0
    TCMT_XY,                        // 1
    TCMT_XZ,                        // 2
    TCMT_YZ,                        // 3
    TCMT_MAX                        // 4
};

var(*) /*0x30EB0000-0x00000000*/ private byte MappingType[65537];
var(*) /*0x30EB0000-0x00000000*/ private float MappingScale[65537];
var(*) /*0x30EB0000-0x00000000*/ private float MappingRotation[65537];
var(*) /*0x30EB0000-0x00000000*/ private float MappingPanU[65537];
var(*) /*0x30EB0000-0x00000000*/ private float MappingPanV[65537];

defaultproperties
{
    MenuCategories=/* Array type was not detected. */
}