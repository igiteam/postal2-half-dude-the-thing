class LPTuneDataWeaponGrenadeSticky extends LPTuneDataWeaponGrenade
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

defaultproperties
{
    // Reference: LPExplosion'Default__LPTuneDataWeaponGrenadeSticky.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeSticky.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeSticky.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    // Reference: PointLightComponent'Default__LPTuneDataWeaponGrenadeSticky.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponGrenadeSticky.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponGrenadeSticky.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}