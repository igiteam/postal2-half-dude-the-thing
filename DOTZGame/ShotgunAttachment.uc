/*****************************************************************
 * ShotgunAttachment -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Nov 2003
 *****************************************************************
 */
class ShotgunAttachment extends AdvancedWeaponAttachment;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ThirdPersonMuzzleFlashClass=Class'BBParticles.BBPShotgunMuzzleFlash'
    FireSound=Sound'DOTZXWeapons.Mixdown.MixdownRangedShotgunShoot'
    Mesh=SkeletalMesh'DOTZA3rdPersonWeapons.3PShotgun'
}