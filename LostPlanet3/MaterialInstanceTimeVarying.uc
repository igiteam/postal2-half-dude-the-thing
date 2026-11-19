class MaterialInstanceTimeVarying extends MaterialInstance;

struct native ParameterValueOverTime
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionGUID;
    var(*) /*0x35EA0000-0x00000000*/ private float StartTime;
    var(*) /*0x3A110000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x3A110000-0x00000000*/ private bool bLoop[65537];
    var(*) /*0x3A110000-0x00000000*/ private bool bAutoActivate[65537];
    var(*) /*0x3A110000-0x00000000*/ private float CycleTime[65537];
    var(*) /*0x3A110000-0x00000000*/ private bool bNormalizeTime[65537];
    var(*) /*0x3A110000-0x00000000*/ private float OffsetTime[65537];
    var(*) /*0x3A110000-0x00000000*/ private bool bOffsetFromEnd[65537];

    structdefaultproperties
    {
        ExpressionGUID=(A=0,B=0,C=0,D=0)
        StartTime=-1.0000000
        ParameterName="None"
        bLoop=false
        bAutoActivate=false
        CycleTime=1.0000000
        bNormalizeTime=false
        OffsetTime=0.0000000
        bOffsetFromEnd=false
    }
};

struct native FontParameterValueOverTime extends ParameterValueOverTime
{
    var(*) /*0x23FC0000-0x00000000*/ private @NULL FontValue[65537];
    var(*) /*0x23FC0000-0x00000000*/ private int FontPage[65537];

    structdefaultproperties
    {
        StartTime=0.0000000
        CycleTime=0.0000000
    }
};

struct native ScalarParameterValueOverTime extends ParameterValueOverTime
{
    var(*) /*0x42D40000-0x00000000*/ private float ParameterValue[65537];
    var(*) /*0x42D40000-0x00000000*/ private editfixedsize @NULL ParameterValueCurve[65537];

    structdefaultproperties
    {
        StartTime=0.0000000
        CycleTime=0.0000000
    }
};

struct native TextureParameterValueOverTime extends ParameterValueOverTime
{
    var(*) /*0x4C4C0000-0x00000000*/ private @NULL ParameterValue[65537];

    structdefaultproperties
    {
        StartTime=0.0000000
        CycleTime=0.0000000
    }
};

struct native VectorParameterValueOverTime extends ParameterValueOverTime
{
    var(*) /*0x4F590000-0x00000000*/ private @NULL ParameterValue[65537];
    var(*) /*0x4F590000-0x00000000*/ private editfixedsize @NULL ParameterValueCurve[65537];

    structdefaultproperties
    {
        ParameterValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        StartTime=0.0000000
        CycleTime=0.0000000
    }
};

struct native LinearColorParameterValueOverTime extends ParameterValueOverTime
{
    var(*) /*0x2EF40000-0x00000000*/ private @NULL ParameterValue[65537];
    var(*) /*0x2EF40000-0x00000000*/ private editfixedsize @NULL ParameterValueCurve[65537];

    structdefaultproperties
    {
        ParameterValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        StartTime=0.0000000
        CycleTime=0.0000000
    }
};

var(*) /*0x310F0000-0x00000000*/ private bool bAutoActivateAll[65537];
var(*) /*0x35EA0000-0x00000000*/ private float Duration[536870913];
var(*) /*0x310F0000-0x00000000*/ private editfixedsize array FontParameterValues[65537];
var(*) /*0x310F0000-0x00000000*/ private editfixedsize array ScalarParameterValues[65537];
var(*) /*0x310F0000-0x00000000*/ private editfixedsize array TextureParameterValues[65537];
var(*) /*0x310F0000-0x00000000*/ private editfixedsize array VectorParameterValues[65537];
var(*) /*0x310F0000-0x00000000*/ private editfixedsize array LinearColorParameterValues[65537];

// Export UMaterialInstanceTimeVarying::execSetParent(FFrame&, void* const)
native function SetParent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewParent[8388609];


}

// Export UMaterialInstanceTimeVarying::execSetScalarParameterValue(FFrame&, void* const)
native function SetScalarParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UMaterialInstanceTimeVarying::execSetScalarCurveParameterValue(FFrame&, void* const)
native function SetScalarCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Value[25296897];


}

// Export UMaterialInstanceTimeVarying::execSetScalarStartTime(FFrame&, void* const)
native function SetScalarStartTime()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UMaterialInstanceTimeVarying::execSetDuration(FFrame&, void* const)
native function SetDuration()
{
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UMaterialInstanceTimeVarying::execSetTextureParameterValue(FFrame&, void* const)
native function SetTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[8388609];


}

// Export UMaterialInstanceTimeVarying::execSetVectorParameterValue(FFrame&, void* const)
native function SetVectorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[25296897];


}

// Export UMaterialInstanceTimeVarying::execSetVectorCurveParameterValue(FFrame&, void* const)
native function SetVectorCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Value[25296897];


}

// Export UMaterialInstanceTimeVarying::execSetLinearColorParameterValue(FFrame&, void* const)
native function SetLinearColorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[25296897];


}

// Export UMaterialInstanceTimeVarying::execSetLinearColorCurveParameterValue(FFrame&, void* const)
native function SetLinearColorCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Value[25296897];


}

// Export UMaterialInstanceTimeVarying::execSetVectorStartTime(FFrame&, void* const)
native function SetVectorStartTime()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UMaterialInstanceTimeVarying::execSetFontParameterValue(FFrame&, void* const)
native function SetFontParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FontValue[8388609];
    local /*0x35EA0000-0x00000000*/ private int FontPage[8388609];


}

// Export UMaterialInstanceTimeVarying::execClearParameterValues(FFrame&, void* const)
native function ClearParameterValues();

// Export UMaterialInstanceTimeVarying::execGetMaxDurationFromAllParameters(FFrame&, void* const)
native function GetMaxDurationFromAllParameters()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UMaterialInstanceTimeVarying::execCheckForVectorParameterConflicts(FFrame&, void* const)
native function CheckForVectorParameterConflicts()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
