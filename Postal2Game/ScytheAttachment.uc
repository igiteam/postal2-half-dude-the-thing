///////////////////////////////////////////////////////////////////////////////
// Scythe attachment for 3rd person
///////////////////////////////////////////////////////////////////////////////
class ScytheAttachment extends P2WeaponAttachment;

simulated event ThirdPersonEffects()
{
	// have pawn play firing anim
	if ( Instigator != None )
		Instigator.PlayFiring(2.0, FiringMode);
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'ScytheWeapon'
    FiringMode="SHOVEL1"
    DrawType=8
    StaticMesh=StaticMesh'AWWeaponStatic.Weapons.Scythe_2'
}