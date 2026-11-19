class MaterialExpressionDepthOfFieldFunction extends MaterialExpression
    hidecategories(Object);

enum EDepthOfFieldFunctionValue
{
    TDOF_NearAndFarMask,            // 0
    TDOF_NearMask,                  // 1
    TDOF_FarMask,                   // 2
    TDOF_MAX                        // 3
};

var(*) /*0x30A30000-0x00000000*/ private byte FunctionValue[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Depth;

defaultproperties
{
    MenuCategories=/* Array type was not detected. */
}