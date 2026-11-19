class LPTuneDataWeaponRocketLauncher extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

defaultproperties
{
    StatesToUseOffHandIK=/* Array type was not detected. */
    FireModes=(FireInterval=3.0000000)
    bHasMuzzleFlashLight=true
    // Reference: PointLightComponent'Default__LPTuneDataWeaponRocketLauncher.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponRocketLauncher.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponRocketLauncher.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}