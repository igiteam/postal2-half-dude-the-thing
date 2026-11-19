///////////////////////////////////////////////////////////////////////////////
// FlamePickup
// By: Kamek (kamek@postalleague.com)
// For: Eternal Damnation
//
// Pickup for the flamethrower.
// Currently using the "RWS Ozone Spray" aerosol can. I recommend we use this
// as the third person actor and re-skin the can using that "Stynx" stuff.
// The tazer third person anims work pretty well for the can here.
///////////////////////////////////////////////////////////////////////////////

class FlamePickup extends P2WeaponPickup;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=100
    DeadNPCAmmoGiveRange=(Min=10.0000000,Max=80.0000000)
    MPAmmoGiveCount=100
    InventoryType=Class'FlameWeapon'
    PickupMessage="You picked up a can of Stynx."
    DrawType=8
    StaticMesh=StaticMesh'ED_TPMeshes.WeaponPickups.PU_Flamethrower'
}