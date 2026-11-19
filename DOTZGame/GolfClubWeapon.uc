/*****************************************************************
 * GolfClubWeapon - .
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class GolfClubWeapon extends DOTZMeleeWeapon
    config(user);

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    StdTraceDist=200
    AltTraceDist=200
    AltFireAnimName="GolfClubAltFire"
    PawnAnimationPackage="DOTZAHumans.3PGolfClub"
    FireAnimName="GolfClubFire"
    StandIdleAnimName="GolfClubStandIdle"
    CrouchIdleAnimName="GolfClubCrouchIdle"
    HitAnimName="GolfClubHit"
    OfficialName="Golf Club"
    AmmoName=Class'GolfClubAmmunition'
    PickupClass=Class'GolfClubPickup'
    AttachmentClass=Class'GolfClubAttachment'
    ItemName="Golf Club"
    Mesh=SkeletalMesh'DOTZAWeapons.GolfClub'
}