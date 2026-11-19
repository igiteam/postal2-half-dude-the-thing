class LPTuneDataMedFlyer extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion,OrbitInvalidationHammer)
    hidecategories(Object,Object,ForkArm,GrenadeExplosionInternal,GrenadeAssist);

var(0.25_Pct) /*0x2BFC0000-0x00000400*/ private editfixedsize @NULL TimeAfterDeathExplosionBeforeDestory[589825];
var(0.25_Pct) /*0x2BFC0000-0x00000400*/ private editfixedsize @NULL bPlayDeathSpecialMove[589825];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float PlayFrontHitDeathIfAngleInDegreesGreaterThen[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float PlayLeftHitDeathIfAngleInDegreesGreaterThen[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float PlayBackHitDeathIfAngleInDegreesGreaterThen[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float PlayRightHitDeathIfAngleInDegreesGreaterThen[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private bool bDoFrozenDeathExplode[65537];
var(0.25_Pct) /*0x47C70000-0x00000000*/ private bool bHideWingsOnSpawn[65537];
var(0.25_Pct) /*0x47C70000-0x00000000*/ private bool bUnHideWingsOnDeath[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private bool bUseTimeDelayAfterGrenadeGluedBeforeExplosion[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private bool bUseMovementProgressMonitorForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceFlyerNotToAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bNotAllowedToRangeLobAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bDoOnlyForcedRangeLobAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bDoOnlyForcedFullPhysicalAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bDoOnlyForcedRamAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bNotAllowedToRamAttack[65537];
var(0.25_Pct) /*0x47C70000-0x00000400*/ private editfixedsize array WingNamesToHideOnSpawn[65537];
var(0.25_Pct) /*0x47C70000-0x00000400*/ private editfixedsize array CardWingNamesToHideOnDeath[65537];
var(0.25_Pct) /*0x58B20000-0x00000400*/ private editfixedsize @NULL DefaultMaxNodeDistanceForFlyCanReachCheck[589825];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private float HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private float MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private float DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DefaultStrikeRange[65537];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL ChanceToPerformBasicPhysicalStrike[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDurationOfDamageAssessmentWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MaxTimeForJumpBackBeforeDamageAssessment[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float PitchAngleFromTargetForBasicStrikeInDegrees[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DistanceFromTargetForBasicStrikeInUU[65537];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxRangeForMovementNodeToFindForSwoopStingStrike[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL bCanDoDirectPhysicalAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL bCanNotDoDirectPhysicalAttackToTargetInCoverEver[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike[589825];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DurationBetweenMovementDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MinMovementDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DelayAfterStartOfMovementTowardsStartOfAttackLocationAfterSwoopStingStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MaxTimeDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike[65537];
var(0.25_Pct) /*0xC7FC0000-0x00000000*/ private float HeightFromGroundTargetIsOnForStartOfAttackInUU[65537];
var(0.25_Pct) /*0xC7FC0000-0x00000000*/ private float RangeFromOrbitForStartOfAttackInUU[65537];
var(0.25_Pct) /*0xC7FC0000-0x00000000*/ private float PitchAngleFromTargetForStartOfAttackInDegrees[65537];
var(0.25_Pct) /*0xC7FC0000-0x00000000*/ private float PitchAngleFromTargetForDamageAssessmentInDegrees[65537];
var(0.25_Pct) /*0xC7FC0000-0x00000000*/ private float MaxNodeDistanceForAttackObjectiveFlyCanReachCheck[65537];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL FleeDurationWhileWaitingForOrbitClearence[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL FleeDistanceWhileWaitingForOrbitClearence[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearence[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL bFinishFleeWhenSafeWhileWaitingForOrbitClearence[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL InAttackArcDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL StingNotInAttackArcDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL RamNotInAttackArcDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL ReattackDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL RangeOfCheckForTightFlyMovement[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL RadiusOfCheckForTightFlyMovement[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL MaxRangeAllowedToDriftDuringStalk[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL UpdateRateForTacticalOrbitsPocessLookForAttackOpportunity[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehavior[589825];
var(0.25_Pct) /*0xC7FC0000-0x00000400*/ private editfixedsize @NULL WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPoke[589825];
var(0.25_Pct) /*0x9E4A0000-0x00000400*/ private editfixedsize @NULL bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttack[589825];
var(0.25_Pct) /*0x9E4A0000-0x00000400*/ private editfixedsize @NULL bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttack[589825];
var(0.25_Pct) /*0x9E4A0000-0x00000400*/ private editfixedsize @NULL bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttack[589825];
var(0.25_Pct) /*0x9E4A0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlagging[589825];
var(0.25_Pct) /*0x9E4A0000-0x00000400*/ private editfixedsize @NULL MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDown[589825];
var(0.25_Pct) /*0x9E4A0000-0x00000400*/ private editfixedsize @NULL FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammer[589825];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float PitchAngleFromTargetForBasicRangedStrikeInDegrees[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float DistanceFromTargetForBasicRangedStrikeInUU[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float MinRangeForBasicRangedStrike[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float MaxRangeForBasicRangedStrike[65537];
var(0.25_Pct) /*0xA9560000-0x00000400*/ private editfixedsize @NULL MinRangedStrikeZoneDistance[589825];
var(0.25_Pct) /*0xA9560000-0x00000400*/ private editfixedsize @NULL MaxRangedStrikeZoneDistance[589825];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float PitchAngleFromTargetVsForBasicRangedStrikeInDegrees[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float DistanceFromTargetVsForBasicRangedStrikeInUU[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float MinRangeFromTargetVsForBasicRangedStrike[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private int MaxNumberOfTimesMoveToStartOfAttackPointIsAllowedToFail[65537];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private int MaxNumberOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThereIsAllowedToHappen[65537];
var(0.25_Pct) /*0xA9560000-0x00000400*/ private editfixedsize @NULL MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdate[589825];
var(0.25_Pct) /*0xA9560000-0x00000000*/ private float MaxRangeForLobFirePointBeforeAllowedToFire[65537];
var(0.25_Pct) /*0xA9560000-0x00000400*/ private editfixedsize @NULL MaxRangeForMovementNodeToFindForLobStrike[589825];
var(0.25_Pct) /*0xA9560000-0x00000400*/ private editfixedsize @NULL bCanDoLobProjectileAttack[589825];
var(0.25_Pct) /*0x473C0000-0x00000400*/ private editfixedsize @NULL MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdate[589825];
var(0.25_Pct) /*0x473C0000-0x00000000*/ private int DirectFireProjectileSpreadHorizontal[65537];
var(0.25_Pct) /*0x473C0000-0x00000000*/ private int DirectFireProjectileSpreadVertical[65537];
var(0.25_Pct) /*0x473C0000-0x00000400*/ private editfixedsize @NULL DirectFireLaunchVelocityMin[589825];
var(0.25_Pct) /*0x473C0000-0x00000400*/ private editfixedsize @NULL DirectFireLaunchVelocityMax[589825];
var(0.25_Pct) /*0x473C0000-0x00000000*/ private float MaxRangeForDirectFirePointBeforeAllowedToFire[65537];
var(0.25_Pct) /*0x473C0000-0x00000400*/ private editfixedsize @NULL MaxRangeForMovementNodeToFindForDirectFireStrike[589825];
var(0.25_Pct) /*0x473C0000-0x00000400*/ private editfixedsize @NULL bCanDoDirectFireProjectileAttack[589825];
var(0.25_Pct) /*0x473C0000-0x00000000*/ private @NULL OffsetForCalcOfDiectFireForStrike[65537];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitHorizontalImpulse[589825];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitUpwardImpulse[589825];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitImpulseSizeFactor[589825];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitTimeAfterHitBeforeDestory[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TimeAfterDeathExplosionBeforeDestoryD0'
    begin object name=TimeAfterDeathExplosionBeforeDestoryD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeAfterDeathExplosionBeforeDestory=TimeAfterDeathExplosionBeforeDestoryD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bPlayDeathSpecialMoveD0'
    begin object name=bPlayDeathSpecialMoveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bPlayDeathSpecialMove=bPlayDeathSpecialMoveD0
    PlayFrontHitDeathIfAngleInDegreesGreaterThen=335.0000000
    PlayLeftHitDeathIfAngleInDegreesGreaterThen=225.0000000
    PlayBackHitDeathIfAngleInDegreesGreaterThen=135.0000000
    PlayRightHitDeathIfAngleInDegreesGreaterThen=45.0000000
    bDoFrozenDeathExplode=true
    bHideWingsOnSpawn=true
    bUnHideWingsOnDeath=true
    bUseMovementProgressMonitorForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DefaultMaxNodeDistanceForFlyCanReachCheckD0'
    begin object name=DefaultMaxNodeDistanceForFlyCanReachCheckD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMaxNodeDistanceForFlyCanReachCheck=DefaultMaxNodeDistanceForFlyCanReachCheckD0
    HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion=1.0450000
    MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion=2.0000000
    DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinTimeBetweenAttacksDefaultObject'
    begin object name=MinTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenAttacks=MinTimeBetweenAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxTimeBetweenAttacksDefaultObject'
    begin object name=MaxTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenAttacks=MaxTimeBetweenAttacksDefaultObject
    DefaultStrikeRange=300.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttack=MinNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttack=MaxNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDurationOfDamageAssessmentWhenDirectAttackD0'
    begin object name=MaxDurationOfDamageAssessmentWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDurationOfDamageAssessmentWhenDirectAttack=MaxDurationOfDamageAssessmentWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinAmountOfDamageRequiredToStopAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=110.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopAttack=MinAmountOfDamageRequiredToStopAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxAmountOfDamageRequiredToStopAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=120.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopAttack=MaxAmountOfDamageRequiredToStopAttackD0
    MaxTimeForJumpBackBeforeDamageAssessment=10.0000000
    PitchAngleFromTargetForBasicStrikeInDegrees=45.0000000
    DistanceFromTargetForBasicStrikeInUU=100.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeForMovementNodeToFindForSwoopStingStrikeD0'
    begin object name=MaxRangeForMovementNodeToFindForSwoopStingStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeForMovementNodeToFindForSwoopStingStrike=MaxRangeForMovementNodeToFindForSwoopStingStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bCanDoDirectPhysicalAttackD0'
    begin object name=bCanDoDirectPhysicalAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bCanDoDirectPhysicalAttack=bCanDoDirectPhysicalAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bCanNotDoDirectPhysicalAttackToTargetInCoverEverD0'
    begin object name=bCanNotDoDirectPhysicalAttackToTargetInCoverEverD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bCanNotDoDirectPhysicalAttackToTargetInCoverEver=bCanNotDoDirectPhysicalAttackToTargetInCoverEverD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrikeD0'
    begin object name=MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrikeD0
    DurationBetweenMovementDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=0.1000000
    MinMovementDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=200.0000000
    DelayAfterStartOfMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=2.0000000
    MaxTimeDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike=3.0000000
    HeightFromGroundTargetIsOnForStartOfAttackInUU=500.0000000
    RangeFromOrbitForStartOfAttackInUU=1000.0000000
    PitchAngleFromTargetForStartOfAttackInDegrees=20.0000000
    PitchAngleFromTargetForDamageAssessmentInDegrees=30.0000000
    MaxNodeDistanceForAttackObjectiveFlyCanReachCheck=800.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.FleeDurationWhileWaitingForOrbitClearenceD0'
    begin object name=FleeDurationWhileWaitingForOrbitClearenceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeDurationWhileWaitingForOrbitClearence=FleeDurationWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.FleeDistanceWhileWaitingForOrbitClearenceD0'
    begin object name=FleeDistanceWhileWaitingForOrbitClearenceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeDistanceWhileWaitingForOrbitClearence=FleeDistanceWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearenceD0'
    begin object name=MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearenceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearence=MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bFinishFleeWhenSafeWhileWaitingForOrbitClearenceD0'
    begin object name=bFinishFleeWhenSafeWhileWaitingForOrbitClearenceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bFinishFleeWhenSafeWhileWaitingForOrbitClearence=bFinishFleeWhenSafeWhileWaitingForOrbitClearenceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.InAttackArcDesirabilityOfAttackScalerD0'
    begin object name=InAttackArcDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    InAttackArcDesirabilityOfAttackScaler=InAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.StingNotInAttackArcDesirabilityOfAttackScalerD0'
    begin object name=StingNotInAttackArcDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StingNotInAttackArcDesirabilityOfAttackScaler=StingNotInAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RamNotInAttackArcDesirabilityOfAttackScalerD0'
    begin object name=RamNotInAttackArcDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RamNotInAttackArcDesirabilityOfAttackScaler=RamNotInAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.ReattackDesirabilityOfAttackScalerD0'
    begin object name=ReattackDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReattackDesirabilityOfAttackScaler=ReattackDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RangeOfCheckForTightFlyMovementD0'
    begin object name=RangeOfCheckForTightFlyMovementD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RangeOfCheckForTightFlyMovement=RangeOfCheckForTightFlyMovementD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RadiusOfCheckForTightFlyMovementD0'
    begin object name=RadiusOfCheckForTightFlyMovementD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RadiusOfCheckForTightFlyMovement=RadiusOfCheckForTightFlyMovementD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeAllowedToDriftDuringStalkD0'
    begin object name=MaxRangeAllowedToDriftDuringStalkD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=450.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeAllowedToDriftDuringStalk=MaxRangeAllowedToDriftDuringStalkD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.UpdateRateForTacticalOrbitsPocessLookForAttackOpportunityD0'
    begin object name=UpdateRateForTacticalOrbitsPocessLookForAttackOpportunityD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UpdateRateForTacticalOrbitsPocessLookForAttackOpportunity=UpdateRateForTacticalOrbitsPocessLookForAttackOpportunityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehaviorD0'
    begin object name=DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehaviorD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehavior=DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehaviorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPokeD0'
    begin object name=WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPokeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPoke=WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPokeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttackD0'
    begin object name=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttack=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttackD0'
    begin object name=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttack=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttackD0'
    begin object name=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttack=bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlaggingD0'
    begin object name=MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlaggingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlagging=MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlaggingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDownD0'
    begin object name=MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDownD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDown=MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDownD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammerD0'
    begin object name=FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammer=FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammerD0
    PitchAngleFromTargetForBasicRangedStrikeInDegrees=17.0000000
    DistanceFromTargetForBasicRangedStrikeInUU=1100.0000000
    MinRangeForBasicRangedStrike=1000.0000000
    MaxRangeForBasicRangedStrike=1800.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinRangedStrikeZoneDistanceD0'
    begin object name=MinRangedStrikeZoneDistanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRangedStrikeZoneDistance=MinRangedStrikeZoneDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangedStrikeZoneDistanceD0'
    begin object name=MaxRangedStrikeZoneDistanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangedStrikeZoneDistance=MaxRangedStrikeZoneDistanceD0
    PitchAngleFromTargetVsForBasicRangedStrikeInDegrees=45.0000000
    DistanceFromTargetVsForBasicRangedStrikeInUU=750.0000000
    MinRangeFromTargetVsForBasicRangedStrike=500.0000000
    MaxNumberOfTimesMoveToStartOfAttackPointIsAllowedToFail=2
    MaxNumberOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThereIsAllowedToHappen=5
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdateD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdateD0
    MaxRangeForLobFirePointBeforeAllowedToFire=75.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeForMovementNodeToFindForLobStrikeD0'
    begin object name=MaxRangeForMovementNodeToFindForLobStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeForMovementNodeToFindForLobStrike=MaxRangeForMovementNodeToFindForLobStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bCanDoLobProjectileAttackD0'
    begin object name=bCanDoLobProjectileAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bCanDoLobProjectileAttack=bCanDoLobProjectileAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdateD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdateD0
    DirectFireProjectileSpreadHorizontal=100
    DirectFireProjectileSpreadVertical=100
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DirectFireLaunchVelocityMinD0'
    begin object name=DirectFireLaunchVelocityMinD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DirectFireLaunchVelocityMin=DirectFireLaunchVelocityMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DirectFireLaunchVelocityMaxD0'
    begin object name=DirectFireLaunchVelocityMaxD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DirectFireLaunchVelocityMax=DirectFireLaunchVelocityMaxD0
    MaxRangeForDirectFirePointBeforeAllowedToFire=500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeForMovementNodeToFindForDirectFireStrikeD0'
    begin object name=MaxRangeForMovementNodeToFindForDirectFireStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeForMovementNodeToFindForDirectFireStrike=MaxRangeForMovementNodeToFindForDirectFireStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bCanDoDirectFireProjectileAttackD0'
    begin object name=bCanDoDirectFireProjectileAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bCanDoDirectFireProjectileAttack=bCanDoDirectFireProjectileAttackD0
    OffsetForCalcOfDiectFireForStrike=(X=95.0000000,Y=0.0000000,Z=55.0000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MeleeHitHorizontalImpulseD0'
    begin object name=MeleeHitHorizontalImpulseD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitHorizontalImpulse=MeleeHitHorizontalImpulseD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MeleeHitUpwardImpulseD0'
    begin object name=MeleeHitUpwardImpulseD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitUpwardImpulse=MeleeHitUpwardImpulseD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MeleeHitImpulseSizeFactorD0'
    begin object name=MeleeHitImpulseSizeFactorD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitImpulseSizeFactor=MeleeHitImpulseSizeFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MeleeHitTimeAfterHitBeforeDestoryD0'
    begin object name=MeleeHitTimeAfterHitBeforeDestoryD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitTimeAfterHitBeforeDestory=MeleeHitTimeAfterHitBeforeDestoryD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.HowMuchToIncreaseHealthByWhenConsumingGrenadeD0'
    begin object name=HowMuchToIncreaseHealthByWhenConsumingGrenadeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HowMuchToIncreaseHealthByWhenConsumingGrenade=HowMuchToIncreaseHealthByWhenConsumingGrenadeD0
    HowMuchToIncreaseSizeByWhenConsumingGrenade=1.1000000
    MaxSizeToIncreaseSizeByWhenConsumingGrenade=2.5000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    bShouldGrenadesIRunOverExplode=false
    bAbleToAdjustLobAimPositionForGameplay=true
    bAbleToAdjustDirectFireAimPositionForGameplay=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.NormalMaxSpeedScale_TunableD0'
    begin object name=NormalMaxSpeedScale_TunableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.WanderingMaxSpeedScale_TunableD0'
    begin object name=WanderingMaxSpeedScale_TunableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.FleeingMaxSpeedScale_TunableD0'
    begin object name=FleeingMaxSpeedScale_TunableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.FleeDistance'
    begin object name=FleeDistance class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    AttacksArcs=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    NumOfLobStrikeLocationsToLookForAtEachRange=5.0000000
    RangedLobStrikeInfoByTier=/* Array type was not detected. */
    RangedLobStrikeInfoByZone=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    RangedDirectFireStrikeInfoByZone=/* Array type was not detected. */
    RangedDirectFireStrikeInfoByTier=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    RadarParams=(IconType=EMapIconTypes.EMapIcon_GenericRed,bIconStaysOnEdge=true)
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.GroundSpeed_TunableD0'
    begin object name=GroundSpeed_TunableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    GroundSpeed_Tunable=GroundSpeed_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.AccelerationRate_TunableD0'
    begin object name=AccelerationRate_TunableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AccelerationRate_Tunable=AccelerationRate_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=(ConformType=EFloorConformType.EFCT_Floor)
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataMedFlyer.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}