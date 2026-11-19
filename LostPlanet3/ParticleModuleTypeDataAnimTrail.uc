class ParticleModuleTypeDataAnimTrail extends ParticleModuleTypeDataBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x028D0000-0x00000000*/ private name ControlEdgeName[65537];
var(*) /*0x4D6C0000-0x00000000*/ private int SheetsPerTrail[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bDeadTrailsOnDeactivate[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bClipSourceSegement[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bEnablePreviousTangentRecalculation[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bTangentRecalculationEveryFrame[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderGeometry[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderSpawnPoints[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderTangents[65537];
var(*) /*0x41420000-0x00000000*/ private bool bRenderTessellation[65537];
var(*) /*0x41420000-0x00000000*/ private float TilingDistance[65537];
var(*) /*0x41420000-0x00000000*/ private float DistanceTessellationStepSize[65537];
var(*) /*0x41420000-0x00000000*/ private float TangentTessellationScalar[65537];

defaultproperties
{
    SheetsPerTrail=1
    bDeadTrailsOnDeactivate=true
    bClipSourceSegement=true
    bEnablePreviousTangentRecalculation=true
    bRenderGeometry=true
    DistanceTessellationStepSize=10.0000000
}