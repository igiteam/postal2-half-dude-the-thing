class LPDamageTypeFragGrenade extends LPDamageType;

defaultproperties
{
    bCausesExplosiveReactions=true
    SingleSubjectMessage="DeathMessage_GrenadedSingle"
    DualSubjectMessage="DeathMessage_GrenadedDual"
    WeaponIcon="mpnotifyicon_grenade"
    DeathSoundEventName="DeathExplosion"
    bPlayHitEffects=false
    bIsConcussive=true
    KDamageImpulse=1000.0000000
    KDeathUpKick=200.0000000
    RadialDamageImpulse=750.0000000
}