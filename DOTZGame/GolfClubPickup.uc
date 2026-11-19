/*****************************************************************
 * GolfClubPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class GolfClubPickup extends DOTZWeaponPickup
      placeable;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the golf club"
    MaxDesireability=0.7500000
    InventoryType=Class'GolfClubWeapon'
    PickupMessage="You got the golf club"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Melee.GolfClub'
}