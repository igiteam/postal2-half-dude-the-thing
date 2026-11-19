class LPTuneDataWeaponGrenadeEMP extends LPTuneDataWeaponGrenade
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

defaultproperties
{
    // Reference: LPExplosion'Default__LPTuneDataWeaponGrenadeEMP.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeEMP.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeEMP.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    // Reference: PointLightComponent'Default__LPTuneDataWeaponGrenadeEMP.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponGrenadeEMP.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponGrenadeEMP.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}