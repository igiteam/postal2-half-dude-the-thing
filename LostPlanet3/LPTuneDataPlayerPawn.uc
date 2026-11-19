class LPTuneDataPlayerPawn extends LPTuneDataBasePlayerPawn
    dontsortcategories(Attackers,PackHunterStaticFormationAttack)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A0A0000-0x00000000*/ private @NULL AimYawThreshold[65537];
var(0.25_Pct) /*0xD3960000-0x00000000*/ private int AmmoReplenishRadius[65537];
var(0.25_Pct) /*0xD3960000-0x00000000*/ private int ExtractionAmmoReplenishRadius[65537];
var(0.25_Pct) /*0xD3960000-0x00000000*/ private int TEnergyTransferRadius[65537];
var(0.25_Pct) /*0xD3960000-0x00000000*/ private int TEnergyTransferSize[65537];
var(0.25_Pct) /*0xD3960000-0x00000000*/ private int UmbilicalRange[65537];
var(0.25_Pct) /*0xD3960000-0x00000400*/ private editfixedsize @NULL UmbilicalHealthRegenModifier[589825];
var(0.25_Pct) /*0x66270000-0x00000400*/ private editfixedsize @NULL HealthRegenCoverMultiplier[589825];
var(0.25_Pct) /*0x27F90000-0x00000000*/ private @NULL StumbleCSA[65537];
var(0.25_Pct) /*0x27F90000-0x00000000*/ private float StumbleTime[65537];
var(0.25_Pct) /*0x96860000-0x00000000*/ private @NULL NearbyLargeGroundHitCSA[65537];
var(0.25_Pct) /*0x96860000-0x00000000*/ private float NearbyLargeGroundHitTime[65537];
var(0.25_Pct) /*0x4F9F0000-0x00000000*/ private @NULL ElectricalHitCSA[65537];
var(0.25_Pct) /*0x4F9F0000-0x00000000*/ private float ElectricalHitTime[65537];
var(0.25_Pct) /*0x03F50000-0x00000000*/ private @NULL CameraAnimADS[65537];
var(0.25_Pct) /*0x28D70000-0x00000000*/ private float CrouchCameraFilterDuration[65537];
var(0.25_Pct) /*0xC6490000-0x00000000*/ private float StormRegenPenalty[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MeleeDamageMin[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MeleeDamageMax[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MaxDistanceCandidateForChoreography[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MinAngleDegreesCandidateForChoreography[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MeleeChoreographyShutoffTime[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MeleeChoreographyBlendTime[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MaxStationaryMeleeRange[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float PercentOfMaxSpeedForMovingMelee[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float PauseAnimationDurationOnMeleeContact[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MeleeFeedbackWaveform[589825];
var(0.25_Pct) /*0x90240000-0x00000400*/ private editfixedsize @NULL MeleeTakedownDamage[589825];
var(0.25_Pct) /*0x90240000-0x00000400*/ private editfixedsize @NULL MeleeTakedownRange[589825];
var(0.25_Pct) /*0x90240000-0x00000400*/ private editfixedsize @NULL MeleeTakedownMaxDifferenceInFacingDirections[589825];
var(0.25_Pct) /*0x90240000-0x00000400*/ private editfixedsize @NULL MeleeStompRange[589825];
var(0.25_Pct) /*0x90240000-0x00000400*/ private editfixedsize @NULL MeleeTakedownFeedbackWaveform[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float PercentageTEngDropOnDeath[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float MinScaleTEngDropOnDeath[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float MaxScaleTEngDropOnDeath[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float MinTEngCountDropOnDeath[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float MaxTEngCountDropOnDeath[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float TEnergyGlowDuration[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float TEnergyGlowDampeningFactor[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL InitialTEngCount[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL DeathTEngCountChange[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL DeathTEngPctRestored[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL MaxTEngFannyPackCapacity[589825];
var(0.25_Pct) /*0x69A30000-0x00000400*/ private editfixedsize @NULL IncapacitationToDeathHealthThreshold[589825];
var(0.25_Pct) /*0x69A30000-0x00000400*/ private editfixedsize @NULL ReviveIncapacitatedDistance[589825];
var(0.25_Pct) /*0x69A30000-0x00000400*/ private editfixedsize @NULL IncapacitationBleedOutRate[589825];
var(0.25_Pct) /*0x69A30000-0x00000400*/ private editfixedsize @NULL MinimumIncapacitationBleedOutRate[589825];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private bool bUseEdgeGlowWhileIncapacitated[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private bool bOnlyShowIncapacitatedEdgeGlowToTeammates[65537];
var(0.25_Pct) /*0xD3940000-0x00000000*/ private bool bPlayEjectionSequenceWhenVsIsShutdownByDamage[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private editfixedsize @NULL IncapacitatedEdgeGlowParams[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float DeathFreezeTransitionTime[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float DeathCameraZoomDelay[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float DeathCameraZoomDuration[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float TapInHealthPress[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float IncapacitatedRagdollSettlingVelocity[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float MaximumIncapacitatedRagdollSettlingTime[65537];
var(0.25_Pct) /*0x69A30000-0x00000000*/ private float MinimumHealthThresholdOnInitialRevival[65537];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineSpeed[589825];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineSprintSpeed[589825];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineADSSpeed[589825];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineAccelRate[589825];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineSprintAccelRate[589825];
var(0.25_Pct) /*0xD83D0000-0x00000400*/ private editfixedsize @NULL ZiplineADSAccelRate[589825];
var(0.25_Pct) /*0xD83D0000-0x00000000*/ private float MaxDropHeight[65537];
var(0.25_Pct) /*0x953B0000-0x00000000*/ private float MunitionsLockerEnableDistance[65537];
var(0.25_Pct) /*0x953B0000-0x00000000*/ private float MunitionsLockerHologramDistance[65537];
var(0.25_Pct) /*0x953B0000-0x00000000*/ private float MunitionsLockerHologramFadeInSpeed[65537];
var(0.25_Pct) /*0x953B0000-0x00000000*/ private float MunitionsLockerHologramFadeOutSpeed[65537];
var(0.25_Pct) /*0xD69C0000-0x00000000*/ private float SwitchToPistolButtonHoldTime[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float PostSpawnInvulnerablilityTime[65537];
var(0.25_Pct) /*0xAFA40000-0x00000000*/ private float ScrapPickupMessageDisplayTime[65537];
var(0.25_Pct) /*0x661F0000-0x00000000*/ private @NULL SPHealthPostProcess[65537];
var(0.25_Pct) /*0x94F20000-0x00000000*/ private @NULL MPHealthPostProcess[65537];
var(0.25_Pct) /*0x2B350000-0x00000000*/ private int LargeHitSoundDamageThreshhold[65537];
var(0.25_Pct) /*0x279C0000-0x00000000*/ private float MinHitWallDotForAutoMantleWhileSprinting[65537];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private int HealthAlmostDeadSmallBreak[65537];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private float HealthAlmostDeadSmallBreakTime[65537];
var(0.25_Pct) /*0x09B30000-0x00000000*/ private editfixedsize array SoundModesWhichPreventAudioLogs[65537];
var(0.25_Pct) /*0x09B30000-0x00000000*/ private editfixedsize array SoundModesWhichPreventVideoLogs[65537];

// Export ULPTuneDataPlayerPawn::execGetHealthRegenDelayModifier(FFrame&, void* const)
native function GetHealthRegenDelayModifier()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

defaultproperties
{
    AimYawThreshold=(MinYaw=-32768,MaxYaw=32768)
    AmmoReplenishRadius=600
    ExtractionAmmoReplenishRadius=1800
    TEnergyTransferRadius=600
    TEnergyTransferSize=20
    UmbilicalRange=4000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.UmbilicalHealthRegenModifierObj'
    begin object name=UmbilicalHealthRegenModifierObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UmbilicalHealthRegenModifier=UmbilicalHealthRegenModifierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.HealthRegenCoverMultiplierObj'
    begin object name=HealthRegenCoverMultiplierObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HealthRegenCoverMultiplier=HealthRegenCoverMultiplierObj
    CrouchCameraFilterDuration=1.0000000
    StormRegenPenalty=50.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MeleeDamageMinObj'
    begin object name=MeleeDamageMinObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeDamageMin=MeleeDamageMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MeleeDamageMaxObj'
    begin object name=MeleeDamageMaxObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeDamageMax=MeleeDamageMaxObj
    MaxDistanceCandidateForChoreography=275.0000000
    MinAngleDegreesCandidateForChoreography=30.0000000
    MeleeChoreographyShutoffTime=0.3000000
    MeleeChoreographyBlendTime=0.2000000
    MaxStationaryMeleeRange=50.0000000
    PercentOfMaxSpeedForMovingMelee=0.5000000
    PauseAnimationDurationOnMeleeContact=0.0700000
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataPlayerPawn.ForceFeedbackWaveformMelee0'
    begin object name=ForceFeedbackWaveformMelee0 class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    MeleeFeedbackWaveform=ForceFeedbackWaveformMelee0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MeleeTakedownDamageObj'
    begin object name=MeleeTakedownDamageObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeTakedownDamage=MeleeTakedownDamageObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MeleeTakedownRangeObj'
    begin object name=MeleeTakedownRangeObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeTakedownRange=MeleeTakedownRangeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MeleeTakedownMaxDifferenceInFacingDirectionsObj'
    begin object name=MeleeTakedownMaxDifferenceInFacingDirectionsObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=35.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeTakedownMaxDifferenceInFacingDirections=MeleeTakedownMaxDifferenceInFacingDirectionsObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MeleeStompRangeObj'
    begin object name=MeleeStompRangeObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeStompRange=MeleeStompRangeObj
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataPlayerPawn.ForceFeedbackWaveformMeleeTakedown0'
    begin object name=ForceFeedbackWaveformMeleeTakedown0 class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    MeleeTakedownFeedbackWaveform=ForceFeedbackWaveformMeleeTakedown0
    PercentageTEngDropOnDeath=0.1000000
    MinScaleTEngDropOnDeath=0.5000000
    MaxScaleTEngDropOnDeath=3.0000000
    MinTEngCountDropOnDeath=1.0000000
    MaxTEngCountDropOnDeath=100.0000000
    TEnergyGlowDuration=2.0000000
    TEnergyGlowDampeningFactor=0.0500000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPlayerPawn.InitialTEngCountA'
    begin object name=InitialTEngCountA class=Class'LPFloatUpgrade'
    end object
    InitialTEngCount=InitialTEngCountA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPlayerPawn.DeathTEngCountChangeA'
    begin object name=DeathTEngCountChangeA class=Class'LPFloatUpgrade'
    end object
    DeathTEngCountChange=DeathTEngCountChangeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPlayerPawn.DeathTEngPctRestoredA'
    begin object name=DeathTEngPctRestoredA class=Class'LPFloatUpgrade'
        baseValue=1.0000000
    end object
    DeathTEngPctRestored=DeathTEngPctRestoredA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxTEngFannyPackCapacityA'
    begin object name=MaxTEngFannyPackCapacityA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTEngFannyPackCapacity=MaxTEngFannyPackCapacityA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IncapacitationToDeathHealthThresholdObj'
    begin object name=IncapacitationToDeathHealthThresholdObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IncapacitationToDeathHealthThreshold=IncapacitationToDeathHealthThresholdObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ReviveIncapacitatedDistanceObj'
    begin object name=ReviveIncapacitatedDistanceObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReviveIncapacitatedDistance=ReviveIncapacitatedDistanceObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IncapacitationBleedOutRateObj'
    begin object name=IncapacitationBleedOutRateObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IncapacitationBleedOutRate=IncapacitationBleedOutRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinimumIncapacitationBleedOutRateObj'
    begin object name=MinimumIncapacitationBleedOutRateObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinimumIncapacitationBleedOutRate=MinimumIncapacitationBleedOutRateObj
    bPlayEjectionSequenceWhenVsIsShutdownByDamage=true
    DeathFreezeTransitionTime=5.0000000
    DeathCameraZoomDelay=1.5000000
    DeathCameraZoomDuration=2.7000000
    TapInHealthPress=1.2000000
    IncapacitatedRagdollSettlingVelocity=10.0000000
    MaximumIncapacitatedRagdollSettlingTime=7.0000000
    MinimumHealthThresholdOnInitialRevival=-100.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ZiplineSpeedObj'
    begin object name=ZiplineSpeedObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ZiplineSpeed=ZiplineSpeedObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ZiplineSprintSpeedObj'
    begin object name=ZiplineSprintSpeedObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ZiplineSprintSpeed=ZiplineSprintSpeedObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ZiplineADSSpeedObj'
    begin object name=ZiplineADSSpeedObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ZiplineADSSpeed=ZiplineADSSpeedObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ZiplineAccelRateObj'
    begin object name=ZiplineAccelRateObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ZiplineAccelRate=ZiplineAccelRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ZiplineSprintAccelRateObj'
    begin object name=ZiplineSprintAccelRateObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ZiplineSprintAccelRate=ZiplineSprintAccelRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ZiplineADSAccelRateObj'
    begin object name=ZiplineADSAccelRateObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ZiplineADSAccelRate=ZiplineADSAccelRateObj
    MaxDropHeight=1000.0000000
    MunitionsLockerEnableDistance=500.0000000
    MunitionsLockerHologramDistance=500.0000000
    MunitionsLockerHologramFadeInSpeed=1.0000000
    MunitionsLockerHologramFadeOutSpeed=0.5000000
    SwitchToPistolButtonHoldTime=0.3570000
    PostSpawnInvulnerablilityTime=7.0000000
    ScrapPickupMessageDisplayTime=2.5000000
    SPHealthPostProcess=(InitialStrengthDecayRate=1.0000000,MinStrengthForAnyHit=0.5000000,MinDesaturation=0.2500000,MaxDesaturation=0.7500000,ThersholdForTriggeringDesaturation=0.2500000,StrengthInterpSpeed=0.0000000,StrengthScaling=0.0000000,HealthInterpSpeed=4.0000000,HealthMinThreshold=0.3000000,CurrentStrengthBlendFactor=4.0000000)
    MPHealthPostProcess=(InitialStrengthDecayRate=1.0000000,MinStrengthForAnyHit=0.5000000,MinDesaturation=0.2500000,MaxDesaturation=0.7500000,ThersholdForTriggeringDesaturation=0.2500000,StrengthInterpSpeed=0.0000000,StrengthScaling=0.0000000,HealthInterpSpeed=4.0000000,HealthMinThreshold=0.3000000,CurrentStrengthBlendFactor=4.0000000)
    LargeHitSoundDamageThreshhold=25
    MinHitWallDotForAutoMantleWhileSprinting=0.8660000
    HealthAlmostDeadSmallBreak=20
    HealthAlmostDeadSmallBreakTime=3.0000000
    GrapplingHookParams=(HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.GrappleHookValidRange'
    begin object name=GrappleHookValidRange
    end object
    HookValidRange=GrappleHookValidRange)
    MagneticGrapplingHookParams=(HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MagneticGrappleHookValidRange'
    begin object name=MagneticGrappleHookValidRange
    end object
    HookValidRange=MagneticGrappleHookValidRange)
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_TimeBetweenAttacksMin'
    begin object name=PackHunter_TimeBetweenAttacksMin
    end object
    PackHunter_TimeBetweenAttacksMin=PackHunter_TimeBetweenAttacksMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_TimeBetweenAttacksMax'
    begin object name=PackHunter_TimeBetweenAttacksMax
    end object
    PackHunter_TimeBetweenAttacksMax=PackHunter_TimeBetweenAttacksMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_MaxCircling'
    begin object name=PackHunter_MaxCircling
    end object
    PackHunter_MaxCircling=PackHunter_MaxCircling
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_Circling_Radius'
    begin object name=PackHunter_Circling_Radius
    end object
    PackHunter_Circling_Radius=PackHunter_Circling_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_MaxInStaticFormation'
    begin object name=PackHunter_MaxInStaticFormation
    end object
    PackHunter_MaxInStaticFormation=PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_StaticFormation_MinRadius'
    begin object name=PackHunter_StaticFormation_MinRadius
    end object
    PackHunter_StaticFormation_MinRadius=PackHunter_StaticFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_StaticFormation_Radius'
    begin object name=PackHunter_StaticFormation_Radius
    end object
    PackHunter_StaticFormation_Radius=PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_StaticFormation_MaxRadius'
    begin object name=PackHunter_StaticFormation_MaxRadius
    end object
    PackHunter_StaticFormation_MaxRadius=PackHunter_StaticFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMin'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMin
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMin=PackHunter_TimeInPaternBeforeFirstAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMax'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMax
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMax=PackHunter_TimeInPaternBeforeFirstAttackMax
    PackHunterStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    PackHunterAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinTimeBetweenStruggles'
    begin object name=MinTimeBetweenStruggles
    end object
    MinTimeBetweenStruggles=MinTimeBetweenStruggles
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_MaxAttackers'
    begin object name=IceCrab_MaxAttackers
    end object
    IceCrab_MaxAttackers=IceCrab_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_Melee_Circle_Radius'
    begin object name=IceCrab_Melee_Circle_Radius
    end object
    IceCrab_Melee_Circle_Radius=IceCrab_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenStrikesMin'
    begin object name=IceCrab_TimeBetweenStrikesMin
    end object
    IceCrab_TimeBetweenStrikesMin=IceCrab_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenStrikesMax'
    begin object name=IceCrab_TimeBetweenStrikesMax
    end object
    IceCrab_TimeBetweenStrikesMax=IceCrab_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMin
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMin=IceCrab_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMax
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMax=IceCrab_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenTauntAttackMin'
    begin object name=IceCrab_TimeBetweenTauntAttackMin
    end object
    IceCrab_TimeBetweenTauntAttackMin=IceCrab_TimeBetweenTauntAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.IceCrab_TimeBetweenTauntAttackMax'
    begin object name=IceCrab_TimeBetweenTauntAttackMax
    end object
    IceCrab_TimeBetweenTauntAttackMax=IceCrab_TimeBetweenTauntAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_MaxAttackers'
    begin object name=Leech_MaxAttackers
    end object
    Leech_MaxAttackers=Leech_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_MaxAttackAttempters'
    begin object name=Leech_MaxAttackAttempters
    end object
    Leech_MaxAttackAttempters=Leech_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_Melee_Circle_Radius'
    begin object name=Leech_Melee_Circle_Radius
    end object
    Leech_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_TimeBetweenStrikesMin'
    begin object name=Leech_TimeBetweenStrikesMin
    end object
    Leech_TimeBetweenStrikesMin=Leech_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_TimeBetweenStrikesMax'
    begin object name=Leech_TimeBetweenStrikesMax
    end object
    Leech_TimeBetweenStrikesMax=Leech_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_TimeBetweenStrugglesMin'
    begin object name=Leech_TimeBetweenStrugglesMin
    end object
    Leech_TimeBetweenStrugglesMin=Leech_TimeBetweenStrugglesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_TimeBetweenStrugglesMax'
    begin object name=Leech_TimeBetweenStrugglesMax
    end object
    Leech_TimeBetweenStrugglesMax=Leech_TimeBetweenStrugglesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_TimeToTrackStrikesOver'
    begin object name=Leech_TimeToTrackStrikesOver
    end object
    Leech_TimeToTrackStrikesOver=Leech_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Leech_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Leech_MaxNumberOfStrikesOverTrackedTime
    end object
    Leech_MaxNumberOfStrikesOverTrackedTime=Leech_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Burrower_MaxAttackers'
    begin object name=Burrower_MaxAttackers
    end object
    Burrower_MaxAttackers=Burrower_MaxAttackers
    Burrower_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Burrower_TimeToTrackStrikesOver'
    begin object name=Burrower_TimeToTrackStrikesOver
    end object
    Burrower_TimeToTrackStrikesOver=Burrower_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Burrower_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Burrower_MaxNumberOfStrikesOverTrackedTime
    end object
    Burrower_MaxNumberOfStrikesOverTrackedTime=Burrower_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Burrower_TimeBetweenStrikesMin'
    begin object name=Burrower_TimeBetweenStrikesMin
    end object
    Burrower_TimeBetweenStrikesMin=Burrower_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Burrower_TimeBetweenStrikesMax'
    begin object name=Burrower_TimeBetweenStrikesMax
    end object
    Burrower_TimeBetweenStrikesMax=Burrower_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinTimeBetweenBurrowerAttacks'
    begin object name=MinTimeBetweenBurrowerAttacks
    end object
    MinTimeBetweenBurrowerAttacks=MinTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxTimeBetweenBurrowerAttacks'
    begin object name=MaxTimeBetweenBurrowerAttacks
    end object
    MaxTimeBetweenBurrowerAttacks=MaxTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_MaxAttackers'
    begin object name=Phadyr_MaxAttackers
    end object
    Phadyr_MaxAttackers=Phadyr_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_Melee_Circle_Radius'
    begin object name=Phadyr_Melee_Circle_Radius
    end object
    Phadyr_Melee_Circle_Radius=Phadyr_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_Melee_Circle_MinRadius'
    begin object name=Phadyr_Melee_Circle_MinRadius
    end object
    Phadyr_Melee_Circle_MinRadius=Phadyr_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_Melee_Circle_MaxRadius'
    begin object name=Phadyr_Melee_Circle_MaxRadius
    end object
    Phadyr_Melee_Circle_MaxRadius=Phadyr_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_TimeBetweenStrikesMin'
    begin object name=Phadyr_TimeBetweenStrikesMin
    end object
    Phadyr_TimeBetweenStrikesMin=Phadyr_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_TimeBetweenStrikesMax'
    begin object name=Phadyr_TimeBetweenStrikesMax
    end object
    Phadyr_TimeBetweenStrikesMax=Phadyr_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Phadyr_SectorsPerAttackerFactor'
    begin object name=Phadyr_SectorsPerAttackerFactor
    end object
    Phadyr_SectorsPerAttackerFactor=Phadyr_SectorsPerAttackerFactor
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataPlayerPawn.MedFlyer_FormationInfo'
    begin object name=MedFlyer_FormationInfo
    end object
    MedFlyer_FormationInfo=MedFlyer_FormationInfo
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataPlayerPawn.Defender_FormationInfo'
    begin object name=Defender_FormationInfo
    end object
    Defender_FormationInfo=Defender_FormationInfo
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataPlayerPawn.NushiSpore_FormationInfo'
    begin object name=NushiSpore_FormationInfo
    end object
    NushiSpore_FormationInfo=NushiSpore_FormationInfo
    DefenderRogueStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    DefenderRogueAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderVsCarrierSupport_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderVsCarrierSupport_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.HumanSoldier_MaxAttackers'
    begin object name=HumanSoldier_MaxAttackers
    end object
    HumanSoldier_MaxAttackers=HumanSoldier_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.HumanSoldier_Surround_Radius'
    begin object name=HumanSoldier_Surround_Radius
    end object
    HumanSoldier_Surround_Radius=HumanSoldier_Surround_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.HumanSoldier_MaxFireAttackers'
    begin object name=HumanSoldier_MaxFireAttackers
    end object
    HumanSoldier_MaxFireAttacker=HumanSoldier_MaxFireAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_MaxInFormation'
    begin object name=Dongo_MaxInFormation
    end object
    Dongo_MaxInFormation=Dongo_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_Formation_MinRadius'
    begin object name=Dongo_Formation_MinRadius
    end object
    Dongo_Formation_MinRadius=Dongo_Formation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_Formation_IdealRadius'
    begin object name=Dongo_Formation_IdealRadius
    end object
    Dongo_Formation_IdealRadius=Dongo_Formation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_Formation_MaxRadius'
    begin object name=Dongo_Formation_MaxRadius
    end object
    Dongo_Formation_MaxRadius=Dongo_Formation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_TimeBetweenStrikesMin'
    begin object name=Dongo_TimeBetweenStrikesMin
    end object
    Dongo_TimeBetweenStrikesMin=Dongo_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_TimeBetweenStrikesMax'
    begin object name=Dongo_TimeBetweenStrikesMax
    end object
    Dongo_TimeBetweenStrikesMax=Dongo_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMin'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMin
    end object
    Dongo_TimeBetweenWithdrawAndChargeMin=Dongo_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMax'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMax
    end object
    Dongo_TimeBetweenWithdrawAndChargeMax=Dongo_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_TimeBetweenFrenzyAttackMin'
    begin object name=Dongo_TimeBetweenFrenzyAttackMin
    end object
    Dongo_TimeBetweenFrenzyAttackMin=Dongo_TimeBetweenFrenzyAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Dongo_TimeBetweenFrenzyAttackMax'
    begin object name=Dongo_TimeBetweenFrenzyAttackMax
    end object
    Dongo_TimeBetweenFrenzyAttackMax=Dongo_TimeBetweenFrenzyAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_MaxInFormation'
    begin object name=Spitter_MaxInFormation
    end object
    Spitter_MaxInFormation=Spitter_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_MeleeFormation_MinRadius'
    begin object name=Spitter_MeleeFormation_MinRadius
    end object
    Spitter_MeleeFormation_MinRadius=Spitter_MeleeFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_MeleeFormation_IdealRadius'
    begin object name=Spitter_MeleeFormation_IdealRadius
    end object
    Spitter_MeleeFormation_IdealRadius=Spitter_MeleeFormation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_MeleeFormation_MaxRadius'
    begin object name=Spitter_MeleeFormation_MaxRadius
    end object
    Spitter_MeleeFormation_MaxRadius=Spitter_MeleeFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_SpitFrom_MinRadius'
    begin object name=Spitter_SpitFrom_MinRadius
    end object
    Spitter_SpitFrom_MinRadius=Spitter_SpitFrom_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_SpitFrom_IdealRadius'
    begin object name=Spitter_SpitFrom_IdealRadius
    end object
    Spitter_SpitFrom_IdealRadius=Spitter_SpitFrom_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Spitter_SpitFrom_MaxRadius'
    begin object name=Spitter_SpitFrom_MaxRadius
    end object
    Spitter_SpitFrom_MaxRadius=Spitter_SpitFrom_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_MaxAttackers'
    begin object name=Sepia_MaxAttackers
    end object
    Sepia_MaxAttackers=Sepia_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_MaxAttackAttempters'
    begin object name=Sepia_MaxAttackAttempters
    end object
    Sepia_MaxAttackAttempters=Sepia_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_Melee_Circle_Radius'
    begin object name=Sepia_Melee_Circle_Radius
    end object
    Sepia_Melee_Circle_Radius=Sepia_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_Melee_Circle_MinRadius'
    begin object name=Sepia_Melee_Circle_MinRadius
    end object
    Sepia_Melee_Circle_MinRadius=Sepia_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_Melee_Circle_MaxRadius'
    begin object name=Sepia_Melee_Circle_MaxRadius
    end object
    Sepia_Melee_Circle_MaxRadius=Sepia_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_SectorsPerAttackerFactor'
    begin object name=Sepia_SectorsPerAttackerFactor
    end object
    Sepia_SectorsPerAttackerFactor=Sepia_SectorsPerAttackerFactor
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_TimeBetweenStrikesMin'
    begin object name=Sepia_TimeBetweenStrikesMin
    end object
    Sepia_TimeBetweenStrikesMin=Sepia_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_TimeBetweenStrikesMax'
    begin object name=Sepia_TimeBetweenStrikesMax
    end object
    Sepia_TimeBetweenStrikesMax=Sepia_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_TimeToTrackStrikesOver'
    begin object name=Sepia_TimeToTrackStrikesOver
    end object
    Sepia_TimeToTrackStrikesOver=Sepia_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfStrikesOverTrackedTime
    end object
    Sepia_MaxNumberOfStrikesOverTrackedTime=Sepia_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_TimeToTrackLobStrikesOver'
    begin object name=Sepia_TimeToTrackLobStrikesOver
    end object
    Sepia_TimeToTrackLobStrikesOver=Sepia_TimeToTrackLobStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_MaxNumberOfLobStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    end object
    Sepia_MaxNumberOfLobStrikesOverTrackedTime=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_MinNumToCausePanicRetreat'
    begin object name=Sepia_MinNumToCausePanicRetreat
    end object
    Sepia_MinNumToCausePanicRetreat=Sepia_MinNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Sepia_MaxNumToCausePanicRetreat'
    begin object name=Sepia_MaxNumToCausePanicRetreat
    end object
    Sepia_MaxNumToCausePanicRetreat=Sepia_MaxNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Carrier_MaxInFormationD0'
    begin object name=Carrier_MaxInFormationD0
    end object
    Carrier_MaxInFormation=Carrier_MaxInFormationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Carrier_LoiterFormation_MinRadiusD0'
    begin object name=Carrier_LoiterFormation_MinRadiusD0
    end object
    Carrier_LoiterFormation_MinRadius=Carrier_LoiterFormation_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Carrier_LoiterFormation_IdealRadiusD0'
    begin object name=Carrier_LoiterFormation_IdealRadiusD0
    end object
    Carrier_LoiterFormation_IdealRadius=Carrier_LoiterFormation_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.Carrier_LoiterFormation_MaxRadiusD0'
    begin object name=Carrier_LoiterFormation_MaxRadiusD0
    end object
    Carrier_LoiterFormation_MaxRadius=Carrier_LoiterFormation_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    CarrierDefenderStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    CarrierDefenderAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VsLaroche_MaxAttackers0'
    begin object name=VsLaroche_MaxAttackers0
    end object
    VsLaroche_MaxAttackers=VsLaroche_MaxAttackers0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VsLaroche_Loiter_Circle_IdealRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_IdealRadiusD0
    end object
    VsLaroche_Loiter_Circle_IdealRadius=VsLaroche_Loiter_Circle_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VsLaroche_Loiter_Circle_MaxRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MaxRadiusD0
    end object
    VsLaroche_Loiter_Circle_MaxRadius=VsLaroche_Loiter_Circle_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VsLaroche_Loiter_Circle_MinRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MinRadiusD0
    end object
    VsLaroche_Loiter_Circle_MinRadius=VsLaroche_Loiter_Circle_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VsLaroche_TimeBetweenStrikesMinD0'
    begin object name=VsLaroche_TimeBetweenStrikesMinD0
    end object
    VsLaroche_TimeBetweenStrikesMin=VsLaroche_TimeBetweenStrikesMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VsLaroche_TimeBetweenStrikesMaxD0'
    begin object name=VsLaroche_TimeBetweenStrikesMaxD0
    end object
    VsLaroche_TimeBetweenStrikesMax=VsLaroche_TimeBetweenStrikesMaxD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MP_PackHunter_MaxInStaticFormation'
    begin object name=MP_PackHunter_MaxInStaticFormation
    end object
    MP_PackHunter_MaxInStaticFormation=MP_PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MP_PackHunter_StaticFormation_Radius'
    begin object name=MP_PackHunter_StaticFormation_Radius
    end object
    MP_PackHunter_StaticFormation_Radius=MP_PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxNumberOfDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDamageGibsForThisPlayerD0
    end object
    MaxNumberOfDamageGibsForThisPlayer=MaxNumberOfDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxNumberOfDecalsForDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    end object
    MaxNumberOfDecalsForDamageGibsForThisPlayer=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.RollDistanceMultiplierObj'
    begin object name=RollDistanceMultiplierObj
    end object
    RollDistanceMultiplier=RollDistanceMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.HealthRegenRateDifficultyModifier0'
    begin object name=HealthRegenRateDifficultyModifier0
    end object
    HealthRegenRateDifficultyModifier=HealthRegenRateDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.HealthRegenDelayDifficultyModifier0'
    begin object name=HealthRegenDelayDifficultyModifier0
    end object
    HealthRegenDelayDifficultyModifier=HealthRegenDelayDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    bDropTEnergyOnDeath=false
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    PushSpeedWhenMeleeHit=1500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    JumpAccelerationRate=820.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
        baseValue=2.0000000
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=(bEnableMeshRotation=true,MaxMeshRotation=5.0000000)
    bAllowWallSlide=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPlayerPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
    WallSlideAngle=60.0000000
    WallSlideCylinderRadius=1.0000000
    WallSlideCylinderHeight=60.0000000
}