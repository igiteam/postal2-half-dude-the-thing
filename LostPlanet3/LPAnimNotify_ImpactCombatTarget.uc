class LPAnimNotify_ImpactCombatTarget extends AnimNotify
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EImpactTargetOverride
{
    eitoDefault,                    // 0
    eitoSelf,                       // 1
    EImpactTargetOverride_MAX       // 2
};

var(0.25_Pct) /*0x7C010000-0x00000000*/ private name ImpactSocket[65537];
var(0.25_Pct) /*0x7C010000-0x00000000*/ private float ImpactRadius[65537];
var(0.25_Pct) /*0x7C010000-0x00000000*/ private class DamageTypeToApply[65537];
var(0.25_Pct) /*0x7C010000-0x00000000*/ private byte ImpactTargetOverride[65537];

defaultproperties
{
    ImpactRadius=50.0000000
}