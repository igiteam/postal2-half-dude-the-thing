class LPTuneDataWeaponStalker extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

var(0.25_Pct) /*0x03A10000-0x00000000*/ private bool bEnableLinePatternShooting[65537];

defaultproperties
{
    AimDelay=(X=0.0000000,Y=0.1000000)
    AccuracyConeAngleMin=(X=8.0000000,Y=8.0000000)
    AccuracyConeAngleMax=(X=15.0000000,Y=15.0000000)
    BurstFireCount=(X=5.0000000,Y=7.0000000)
    FiringCooldownTime=3.0000000
    AimContexts=/* Array type was not detected. */
    FireModes=(FireInterval=0.2000000)
    // Reference: PointLightComponent'Default__LPTuneDataWeaponStalker.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponStalker.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponStalker.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}