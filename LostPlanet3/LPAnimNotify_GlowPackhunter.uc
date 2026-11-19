class LPAnimNotify_GlowPackhunter extends LPAnimNotify_Glow
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EPHGlowPart
{
    PHG_Tail,                       // 0
    PHG_Head,                       // 1
    PHG_MAX                         // 2
};

var(0.25_Pct) /*0x7BFC0000-0x00000000*/ private byte GlowPart[65537];
var(0.25_Pct) /*0x7BFC0000-0x00000000*/ private float GlowFactor[65537];
var(0.25_Pct) /*0x7BFC0000-0x00000000*/ private float GlowRampRate[65537];
