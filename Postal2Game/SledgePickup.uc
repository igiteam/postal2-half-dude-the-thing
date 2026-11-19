class SledgePickup extends P2BloodWeaponPickup;
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
    BounceSound=Sound'AWSoundFX.Sledge.hammerhitground'
    ZombieSearchFreq=0.3000000
    InventoryType=Class'SledgeWeapon'
    PickupMessage="You picked up a Sledgehammer."
    DrawType=8
    StaticMesh=StaticMesh'AWWeaponStatic.Weapons.Sledge_1'
}