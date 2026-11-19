class LPTuneDataVSPlayerPawn extends LPTuneDataBasePlayerPawn
    dontsortcategories(Attackers,PackHunterStaticFormationAttack)
    hidecategories(Object,Object,CustomScreenEffectManagement);

struct native VSAttackSlotSockets
{
    var(0.25_Pct) /*0xD3CD0000-0x00000000*/ private name StartSocketName[65537];
    var(0.25_Pct) /*0xD3CD0000-0x00000000*/ private name EndSocketName[65537];
    var(0.25_Pct) /*0xD3CD0000-0x00000000*/ private name PlayerOutsideRigSocketName[65537];

    structdefaultproperties
    {
        StartSocketName="None"
        EndSocketName="None"
        PlayerOutsideRigSocketName="None"
    }
};

struct native LPVsCustomCameraEffectInfo
{
    var(0.25_Pct) /*0x8ACA0000-0x00000000*/ private editfixedsize @NULL CenterWindowEffect[65537];
    var(0.25_Pct) /*0x8ACA0000-0x00000000*/ private editfixedsize @NULL LeftWindowEffect[65537];
    var(0.25_Pct) /*0x8ACA0000-0x00000000*/ private editfixedsize @NULL RightWindowEffect[65537];

    structdefaultproperties
    {
        CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
        LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
        RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    }
};

struct native LPSwingComboEntry
{
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private bool bDisabled[65537];
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private editfixedsize string DebugName[65537];
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private float WindowStartPercentage[65537];
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private float WindowEndPercentage[65537];
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private float HoldDuration[65537];
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private class ComboSpecialMoveClasses[65537];
    var(0.25_Pct) /*0x892C0000-0x00000000*/ private class RequiredUpgrade[65537];

    structdefaultproperties
    {
        bDisabled=false
        DebugName=""
        WindowStartPercentage=-1.0000000
        WindowEndPercentage=-1.0000000
        HoldDuration=0.0000000
        ComboSpecialMoveClasses=none
        RequiredUpgrade=none
    }
};

struct native LPSwingComboInfo
{
    var(0.25_Pct) /*0x892D0000-0x00000000*/ private class UsedInSpecialMove[65537];
    var(0.25_Pct) /*0x892D0000-0x00000000*/ private editfixedsize array ComboEntries[65537];

    structdefaultproperties
    {
        UsedInSpecialMove=none
        ComboEntries=none
    }
};

struct native PlatformDamage
{
    var(0.25_Pct) /*0xA3370000-0x00000000*/ private float HealthPercent[65537];
    var(0.25_Pct) /*0xA3370000-0x00000000*/ private float AlarmDuration[65537];
    var(0.25_Pct) /*0xA3370000-0x00000000*/ private name FXEVent[65537];

    structdefaultproperties
    {
        HealthPercent=0.0000000
        AlarmDuration=0.0000000
        FXEVent="None"
    }
};

struct native VSLensFlareAttachmentInfo
{
    var(0.25_Pct) /*0xD4B50000-0x00000400*/ private export @NULL FlareComponentArchetype[589825];
    var(0.25_Pct) /*0xD4B50000-0x00000000*/ private editfixedsize array AttachToSockets[65537];

    structdefaultproperties
    {
        FlareComponentArchetype=none
        AttachToSockets=none
    }
};

struct native VSStaticMeshAttachmentInfo
{
    var(0.25_Pct) /*0xD53B0000-0x00000400*/ private export @NULL StaticMeshComponentArchetype[589825];
    var(0.25_Pct) /*0xD53B0000-0x00000000*/ private editfixedsize array AttachToSockets[65537];

    structdefaultproperties
    {
        StaticMeshComponentArchetype=none
        AttachToSockets=none
    }
};

struct native VSLightAttachmentInfo
{
    var(0.25_Pct) /*0xD4B60000-0x00000400*/ private export @NULL LightComponentArchetype[589825];
    var(0.25_Pct) /*0xD4B60000-0x00000000*/ private editfixedsize array AttachToSockets[65537];

    structdefaultproperties
    {
        LightComponentArchetype=none
        AttachToSockets=none
    }
};

var(0.25_Pct) /*0x19500000-0x00000000*/ private @NULL FastBumpKillFFWaveform[65537];
var(0.25_Pct) /*0x19500000-0x00000000*/ private @NULL SlowBumpKillFFWaveform[65537];
var(0.25_Pct) /*0x1B5A0000-0x00000400*/ private editfixedsize @NULL VSCameraParams[589825];
var(0.25_Pct) /*0x1B5A0000-0x00000400*/ private editfixedsize @NULL CockpitCameraShake[589825];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float ForkArmGrabRange2D[65537];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float ForkArmGrabRangeZ[65537];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float GrabbedPawnKillTimeout[65537];
var(0.25_Pct) /*0x59780000-0x00000400*/ private editfixedsize @NULL ForkArmGrabMaxHydraulicPressure[589825];
var(0.25_Pct) /*0x59780000-0x00000400*/ private editfixedsize @NULL ForkArmWeakGrabHydraulicPressure[589825];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private int MinHealthForEntry[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private int MaxHealthForLowHealthWarning[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private editfixedsize array PreventHitReactionFromDamageTypes[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private float DefenderDamageHullMessageDuration[65537];
var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthRegenDelayAfterDeath[65537];
var(0.25_Pct) /*0x66270000-0x00000400*/ private editfixedsize @NULL HealthStartingPercentageAfterDeath[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameModerateDamageHalfAngle[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameModerateDamage[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameFullDamageHalfAngle[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameFullDamage[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameMissDamage[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000000*/ private float MiniGameSoundBlendTime[65537];
var(0.25_Pct) /*0xB79D0000-0x00000400*/ private editfixedsize @NULL ShieldBlockDamageMultiplier[589825];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float ShieldBlockAngularCoverage[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float ShieldBlockBlendWeightForDamageReduction[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float ShieldBlockBlendInTime[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float ShieldBlockBlendOutTime[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private bool bEndShieldBlockOnUnprotectedHit[65537];
var(0.25_Pct) /*0xD4080000-0x00000000*/ private bool bPauseIceCrabsInVsEntryExit[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float MinShieldBlockTime[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float MaxShieldBlockTime[65537];
var(0.25_Pct) /*0xB79D0000-0x00000000*/ private float InterShieldBlockDelayTime[65537];
var(0.25_Pct) /*0xB79D0000-0x00000400*/ private editfixedsize @NULL ShieldBlockCameraShakeIn[589825];
var(0.25_Pct) /*0xB79D0000-0x00000400*/ private editfixedsize @NULL ShieldBlockCameraShakeOut[589825];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRange[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRetractVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRetractDelay[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float SnowCrabStruggleVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchLaunchVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchPointSearchRange[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchPointAutoTargetAngle[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchBlendAmount[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchThrowPawnVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchThrowPawnZVelocity[65537];
var(0.25_Pct) /*0xC9230000-0x00000000*/ private @NULL TaserFailedNoCharge[65537];
var(0.25_Pct) /*0xC9230000-0x00000000*/ private @NULL TaserFailedNoAction[65537];
var(0.25_Pct) /*0xC9230000-0x00000000*/ private @NULL TaserBeamParticleSystem[65537];
var(0.25_Pct) /*0x4B060000-0x00000000*/ private float DrillVolumeSearchRange[65537];
var(0.25_Pct) /*0x4B060000-0x00000000*/ private float DrillVolumeLockOnRange[65537];
var(0.25_Pct) /*0x4B060000-0x00000000*/ private float DefaultDrillArmDepetionRate[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MeleeForceFeedbackOnImpact[589825];
var(0.25_Pct) /*0xA38D0000-0x00000000*/ private float RangeAnticipateBegin[65537];
var(0.25_Pct) /*0xA38D0000-0x00000000*/ private float RangeAnticipateEnd[65537];
var(0.25_Pct) /*0xD4F50000-0x00000000*/ private float PhysicsPushStrength[65537];
var(0.25_Pct) /*0x6C620000-0x00000000*/ private float InteractionPointSearchRange[65537];
var(0.25_Pct) /*0xBB550000-0x00000000*/ private float ThresholdToStartRotationSound[65537];
var(0.25_Pct) /*0xBB550000-0x00000000*/ private float TimeInPlayingRegionToStartSound[65537];
var(0.25_Pct) /*0xBB550000-0x00000000*/ private float RotationLoopSoundFadeOutTime[65537];
var(0.25_Pct) /*0xBB550000-0x00000000*/ private float RotationLoopSoundFadeInTime[65537];
var(0.25_Pct) /*0xBB550000-0x00000000*/ private float ThresholdToStopRotationSound[65537];
var(0.25_Pct) /*0xBB550000-0x00000000*/ private float TimeInStoppedRegionToStopSound[65537];
var(0.25_Pct) /*0x52520000-0x00000000*/ private float PlayerEnterVSRange[65537];
var(0.25_Pct) /*0x55F20000-0x00000000*/ private float ExtractionPlatformHealth[65537];
var(0.25_Pct) /*0x55F20000-0x00000000*/ private float ExtractionRate[65537];
var(0.25_Pct) /*0x55F20000-0x00000000*/ private float ExtractionTime[65537];
var(0.25_Pct) /*0x55F20000-0x00000400*/ private export @NULL SOConsoleTemplate[589825];
var(0.25_Pct) /*0x55F20000-0x00000000*/ private editfixedsize array DamageEvent[65537];
var(0.25_Pct) /*0x19770000-0x00000400*/ private editfixedsize array AttackSlotSockets[65537];
var(0.25_Pct) /*0x44190000-0x00000400*/ private editfixedsize array DefenderAttackSlotSockets[65537];
var(0.25_Pct) /*0x9A820000-0x00000400*/ private editfixedsize array NushiSporeAttackSlotSockets[65537];
var(0.25_Pct) /*0x95590000-0x00000000*/ private int NumMusicTracks[65537];
var(0.25_Pct) /*0xD3E10000-0x00000000*/ private name CenterWindowEffectRefrenceSocketName[65537];
var(0.25_Pct) /*0xD3E10000-0x00000000*/ private name LeftWindowEffectRefrenceSocketName[65537];
var(0.25_Pct) /*0xD3E10000-0x00000000*/ private name RightWindowEffectRefrenceSocketName[65537];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericAkridTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsSepiaTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsDefenderTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsWaspToCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHiveTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHiveAttack_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsNestingEggsPop_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGrenadeToClose_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericAsh_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericCinders_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericDirt_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericGoo_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericT_Energy_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericIce_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericSnow_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGenericWater_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsOpaqueT_Energy_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsNushiAcid_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHangerDeIcing_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHangerDeIcing2_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsCrabDismemberment_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsCrabDrillKill_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHunterDrillDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHunterSqueezeDeath_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsSawingOnTheCockpit_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsEmpFromStruggle_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsTaserFromStruggle_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsHail_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGlassBreak1_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGlassBreak2_CameraEffect[589825];
var(0.25_Pct) /*0xD3E10000-0x00000400*/ private editfixedsize @NULL VsGlassBreak3_CameraEffect[589825];
var(0.25_Pct) /*0xC7AD0000-0x00000000*/ private editfixedsize array SwingComboInfo[65537];
var(0.25_Pct) /*0xCAD70000-0x00000000*/ private @NULL AbsorbtionParticle[65537];
var(0.25_Pct) /*0x07520000-0x00000400*/ private editfixedsize export array LensFlareAttachmentsForVacantVS[589825];
var(0.25_Pct) /*0x07520000-0x00000400*/ private editfixedsize export array StaticMeshAttachmentsForVacantVS[589825];
var(0.25_Pct) /*0x07520000-0x00000400*/ private editfixedsize export array LightAttachments[589825];

defaultproperties
{
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSPlayerPawn.ForceFeedbackWaveformFastBump'
    begin object name=ForceFeedbackWaveformFastBump class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    FastBumpKillFFWaveform=ForceFeedbackWaveformFastBump
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSPlayerPawn.ForceFeedbackWaveformSlowBump'
    begin object name=ForceFeedbackWaveformSlowBump class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    SlowBumpKillFFWaveform=ForceFeedbackWaveformSlowBump
    ForkArmGrabRange2D=1000.0000000
    ForkArmGrabRangeZ=800.0000000
    GrabbedPawnKillTimeout=40.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.ForkArmGrabMaxHydraulicPressureA'
    begin object name=ForkArmGrabMaxHydraulicPressureA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForkArmGrabMaxHydraulicPressure=ForkArmGrabMaxHydraulicPressureA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.ForkArmWeakGrabHydraulicPressureA'
    begin object name=ForkArmWeakGrabHydraulicPressureA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=12.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForkArmWeakGrabHydraulicPressure=ForkArmWeakGrabHydraulicPressureA
    MinHealthForEntry=10
    MaxHealthForLowHealthWarning=125
    DefenderDamageHullMessageDuration=3.0000000
    HealthRegenDelayAfterDeath=100000000000000000000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.HealthStartingPercentageAfterDeathA'
    begin object name=HealthStartingPercentageAfterDeathA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=80.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HealthStartingPercentageAfterDeath=HealthStartingPercentageAfterDeathA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MiniGameModerateDamageHalfAngleA'
    begin object name=MiniGameModerateDamageHalfAngleA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameModerateDamageHalfAngle=MiniGameModerateDamageHalfAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MiniGameModerateDamageA'
    begin object name=MiniGameModerateDamageA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.3300000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameModerateDamage=MiniGameModerateDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MiniGameFullDamageHalfAngleA'
    begin object name=MiniGameFullDamageHalfAngleA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameFullDamageHalfAngle=MiniGameFullDamageHalfAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MiniGameFullDamageA'
    begin object name=MiniGameFullDamageA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameFullDamage=MiniGameFullDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MiniGameMissDamageA'
    begin object name=MiniGameMissDamageA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameMissDamage=MiniGameMissDamageA
    MiniGameSoundBlendTime=0.1000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.ShieldBlockDamageMultiplierA'
    begin object name=ShieldBlockDamageMultiplierA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ShieldBlockDamageMultiplier=ShieldBlockDamageMultiplierA
    ShieldBlockAngularCoverage=150.0000000
    ShieldBlockBlendWeightForDamageReduction=0.7000000
    ShieldBlockBlendInTime=0.2500000
    ShieldBlockBlendOutTime=0.5000000
    bEndShieldBlockOnUnprotectedHit=true
    MinShieldBlockTime=0.3500000
    InterShieldBlockDelayTime=0.4000000
    // Reference: CameraShake'Default__LPTuneDataVSPlayerPawn.ShieldBlockCameraShakeInA'
    begin object name=ShieldBlockCameraShakeInA class=Class'Engine.CameraShake'
    end object
    ShieldBlockCameraShakeIn=ShieldBlockCameraShakeInA
    // Reference: CameraShake'Default__LPTuneDataVSPlayerPawn.ShieldBlockCameraShakeOutA'
    begin object name=ShieldBlockCameraShakeOutA class=Class'Engine.CameraShake'
    end object
    ShieldBlockCameraShakeOut=ShieldBlockCameraShakeOutA
    WinchRange=8000.0000000
    WinchVelocity=4000.0000000
    WinchRetractVelocity=5000.0000000
    WinchRetractDelay=2.0000000
    SnowCrabStruggleVelocity=1000.0000000
    WinchLaunchVelocity=5000.0000000
    WinchPointSearchRange=8000.0000000
    WinchPointAutoTargetAngle=20.0000000
    WinchBlendAmount=0.6500000
    WinchThrowPawnVelocity=2000.0000000
    WinchThrowPawnZVelocity=2000.0000000
    DrillVolumeSearchRange=8000.0000000
    DrillVolumeLockOnRange=700.0000000
    DefaultDrillArmDepetionRate=4.0000000
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSPlayerPawn.MeleeForceFeedbackOnImpactA'
    begin object name=MeleeForceFeedbackOnImpactA class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    MeleeForceFeedbackOnImpact=MeleeForceFeedbackOnImpactA
    RangeAnticipateBegin=1500.0000000
    RangeAnticipateEnd=1700.0000000
    PhysicsPushStrength=8000.0000000
    InteractionPointSearchRange=4000.0000000
    ThresholdToStartRotationSound=0.3000000
    TimeInPlayingRegionToStartSound=0.2500000
    RotationLoopSoundFadeOutTime=0.5000000
    RotationLoopSoundFadeInTime=0.5000000
    ThresholdToStopRotationSound=0.1000000
    TimeInStoppedRegionToStopSound=0.1000000
    PlayerEnterVSRange=1000.0000000
    ExtractionPlatformHealth=1000.0000000
    ExtractionRate=7.0000000
    ExtractionTime=500.0000000
    DamageEvent=/* Array type was not detected. */
    AttackSlotSockets=/* Array type was not detected. */
    DefenderAttackSlotSockets=/* Array type was not detected. */
    NushiSporeAttackSlotSockets=/* Array type was not detected. */
    NumMusicTracks=3
    CenterWindowEffectRefrenceSocketName="CenterGlass"
    LeftWindowEffectRefrenceSocketName="LeftGlass"
    RightWindowEffectRefrenceSocketName="RightGlass"
    VsGenericAkridTooCloseOnDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsSepiaTooCloseOnDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsDefenderTooCloseOnDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsWaspToCloseOnDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHiveTooCloseOnDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHiveAttack_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsNestingEggsPop_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGrenadeToClose_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericAsh_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericCinders_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericDirt_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericGoo_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericT_Energy_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericIce_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericSnow_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGenericWater_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsOpaqueT_Energy_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsNushiAcid_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHangerDeIcing_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHangerDeIcing2_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsCrabDismemberment_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsCrabDrillKill_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHunterDrillDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHunterSqueezeDeath_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsSawingOnTheCockpit_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsEmpFromStruggle_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsTaserFromStruggle_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsHail_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGlassBreak1_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGlassBreak2_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    VsGlassBreak3_CameraEffect=(CenterWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),LeftWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true),RightWindowEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true))
    GrapplingHookParams=(HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.GrappleHookValidRange'
    begin object name=GrappleHookValidRange
    end object
    HookValidRange=GrappleHookValidRange)
    MagneticGrapplingHookParams=(HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MagneticGrappleHookValidRange'
    begin object name=MagneticGrappleHookValidRange
    end object
    HookValidRange=MagneticGrappleHookValidRange)
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_TimeBetweenAttacksMin'
    begin object name=PackHunter_TimeBetweenAttacksMin
    end object
    PackHunter_TimeBetweenAttacksMin=PackHunter_TimeBetweenAttacksMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_TimeBetweenAttacksMax'
    begin object name=PackHunter_TimeBetweenAttacksMax
    end object
    PackHunter_TimeBetweenAttacksMax=PackHunter_TimeBetweenAttacksMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_MaxCircling'
    begin object name=PackHunter_MaxCircling
    end object
    PackHunter_MaxCircling=PackHunter_MaxCircling
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_Circling_Radius'
    begin object name=PackHunter_Circling_Radius
    end object
    PackHunter_Circling_Radius=PackHunter_Circling_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_MaxInStaticFormation'
    begin object name=PackHunter_MaxInStaticFormation
    end object
    PackHunter_MaxInStaticFormation=PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_StaticFormation_MinRadius'
    begin object name=PackHunter_StaticFormation_MinRadius
    end object
    PackHunter_StaticFormation_MinRadius=PackHunter_StaticFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_StaticFormation_Radius'
    begin object name=PackHunter_StaticFormation_Radius
    end object
    PackHunter_StaticFormation_Radius=PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_StaticFormation_MaxRadius'
    begin object name=PackHunter_StaticFormation_MaxRadius
    end object
    PackHunter_StaticFormation_MaxRadius=PackHunter_StaticFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMin'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMin
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMin=PackHunter_TimeInPaternBeforeFirstAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMax'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMax
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMax=PackHunter_TimeInPaternBeforeFirstAttackMax
    PackHunterStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    PackHunterAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinTimeBetweenStruggles'
    begin object name=MinTimeBetweenStruggles
    end object
    MinTimeBetweenStruggles=MinTimeBetweenStruggles
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_MaxAttackers'
    begin object name=IceCrab_MaxAttackers
    end object
    IceCrab_MaxAttackers=IceCrab_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_Melee_Circle_Radius'
    begin object name=IceCrab_Melee_Circle_Radius
    end object
    IceCrab_Melee_Circle_Radius=IceCrab_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenStrikesMin'
    begin object name=IceCrab_TimeBetweenStrikesMin
    end object
    IceCrab_TimeBetweenStrikesMin=IceCrab_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenStrikesMax'
    begin object name=IceCrab_TimeBetweenStrikesMax
    end object
    IceCrab_TimeBetweenStrikesMax=IceCrab_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMin
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMin=IceCrab_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMax
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMax=IceCrab_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenTauntAttackMin'
    begin object name=IceCrab_TimeBetweenTauntAttackMin
    end object
    IceCrab_TimeBetweenTauntAttackMin=IceCrab_TimeBetweenTauntAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.IceCrab_TimeBetweenTauntAttackMax'
    begin object name=IceCrab_TimeBetweenTauntAttackMax
    end object
    IceCrab_TimeBetweenTauntAttackMax=IceCrab_TimeBetweenTauntAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_MaxAttackers'
    begin object name=Leech_MaxAttackers
    end object
    Leech_MaxAttackers=Leech_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_MaxAttackAttempters'
    begin object name=Leech_MaxAttackAttempters
    end object
    Leech_MaxAttackAttempters=Leech_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_Melee_Circle_Radius'
    begin object name=Leech_Melee_Circle_Radius
    end object
    Leech_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_TimeBetweenStrikesMin'
    begin object name=Leech_TimeBetweenStrikesMin
    end object
    Leech_TimeBetweenStrikesMin=Leech_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_TimeBetweenStrikesMax'
    begin object name=Leech_TimeBetweenStrikesMax
    end object
    Leech_TimeBetweenStrikesMax=Leech_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_TimeBetweenStrugglesMin'
    begin object name=Leech_TimeBetweenStrugglesMin
    end object
    Leech_TimeBetweenStrugglesMin=Leech_TimeBetweenStrugglesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_TimeBetweenStrugglesMax'
    begin object name=Leech_TimeBetweenStrugglesMax
    end object
    Leech_TimeBetweenStrugglesMax=Leech_TimeBetweenStrugglesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_TimeToTrackStrikesOver'
    begin object name=Leech_TimeToTrackStrikesOver
    end object
    Leech_TimeToTrackStrikesOver=Leech_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Leech_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Leech_MaxNumberOfStrikesOverTrackedTime
    end object
    Leech_MaxNumberOfStrikesOverTrackedTime=Leech_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Burrower_MaxAttackers'
    begin object name=Burrower_MaxAttackers
    end object
    Burrower_MaxAttackers=Burrower_MaxAttackers
    Burrower_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Burrower_TimeToTrackStrikesOver'
    begin object name=Burrower_TimeToTrackStrikesOver
    end object
    Burrower_TimeToTrackStrikesOver=Burrower_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Burrower_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Burrower_MaxNumberOfStrikesOverTrackedTime
    end object
    Burrower_MaxNumberOfStrikesOverTrackedTime=Burrower_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Burrower_TimeBetweenStrikesMin'
    begin object name=Burrower_TimeBetweenStrikesMin
    end object
    Burrower_TimeBetweenStrikesMin=Burrower_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Burrower_TimeBetweenStrikesMax'
    begin object name=Burrower_TimeBetweenStrikesMax
    end object
    Burrower_TimeBetweenStrikesMax=Burrower_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinTimeBetweenBurrowerAttacks'
    begin object name=MinTimeBetweenBurrowerAttacks
    end object
    MinTimeBetweenBurrowerAttacks=MinTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxTimeBetweenBurrowerAttacks'
    begin object name=MaxTimeBetweenBurrowerAttacks
    end object
    MaxTimeBetweenBurrowerAttacks=MaxTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_MaxAttackers'
    begin object name=Phadyr_MaxAttackers
    end object
    Phadyr_MaxAttackers=Phadyr_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_Melee_Circle_Radius'
    begin object name=Phadyr_Melee_Circle_Radius
    end object
    Phadyr_Melee_Circle_Radius=Phadyr_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_Melee_Circle_MinRadius'
    begin object name=Phadyr_Melee_Circle_MinRadius
    end object
    Phadyr_Melee_Circle_MinRadius=Phadyr_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_Melee_Circle_MaxRadius'
    begin object name=Phadyr_Melee_Circle_MaxRadius
    end object
    Phadyr_Melee_Circle_MaxRadius=Phadyr_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_TimeBetweenStrikesMin'
    begin object name=Phadyr_TimeBetweenStrikesMin
    end object
    Phadyr_TimeBetweenStrikesMin=Phadyr_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_TimeBetweenStrikesMax'
    begin object name=Phadyr_TimeBetweenStrikesMax
    end object
    Phadyr_TimeBetweenStrikesMax=Phadyr_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Phadyr_SectorsPerAttackerFactor'
    begin object name=Phadyr_SectorsPerAttackerFactor
    end object
    Phadyr_SectorsPerAttackerFactor=Phadyr_SectorsPerAttackerFactor
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataVSPlayerPawn.MedFlyer_FormationInfo'
    begin object name=MedFlyer_FormationInfo
    end object
    MedFlyer_FormationInfo=MedFlyer_FormationInfo
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataVSPlayerPawn.Defender_FormationInfo'
    begin object name=Defender_FormationInfo
    end object
    Defender_FormationInfo=Defender_FormationInfo
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataVSPlayerPawn.NushiSpore_FormationInfo'
    begin object name=NushiSpore_FormationInfo
    end object
    NushiSpore_FormationInfo=NushiSpore_FormationInfo
    DefenderRogueStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    DefenderRogueAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderVsCarrierSupport_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderVsCarrierSupport_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.HumanSoldier_MaxAttackers'
    begin object name=HumanSoldier_MaxAttackers
    end object
    HumanSoldier_MaxAttackers=HumanSoldier_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.HumanSoldier_Surround_Radius'
    begin object name=HumanSoldier_Surround_Radius
    end object
    HumanSoldier_Surround_Radius=HumanSoldier_Surround_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.HumanSoldier_MaxFireAttackers'
    begin object name=HumanSoldier_MaxFireAttackers
    end object
    HumanSoldier_MaxFireAttacker=HumanSoldier_MaxFireAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_MaxInFormation'
    begin object name=Dongo_MaxInFormation
    end object
    Dongo_MaxInFormation=Dongo_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_Formation_MinRadius'
    begin object name=Dongo_Formation_MinRadius
    end object
    Dongo_Formation_MinRadius=Dongo_Formation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_Formation_IdealRadius'
    begin object name=Dongo_Formation_IdealRadius
    end object
    Dongo_Formation_IdealRadius=Dongo_Formation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_Formation_MaxRadius'
    begin object name=Dongo_Formation_MaxRadius
    end object
    Dongo_Formation_MaxRadius=Dongo_Formation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_TimeBetweenStrikesMin'
    begin object name=Dongo_TimeBetweenStrikesMin
    end object
    Dongo_TimeBetweenStrikesMin=Dongo_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_TimeBetweenStrikesMax'
    begin object name=Dongo_TimeBetweenStrikesMax
    end object
    Dongo_TimeBetweenStrikesMax=Dongo_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMin'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMin
    end object
    Dongo_TimeBetweenWithdrawAndChargeMin=Dongo_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMax'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMax
    end object
    Dongo_TimeBetweenWithdrawAndChargeMax=Dongo_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_TimeBetweenFrenzyAttackMin'
    begin object name=Dongo_TimeBetweenFrenzyAttackMin
    end object
    Dongo_TimeBetweenFrenzyAttackMin=Dongo_TimeBetweenFrenzyAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Dongo_TimeBetweenFrenzyAttackMax'
    begin object name=Dongo_TimeBetweenFrenzyAttackMax
    end object
    Dongo_TimeBetweenFrenzyAttackMax=Dongo_TimeBetweenFrenzyAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_MaxInFormation'
    begin object name=Spitter_MaxInFormation
    end object
    Spitter_MaxInFormation=Spitter_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_MeleeFormation_MinRadius'
    begin object name=Spitter_MeleeFormation_MinRadius
    end object
    Spitter_MeleeFormation_MinRadius=Spitter_MeleeFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_MeleeFormation_IdealRadius'
    begin object name=Spitter_MeleeFormation_IdealRadius
    end object
    Spitter_MeleeFormation_IdealRadius=Spitter_MeleeFormation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_MeleeFormation_MaxRadius'
    begin object name=Spitter_MeleeFormation_MaxRadius
    end object
    Spitter_MeleeFormation_MaxRadius=Spitter_MeleeFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_SpitFrom_MinRadius'
    begin object name=Spitter_SpitFrom_MinRadius
    end object
    Spitter_SpitFrom_MinRadius=Spitter_SpitFrom_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_SpitFrom_IdealRadius'
    begin object name=Spitter_SpitFrom_IdealRadius
    end object
    Spitter_SpitFrom_IdealRadius=Spitter_SpitFrom_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Spitter_SpitFrom_MaxRadius'
    begin object name=Spitter_SpitFrom_MaxRadius
    end object
    Spitter_SpitFrom_MaxRadius=Spitter_SpitFrom_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_MaxAttackers'
    begin object name=Sepia_MaxAttackers
    end object
    Sepia_MaxAttackers=Sepia_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_MaxAttackAttempters'
    begin object name=Sepia_MaxAttackAttempters
    end object
    Sepia_MaxAttackAttempters=Sepia_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_Melee_Circle_Radius'
    begin object name=Sepia_Melee_Circle_Radius
    end object
    Sepia_Melee_Circle_Radius=Sepia_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_Melee_Circle_MinRadius'
    begin object name=Sepia_Melee_Circle_MinRadius
    end object
    Sepia_Melee_Circle_MinRadius=Sepia_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_Melee_Circle_MaxRadius'
    begin object name=Sepia_Melee_Circle_MaxRadius
    end object
    Sepia_Melee_Circle_MaxRadius=Sepia_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_SectorsPerAttackerFactor'
    begin object name=Sepia_SectorsPerAttackerFactor
    end object
    Sepia_SectorsPerAttackerFactor=Sepia_SectorsPerAttackerFactor
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_TimeBetweenStrikesMin'
    begin object name=Sepia_TimeBetweenStrikesMin
    end object
    Sepia_TimeBetweenStrikesMin=Sepia_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_TimeBetweenStrikesMax'
    begin object name=Sepia_TimeBetweenStrikesMax
    end object
    Sepia_TimeBetweenStrikesMax=Sepia_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_TimeToTrackStrikesOver'
    begin object name=Sepia_TimeToTrackStrikesOver
    end object
    Sepia_TimeToTrackStrikesOver=Sepia_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfStrikesOverTrackedTime
    end object
    Sepia_MaxNumberOfStrikesOverTrackedTime=Sepia_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_TimeToTrackLobStrikesOver'
    begin object name=Sepia_TimeToTrackLobStrikesOver
    end object
    Sepia_TimeToTrackLobStrikesOver=Sepia_TimeToTrackLobStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_MaxNumberOfLobStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    end object
    Sepia_MaxNumberOfLobStrikesOverTrackedTime=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_MinNumToCausePanicRetreat'
    begin object name=Sepia_MinNumToCausePanicRetreat
    end object
    Sepia_MinNumToCausePanicRetreat=Sepia_MinNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Sepia_MaxNumToCausePanicRetreat'
    begin object name=Sepia_MaxNumToCausePanicRetreat
    end object
    Sepia_MaxNumToCausePanicRetreat=Sepia_MaxNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Carrier_MaxInFormationD0'
    begin object name=Carrier_MaxInFormationD0
    end object
    Carrier_MaxInFormation=Carrier_MaxInFormationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Carrier_LoiterFormation_MinRadiusD0'
    begin object name=Carrier_LoiterFormation_MinRadiusD0
    end object
    Carrier_LoiterFormation_MinRadius=Carrier_LoiterFormation_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Carrier_LoiterFormation_IdealRadiusD0'
    begin object name=Carrier_LoiterFormation_IdealRadiusD0
    end object
    Carrier_LoiterFormation_IdealRadius=Carrier_LoiterFormation_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.Carrier_LoiterFormation_MaxRadiusD0'
    begin object name=Carrier_LoiterFormation_MaxRadiusD0
    end object
    Carrier_LoiterFormation_MaxRadius=Carrier_LoiterFormation_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    CarrierDefenderStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    CarrierDefenderAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VsLaroche_MaxAttackers0'
    begin object name=VsLaroche_MaxAttackers0
    end object
    VsLaroche_MaxAttackers=VsLaroche_MaxAttackers0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VsLaroche_Loiter_Circle_IdealRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_IdealRadiusD0
    end object
    VsLaroche_Loiter_Circle_IdealRadius=VsLaroche_Loiter_Circle_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VsLaroche_Loiter_Circle_MaxRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MaxRadiusD0
    end object
    VsLaroche_Loiter_Circle_MaxRadius=VsLaroche_Loiter_Circle_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VsLaroche_Loiter_Circle_MinRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MinRadiusD0
    end object
    VsLaroche_Loiter_Circle_MinRadius=VsLaroche_Loiter_Circle_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VsLaroche_TimeBetweenStrikesMinD0'
    begin object name=VsLaroche_TimeBetweenStrikesMinD0
    end object
    VsLaroche_TimeBetweenStrikesMin=VsLaroche_TimeBetweenStrikesMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VsLaroche_TimeBetweenStrikesMaxD0'
    begin object name=VsLaroche_TimeBetweenStrikesMaxD0
    end object
    VsLaroche_TimeBetweenStrikesMax=VsLaroche_TimeBetweenStrikesMaxD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MP_PackHunter_MaxInStaticFormation'
    begin object name=MP_PackHunter_MaxInStaticFormation
    end object
    MP_PackHunter_MaxInStaticFormation=MP_PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MP_PackHunter_StaticFormation_Radius'
    begin object name=MP_PackHunter_StaticFormation_Radius
    end object
    MP_PackHunter_StaticFormation_Radius=MP_PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxNumberOfDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDamageGibsForThisPlayerD0
    end object
    MaxNumberOfDamageGibsForThisPlayer=MaxNumberOfDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxNumberOfDecalsForDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    end object
    MaxNumberOfDecalsForDamageGibsForThisPlayer=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.RollDistanceMultiplierObj'
    begin object name=RollDistanceMultiplierObj
    end object
    RollDistanceMultiplier=RollDistanceMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.HealthRegenRateDifficultyModifier0'
    begin object name=HealthRegenRateDifficultyModifier0
    end object
    HealthRegenRateDifficultyModifier=HealthRegenRateDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.HealthRegenDelayDifficultyModifier0'
    begin object name=HealthRegenDelayDifficultyModifier0
    end object
    HealthRegenDelayDifficultyModifier=HealthRegenDelayDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    RadarParams=(IconType=EMapIconTypes.EMapIcon_VS,bIconStaysOnEdge=true,bRotatesWithActor=false)
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    RotationRate=(Pitch=0,Yaw=16384,Roll=0)
    JumpAccelerationRate=0.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    ViewPitchMin=-4000
    ViewPitchMax=9000
    FloorConformInfo=(ConformType=EFloorConformType.EFCT_CenterSample)
    bAllowWallSlide=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSPlayerPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
    WallSlideAngle=60.0000000
    WallSlideCylinderRadius=1.0000000
    WallSlideCylinderHeight=350.0000000
}