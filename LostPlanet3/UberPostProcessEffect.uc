class UberPostProcessEffect extends DOFBloomMotionBlurEffect
    hidecategories(Object);

enum ETonemapperType
{
    Tonemapper_Off,                 // 0
    Tonemapper_Filmic,              // 1
    Tonemapper_Customizable,        // 2
    Tonemapper_MAX                  // 3
};

enum EPostProcessAAType
{
    PostProcessAA_Off,              // 0
    PostProcessAA_FXAA0,            // 1
    PostProcessAA_FXAA1,            // 2
    PostProcessAA_FXAA2,            // 3
    PostProcessAA_FXAA3,            // 4
    PostProcessAA_FXAA4,            // 5
    PostProcessAA_FXAA5,            // 6
    PostProcessAA_MLAA,             // 7
    PostProcessAA_MAX               // 8
};

var(*) /*0x42EC0000-0x00000000*/ private @NULL SceneShadows[65537];
var(*) /*0x42EC0000-0x00000000*/ private @NULL SceneHighLights[65537];
var(*) /*0x42EC0000-0x00000000*/ private @NULL SceneMidTones[65537];
var(*) /*0x42EC0000-0x00000000*/ private float SceneDesaturation[65537];
var(*) /*0x42EC0000-0x00000000*/ private @NULL SceneColorize[65537];
var(*) /*0x4D0A0000-0x00000000*/ private byte TonemapperType[65537];
var(*) /*0x3DB60000-0x00000000*/ private byte PostProcessAAType[65537];
var(*) /*0x4D0A0000-0x00000000*/ private float TonemapperRange[65537];
var(*) /*0x4D0A0000-0x00000000*/ private float TonemapperToeFactor[65537];
var(*) /*0x4D0A0000-0x00000000*/ private float TonemapperScale[65537];
var(*) /*0x33810000-0x00000000*/ private float MotionBlurSoftEdgeKernelSize[65537];
var(*) /*0x42EC0000-0x00000000*/ private bool bEnableImageGrain[65537];
var(*) /*0x3DB80000-0x00000000*/ private bool bScaleEffectsWithViewSize[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bEnableHDRTonemapper;
var(*) /*0x42EC0000-0x00000000*/ private float SceneImageGrainScale[65537];
var(*) /*0x0A3A0000-0x00000000*/ private float BloomWeightSmall[65537];
var(*) /*0x0A3A0000-0x00000000*/ private float BloomWeightMedium[65537];
var(*) /*0x0A3A0000-0x00000000*/ private float BloomWeightLarge[65537];
var(*) /*0x0A3A0000-0x00000000*/ private float BloomSizeScaleSmall[65537];
var(*) /*0x0A3A0000-0x00000000*/ private float BloomSizeScaleMedium[65537];
var(*) /*0x0A3A0000-0x00000000*/ private float BloomSizeScaleLarge[65537];
var(*) /*0x3DB60000-0x00000000*/ private float EdgeDetectionThreshold[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PreviousLUTBlender[805437441];
var(*) /*0x35EA0000-0x00000000*/ private transient float SceneHDRTonemapperScale;

defaultproperties
{
    SceneShadows=(X=0.0000000,Y=0.0000000,Z=-0.0030000)
    SceneHighLights=(X=0.8000000,Y=0.8000000,Z=0.8000000)
    SceneMidTones=(X=1.3000000,Y=1.3000000,Z=1.3000000)
    SceneDesaturation=0.4000000
    SceneColorize=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    TonemapperRange=8.0000000
    TonemapperToeFactor=1.0000000
    TonemapperScale=1.0000000
    SceneImageGrainScale=0.0200000
    BloomWeightMedium=1.0000000
    BloomSizeScaleSmall=0.2500000
    BloomSizeScaleMedium=1.0000000
    BloomSizeScaleLarge=3.0000000
    EdgeDetectionThreshold=12.0000000
}