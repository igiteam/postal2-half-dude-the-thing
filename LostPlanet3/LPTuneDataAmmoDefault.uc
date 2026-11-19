class LPTuneDataAmmoDefault extends SPTuneDataBaseAmmo
    hidecategories(Object,Object);

var(0.25_Pct) /*0xD3C60000-0x00000000*/ private int AmmoPerSecond[65537];
var(0.25_Pct) /*0x05950000-0x00000000*/ private int AmmoPerPulse[65537];
var(0.25_Pct) /*0x05950000-0x00000000*/ private int StartingAmmoPackHolds[65537];
var(0.25_Pct) /*0x05950000-0x00000000*/ private bool bAmmoPackReplenishesMagazine[65537];
var(0.25_Pct) /*0xD0BE0000-0x00000000*/ private name UnlockName[65537];
var(0.25_Pct) /*0x05770000-0x00000400*/ private editfixedsize @NULL UpgradableMaxAmmoForWeapon[589825];

function GetMaxAmmoForWeapon()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x33
    if(UpgradableMaxAmmoForWeapon != none)
    {
        return int(UpgradableMaxAmmoForWeapon.GetValue(none, true));
    }
    return super.GetMaxAmmoForWeapon();
    //return ReturnValue;    
}

defaultproperties
{
    AmmoPerSecond=30
    AmmoPerPulse=30
    StartingAmmoPackHolds=500
    AmmoContainerClass=Class'LPAmmoTypeDefault'
    LocationalDamageParts=/* Array type was not detected. */
}