///////////////////////////////////////////////////////////////////////////////
// Machete attachment for 3rd person
///////////////////////////////////////////////////////////////////////////////
class MacheteAttachment extends P2WeaponAttachment;

simulated event ThirdPersonEffects()
{
	// have pawn play firing anim
	if ( Instigator != None )
	{
		Instigator.PlayFiring(1.5, FiringMode);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'MacheteWeapon'
    FiringMode="SHOVEL1"
    DrawType=8
    StaticMesh=StaticMesh'AWWeaponStatic.Weapons.Machete_2'
}