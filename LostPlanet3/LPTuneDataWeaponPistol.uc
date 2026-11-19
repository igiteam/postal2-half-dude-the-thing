class LPTuneDataWeaponPistol extends LPTuneDataBaseWeapon
    hidecategories(Object,Object);

var(0.25_Pct) /*0x493D0000-0x00000000*/ private @NULL LaserEffect[65537];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private @NULL TagForceFeedback[65537];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private editfixedsize @NULL TagAimAssistMultiplier[589825];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private editfixedsize @NULL DisconnectTagTime[589825];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private editfixedsize @NULL ReconnectTagTime[589825];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private editfixedsize @NULL DisconnectUITime[589825];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private editfixedsize @NULL ReconnectUITime[589825];
var(0.25_Pct) /*0x493D0000-0x00000400*/ private editfixedsize @NULL HUDIconVisibleRange[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponPistol.TagAimAssistMultiplier0'
    begin object name=TagAimAssistMultiplier0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TagAimAssistMultiplier=TagAimAssistMultiplier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponPistol.DisconnectTagTime0'
    begin object name=DisconnectTagTime0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DisconnectTagTime=DisconnectTagTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponPistol.ReconnectTagTime0'
    begin object name=ReconnectTagTime0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReconnectTagTime=ReconnectTagTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponPistol.DisconnectUITime0'
    begin object name=DisconnectUITime0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DisconnectUITime=DisconnectUITime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponPistol.ReconnectUITime0'
    begin object name=ReconnectUITime0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReconnectUITime=ReconnectUITime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponPistol.HUDIconVisibleRange0'
    begin object name=HUDIconVisibleRange0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HUDIconVisibleRange=HUDIconVisibleRange0
    AutoReloadAttemptFrequency=0.2500000
    AccuracyConeAngleMax=(X=5.0000000,Y=5.0000000)
    FiringCooldownTime=3.0000000
    RangeShort=500.0000000
    RangeMedium=1000.0000000
    RangeLong=2500.0000000
    AimContexts=/* Array type was not detected. */
    bHasMuzzleFlashLight=true
    bHasMuzzleFlashEmitter=true
    bHasShellEjectEmitter=true
    bMuzFlashEmitterIsLooping=true
    // Reference: PointLightComponent'Default__LPTuneDataWeaponPistol.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponPistol.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponPistol.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}