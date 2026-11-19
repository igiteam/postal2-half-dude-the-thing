class MP5WeaponReloadable extends MP5Weapon;

///////////////////////////////////////////////////////////////////////////////
// Just like in Eternal Damnation
///////////////////////////////////////////////////////////////////////////////
function ServerFire()
{
	// Don't allow holding LMB to fire in Burst and Semi
	if (FireMode == FM_Semi || FireMode == FM_Burst)
        Instigator.Controller.bFire = 0;
	
	Super(EDWeapon).ServerFire();
}


// Decompiled with UE Explorer.
defaultproperties
{
    bThreeStageFire=true
    bDisableDualWielding=true
    bReloadableWeapon=true
    bAllowReloadHints=true
    ReloadCount=30
    GroupOffset=3
    PickupClass=Class'MP5PickupReloadable'
}