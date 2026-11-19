class LPTuneDataWeaponUpgradePThrower extends LPTuneDataWeaponUpgrade
    hidecategories(Object,Object);

var(0.25_Pct) /*0x9F000000-0x00000400*/ private editfixedsize @NULL OverheatSpeedOverride[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponUpgradePThrower.OverheatSpeedOverrideObject'
    begin object name=OverheatSpeedOverrideObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=14.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OverheatSpeedOverride=OverheatSpeedOverrideObject
    // Reference: LPShopInterface'Default__LPTuneDataWeaponUpgradePThrower.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}