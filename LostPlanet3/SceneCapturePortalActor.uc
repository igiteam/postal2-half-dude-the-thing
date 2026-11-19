class SceneCapturePortalActor extends SceneCaptureReflectActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__SceneCapturePortalActor.StaticMeshComponent2'
    begin object name=StaticMeshComponent2 class=Class'StaticMeshComponent'
    end object
    StaticMesh=StaticMeshComponent2
    // Reference: SceneCapturePortalComponent'Default__SceneCapturePortalActor.SceneCapturePortalComponent0'
    begin object name=SceneCapturePortalComponent0 class=Class'SceneCapturePortalComponent'
    end object
    SceneCapture=SceneCapturePortalComponent0
    Components[0]=SceneCapturePortalComponent0
    Components[1]=none
    Components[2]=StaticMeshComponent2
    Rotation=(Pitch=0,Yaw=0,Roll=0)
}