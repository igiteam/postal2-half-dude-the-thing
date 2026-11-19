/*****************************************************************
 * ShovelPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class BaseBallBatPickup extends DOTZWeaponPickup
      placeable;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the bat"
    MaxDesireability=0.7500000
    InventoryType=Class'BaseBallBatWeapon'
    PickupMessage="You got the baseball bat"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Melee.Baseballbat'
}