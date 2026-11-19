class MaterialExpressionTransformPosition extends MaterialExpression
    collapsecategories
    hidecategories(Object,Object);

enum EMaterialPositionTransformSource
{
    TRANSFORMPOSSOURCE_Local,       // 0
    TRANSFORMPOSSOURCE_PostProjection,// 1
    TRANSFORMPOSSOURCE_MAX          // 2
};

enum EMaterialPositionTransform
{
    TRANSFORMPOS_World,             // 0
    TRANSFORMPOS_MAX                // 1
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Input;
var(*) /*0x30FE0000-0x00000000*/ private byte TransformSourceType[196609];
var(*) /*0x30FE0000-0x00000000*/ private byte TransformType[196609];

defaultproperties
{
    TransformSourceType=EMaterialPositionTransformSource.TRANSFORMPOSSOURCE_PostProjection
    MenuCategories=/* Array type was not detected. */
}