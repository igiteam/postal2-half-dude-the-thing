class MaterialExpressionTransform extends MaterialExpression
    collapsecategories
    hidecategories(Object,Object);

enum EMaterialVectorCoordTransformSource
{
    TRANSFORMSOURCE_World,          // 0
    TRANSFORMSOURCE_Local,          // 1
    TRANSFORMSOURCE_Tangent,        // 2
    TRANSFORMSOURCE_View,           // 3
    TRANSFORMSOURCE_MAX             // 4
};

enum EMaterialVectorCoordTransform
{
    TRANSFORM_World,                // 0
    TRANSFORM_View,                 // 1
    TRANSFORM_Local,                // 2
    TRANSFORM_Tangent,              // 3
    TRANSFORM_MAX                   // 4
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Input;
var(*) /*0x30FD0000-0x00000000*/ private byte TransformSourceType[196609];
var(*) /*0x30FD0000-0x00000000*/ private byte TransformType[196609];

defaultproperties
{
    TransformSourceType=EMaterialVectorCoordTransformSource.TRANSFORMSOURCE_Tangent
    MenuCategories=/* Array type was not detected. */
}