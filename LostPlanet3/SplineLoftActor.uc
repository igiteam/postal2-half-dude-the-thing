class SplineLoftActor extends SplineActor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x49360000-0x00000000*/ private editconst float ScaleX[65537];
var(*) /*0x49360000-0x00000000*/ private editconst float ScaleY[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array SplineMeshComps[524289];
var(*) /*0x49360000-0x00000000*/ private @NULL DeformMesh[65537];
var(*) /*0x49360000-0x00000000*/ private editfixedsize array DeformMeshMaterials[65537];
var(*) /*0x49360000-0x00000000*/ private editconst float Roll[65537];
var(*) /*0x49360000-0x00000000*/ private @NULL WorldXDir[65537];
var(*) /*0x49360000-0x00000000*/ private @NULL Offset[65537];
var(*) /*0x49360000-0x00000000*/ private bool bSmoothInterpRollAndScale[65537];
var(*) /*0x49360000-0x00000000*/ private bool bAcceptsLights[65537];
var(*) /*0x49360000-0x00000400*/ private const export @NULL MeshLightEnvironment[720897];
var(*) /*0x49360000-0x00000000*/ private float MeshMaxDrawDistance[65537];

// Export USplineLoftActor::execClearLoftMesh(FFrame&, void* const)
native function ClearLoftMesh();

// Export USplineLoftActor::execUpdateSplineParams(FFrame&, void* const)
native function UpdateSplineParams();

defaultproperties
{
    ScaleX=1.0000000
    ScaleY=1.0000000
    WorldXDir=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    bSmoothInterpRollAndScale=true
    bAcceptsLights=true
    bStatic=true
    bWorldGeometry=true
    bGameRelevant=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
}