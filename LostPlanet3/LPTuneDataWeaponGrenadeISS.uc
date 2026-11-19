class LPTuneDataWeaponGrenadeISS extends LPTuneDataWeaponGrenadeSticky
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

var(0.25_Pct) /*0x71230000-0x00000000*/ private float TimeJumpAfterSticky[65537];
var(0.25_Pct) /*0x71230000-0x00000000*/ private float TimeExplodeAfterJump[65537];
var(0.25_Pct) /*0x71230000-0x00000000*/ private float JumpInitSpeed[65537];
var(0.25_Pct) /*0x71230000-0x00000000*/ private float JumpCustomGravity[65537];
var(0.25_Pct) /*0x71230000-0x00000000*/ private float TimeExplodeWhenDontJump[65537];

defaultproperties
{
    TimeJumpAfterSticky=0.2500000
    TimeExplodeAfterJump=0.4500000
    JumpInitSpeed=700.0000000
    JumpCustomGravity=1.2000000
    TimeExplodeWhenDontJump=0.4000000
    // Reference: LPExplosion'Default__LPTuneDataWeaponGrenadeISS.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    bAllowDamageFromBullets=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeISS.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGrenadeISS.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    // Reference: PointLightComponent'Default__LPTuneDataWeaponGrenadeISS.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponGrenadeISS.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponGrenadeISS.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}