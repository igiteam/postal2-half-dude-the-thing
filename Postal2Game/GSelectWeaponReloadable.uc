class GSelectWeaponReloadable extends GSelectWeapon;

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
    bDisableDualWielding=true
    bReloadableWeapon=true
    bAllowReloadHints=true
    ReloadCount=17
    GroupOffset=3
    PickupClass=Class'GSelectPickupReloadable'
}