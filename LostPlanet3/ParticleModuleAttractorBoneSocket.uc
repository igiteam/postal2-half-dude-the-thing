class ParticleModuleAttractorBoneSocket extends ParticleModuleAttractorBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EBoneSocketAttractorFalloffType
{
    BSFOFF_Constant,                // 0
    BSFOFF_Linear,                  // 1
    BSFOFF_Exponent,                // 2
    BSFOFF_MAX                      // 3
};

enum ELocationBoneSocketDestination
{
    BONESOCKETDEST_Bones,           // 0
    BONESOCKETDEST_Sockets,         // 1
    BONESOCKETDEST_MAX              // 2
};

enum ELocationBoneSocketDestSelectionMethod
{
    BONESOCKETDESTSEL_Sequential,   // 0
    BONESOCKETDESTSEL_Random,       // 1
    BONESOCKETDESTSEL_RandomExhaustive,// 2
    BONESOCKETDESTSEL_BlendAll,     // 3
    BONESOCKETDESTSEL_MAX           // 4
};

struct native AttractLocationBoneSocketInfo
{
    var(*) /*0x03BF0000-0x00000000*/ private name BoneSocketName[65537];
    var(*) /*0x03BF0000-0x00000000*/ private @NULL Offset[65537];

    structdefaultproperties
    {
        BoneSocketName="None"
        Offset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x3A620000-0x00000000*/ private byte FalloffType[65537];
var(*) /*0x0B490000-0x00000000*/ private byte DestinationType[65537];
var(*) /*0x0B490000-0x00000000*/ private byte SelectionMethod[65537];
var(*) /*0x3A620000-0x00000000*/ private bool bParticleLifeRelative[65537];
var(*) /*0x0B490000-0x00000000*/ private bool bAttractAlongLengthOfBone[65537];
var(*) /*0x3A620000-0x00000000*/ private editfixedsize editconst export @NULL FalloffExponent[65537];
var(*) /*0x3A620000-0x00000000*/ private editfixedsize editconst export @NULL Range[65537];
var(*) /*0x3A620000-0x00000000*/ private editfixedsize editconst export @NULL Strength[65537];
var(*) /*0x3A620000-0x00000000*/ private editfixedsize editconst export @NULL CollisionRadius[65537];
var(*) /*0x3A620000-0x00000000*/ private editfixedsize editconst export @NULL DragCoefficient[65537];
var(*) /*0x3A620000-0x00000000*/ private editfixedsize editconst export @NULL DragRadius[65537];
var(*) /*0x0B490000-0x00000000*/ private @NULL UniversalOffset[65537];
var(*) /*0x0B490000-0x00000000*/ private editfixedsize array SourceLocations[65537];
var(*) /*0x0B490000-0x00000000*/ private name SkelMeshActorParamName[65537];
var(*) /*0x0B490000-0x00000000*/ private @NULL EditorSkelMesh[65537];

defaultproperties
{
    DestinationType=ELocationBoneSocketDestination.BONESOCKETDEST_Sockets
    FalloffExponent=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorBoneSocket.DistributionFalloffExponent'
    begin object name=DistributionFalloffExponent class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionFalloffExponent,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorBoneSocket.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorBoneSocket.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DragCoefficient=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorBoneSocket.DistributionDragCoefficient'
    begin object name=DistributionDragCoefficient class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDragCoefficient,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DragRadius=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorBoneSocket.DistributionDragRadius'
    begin object name=DistributionDragRadius class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDragRadius,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SkelMeshActorParamName="BoneSocketActor"
    bSpawnModule=true
    bUpdateModule=true
    bFinalUpdateModule=true
    bSupported3DDrawMode=true
}