class SceneCapture2DHitMaskComponent extends SceneCaptureComponent
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL TextureTarget[537001985];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL SkeletalMeshComp[537526273];
var(*) /*0x35EA0000-0x00000000*/ private int MaterialIndex;
var(*) /*0x35EA0000-0x00000000*/ private int ForceLOD;
var(*) /*0x35EA0000-0x00000000*/ private int HitMaskCullDistance;
var(*) /*0x35EA0000-0x00000000*/ private float FadingStartTimeSinceHit;
var(*) /*0x35EA0000-0x00000000*/ private float FadingPercentage;
var(*) /*0x35EA0000-0x00000000*/ private float FadingDurationTime;
var(*) /*0x35EA0000-0x00000000*/ private float FadingIntervalTime;

// Export USceneCapture2DHitMaskComponent::execSetCaptureTargetTexture(FFrame&, void* const)
native final function SetCaptureTargetTexture()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InTextureTarget[8519681];


}

// Export USceneCapture2DHitMaskComponent::execSetCaptureParameters(FFrame&, void* const)
native final function SetCaptureParameters()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InMaskPosition[8519681];
    local /*0x35EA0000-0x00000000*/ private float InMaskRadius[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL InStartupPosition[8519681];
    local /*0x35EA0000-0x00000000*/ private bool bOnlyWhenFacing[8519681];


}

// Export USceneCapture2DHitMaskComponent::execSetFadingStartTimeSinceHit(FFrame&, void* const)
native final function SetFadingStartTimeSinceHit()
{
    local /*0x35EA0000-0x00000000*/ private float InFadingStartTimeSinceHit[8519681];


}
