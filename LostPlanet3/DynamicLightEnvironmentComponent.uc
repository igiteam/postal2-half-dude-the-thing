class DynamicLightEnvironmentComponent extends LightEnvironmentComponent;

enum EDynamicLightEnvironmentBoundsMethod
{
    DLEB_OwnerComponents,           // 0
    DLEB_ManualOverride,            // 1
    DLEB_ActiveComponents,          // 2
    DLEB_MAX                        // 3
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL State[805437441];
var(*) /*0x1EA50000-0x00000000*/ private float InvisibleUpdateTime[65537];
var(*) /*0x1EA50000-0x00000000*/ private float MinTimeBetweenFullUpdates[65537];
var(*) /*0x35EA0000-0x00000000*/ private float VelocityUpdateTimeScale;
var(*) /*0x35EA0000-0x00000000*/ private float ShadowInterpolationSpeed;
var(*) /*0x1EA50000-0x00000000*/ private int NumVolumeVisibilitySamples[65537];
var(*) /*0x1EA50000-0x00000000*/ private float LightingBoundsScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AmbientShadowColor;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AmbientShadowSourceDirection;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AmbientGlow;
var(*) /*0x35EA0000-0x00000000*/ private float LightDistance;
var(*) /*0x35EA0000-0x00000000*/ private float ShadowDistance;
var(*) /*0x1EA50000-0x00000000*/ private bool bCastShadows[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCompositeShadowsFromDynamicLights;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceCompositeAllLights;
var(*) /*0x35EA0000-0x00000000*/ private bool bAffectedBySmallDynamicLights;
var(*) /*0x1EA50000-0x00000000*/ private bool bUseBooleanEnvironmentShadowing[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bShadowFromEnvironment;
var(*) /*0x35EA0000-0x00000000*/ private bool bOnlyShadowFromStaticGeometry;
var(*) /*0x1EA50000-0x00000000*/ private bool bDynamic[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSynthesizeDirectionalLight;
var(*) /*0x1EA50000-0x00000000*/ private bool bSynthesizeSHLight[65537];
var(*) /*0x1EA50000-0x00000000*/ private bool bRequiresNonLatentUpdates[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bTraceFromClosestBoundsPoint;
var(*) /*0x1EA50000-0x00000000*/ private bool bIsCharacterLightEnvironment[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideOwnerLightingChannels;
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysInfluencedByDominantDirectionalLight;
var(*) /*0x35EA0000-0x00000000*/ private float ModShadowFadeoutTime;
var(*) /*0x35EA0000-0x00000000*/ private float ModShadowFadeoutExponent;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MaxModulatedShadowColor;
var(*) /*0x35EA0000-0x00000000*/ private float DominantShadowTransitionStartDistance;
var(*) /*0x35EA0000-0x00000000*/ private float DominantShadowTransitionEndDistance;
var(*) /*0x35EA0000-0x00000000*/ private float MinShadowAngle;
var(*) /*0x35EA0000-0x00000000*/ private byte BoundsMethod;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OverriddenBounds;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OverriddenLightingChannels;
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array OverriddenLightComponents[655361];

// Export UDynamicLightEnvironmentComponent::execResetEnvironment(FFrame&, void* const)
native final function ResetEnvironment();
