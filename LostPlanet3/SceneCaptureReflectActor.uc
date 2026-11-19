class SceneCaptureReflectActor extends SceneCaptureActor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x43060000-0x00000400*/ private export @NULL StaticMesh[720897];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReflectMaterialInst[536870913];

defaultproperties
{
    // Reference: StaticMeshComponent'Default__SceneCaptureReflectActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0 class=Class'StaticMeshComponent'
    end object
    StaticMesh=StaticMeshComponent0
    // Reference: SceneCaptureReflectComponent'Default__SceneCaptureReflectActor.SceneCaptureReflectComponent0'
    begin object name=SceneCaptureReflectComponent0 class=Class'SceneCaptureReflectComponent'
    end object
    SceneCapture=SceneCaptureReflectComponent0
    Components[0]=none
    Components[1]=SceneCaptureReflectComponent0
    Components[2]=StaticMeshComponent0
    Rotation=(Pitch=16384,Yaw=0,Roll=0)
}