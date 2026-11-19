class PointLightComponent extends LightComponent
    editinlinenew
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private float ShadowRadiusMultiplier;
var(*) /*0x3D580000-0x00000000*/ private editconst float Radius[65537];
var(*) /*0x3D580000-0x00000000*/ private editconst float FalloffExponent[65537];
var(*) /*0x3D580000-0x00000000*/ private float ShadowFalloffExponent[65537];
var(*) /*0x35EA0000-0x00000000*/ private float MinShadowFalloffRadius;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedParentToWorld[131073];
var(*) /*0x3D580000-0x00000000*/ private @NULL Translation[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadowPlane[131073];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewLightRadius[655361];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewLightSourceRadius[655361];

// Export UPointLightComponent::execSetTranslation(FFrame&, void* const)
native final function SetTranslation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTranslation[8388609];


}

function OnUpdatePropertyLightColor()
{
    UpdateColorAndBrightness();
    //return;    
}

function OnUpdatePropertyBrightness()
{
    UpdateColorAndBrightness();
    //return;    
}
