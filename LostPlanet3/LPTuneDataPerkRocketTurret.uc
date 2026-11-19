class LPTuneDataPerkRocketTurret extends LPTuneDataPerkBeaconBase
    editinlinenew
    hidecategories(Object,Object,EMP);

var(0.25_Pct) /*0xAE2C0000-0x00000000*/ private class TurretClass[65537];
var(0.25_Pct) /*0xAE2C0000-0x00000400*/ private editfixedsize @NULL FiringArc[589825];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL ProximityGuideParticleSystem[65537];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL ValidColor[65537];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL InvalidColor[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.FiringArcA'
    begin object name=FiringArcA class=Class'LPFloatUpgrade'
        baseValue=90.0000000
    end object
    FiringArc=FiringArcA
    ValidColor=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    InvalidColor=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkRocketTurret.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkRocketTurret.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkRocketTurret.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkRocketTurret.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkRocketTurret.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkRocketTurret.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    DPADAssignmentSlot=3
    MaxCountInPersonalInventory=1
    MaxCountInWorld=2
    bPurchasableInShop=true
    OwningPerkClass=Class'LPPerkRocketTurret'
    // Reference: LPShopInterface'Default__LPTuneDataPerkRocketTurret.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}