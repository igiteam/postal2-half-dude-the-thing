class LPTuneDataWeaponGrenadeDisc extends LPTuneDataWeaponGrenade
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

defaultproperties
{
    // Reference: LPExplosion'Default__LPTuneDataWeaponGrenadeDisc.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeDisc.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeDisc.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    Bounciness=1.0000000
    VelocityDampingFactor=1.0000000
    // Reference: PointLightComponent'Default__LPTuneDataWeaponGrenadeDisc.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponGrenadeDisc.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponGrenadeDisc.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}