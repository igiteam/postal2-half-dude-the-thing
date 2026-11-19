/*****************************************************************
 * GrenadeAmmunition -
 *
 * @version 1.0
 * @author  Jesse (jesse@digitalextremes.com)
 * @date    Nov 2003
 * description this class is for the simple weapon
 *****************************************************************
 */

class GrenadeAmmunition extends DOTZAmmunitionBase;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    MaxAmmo=5
    ProjectileClass=Class'GrenadeProjectile'
    MyDamageType=Class'DOTZEngine.DOTZBulletDamage'
    PickupClass=Class'GrenadePickup'
}