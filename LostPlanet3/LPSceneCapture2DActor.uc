class LPSceneCapture2DActor extends SPSceneCapture2DActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DrawFrustumComponent'Default__LPSceneCapture2DActor.DrawFrust0'
    begin object name=DrawFrust0
    end object
    DrawFrustum=DrawFrust0
    // Reference: SceneCapture2DComponent'Default__LPSceneCapture2DActor.SceneCapture2DComponent0'
    begin object name=SceneCapture2DComponent0
    end object
    SceneCapture=SceneCapture2DComponent0
    Components[0]=SceneCapture2DComponent0
    Components[1]=none
    Components[2]=DrawFrust0
}