class ParticleModuleTypeDataRibbon extends ParticleModuleTypeDataBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ETrailsRenderAxisOption
{
    Trails_CameraUp,                // 0
    Trails_SourceUp,                // 1
    Trails_WorldUp,                 // 2
    Trails_MAX                      // 3
};

var(*) /*0x35EA0000-0x00000000*/ private int MaxTessellationBetweenParticles;
var(*) /*0x4D6C0000-0x00000000*/ private int SheetsPerTrail[65537];
var(*) /*0x4D6C0000-0x00000000*/ private int MaxTrailCount[65537];
var(*) /*0x4D6C0000-0x00000000*/ private int MaxParticleInTrailCount[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bDeadTrailsOnDeactivate[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bDeadTrailsOnSourceLoss[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bClipSourceSegement[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bEnablePreviousTangentRecalculation[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bTangentRecalculationEveryFrame[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bSpawnInitialParticle[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderGeometry[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderSpawnPoints[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderTangents[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderTessellation[65537];
var(*) /*0x41420000-0x00000000*/ private bool bEnableTangentDiffInterpScale[65537];
var(*) /*0x4D6C0000-0x00000000*/ private byte RenderAxis[65537];
var(*) /*0x48AF0000-0x00000000*/ private float TangentSpawningScalar[65537];
var(*) /*0x41420000-0x00000000*/ private float TilingDistance[65537];
var(*) /*0x41420000-0x00000000*/ private float DistanceTessellationStepSize[65537];
var(*) /*0x41420000-0x00000000*/ private float TangentTessellationScalar[65537];

defaultproperties
{
    MaxTessellationBetweenParticles=25
    SheetsPerTrail=1
    MaxTrailCount=1
    MaxParticleInTrailCount=500
    bDeadTrailsOnDeactivate=true
    bDeadTrailsOnSourceLoss=true
    bClipSourceSegement=true
    bEnablePreviousTangentRecalculation=true
    bRenderGeometry=true
    DistanceTessellationStepSize=15.0000000
    TangentTessellationScalar=5.0000000
}