/*****************************************************************
 * FireAxeWeapon - .
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class FireAxeWeapon extends DOTZMeleeWeapon
    config(user);

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    StdTraceDist=150
    AltTraceDist=150
    AltFireAnimName="FireAxeAltFire"
    PawnAnimationPackage="DOTZAHumans.3PFireAxe"
    FireAnimName="FireAxeFire"
    StandIdleAnimName="FireAxeStandIdle"
    CrouchIdleAnimName="FireAxeCrouchIdle"
    HitAnimName="FireAxeHit"
    OfficialName="Fire Axe"
    AmmoName=Class'FireAxeAmmunition'
    PickupClass=Class'FireAxePickup'
    AttachmentClass=Class'FireAxeAttachment'
    ItemName="Fire Axe"
    Mesh=SkeletalMesh'DOTZAWeapons.FireAxe'
}