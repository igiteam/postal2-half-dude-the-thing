class LPTuneDataPerkThermalPadding extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xC77E0000-0x00000400*/ private editfixedsize @NULL RegenRateIncrease[589825];
var(0.25_Pct) /*0xC77E0000-0x00000400*/ private editfixedsize @NULL RegenDelayDecrease[589825];
var(0.25_Pct) /*0xC77E0000-0x00000400*/ private editfixedsize @NULL IncapacitatedHealthIncrease[589825];
var(0.25_Pct) /*0xC77E0000-0x00000400*/ private editfixedsize @NULL BleedOutModifier[589825];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkThermalPadding.RegenRateIncreaseA'
    begin object name=RegenRateIncreaseA class=Class'LPFloatUpgrade'
        baseValue=150.0000000
    end object
    RegenRateIncrease=RegenRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkThermalPadding.RegenDelayDecreaseA'
    begin object name=RegenDelayDecreaseA class=Class'LPFloatUpgrade'
        baseValue=30.0000000
    end object
    RegenDelayDecrease=RegenDelayDecreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkThermalPadding.IncapacitatedHealthIncreaseA'
    begin object name=IncapacitatedHealthIncreaseA class=Class'LPFloatUpgrade'
        baseValue=50.0000000
    end object
    IncapacitatedHealthIncrease=IncapacitatedHealthIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkThermalPadding.BleedOutModifierA'
    begin object name=BleedOutModifierA class=Class'LPFloatUpgrade'
        baseValue=50.0000000
    end object
    BleedOutModifier=BleedOutModifierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkThermalPadding.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkThermalPadding'
    // Reference: LPShopInterface'Default__LPTuneDataPerkThermalPadding.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}