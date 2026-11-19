class LPTuneDataBaseVSWeapon extends LPTuneDataBaseWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline);

var(0.25_Pct) /*0xAB310000-0x00000000*/ private float ReloadTime[65537];

defaultproperties
{
    ReloadTime=1.5000000
    // Reference: PointLightComponent'Default__LPTuneDataBaseVSWeapon.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataBaseVSWeapon.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    FlashLight=none
}