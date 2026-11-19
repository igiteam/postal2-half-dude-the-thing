/*****************************************************************
 * HammerPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class HammerPickup extends DOTZWeaponPickup
      placeable;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the hammer"
    MaxDesireability=0.7500000
    InventoryType=Class'HammerWeapon'
    PickupMessage="You got the hammer"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Melee.hammer'
}