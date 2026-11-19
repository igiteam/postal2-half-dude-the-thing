/*****************************************************************
 * SniperPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class SniperPickup extends DOTZWeaponPickup
      placeable;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the Sniper Rifle"
    MaxDesireability=0.7500000
    InventoryType=Class'SniperWeapon'
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Ranged.SniperRifle'
}