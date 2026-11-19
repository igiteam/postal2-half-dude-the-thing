class LPTuneDataWeaponAssaultRifle extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

defaultproperties
{
    AimDelay=(X=0.5000000,Y=0.8000000)
    AIAfterFiringDelay=(X=1.0000000,Y=1.5000000)
    bUseAccuracyConeDistance=true
    AccuracyConeDistanceMin=(X=10.0000000,Y=20.0000000)
    AccuracyConeDistanceMax=(X=90.0000000,Y=120.0000000)
    SafetyConeDistanceMin=(X=1.0000000,Y=10.0000000)
    SafetyConeDistanceMax=(X=75.0000000,Y=90.0000000)
    BurstFireCount=(X=3.0000000,Y=4.0000000)
    BurstFireDelayBetweenShots=0.2000000
    BurstFireDelay=(X=0.5000000,Y=0.7500000)
    FiringCooldownTime=3.0000000
    RangeShort=500.0000000
    RangeMedium=1000.0000000
    RangeLong=2500.0000000
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    bHasShellEjectEmitter=true
    bMuzFlashEmitterIsLooping=true
    // Reference: PointLightComponent'Default__LPTuneDataWeaponAssaultRifle.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponAssaultRifle.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponAssaultRifle.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}