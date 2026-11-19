/*****************************************************************
 * RevolverPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class RevolverPickup extends DOTZWeaponPickup
      placeable;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the Revolver"
    MaxDesireability=0.7500000
    InventoryType=Class'RevolverWeapon'
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Ranged.Revolver'
}