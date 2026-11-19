class LPAnimNotify_GlowFireWasp extends LPAnimNotify_Glow
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EGlowPart
{
    EGP_StomachTail,                // 0
    EGP_Mouth,                      // 1
    EGP_Legs,                       // 2
    EGP_Head,                       // 3
    EGP_Wings,                      // 4
    EGP_MAX                         // 5
};

var(0.25_Pct) /*0x7BFB0000-0x00000000*/ private byte GlowPart[65537];
var(0.25_Pct) /*0x7BFB0000-0x00000000*/ private float GlowFactor[65537];
var(0.25_Pct) /*0x7BFB0000-0x00000000*/ private float GlowRampRate[65537];
