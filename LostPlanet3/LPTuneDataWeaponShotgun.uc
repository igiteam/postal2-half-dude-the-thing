class LPTuneDataWeaponShotgun extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

var(0.25_Pct) /*0xAB310000-0x00000000*/ private int NumExtraBulletsToReloadOnEmptyMagazine[65537];

defaultproperties
{
    StatesToUseOffHandIK=/* Array type was not detected. */
    bCloseRangeWeapon=true
    AccuracyConeAngleMax=(X=5.0000000,Y=5.0000000)
    BurstFireCount=(X=1.0000000,Y=1.0000000)
    BlindFirePct=0.1000000
    FiringCooldownTime=3.0000000
    RangeShort=100.0000000
    RangeMedium=400.0000000
    RangeLong=900.0000000
    FireModes=(FireInterval=0.9400000)
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    bHasShellEjectEmitter=true
    // Reference: PointLightComponent'Default__LPTuneDataWeaponShotgun.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponShotgun.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponShotgun.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}