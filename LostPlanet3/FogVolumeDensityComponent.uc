class FogVolumeDensityComponent extends ActorComponent
    abstract
    editinlinenew
    hidecategories(Object);

var(*) /*0x23D40000-0x00000000*/ private @NULL FogMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultFogVolumeMaterial;
var(*) /*0x23D40000-0x00000000*/ private bool bEnabled[196609];
var(*) /*0x23D40000-0x00000000*/ private bool bAffectsTranslucency[65537];
var(*) /*0x23D40000-0x00000000*/ private bool bOnlyAffectsTranslucency[65537];
var(*) /*0x23D40000-0x00000000*/ private editconst @NULL SimpleLightColor[65537];
var(*) /*0x23D40000-0x00000000*/ private editconst @NULL ApproxFogLightColor[65537];
var(*) /*0x23D40000-0x00000000*/ private editconst float StartDistance[65537];
var(*) /*0x23D40000-0x00000000*/ private float MaxDistance[65537];
var(*) /*0x23D40000-0x00000000*/ private editfixedsize array FogVolumeActors[65537];

// Export UFogVolumeDensityComponent::execSetEnabled(FFrame&, void* const)
native final function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bSetEnabled[8388609];


}
