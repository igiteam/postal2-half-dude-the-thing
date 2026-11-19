class LPTuneDataWeaponVSISSGrenadeLauncher extends LPTuneDataBaseVSISSWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline,VSAmmoReplenishment,Camera,FlashLight,Tracer);

var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderHold[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderHoldAgainstAkrid[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float FireIntervalAgainstAkrid[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimePlayerConsideredDamagedRecently[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float MinNumberOfGrenades[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderUpAfterFire[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderUpAfterFireAgainstAkrid[65537];

defaultproperties
{
    TimeShoulderHold=2.0000000
    TimeShoulderHoldAgainstAkrid=0.1000000
    FireIntervalAgainstAkrid=0.5000000
    TimePlayerConsideredDamagedRecently=3.0000000
    MinNumberOfGrenades=3.0000000
    TimeShoulderUpAfterFire=3.0000000
    TimeShoulderUpAfterFireAgainstAkrid=1.0000000
    ReloadTime=5.0000000
    AccuracyConeAngleMax=(X=10.0000000,Y=10.0000000)
    BurstFireCount=(X=4.0000000,Y=6.0000000)
    AimContexts=/* Array type was not detected. */
    FireModes=(FireInterval=2.0000000)
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    bLoopShellEjectEmitter=false
    bEjectShellOnWeaponFire=false
    bLoopMuzzleFlashLight=false
    bSwitchWeaponOnNoAmmo=false
    FireSoundType=EFireSoundType.FST_SingleFire
    // Reference: PointLightComponent'Default__LPTuneDataWeaponVSISSGrenadeLauncher.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    MuzzleLightDuration=0.1000000
    MuzzleLightPulseFreq=25.0000000
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponVSISSGrenadeLauncher.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
}