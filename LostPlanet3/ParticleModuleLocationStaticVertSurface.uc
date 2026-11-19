class ParticleModuleLocationStaticVertSurface extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ELocationStaticVertSurfaceSource
{
    VERTSTATICSURFACESOURCE_Vert,   // 0
    VERTSTATICSURFACESOURCE_Surface,// 1
    VERTSTATICSURFACESOURCE_MAX     // 2
};

var(*) /*0x4FAC0000-0x00000000*/ private byte SourceType[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL UniversalOffset[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bUpdatePositionEachFrame[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bOrientMeshEmitters[65537];
var(*) /*0x4FAC0000-0x00000000*/ private bool bEnforceNormalCheck[65537];
var(*) /*0x4FAC0000-0x00000000*/ private name StaticMeshActorParamName[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL EditorStaticMesh[65537];
var(*) /*0x4FAC0000-0x00000000*/ private @NULL NormalToCompare[65537];
var(*) /*0x4FAC0000-0x00000000*/ private float NormalCheckToleranceDegrees[65537];
var(*) /*0x35EA0000-0x00000000*/ private float NormalCheckTolerance;
var(*) /*0x4FAC0000-0x00000000*/ private editfixedsize array ValidMaterialIndices[65537];

defaultproperties
{
    bOrientMeshEmitters=true
    StaticMeshActorParamName="VertSurfaceActor"
    bSpawnModule=true
    bUpdateModule=true
    bFinalUpdateModule=true
    bSupported3DDrawMode=true
}