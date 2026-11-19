/*****************************************************************
 * ShovelPickup - 
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class ShovelPickup extends DOTZWeaponPickup
      placeable;

/*
auto state Pickup{
   function DoEquip(actor Other){

      local Inventory grenammo;

      //can't pick up grenade pickup if you are full of grenades
      Grenammo = Level.GetLocalPlayerController().Pawn.
         FindInventoryType(class'HGWeapons.GrenadeAmmunition');
      if (Ammunition(Grenammo).AmmoAmount == Ammunition(GrenAmmo).MaxAmmo){
         return;
      }
   Super.DoEquip(Other);
   }

}
*/


//===========================================================================
// DefaultProperties
//===========================================================================


//    bLightChanged=True
//    Level=LevelInfo'myLevel.LevelInfo0'
//    Region=(Zone=LevelInfo'myLevel.LevelInfo0',iLeaf=130,ZoneNumber=1)
//    Tag="StaticMeshActor"
//    PhysicsVolume=DefaultPhysicsVolume'myLevel.DefaultPhysicsVolume3'
//    Location=(X=432.000000,Y=-128.000000)
//    ColLocation=(X=432.000000,Y=-128.000000)
//    bSelected=True


// Decompiled with UE Explorer.
defaultproperties
{
    ActionPickupMessage="Press Action to take the shovel"
    MaxDesireability=0.7500000
    InventoryType=Class'ShovelWeapon'
    PickupMessage="You got the shovel"
    DrawType=8
    StaticMesh=StaticMesh'DOTZSWeapons.Melee.shovel'
}