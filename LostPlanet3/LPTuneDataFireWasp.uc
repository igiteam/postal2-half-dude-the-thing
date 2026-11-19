class LPTuneDataFireWasp extends LPTuneDataMedFlyer
    dontsortcategories(StopingLocomotion,OrbitInvalidationHammer)
    hidecategories(Object,Object,ForkArm,GrenadeExplosionInternal,GrenadeAssist,Object,AIBurstFire,ChargeAttack,GrenadeExplosionInternal,GrenadeAssist,HealthRegen,EMP,Attackers,Cover,Mantle,AIAccuracy,AIFiring,AICover,AICombat,PlayerSprint,MovementAimDownSight,MovementAimGrenade,AmmoTypes);

var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL StingAttackAgainstTargetOnPathTrackerMaxSpeedScale[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL StingAttackAgainstTargetOnPathTrackerAccelRate[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL PursuitModeAgainstTargetOnPathTrackerMaxSpeedScale[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL PursuitModeAgainstTargetOnPathTrackerAccelRate[589825];
var(0.25_Pct) /*0xC56E0000-0x00000400*/ private editfixedsize @NULL AmountToScaleStingAnnounceEffect[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL MaxAllowedStomachTailGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PreIdleStomachTailGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL IdleStomachTailGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL StingAttackStomachTailGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL MaxAllowedMouthGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PreIdleMouthGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL IdleMouthGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL StruggleAttackMouthGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL MaxAllowedLegsGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PreIdleLegsGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL IdleLegsGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL AggressiveLegsGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL MaxAllowedHeadSpikesGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PreIdleHeadSpikesGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL IdleHeadSpikesGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PlasmaLobAttackHeadSpikesGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL MaxAllowedWingsGlow[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PreIdleWingsGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL IdleWingsGlowFactor[589825];
var(0.25_Pct) /*0x57E30000-0x00000400*/ private editfixedsize @NULL PlasmaLobAttackWingsGlow[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL StingAttackMinRangeToTargetOnPathTrackerToUseSpeedBoost[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL StingAttackMinSpeedOfPathTrackerToUseSpeedBoost[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoost[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL PursuitModeMinSpeedOfPathTrackerToUseSpeedBoost[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxTimeToKeepUnseenEnemy[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL RamAttackMoveSpeedScale[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.StingAttackAgainstTargetOnPathTrackerMaxSpeedScaleD0'
    begin object name=StingAttackAgainstTargetOnPathTrackerMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StingAttackAgainstTargetOnPathTrackerMaxSpeedScale=StingAttackAgainstTargetOnPathTrackerMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.StingAttackAgainstTargetOnPathTrackerAccelRateD0'
    begin object name=StingAttackAgainstTargetOnPathTrackerAccelRateD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StingAttackAgainstTargetOnPathTrackerAccelRate=StingAttackAgainstTargetOnPathTrackerAccelRateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerMaxSpeedScaleD0'
    begin object name=PursuitModeAgainstTargetOnPathTrackerMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PursuitModeAgainstTargetOnPathTrackerMaxSpeedScale=PursuitModeAgainstTargetOnPathTrackerMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerAccelRateD0'
    begin object name=PursuitModeAgainstTargetOnPathTrackerAccelRateD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PursuitModeAgainstTargetOnPathTrackerAccelRate=PursuitModeAgainstTargetOnPathTrackerAccelRateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AmountToScaleStingAnnounceEffectD0'
    begin object name=AmountToScaleStingAnnounceEffectD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountToScaleStingAnnounceEffect=AmountToScaleStingAnnounceEffectD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAllowedStomachTailGlowD0'
    begin object name=MaxAllowedStomachTailGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAllowedStomachTailGlow=MaxAllowedStomachTailGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PreIdleStomachTailGlowD0'
    begin object name=PreIdleStomachTailGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PreIdleStomachTailGlowFactor=PreIdleStomachTailGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IdleStomachTailGlowD0'
    begin object name=IdleStomachTailGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdleStomachTailGlowFactor=IdleStomachTailGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AttackStomachTailGlowD0'
    begin object name=AttackStomachTailGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StingAttackStomachTailGlowFactor=AttackStomachTailGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAllowedMouthGlowD0'
    begin object name=MaxAllowedMouthGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAllowedMouthGlow=MaxAllowedMouthGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PreIdleMouthGlowD0'
    begin object name=PreIdleMouthGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PreIdleMouthGlowFactor=PreIdleMouthGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IdleMouthGlowD0'
    begin object name=IdleMouthGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdleMouthGlowFactor=IdleMouthGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AttackMouthGlowD0'
    begin object name=AttackMouthGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StruggleAttackMouthGlow=AttackMouthGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAllowedLegsGlowD0'
    begin object name=MaxAllowedLegsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAllowedLegsGlow=MaxAllowedLegsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PreIdleLegsGlowD0'
    begin object name=PreIdleLegsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PreIdleLegsGlowFactor=PreIdleLegsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IdleLegsGlowD0'
    begin object name=IdleLegsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdleLegsGlowFactor=IdleLegsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AttackLegsGlowD0'
    begin object name=AttackLegsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AggressiveLegsGlow=AttackLegsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAllowedHeadSpikesGlowD0'
    begin object name=MaxAllowedHeadSpikesGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAllowedHeadSpikesGlow=MaxAllowedHeadSpikesGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PreIdleHeadSpikesGlowD0'
    begin object name=PreIdleHeadSpikesGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PreIdleHeadSpikesGlowFactor=PreIdleHeadSpikesGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IdleHeadSpikesGlowD0'
    begin object name=IdleHeadSpikesGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdleHeadSpikesGlowFactor=IdleHeadSpikesGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AttackHeadSpikesGlowD0'
    begin object name=AttackHeadSpikesGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PlasmaLobAttackHeadSpikesGlow=AttackHeadSpikesGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAllowedWingsGlowD0'
    begin object name=MaxAllowedWingsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAllowedWingsGlow=MaxAllowedWingsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PreIdleWingsGlowD0'
    begin object name=PreIdleWingsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PreIdleWingsGlowFactor=PreIdleWingsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IdleWingsGlowD0'
    begin object name=IdleWingsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdleWingsGlowFactor=IdleWingsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AttackWingsGlowD0'
    begin object name=AttackWingsGlowD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PlasmaLobAttackWingsGlow=AttackWingsGlowD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.StingAttackMinRangeToTargetOnPathTrackerToUseSpeedBoostD0'
    begin object name=StingAttackMinRangeToTargetOnPathTrackerToUseSpeedBoostD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StingAttackMinRangeToTargetOnPathTrackerToUseSpeedBoost=StingAttackMinRangeToTargetOnPathTrackerToUseSpeedBoostD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.StingAttackMinSpeedOfPathTrackerToUseSpeedBoostD0'
    begin object name=StingAttackMinSpeedOfPathTrackerToUseSpeedBoostD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StingAttackMinSpeedOfPathTrackerToUseSpeedBoost=StingAttackMinSpeedOfPathTrackerToUseSpeedBoostD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoostD0'
    begin object name=PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoostD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoost=PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoostD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PursuitModeMinSpeedOfPathTrackerToUseSpeedBoostD0'
    begin object name=PursuitModeMinSpeedOfPathTrackerToUseSpeedBoostD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PursuitModeMinSpeedOfPathTrackerToUseSpeedBoost=PursuitModeMinSpeedOfPathTrackerToUseSpeedBoostD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxTimeToKeepUnseenEnemy0'
    begin object name=MaxTimeToKeepUnseenEnemy0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToKeepUnseenEnemy=MaxTimeToKeepUnseenEnemy0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RamAttackMoveSpeedScale0'
    begin object name=RamAttackMoveSpeedScale0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RamAttackMoveSpeedScale=RamAttackMoveSpeedScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TimeAfterDeathExplosionBeforeDestoryD0'
    begin object name=TimeAfterDeathExplosionBeforeDestoryD0
    end object
    TimeAfterDeathExplosionBeforeDestory=TimeAfterDeathExplosionBeforeDestoryD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bPlayDeathSpecialMoveD0'
    begin object name=bPlayDeathSpecialMoveD0
    end object
    bPlayDeathSpecialMove=bPlayDeathSpecialMoveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DefaultMaxNodeDistanceForFlyCanReachCheckD0'
    begin object name=DefaultMaxNodeDistanceForFlyCanReachCheckD0
    end object
    DefaultMaxNodeDistanceForFlyCanReachCheck=DefaultMaxNodeDistanceForFlyCanReachCheckD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinTimeBetweenAttacksDefaultObject'
    begin object name=MinTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenAttacks=MinTimeBetweenAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxTimeBetweenAttacksDefaultObject'
    begin object name=MaxTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenAttacks=MaxTimeBetweenAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttack=MinNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttack=MaxNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDurationOfDamageAssessmentWhenDirectAttackD0'
    begin object name=MaxDurationOfDamageAssessmentWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDurationOfDamageAssessmentWhenDirectAttack=MaxDurationOfDamageAssessmentWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinAmountOfDamageRequiredToStopAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopAttack=MinAmountOfDamageRequiredToStopAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAmountOfDamageRequiredToStopAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopAttack=MaxAmountOfDamageRequiredToStopAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeForMovementNodeToFindForSwoopStingStrikeD0'
    begin object name=MaxRangeForMovementNodeToFindForSwoopStingStrikeD0
    end object
    MaxRangeForMovementNodeToFindForSwoopStingStrike=MaxRangeForMovementNodeToFindForSwoopStingStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bCanDoDirectPhysicalAttackD0'
    begin object name=bCanDoDirectPhysicalAttackD0
    end object
    bCanDoDirectPhysicalAttack=bCanDoDirectPhysicalAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bCanNotDoDirectPhysicalAttackToTargetInCoverEverD0'
    begin object name=bCanNotDoDirectPhysicalAttackToTargetInCoverEverD0
    end object
    bCanNotDoDirectPhysicalAttackToTargetInCoverEver=bCanNotDoDirectPhysicalAttackToTargetInCoverEverD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrikeD0'
    begin object name=MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrikeD0
    end object
    MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.FleeDurationWhileWaitingForOrbitClearenceD0'
    begin object name=FleeDurationWhileWaitingForOrbitClearenceD0
    end object
    FleeDurationWhileWaitingForOrbitClearence=FleeDurationWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.FleeDistanceWhileWaitingForOrbitClearenceD0'
    begin object name=FleeDistanceWhileWaitingForOrbitClearenceD0
    end object
    FleeDistanceWhileWaitingForOrbitClearence=FleeDistanceWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearenceD0'
    begin object name=MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearenceD0
    end object
    MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearence=MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bFinishFleeWhenSafeWhileWaitingForOrbitClearenceD0'
    begin object name=bFinishFleeWhenSafeWhileWaitingForOrbitClearenceD0
    end object
    bFinishFleeWhenSafeWhileWaitingForOrbitClearence=bFinishFleeWhenSafeWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.InAttackArcDesirabilityOfAttackScalerD0'
    begin object name=InAttackArcDesirabilityOfAttackScalerD0
    end object
    InAttackArcDesirabilityOfAttackScaler=InAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.StingNotInAttackArcDesirabilityOfAttackScalerD0'
    begin object name=StingNotInAttackArcDesirabilityOfAttackScalerD0
    end object
    StingNotInAttackArcDesirabilityOfAttackScaler=StingNotInAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RamNotInAttackArcDesirabilityOfAttackScalerD0'
    begin object name=RamNotInAttackArcDesirabilityOfAttackScalerD0
    end object
    RamNotInAttackArcDesirabilityOfAttackScaler=RamNotInAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.ReattackDesirabilityOfAttackScalerD0'
    begin object name=ReattackDesirabilityOfAttackScalerD0
    end object
    ReattackDesirabilityOfAttackScaler=ReattackDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RangeOfCheckForTightFlyMovementD0'
    begin object name=RangeOfCheckForTightFlyMovementD0
    end object
    RangeOfCheckForTightFlyMovement=RangeOfCheckForTightFlyMovementD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RadiusOfCheckForTightFlyMovementD0'
    begin object name=RadiusOfCheckForTightFlyMovementD0
    end object
    RadiusOfCheckForTightFlyMovement=RadiusOfCheckForTightFlyMovementD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeAllowedToDriftDuringStalkD0'
    begin object name=MaxRangeAllowedToDriftDuringStalkD0
    end object
    MaxRangeAllowedToDriftDuringStalk=MaxRangeAllowedToDriftDuringStalkD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.UpdateRateForTacticalOrbitsPocessLookForAttackOpportunityD0'
    begin object name=UpdateRateForTacticalOrbitsPocessLookForAttackOpportunityD0
    end object
    UpdateRateForTacticalOrbitsPocessLookForAttackOpportunity=UpdateRateForTacticalOrbitsPocessLookForAttackOpportunityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehaviorD0'
    begin object name=DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehaviorD0
    end object
    DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehavior=DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehaviorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPokeD0'
    begin object name=WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPokeD0
    end object
    WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPoke=WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPokeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttackD0'
    begin object name=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttackD0
    end object
    bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttack=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttackD0'
    begin object name=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttackD0
    end object
    bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttack=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttackD0'
    begin object name=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttackD0
    end object
    bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttack=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlaggingD0'
    begin object name=MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlaggingD0
    end object
    MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlagging=MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlaggingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDownD0'
    begin object name=MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDownD0
    end object
    MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDown=MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDownD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammerD0'
    begin object name=FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammerD0
    end object
    FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammer=FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinRangedStrikeZoneDistanceD0'
    begin object name=MinRangedStrikeZoneDistanceD0
    end object
    MinRangedStrikeZoneDistance=MinRangedStrikeZoneDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangedStrikeZoneDistanceD0'
    begin object name=MaxRangedStrikeZoneDistanceD0
    end object
    MaxRangedStrikeZoneDistance=MaxRangedStrikeZoneDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeForMovementNodeToFindForLobStrikeD0'
    begin object name=MaxRangeForMovementNodeToFindForLobStrikeD0
    end object
    MaxRangeForMovementNodeToFindForLobStrike=MaxRangeForMovementNodeToFindForLobStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bCanDoLobProjectileAttackD0'
    begin object name=bCanDoLobProjectileAttackD0
    end object
    bCanDoLobProjectileAttack=bCanDoLobProjectileAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DirectFireLaunchVelocityMinD0'
    begin object name=DirectFireLaunchVelocityMinD0
    end object
    DirectFireLaunchVelocityMin=DirectFireLaunchVelocityMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DirectFireLaunchVelocityMaxD0'
    begin object name=DirectFireLaunchVelocityMaxD0
    end object
    DirectFireLaunchVelocityMax=DirectFireLaunchVelocityMaxD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeForMovementNodeToFindForDirectFireStrikeD0'
    begin object name=MaxRangeForMovementNodeToFindForDirectFireStrikeD0
    end object
    MaxRangeForMovementNodeToFindForDirectFireStrike=MaxRangeForMovementNodeToFindForDirectFireStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bCanDoDirectFireProjectileAttackD0'
    begin object name=bCanDoDirectFireProjectileAttackD0
    end object
    bCanDoDirectFireProjectileAttack=bCanDoDirectFireProjectileAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MeleeHitHorizontalImpulseD0'
    begin object name=MeleeHitHorizontalImpulseD0
    end object
    MeleeHitHorizontalImpulse=MeleeHitHorizontalImpulseD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MeleeHitUpwardImpulseD0'
    begin object name=MeleeHitUpwardImpulseD0
    end object
    MeleeHitUpwardImpulse=MeleeHitUpwardImpulseD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MeleeHitImpulseSizeFactorD0'
    begin object name=MeleeHitImpulseSizeFactorD0
    end object
    MeleeHitImpulseSizeFactor=MeleeHitImpulseSizeFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MeleeHitTimeAfterHitBeforeDestoryD0'
    begin object name=MeleeHitTimeAfterHitBeforeDestoryD0
    end object
    MeleeHitTimeAfterHitBeforeDestory=MeleeHitTimeAfterHitBeforeDestoryD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.HowMuchToIncreaseHealthByWhenConsumingGrenadeD0'
    begin object name=HowMuchToIncreaseHealthByWhenConsumingGrenadeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HowMuchToIncreaseHealthByWhenConsumingGrenade=HowMuchToIncreaseHealthByWhenConsumingGrenadeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.NormalMaxSpeedScale_TunableD0'
    begin object name=NormalMaxSpeedScale_TunableD0
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.WanderingMaxSpeedScale_TunableD0'
    begin object name=WanderingMaxSpeedScale_TunableD0
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.FleeingMaxSpeedScale_TunableD0'
    begin object name=FleeingMaxSpeedScale_TunableD0
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.FleeDistance'
    begin object name=FleeDistance class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    ReactiveAttacksArcs=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    bDropTEnergyOnDeath=false
    bDropTEnergyOnFreeze=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.GroundSpeed_TunableD0'
    begin object name=GroundSpeed_TunableD0
    end object
    GroundSpeed_Tunable=GroundSpeed_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.AccelerationRate_TunableD0'
    begin object name=AccelerationRate_TunableD0
    end object
    AccelerationRate_Tunable=AccelerationRate_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataFireWasp.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}