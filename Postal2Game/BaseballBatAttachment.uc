class BaseballBatAttachment extends AW7WeaponAttachment;

simulated event ThirdPersonEffects()
{
	// have pawn play firing anim
	if ( Instigator != None )
	{
		if (BaseballBatWeapon(Instigator.Weapon).bAltFiring)
			Instigator.PlayFiring(1.0, FiringMode);
		else
			Instigator.PlayFiring(1.25, FiringMode);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'BaseballBatWeapon'
    FiringMode="BASEBALLBAT1"
    DrawType=8
    StaticMesh=StaticMesh'AW7EDMesh.Weapons.TP_BaseballBat'
    Skins[0]=Texture'ED_WeaponSkins.Melee.WoodenBat'
}