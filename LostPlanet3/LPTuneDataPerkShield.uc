class LPTuneDataPerkShield extends LPTuneDataPerkBeaconBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x65FC0000-0x00000400*/ private editfixedsize @NULL ShieldHealth[589825];
var(0.25_Pct) /*0x0E370000-0x00000400*/ private editfixedsize array ShieldDamageFilterInfo[65537];
var(0.25_Pct) /*0xB79A0000-0x00000000*/ private @NULL OperatingSoundCue[65537];
var(0.25_Pct) /*0xB79A0000-0x00000000*/ private @NULL ClosingSoundCue[65537];

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.ShieldHealthA'
    begin object name=ShieldHealthA class=Class'LPFloatUpgrade'
        baseValue=220.0000000
    end object
    ShieldHealth=ShieldHealthA
    OperatingSoundCue=SoundCue'GLO_SND_Tools.TENG_Shield.TENG_Shield_Loop_Cue'
    ClosingSoundCue=SoundCue'GLO_SND_Tools.TENG_Shield.Deployable_Shield_Close_Cue'
    bDrawDebugExplosionRadius=true
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.AcceptFriendly0'
    begin object name=AcceptFriendly0
    end object
    AcceptFriendlyFireFlag=AcceptFriendly0
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.HealthA'
    begin object name=HealthA
    end object
    Health=HealthA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.DeploymentCostA'
    begin object name=DeploymentCostA
    end object
    DeploymentCost=DeploymentCostA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.DeploymentTimeA'
    begin object name=DeploymentTimeA
    end object
    DeploymentTime=DeploymentTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.DeploymentRateIncreaseA'
    begin object name=DeploymentRateIncreaseA
    end object
    DeploymentRateIncrease=DeploymentRateIncreaseA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.MaxNumberDeployedA'
    begin object name=MaxNumberDeployedA
    end object
    MaxNumberDeployed=MaxNumberDeployedA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.CooldownTimeA'
    begin object name=CooldownTimeA
    end object
    CooldownTime=CooldownTimeA
    // Reference: LPExplosion'Default__LPTuneDataPerkShield.LPExplosionC'
    begin object name=LPExplosionC class=Class'LPExplosion'
    end object
    ExplosionTemplate=LPExplosionC
    SinkDepth=15
    SinkRate=20
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.RadiusA'
    begin object name=RadiusA
    end object
    Radius=RadiusA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.BeaconLifetimeA'
    begin object name=BeaconLifetimeA
    end object
    BeaconLifetime=BeaconLifetimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkShield.EMPDisruptionDurationA'
    begin object name=EMPDisruptionDurationA
    end object
    EMPDisruptionDuration=EMPDisruptionDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkShield.HackTimeInSecondsA'
    begin object name=HackTimeInSecondsA
    end object
    HackTimeInSeconds=HackTimeInSecondsA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkShield.MinHackDistanceA'
    begin object name=MinHackDistanceA
    end object
    MinHackDistance=MinHackDistanceA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkShield.MinHackPitchAngleA'
    begin object name=MinHackPitchAngleA
    end object
    MinHackPitchAngle=MinHackPitchAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkShield.MinHackYawAngleA'
    begin object name=MinHackYawAngleA
    end object
    MinHackYawAngle=MinHackYawAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPerkShield.MinHackHeightToleranceA'
    begin object name=MinHackHeightToleranceA
    end object
    MinHackHeightTolerance=MinHackHeightToleranceA
    OwningPerkClass=Class'LPPerkShield'
    // Reference: LPShopInterface'Default__LPTuneDataPerkShield.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}