class LPTuneDataPerkTechnician extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A060000-0x00000400*/ private editfixedsize @NULL DeploymentTimeDecrease[589825];
var(0.25_Pct) /*0x8A060000-0x00000400*/ private editfixedsize @NULL CooldownTimeDecrease[589825];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkTechnician.DeploymentTimeDecreaseA'
    begin object name=DeploymentTimeDecreaseA class=Class'LPFloatUpgrade'
        baseValue=15.0000000
    end object
    DeploymentTimeDecrease=DeploymentTimeDecreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkTechnician.CooldownTimeDecreaseA'
    begin object name=CooldownTimeDecreaseA class=Class'LPFloatUpgrade'
        baseValue=15.0000000
    end object
    CooldownTimeDecrease=CooldownTimeDecreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkTechnician.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    // Reference: LPShopInterface'Default__LPTuneDataPerkTechnician.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}