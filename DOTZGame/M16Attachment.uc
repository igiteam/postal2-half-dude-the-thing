/*****************************************************************
 * M16Attachment -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Nov 2003
 *****************************************************************
 */
class M16Attachment extends AdvancedWeaponAttachment;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ThirdPersonMuzzleFlashClass=Class'BBParticles.BBPM16MuzzleFlash'
    TraceEmitterClass=Class'BBParticles.BBPMediumTracer'
    FireSound=Sound'DOTZXWeapons.Ranged.RangedM16Shoot'
    Mesh=SkeletalMesh'DOTZA3rdPersonWeapons.3PM16'
}