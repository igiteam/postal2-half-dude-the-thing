class LightComponent extends ActorComponent
    abstract
    noexport;

enum ELightAffectsClassification
{
    LAC_USER_SELECTED,              // 0
    LAC_DYNAMIC_AFFECTING,          // 1
    LAC_STATIC_AFFECTING,           // 2
    LAC_DYNAMIC_AND_STATIC_AFFECTING,// 3
    LAC_MAX                         // 4
};

enum ELightShadowMode
{
    LightShadow_Normal,             // 0
    LightShadow_Modulate,           // 1
    LightShadow_ModulateBetter,     // 2
    LightShadow_MAX                 // 3
};

enum EShadowProjectionTechnique
{
    ShadowProjTech_Default,         // 0
    ShadowProjTech_PCF,             // 1
    ShadowProjTech_VSM,             // 2
    ShadowProjTech_BPCF_Low,        // 3
    ShadowProjTech_BPCF_Medium,     // 4
    ShadowProjTech_BPCF_High,       // 5
    ShadowProjTech_MAX              // 6
};

enum EShadowFilterQuality
{
    SFQ_Low,                        // 0
    SFQ_Medium,                     // 1
    SFQ_High,                       // 2
    SFQ_MAX                         // 3
};

struct LightingChannelContainer
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bInitialized;
    var(*) /*0x2EB20000-0x00000000*/ private bool BSP[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Static[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Dynamic[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool CompositeDynamic[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Skybox[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool SPBackground[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool GeneratedMeshAreaLight[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Unnamed_1[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Unnamed_2[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Unnamed_3[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Unnamed_4[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Unnamed_5[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Unnamed_6[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_1[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_2[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_3[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_4[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_5[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_6[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_7[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_8[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_9[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Cinematic_10[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Gameplay_1[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Gameplay_2[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Gameplay_3[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Gameplay_4[65537];
    var(*) /*0x2EB20000-0x00000000*/ private bool Crowd[65537];

    structdefaultproperties
    {
        bInitialized=false
        BSP=false
        Static=false
        Dynamic=false
        CompositeDynamic=false
        Skybox=false
        SPBackground=false
        GeneratedMeshAreaLight=false
        Unnamed_1=false
        Unnamed_2=false
        Unnamed_3=false
        Unnamed_4=false
        Unnamed_5=false
        Unnamed_6=false
        Cinematic_1=false
        Cinematic_2=false
        Cinematic_3=false
        Cinematic_4=false
        Cinematic_5=false
        Cinematic_6=false
        Cinematic_7=false
        Cinematic_8=false
        Cinematic_9=false
        Cinematic_10=false
        Gameplay_1=false
        Gameplay_2=false
        Gameplay_3=false
        Gameplay_4=false
        Crowd=false
    }
};

var(*) /*0x35EA0000-0x00000100*/ private @NULL SceneInfo[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WorldToLight[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightToWorld[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightGuid[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightmapGuid[131073];
var(*) /*0x2EA40000-0x00000000*/ private editconst float Brightness[196609];
var(*) /*0x2EA40000-0x00000000*/ private editconst @NULL LightColor[196609];
var(*) /*0x2EA40000-0x00000400*/ private editfixedsize @NULL Function[720897];
var(*) /*0x2EA40000-0x00000000*/ private bool bEnabled[196609];
var(*) /*0x2EA40000-0x00000000*/ private bool CastShadows[196609];
var(*) /*0x2EA40000-0x00000000*/ private bool CastStaticShadows[196609];
var(*) /*0x2EA40000-0x00000000*/ private bool CastDynamicShadows[65537];
var(*) /*0x2EA40000-0x00000000*/ private bool bCastCompositeShadow[65537];
var(*) /*0x2EA40000-0x00000000*/ private bool bAffectCompositeShadowDirection[65537];
var(*) /*0x2EA40000-0x00000000*/ private bool bNonModulatedSelfShadowing[65537];
var(*) /*0x2EA40000-0x00000000*/ private editconst bool bSelfShadowOnly[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowPreShadow;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceDynamicLight[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool UseDirectLightMap[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasLightEverBeenBuiltIntoLightMap[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanAffectDynamicPrimitivesOutsideDynamicChannel[131073];
var(*) /*0x2EE10000-0x00000000*/ private bool bRenderLightShafts[65537];
var(*) /*0x29B20000-0x00000000*/ private bool bUseImageReflectionSpecular[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bPrecomputedLightingIsValid[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bExplicitlyAssignedLight[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowCompositingIntoDLE;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL LightEnvironment[655361];
var(*) /*0x2EA40000-0x00000000*/ private @NULL LightingChannels[196609];
var(*) /*0x2EA40000-0x00000000*/ private const byte LightAffectsClassification[196609];
var(*) /*0x2EA40000-0x00000000*/ private byte LightShadowMode[65537];
var(*) /*0x2EA40000-0x00000000*/ private @NULL ModShadowColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private float ModShadowFadeoutTime;
var(*) /*0x35EA0000-0x00000000*/ private float ModShadowFadeoutExponent;
var(*) /*0x35EA0000-0x00000000*/ private int LightListIndex[268566529];
var(*) /*0x35EA0000-0x00000000*/ private byte ShadowProjectionTechnique;
var(*) /*0x2EA40000-0x00000000*/ private byte ShadowFilterQuality[65537];
var(*) /*0x2EA40000-0x00000000*/ private int MinShadowResolution[65537];
var(*) /*0x2EA40000-0x00000000*/ private int MaxShadowResolution[65537];
var(*) /*0x2EA40000-0x00000000*/ private int ShadowFadeResolution[65537];
var(*) /*0x4D020000-0x00000000*/ private float InnerToggleCameraDistance[196609];
var(*) /*0x4D020000-0x00000000*/ private float OuterToggleCameraDistance[196609];
var(*) /*0x35EA0000-0x00000400*/ init private export @NULL PreviewInnerToggleCameraDistance[537395201];
var(*) /*0x35EA0000-0x00000400*/ init private export @NULL PreviewOuterToggleCameraDistance[537395201];
var(*) /*0x2EE10000-0x00000000*/ private float OcclusionDepthRange[65537];
var(*) /*0x2EE10000-0x00000000*/ private editconst float BloomScale[65537];
var(*) /*0x2EE10000-0x00000000*/ private float BloomThreshold[65537];
var(*) /*0x2EE10000-0x00000000*/ private float BloomScreenBlendThreshold[65537];
var(*) /*0x2EE10000-0x00000000*/ private editconst @NULL BloomTint[65537];
var(*) /*0x2EE10000-0x00000000*/ private float RadialBlurPercent[65537];
var(*) /*0x2EE10000-0x00000000*/ private editconst float OcclusionMaskDarkness[65537];
var(*) /*0x29B20000-0x00000000*/ private float ReflectionSpecularBrightness[65537];

// Export ULightComponent::execSetEnabled(FFrame&, void* const)
native final function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bSetEnabled[8388609];


}

// Export ULightComponent::execSetLightProperties(FFrame&, void* const)
native final function SetLightProperties()
{
    local /*0x35EA0000-0x00000000*/ private float NewBrightness[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL NewLightColor[9437185], NewLightFunction;

    Brightness
    LightColor
    Function                    
}

// Export ULightComponent::execGetOrigin(FFrame&, void* const)
native final function GetOrigin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULightComponent::execGetDirection(FFrame&, void* const)
native final function GetDirection()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULightComponent::execUpdateColorAndBrightness(FFrame&, void* const)
native final function UpdateColorAndBrightness();

// Export ULightComponent::execUpdateLightShaftParameters(FFrame&, void* const)
native final function UpdateLightShaftParameters();

function OnUpdatePropertyBloomScale()
{
    UpdateLightShaftParameters();
    //return;    
}

function OnUpdatePropertyBloomTint()
{
    UpdateLightShaftParameters();
    //return;    
}

function OnUpdatePropertyOcclusionMaskDarkness()
{
    UpdateLightShaftParameters();
    //return;    
}

function OnUpdatePropertyBrightness()
{
    UpdateColorAndBrightness();
    //return;    
}

function OnUpdatePropertyLightColor()
{
    UpdateColorAndBrightness();
    //return;    
}
