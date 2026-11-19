class LPDamageType extends SPInventoryDamageType;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlternateDamageTypeOnVSBlock;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowMomentumTransfer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowMomentumTransferForPof;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowMomentumTransferForVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCausesEMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleModeDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayDeathAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayDeathAnimOnIncapped;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOverrideAdditiveHitReaction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseInstigatorLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowPlayerIncapacitation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayHitDetectionSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCausesExplosiveReactions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SingleSubjectMessage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DualSubjectMessage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DeathSoundEventName;

defaultproperties
{
    bAlternateDamageTypeOnVSBlock=true
    bAllowMomentumTransfer=true
    bAllowMomentumTransferForPof=true
    bAllowMomentumTransferForVS=true
    bPlayDeathAnim=true
    bOverrideAdditiveHitReaction=true
    bUseInstigatorLocation=true
    bAllowPlayerIncapacitation=true
    bPlayHitDetectionSound=true
    SingleSubjectMessage="DeathMessage_KilledSingle"
    DualSubjectMessage="DeathMessage_KilledDual"
    HitReactionSpecialMove=Class'LPSM_DirectionalHitReaction'
    bCausesFracture=true
}