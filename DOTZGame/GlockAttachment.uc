/*****************************************************************
 * GlockAttachment -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Nov 2003
 *****************************************************************
 */
class GlockAttachment extends AdvancedWeaponAttachment;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ThirdPersonMuzzleFlashClass=Class'BBParticles.BBPGlockMuzzleFlash'
    TraceEmitterClass=Class'BBParticles.BBPLightTracer'
    FireSound=Sound'DOTZXWeapons.Ranged.RangedGlockShoot'
    Mesh=SkeletalMesh'DOTZA3rdPersonWeapons.3PGlock'
}