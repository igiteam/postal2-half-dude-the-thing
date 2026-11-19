class LPTuneDataVSWeaponChaingun extends LPTuneDataBaseVSWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline,VSAmmoReplenishment,Camera,FlashLight);

defaultproperties
{
    // Reference: PointLightComponent'Default__LPTuneDataVSWeaponChaingun.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSWeaponChaingun.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
}