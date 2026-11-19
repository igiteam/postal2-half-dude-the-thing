class LPAnimNotify_GlowBoss extends LPAnimNotify_Glow
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EBossGlowPart
{
    EBGP_LeftTube,                  // 0
    EBGP_RightTube,                 // 1
    EBGP_AllTubes,                  // 2
    EBGP_Body,                      // 3
    EBGP_MAX                        // 4
};

var(0.25_Pct) /*0x7BFA0000-0x00000000*/ private byte GlowPart[65537];
var(0.25_Pct) /*0x7BFA0000-0x00000000*/ private float GlowFactor[65537];
var(0.25_Pct) /*0x7BFA0000-0x00000000*/ private float GlowRampRate[65537];
