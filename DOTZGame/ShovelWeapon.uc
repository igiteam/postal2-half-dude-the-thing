/*****************************************************************
 * ShovelWeapon - a pseudo-weapon for throwing grenades by hand.
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class ShovelWeapon extends DOTZMeleeWeapon
    config(user);

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    StdTraceDist=150
    AltTraceDist=150
    AltFireAnimName="ShovelAltFire"
    PawnAnimationPackage="DOTZAHumans.3PShovel"
    FireAnimName="ShovelFire"
    StandIdleAnimName="ShovelStandIdle"
    CrouchIdleAnimName="ShovelCrouchIdle"
    HitAnimName="ShovelHit"
    OfficialName="Shovel"
    AmmoName=Class'ShovelAmmunition'
    PickupClass=Class'ShovelPickup'
    AttachmentClass=Class'ShovelAttachment'
    ItemName="Shovel"
    Mesh=SkeletalMesh'DOTZAWeapons.shovel'
}