class LPTuneDataUnloadedAmmoInfo extends SPTuneDataShopItem
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA7FC0000-0x00000000*/ private editfixedsize string WeaponContentClassName[65537];
var(0.25_Pct) /*0xA7FC0000-0x00000000*/ private @NULL UnloadedWeaponInfo[65537];
var(0.25_Pct) /*0xA7FC0000-0x00000000*/ private @NULL AmmoTypeTuneData[65537];
var(0.25_Pct) /*0xA7FC0000-0x00000000*/ private const editfixedsize string AmmoTypeString[65537];

function CanPurchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x12
    if(UnloadedWeaponInfo == none)
    {
        return 3;
    }
    // End:0x60
    if(!LPPlayerController(InController).IsWeaponUnlocked_ByContentClassName(UnloadedWeaponInfo.contentClassName))
    {
        return 3;
    }
    return 0;
    //return ReturnValue;    
}

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];

    LPPlayerController(InController).GiveAmmoType(AmmoTypeString, 0, Quantity, 2, true);
    //return;    
}

defaultproperties
{
    WeaponContentClassName="SET ME"
    // Reference: LPShopInterface'Default__LPTuneDataUnloadedAmmoInfo.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}