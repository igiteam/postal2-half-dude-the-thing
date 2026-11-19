/*****************************************************************
 * LeadPipePickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    June 2004
 *****************************************************************
 */
class LeadPipePickup extends DOTZWeaponPickup
      placeable;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the lead pipe"
    MaxDesireability=0.7500000
    InventoryType=Class'LeadPipeWeapon'
    PickupMessage="You got the lead pipe"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Melee.LeadPipe'
}