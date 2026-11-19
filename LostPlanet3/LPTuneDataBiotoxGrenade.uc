class LPTuneDataBiotoxGrenade extends LPTuneDataWeaponGrenade
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

var(0.25_Pct) /*0x11720000-0x00000000*/ private class CloudObjectClass[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private float CloudDuration[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private float CloudRadius[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private float CloudHeight[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private float DamageInitialDelay[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private float DamageUpdateRate[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private float DamagePerSecond[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private bool bDamageInstigator[65537];
var(0.25_Pct) /*0x11720000-0x00000000*/ private bool bDamageIncappedEnemies[65537];

defaultproperties
{
    bDamageInstigator=true
    // Reference: LPExplosion'Default__LPTuneDataBiotoxGrenade.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBiotoxGrenade.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBiotoxGrenade.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    // Reference: PointLightComponent'Default__LPTuneDataBiotoxGrenade.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataBiotoxGrenade.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataBiotoxGrenade.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}