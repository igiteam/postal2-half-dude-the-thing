/*****************************************************************
 * RevolverAttachment -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Nov 2003
 *****************************************************************
 */
class RevolverAttachment extends AdvancedWeaponAttachment;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ThirdPersonMuzzleFlashClass=Class'BBParticles.BBPRevolverMuzzleFlash'
    TraceEmitterClass=Class'BBParticles.BBPLightTracer'
    FireSound=Sound'DOTZXWeapons.Mixdown.MixdownRangedRevolverShoot'
    Mesh=SkeletalMesh'DOTZA3rdPersonWeapons.3PRevolver'
}