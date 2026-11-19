class MaterialInstanceConstant extends MaterialInstance
    collapsecategories
    hidecategories(Object);

struct native FontParameterValue
{
    var(*) /*0x23FB0000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x23FB0000-0x00000000*/ private @NULL FontValue[65537];
    var(*) /*0x23FB0000-0x00000000*/ private int FontPage[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionGUID;

    structdefaultproperties
    {
        ParameterName="None"
        FontValue=none
        FontPage=0
        ExpressionGUID=(A=0,B=0,C=0,D=0)
    }
};

struct native ScalarParameterValue
{
    var(*) /*0x42D30000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x42D30000-0x00000000*/ private float ParameterValue[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionGUID;

    structdefaultproperties
    {
        ParameterName="None"
        ParameterValue=0.0000000
        ExpressionGUID=(A=0,B=0,C=0,D=0)
    }
};

struct native TextureParameterValue
{
    var(*) /*0x4C4B0000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x4C4B0000-0x00000000*/ private @NULL ParameterValue[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionGUID;

    structdefaultproperties
    {
        ParameterName="None"
        ParameterValue=none
        ExpressionGUID=(A=0,B=0,C=0,D=0)
    }
};

struct native VectorParameterValue
{
    var(*) /*0x4F580000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x4F580000-0x00000000*/ private @NULL ParameterValue[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionGUID;

    structdefaultproperties
    {
        ParameterName="None"
        ParameterValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        ExpressionGUID=(A=0,B=0,C=0,D=0)
    }
};

var(*) /*0x310D0000-0x00000000*/ private editfixedsize array FontParameterValues[196609];
var(*) /*0x310D0000-0x00000000*/ private editfixedsize array ScalarParameterValues[196609];
var(*) /*0x310D0000-0x00000000*/ private editfixedsize array TextureParameterValues[196609];
var(*) /*0x310D0000-0x00000000*/ private editfixedsize array VectorParameterValues[196609];

// Export UMaterialInstanceConstant::execSetParent(FFrame&, void* const)
native function SetParent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewParent[8388609];


}

// Export UMaterialInstanceConstant::execSetScalarParameterValue(FFrame&, void* const)
native function SetScalarParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UMaterialInstanceConstant::execSetTextureParameterValue(FFrame&, void* const)
native function SetTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[8388609];


}

// Export UMaterialInstanceConstant::execSetVectorParameterValue(FFrame&, void* const)
native function SetVectorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[25296897];


}

// Export UMaterialInstanceConstant::execSetFontParameterValue(FFrame&, void* const)
native function SetFontParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FontValue[8388609];
    local /*0x35EA0000-0x00000000*/ private int FontPage[8388609];


}

// Export UMaterialInstanceConstant::execGetMobileScalarParameterValue(FFrame&, void* const)
native function GetMobileScalarParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInstanceConstant::execGetMobileTextureParameterValue(FFrame&, void* const)
native function GetMobileTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInstanceConstant::execGetMobileVectorParameterValue(FFrame&, void* const)
native function GetMobileVectorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInstanceConstant::execClearParameterValues(FFrame&, void* const)
native function ClearParameterValues();
