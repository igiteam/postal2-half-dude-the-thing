class LPTuneDataPerkAbilityBase extends LPTuneDataPerkBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x00ED0000-0x00000400*/ private editfixedsize @NULL CapacityCost[589825];

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI, Perk;

    // End:0x11
    if(!bPurchasableInShop)
    {
        return;
    }
    super(SPTuneDataShopItem).PurchasedBy(InController, Quantity);
    PRI = LPPRI(InController.PlayerReplicationInfo);
    // End:0x95
    if((PRI == none) || PRI.PerksManager == none)
    {
        return;
    }
    Perk = PRI.PerksManager.QueryPerkInstance(OwningPerkClass.default.PerkIndex);
    // End:0x102
    if(Perk == none)
    {
        return;
    }
    //return;    
}

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAbilityBase.CapacityCostA'
    begin object name=CapacityCostA class=Class'LPFloatUpgrade'
        baseValue=25.0000000
    end object
    CapacityCost=CapacityCostA
    // Reference: LPShopInterface'Default__LPTuneDataPerkAbilityBase.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}