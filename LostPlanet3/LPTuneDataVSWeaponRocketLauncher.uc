class LPTuneDataVSWeaponRocketLauncher extends LPTuneDataBaseVSWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline,VSAmmoReplenishment,Camera,FlashLight,Tracer);

defaultproperties
{
    AccuracyConeAngleMax=(X=10.0000000,Y=10.0000000)
    BurstFireCount=(X=2.0000000,Y=2.0000000)
    AimContexts=/* Array type was not detected. */
    // Reference: PointLightComponent'Default__LPTuneDataVSWeaponRocketLauncher.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSWeaponRocketLauncher.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
}