class LPTuneDataPerkNoxiousDemise extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x99930000-0x00000000*/ private class CloudObjectClass[65537];
var(0.25_Pct) /*0x99930000-0x00000400*/ private editfixedsize @NULL CloudDuration[589825];
var(0.25_Pct) /*0x99930000-0x00000400*/ private editfixedsize @NULL CloudRadius[589825];
var(0.25_Pct) /*0x99930000-0x00000000*/ private float CloudHeight[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private float SmokeLifespan[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private float DissipateTime[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private float DamageInitialDelay[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private float DamageUpdateRate[65537];
var(0.25_Pct) /*0x99930000-0x00000400*/ private editfixedsize @NULL DamagePerSecond[589825];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bDamageIncappedEnemies[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bSpawnCloudOnTapOut[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bSpawnCloudOnBleedOut[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bSpawnCloudOnHeadshot[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bSpawnCloudOnSuicide[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bSpawnCloudOnOverkill[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private bool bDebugDrawDamageRadius[65537];
var(0.25_Pct) /*0x99930000-0x00000000*/ private @NULL ActivateSound[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNoxiousDemise.CloudDurationA'
    begin object name=CloudDurationA class=Class'LPFloatUpgrade'
        baseValue=8.0000000
    end object
    CloudDuration=CloudDurationA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNoxiousDemise.CloudRadiusA'
    begin object name=CloudRadiusA class=Class'LPFloatUpgrade'
        baseValue=400.0000000
    end object
    CloudRadius=CloudRadiusA
    CloudHeight=120.0000000
    SmokeLifespan=2.5000000
    DissipateTime=0.8000000
    DamageInitialDelay=0.4000000
    DamageUpdateRate=0.8000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNoxiousDemise.DamagePerSecondA'
    begin object name=DamagePerSecondA class=Class'LPFloatUpgrade'
        baseValue=15.0000000
    end object
    DamagePerSecond=DamagePerSecondA
    bDamageIncappedEnemies=true
    bSpawnCloudOnTapOut=true
    bSpawnCloudOnBleedOut=true
    bSpawnCloudOnHeadshot=true
    bSpawnCloudOnSuicide=true
    bSpawnCloudOnOverkill=true
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkNoxiousDemise.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkNoxiousDemise'
    // Reference: LPShopInterface'Default__LPTuneDataPerkNoxiousDemise.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}