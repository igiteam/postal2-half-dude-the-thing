/*****************************************************************
 * HammerWeapon - .
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class HammerWeapon extends DOTZMeleeWeapon
    config(user);

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    AltFireAnimName="HammerAltFire"
    PawnAnimationPackage="DOTZAHumans.3PHammer"
    FireAnimName="HammerFire"
    StandIdleAnimName="HammerStandIdle"
    CrouchIdleAnimName="HammerCrouchIdle"
    HitAnimName="HammerHit"
    OfficialName="Hammer"
    AmmoName=Class'HammerAmmunition'
    PickupClass=Class'HammerPickup'
    AttachmentClass=Class'HammerAttachment'
    ItemName="Hammer"
    Mesh=SkeletalMesh'DOTZAWeapons.hammer'
}