/*****************************************************************
 * MolotovAmmunition -
 *
 * @version 1.0
 * @author  Jesse (jesse@digitalextremes.com)
 * @date    Nov 2003
 * description this class is for the simple weapon
 *****************************************************************
 */

class MolotovAmmunition extends DOTZAmmunitionBase;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    MaxAmmo=10
    ProjectileClass=Class'MolotovProjectile'
    MyDamageType=Class'DOTZEngine.DOTZBulletDamage'
    PickupClass=Class'MolotovPickup'
}