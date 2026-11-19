class LPTuneDataUnloadedGrenadeAmmoInfo extends LPTuneDataUnloadedAmmoInfo
    hidecategories(Object,Object);

function CanPurchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x37
    if(LPPlayerController(InController).IsWeaponUnlocked_ByContentClassName(WeaponContentClassName))
    {
        return 4;
    }
    return 0;
    //return ReturnValue;    
}

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];

    // End:0x82
    if(UnloadedWeaponInfo != none)
    {
        UnloadedWeaponInfo.PurchasedBy(InController, Quantity);
        LPPlayerController(InController).GiveAmmoType(AmmoTypeString, 0, Quantity, 2,, true);        
    }
    //return;    
}

defaultproperties
{
    // Reference: LPShopInterface'Default__LPTuneDataUnloadedGrenadeAmmoInfo.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}