class LPTuneDataWeaponGLauncherAcid extends LPTuneDataWeaponGrenade
    dontsortcategories(PlayerThrownGrenadeAssist)
    hidecategories(Object,Object,Camera,AI,SPTuneDataBaseWeapon,Accuracy,DamageFalloff,Sound,MuzzleFlash,ShellEject,Tracer,FlashLight,Reload,Rumble,Upgrades,Recoil,Firing,AimAssist,Aiming,OffHandIK,CameraShake,TestParams);

var(0.25_Pct) /*0x01790000-0x00000000*/ private bool AcidPoolEnabled[65537];
var(0.25_Pct) /*0x01790000-0x00000000*/ private bool bDebugAcidPoolCreationExplosion[65537];
var(0.25_Pct) /*0x01790000-0x00000400*/ private editfixedsize @NULL AcidPoolCreationExplosion[589825];
var(0.25_Pct) /*0x01790000-0x00000400*/ private editfixedsize @NULL AcidPoolDamagePerSecond[589825];
var(0.25_Pct) /*0x01790000-0x00000000*/ private float AcidPoolDamagePerHit[65537];
var(0.25_Pct) /*0x01790000-0x00000400*/ private editfixedsize @NULL AcidPoolSize[589825];
var(0.25_Pct) /*0x01790000-0x00000400*/ private editfixedsize @NULL AcidPoolLifeSpan[589825];
var(0.25_Pct) /*0x01790000-0x00000000*/ private editfixedsize array AcidPoolDecalMaterial[589825];
var(0.25_Pct) /*0x01790000-0x00000000*/ private editfixedsize array AcidPoolParticleSystem[589825];

defaultproperties
{
    AcidPoolEnabled=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGLauncherAcid.AcidPoolDamagePerSecond_DefaultObject'
    begin object name=AcidPoolDamagePerSecond_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolDamagePerSecond=AcidPoolDamagePerSecond_DefaultObject
    AcidPoolDamagePerHit=10.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGLauncherAcid.AcidPoolSize_DefaultObject'
    begin object name=AcidPoolSize_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolSize=AcidPoolSize_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGLauncherAcid.AcidPoolLifeSpan_DefaultObject'
    begin object name=AcidPoolLifeSpan_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolLifeSpan=AcidPoolLifeSpan_DefaultObject
    // Reference: LPExplosion'Default__LPTuneDataWeaponGLauncherAcid.LPExplosion0'
    begin object name=LPExplosion0
    end object
    ExplosionTemplate=LPExplosion0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGLauncherAcid.AngleOfIncidentForGrenadesFlightPathToAllowAssistD0'
    begin object name=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    end object
    AngleOfIncidentForGrenadesFlightPathToAllowAssist=AngleOfIncidentForGrenadesFlightPathToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponGLauncherAcid.AngleOfBreakOffForGrenadesFlightPathToStopAssistD0'
    begin object name=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    end object
    AngleOfBreakOffForGrenadesFlightPathToStopAssist=AngleOfBreakOffForGrenadesFlightPathToStopAssistD0
    // Reference: PointLightComponent'Default__LPTuneDataWeaponGLauncherAcid.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponGLauncherAcid.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponGLauncherAcid.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}