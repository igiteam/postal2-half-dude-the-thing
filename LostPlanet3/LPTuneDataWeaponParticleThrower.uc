class LPTuneDataWeaponParticleThrower extends LPTuneDataBaseWeapon
    hidecategories(Object,Object,Accuracy,SPTuneDataBaseWeapon,MuzzleFlash,ShellEject,Tracer);

var(0.25_Pct) /*0x4E2C0000-0x00000000*/ private @NULL BeamTemplate[65537];
var(0.25_Pct) /*0x9F000000-0x00000400*/ private editfixedsize @NULL OverheatSpeed[589825];
var(0.25_Pct) /*0x9F000000-0x00000400*/ private editfixedsize @NULL LengthOfOverheat[589825];
var(0.25_Pct) /*0x9F000000-0x00000400*/ private editfixedsize @NULL CooldownSpeed[589825];
var(0.25_Pct) /*0x9F000000-0x00000400*/ private editfixedsize @NULL MinRampUpTime[589825];
var(0.25_Pct) /*0x9F000000-0x00000400*/ private editfixedsize @NULL MaxRampUpTime[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponParticleThrower.OverheatSpeedObject'
    begin object name=OverheatSpeedObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=18.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OverheatSpeed=OverheatSpeedObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponParticleThrower.LengthOfOverheatObject'
    begin object name=LengthOfOverheatObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    LengthOfOverheat=LengthOfOverheatObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponParticleThrower.CooldownSpeedObject'
    begin object name=CooldownSpeedObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CooldownSpeed=CooldownSpeedObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponParticleThrower.MinRampUpTimeObject'
    begin object name=MinRampUpTimeObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRampUpTime=MinRampUpTimeObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataWeaponParticleThrower.MaxRampUpTimeObject'
    begin object name=MaxRampUpTimeObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRampUpTime=MaxRampUpTimeObject
    FireModes[0]=(FireInterval=0.0000000)
    FireModes[1]=(FireInterval=0.0000000)
    PlayerBulletWhipDistance=0.0000000
    // Reference: PointLightComponent'Default__LPTuneDataWeaponParticleThrower.MuzzleFlashLightComp'
    begin object name=MuzzleFlashLightComp
    end object
    MuzzleFlashLight=MuzzleFlashLightComp
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataWeaponParticleThrower.ForceFeedbackWaveformShooting0'
    begin object name=ForceFeedbackWaveformShooting0
    end object
    WeaponFireWaveForm=ForceFeedbackWaveformShooting0
    // Reference: SPFlashlightComponent'Default__LPTuneDataWeaponParticleThrower.FlashLightComp'
    begin object name=FlashLightComp
    end object
    FlashLight=FlashLightComp
}