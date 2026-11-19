//=============================================================
//   Axe
//   Eternal Damnation
//   MaDJacKaL
//=============================================================
class AxeAttachment extends P2WeaponAttachment;

simulated event ThirdPersonEffects()
{
	// have pawn play firing anim
	if ( Instigator != None )
		Instigator.PlayFiring(1.5, FiringMode);
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'AxeWeapon'
    FireSound=Sound'EDWeaponSounds.Weapons.Meatcleaver_slash'
    FiringMode="BATON1"
    DrawType=8
    StaticMesh=StaticMesh'AW7Mesh.Weapons.TP_Axe'
}