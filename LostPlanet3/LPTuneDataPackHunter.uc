class LPTuneDataPackHunter extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion,Melee,SwipeAttack,DirectAttack,DashAttack,CombatLighting,TacticalWait,Multiplayer)
    hidecategories(Object,Object,MortarAttack);

struct native PackHunterBoneNameToCoreId
{
    var(0.25_Pct) /*0x9F970000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0x9F970000-0x00000000*/ private byte CoreID[65537];

    structdefaultproperties
    {
        BoneName="None"
        CoreID=ePackHunterCore.ePackHunterCore_Mouth
    }
};

var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL TimeToWaitAfterStartingCircleBehaviorToTryDash[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DashStrikeLineSweepHitTestFrequency[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DistanceAwayFromCenterLineToRegDashRam[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL DistanceCirclingDoSwipe[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DistanceLessThenThatIsToCloseToHuntersPathToMeleePoint[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float NumOfDashStartPositionShiftsPerStaticFormationRoundOfChecks[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float ShiftDistancePerStaticFormationAttemptToFindDashStartPostion[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MaxTimeForForEntireDashStrike[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL BiteDefaultDamage[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float MinSpeedToAllowTheHunterToSlideStopBeforeAnnounce[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float WaitTimeBetweenChecksForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL ChanceToStopAndStikeWhileStockingOrMovingToMeleeSlotAndTakingHits[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DistanceOffPathToMeleeSlotToStartLookingForWaypoint[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DecrementDistanceForLookingForWaypointOffSlotPath[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private bool bUseByPassFormationWaypointsOnMoveToSlot[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private bool bZeroHunterVelocityAtStartOfDashStrike[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private bool bPerformPreDashStrikeStartAction[65537];
var(0.25_Pct) /*0xBB380000-0x00000000*/ private bool bUseSoloAggressivePulse[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private bool bAllowUseTacticalWaitAggressivePulse[65537];
var(0.25_Pct) /*0x25B90000-0x00000000*/ private bool bUseEmissiveLightingToShowWhoHasTheStrikeAccess[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForce360TailSwipe[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bDoOnlyForcedDashAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bDoOnlyForcedDirectAttack[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private class WaitForMeleeFormationClearenceSpecialMove[65537];
var(0.25_Pct) /*0xC7FB0000-0x00000400*/ private editfixedsize @NULL InAttackArcDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FB0000-0x00000400*/ private editfixedsize @NULL DashAttackNotInAttackArcDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FB0000-0x00000400*/ private editfixedsize @NULL DirectAttackNotInAttackArcDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0xC7FB0000-0x00000400*/ private editfixedsize @NULL ReattackDesirabilityOfAttackScaler[589825];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float DashAttackPauseTimeWhileLaunchingIntoStrike[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenDashAttacks[589825];
var(0.25_Pct) /*0x2BAA0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenDashAttacks[589825];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float DashClawStrikeStartDistance[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float DashStrikeDistanceToTheSideOfTargetToAimFor[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float DashStrikeDistancePastTheTargetToAimFor[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float MinDistanceAwayFromTheVsForEnemyToBeBeforeTryingDashSttack[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float MinDistanceAwayFromTheHunterForEnemyToBeBeforeTryingDashSttack[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000400*/ private editfixedsize @NULL DistanceAwayFromEnemyToMoveAfterCompletionOfDashStrike[589825];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float ReductionDistanceForEachSuccessiveDashStrikeRunOut[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float DurationBetweenMovementDeltaDuringDashRunOut[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float MinMovementDeltaDuringDashRunOut[65537];
var(0.25_Pct) /*0x2BAA0000-0x00000000*/ private float DelayAfterStartOfDashRunOutBeforeMonitorStarts[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfMoveToDashStrike[65537];
var(0.25_Pct) /*0xC7B10000-0x00000000*/ private float DistanceStopAndStrike[65537];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL DelayDuringFormationMovementsBeforeAllowedToProximityAttack[589825];
var(0.25_Pct) /*0xC7B10000-0x00000000*/ private float MaxDistanceAwayForTurnAndClawSwipeAttack[65537];
var(0.25_Pct) /*0xC7B10000-0x00000000*/ private int DiffBetweenDesiredAndTrueRotationToStartTurnAndSwipeAttack[65537];
var(0.25_Pct) /*0xC7B10000-0x00000000*/ private float YawTurnRateWhenPlayerTooClose[65537];
var(0.25_Pct) /*0xC7B10000-0x00000000*/ private float MaxTimeForForFastSwipe[65537];
var(0.25_Pct) /*0xBDBF0000-0x00000000*/ private float StalkingMaxSpeedScale[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float RangeToTargetForBiteStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float RangeToTargetForMediumClawLungeStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MaxRangeToTargetForFarClawLungeStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float IdealDirectAttackStrikeRange[65537];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDurationOfDamageAssessmentWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxTimeOfDamageEventWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfNonCoreDamageToTakeInADamageEventWhenDirectAttackFromStaticFormation[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DirectAttackToJumpBackToRenengageHorizAngRangeInDegrees[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MaxTimeForJumpBackBeforeDamageAssessment[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float PercentChanceOfTailStingAttack[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float PercentChanceOfTailStingAttackShortRange[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float PercentChanceOfTailStingAttackLongRange[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float PercentChanceOfTailWhipAttackInsteadOfBiteForTheAlpha[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MinZDistanceToRequireMoveBeforeStrike[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MinTimeBetweenFalls[65537];
var(0.25_Pct) /*0xBB380000-0x00000000*/ private float SoloAggressivePulseFrequency[65537];
var(0.25_Pct) /*0xBB380000-0x00000000*/ private float SoloAggressivePulseRate[65537];
var(0.25_Pct) /*0xC4F00000-0x00000000*/ private float TurnHeadBiteMaxAngularRangeInDegrees[65537];
var(0.25_Pct) /*0xC4F00000-0x00000000*/ private float FarTurnNonMovingStrikeMaxAngularRangeInDegrees[65537];
var(0.25_Pct) /*0xC4F00000-0x00000000*/ private float MaxTimeForMedLungeClawStrikeAnimation[65537];
var(0.25_Pct) /*0xC4F00000-0x00000000*/ private float FrontBiteMaxAngularRangeInDegrees[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float MinDelayBetweenAggressivePerformances[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float MaxDelayBetweenAggressivePerformances[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float TacticalWaitAggressivePulseFrequency[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float TacticalWaitAggressivePulseReductionFactor[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float TacticalWaitAggressivePulseMaxOutput[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float TacticalWaitAggressivePulseRate[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float TacticalWaitProcessEnemyEncroachmentUpdateTime[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float DurationBetweenMovementDeltaDuringTacWait[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float MinMovementDeltaDuringTacWait[65537];
var(0.25_Pct) /*0xC7FD0000-0x00000000*/ private float DelayAfterStartOfTacWaitBeforeMonitorStarts[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private editfixedsize array BoneAttachPointByCore[65537];
var(0.25_Pct) /*0x25B90000-0x00000000*/ private float HeadGlowFactorAnnounceTaunt[65537];
var(0.25_Pct) /*0x25B90000-0x00000000*/ private float TailGlowFactorAnnounceTaunt[65537];
var(0.25_Pct) /*0x25B90000-0x00000000*/ private float HeadGlowFactorWhenOwnStrikeAccess[65537];
var(0.25_Pct) /*0x25B90000-0x00000000*/ private float TailGlowFactorWhenOwnStrikeAccess[65537];
var(0.25_Pct) /*0x90110000-0x00000000*/ private float JumpBackDistanceToPlayer[65537];
var(0.25_Pct) /*0x90110000-0x00000000*/ private float JumpBackDotProductToPlayer[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float RangeToTargetFor360TailSwipe[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float ChanceToDo360TailSwipe[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float MinTimeBetween360TailSwipes[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float TimePenaltyForKnockedDownEnemy[65537];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL AmountOfDamageToBeginKnockback[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL AmountOfDamageToContinueKnockback[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxDistanceFromEnemyToPerformKnockback[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxConsecutiveKnockbacks[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinConsecutiveKnockbacks[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TimeToWaitAfterStartingCircleBehaviorToTryDashDefaultObject'
    begin object name=TimeToWaitAfterStartingCircleBehaviorToTryDashDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeToWaitAfterStartingCircleBehaviorToTryDash=TimeToWaitAfterStartingCircleBehaviorToTryDashDefaultObject
    DashStrikeLineSweepHitTestFrequency=0.0100000
    DistanceAwayFromCenterLineToRegDashRam=50.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DistanceCirclingDoSwipeDefaultObject'
    begin object name=DistanceCirclingDoSwipeDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceCirclingDoSwipe=DistanceCirclingDoSwipeDefaultObject
    DistanceLessThenThatIsToCloseToHuntersPathToMeleePoint=700.0000000
    NumOfDashStartPositionShiftsPerStaticFormationRoundOfChecks=50.0000000
    ShiftDistancePerStaticFormationAttemptToFindDashStartPostion=100.0000000
    MaxTimeForForEntireDashStrike=3.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BiteDefaultDamageDefaultObject'
    begin object name=BiteDefaultDamageDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BiteDefaultDamage=BiteDefaultDamageDefaultObject
    MinSpeedToAllowTheHunterToSlideStopBeforeAnnounce=1000.0000000
    WaitTimeBetweenChecksForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ChanceToStopAndStikeWhileStockingOrMovingToMeleeSlotAndTakingHitsD0'
    begin object name=ChanceToStopAndStikeWhileStockingOrMovingToMeleeSlotAndTakingHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToStopAndStikeWhileStockingOrMovingToMeleeSlotAndTakingHits=ChanceToStopAndStikeWhileStockingOrMovingToMeleeSlotAndTakingHitsD0
    DistanceOffPathToMeleeSlotToStartLookingForWaypoint=1000.0000000
    DecrementDistanceForLookingForWaypointOffSlotPath=200.0000000
    bUseSoloAggressivePulse=true
    bAllowUseTacticalWaitAggressivePulse=true
    WaitForMeleeFormationClearenceSpecialMove=Class'LPSM_PackHunterBullDogTheVs'
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.InAttackArcDesirabilityOfAttackScalerD0'
    begin object name=InAttackArcDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    InAttackArcDesirabilityOfAttackScaler=InAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DashAttackNotInAttackArcDesirabilityOfAttackScalerD0'
    begin object name=DashAttackNotInAttackArcDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DashAttackNotInAttackArcDesirabilityOfAttackScaler=DashAttackNotInAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DirectAttackNotInAttackArcDesirabilityOfAttackScalerD0'
    begin object name=DirectAttackNotInAttackArcDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DirectAttackNotInAttackArcDesirabilityOfAttackScaler=DirectAttackNotInAttackArcDesirabilityOfAttackScalerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ReattackDesirabilityOfAttackScalerD0'
    begin object name=ReattackDesirabilityOfAttackScalerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReattackDesirabilityOfAttackScaler=ReattackDesirabilityOfAttackScalerD0
    DashAttackPauseTimeWhileLaunchingIntoStrike=-1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinTimeBetweenDashAttacksDefaultObject'
    begin object name=MinTimeBetweenDashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenDashAttacks=MinTimeBetweenDashAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxTimeBetweenDashAttacksDefaultObject'
    begin object name=MaxTimeBetweenDashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenDashAttacks=MaxTimeBetweenDashAttacksDefaultObject
    DashClawStrikeStartDistance=500.0000000
    DashStrikeDistancePastTheTargetToAimFor=900.0000000
    MinDistanceAwayFromTheVsForEnemyToBeBeforeTryingDashSttack=1000.0000000
    MinDistanceAwayFromTheHunterForEnemyToBeBeforeTryingDashSttack=500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DistanceAwayFromEnemyToMoveAfterCompletionOfDashStrike0'
    begin object name=DistanceAwayFromEnemyToMoveAfterCompletionOfDashStrike0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceAwayFromEnemyToMoveAfterCompletionOfDashStrike=DistanceAwayFromEnemyToMoveAfterCompletionOfDashStrike0
    ReductionDistanceForEachSuccessiveDashStrikeRunOut=1000.0000000
    DurationBetweenMovementDeltaDuringDashRunOut=1.0000000
    MinMovementDeltaDuringDashRunOut=100.0000000
    DelayAfterStartOfDashRunOutBeforeMonitorStarts=0.5000000
    DistanceStopAndStrike=100.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DelayDuringFormationMovementsBeforeAllowedToProximityAttackDefaultObject'
    begin object name=DelayDuringFormationMovementsBeforeAllowedToProximityAttackDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayDuringFormationMovementsBeforeAllowedToProximityAttack=DelayDuringFormationMovementsBeforeAllowedToProximityAttackDefaultObject
    MaxDistanceAwayForTurnAndClawSwipeAttack=500.0000000
    DiffBetweenDesiredAndTrueRotationToStartTurnAndSwipeAttack=1000
    YawTurnRateWhenPlayerTooClose=120000.0000000
    MaxTimeForForFastSwipe=1.0000000
    StalkingMaxSpeedScale=0.5000000
    RangeToTargetForBiteStrike=300.0000000
    RangeToTargetForMediumClawLungeStrike=560.0000000
    MaxRangeToTargetForFarClawLungeStrike=1300.0000000
    IdealDirectAttackStrikeRange=500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation=MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation=MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormation=MinDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormation=MaxDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDurationOfDamageAssessmentWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MaxDurationOfDamageAssessmentWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDurationOfDamageAssessmentWhenDirectAttackFromStaticFormation=MaxDurationOfDamageAssessmentWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxTimeOfDamageEventWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MaxTimeOfDamageEventWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeOfDamageEventWhenDirectAttackFromStaticFormation=MaxTimeOfDamageEventWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxAmountOfNonCoreDamageToTakeInADamageEventWhenDirectAttackFromStaticFormationDefaultObject'
    begin object name=MaxAmountOfNonCoreDamageToTakeInADamageEventWhenDirectAttackFromStaticFormationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfNonCoreDamageToTakeInADamageEventWhenDirectAttackFromStaticFormation=MaxAmountOfNonCoreDamageToTakeInADamageEventWhenDirectAttackFromStaticFormationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinAmountOfDamageRequiredToStopAttackDefaultObject'
    begin object name=MinAmountOfDamageRequiredToStopAttackDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopAttack=MinAmountOfDamageRequiredToStopAttackDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxAmountOfDamageRequiredToStopAttackDefaultObject'
    begin object name=MaxAmountOfDamageRequiredToStopAttackDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopAttack=MaxAmountOfDamageRequiredToStopAttackDefaultObject
    DirectAttackToJumpBackToRenengageHorizAngRangeInDegrees=90.0000000
    MaxTimeForJumpBackBeforeDamageAssessment=3.0000000
    PercentChanceOfTailStingAttack=30.0000000
    PercentChanceOfTailStingAttackShortRange=75.0000000
    PercentChanceOfTailStingAttackLongRange=75.0000000
    PercentChanceOfTailWhipAttackInsteadOfBiteForTheAlpha=0.7000000
    MinZDistanceToRequireMoveBeforeStrike=100.0000000
    MinTimeBetweenFalls=10.0000000
    SoloAggressivePulseFrequency=1.0000000
    SoloAggressivePulseRate=0.0500000
    TurnHeadBiteMaxAngularRangeInDegrees=90.0000000
    FarTurnNonMovingStrikeMaxAngularRangeInDegrees=200.0000000
    MaxTimeForMedLungeClawStrikeAnimation=5.0000000
    FrontBiteMaxAngularRangeInDegrees=30.0000000
    MinDelayBetweenAggressivePerformances=1.0000000
    MaxDelayBetweenAggressivePerformances=2.0000000
    TacticalWaitAggressivePulseFrequency=1.0000000
    TacticalWaitAggressivePulseReductionFactor=0.2000000
    TacticalWaitAggressivePulseMaxOutput=0.1000000
    TacticalWaitAggressivePulseRate=0.0500000
    TacticalWaitProcessEnemyEncroachmentUpdateTime=0.1000000
    DurationBetweenMovementDeltaDuringTacWait=1.0000000
    MinMovementDeltaDuringTacWait=50.0000000
    DelayAfterStartOfTacWaitBeforeMonitorStarts=2.0000000
    BoneAttachPointByCore=/* Array type was not detected. */
    HeadGlowFactorAnnounceTaunt=1.0000000
    TailGlowFactorAnnounceTaunt=1.0000000
    HeadGlowFactorWhenOwnStrikeAccess=0.5000000
    TailGlowFactorWhenOwnStrikeAccess=0.5000000
    JumpBackDistanceToPlayer=700.0000000
    JumpBackDotProductToPlayer=0.1000000
    RangeToTargetFor360TailSwipe=225.0000000
    ChanceToDo360TailSwipe=1.0000000
    MinTimeBetween360TailSwipes=4.0000000
    TimePenaltyForKnockedDownEnemy=6.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AmountOfDamageToBeginKnockback0'
    begin object name=AmountOfDamageToBeginKnockback0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountOfDamageToBeginKnockback=AmountOfDamageToBeginKnockback0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AmountOfDamageToContinueKnockback0'
    begin object name=AmountOfDamageToContinueKnockback0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountOfDamageToContinueKnockback=AmountOfDamageToContinueKnockback0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDistanceFromEnemyToPerformKnockback0'
    begin object name=MaxDistanceFromEnemyToPerformKnockback0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceFromEnemyToPerformKnockback=MaxDistanceFromEnemyToPerformKnockback0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxConsecutiveKnockbacks0'
    begin object name=MaxConsecutiveKnockbacks0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxConsecutiveKnockbacks=MaxConsecutiveKnockbacks0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinConsecutiveKnockbacks0'
    begin object name=MinConsecutiveKnockbacks0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinConsecutiveKnockbacks=MinConsecutiveKnockbacks0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    bUsePawnsAimDirInsteadOfRotation=false
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    DamageModifier_MP=3.5000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    AttacksArcs=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    StopTypeForMoveToMeleeSlot=EStopAtDestinationType.ESADT_ForwardStopAtDestination
    StopTypeForMoveToMeleeSlotWhileStalking=EStopAtDestinationType.ESADT_ForwardStopAfterDestination
    StopTypeForEndOfManeuverForAttack=EStopAtDestinationType.ESADT_ForwardStopAtDestination
    StopTypeForEndOfWithdraw=EStopAtDestinationType.ESADT_ForwardStopAtDestination
    StopTypeForEndOfStrikeFollowThrough=EStopAtDestinationType.ESADT_TurningStopAtDestination
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    DefendVolumeMovesToPlay=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    AmountOfRawDamageToAbortSmartActorAttack=40
    AmountOfTimeBeforeAllowedToAttackSmartActorOnceDamaged=15.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    RadarParams=(IconType=EMapIconTypes.EMapIcon_Packhunter,bIconStaysOnEdge=true)
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    bDropTEnergyOnDeath=false
    bDropTEnergyOnFreeze=true
    bShouldPlayRetractAnimWhenGrabbed=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0100000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.HealthDefaultObject'
    begin object name=HealthDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Health=HealthDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=none
    StationaryVsMovingOverrideVelocity=500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPackHunter.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}