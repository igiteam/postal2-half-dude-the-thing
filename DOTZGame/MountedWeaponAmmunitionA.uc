/*****************************************************************
 * MountedWeaponAmmunitionA -
 *
 * @version 1.0
 * @author  Jesse (jesse@digitalextremes.com)
 * @date    Nov 2003
 * description this class is for the simple weapon
 *****************************************************************
 */

class MountedWeaponAmmunitionA extends DOTZAmmunitionBase;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=25
    ImpactFlesh=Class'BBParticles.BBPImpactFlesh'
    ImpactMetal=Class'BBParticles.BBPMinigunImpactMetal'
    ImpactRock=Class'BBParticles.BBPMinigunImpactRock'
    ImpactWater=Class'BBParticles.BBPMinigunImpactWater'
    MaxAmmo=80
    bInstantHit=true
    MyDamageType=Class'DOTZEngine.DOTZBigBulletDamage'
}