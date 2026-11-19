/*****************************************************************
 * LightAmmunition -
 *
 * @version 1.0
 * @author  Jesse (jesse@digitalextremes.com)
 * @date    Nov 2003
 * description this class is for the simple weapon
 *****************************************************************
 */

class M16Ammunition extends DOTZAmmunitionBase;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=18
    ImpactFlesh=Class'BBParticles.BBPImpactFlesh'
    MaxAmmo=80
    bInstantHit=true
    MyDamageType=Class'DOTZEngine.DOTZBigBulletDamage'
}