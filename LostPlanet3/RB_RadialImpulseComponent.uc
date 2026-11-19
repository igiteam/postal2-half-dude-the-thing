class RB_RadialImpulseComponent extends PrimitiveComponent
    hidecategories(Object);

var(*) /*0x3FF20000-0x00000000*/ private byte ImpulseFalloff[65537];
var(*) /*0x3FF20000-0x00000000*/ private float ImpulseStrength[65537];
var(*) /*0x3FF20000-0x00000000*/ private float ImpulseRadius[65537];
var(*) /*0x3FF20000-0x00000000*/ private bool bVelChange[65537];
var(*) /*0x3FF20000-0x00000000*/ private bool bCauseFracture[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewSphere[524289];

// Export URB_RadialImpulseComponent::execFireImpulse(FFrame&, void* const)
native function FireImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];


}
