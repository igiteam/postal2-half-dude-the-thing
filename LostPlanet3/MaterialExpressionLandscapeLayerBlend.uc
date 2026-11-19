class MaterialExpressionLandscapeLayerBlend extends MaterialExpression
    collapsecategories
    hidecategories(Object,Object);

enum ELandscapeLayerBlendType
{
    LB_AlphaBlend,                  // 0
    LB_HeightBlend,                 // 1
    LB_MAX                          // 2
};

struct native LayerBlendInput
{
    var(*) /*0x2E1C0000-0x00000000*/ private name LayerName[65537];
    var(*) /*0x2E1C0000-0x00000000*/ private byte BlendType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize @NULL LayerInput;
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize @NULL HeightInput;
    var(*) /*0x2E1C0000-0x00000000*/ private float PreviewWeight[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InstanceOverride[805437441];

    structdefaultproperties
    {
        LayerName="None"
        BlendType=ELandscapeLayerBlendType.LB_AlphaBlend
        LayerInput=(Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
        HeightInput=(Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
        PreviewWeight=0.0000000
    }
};

var(*) /*0x30BB0000-0x00000000*/ private editfixedsize array Layers[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionGUID[131073];

defaultproperties
{
    bIsParameterExpression=true
    bUsedByStaticParameterSet=true
    MenuCategories=/* Array type was not detected. */
}