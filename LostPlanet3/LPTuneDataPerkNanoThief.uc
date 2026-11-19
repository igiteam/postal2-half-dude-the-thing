class LPTuneDataPerkNanoThief extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x966F0000-0x00000400*/ private editfixedsize @NULL HackSpeedMultiplier[589825];
var(0.25_Pct) /*0x966F0000-0x00000400*/ private editfixedsize @NULL HackDistanceBonus[589825];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNanoThief.HackSpeedMultiplierA'
    begin object name=HackSpeedMultiplierA class=Class'LPFloatUpgrade'
        baseValue=1.0000000
    end object
    HackSpeedMultiplier=HackSpeedMultiplierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNanoThief.HackDistanceBonusA'
    begin object name=HackDistanceBonusA class=Class'LPFloatUpgrade'
    end object
    HackDistanceBonus=HackDistanceBonusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNanoThief.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkNanoThief'
    // Reference: LPShopInterface'Default__LPTuneDataPerkNanoThief.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}