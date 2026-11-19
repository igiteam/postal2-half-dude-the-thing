/*****************************************************************
 * GlockWeapon -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class GlockWeapon extends DOTZGunWeapon
    config(user);


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    PawnAnimationPackage="DOTZAHumans.3PGlock"
    FireAnimName="GlockFire"
    StandIdleAnimName="GlockStandIdle"
    CrouchIdleAnimName="GlockCrouchIdle"
    HitAnimName="GlockHit"
    WeaponMode=1
    TraceEmitterClass=Class'BBParticles.BBPLightTracer'
    MuzzleFlashEmitterClass=Class'BBParticles.BBPGlockMuzzleFlash'
    EffectiveRange=3000
    iInaccuracyDelta=2.0000000
    HitSpread=128.0000000
    AimedOffset=(X=-9.0000000,Y=-3.0000000,Z=-1.0000000)
    OfficialName="Glock"
    AmmoName=Class'GlockAmmunition'
    PickupAmmoCount=12
    ReloadCount=12
    AutoSwitchPriority=4
    InventoryGroup=4
    PickupClass=Class'GlockPickup'
    AttachmentClass=Class'GlockAttachment'
    ItemName="Glock"
    Mesh=SkeletalMesh'DOTZAWeapons.Glock'
}