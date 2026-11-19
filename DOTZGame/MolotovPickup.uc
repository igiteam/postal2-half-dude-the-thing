/*****************************************************************
 * MolotovPickup -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class MolotovPickup extends DOTZGrenadePickup
      placeable;

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    FullAmmoMessage="Can't carry more molotov cocktails"
    GrenadeAmmunitionClass=Class'MolotovAmmunition'
    ActionPickupMessage="Press Action to take the Molotov Cocktail"
    InventoryType=Class'MolotovWeapon'
    PickupMessage="You got the Molotov"
    StaticMesh=StaticMesh'DOTZSWeapons.Ranged.MolotovCocktail'
}