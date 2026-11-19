/*****************************************************************
 * LeadPipeWeapon - .
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class LeadPipeWeapon extends DOTZMeleeWeapon
    config(user);

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    StdTraceDist=150
    AltTraceDist=150
    AltFireAnimName="LeadPipeAltFire"
    PawnAnimationPackage="DOTZAHumans.3PLeadPipe"
    FireAnimName="LeadPipeFire"
    StandIdleAnimName="LeadPipeStandIdle"
    CrouchIdleAnimName="LeadPipeCrouchIdle"
    HitAnimName="LeadPipeHit"
    OfficialName="Lead Pipe"
    AmmoName=Class'LeadPipeAmmunition'
    PickupClass=Class'LeadPipePickup'
    AttachmentClass=Class'LeadPipeAttachment'
    ItemName="Lead Pipe"
    Mesh=SkeletalMesh'DOTZAWeapons.LeadPipe'
}