class LPTuneDataPerkBiotoxMine extends LPTuneDataPerkProximityMine
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x11730000-0x00000000*/ private class CloudObjectClass[65537];
var(0.25_Pct) /*0x11730000-0x00000400*/ private editfixedsize @NULL CloudDuration[589825];
var(0.25_Pct) /*0x11730000-0x00000400*/ private editfixedsize @NULL CloudRadius[589825];
var(0.25_Pct) /*0x11730000-0x00000000*/ private float CloudHeight[65537];
var(0.25_Pct) /*0x11730000-0x00000000*/ private float DamageInitialDelay[65537];
var(0.25_Pct) /*0x11730000-0x00000000*/ private float DamageUpdateRate[65537];
var(0.25_Pct) /*0x11730000-0x00000000*/ private float DamagePerSecond[65537];
var(0.25_Pct) /*0x11730000-0x00000000*/ private bool bDamageIncappedEnemies[65537];
var(0.25_Pct) /*0x11730000-0x00000000*/ private @NULL CloudSound[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.CloudDurationA'
    begin object name=CloudDurationA class=Class'LPFloatUpgrade'
        baseValue=8.0000000
    end object
    CloudDuration=CloudDurationA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.CloudRadiusA'
    begin object name=CloudRadiusA class=Class'LPFloatUpgrade'
        baseValue=500.0000000
    end object
    CloudRadius=CloudRadiusA
    CloudHeight=120.0000000
    DamageInitialDelay=0.4000000
    DamageUpdateRate=0.8000000
    DamagePerSecond=30.0000000
    bDamageIncappedEnemies=true
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.BlastDamageMultiplierA'
    begin object name=BlastDamageMultiplierA
    end object
    BlastDamageMultiplier=BlastDamageMultiplierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.BlastRadiusMultiplierA'
    begin object name=BlastRadiusMultiplierA
    end object
    BlastRadiusMultiplier=BlastRadiusMultiplierA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.UseAlternateExplosionA'
    begin object name=UseAlternateExplosionA
    end object
    UseAlternateExplosion=UseAlternateExplosionA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.PrimerDurationA'
    begin object name=PrimerDurationA class=Class'LPFloatUpgrade'
    end object
    PrimerDuration=PrimerDurationA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.LaunchDurationA'
    begin object name=LaunchDurationA class=Class'LPFloatUpgrade'
    end object
    LaunchDuration=LaunchDurationA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPExplosion'Default__LPTuneDataPerkBiotoxMine.LPExplosionB'
    begin object name=LPExplosionB
    end object
    ExplosionTemplate=LPExplosionB
    ExplosionOffset=(X=0.0000000,Y=0.0000000,Z=32.0000000)
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkBiotoxMine.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBiotoxMine.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBiotoxMine.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBiotoxMine.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBiotoxMine.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkBiotoxMine.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    bPurchasableInShop=false
    OwningPerkClass=Class'LPPerkBiotoxMine'
    // Reference: LPShopInterface'Default__LPTuneDataPerkBiotoxMine.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}