class LPTuneDataPerkRevival extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

struct RecoveryParams
{
    var(0.25_Pct) /*0xAA7C0000-0x00000400*/ private editfixedsize @NULL HealthRestoreRatePerSecond[589825];
    var(0.25_Pct) /*0xAA7C0000-0x00000400*/ private editfixedsize @NULL HealthRestoredValueOnCompletion[589825];
    var(0.25_Pct) /*0xAA7C0000-0x00000400*/ private editfixedsize @NULL ThermalEnergyRewardOnCompletion[589825];

    structdefaultproperties
    {
        HealthRestoreRatePerSecond=none
        HealthRestoredValueOnCompletion=none
        ThermalEnergyRewardOnCompletion=none
    }
};

var(0.25_Pct) /*0xAA7C0000-0x00000400*/ private editfixedsize array RecoveryParameters[65537];

defaultproperties
{
    RecoveryParameters=/* Array type was not detected. */
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRevival.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkRevival'
    // Reference: LPShopInterface'Default__LPTuneDataPerkRevival.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}