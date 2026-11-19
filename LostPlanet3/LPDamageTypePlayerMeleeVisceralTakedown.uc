class LPDamageTypePlayerMeleeVisceralTakedown extends LPDamageTypePlayerMelee;

defaultproperties
{
    bAlternateDamageTypeOnVSBlock=false
    bAllowMomentumTransfer=false
    bAllowMomentumTransferForPof=false
    bAllowMomentumTransferForVS=false
    bAllowPlayerIncapacitation=false
    SingleSubjectMessage="DeathMessage_MeleeVisceralSingle"
    DualSubjectMessage="DeathMessage_MeleeVisceralDual"
    bPlayHitReaction=false
    bPlayHitEffects=false
    bIgnoreCover=true
    HitReactionSpecialMove=none
    bArmorStops=false
    bExtraMomentumZ=false
    bCausesFracture=false
    KDamageImpulse=0.0000000
}