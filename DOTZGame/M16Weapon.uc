/*****************************************************************
 * M16Weapon -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class M16Weapon extends DOTZGunWeapon
    config(user);


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    PawnAnimationPackage="DOTZAHumans.3PM16"
    FireAnimName="M16Fire"
    StandIdleAnimName="M16StandIdle"
    CrouchIdleAnimName="M16CrouchIdle"
    HitAnimName="M16Hit"
    MuzzleFlashEmitterClass=Class'BBParticles.BBPM16MuzzleFlash'
    EffectiveRange=3000
    HitSpread=192.0000000
    AimedOffset=(X=-9.0000000,Y=-8.0000000,Z=-1.0000000)
    AimedFOV=30
    OfficialName="M-16"
    AmmoName=Class'M16Ammunition'
    PickupAmmoCount=30
    ReloadCount=30
    AutoSwitchPriority=7
    InventoryGroup=7
    PickupClass=Class'M16Pickup'
    AttachmentClass=Class'M16Attachment'
    ItemName="M16"
    Mesh=SkeletalMesh'DOTZAWeapons.M16'
}