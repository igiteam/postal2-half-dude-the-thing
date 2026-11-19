class LPTuneDataVSUpgrade_ThermalEnergyAbsorber extends LPTuneDataUpgradeBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0xCAD70000-0x00000000*/ private @NULL EffectiveRange[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSUpgrade_ThermalEnergyAbsorber.Range0'
    begin object name=Range0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EffectiveRange=Range0
    // Reference: LPShopInterface'Default__LPTuneDataVSUpgrade_ThermalEnergyAbsorber.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}