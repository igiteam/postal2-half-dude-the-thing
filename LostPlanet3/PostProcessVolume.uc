class PostProcessVolume extends Volume
    placeable
    dontsortcategories(All)
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Advanced,Collision,Volume,Brush,Attachment);

struct native LUTBlender
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LUTTextures;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LUTWeights;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasChanged[805437441];

    structdefaultproperties
    {
        LUTTextures=none
        LUTWeights=none
    }
};

struct native MobileColorGradingParams
{
    var(*) /*0x33110000-0x00000000*/ private float TransitionTime[65537];
    var(*) /*0x33110000-0x00000000*/ private float Blend[65537];
    var(*) /*0x33110000-0x00000000*/ private float Desaturation[65537];
    var(*) /*0x33110000-0x00000000*/ private @NULL HighLights[65537];
    var(*) /*0x33110000-0x00000000*/ private @NULL MidTones[65537];
    var(*) /*0x33110000-0x00000000*/ private @NULL Shadows[65537];

    structdefaultproperties
    {
        TransitionTime=1.0000000
        Blend=0.0000000
        Desaturation=0.0000000
        HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000)
        MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    }
};

struct native MobilePostProcessSettings
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_BlurAmount;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_TransitionTime;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_Bloom_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_Bloom_Threshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_Bloom_Tint;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_DOF_Distance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_DOF_MinRange;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_DOF_MaxRange;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_DOF_NearBlurFactor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Mobile_DOF_FarBlurFactor;
    var(*) /*0x33370000-0x00000000*/ private editconst float Mobile_BlurAmount[65537];
    var(*) /*0x33370000-0x00000000*/ private float Mobile_TransitionTime[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst float Mobile_Bloom_Scale[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst float Mobile_Bloom_Threshold[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst @NULL Mobile_Bloom_Tint[65537];
    var(*) /*0x1DB20000-0x00000000*/ private editconst float Mobile_DOF_Distance[65537];
    var(*) /*0x1DB20000-0x00000000*/ private editconst float Mobile_DOF_MinRange[65537];
    var(*) /*0x1DB20000-0x00000000*/ private editconst float Mobile_DOF_MaxRange[65537];
    var(*) /*0x1DB20000-0x00000000*/ private editconst float Mobile_DOF_NearBlurFactor[65537];
    var(*) /*0x1DB20000-0x00000000*/ private editconst float Mobile_DOF_FarBlurFactor[65537];

    structdefaultproperties
    {
        bOverride_Mobile_BlurAmount=false
        bOverride_Mobile_TransitionTime=false
        bOverride_Mobile_Bloom_Scale=false
        bOverride_Mobile_Bloom_Threshold=false
        bOverride_Mobile_Bloom_Tint=false
        bOverride_Mobile_DOF_Distance=false
        bOverride_Mobile_DOF_MinRange=false
        bOverride_Mobile_DOF_MaxRange=false
        bOverride_Mobile_DOF_NearBlurFactor=false
        bOverride_Mobile_DOF_FarBlurFactor=false
        Mobile_BlurAmount=16.0000000
        Mobile_TransitionTime=1.0000000
        Mobile_Bloom_Scale=6.0000000
        Mobile_Bloom_Threshold=0.5000000
        Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
        Mobile_DOF_Distance=1500.0000000
        Mobile_DOF_MinRange=600.0000000
        Mobile_DOF_MaxRange=1200.0000000
        Mobile_DOF_NearBlurFactor=1.0000000
        Mobile_DOF_FarBlurFactor=1.0000000
    }
};

struct native PostProcessSettings
{
    var(*) /*0x3DBC0000-0x00000000*/ private editconst @NULL SPPostFXSettings[65537];
    var(*) /*0x3DBC0000-0x00000000*/ private editconst @NULL ScreenLayersSettings[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_EnableBloom;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_EnableDOF;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_EnableMotionBlur;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_EnableSceneEffect;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_EnableMaterialEffect;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_AllowAmbientOcclusion;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_OverrideRimShaderColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Bloom_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Bloom_Threshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Bloom_Tint;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Bloom_ScreenBlendThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Bloom_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_FalloffExponent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_BlurKernelSize;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_BlurBloomKernelSize;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_MaxNearBlurAmount;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_MinBlurAmount;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_MaxFarBlurAmount;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_FocusType;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_FocusInnerRadius;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_FocusDistance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_FocusPosition;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DOF_BokehTexture;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionBlur_MaxVelocity;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionBlur_Amount;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionBlur_FullMotionBlur;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionBlur_CameraRotationThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionBlur_CameraTranslationThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionBlur_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_Desaturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_Colorize;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_TonemapperScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_ImageGrainScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_HighLights;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_MidTones;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_Shadows;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_ColorGradingLUT;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_RimShader_Color;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_RimShader_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MobileColorGrading;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionPower;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionBias;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionRadius;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionQuality;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionFadeoutMinDistance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_OcclusionFadeoutMaxDistance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_SSAO_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scene_Material;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MaterialEffect_InterpolationDuration;
    var(*) /*0x0A390000-0x00000000*/ private bool bEnableBloom[65537];
    var(*) /*0x1C600000-0x00000000*/ private bool bEnableDOF[65537];
    var(*) /*0x33810000-0x00000000*/ private bool bEnableMotionBlur[65537];
    var(*) /*0x42EC0000-0x00000000*/ private bool bEnableSceneEffect[65537];
    var(*) /*0x43230000-0x00000000*/ private editconst bool bEnableMaterialEffect[65537];
    var(*) /*0x02440000-0x00000000*/ private bool bAllowAmbientOcclusion[65537];
    var(*) /*0x42180000-0x00000000*/ private bool bOverrideRimShaderColor[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst float Bloom_Scale[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst float Bloom_Threshold[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst @NULL Bloom_Tint[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst float Bloom_ScreenBlendThreshold[65537];
    var(*) /*0x0A390000-0x00000000*/ private float Bloom_InterpolationDuration[65537];
    var(*) /*0x0A390000-0x00000000*/ private editconst float DOF_BlurBloomKernelSize[65537];
    var(*) /*0x1C600000-0x00000000*/ private editconst float DOF_FalloffExponent[65537];
    var(*) /*0x1C600000-0x00000000*/ private editconst float DOF_BlurKernelSize[65537];
    var(*) /*0x1C610000-0x00000000*/ private editconst float DOF_MaxNearBlurAmount[65537];
    var(*) /*0x1C610000-0x00000000*/ private editconst float DOF_MinBlurAmount[65537];
    var(*) /*0x1C610000-0x00000000*/ private editconst float DOF_MaxFarBlurAmount[65537];
    var(*) /*0x1C600000-0x00000000*/ private byte DOF_FocusType[65537];
    var(*) /*0x1C600000-0x00000000*/ private editconst float DOF_FocusInnerRadius[65537];
    var(*) /*0x1C600000-0x00000000*/ private editconst float DOF_FocusDistance[65537];
    var(*) /*0x1C600000-0x00000000*/ private @NULL DOF_FocusPosition[65537];
    var(*) /*0x1C600000-0x00000000*/ private float DOF_InterpolationDuration[65537];
    var(*) /*0x1C600000-0x00000000*/ private @NULL DOF_BokehTexture[65537];
    var(*) /*0x33810000-0x00000000*/ private editconst float MotionBlur_MaxVelocity[65537];
    var(*) /*0x33810000-0x00000000*/ private editconst float MotionBlur_Amount[65537];
    var(*) /*0x33810000-0x00000000*/ private bool MotionBlur_FullMotionBlur[65537];
    var(*) /*0x33810000-0x00000000*/ private editconst float MotionBlur_CameraRotationThreshold[65537];
    var(*) /*0x33810000-0x00000000*/ private editconst float MotionBlur_CameraTranslationThreshold[65537];
    var(*) /*0x33810000-0x00000000*/ private float MotionBlur_InterpolationDuration[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst float Scene_Desaturation[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst @NULL Scene_Colorize[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst float Scene_TonemapperScale[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst float Scene_ImageGrainScale[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst @NULL Scene_HighLights[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst @NULL Scene_MidTones[65537];
    var(*) /*0x42EC0000-0x00000000*/ private editconst @NULL Scene_Shadows[65537];
    var(*) /*0x42EC0000-0x00000000*/ private float Scene_InterpolationDuration[65537];
    var(*) /*0x42180000-0x00000000*/ private @NULL RimShader_Color[65537];
    var(*) /*0x42180000-0x00000000*/ private float RimShader_InterpolationDuration[65537];
    var(*) /*0x42EC0000-0x00000000*/ private @NULL ColorGrading_LookupTable[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL ColorGradingLUT[537001985];
    var(*) /*0x32E40000-0x00000000*/ private @NULL MobileColorGrading[65537];
    var(*) /*0x32E40000-0x00000000*/ private editconst @NULL MobilePostProcess[65537];
    var(*) /*0x02440000-0x00000000*/ private @NULL SSAO_OcclusionColor[65537];
    var(*) /*0x02440000-0x00000000*/ private editconst float SSAO_OcclusionPower[65537];
    var(*) /*0x02440000-0x00000000*/ private editconst float SSAO_OcclusionScale[65537];
    var(*) /*0x02440000-0x00000000*/ private editconst float SSAO_OcclusionBias[65537];
    var(*) /*0x02440000-0x00000000*/ private editconst float SSAO_OcclusionRadius[65537];
    var(*) /*0x02440000-0x00000000*/ private byte SSAO_OcclusionQuality[65537];
    var(*) /*0x02440000-0x00000000*/ private editconst float SSAO_OcclusionFadeoutMinDistance[65537];
    var(*) /*0x02440000-0x00000000*/ private editconst float SSAO_OcclusionFadeoutMaxDistance[65537];
    var(*) /*0x02440000-0x00000000*/ private float SSAO_InterpolationDuration[65537];
    var(*) /*0x43230000-0x00000000*/ private float MaterialEffect_InterpolationDuration[65537];
    var(*) /*0x43230000-0x00000000*/ private @NULL Scene_Material[65537];
    var(*) /*0x35EA0000-0x00000000*/ private float Scene_MaterialFadeOpacityValue;
    var(*) /*0x35EA0000-0x00000100*/ private @NULL PreviousScene_Material[536870913];
    var(*) /*0x35EA0000-0x00000100*/ private float PreviousScene_MaterialFadeOpacityValue[536870913];

    structdefaultproperties
    {
        SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true))
        ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000))
        bOverride_EnableBloom=true
        bOverride_EnableDOF=true
        bOverride_EnableMotionBlur=true
        bOverride_EnableSceneEffect=true
        bOverride_EnableMaterialEffect=true
        bOverride_AllowAmbientOcclusion=true
        bOverride_OverrideRimShaderColor=true
        bOverride_Bloom_Scale=true
        bOverride_Bloom_Threshold=true
        bOverride_Bloom_Tint=true
        bOverride_Bloom_ScreenBlendThreshold=true
        bOverride_Bloom_InterpolationDuration=true
        bOverride_DOF_FalloffExponent=true
        bOverride_DOF_BlurKernelSize=true
        bOverride_DOF_BlurBloomKernelSize=true
        bOverride_DOF_MaxNearBlurAmount=true
        bOverride_DOF_MinBlurAmount=false
        bOverride_DOF_MaxFarBlurAmount=true
        bOverride_DOF_FocusType=true
        bOverride_DOF_FocusInnerRadius=true
        bOverride_DOF_FocusDistance=true
        bOverride_DOF_FocusPosition=true
        bOverride_DOF_InterpolationDuration=true
        bOverride_DOF_BokehTexture=false
        bOverride_MotionBlur_MaxVelocity=false
        bOverride_MotionBlur_Amount=false
        bOverride_MotionBlur_FullMotionBlur=false
        bOverride_MotionBlur_CameraRotationThreshold=false
        bOverride_MotionBlur_CameraTranslationThreshold=false
        bOverride_MotionBlur_InterpolationDuration=false
        bOverride_Scene_Desaturation=true
        bOverride_Scene_Colorize=false
        bOverride_Scene_TonemapperScale=false
        bOverride_Scene_ImageGrainScale=false
        bOverride_Scene_HighLights=true
        bOverride_Scene_MidTones=true
        bOverride_Scene_Shadows=true
        bOverride_Scene_InterpolationDuration=true
        bOverride_Scene_ColorGradingLUT=false
        bOverride_RimShader_Color=true
        bOverride_RimShader_InterpolationDuration=true
        bOverride_MobileColorGrading=false
        bOverride_SSAO_OcclusionColor=true
        bOverride_SSAO_OcclusionPower=true
        bOverride_SSAO_OcclusionScale=true
        bOverride_SSAO_OcclusionBias=true
        bOverride_SSAO_OcclusionRadius=true
        bOverride_SSAO_OcclusionQuality=true
        bOverride_SSAO_OcclusionFadeoutMinDistance=true
        bOverride_SSAO_OcclusionFadeoutMaxDistance=true
        bOverride_SSAO_InterpolationDuration=true
        bOverride_Scene_Material=true
        bOverride_MaterialEffect_InterpolationDuration=true
        bEnableBloom=true
        bEnableDOF=false
        bEnableMotionBlur=true
        bEnableSceneEffect=true
        bEnableMaterialEffect=true
        bAllowAmbientOcclusion=true
        bOverrideRimShaderColor=false
        Bloom_Scale=1.0000000
        Bloom_Threshold=1.0000000
        Bloom_Tint=(R=255,G=255,B=255,A=0)
        Bloom_ScreenBlendThreshold=10.0000000
        Bloom_InterpolationDuration=1.0000000
        DOF_BlurBloomKernelSize=16.0000000
        DOF_FalloffExponent=4.0000000
        DOF_BlurKernelSize=16.0000000
        DOF_MaxNearBlurAmount=1.0000000
        DOF_MinBlurAmount=0.0000000
        DOF_MaxFarBlurAmount=1.0000000
        DOF_FocusType=EFocusType.FOCUS_Distance
        DOF_FocusInnerRadius=2000.0000000
        DOF_FocusDistance=0.0000000
        DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DOF_InterpolationDuration=1.0000000
        DOF_BokehTexture=none
        MotionBlur_MaxVelocity=1.0000000
        MotionBlur_Amount=0.5000000
        MotionBlur_FullMotionBlur=true
        MotionBlur_CameraRotationThreshold=45.0000000
        MotionBlur_CameraTranslationThreshold=10000.0000000
        MotionBlur_InterpolationDuration=1.0000000
        Scene_Desaturation=0.0000000
        Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        Scene_TonemapperScale=1.0000000
        Scene_ImageGrainScale=0.0000000
        Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Scene_InterpolationDuration=1.0000000
        RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000)
        RimShader_InterpolationDuration=1.0000000
        ColorGrading_LookupTable=none
        ColorGradingLUT=(LUTTextures=none,LUTWeights=none)
        MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000))
        MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000)
        SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        SSAO_OcclusionPower=4.0000000
        SSAO_OcclusionScale=20.0000000
        SSAO_OcclusionBias=0.0000000
        SSAO_OcclusionRadius=25.0000000
        SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium
        SSAO_OcclusionFadeoutMinDistance=4000.0000000
        SSAO_OcclusionFadeoutMaxDistance=4500.0000000
        SSAO_InterpolationDuration=1.0000000
        MaterialEffect_InterpolationDuration=1.0000000
        Scene_Material=none
        Scene_MaterialFadeOpacityValue=1.0000000
        PreviousScene_Material=none
        PreviousScene_MaterialFadeOpacityValue=0.0000000
    }
};

var(*) /*0x3DBF0000-0x00000000*/ private float Priority[65537];
var(*) /*0x3DBF0000-0x00000000*/ private bool bOverrideWorldPostProcessChain[65537];
var(*) /*0x3DBF0000-0x00000000*/ private bool bEnabled[2162689];
var(*) /*0x3DBF0000-0x00000000*/ private editfixedsize editconst @NULL Settings[65537];
var(*) /*0x35EA0000-0x00000100*/ private @NULL NextLowerPriorityVolume[537001985];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'PostProcessVolume.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

defaultproperties
{
    bEnabled=true
    Settings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000)
    // Reference: BrushComponent'Default__PostProcessVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bStatic=false
    bTickIsDisabled=true
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}