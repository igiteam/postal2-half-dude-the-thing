class LPTuneDataBaseWeapon extends SPTuneDataGFWeapon
    hidecategories(Object,Object);

var(0.25_Pct) /*0x1B870000-0x00000400*/ private editfixedsize @NULL CameraShake[589825];
var(0.25_Pct) /*0x1B870000-0x00000400*/ private editfixedsize @NULL ScopeCameraShake[589825];
var(0.25_Pct) /*0xD83D0000-0x00000000*/ private bool bCanUseOnZipline[65537];
var(0.25_Pct) /*0xAB310000-0x00000000*/ private bool bRetryInterruptedManualReload[65537];
var(0.25_Pct) /*0xAF890000-0x00000000*/ private bool bUseScopeInADS[65537];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineADSCameraParams[589825];
var(0.25_Pct) /*0x9B220000-0x00000000*/ private editfixedsize array StatesToUseOffHandIK[65537];
var(0.25_Pct) /*0xD0BE0000-0x00000000*/ private name UnlockName[65537];
var(0.25_Pct) /*0xAB310000-0x00000000*/ private float AutoReloadAttemptFrequency[65537];
var(0.25_Pct) /*0xAB310000-0x00000000*/ private int MaxAutoReloadInterrupts[65537];
var(0.25_Pct) /*0xAB310000-0x00000000*/ private float MaxAutoReloadTime[65537];
var(0.25_Pct) /*0xAF890000-0x00000000*/ private editfixedsize string ScopeTypeString[65537];
var(0.25_Pct) /*0xAF890000-0x00000000*/ private @NULL ScopeMovieClip[65537];
var(0.25_Pct) /*0xAF890000-0x00000400*/ private editfixedsize @NULL ScopeCameraParams[589825];

function GetZiplineADSCameraParamOverride()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ZiplineADSCameraParams;
    //return ReturnValue;    
}

defaultproperties
{
    bRetryInterruptedManualReload=true
    StatesToUseOffHandIK=/* Array type was not detected. */
    AutoReloadAttemptFrequency=0.5000000
    MaxAutoReloadInterrupts=2
    MaxAutoReloadTime=-1.0000000
    AimContexts=/* Array type was not detected. */
    HoldAimAfterFiringTime=2.0000000
    bAllowWeaponSwitchDuringFiring=true
    bReloadOnInterrupt=true
    bSwitchWeaponOnNoAmmo=true
    SupportedAmmoTypes=/* Array type was not detected. */
    // Reference: PointLightComponent'Default__LPTuneDataBaseWeapon.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataBaseWeapon.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataBaseWeapon.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}