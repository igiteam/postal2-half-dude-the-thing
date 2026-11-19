/*****************************************************************
 * BaseBallBatWeapon -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class BaseBallBatWeapon extends DOTZMeleeWeapon
    config(user);

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    StdTraceDist=200
    AltTraceDist=200
    AltFireAnimName="BaseBallBatAltFire"
    PawnAnimationPackage="DOTZAHumans.3PBaseBallBat"
    FireAnimName="BaseBallBatFire"
    StandIdleAnimName="BaseBallBatStandIdle"
    CrouchIdleAnimName="BaseBallBatCrouchIdle"
    HitAnimName="BaseBallHit"
    OfficialName="Baseball Bat"
    AmmoName=Class'BaseBallBatAmmunition'
    PickupClass=Class'BaseBallBatPickup'
    AttachmentClass=Class'BaseBallBatAttachment'
    ItemName="Baseball Bat"
    Mesh=SkeletalMesh'DOTZAWeapons.Baseballbat'
}