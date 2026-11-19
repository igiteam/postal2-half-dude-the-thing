class LPTuneDataPerkProtoHarmonizer extends LPTuneDataPerkBeaconBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA77B0000-0x00000400*/ private editfixedsize @NULL RegenRateIncrease[589825];
var(0.25_Pct) /*0xA77B0000-0x00000400*/ private editfixedsize @NULL RegenDelayDecrease[589825];
var(0.25_Pct) /*0xA77B0000-0x00000400*/ private editfixedsize @NULL BleedOutModifier[589825];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private name PlayerFXEventBinding[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private @NULL HarmonizeFXTemplate[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private @NULL RadiusFXTemplate[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private name RadiusFXSocket[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private float RadiusFXBaseRadius[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private float RadiusFXHeightScale[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private @NULL BeamFXTemplate[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private name BeamFXSourceSocket[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private name BeamFXTargetSocket[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private @NULL DeploySoundCue[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private @NULL DestroySoundCue[65537];
var(0.25_Pct) /*0xA77B0000-0x00000000*/ private @NULL HarmonizeLoopingSoundCue[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.RegenRateIncreaseA'
    begin object name=RegenRateIncreaseA class=Class'LPFloatUpgrade'
        baseValue=500.0000000
    end object
    RegenRateIncrease=RegenRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.RegenDelayDecreaseA'
    begin object name=RegenDelayDecreaseA class=Class'LPFloatUpgrade'
    end object
    RegenDelayDecrease=RegenDelayDecreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.BleedOutModifierA'
    begin object name=BleedOutModifierA class=Class'LPFloatUpgrade'
        baseValue=50.0000000
    end object
    BleedOutModifier=BleedOutModifierA
    RadiusFXBaseRadius=500.0000000
    RadiusFXHeightScale=1.0000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPExplosion'Default__LPTuneDataPerkProtoHarmonizer.LPExplosionB'
    begin object name=LPExplosionB class=Class'LPExplosion'
    end object
    ExplosionTemplate=LPExplosionB
    SinkDepth=10
    SinkRate=20
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    DeploymentVelocity=1500.0000000
    DeploymentSocket="GrenadeSocket"
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkProtoHarmonizer.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProtoHarmonizer.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProtoHarmonizer.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProtoHarmonizer.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProtoHarmonizer.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkProtoHarmonizer.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    OwningPerkClass=Class'LPPerkProtoHarmonizer'
    // Reference: LPShopInterface'Default__LPTuneDataPerkProtoHarmonizer.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}