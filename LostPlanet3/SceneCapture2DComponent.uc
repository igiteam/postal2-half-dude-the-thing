class SceneCapture2DComponent extends SceneCaptureComponent
    hidecategories(Object);

var(*) /*0x11200000-0x00000000*/ private @NULL TextureTarget[196609];
var(*) /*0x11200000-0x00000000*/ private float FieldOfView[196609];
var(*) /*0x11200000-0x00000000*/ private float NearPlane[196609];
var(*) /*0x11200000-0x00000000*/ private float FarPlane[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateMatrices;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewMatrix[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ProjMatrix[537001985];

// Export USceneCapture2DComponent::execSetCaptureParameters(FFrame&, void* const)
native final function SetCaptureParameters()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTextureTarget[9437185];
    local /*0x35EA0000-0x00000000*/ private float NewFOV[9437185], NewNearPlane, NewFarPlane;

    TextureTarget
    FieldOfView
    NearPlane
    FarPlane                        
}

// Export USceneCapture2DComponent::execSetView(FFrame&, void* const)
native final function SetView()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[8388609], NewRotation;


}
