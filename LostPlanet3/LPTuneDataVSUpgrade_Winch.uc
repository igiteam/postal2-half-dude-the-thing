class LPTuneDataVSUpgrade_Winch extends LPTuneDataUpgradeBase
    hidecategories(Object,Object);

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    // End:0x4E
    foreach InController.DynamicActors(Class'LPVSPlayerPawn', VS)
    {
        VS.AddWinch();        
    }    
    //return;    
}

defaultproperties
{
    // Reference: LPShopInterface'Default__LPTuneDataVSUpgrade_Winch.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}