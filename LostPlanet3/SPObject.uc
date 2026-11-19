class SPObject extends Object
    abstract;

enum EBooleanOverride
{
    EBO_FALSE,                      // 0
    EBO_TRUE,                       // 1
    EBO_NOOVERRIDE,                 // 2
    EBO_MAX                         // 3
};

enum EOverrideType
{
    SPEOT_NOOVERRIDE,               // 0
    SPEOT_OVERRIDE,                 // 1
    SPEOT_MAX                       // 2
};

struct native CommitMapChangeExtraParams
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bMakeKeptLevelsVisibleOnCommitPendingMapChange;
    var(*) /*0x35EA0000-0x00000000*/ private bool bShouldKeepSameLevelsOnCommitPendingMapChange;
    var(*) /*0x35EA0000-0x00000000*/ private bool bMakeSameLevelsVisibleOnCommitPendingMapChange;
    var(*) /*0x35EA0000-0x00000000*/ private bool bReCreatePlayerPawn;
    var(*) /*0x35EA0000-0x00000000*/ private bool bReCreatePlayerHUD;
    var(*) /*0x35EA0000-0x00000000*/ private bool bNoKismetLevelStartup;
    var(*) /*0x35EA0000-0x00000000*/ private bool bFadeOutBeforeCommit;
    var(*) /*0x35EA0000-0x00000000*/ private bool bFadeInAfterCommit;
    var(*) /*0x35EA0000-0x00000000*/ private float FadeOutTime;
    var(*) /*0x35EA0000-0x00000000*/ private float FadeInTime;
    var(*) /*0x35EA0000-0x00000000*/ private name CommitPendingMapChangePlayerStartTagName;

    structdefaultproperties
    {
        bMakeKeptLevelsVisibleOnCommitPendingMapChange=false
        bShouldKeepSameLevelsOnCommitPendingMapChange=false
        bMakeSameLevelsVisibleOnCommitPendingMapChange=false
        bReCreatePlayerPawn=false
        bReCreatePlayerHUD=false
        bNoKismetLevelStartup=false
        bFadeOutBeforeCommit=true
        bFadeInAfterCommit=true
        FadeOutTime=1.0000000
        FadeInTime=1.0000000
        CommitPendingMapChangePlayerStartTagName="None"
    }
};

struct native SPVector2
{
    var(*) /*0x49870000-0x00000000*/ private float X[65537];
    var(*) /*0x49870000-0x00000000*/ private float Y[65537];

    structdefaultproperties
    {
        X=0.0000000
        Y=0.0000000
    }
};

struct native SPVector3
{
    var(*) /*0x49880000-0x00000000*/ private float X[65537];
    var(*) /*0x49880000-0x00000000*/ private float Y[65537];
    var(*) /*0x49880000-0x00000000*/ private float Z[65537];

    structdefaultproperties
    {
        X=0.0000000
        Y=0.0000000
        Z=0.0000000
    }
};

struct native SPVector4
{
    var(*) /*0x49890000-0x00000000*/ private float X[65537];
    var(*) /*0x49890000-0x00000000*/ private float Y[65537];
    var(*) /*0x49890000-0x00000000*/ private float Z[65537];
    var(*) /*0x49890000-0x00000000*/ private float W[65537];

    structdefaultproperties
    {
        X=0.0000000
        Y=0.0000000
        Z=0.0000000
        W=0.0000000
    }
};

struct native SPWigglerInfo
{
    var(*) /*0x498E0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x498E0000-0x00000000*/ private @NULL Amplitude[65537];
    var(*) /*0x498E0000-0x00000000*/ private @NULL Frequency[65537];

    structdefaultproperties
    {
        bEnabled=false
        Amplitude=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Frequency=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native BoolOverride
{
    var(*) /*0x0B830000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x0B830000-0x00000000*/ private bool OverrideValue[65537];

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        OverrideValue=false
    }
};

struct native IntOverride
{
    var(*) /*0x2C250000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad3;
    var(*) /*0x2C250000-0x00000000*/ private int OverrideValue[65537];

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        Pad1=0
        Pad2=0
        Pad3=0
        OverrideValue=0
    }
};

struct native FloatOverride
{
    var(*) /*0x236B0000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad3;
    var(*) /*0x236B0000-0x00000000*/ private float OverrideValue[65537];

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        Pad1=0
        Pad2=0
        Pad3=0
        OverrideValue=0.0000000
    }
};

struct native VectorOverride
{
    var(*) /*0x4F570000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad3;
    var(*) /*0x4F570000-0x00000000*/ private @NULL OverrideValue[65537];

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        Pad1=0
        Pad2=0
        Pad3=0
        OverrideValue=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native LinearColorOverride
{
    var(*) /*0x2EF30000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad3;
    var(*) /*0x2EF30000-0x00000000*/ private @NULL OverrideValue[65537];

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        Pad1=0
        Pad2=0
        Pad3=0
        OverrideValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    }
};

struct native LightChannelOverride
{
    var(*) /*0x2EA00000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad3;
    var(*) /*0x2EA00000-0x00000000*/ private @NULL LightChannels[65537];

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        Pad1=0
        Pad2=0
        Pad3=0
        LightChannels=(bInitialized=false,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,SPBackground=false,GeneratedMeshAreaLight=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false)
    }
};

struct native ShadowModeOverride
{
    var(*) /*0x46D30000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x46D30000-0x00000000*/ private byte OverrideValue[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        OverrideValue=ELightShadowMode.LightShadow_Modulate
        Pad1=0
        Pad2=0
    }
};

struct native ShadowFilterQualityOverride
{
    var(*) /*0x46C70000-0x00000000*/ private byte OverrideType[65537];
    var(*) /*0x46C70000-0x00000000*/ private byte OverrideValue[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad1;
    var(*) /*0x35EA0000-0x00000000*/ private byte Pad2;

    structdefaultproperties
    {
        OverrideType=EOverrideType.SPEOT_NOOVERRIDE
        OverrideValue=EShadowFilterQuality.SFQ_Low
        Pad1=0
        Pad2=0
    }
};

struct native DynamicLightEnvOverride
{
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bEnabled[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bForceNonCompositeDynamicLights[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL InvisibleUpdateTime[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL MinTimeBetweenFullUpdates[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL NumVolumeVisibilitySamples[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL AmbientShadowColor[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL AmbientShadowSourceDirection[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL AmbientGlow[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL LightDesaturation[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL LightDistance[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL ShadowDistance[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bCastShadows[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bCompositeShadowsFromDynamicLights[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL ModShadowFadeoutTime[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL ModShadowFadeoutExponent[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL MaxModulatedShadowColor[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bDynamic[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bSynthesizeDirectionalLight[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bSynthesizeSHLight[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL MinShadowAngle[65537];
    var(*) /*0x1EA70000-0x00000000*/ private @NULL bRequiresNonLatentUpdates[65537];

    structdefaultproperties
    {
        bEnabled=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true)
        bForceNonCompositeDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false)
        InvisibleUpdateTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000)
        MinTimeBetweenFullUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1.0000000)
        NumVolumeVisibilitySamples=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1)
        AmbientShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0010000,G=0.0010000,B=0.0010000,A=1.0000000))
        AmbientShadowSourceDirection=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(X=0.0100000,Y=0.0000000,Z=0.9900000))
        AmbientGlow=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000))
        LightDesaturation=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.0000000)
        LightDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=10.0000000)
        ShadowDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000)
        bCastShadows=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true)
        bCompositeShadowsFromDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true)
        ModShadowFadeoutTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.7500000)
        ModShadowFadeoutExponent=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=3.0000000)
        MaxModulatedShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.5000000,G=0.5000000,B=0.5000000,A=1.0000000))
        bDynamic=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true)
        bSynthesizeDirectionalLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true)
        bSynthesizeSHLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true)
        MinShadowAngle=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=35.0000000)
        bRequiresNonLatentUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false)
    }
};

struct native LightSettingsOverride
{
    var(*) /*0x2EB80000-0x00000000*/ private byte bCastShadow[65537];
    var(*) /*0x2EB80000-0x00000000*/ private byte bCastDynamicShadow[65537];
    var(*) /*0x2EB80000-0x00000000*/ private byte bAcceptsLights[65537];
    var(*) /*0x2EB80000-0x00000000*/ private byte bAcceptsDynamicLights[65537];
    var(*) /*0x2EB80000-0x00000000*/ private byte bUsePrecomputedShadows[65537];
    var(*) /*0x2EB80000-0x00000000*/ private @NULL LightingChannels[65537];
    var(*) /*0x2EB80000-0x00000000*/ private @NULL DynamicLightEnvironmentOverride[65537];

    structdefaultproperties
    {
        bCastShadow=EBooleanOverride.EBO_NOOVERRIDE
        bCastDynamicShadow=EBooleanOverride.EBO_NOOVERRIDE
        bAcceptsLights=EBooleanOverride.EBO_NOOVERRIDE
        bAcceptsDynamicLights=EBooleanOverride.EBO_NOOVERRIDE
        bUsePrecomputedShadows=EBooleanOverride.EBO_NOOVERRIDE
        LightingChannels=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,LightChannels=(bInitialized=false,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,SPBackground=false,GeneratedMeshAreaLight=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false))
        DynamicLightEnvironmentOverride=(bEnabled=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bForceNonCompositeDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false),InvisibleUpdateTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000),MinTimeBetweenFullUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1.0000000),NumVolumeVisibilitySamples=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1),AmbientShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0010000,G=0.0010000,B=0.0010000,A=1.0000000)),AmbientShadowSourceDirection=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(X=0.0100000,Y=0.0000000,Z=0.9900000)),AmbientGlow=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),LightDesaturation=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.0000000),LightDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=10.0000000),ShadowDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000),bCastShadows=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bCompositeShadowsFromDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),ModShadowFadeoutTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.7500000),ModShadowFadeoutExponent=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=3.0000000),MaxModulatedShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.5000000,G=0.5000000,B=0.5000000,A=1.0000000)),bDynamic=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bSynthesizeDirectionalLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bSynthesizeSHLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),MinShadowAngle=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=35.0000000),bRequiresNonLatentUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false))
    }
};

struct native ComponentScaleOverride
{
    var(*) /*0x42E70000-0x00000000*/ private @NULL Scale[65537];

    structdefaultproperties
    {
        Scale=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1.0000000)
    }
};

struct LightComponentRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private float Brightness;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSelfShadowOnly;
    var(*) /*0x35EA0000-0x00000000*/ private float BloomScale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BloomTint;
    var(*) /*0x35EA0000-0x00000000*/ private float OcclusionMaskDarkness;

    structdefaultproperties
    {
        Brightness=0.0000000
        LightColor=(R=0,G=0,B=0,A=0)
        bSelfShadowOnly=false
        BloomScale=0.0000000
        BloomTint=(R=0,G=0,B=0,A=0)
        OcclusionMaskDarkness=0.0000000
    }
};

struct PointLightComponentRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private float Radius;
    var(*) /*0x35EA0000-0x00000000*/ private float FalloffExponent;
    var(*) /*0x35EA0000-0x00000000*/ private float Brightness;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSelfShadowOnly;
    var(*) /*0x35EA0000-0x00000000*/ private float BloomScale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BloomTint;
    var(*) /*0x35EA0000-0x00000000*/ private float OcclusionMaskDarkness;

    structdefaultproperties
    {
        Radius=0.0000000
        FalloffExponent=0.0000000
        Brightness=0.0000000
        LightColor=(R=0,G=0,B=0,A=0)
        bSelfShadowOnly=false
        BloomScale=0.0000000
        BloomTint=(R=0,G=0,B=0,A=0)
        OcclusionMaskDarkness=0.0000000
    }
};

// Export USPObject::execMarkObjectAsPendingKill(FFrame&, void* const)
native static final function MarkObjectAsPendingKill()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InObject[8388609];


}

// Export USPObject::execAppCmdLine(FFrame&, void* const)
native static final function AppCmdLine()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export USPObject::execParseCmdLineOption(FFrame&, void* const)
native static final function ParseCmdLineOption()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], Match, ReturnValue;


}

// Export USPObject::execParseCmdLineInteger(FFrame&, void* const)
native static final function ParseCmdLineInteger()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], Match;
    local /*0x35EA0000-0x00000000*/ private int outFound[25165825], iDefault;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPObject::execParseCmdLineParam(FFrame&, void* const)
native static final function ParseCmdLineParam()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Stream[8388609], Param;
    local /*0x35EA0000-0x00000000*/ private bool bAllowQuoted[9437185], ReturnValue;


}

// Export USPObject::execCommandLineHasMapName(FFrame&, void* const)
native static final function CommandLineHasMapName()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPObject::execIsInEditorMode(FFrame&, void* const)
native static final function IsInEditorMode()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
