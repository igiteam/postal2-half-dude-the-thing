class LightEnvironmentComponent extends ActorComponent;

var(*) /*0x2EAC0000-0x00000000*/ private bool bEnabled[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceNonCompositeDynamicLights;
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowDynamicShadowsOnTranslucency;
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowPreShadow[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bTranslucencyShadowed[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float DominantShadowFactor[537001985];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL AffectingDominantLight[537526273];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array AffectedComponents[537526273];

// Export ULightEnvironmentComponent::execSetEnabled(FFrame&, void* const)
native final function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewEnabled[8388609];


}

// Export ULightEnvironmentComponent::execIsEnabled(FFrame&, void* const)
native final function IsEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
