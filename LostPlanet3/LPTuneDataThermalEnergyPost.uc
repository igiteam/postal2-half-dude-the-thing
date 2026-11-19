class LPTuneDataThermalEnergyPost extends SPEngineTuneDataBase
    hidecategories(Object,Object);

struct DamageStateParticleStruct
{
    var(0.25_Pct) /*0x2AB20000-0x00000000*/ private int HealthRemainingThreshold[65537];
    var(0.25_Pct) /*0x2AB20000-0x00000000*/ private name SocketName[65537];
    var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL DamageParticleSystem[65537];

    structdefaultproperties
    {
        HealthRemainingThreshold=0
        SocketName="None"
        DamageParticleSystem=none
    }
};

var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqOpenHold[65537];
var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqClosedHold[65537];
var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqClosing[65537];
var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqOpening[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private int Health[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private @NULL ExplosionSound[65537];
var(0.25_Pct) /*0x2AEA0000-0x00000400*/ private editfixedsize array DamageFilterInfo[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private float UnstableTime[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private float InflationRateModifier[65537];
var(0.25_Pct) /*0xCAF90000-0x00000400*/ private editfixedsize @NULL PostExplosionTemplate[589825];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private @NULL ExtractionEndedCue[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private float TEnergyPointExchangeRate[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private float TEnergyPersonalExchangeRate[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private float EnergyTransferRatePerSecond[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private @NULL ExtractionParticleSystem[65537];
var(0.25_Pct) /*0x74780000-0x00000000*/ private @NULL ExtractionLensFlare[65537];
var(0.25_Pct) /*0x74780000-0x00000000*/ private name ExtractionLensFlareSocketName[65537];
var(0.25_Pct) /*0x74780000-0x00000000*/ private bool bUseTeamColorForLensFlare[65537];
var(0.25_Pct) /*0xCAF90000-0x00000400*/ private editfixedsize array DamageParticleSystems[65537];
var(0.25_Pct) /*0xC9910000-0x00000000*/ private float DistanceThresholdForEnergyAbsorbtion[65537];
var(0.25_Pct) /*0x0BCB0000-0x00000000*/ private float MaximumBatteryCapacity[65537];
var(0.25_Pct) /*0x50620000-0x00000400*/ private editfixedsize @NULL EMPDisruptionDuration[589825];
var(0.25_Pct) /*0x50620000-0x00000000*/ private @NULL EMPParticleSystem[65537];
var(0.25_Pct) /*0x50620000-0x00000000*/ private @NULL EMPSoundCue[65537];
var(0.25_Pct) /*0xCAF90000-0x00000000*/ private float DistanceToRevealGhosted[65537];

defaultproperties
{
    Health=200
    UnstableTime=10.0000000
    InflationRateModifier=0.5000000
    TEnergyPointExchangeRate=0.1000000
    TEnergyPersonalExchangeRate=0.1000000
    EnergyTransferRatePerSecond=5.0000000
    bUseTeamColorForLensFlare=true
    DistanceThresholdForEnergyAbsorbtion=800.0000000
    MaximumBatteryCapacity=1000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataThermalEnergyPost.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    DistanceToRevealGhosted=300.0000000
}