class LPTuneDataWeaponVSISSRailgun extends LPTuneDataBaseVSISSWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline);

var(0.25_Pct) /*0xD4210000-0x00000000*/ private float ChargeTime[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderHold[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderHoldAgainstAkrid[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float FireIntervalAgainstAkrid[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimeShoulderHoldIn3rdStage[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float FireIntervalIn3rdStage[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimePlayerConsideredDamagedRecently[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float MinTimeShoulderHoldWhenPlayerDamagedRecently[65537];

defaultproperties
{
    ChargeTime=1.2500000
    TimeShoulderHold=3.0000000
    TimeShoulderHoldAgainstAkrid=0.1000000
    FireIntervalAgainstAkrid=0.3000000
    TimeShoulderHoldIn3rdStage=0.1000000
    FireIntervalIn3rdStage=0.3000000
    TimePlayerConsideredDamagedRecently=3.0000000
    MinTimeShoulderHoldWhenPlayerDamagedRecently=3.0000000
    AccuracyConeAngleMax=(X=2.0000000,Y=2.0000000)
    BurstFireCount=(X=2.0000000,Y=3.0000000)
    AimContexts=/* Array type was not detected. */
    FireModes=(FireInterval=2.5000000,FireType=EFireType.EFT_SingleFire)
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    // Reference: PointLightComponent'Default__LPTuneDataWeaponVSISSRailgun.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponVSISSRailgun.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
}