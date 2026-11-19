class LPTuneDataWeaponGrenade extends LPTuneDataBaseWeapon
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

struct native GrenadeProjImpactDamageData
{
    var(0.25_Pct) /*0x63B60000-0x00000000*/ private class PawnTypeAllowedToDamage[65537];
    var(0.25_Pct) /*0x63B60000-0x00000000*/ private float AmmountOfDamageHitPawn[65537];

    structdefaultproperties
    {
        PawnTypeAllowedToDamage=none
        AmmountOfDamageHitPawn=0.0000000
    }
};

var(0.25_Pct) /*0x5AAD0000-0x00000400*/ private editfixedsize @NULL ExplosionTemplate[589825];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float MinVelocity[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float MaxVelocity[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float GrenadeAimingTrajectoryPitchAdjustment[65537];
var(0.25_Pct) /*0x63D00000-0x00000000*/ private float GrenadeTimerSeconds[65537];
var(0.25_Pct) /*0x63D00000-0x00000000*/ private float MaxGrenadeTimerSeconds[65537];
var(0.25_Pct) /*0x63D00000-0x00000000*/ private float MinGrenadeTimerSeconds[65537];
var(0.25_Pct) /*0x63D00000-0x00000000*/ private bool bUseGrenadeMinMaxTimer[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private bool bDrawDebugExplosionRadius[65537];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private bool bEnableGrenadeAssist[65537];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private bool bShowAssistArc[65537];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private bool bUseGyroAssist[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private bool bEnableArcPreview[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private bool bBouncePreviewArcOffPawns[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private bool bPreviewUseTeamColoring[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private bool bAllowDamageFromBullets[65537];
var(0.25_Pct) /*0x63D00000-0x00000000*/ private float GrenadeTimerSecondsAI[65537];
var(0.25_Pct) /*0x63D00000-0x00000000*/ private float GrenadeTimerSoundSeconds[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float GrenadeGravityScale[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private int UnderhandTossViewPitchThreshold[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float UnderhandTossFloorDistance[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float UnderhandTossWallDistance[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private int UnderhandTossPitchAdjustment[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float RestingLifeSpan[65537];
var(0.25_Pct) /*0x5AAD0000-0x00000000*/ private @NULL TrailTemplate[65537];
var(0.25_Pct) /*0x5AAD0000-0x00000000*/ private @NULL InFlightSoundTemplate[65537];
var(0.25_Pct) /*0x5AAD0000-0x00000000*/ private float TrailEmitterLifeSpan[65537];
var(0.25_Pct) /*0xA43E0000-0x00000400*/ private editfixedsize @NULL AngleOfIncidentForGrenadesFlightPathToAllowAssist[589825];
var(0.25_Pct) /*0xA43E0000-0x00000400*/ private editfixedsize @NULL AngleOfBreakOffForGrenadesFlightPathToStopAssist[589825];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private float MaxSearchRangeForGrenadeAssist[65537];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private float DistanceFromGrenadeAssistLocationToSwitchToFinalSocket[65537];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private float SpeedToShoveTheGrenadeIntoThePawn[65537];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private float CurrentVelocityEmphasesOverAssistVelocity[65537];
var(0.25_Pct) /*0xA43E0000-0x00000400*/ private @NULL GrenadeAssistZoneColor[589825];
var(0.25_Pct) /*0xA43E0000-0x00000000*/ private float LengthOfGrenadesAssistDebugCone[65537];
var(0.25_Pct) /*0x26A10000-0x00000000*/ private editfixedsize array ListOfPawnTypesDamagedOnContact[65537];
var(0.25_Pct) /*0x26A10000-0x00000000*/ private float DistanceFromImpactLocToSearchForHitLoc[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float Bounciness[65537];
var(0.25_Pct) /*0x8A780000-0x00000000*/ private float VelocityDampingFactor[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private int MaxBouncesForPreview[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private @NULL PS_PreviewTrail[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private @NULL PreviewColor[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private float PreviewColorIntensity[65537];
var(0.25_Pct) /*0x07070000-0x00000000*/ private float SimPreviewPreStartDistance[65537];
var(0.25_Pct) /*0xBE980000-0x00000000*/ private @NULL MinInitialSpin[65537];
var(0.25_Pct) /*0xBE980000-0x00000000*/ private @NULL MaxInitialSpin[65537];

defaultproperties
{
    // Reference: LPExplosion'Default__LPTuneDataWeaponGrenade.LPExplosion0'
    begin object name=LPExplosion0 class=Class'LPExplosion'
    end object
    ExplosionTemplate=LPExplosion0
    MinVelocity=600.0000000
    MaxVelocity=2000.0000000
    GrenadeAimingTrajectoryPitchAdjustment=2500.0000000
    GrenadeTimerSeconds=3.0000000
    bEnableGrenadeAssist=true
    bUseGyroAssist=true
    bEnableArcPreview=true
    bPreviewUseTeamColoring=true
    GrenadeTimerSecondsAI=4.0000000
    GrenadeTimerSoundSeconds=2.0000000
    GrenadeGravityScale=1.3000000
    UnderhandTossViewPitchThreshold=-4000
    UnderhandTossFloorDistance=800.0000000
    UnderhandTossWallDistance=400.0000000
    UnderhandTossPitchAdjustment=1100
    RestingLifeSpan=30.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenade.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenade.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    MaxSearchRangeForGrenadeAssist=5000.0000000
    DistanceFromGrenadeAssistLocationToSwitchToFinalSocket=30.0000000
    SpeedToShoveTheGrenadeIntoThePawn=750.0000000
    CurrentVelocityEmphasesOverAssistVelocity=5.0000000
    GrenadeAssistZoneColor=(R=0,G=255,B=255,A=0)
    LengthOfGrenadesAssistDebugCone=600.0000000
    ListOfPawnTypesDamagedOnContact=/* Array type was not detected. */
    DistanceFromImpactLocToSearchForHitLoc=300.0000000
    Bounciness=0.5000000
    VelocityDampingFactor=0.6000000
    MaxBouncesForPreview=2
    PreviewColor=(R=255,G=255,B=255,A=255)
    PreviewColorIntensity=3.0000000
    // Reference: PointLightComponent'Default__LPTuneDataWeaponGrenade.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponGrenade.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponGrenade.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}