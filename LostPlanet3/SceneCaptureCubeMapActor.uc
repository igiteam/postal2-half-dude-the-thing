class SceneCaptureCubeMapActor extends SceneCaptureActor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL StaticMesh[655361];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CubeMaterialInst[536870913];

defaultproperties
{
    // Reference: StaticMeshComponent'Default__SceneCaptureCubeMapActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0 class=Class'StaticMeshComponent'
    end object
    StaticMesh=StaticMeshComponent0
    // Reference: SceneCaptureCubeMapComponent'Default__SceneCaptureCubeMapActor.SceneCaptureCubeMapComponent0'
    begin object name=SceneCaptureCubeMapComponent0 class=Class'SceneCaptureCubeMapComponent'
    end object
    SceneCapture=SceneCaptureCubeMapComponent0
    Components[0]=SceneCaptureCubeMapComponent0
    Components[1]=StaticMeshComponent0
}