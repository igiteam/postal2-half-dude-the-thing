class ScythePickup extends P2BloodWeaponPickup;
// Added by Man Chrzan: xPatch 2.0
var bool bForceSwitch;

// Force switching to this weapon.
function inventory SpawnCopy( pawn Other )
{
	local inventory Copy;

	Copy = Super.SpawnCopy(Other);
	
	if(bForceSwitch)
		P2Player(Other.Controller).PickupThrownWeapon(Copy.InventoryGroup, Copy.GroupOffset, true);
		
	return Copy;
}
// End


// Decompiled with UE Explorer.
defaultproperties
{
    BounceSound=Sound'AWSoundFX.Scythe.scythehitground'
    ZombieSearchFreq=0.3000000
    InventoryType=Class'ScytheWeapon'
    PickupMessage="You picked up a Scythe."
    DrawType=8
    StaticMesh=StaticMesh'AWWeaponStatic.Weapons.Scythe_1'
}