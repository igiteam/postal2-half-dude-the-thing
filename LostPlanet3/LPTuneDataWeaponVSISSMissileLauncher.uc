class LPTuneDataWeaponVSISSMissileLauncher extends LPTuneDataBaseVSISSWeapon
    hidecategories(Object,Object,VSAmmoReplenishment,Camera,FlashLight,Zipline,VSAmmoReplenishment,Camera,FlashLight,Tracer);

var(0.25_Pct) /*0x08C00000-0x00000000*/ private float SpeedMissile[65537];
var(0.25_Pct) /*0x08C00000-0x00000000*/ private @NULL AccuracyFirstMissile[65537];
var(0.25_Pct) /*0x08C00000-0x00000000*/ private @NULL AccuracyLastMissile[65537];
var(0.25_Pct) /*0x08C00000-0x00000000*/ private @NULL NumLastMissilesAtBestAccuraccy[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float SpeedMissilePack[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float HeightMissilePack[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float SpawnMiniMissilesDistanceToTarget[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float SpawnMiniMissilesMinDistanceFromMyself[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float SpawnMiniMissilesDelay[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float RadiusRing[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private int NumMiniMissilesPack[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private int MiniMissileSpeed[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private int MiniMissilesTrackingStrength[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float TimeFireInHoldPosition[65537];
var(0.25_Pct) /*0x091C0000-0x00000000*/ private float TimeInHoldPosition[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float TimePlayerConsideredDamagedRecently[65537];
var(0.25_Pct) /*0xD4210000-0x00000000*/ private float MinNumberOfMissiles[65537];

defaultproperties
{
    SpeedMissile=2000.0000000
    AccuracyFirstMissile=(X=600.0000000,Y=700.0000000)
    AccuracyLastMissile=(X=150.0000000,Y=200.0000000)
    NumLastMissilesAtBestAccuraccy=(X=2.0000000,Y=3.0000000)
    SpeedMissilePack=3000.0000000
    HeightMissilePack=600.0000000
    SpawnMiniMissilesDistanceToTarget=1400.0000000
    SpawnMiniMissilesMinDistanceFromMyself=400.0000000
    RadiusRing=900.0000000
    NumMiniMissilesPack=8
    MiniMissileSpeed=3000
    MiniMissilesTrackingStrength=5
    TimeFireInHoldPosition=0.3000000
    TimeInHoldPosition=0.8000000
    TimePlayerConsideredDamagedRecently=3.0000000
    MinNumberOfMissiles=3.0000000
    ReloadTime=5.0000000
    AimDelay=(X=1.0000000,Y=2.0000000)
    AccuracyConeAngleMax=(X=10.0000000,Y=10.0000000)
    BurstFireCount=(X=5.0000000,Y=7.0000000)
    AimContexts=/* Array type was not detected. */
    FireModes[0]=(FireInterval=0.5000000,FireType=EFireType.EFT_BurstFire)
    FireModes[1]=(FireInterval=6.0000000,FireType=EFireType.EFT_SingleFire)
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    bLoopShellEjectEmitter=false
    bEjectShellOnWeaponFire=false
    bLoopMuzzleFlashLight=false
    FireSoundType=EFireSoundType.FST_SingleFire
    // Reference: PointLightComponent'Default__LPTuneDataWeaponVSISSMissileLauncher.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    MuzzleLightDuration=0.1000000
    MuzzleLightPulseFreq=25.0000000
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponVSISSMissileLauncher.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
}