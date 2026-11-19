class ParticleModuleAttractorSkelVertSurface extends ParticleModuleAttractorBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EVertSurfaceAttractorFalloffType
{
    VSFOFF_Constant,                // 0
    VSFOFF_Linear,                  // 1
    VSFOFF_Exponent,                // 2
    VSFOFF_MAX                      // 3
};

enum EAttractorSkelVertSurfaceDestination
{
    VERTSURFACEDEST_Vert,           // 0
    VERTSURFACEDEST_Surface,        // 1
    VERTSURFACEDEST_MAX             // 2
};

var(*) /*0x3A660000-0x00000000*/ private byte FalloffType[65537];
var(*) /*0x4FAC0000-0x00000000*/ private byte DestinationType[65537];
var(*) /*0x3A660000-0x00000000*/ private bool bParticleLifeRelative[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bEnforceNormalCheck[65537];
var(*) /*0x3A660000-0x00000000*/ private editfixedsize editconst export @NULL FalloffExponent[65537];
var(*) /*0x3A660000-0x00000000*/ private editfixedsize editconst export @NULL Range[65537];
var(*) /*0x3A660000-0x00000000*/ private editfixedsize editconst export @NULL Strength[65537];
var(*) /*0x3A660000-0x00000000*/ private editfixedsize editconst export @NULL CollisionRadius[65537];
var(*) /*0x3A660000-0x00000000*/ private editfixedsize editconst export @NULL DragCoefficient[65537];
var(*) /*0x3A660000-0x00000000*/ private editfixedsize editconst export @NULL DragRadius[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL UniversalOffset[65537];
var(*) /*0x4FAC0000-0x00000000*/ private name SkelMeshActorParamName[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL EditorSkelMesh[65537];
var(*) /*0x4FAC0000-0x00000000*/ private editfixedsize array ValidAssociatedBones[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL NormalToCompare[65537];
var(*) /*0x4FAC0000-0x00000000*/ private float NormalCheckToleranceDegrees[65537];
var(*) /*0x35EA0000-0x00000000*/ private float NormalCheckTolerance;
var(*) /*0x4FAC0000-0x00000000*/ private editfixedsize array ValidMaterialIndices[65537];

defaultproperties
{
    FalloffExponent=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorSkelVertSurface.DistributionFalloffExponent'
    begin object name=DistributionFalloffExponent class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionFalloffExponent,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorSkelVertSurface.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorSkelVertSurface.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DragCoefficient=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorSkelVertSurface.DistributionDragCoefficient'
    begin object name=DistributionDragCoefficient class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDragCoefficient,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DragRadius=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorSkelVertSurface.DistributionDragRadius'
    begin object name=DistributionDragRadius class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDragRadius,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SkelMeshActorParamName="VertSurfaceActor"
    bSpawnModule=true
    bUpdateModule=true
    bFinalUpdateModule=true
    bSupported3DDrawMode=true
}