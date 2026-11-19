class LPTuneDataWeaponCrossbow extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

var(0.25_Pct) /*0x28C10000-0x00000000*/ private float SpreadDamageMultiplier[65537];
var(0.25_Pct) /*0x28C10000-0x00000000*/ private float ArrowSpreadMagnitude[65537];
var(0.25_Pct) /*0x28C10000-0x00000000*/ private float HoldTimeUntilSpreadFire[65537];
var(0.25_Pct) /*0x28C10000-0x00000000*/ private float PreloadSpeedMultiplier[65537];
var(0.25_Pct) /*0x28C10000-0x00000400*/ private editfixedsize @NULL SpreadFireNotification[589825];

defaultproperties
{
    SpreadDamageMultiplier=1.0000000
    PreloadSpeedMultiplier=1.0000000
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponCrossbow.ForceFeedbackWaveformNotifySpreadFireLoop0'
    begin object name=ForceFeedbackWaveformNotifySpreadFireLoop0 class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    SpreadFireNotification=ForceFeedbackWaveformNotifySpreadFireLoop0
    FireModes=(FireInterval=3.0000000)
    // Reference: PointLightComponent'Default__LPTuneDataWeaponCrossbow.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponCrossbow.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponCrossbow.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}