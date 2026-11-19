class LensFlare extends Object
    hidecategories(Object);

struct native transient LensFlareElementCurvePair
{
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string CurveName;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL CurveObject;

    structdefaultproperties
    {
        CurveName=""
        CurveObject=none
    }
};

struct native LensFlareElement
{
    var(*) /*0x2E560000-0x00000000*/ private name ElementName[65537];
    var(*) /*0x2E560000-0x00000000*/ private float RayDistance[65537];
    var(*) /*0x2E560000-0x00000000*/ private bool bIsEnabled[65537];
    var(*) /*0x2E560000-0x00000000*/ private bool bUseSourceDistance[65537];
    var(*) /*0x2E560000-0x00000000*/ private bool bNormalizeRadialDistance[65537];
    var(*) /*0x2E560000-0x00000000*/ private bool bModulateColorBySource[65537];
    var(*) /*0x2E560000-0x00000000*/ private @NULL Size[65537];
    var(*) /*0x30850000-0x00000000*/ private editfixedsize array LFMaterials[65537];
    var(*) /*0x30850000-0x00000000*/ private editfixedsize export @NULL LFMaterialIndex[65537];
    var(*) /*0x42EA0000-0x00000000*/ private editfixedsize export @NULL Scaling[65537];
    var(*) /*0x42EA0000-0x00000000*/ private editfixedsize export @NULL AxisScaling[65537];
    var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL Rotation[65537];
    var(*) /*0x42510000-0x00000000*/ private bool bOrientTowardsSource[65537];
    var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL Color[65537];
    var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL Alpha[65537];
    var(*) /*0x373B0000-0x00000000*/ private editfixedsize export @NULL Offset[65537];
    var(*) /*0x42EA0000-0x00000000*/ private editfixedsize export @NULL DistMap_Scale[65537];
    var(*) /*0x42EA0000-0x00000000*/ private editfixedsize export @NULL DistMap_Color[65537];
    var(*) /*0x42EA0000-0x00000000*/ private editfixedsize export @NULL DistMap_Alpha[65537];

    structdefaultproperties
    {
        ElementName="None"
        RayDistance=0.0000000
        bIsEnabled=false
        bUseSourceDistance=false
        bNormalizeRadialDistance=false
        bModulateColorBySource=false
        Size=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LFMaterials=none
        LFMaterialIndex=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        Scaling=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        AxisScaling=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        Rotation=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        bOrientTowardsSource=false
        Color=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        Alpha=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        Offset=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        DistMap_Scale=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        DistMap_Color=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
        DistMap_Alpha=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    }
};

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export @NULL SourceElement[524289];
var(*) /*0x487F0000-0x00000000*/ private @NULL SourceMesh[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte SourceDPG[131073];
var(*) /*0x40B60000-0x00000000*/ private byte ReflectionsDPG[196609];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array Reflections[524289];
var(*) /*0x4FFA0000-0x00000000*/ private float OuterCone[65537];
var(*) /*0x4FFA0000-0x00000000*/ private float InnerCone[65537];
var(*) /*0x4FFA0000-0x00000000*/ private float ConeFudgeFactor[65537];
var(*) /*0x4FFA0000-0x00000000*/ private float Radius[65537];
var(*) /*0x4FFA0000-0x00000000*/ private bool bUseTrueConeCalculation[65537];
var(*) /*0x0B9E0000-0x00000000*/ private bool bUseFixedRelativeBoundingBox[65537];
var(*) /*0x16220000-0x00000000*/ private bool bRenderDebugLines[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool ThumbnailImageOutOfDate;
var(*) /*0x4FFA0000-0x00000000*/ private float MinStrength[65537];
var(*) /*0x37140000-0x00000000*/ private editfixedsize export @NULL ScreenPercentageMap[65537];
var(*) /*0x0B9E0000-0x00000000*/ private @NULL FixedRelativeBoundingBox[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurveEdSetup[524289];
var(*) /*0x35EA0000-0x00000000*/ private int ReflectionCount[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailAngle;
var(*) /*0x35EA0000-0x00000000*/ private float ThumbnailDistance;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailImage;

defaultproperties
{
    SourceElement=(ElementName="Source",RayDistance=0.0000000,bIsEnabled=true,bUseSourceDistance=false,bNormalizeRadialDistance=false,bModulateColorBySource=false,Size=(X=75.0000000,Y=75.0000000,Z=75.0000000),LFMaterials=none,LFMaterialIndex=(Distribution=// Reference: DistributionFloatConstant'Default__LensFlare.DistributionLFMaterialIndex'
    begin object name=DistributionLFMaterialIndex class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionLFMaterialIndex,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),Scaling=(Distribution=// Reference: DistributionFloatConstant'Default__LensFlare.DistributionScaling'
    begin object name=DistributionScaling class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionScaling,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),AxisScaling=(Distribution=// Reference: DistributionVectorConstant'Default__LensFlare.DistributionAxisScaling'
    begin object name=DistributionAxisScaling class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionAxisScaling,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),Rotation=(Distribution=// Reference: DistributionFloatConstant'Default__LensFlare.DistributionRotation'
    begin object name=DistributionRotation class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRotation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),bOrientTowardsSource=false,Color=(Distribution=// Reference: DistributionVectorConstant'Default__LensFlare.DistributionColor'
    begin object name=DistributionColor class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionColor,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),Alpha=(Distribution=// Reference: DistributionFloatConstant'Default__LensFlare.DistributionAlpha'
    begin object name=DistributionAlpha class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlpha,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),Offset=(Distribution=// Reference: DistributionVectorConstant'Default__LensFlare.DistributionOffset'
    begin object name=DistributionOffset class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionOffset,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),DistMap_Scale=(Distribution=// Reference: DistributionVectorConstant'Default__LensFlare.DistributionDistMap_Scale'
    begin object name=DistributionDistMap_Scale class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionDistMap_Scale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),DistMap_Color=(Distribution=// Reference: DistributionVectorConstant'Default__LensFlare.DistributionDistMap_Color'
    begin object name=DistributionDistMap_Color class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionDistMap_Color,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0),DistMap_Alpha=(Distribution=// Reference: DistributionFloatConstant'Default__LensFlare.DistributionDistMap_Alpha'
    begin object name=DistributionDistMap_Alpha class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDistMap_Alpha,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0))
    SourceDPG=ESceneDepthPriorityGroup.SDPG_World
    ReflectionsDPG=ESceneDepthPriorityGroup.SDPG_Foreground
    ConeFudgeFactor=0.5000000
    ScreenPercentageMap=(Distribution=// Reference: DistributionFloatConstantCurve'Default__LensFlare.DistributionScreenPercentageMap'
    begin object name=DistributionScreenPercentageMap class=Class'DistributionFloatConstantCurve'
    end object
    Distribution=DistributionScreenPercentageMap,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=1.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}