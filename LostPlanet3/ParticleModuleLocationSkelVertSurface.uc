class ParticleModuleLocationSkelVertSurface extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ELocationSkelVertSurfaceSource
{
    VERTSURFACESOURCE_Vert,         // 0
    VERTSURFACESOURCE_Surface,      // 1
    VERTSURFACESOURCE_MAX           // 2
};

var(*) /*0x4FAC0000-0x00000000*/ private byte SourceType[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL UniversalOffset[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bUpdatePositionEachFrame[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bOrientMeshEmitters[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bEnforceNormalCheck[65537];
var(*) /*0x4FAC0000-0x00000000*/ private name SkelMeshActorParamName[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL EditorSkelMesh[65537];
var(*) /*0x4FAC0000-0x00000000*/ private editfixedsize array ValidAssociatedBones[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL NormalToCompare[65537];
var(*) /*0x4FAC0000-0x00000000*/ private float NormalCheckToleranceDegrees[65537];
var(*) /*0x35EA0000-0x00000000*/ private float NormalCheckTolerance;
var(*) /*0x4FAC0000-0x00000000*/ private editfixedsize array ValidMaterialIndices[65537];

defaultproperties
{
    bOrientMeshEmitters=true
    SkelMeshActorParamName="VertSurfaceActor"
    bSpawnModule=true
    bUpdateModule=true
    bFinalUpdateModule=true
    bSupported3DDrawMode=true
}