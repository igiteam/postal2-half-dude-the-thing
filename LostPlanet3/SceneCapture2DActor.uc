class SceneCapture2DActor extends SceneCaptureActor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL DrawFrustum[655361];

defaultproperties
{
    // Reference: DrawFrustumComponent'Default__SceneCapture2DActor.DrawFrust0'
    begin object name=DrawFrust0 class=Class'DrawFrustumComponent'
    end object
    DrawFrustum=DrawFrust0
    // Reference: SceneCapture2DComponent'Default__SceneCapture2DActor.SceneCapture2DComponent0'
    begin object name=SceneCapture2DComponent0 class=Class'SceneCapture2DComponent'
    end object
    SceneCapture=SceneCapture2DComponent0
    Components[0]=SceneCapture2DComponent0
    Components[1]=none
    Components[2]=DrawFrust0
}