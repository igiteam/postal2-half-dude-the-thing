class LPTuneDataPerkChaingunTurret extends LPTuneDataPerkBeaconBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x1F800000-0x00000000*/ private class TurretClass[65537];
var(0.25_Pct) /*0x1F800000-0x00000400*/ private editfixedsize @NULL FiringArc[589825];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL ProximityGuideParticleSystem[65537];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL ValidColor[65537];
var(0.25_Pct) /*0xA7860000-0x00000000*/ private @NULL InvalidColor[65537];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private int RepairRate[65537];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private float MinRepairPitchAngle[65537];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private float MinRepairYawAngle[65537];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private float MinRepairDistance[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.FiringArcA'
    begin object name=FiringArcA class=Class'LPFloatUpgrade'
        baseValue=90.0000000
    end object
    FiringArc=FiringArcA
    ValidColor=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    InvalidColor=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    RepairRate=80
    MinRepairPitchAngle=45.0000000
    MinRepairYawAngle=45.0000000
    MinRepairDistance=600.0000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkChaingunTurret.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkChaingunTurret.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkChaingunTurret.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkChaingunTurret.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkChaingunTurret.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkChaingunTurret.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    DPADAssignmentSlot=3
    MaxCountInPersonalInventory=1
    MaxCountInWorld=2
    bPurchasableInShop=true
    OwningPerkClass=Class'LPPerkChaingunTurret'
    // Reference: LPShopInterface'Default__LPTuneDataPerkChaingunTurret.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}