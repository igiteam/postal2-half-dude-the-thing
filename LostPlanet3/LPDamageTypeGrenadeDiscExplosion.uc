class LPDamageTypeGrenadeDiscExplosion extends LPDamageTypeBallistic;

defaultproperties
{
    bCausesExplosiveReactions=true
    SingleSubjectMessage="DeathMessage_GrenadeDiscSingle"
    DualSubjectMessage="DeathMessage_GrenadeDiscDual"
    bAdditiveHitReaction=true
    bPlayHitEffects=false
    bIsConcussive=true
    bExtraMomentumZ=false
    KDamageImpulse=500.0000000
    KDeathUpKick=100.0000000
    RadialDamageImpulse=500.0000000
}