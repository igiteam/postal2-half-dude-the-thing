/*****************************************************************
 * RifleWeapon -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class RifleWeapon extends DOTZGunWeapon
    config(user);


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    PawnAnimationPackage="DOTZAHumans.3P22Rifle"
    FireAnimName="22RifleFire"
    StandIdleAnimName="22RifleStandIdle"
    CrouchIdleAnimName="22RifleCrouchIdle"
    HitAnimName="22RifleHit"
    WeaponMode=1
    MuzzleFlashEmitterClass=Class'BBParticles.BBP22RifleMuzzleFlash'
    EffectiveRange=4500
    HitSpread=192.0000000
    AimedOffset=(X=-9.0000000,Y=-3.0000000,Z=-1.0000000)
    AimedFOV=30
    OfficialName=".22 Rifle"
    AmmoName=Class'RifleAmmunition'
    PickupAmmoCount=4
    ReloadCount=4
    AutoSwitchPriority=2
    InventoryGroup=2
    PickupClass=Class'RiflePickup'
    AttachmentClass=Class'RifleAttachment'
    ItemName="Rifle"
    Mesh=SkeletalMesh'DOTZAWeapons.22Rifle'
}