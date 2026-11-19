class LPTuneDataWeaponHalberd extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

var(0.25_Pct) /*0xAEC00000-0x00000400*/ private editfixedsize @NULL TimeUntilReachingMaxCharge[589825];
var(0.25_Pct) /*0xAEC00000-0x00000400*/ private editfixedsize @NULL AdditionalChargedDamage[589825];
var(0.25_Pct) /*0xAEC00000-0x00000400*/ private editfixedsize @NULL AdditionalChargedEMPTime[589825];
var(0.25_Pct) /*0xAEC00000-0x00000400*/ private editfixedsize @NULL WeaponChargingWaveform[589825];
var(0.25_Pct) /*0xAEC00000-0x00000400*/ private editfixedsize @NULL WeaponMaxChargeLoopingWaveform[589825];
var(0.25_Pct) /*0x8A7D0000-0x00000000*/ private float ChargingParticlesDeactivateDelay[65537];
var(0.25_Pct) /*0xCE160000-0x00000000*/ private @NULL FullyChargedTracerSmokeTrailEffect[65537];
var(0.25_Pct) /*0xCE160000-0x00000000*/ private @NULL AltAmmoTracerSmokeTrailEffect[65537];
var(0.25_Pct) /*0xCE160000-0x00000000*/ private @NULL AltAmmoFullyChargedTracerSmokeTrailEffect[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponHalberd.TimeUntilReachingMaxChargeObj'
    begin object name=TimeUntilReachingMaxChargeObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeUntilReachingMaxCharge=TimeUntilReachingMaxChargeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponHalberd.AdditionalChargedDamageObj'
    begin object name=AdditionalChargedDamageObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AdditionalChargedDamage=AdditionalChargedDamageObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponHalberd.AdditionalChargedEMPTimeObj'
    begin object name=AdditionalChargedEMPTimeObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AdditionalChargedEMPTime=AdditionalChargedEMPTimeObj
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponHalberd.ForceFeedbackWaveformCharging0'
    begin object name=ForceFeedbackWaveformCharging0 class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    WeaponChargingWaveform=ForceFeedbackWaveformCharging0
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponHalberd.ForceFeedbackWaveformLoopingMaxCharge0'
    begin object name=ForceFeedbackWaveformLoopingMaxCharge0 class=Class'Engine.ForceFeedbackWaveform'
        bIsLooping=true
        Samples=/* Array type was not detected. */
    end object
    WeaponMaxChargeLoopingWaveform=ForceFeedbackWaveformLoopingMaxCharge0
    ChargingParticlesDeactivateDelay=0.5000000
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    // Reference: PointLightComponent'Default__LPTuneDataWeaponHalberd.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponHalberd.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponHalberd.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}