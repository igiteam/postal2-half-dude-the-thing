class LPTuneDataBaseVSISSWeapon extends LPTuneDataBaseVSWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline);

defaultproperties
{
    // Reference: PointLightComponent'Default__LPTuneDataBaseVSISSWeapon.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataBaseVSISSWeapon.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
}