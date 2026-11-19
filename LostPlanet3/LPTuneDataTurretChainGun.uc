class LPTuneDataTurretChainGun extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

defaultproperties
{
    FireModes=(FireInterval=0.0700000)
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    bMuzFlashEmitterIsLooping=true
    // Reference: PointLightComponent'Default__LPTuneDataTurretChainGun.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataTurretChainGun.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataTurretChainGun.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}