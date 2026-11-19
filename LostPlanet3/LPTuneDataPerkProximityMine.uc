class LPTuneDataPerkProximityMine extends LPTuneDataPerkBeaconBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA7890000-0x00000400*/ private editfixedsize @NULL BlastDamageMultiplier[589825];
var(0.25_Pct) /*0xA7890000-0x00000400*/ private editfixedsize @NULL BlastRadiusMultiplier[589825];
var(0.25_Pct) /*0xA7890000-0x00000400*/ private editfixedsize @NULL UseAlternateExplosion[589825];
var(0.25_Pct) /*0xA7890000-0x00000400*/ private editfixedsize array AlternateExplosions[589825];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL ProximityGuideParticleSystem[65537];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL ValidColor[65537];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL InvalidColor[65537];
var(0.25_Pct) /*0x15010000-0x00000400*/ private editfixedsize @NULL PrimerDuration[589825];
var(0.25_Pct) /*0x15010000-0x00000000*/ private @NULL PrimerSoundCue[65537];
var(0.25_Pct) /*0x15010000-0x00000400*/ private editfixedsize @NULL LaunchDuration[589825];
var(0.25_Pct) /*0x15010000-0x00000000*/ private @NULL LaunchSoundCue[65537];
var(0.25_Pct) /*0x15010000-0x00000000*/ private @NULL LaunchParticleSystem[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.BlastDamageMultiplierA'
    begin object name=BlastDamageMultiplierA class=Class'LPFloatUpgrade'
        baseValue=1.0000000
    end object
    BlastDamageMultiplier=BlastDamageMultiplierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.BlastRadiusMultiplierA'
    begin object name=BlastRadiusMultiplierA class=Class'LPFloatUpgrade'
        baseValue=1.0000000
    end object
    BlastRadiusMultiplier=BlastRadiusMultiplierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.UseAlternateExplosionA'
    begin object name=UseAlternateExplosionA class=Class'LPFloatUpgrade'
        baseValue=-1.0000000
    end object
    UseAlternateExplosion=UseAlternateExplosionA
    ValidColor=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    InvalidColor=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.PrimerDurationA'
    begin object name=PrimerDurationA class=Class'LPFloatUpgrade'
        baseValue=0.3000000
    end object
    PrimerDuration=PrimerDurationA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.LaunchDurationA'
    begin object name=LaunchDurationA class=Class'LPFloatUpgrade'
        baseValue=0.2500000
    end object
    LaunchDuration=LaunchDurationA
    bDrawDebugExplosionRadius=true
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPExplosion'Default__LPTuneDataPerkProximityMine.LPExplosionB'
    begin object name=LPExplosionB class=Class'LPExplosion'
    end object
    ExplosionTemplate=LPExplosionB
    ExplosionOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
    SinkDepth=15
    SinkRate=20
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProximityMine.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProximityMine.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProximityMine.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProximityMine.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProximityMine.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProximityMine.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    DPADAssignmentSlot=1
    MaxCountInPersonalInventory=2
    MaxCountInWorld=4
    bPurchasableInShop=true
    OwningPerkClass=Class'LPPerkProximityMine'
    // Reference: LPShopInterface'Default__LPTuneDataPerkProximityMine.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}