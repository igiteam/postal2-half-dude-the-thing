class LPTuneDataPerkRepair extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xD0A60000-0x00000400*/ private editfixedsize @NULL GlobalRepairRateModifier[589825];
var(0.25_Pct) /*0x523F0000-0x00000400*/ private editfixedsize @NULL RepairRateIncrease[589825];
var(0.25_Pct) /*0x523F0000-0x00000400*/ private editfixedsize @NULL EMPNeutralizeRate[589825];
var(0.25_Pct) /*0x523F0000-0x00000400*/ private editfixedsize @NULL StatusViewAngle[589825];
var(0.25_Pct) /*0x523F0000-0x00000400*/ private editfixedsize @NULL StatusViewRange[589825];
var(0.25_Pct) /*0x523F0000-0x00000000*/ private bool bViewNeutralStatus[65537];
var(0.25_Pct) /*0x523F0000-0x00000000*/ private bool bViewEnemyStatus[65537];
var(0.25_Pct) /*0x523F0000-0x00000000*/ private float HealthBarCheckUpdateRate[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRepair.GlobalRepairRateModifierA'
    begin object name=GlobalRepairRateModifierA class=Class'LPFloatUpgrade'
        baseValue=25.0000000
    end object
    GlobalRepairRateModifier=GlobalRepairRateModifierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRepair.RepairRateIncreaseA'
    begin object name=RepairRateIncreaseA class=Class'LPFloatUpgrade'
        baseValue=50.0000000
    end object
    RepairRateIncrease=RepairRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRepair.EMPNeutralizeRateA'
    begin object name=EMPNeutralizeRateA class=Class'LPFloatUpgrade'
        baseValue=10.0000000
    end object
    EMPNeutralizeRate=EMPNeutralizeRateA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRepair.StatusViewAngleA'
    begin object name=StatusViewAngleA class=Class'LPFloatUpgrade'
        baseValue=15.0000000
    end object
    StatusViewAngle=StatusViewAngleA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRepair.StatusViewRangeA'
    begin object name=StatusViewRangeA class=Class'LPFloatUpgrade'
        baseValue=3000.0000000
    end object
    StatusViewRange=StatusViewRangeA
    bViewNeutralStatus=true
    bViewEnemyStatus=true
    HealthBarCheckUpdateRate=0.2000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRepair.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkRepair'
    // Reference: LPShopInterface'Default__LPTuneDataPerkRepair.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}