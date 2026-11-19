/*****************************************************************
 * RevolverWeapon -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class RevolverWeapon extends DOTZGunWeapon
    config(user);


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    PawnAnimationPackage="DOTZAHumans.3PRevolver"
    FireAnimName="RevolverFire"
    StandIdleAnimName="RevolverStandIdle"
    CrouchIdleAnimName="RevolverCrouchIdle"
    HitAnimName="RevolverHit"
    WeaponMode=1
    MuzzleFlashEmitterClass=Class'BBParticles.BBPRevolverMuzzleFlash'
    EffectiveRange=3000
    iInaccuracyDelta=2.0000000
    HitSpread=128.0000000
    AimedOffset=(X=-23.0000000,Y=-19.0000000,Z=5.0000000)
    OfficialName="Revolver"
    AmmoName=Class'RevolverAmmunition'
    PickupAmmoCount=6
    ReloadCount=6
    AutoSwitchPriority=3
    InventoryGroup=3
    PickupClass=Class'RevolverPickup'
    AttachmentClass=Class'RevolverAttachment'
    ItemName="Revolver"
    Mesh=SkeletalMesh'DOTZAWeapons.Revolver'
}