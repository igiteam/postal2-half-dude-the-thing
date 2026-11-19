class LPTuneDataPerkBeaconBase extends LPTuneDataPerkBase
    editinlinenew
    hidecategories(Object,Object);

enum EBeaconType
{
    EBeaconType_Auto,               // 0
    EBeaconType_Manual,             // 1
    EBeaconType_MAX                 // 2
};

struct native HackPlaybackAnimationInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLooped;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayBackRate;

    structdefaultproperties
    {
        AnimName="None"
        bLooped=false
        PlayBackRate=1.0000000
    }
};

var(0.25_Pct) /*0x0E370000-0x00000000*/ private byte Type[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private bool bTeamAllegiance[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private bool bDrawDebugExplosionRadius[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private bool bDisplayEnemyMeshTeamID[65537];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL AcceptFriendlyFireFlag[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL Health[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL DeploymentCost[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL DeploymentTime[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL DeploymentRateIncrease[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL MaxNumberDeployed[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL CooldownTime[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize array DamageFilterInfo[65537];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL ExplosionTemplate[589825];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private @NULL ExplosionOffset[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private int SinkDepth[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private int SinkRate[65537];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL Radius[589825];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private class BeaconObjectClass[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private float DeploymentVelocity[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private name DeploymentSocket[65537];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize @NULL BeaconLifetime[589825];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private class PlayerDeploySpecialMove[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private @NULL GhostOffsetFromPlayer[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private float MaximumHeightDeltaForPlacement[65537];
var(0.25_Pct) /*0xA7920000-0x00000000*/ private class ProxyTotem[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private @NULL GhostedMeshComponent[65537];
var(0.25_Pct) /*0x0E370000-0x00000000*/ private @NULL TeamID_PhysMaterial[65537];
var(0.25_Pct) /*0x50620000-0x00000400*/ private editfixedsize @NULL EMPDisruptionDuration[589825];
var(0.25_Pct) /*0x50620000-0x00000000*/ private @NULL EMPParticleSystem[65537];
var(0.25_Pct) /*0x50620000-0x00000000*/ private @NULL EMPSoundCue[65537];
var(0.25_Pct) /*0x64210000-0x00000400*/ private editfixedsize @NULL HackTimeInSeconds[589825];
var(0.25_Pct) /*0x64210000-0x00000400*/ private editfixedsize @NULL MinHackDistance[589825];
var(0.25_Pct) /*0x64210000-0x00000400*/ private editfixedsize @NULL MinHackPitchAngle[589825];
var(0.25_Pct) /*0x64210000-0x00000400*/ private editfixedsize @NULL MinHackYawAngle[589825];
var(0.25_Pct) /*0x64210000-0x00000400*/ private editfixedsize @NULL MinHackHeightTolerance[589825];
var(0.25_Pct) /*0x64210000-0x00000000*/ private @NULL PrepareHack[65537];
var(0.25_Pct) /*0x64210000-0x00000000*/ private @NULL OperateHack[65537];
var(0.25_Pct) /*0x64210000-0x00000000*/ private @NULL CompleteHack[65537];
var(0.25_Pct) /*0x64210000-0x00000000*/ private @NULL AbortHack[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private int DPADAssignmentSlot[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private @NULL TuneDataTotemAmmo[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private int MaxCountInPersonalInventory[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private int MaxCountInWorld[65537];

defaultproperties
{
    bTeamAllegiance=true
    bDisplayEnemyMeshTeamID=true
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.AcceptFriendly0'
    begin object name=AcceptFriendly0 class=Class'LPFloatUpgrade'
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.HealthA'
    begin object name=HealthA class=Class'LPFloatUpgrade'
        baseValue=100.0000000
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.DeploymentCostA'
    begin object name=DeploymentCostA class=Class'LPFloatUpgrade'
        baseValue=25.0000000
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.DeploymentTimeA'
    begin object name=DeploymentTimeA class=Class'LPFloatUpgrade'
        baseValue=3.0000000
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA class=Class'LPFloatUpgrade'
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA class=Class'LPFloatUpgrade'
        baseValue=1.0000000
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.CooldownTimeA'
    begin object name=CooldownTimeA class=Class'LPFloatUpgrade'
        baseValue=5.0000000
    end object
    CooldownTime=CooldownTimeA
    ExplosionOffset=(X=0.0000000,Y=0.0000000,Z=32.0000000)
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.RadiusA'
    begin object name=RadiusA class=Class'LPFloatUpgrade'
        baseValue=30.0000000
    end object
    Radius=RadiusA
    DeploymentSocket="PropSocket"
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.BeaconLifetimeA'
    begin object name=BeaconLifetimeA class=Class'LPFloatUpgrade'
        baseValue=30.0000000
    end object
    BeaconLifetime=BeaconLifetimeA
    GhostOffsetFromPlayer=(X=80.0000000,Y=0.0000000,Z=80.0000000)
    MaximumHeightDeltaForPlacement=100.0000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBeaconBase.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA class=Class'LPFloatUpgrade'
        baseValue=15.0000000
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBeaconBase.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBeaconBase.MinHackDistanceA'
    begin object name=MinHackDistanceA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBeaconBase.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=180.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBeaconBase.MinHackYawAngleA'
    begin object name=MinHackYawAngleA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=180.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBeaconBase.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    PrepareHack=(AnimName="CHA_PlayerPast_TPost_connect_Core",bLooped=false,PlayBackRate=1.0000000)
    OperateHack=(AnimName="CHA_PlayerPast_TPost_loop_Core",bLooped=true,PlayBackRate=1.0000000)
    CompleteHack=(AnimName="CHA_PlayerPast_TPose_disconnect_Core",bLooped=false,PlayBackRate=1.0000000)
    AbortHack=(AnimName="CHA_PlayerPast_TPose_disconnect_Core",bLooped=false,PlayBackRate=1.0000000)
    DPADAssignmentSlot=-1
    // Reference: LPShopInterface'Default__LPTuneDataPerkBeaconBase.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}