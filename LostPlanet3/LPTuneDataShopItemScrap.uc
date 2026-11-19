class LPTuneDataShopItemScrap extends SPTuneDataShopItem
    hidecategories(Object,Object);

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];

    LPPlayerController(InController).AddScrap(Quantity);
    //return;    
}

defaultproperties
{
    // Reference: LPShopInterface'Default__LPTuneDataShopItemScrap.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}