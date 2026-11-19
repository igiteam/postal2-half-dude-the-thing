class LPTuneDataWeaponExplodingBolt extends LPTuneDataWeaponGrenade
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

var(0.25_Pct) /*0x55AD0000-0x00000000*/ private float InFlightProximityRadius[65537];
var(0.25_Pct) /*0x55AD0000-0x00000000*/ private float InFlightProximityHeight[65537];
var(0.25_Pct) /*0x55AD0000-0x00000000*/ private float ProximityRadius[65537];
var(0.25_Pct) /*0x55AD0000-0x00000000*/ private float ProximityHeight[65537];
var(0.25_Pct) /*0x55AD0000-0x00000000*/ private float ExplodeDelay[65537];
var(0.25_Pct) /*0x55AD0000-0x00000000*/ private bool bExplodeOnContact[65537];

defaultproperties
{
    InFlightProximityRadius=100.0000000
    InFlightProximityHeight=100.0000000
    ProximityRadius=200.0000000
    ProximityHeight=200.0000000
    ExplodeDelay=1.0000000
    // Reference: LPExplosion'Default__LPTuneDataWeaponExplodingBolt.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponExplodingBolt.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponExplodingBolt.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    // Reference: PointLightComponent'Default__LPTuneDataWeaponExplodingBolt.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponExplodingBolt.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponExplodingBolt.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}