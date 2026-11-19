class LPTuneDataPerkSquadSpawn extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A040000-0x00000000*/ private @NULL MinimumWeaponDischargeTime[65537];
var(0.25_Pct) /*0x8A040000-0x00000000*/ private @NULL MinimumDamageInflictionTime[65537];
var(0.25_Pct) /*0x8A040000-0x00000000*/ private @NULL MinimumEnemyDistance[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkSquadSpawn.Discharge0'
    begin object name=Discharge0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinimumWeaponDischargeTime=Discharge0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkSquadSpawn.Damage0'
    begin object name=Damage0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinimumDamageInflictionTime=Damage0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkSquadSpawn.EnemyRadius0'
    begin object name=EnemyRadius0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinimumEnemyDistance=EnemyRadius0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkSquadSpawn.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkSquadSpawn'
    // Reference: LPShopInterface'Default__LPTuneDataPerkSquadSpawn.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}