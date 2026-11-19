class EngineBaseTypes extends Object
    abstract;

struct native RenderingPerformanceOverrides
{
    var(*) /*0x41450000-0x00000000*/ private bool bAllowAmbientOcclusion[65537];
    var(*) /*0x41450000-0x00000000*/ private bool bAllowDominantWholeSceneDynamicShadows[65537];
    var(*) /*0x41450000-0x00000000*/ private bool bAllowMotionBlurSkinning[65537];
    var(*) /*0x41450000-0x00000000*/ private bool bAllowTemporalAA[65537];
    var(*) /*0x41450000-0x00000000*/ private bool bAllowLightShafts[65537];

    structdefaultproperties
    {
        bAllowAmbientOcclusion=true
        bAllowDominantWholeSceneDynamicShadows=true
        bAllowMotionBlurSkinning=true
        bAllowTemporalAA=true
        bAllowLightShafts=true
    }
};
