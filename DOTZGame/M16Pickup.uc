/*****************************************************************
 * M16Pickup -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class M16Pickup extends DOTZWeaponPickup
      placeable;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    WeaponType="'"
    ActionPickupMessage="Press Action to take the M16"
    MaxDesireability=0.7500000
    InventoryType=Class'M16Weapon'
    PickupMessage="You got the M16"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Ranged.M16'
}