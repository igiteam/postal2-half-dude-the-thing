class SPPostFX extends PostProcessEffect
    abstract
    dontsortcategories(All)
    hidecategories(Object);

struct native SPInterp
{
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Amount;
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Blend;

    structdefaultproperties
    {
        Amount=0.0000000
        Blend=1.0000000
    }
};

struct native SPPostFXSettings_Filter
{
    var(*) /*0x495C0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x495C0000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x495C0000-0x00000000*/ private editconst float BlurKernelRadius[65537];
    var(*) /*0x495C0000-0x00000000*/ private editconst float VerticalStreak[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_BlurKernelRadius;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_VerticalStreak;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_BlurKernelRadius;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_VerticalStreak;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        BlurKernelRadius=8.0000000
        VerticalStreak=0.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_BlurKernelRadius=true
        bOverride_VerticalStreak=true
        bOverride_Interp_Scale=true
        Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000)
        Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)
    }
};

struct native SPPostFXSettings_Bloom
{
    var(*) /*0x49580000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x49580000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x49580000-0x00000000*/ private editconst float Threshold[65537];
    var(*) /*0x49580000-0x00000000*/ private editconst float Intensity[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Threshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Intensity;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Threshold;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Intensity;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        Threshold=0.5000000
        Intensity=1.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_Threshold=true
        bOverride_Intensity=true
        bOverride_Interp_Scale=true
        Interp_Threshold=(Amount=0.0000000,Blend=1.0000000)
        Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)
    }
};

struct native SPPostFXSettings_DepthOfField
{
    var(*) /*0x495B0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x495B0000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x495B0000-0x00000000*/ private editconst float MaxBlurAmountNear[65537];
    var(*) /*0x495B0000-0x00000000*/ private editconst float MaxBlurAmountFar[65537];
    var(*) /*0x495B0000-0x00000000*/ private editconst float FocusRadius[65537];
    var(*) /*0x495B0000-0x00000000*/ private editconst float FocusDistance[65537];
    var(*) /*0x495B0000-0x00000000*/ private editconst float FocusExponent[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MaxBlurAmountNear;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MaxBlurAmountFar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_FocusRadius;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_FocusDistance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_FocusExponent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_MaxBlurAmountNear;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_MaxBlurAmountFar;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_FocusRadius;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_FocusDistance;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_FocusExponent;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        MaxBlurAmountNear=0.0000000
        MaxBlurAmountFar=0.0000000
        FocusRadius=5000.0000000
        FocusDistance=0.0000000
        FocusExponent=1.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_MaxBlurAmountNear=true
        bOverride_MaxBlurAmountFar=true
        bOverride_FocusRadius=true
        bOverride_FocusDistance=true
        bOverride_FocusExponent=true
        bOverride_Interp_Scale=true
        Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000)
        Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000)
        Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000)
        Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000)
        Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)
    }
};

struct native SPPostFXSettings_MotionBlur
{
    var(*) /*0x495E0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x495E0000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x495E0000-0x00000000*/ private editconst float Amount[65537];
    var(*) /*0x495E0000-0x00000000*/ private editconst float MaxVelocity[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Amount;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MaxVelocity;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Amount;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_MaxVelocity;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        Amount=0.0000000
        MaxVelocity=1.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_Amount=true
        bOverride_MaxVelocity=true
        bOverride_Interp_Scale=true
        Interp_Amount=(Amount=0.0000000,Blend=1.0000000)
        Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)
    }
};

struct native SPPostFXSettings_Fog
{
    var(*) /*0x495D0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x495D0000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst float DistanceNear[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst float DistanceFar[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst @NULL ColorNear[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst @NULL ColorFar[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst @NULL ColorDistanceExponent[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst float OpacityNear[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst float OpacityFar[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst float OpacityDistanceExponent[65537];
    var(*) /*0x495D0000-0x00000000*/ private editconst float OpacitySky[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceNear;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceFar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorNear;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorFar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorDistanceExponent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_OpacityNear;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_OpacityFar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_OpacityDistanceExponent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_OpacitySky;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceNear;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceFar;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorNear;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorFar;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorDistanceExponent;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_OpacityNear;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_OpacityFar;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_OpacityDistanceExponent;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_OpacitySky;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        DistanceNear=0.0000000
        DistanceFar=5000.0000000
        ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        OpacityNear=0.0000000
        OpacityFar=0.0000000
        OpacityDistanceExponent=1.0000000
        OpacitySky=0.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_DistanceNear=true
        bOverride_DistanceFar=true
        bOverride_ColorNear=true
        bOverride_ColorFar=true
        bOverride_ColorDistanceExponent=true
        bOverride_OpacityNear=true
        bOverride_OpacityFar=true
        bOverride_OpacityDistanceExponent=true
        bOverride_OpacitySky=true
        bOverride_Interp_Scale=true
        Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000)
        Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000)
        Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000)
        Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000)
        Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000)
        Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)
    }
};

struct native SPPostFXSettings_ColorAdjust
{
    var(*) /*0x49590000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x49590000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x49590000-0x00000000*/ private bool bAfterBloom[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Saturation[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL ColorBalance[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float ColorBalanceBias[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float ColorBalancePreserveLuminosity[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL ColorBalanceDesaturation[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Shadows[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL HighlightsColor[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float HighlightsBias[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float HighlightsThreshold[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float HighlightsSaturation[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float HighlightsGamma[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Overbright[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float LevelsMin[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float LevelsMid[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float LevelsMax[65537];
    var(*) /*0x49590000-0x00000000*/ private bool bEnableFarSettings[65537];
    var(*) /*0x49590000-0x00000000*/ private bool bUseGradientSphere[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float DistanceNear[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float DistanceFar[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float DistanceExponent[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float DistanceScale[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_Saturation[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Far_ColorBalance[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_ColorBalanceBias[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_ColorBalancePreserveLuminosity[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Far_ColorBalanceDesaturation[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Far_Shadows[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Far_HighlightsColor[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_HighlightsBias[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_HighlightsThreshold[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_HighlightsSaturation[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_HighlightsGamma[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst @NULL Far_Overbright[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_LevelsMin[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_LevelsMid[65537];
    var(*) /*0x49590000-0x00000000*/ private editconst float Far_LevelsMax[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bAfterBloom;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Saturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorBalance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorBalanceBias;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorBalancePreserveLuminosity;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_ColorBalanceDesaturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Shadows;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_HighlightsColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_HighlightsBias;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_HighlightsThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_HighlightsSaturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_HighlightsGamma;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Overbright;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_LevelsMin;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_LevelsMid;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_LevelsMax;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnableFarSettings;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bUseGradientSphere;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceNear;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceFar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceExponent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_Saturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_ColorBalance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_ColorBalanceBias;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_ColorBalancePreserveLuminosity;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_ColorBalanceDesaturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_Shadows;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_HighlightsColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_HighlightsBias;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_HighlightsThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_HighlightsSaturation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_HighlightsGamma;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_Overbright;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_LevelsMin;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_LevelsMid;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Far_LevelsMax;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Saturation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorBalance;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorBalanceBias;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorBalancePreserveLuminosity;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_ColorBalanceDesaturation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Shadows;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_HighlightsColor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_HighlightsBias;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_HighlightsThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_HighlightsSaturation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_HighlightsGamma;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Overbright;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_LevelsMin;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_LevelsMid;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_LevelsMax;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceNear;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceFar;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceExponent;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceScale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_Saturation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_ColorBalance;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_ColorBalanceBias;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_ColorBalancePreserveLuminosity;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_ColorBalanceDesaturation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_Shadows;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_HighlightsColor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_HighlightsBias;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_HighlightsThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_HighlightsSaturation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_HighlightsGamma;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_Overbright;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_LevelsMin;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_LevelsMid;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Far_LevelsMax;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        bAfterBloom=true
        Saturation=1.0000000
        ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ColorBalanceBias=0.0000000
        ColorBalancePreserveLuminosity=0.0000000
        ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        HighlightsBias=0.0000000
        HighlightsThreshold=0.0000000
        HighlightsSaturation=0.0000000
        HighlightsGamma=1.0000000
        Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LevelsMin=0.0000000
        LevelsMid=0.0000000
        LevelsMax=1.0000000
        bEnableFarSettings=false
        bUseGradientSphere=false
        DistanceNear=0.0000000
        DistanceFar=5000.0000000
        DistanceExponent=1.0000000
        DistanceScale=1.0000000
        Far_Saturation=1.0000000
        Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Far_ColorBalanceBias=0.0000000
        Far_ColorBalancePreserveLuminosity=0.0000000
        Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Far_HighlightsBias=0.0000000
        Far_HighlightsThreshold=0.0000000
        Far_HighlightsSaturation=0.0000000
        Far_HighlightsGamma=1.0000000
        Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Far_LevelsMin=0.0000000
        Far_LevelsMid=0.0000000
        Far_LevelsMax=1.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_bAfterBloom=true
        bOverride_Saturation=true
        bOverride_ColorBalance=true
        bOverride_ColorBalanceBias=true
        bOverride_ColorBalancePreserveLuminosity=true
        bOverride_ColorBalanceDesaturation=true
        bOverride_Shadows=true
        bOverride_HighlightsColor=true
        bOverride_HighlightsBias=true
        bOverride_HighlightsThreshold=true
        bOverride_HighlightsSaturation=true
        bOverride_HighlightsGamma=true
        bOverride_Overbright=true
        bOverride_LevelsMin=true
        bOverride_LevelsMid=true
        bOverride_LevelsMax=true
        bOverride_bEnableFarSettings=true
        bOverride_bUseGradientSphere=true
        bOverride_DistanceNear=true
        bOverride_DistanceFar=true
        bOverride_DistanceExponent=true
        bOverride_DistanceScale=true
        bOverride_Far_Saturation=true
        bOverride_Far_ColorBalance=true
        bOverride_Far_ColorBalanceBias=true
        bOverride_Far_ColorBalancePreserveLuminosity=true
        bOverride_Far_ColorBalanceDesaturation=true
        bOverride_Far_Shadows=true
        bOverride_Far_HighlightsColor=true
        bOverride_Far_HighlightsBias=true
        bOverride_Far_HighlightsThreshold=true
        bOverride_Far_HighlightsSaturation=true
        bOverride_Far_HighlightsGamma=true
        bOverride_Far_Overbright=true
        bOverride_Far_LevelsMin=true
        bOverride_Far_LevelsMid=true
        bOverride_Far_LevelsMax=true
        bOverride_Interp_Scale=true
        Interp_Saturation=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000)
        Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000)
        Interp_Shadows=(Amount=0.0000000,Blend=1.0000000)
        Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000)
        Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000)
        Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000)
        Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000)
        Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000)
        Interp_Overbright=(Amount=0.0000000,Blend=1.0000000)
        Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000)
        Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000)
        Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000)
        Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000)
        Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000)
        Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000)
        Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000)
        Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)
    }
};

struct native SPPostFXSettings_DebugControl
{
    var(*) /*0x495A0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x495A0000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editconst float Interp_Scale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Interp_Scale;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        Interp_Scale=0.0000000
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_Interp_Scale=true
    }
};

struct native SPPostFXSettings
{
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL Filter[65537];
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL Bloom[65537];
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL DepthOfField[65537];
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL MotionBlur[65537];
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL Fog[65537];
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL ColorAdjust[65537];
    var(*) /*0x49570000-0x00000000*/ private editconst @NULL DebugControl[65537];

    structdefaultproperties
    {
        Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000))
        Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000))
        DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000))
        MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000))
        Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000))
        ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000))
        DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)
    }
};

var(*) /*0x49560000-0x00000000*/ private editconst @NULL Settings[65537];

defaultproperties
{
    Settings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true))
}