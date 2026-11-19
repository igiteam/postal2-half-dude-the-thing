class ParticleModuleLocationBoneSocket extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ELocationBoneSocketSource
{
    BONESOCKETSOURCE_Bones,         // 0
    BONESOCKETSOURCE_Sockets,       // 1
    BONESOCKETSOURCE_MAX            // 2
};

enum ELocationBoneSocketSelectionMethod
{
    BONESOCKETSEL_Sequential,       // 0
    BONESOCKETSEL_Random,           // 1
    BONESOCKETSEL_RandomExhaustive, // 2
    BONESOCKETSEL_MAX               // 3
};

struct native LocationBoneSocketInfo
{
    var(*) /*0x2F6C0000-0x00000000*/ private name BoneSocketName[65537];
    var(*) /*0x2F6C0000-0x00000000*/ private @NULL Offset[65537];

    structdefaultproperties
    {
        BoneSocketName="None"
        Offset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x0B490000-0x00000000*/ private byte SourceType[65537];
var(*) /*0x0B490000-0x00000000*/ private byte SelectionMethod[65537];
var(*) /*0x0B490000-0x00000000*/ private @NULL UniversalOffset[65537];
var(*) /*0x0B490000-0x00000000*/ private editfixedsize array SourceLocations[65537];
var(*) /*0x0B490000-0x00000000*/ private bool bUpdatePositionEachFrame[65537];
var(*) /*0x0B490000-0x00000000*/ private bool bOrientMeshEmitters[65537];
var(*) /*0x0B490000-0x00000000*/ private bool bInheritVelocityAtSpawn[65537];
var(*) /*0x0B490000-0x00000000*/ private name SkelMeshActorParamName[65537];
var(*) /*0x0B490000-0x00000000*/ private @NULL EditorSkelMesh[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LastUpdateTime;

defaultproperties
{
    SourceType=ELocationBoneSocketSource.BONESOCKETSOURCE_Sockets
    bOrientMeshEmitters=true
    SkelMeshActorParamName="BoneSocketActor"
    bSpawnModule=true
    bUpdateModule=true
    bFinalUpdateModule=true
    bSupported3DDrawMode=true
}