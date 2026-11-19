class LPTuneDataPerkCreditBooster extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x28A70000-0x00000400*/ private editfixedsize @NULL CreditMultiplier[589825];
var(0.25_Pct) /*0x28A70000-0x00000400*/ private editfixedsize @NULL CreditRoundingInterval[589825];
var(0.25_Pct) /*0x28A70000-0x00000400*/ private editfixedsize @NULL CreditBonus[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkCreditBooster.CreditMultiplierA'
    begin object name=CreditMultiplierA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CreditMultiplier=CreditMultiplierA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkCreditBooster.CreditRoundingIntervalA'
    begin object name=CreditRoundingIntervalA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CreditRoundingInterval=CreditRoundingIntervalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkCreditBooster.CreditBonusA'
    begin object name=CreditBonusA class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CreditBonus=CreditBonusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkCreditBooster.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    // Reference: LPShopInterface'Default__LPTuneDataPerkCreditBooster.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}