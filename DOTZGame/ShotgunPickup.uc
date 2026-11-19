/*****************************************************************
 * ShotgunPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class ShotgunPickup extends DOTZWeaponPickup
      placeable;


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    WeaponType="'"
    ActionPickupMessage="Press Action to take the shotgun"
    MaxDesireability=0.7500000
    InventoryType=Class'ShotgunWeapon'
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Ranged.shotgun'
}