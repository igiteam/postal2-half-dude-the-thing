class LPTuneDataTurretRocket extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

defaultproperties
{
    FireModes=(FireInterval=3.0000000)
    bHasMuzzleFlashLight=true
    // Reference: PointLightComponent'Default__LPTuneDataTurretRocket.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataTurretRocket.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataTurretRocket.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}