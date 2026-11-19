class LPAmmoTypeDefault extends SPInventoryAmmoType;

function SynchronizeTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609], AmmoTypeTuneData;

    super.SynchronizeTo(OwnerWeapon, AmmoTypeTuneData);
    //return;    
}

function ReplenishAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL AmmoTypeTuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoLeft[8388609], ReturnValue, AmmoToAdd;

    // End:0x11
    if(AmmoLeft == 0)
    {
        return 0;
    }
    AmmoToAdd = Min(LPTuneDataAmmoDefault(AmmoTypeTuneData).AmmoPerSecond, AmmoLeft);
    return AddAmmo(AmmoTypeTuneData, 0, AmmoToAdd);
    //return ReturnValue;    
}

function FullyReplenishAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL AmmoTypeTuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return AddAmmo(AmmoTypeTuneData, 0, -1, true);
    //return ReturnValue;    
}
