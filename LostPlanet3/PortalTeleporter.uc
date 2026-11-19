class PortalTeleporter extends SceneCapturePortalActor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3D7F0000-0x00000000*/ private @NULL SisterPortal[65537];
var(*) /*0x3D7F0000-0x00000000*/ private int TextureResolutionX[65537];
var(*) /*0x3D7F0000-0x00000000*/ private int TextureResolutionY[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyMarker;
var(*) /*0x3D7F0000-0x00000000*/ private bool bMovablePortal[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysTeleportNonPawns;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanTeleportVehicles;

// Export UPortalTeleporter::execTransformActor(FFrame&, void* const)
native final function TransformActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPortalTeleporter::execTransformVectorDir(FFrame&, void* const)
native final function TransformVectorDir()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], ReturnValue;


}

// Export UPortalTeleporter::execTransformHitLocation(FFrame&, void* const)
native final function TransformHitLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609], ReturnValue;


}

// Export UPortalTeleporter::execCreatePortalTexture(FFrame&, void* const)
native final function CreatePortalTexture()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function StopsProjectile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return !TransformActor(P);
    //return ReturnValue;    
}

defaultproperties
{
    TextureResolutionX=256
    TextureResolutionY=256
    bAlwaysTeleportNonPawns=true
    // Reference: StaticMeshComponent'Default__PortalTeleporter.StaticMeshComponent2'
    begin object name=StaticMeshComponent2
    end object
    StaticMesh=StaticMeshComponent2
    // Reference: SceneCapturePortalComponent'Default__PortalTeleporter.SceneCapturePortalComponent0'
    begin object name=SceneCapturePortalComponent0
    end object
    SceneCapture=SceneCapturePortalComponent0
    Components[0]=SceneCapturePortalComponent0
    Components[1]=none
    Components[2]=StaticMeshComponent2
    bWorldGeometry=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    CollisionComponent=StaticMeshComponent2
}