class LocalPlayer extends Player within Engine
    transient
    config(Engine);

struct SynchronizedActorVisibilityHistory
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL State;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CriticalSection;

    structdefaultproperties
    {
        State=none
        CriticalSection=none
    }
};

struct native CurrentPostProcessVolumeInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL LastSettings;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LastVolumeUsed;
    var(*) /*0x35EA0000-0x00000000*/ private float BlendStartTime;
    var(*) /*0x35EA0000-0x00000000*/ private float LastBlendTime;

    structdefaultproperties
    {
        LastSettings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000)
        LastVolumeUsed=none
        BlendStartTime=0.0000000
        LastBlendTime=0.0000000
    }
};

struct native PostProcessSettingsOverride
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Settings;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlendingIn;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlendingOut;
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentBlendInTime;
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentBlendOutTime;
    var(*) /*0x35EA0000-0x00000000*/ private float BlendInDuration;
    var(*) /*0x35EA0000-0x00000000*/ private float BlendOutDuration;
    var(*) /*0x35EA0000-0x00000000*/ private float BlendStartTime;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL TimeAlphaCurve;

    structdefaultproperties
    {
        Settings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000)
        bBlendingIn=false
        bBlendingOut=false
        CurrentBlendInTime=0.0000000
        CurrentBlendOutTime=0.0000000
        BlendInDuration=0.0000000
        BlendOutDuration=0.0000000
        BlendStartTime=0.0000000
        TimeAlphaCurve=(Points=none,InterpMethod=EInterpMethodType.IMT_UseFixedTangentEvalAndNewAutoTangents)
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FObserverInterface[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int ControllerId;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewportClient;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Origin;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Size;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerPostProcess[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerPostProcessChains[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceDefaultPostProcessChain[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bWantToResetToMapDefaultPP;
var(*) /*0x35EA0000-0x00000000*/ private const bool bSentSplitJoin[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingServerAuth;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewState[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewState2[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ActorVisibilityHistory[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastViewLocation[536870913];
var(*) /*0x35EA0000-0x00000100*/ private editfixedsize @NULL CurrentPPInfo[537001985];
var(*) /*0x35EA0000-0x00000100*/ private editfixedsize @NULL LevelPPInfo[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActivePPOverrides[536870913];
var(*) /*0x35EA0000-0x00000000*/ private byte AspectRatioAxisConstraint[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LastMap;
var(*) /*0x35EA0000-0x00000100*/ private @NULL CurrentSceneMaterial[536870913];
var(*) /*0x35EA0000-0x00000100*/ private @NULL PreviousSceneMaterial[536870913];
var(*) /*0x35EA0000-0x00000100*/ private @NULL CurrentSceneMatInstanceConstant[536870913];
var(*) /*0x35EA0000-0x00000100*/ private @NULL PreviousSceneMatInstanceConstant[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TagContext;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedAuthInt;
var(*) /*0x35EA0000-0x00000000*/ private float ServerAuthTimestamp;
var(*) /*0x35EA0000-0x00000000*/ private int ServerAuthTimeout;
var(*) /*0x35EA0000-0x00000000*/ private int ServerAuthRetryCount;
var(*) /*0x35EA0000-0x00000000*/ private int MaxServerAuthRetryCount;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ServerAuthUID;

// Export ULocalPlayer::execSpawnPlayActor(FFrame&, void* const)
native final function SpawnPlayActor()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609], OutError;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULocalPlayer::execSendSplitJoin(FFrame&, void* const)
native final function SendSplitJoin();

// Export ULocalPlayer::execGetActorVisibility(FFrame&, void* const)
native final function GetActorVisibility()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULocalPlayer::execSceneMaterialCleanUp(FFrame&, void* const)
native function SceneMaterialCleanUp();

// Export ULocalPlayer::execOverridePostProcessSettings(FFrame&, void* const)
native simulated function OverridePostProcessSettings()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OverrideSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private float BlendInTime[9437185];


}

// Export ULocalPlayer::execOverridePostProcessSettingsCurve(FFrame&, void* const)
native simulated function OverridePostProcessSettingsCurve()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OverrideSettings[8388609], Curve;


}

// Export ULocalPlayer::execClearPostProcessSettingsOverride(FFrame&, void* const)
native simulated function ClearPostProcessSettingsOverride()
{
    local /*0x35EA0000-0x00000000*/ private float BlendOutTime[9437185];


}

final function SetControllerId()
{
    local /*0x35EA0000-0x00000000*/ private int NewControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OtherPlayer;
    local /*0x35EA0000-0x00000000*/ private int CurrentControllerId;

    // End:0x111
    if(ControllerId != NewControllerId)
    {
        // End:0x45
        if(Actor != none)
        {
            Actor.PreControllerIdChange();
        }
        CurrentControllerId = ControllerId;
        ControllerId = -1;
        OtherPlayer = ViewportClient.FindPlayerByControllerId(NewControllerId);
        // End:0xD0
        if(OtherPlayer != none)
        {
            OtherPlayer.super(LocalPlayer).SetControllerId(CurrentControllerId);
        }
        ControllerId = NewControllerId;
        // End:0x111
        if(Actor != none)
        {
            Actor.PostControllerIdChange();
        }
    }
    //return;    
}

// Export ULocalPlayer::execGetTranslationContext(FFrame&, void* const)
native final function GetTranslationContext()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULocalPlayer::execInsertPostProcessingChain(FFrame&, void* const)
native function InsertPostProcessingChain()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InChain[8388609];
    local /*0x35EA0000-0x00000000*/ private int InIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInClone[8388609], ReturnValue;


}

// Export ULocalPlayer::execRemovePostProcessingChain(FFrame&, void* const)
native function RemovePostProcessingChain()
{
    local /*0x35EA0000-0x00000000*/ private int InIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULocalPlayer::execRemoveAllPostProcessingChains(FFrame&, void* const)
native function RemoveAllPostProcessingChains()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULocalPlayer::execGetPostProcessChain(FFrame&, void* const)
native function GetPostProcessChain()
{
    local /*0x35EA0000-0x00000000*/ private int InIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULocalPlayer::execTouchPlayerPostProcessChain(FFrame&, void* const)
native function TouchPlayerPostProcessChain();

// Export ULocalPlayer::execDeProject(FFrame&, void* const)
native final function DeProject()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RelativeScreenPos[8388609], WorldOrigin, WorldDirection;


}

// Export ULocalPlayer::execProject(FFrame&, void* const)
native final function Project()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WorldLoc[8388609], ReturnValue;


}

final event GetUniqueNetId()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Result, TheEngine;

    TheEngine = GameEngine(Outer);
    // End:0xFB
    if(((TheEngine != none) && TheEngine.OnlineSubsystem != none) && NotEqual_InterfaceInterface(TheEngine.OnlineSubsystem.PlayerInterface, OnlinePlayerInterface(none)))
    {
        TheEngine.OnlineSubsystem.PlayerInterface.GetUniquePlayerId(byte(ControllerId), Result);
    }
    return Result;
    //return ReturnValue;    
}

event GetNickname()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL TheEngine;

    TheEngine = GameEngine(Outer);
    // End:0xF6
    if(((TheEngine != none) && TheEngine.OnlineSubsystem != none) && NotEqual_InterfaceInterface(TheEngine.OnlineSubsystem.PlayerInterface, OnlinePlayerInterface(none)))
    {
        return TheEngine.OnlineSubsystem.PlayerInterface.GetPlayerNickname(byte(ControllerId));        
    }
    else
    {
        return "";
    }
    //return ReturnValue;    
}

event NotifyServerConnectionOpen()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    // End:0x1F8
    if(Outer.GamePlayers[0] == self)
    {
        CachedAuthInt = Class'GameEngine'.static.GetOnlineSubsystem().AuthInterface;
        // End:0x179
        if(NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
        {
            CachedAuthInt.AddClientAuthRequestDelegate(ProcessClientAuthRequest);
            CachedAuthInt.AddServerAuthResponseDelegate(ProcessServerAuthResponse);
            CachedAuthInt.AddServerAuthCompleteDelegate(OnServerAuthComplete);
            CachedAuthInt.AddClientAuthEndSessionRequestDelegate(ProcessClientAuthEndSessionRequest);
            CachedAuthInt.AddServerConnectionCloseDelegate(OnServerConnectionClose);
        }
        bPendingServerAuth = true;
        WI = Class'WorldInfo'.static.GetWorldInfo();
        // End:0x1E9
        if(WI != none)
        {
            ServerAuthTimestamp = WI.RealTimeSeconds;            
        }
        else
        {
            ServerAuthTimestamp = 10.0000000;
        }
    }
    //return;    
}

function ProcessClientAuthRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], ServerPort;
    local /*0x35EA0000-0x00000000*/ private bool bSecure[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NullId;
    local /*0x35EA0000-0x00000000*/ private int AuthTicketUID;

    // End:0xA1
    if(NotEqual_UniqueNetIdUniqueNetId(ServerUID, NullId))
    {
        // End:0xA1
        if(CachedAuthInt.CreateClientAuthSession(ServerUID, ServerIP, ServerPort, bSecure, AuthTicketUID))
        {
            // End:0x9E
            if(!CachedAuthInt.SendClientAuthResponse(AuthTicketUID))
            {
            }            
        }
    }
    //return;    
}

function ProcessClientAuthEndSessionRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609], CurClientSession, CurServerSession;

    // End:0xAC
    if(CachedAuthInt.FindLocalClientAuthSession(ServerConnection, CurClientSession))
    {
        CachedAuthInt.EndLocalClientAuthSession(CurClientSession.EndPointUID, CurClientSession.EndPointIP, CurClientSession.EndPointPort);        
    }
    // End:0x13C
    if(CachedAuthInt.FindServerAuthSession(ServerConnection, CurServerSession))
    {
        CachedAuthInt.EndRemoteServerAuthSession(CurServerSession.EndPointUID, CurServerSession.EndPointIP);        
    }
    //return;    
}

function ProcessServerAuthResponse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], AuthTicketUID;
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    // End:0xD3
    if(CachedAuthInt.VerifyServerAuthSession(ServerUID, ServerIP, AuthTicketUID))
    {
        bPendingServerAuth = true;
        ServerAuthUID = ServerUID;
        WI = Class'WorldInfo'.static.GetWorldInfo();
        // End:0xC1
        if(WI != none)
        {
            ServerAuthTimestamp = WI.RealTimeSeconds;            
        }
        else
        {
            ServerAuthTimestamp = 10.0000000;
        }        
    }
    //return;    
}

function OnServerAuthComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bSuccess[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609], ServerConnection;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ExtraInfo[8388609];

    // End:0x1C
    if(bSuccess)
    {
        bPendingServerAuth = false;        
    }
    else
    {
        ServerAuthTimedOut();
    }
    //return;    
}

event ServerAuthTimedOut()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WI, CurServerSession;

    // End:0x19D
    if(NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
    {
        // End:0x193
        if(ServerAuthRetryCount < MaxServerAuthRetryCount)
        {
            // End:0xF1
            foreach CachedAuthInt.AllServerAuthSessions(CurServerSession)
            {
                // End:0xF0
                if(EqualEqual_UniqueNetIdUniqueNetId(CurServerSession.EndPointUID, ServerAuthUID))
                {
                    CachedAuthInt.EndRemoteServerAuthSession(CurServerSession.EndPointUID, CurServerSession.EndPointIP);
                    // End:0xF1
                    break;
                }                
            }            
            CachedAuthInt.SendServerAuthRetryRequest();
            ServerAuthRetryCount++;
            WI = Class'WorldInfo'.static.GetWorldInfo();
            // End:0x181
            if(WI != none)
            {
                ServerAuthTimestamp = WI.RealTimeSeconds;                
            }
            else
            {
                ServerAuthTimestamp = 10.0000000;
            }            
        }
        else
        {
            ServerAuthFailure();
        }
    }
    //return;    
}

function ServerAuthFailure()
{
    //return;    
}

function OnServerConnectionClose()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609];

    StaticOnServerConnectionClose(ServerConnection);
    //return;    
}

static final function StaticOnServerConnectionClose()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609], CurAuthInt, CurClientSession, CurServerSession;

    CurAuthInt = Class'GameEngine'.static.GetOnlineSubsystem().AuthInterface;
    // End:0x19A
    if(NotEqual_InterfaceInterface(CurAuthInt, OnlineAuthInterface(none)))
    {
        // End:0x10A
        if(CurAuthInt.FindLocalClientAuthSession(ServerConnection, CurClientSession))
        {
            CurAuthInt.EndLocalClientAuthSession(CurClientSession.EndPointUID, CurClientSession.EndPointIP, CurClientSession.EndPointPort);            
        }
        // End:0x19A
        if(CurAuthInt.FindServerAuthSession(ServerConnection, CurServerSession))
        {
            CurAuthInt.EndRemoteServerAuthSession(CurServerSession.EndPointUID, CurServerSession.EndPointIP);            
        }
    }
    //return;    
}

event ViewportClosed()
{
    Cleanup(true);
    //return;    
}

event NotifyServerConnectionClose()
{
    Cleanup();
    //return;    
}

event Exit()
{
    Cleanup(true);
    //return;    
}

function Cleanup()
{
    local /*0x35EA0000-0x00000000*/ private bool bExit[9437185];

    // End:0x1A0
    if(Outer.GamePlayers[0] == self)
    {
        // End:0x189
        if(NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
        {
            CachedAuthInt.ClearClientAuthRequestDelegate(ProcessClientAuthRequest);
            CachedAuthInt.ClearServerAuthResponseDelegate(ProcessServerAuthResponse);
            CachedAuthInt.ClearServerAuthCompleteDelegate(OnServerAuthComplete);
            CachedAuthInt.ClearClientAuthEndSessionRequestDelegate(ProcessClientAuthEndSessionRequest);
            CachedAuthInt.ClearServerConnectionCloseDelegate(OnServerConnectionClose);
            // End:0x189
            if(bExit)
            {
                CachedAuthInt.EndAllLocalClientAuthSessions();
                CachedAuthInt.EndAllRemoteServerAuthSessions();
            }
        }
        CachedAuthInt = none;
        bPendingServerAuth = false;
    }
    //return;    
}

defaultproperties
{
    bWantToResetToMapDefaultPP=true
    CurrentPPInfo=(LastSettings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000),LastVolumeUsed=none,BlendStartTime=0.0000000,LastBlendTime=0.0000000)
    LevelPPInfo=(LastSettings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000),LastVolumeUsed=none,BlendStartTime=0.0000000,LastBlendTime=0.0000000)
    AspectRatioAxisConstraint=EAspectRatioAxisConstraint.AspectRatio_MaintainXFOV16x9Min
    ServerAuthTimeout=10
    MaxServerAuthRetryCount=3
}