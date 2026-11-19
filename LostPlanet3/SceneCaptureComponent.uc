class SceneCaptureComponent extends ActorComponent
    abstract
    hidecategories(Object);

enum ESceneCaptureViewMode
{
    SceneCapView_Lit,               // 0
    SceneCapView_Unlit,             // 1
    SceneCapView_LitNoShadows,      // 2
    SceneCapView_Wire,              // 3
    SceneCapView_MAX                // 4
};

var(*) /*0x11200000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x11200000-0x00000000*/ private bool bEnablePostProcess[65537];
var(*) /*0x11200000-0x00000000*/ private bool bEnableFog[65537];
var(*) /*0x11200000-0x00000000*/ private bool bUseMainScenePostProcessSettings[65537];
var(*) /*0x11200000-0x00000000*/ private bool bSkipUpdateIfTextureUsersOccluded[65537];
var(*) /*0x11200000-0x00000000*/ private bool bSkipUpdateIfOwnerOccluded[65537];
var(*) /*0x11200000-0x00000000*/ private bool bSkipRenderingDepthPrepass[65537];
var(*) /*0x11200000-0x00000000*/ private @NULL ClearColor[65537];
var(*) /*0x11200000-0x00000000*/ private byte ViewMode[65537];
var(*) /*0x11200000-0x00000000*/ private int SceneLOD[65537];
var(*) /*0x11200000-0x00000000*/ private float FrameRate[196609];
var(*) /*0x11200000-0x00000000*/ private @NULL PostProcess[65537];
var(*) /*0x11200000-0x00000000*/ private float MaxUpdateDist[65537];
var(*) /*0x11200000-0x00000000*/ private float MaxViewDistanceOverride[65537];
var(*) /*0x11200000-0x00000000*/ private float MaxStreamingUpdateDist[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CaptureInfo[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewState[805437441];
var(*) /*0x35EA0000-0x00000100*/ private array PostProcessProxies[805437441];

// Export USceneCaptureComponent::execSetFrameRate(FFrame&, void* const)
native final function SetFrameRate()
{
    local /*0x35EA0000-0x00000000*/ private float NewFrameRate[8388609];


}

// Export USceneCaptureComponent::execSetEnabled(FFrame&, void* const)
native final simulated function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnable[8388609];


}
