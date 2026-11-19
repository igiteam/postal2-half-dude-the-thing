///////////////////////////////////////////////////////////////////////////////
// Shovel attachment for 3rd person
///////////////////////////////////////////////////////////////////////////////
class ShovelAttachment extends P2WeaponAttachment;

simulated event ThirdPersonEffects()
{
	// have pawn play firing anim
	if ( Instigator != None )
	{
		if (ShovelWeapon(Instigator.Weapon).bAltFiring)
			Instigator.PlayFiring(2.0, FiringMode);
		else
			Instigator.PlayFiring(1.5, FiringMode);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'ShovelWeapon'
    FiringMode="SHOVEL1"
    DrawType=8
    StaticMesh=StaticMesh'TP_Weapons.Shovel3'
}