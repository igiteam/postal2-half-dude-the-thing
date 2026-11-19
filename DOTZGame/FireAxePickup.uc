/*****************************************************************
 * FireAxePickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class FireAxePickup extends DOTZWeaponPickup
      placeable;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the fire axe"
    MaxDesireability=0.7500000
    InventoryType=Class'FireAxeWeapon'
    PickupMessage="You got the fire axe"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Melee.FireAxe'
}