class LPTuneDataPerkAmmoPack extends LPTuneDataPerkBeaconBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x058E0000-0x00000000*/ private float PulseRateAmmo[65537];
var(0.25_Pct) /*0x058E0000-0x00000000*/ private float PulseRateGrenades[65537];
var(0.25_Pct) /*0x058E0000-0x00000400*/ private editfixedsize @NULL PulseRateMultiplier[589825];
var(0.25_Pct) /*0x058E0000-0x00000000*/ private float ParticleSystemRadius[65537];
var(0.25_Pct) /*0x058E0000-0x00000000*/ private float ParticleTeamColorIntensity[65537];
var(0.25_Pct) /*0x058E0000-0x00000000*/ private @NULL DeployCue[65537];
var(0.25_Pct) /*0x058E0000-0x00000000*/ private @NULL DestroyCue[65537];
var(0.25_Pct) /*0x058E0000-0x00000000*/ private @NULL PulseCue[65537];

defaultproperties
{
    PulseRateAmmo=3.0000000
    PulseRateGrenades=6.0000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.PulseRateMultiplierA'
    begin object name=PulseRateMultiplierA class=Class'LPFloatUpgrade'
        baseValue=1.0000000
    end object
    PulseRateMultiplier=PulseRateMultiplierA
    ParticleSystemRadius=500.0000000
    ParticleTeamColorIntensity=3.0000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPExplosion'Default__LPTuneDataPerkAmmoPack.LPExplosionB'
    begin object name=LPExplosionB class=Class'LPExplosion'
    end object
    ExplosionTemplate=LPExplosionB
    SinkDepth=10
    SinkRate=20
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    DeploymentVelocity=1500.0000000
    DeploymentSocket="GrenadeSocket"
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkAmmoPack.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkAmmoPack.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkAmmoPack.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkAmmoPack.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkAmmoPack.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkAmmoPack.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    OwningPerkClass=Class'LPPerkAmmoPack'
    // Reference: LPShopInterface'Default__LPTuneDataPerkAmmoPack.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}