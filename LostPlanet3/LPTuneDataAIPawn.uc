class LPTuneDataAIPawn extends LPTuneDataPawn
    abstract
    dontsortcategories(StopingLocomotion)
    hidecategories(Object,Object);

var(0.25_Pct) /*0xBCA70000-0x00000400*/ private editfixedsize @NULL DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions[589825];
var(0.25_Pct) /*0xBCA70000-0x00000400*/ private editfixedsize @NULL bDisableAllAiWhileSpawningFromHive[589825];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float PushAlongImpulse[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float PushUpImpulse[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float TimeBetweenDeathAndDelete[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000000*/ private float TimeAfterLastRenderToDeletePawn[65537];
var(0.25_Pct) /*0x2BFC0000-0x00000400*/ private editfixedsize @NULL TimeAfterStartOfOnFirePanicToForceKill[589825];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private class AkridTooCloseOnDeathCameraEffect[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000400*/ private editfixedsize @NULL MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath[589825];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private class AkridTooCloseToVsOnDeathCameraEffect[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000400*/ private editfixedsize @NULL MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath[589825];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private name SocketOnVsToUseForDistanceForDeathCameraEffects[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000400*/ private editfixedsize @NULL bPerformDeathBloom[589825];
var(0.25_Pct) /*0x2BFD0000-0x00000400*/ private editfixedsize @NULL DeathRipapartExplosionTemplate[589825];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private name NameOfBoneForDeathRipapartExplosion[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private @NULL HowMuchToIncreaseSizePerSecWhenGoingThroughMassiveDeathExplosionCurve[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private float MaxSizeToIncreaseSizeByWhenGoingThroughMassiveDeathExplosion[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private float SizeOfWhenToDoDeathExplosionGibThrowOut[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private bool bDoRipApartExplosionAtSameTimeAsGibThrowOut[65537];
var(0.25_Pct) /*0x2BFD0000-0x00000000*/ private bool bDeathExplosionDrawDebug[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private bool bOnlyKillPlayerInStruggleMode[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bShowLobFireAttackDebug[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bShowChargeAndWithDrawPointArtifacts[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bShowGrenadeAssistArtifacts[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bShowFlyerLaunchDebug[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private bool bCanBeThrownByVS[65537];
var(0.25_Pct) /*0x63850000-0x00000000*/ private bool bShouldGrenadesIRunOverExplode[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private bool bUseDifferentSpeedScaleAndAccelerationWhenSeparatingFromEnemyAfterStrikeAndBeforeDamAss[65537];
var(0.25_Pct) /*0x091D0000-0x00000000*/ private bool bUsePawnsAimDirInsteadOfRotation[65537];
var(0.25_Pct) /*0x091D0000-0x00000000*/ private bool bUsePawnsAimDirInsteadOfRotationForReactiveAttacks[65537];
var(0.25_Pct) /*0x74910000-0x00000000*/ private bool bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private bool bUseMovementProgressMonitorForAllContinuousAttackRunInsBeforeStrike[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private bool bUseTargetsCurrentLocAtLobRelease[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private bool bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private bool bAbleToAdjustLobAimPositionForGameplay[65537];
var(0.25_Pct) /*0xA9590000-0x00000000*/ private bool bAbleToAdjustDirectFireAimPositionForGameplay[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoOnlyForcedStruggle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableStruggleMode[536870913];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private bool bBleedEnabled[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private bool bBleedEnabledMP[65537];
var(0.25_Pct) /*0xA4000000-0x00000000*/ private bool bEnablePlayerPush[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceTightAreaStalk[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceOpenAreaStalk[536936449];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private bool bCanMelee[65537];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize array CoreInfo[589825];
var(0.25_Pct) /*0x271D0000-0x00000000*/ private float CoreFadeTime[65537];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize array CoreDamageActionInfo[589825];
var(0.25_Pct) /*0x2AB20000-0x00000400*/ private editfixedsize @NULL damagePercentageForNonCoreHit[589825];
var(0.25_Pct) /*0x2AB20000-0x00000400*/ private editfixedsize @NULL bShouldBeInSemiGodWhenOnAnimatedPaths[589825];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize array NonCoreByDamageTypePassThroughFilter[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine1[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine2[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine3[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine4[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine5[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine6[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine7[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForDisplayStateOverlayLine8[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForHitLocationDebugInfo[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private @NULL ColorForHitBoneDebugInfo[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private int NumOfLastHitsToShow[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private float OffsetBetweenBoneHitLines[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private float StartOffsetForBoneHitLines[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private float SizeOfHotLocCross[65537];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL NormalMaxSpeedScale_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float NormalMaxSpeedScale;
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL WanderingMaxSpeedScale_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float WanderingMaxSpeedScale;
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL FleeingMaxSpeedScale_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float FleeingMaxSpeedScale;
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL FleeDistance[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinFleeTime[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxFleeTime[589825];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float FirmGrabRadius[65537];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float WeakGrabRadius[65537];
var(0.25_Pct) /*0x59760000-0x00000400*/ private editfixedsize @NULL ForkArmGrabPressureDepletionRate[589825];
var(0.25_Pct) /*0x59760000-0x00000400*/ private editfixedsize @NULL ForkArmGrabRightArmUseDepetionRate[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL VSMeleeDamagePauseDuration[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL VSMeleeStunDuration[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private float VSMeleeHitReactionSeparationDistance[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL DurationOfShockStun[589825];
var(0.25_Pct) /*0x0B870000-0x00000400*/ private editfixedsize @NULL BaseDamageTrackingWindowInSeconds[589825];
var(0.25_Pct) /*0x94510000-0x00000000*/ private float DelayBetweenMovementHits[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private float DelayBetweenVsMovementHits[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private float DelayBetweenShutdownVsMovementHits[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private float MovementAdditionPushFactor[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000400*/ private editfixedsize @NULL SecondsUntilWinchEscape[589825];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchImpactPreservedMomentumPercentage[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float DraggedByWinchSpeed[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float DraggedByWinchAccelRate[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float PlowedByWinchFollowThroughTime[65537];
var(0.25_Pct) /*0x63930000-0x00000400*/ private export @NULL ExploRadialBlur[720897];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float ExploRadialBlurFadeOutTime[196609];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float ExploRadialBlurMaxBlur[196609];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float DelayAfterNotifyOfInternalExplosionBeforeFrontExplosionEffects[65537];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float DelayAfterNotifyOfInternalExplosionBeforeBackExplosionEffects[65537];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float DelayBetweenGrenadeGluedAndRejection[65537];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float SpeedToGiveToGrenadeWhenRejecting[65537];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float ExtraVerticalSpeedToGiveToGrenadeWhenRejecting[65537];
var(0.25_Pct) /*0x63930000-0x00000400*/ private editfixedsize @NULL bSpitOutGrenadeOnAnimNotifyRejecting[589825];
var(0.25_Pct) /*0x63930000-0x00000400*/ private editfixedsize @NULL MinTimeToExplosionGiveToGrenadeWhenRejecting[589825];
var(0.25_Pct) /*0x63930000-0x00000400*/ private editfixedsize @NULL MaxTimeToExplosionGiveToGrenadeWhenRejecting[589825];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float DamageModifier_MP[196609];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL WantsNewEnemyPenalty[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL TimePenaltyForEnemyInCover[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private editfixedsize @NULL RangeFromGrenadeFinalDestinationSocketToStartAssist[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private editfixedsize @NULL AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist[589825];
var(0.25_Pct) /*0x63850000-0x00000000*/ private float GrenadeAssistZoneNumOfRadials[196609];
var(0.25_Pct) /*0x63850000-0x00000000*/ private float GrenadeAssistZoneNumBiasPointsPerRadial[196609];
var(0.25_Pct) /*0x63850000-0x00000400*/ private @NULL GrenadeAssistZoneColorActive[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private @NULL GrenadeAssistZoneColorInActive[589825];
var(0.25_Pct) /*0xD70C0000-0x00000400*/ private editfixedsize @NULL RangeFromPawnToStartWinchAssist[589825];
var(0.25_Pct) /*0xD70C0000-0x00000400*/ private editfixedsize @NULL AngleInDegreesInFrontOfPawnToAllowWinchAssist[589825];
var(0.25_Pct) /*0xD70C0000-0x00000400*/ private editfixedsize @NULL bUsePawnToWinchLauncherDirInsteadOfSocketRotation[589825];
var(0.25_Pct) /*0xD70C0000-0x00000400*/ private editfixedsize @NULL bUsePawnsLocationInsteadOfWinchTargetSocketLoc[589825];
var(0.25_Pct) /*0xD70C0000-0x00000000*/ private float WinchAssistZoneNumOfRadials[196609];
var(0.25_Pct) /*0xD70C0000-0x00000000*/ private float WinchAssistZoneNumBiasPointsPerRadial[196609];
var(0.25_Pct) /*0xD70C0000-0x00000400*/ private @NULL WinchAssistZoneColorActive[589825];
var(0.25_Pct) /*0xD70C0000-0x00000400*/ private @NULL WinchAssistZoneColorInActive[589825];
var(0.25_Pct) /*0x08FC0000-0x00000000*/ private float MinSpeedToConsideredMovingForAlternateAnimations[65537];
var(0.25_Pct) /*0x08FC0000-0x00000000*/ private float MinSpeedToAllowTrippingAndPlowInWhileRunning[65537];
var(0.25_Pct) /*0x08FC0000-0x00000000*/ private float MaxTimeForPlowInAnimation[65537];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageForTripAndPlowIn[589825];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageForTripAndPlowIn[589825];
var(0.25_Pct) /*0x08FC0000-0x00000000*/ private float DistanceAwayToSetFocalPointAfterMeleeStrike[65537];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private @NULL ForwardSpeedsForAttackInterruption[589825];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private @NULL ForwardAndToTheSideSpeedsForAttackInterruption[589825];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private @NULL ToTheSideSpeedsForAttackInterruption[589825];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private @NULL BackwardSpeedsForAttackInterruption[589825];
var(0.25_Pct) /*0x08FC0000-0x00000400*/ private @NULL BackwardToTheSideSpeedsForAttackInterruption[589825];
var(0.25_Pct) /*0x08FC0000-0x00000000*/ private float MaxTimeForSpitOutGrenadeAnimation[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float MinRangeToAllowDamageAssessmentOrAnnounceToPerformOrContinue[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float MaxRangeToAllowDamageAssessmentToContinue[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float AttemptedSeperationFromEnemyBeforeDamageAssessment[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float MinDistanceAwayFromSeperationPointForDamAssBeforeDoingMovement[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float AccelRateWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float MaxSpeedScaleWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float DurationBetweenMovementDeltaWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float MinMovementDeltaWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss[65537];
var(0.25_Pct) /*0xBA060000-0x00000000*/ private float DelayAfterStartSeparatingFromEnemyAfterStrikeAndBeforeDamAssBeforeMonitorStarts[65537];
var(0.25_Pct) /*0x091D0000-0x00000400*/ private editfixedsize array AttacksArcs[589825];
var(0.25_Pct) /*0x091D0000-0x00000000*/ private float DistanceFromPlayerToDrawAttackArcs[65537];
var(0.25_Pct) /*0x091D0000-0x00000400*/ private editfixedsize array ReactiveAttacksArcs[589825];
var(0.25_Pct) /*0x091D0000-0x00000000*/ private float DistanceFromPlayerToDrawReactiveAttacksArcs[65537];
var(0.25_Pct) /*0x06AF0000-0x00000000*/ private float MaxTimeForAttackAnnounce[65537];
var(0.25_Pct) /*0x06AF0000-0x00000000*/ private float DesiredSpeedCommingOutOfTheAnnounce[65537];
var(0.25_Pct) /*0x06AF0000-0x00000000*/ private float MinSeperationToEnemyToAllowOutOfAnnounceSuperAcceleration[65537];
var(0.25_Pct) /*0x06AF0000-0x00000000*/ private float MinAngleNeededForTurnToFaceCommandBeforeAnnounce[65537];
var(0.25_Pct) /*0xD79E0000-0x00000400*/ private editfixedsize @NULL MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway[589825];
var(0.25_Pct) /*0xD79E0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway[589825];
var(0.25_Pct) /*0xD79E0000-0x00000400*/ private editfixedsize @NULL DistanceAwayToStartLookingForWithdrawPoint[589825];
var(0.25_Pct) /*0xD79E0000-0x00000400*/ private editfixedsize @NULL MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint[589825];
var(0.25_Pct) /*0xD79E0000-0x00000000*/ private float DurationBetweenMovementDeltaDuringWithdraw[65537];
var(0.25_Pct) /*0xD79E0000-0x00000000*/ private float MinMovementDeltaDuringWithdraw[65537];
var(0.25_Pct) /*0xD79E0000-0x00000000*/ private float DelayAfterStartOfWithdrawBeforeMonitorStarts[65537];
var(0.25_Pct) /*0xD79E0000-0x00000400*/ private editfixedsize @NULL MaxTimeFindWithdrawToSpotTraversalAllowedToRun[589825];
var(0.25_Pct) /*0xD79E0000-0x00000400*/ private editfixedsize @NULL PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased[589825];
var(0.25_Pct) /*0xACE90000-0x00000400*/ private editfixedsize @NULL MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire[589825];
var(0.25_Pct) /*0xACE90000-0x00000000*/ private float SeperationBetweenPointsForPossibleOnFireWithdraw[65537];
var(0.25_Pct) /*0xACE90000-0x00000000*/ private float AmmountToReduceWithRangeByIfNoPointFoundAtCurrentRangeWhenOnFire[65537];
var(0.25_Pct) /*0xACE90000-0x00000000*/ private int NumOfOnFireWithPointsToLookForAtEachRange[65537];
var(0.25_Pct) /*0xACE90000-0x00000000*/ private float DurationBetweenMovementDeltaDuringOnFireWithdraw[65537];
var(0.25_Pct) /*0xACE90000-0x00000000*/ private float MinMovementDeltaDuringOnFireWithdraw[65537];
var(0.25_Pct) /*0xACE90000-0x00000000*/ private float DelayAfterStartOfOnFireWithdrawBeforeMonitorStarts[65537];
var(0.25_Pct) /*0x74910000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttempts[589825];
var(0.25_Pct) /*0x74910000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttempts[589825];
var(0.25_Pct) /*0x74910000-0x00000000*/ private float DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike[65537];
var(0.25_Pct) /*0x74910000-0x00000000*/ private float MinMovementDeltaDuringAttackRunInBeforeStrike[65537];
var(0.25_Pct) /*0x74910000-0x00000000*/ private float DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts[65537];
var(0.25_Pct) /*0x74910000-0x00000000*/ private float MaxSeperationForDirectPhysicalStrike[65537];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenContinuousAttackStrikeAttempts[589825];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenContinuousAttackStrikeAttempts[589825];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenContinuousAttackMustStrikeAttempts[589825];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenContinuousAttackMustStrikeAttempts[589825];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenContinuousAttackStrikeWarningRattles[589825];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenContinuousAttackStrikeWarningRattles[589825];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float DurationBetweenMovementDeltaDuringContinuousAttackRunInBeforeStrike[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float MinMovementDeltaDuringContinuousAttackRunInBeforeStrike[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float DelayAfterStartOfContinuousAttackRunInBeforeStrikeBeforeMonitorStarts[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float MaxSeperationForContinuousAttackDirectPhysicalStrike[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float RateOfStrikeWarningRattleAnimation[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float MaxSeperationToEvenTryContinuousStrike[65537];
var(0.25_Pct) /*0x26C90000-0x00000000*/ private float MaxSeperationToTriggerEndOfContinuousAttack[65537];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL bShouldPerformAnnounceAtStartOfContinuousAttack[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikesToAttemptPerReactiveAttack[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikesToAttemptPerReactiveAttack[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopReactiveAttack[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopReactiveAttack[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL DelayAfterPhysicalAttackToResetReactiveAttackFlag[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL DelayAfterReactiveAttackToResetReactiveAttackFlag[589825];
var(0.25_Pct) /*0xAA090000-0x00000400*/ private editfixedsize @NULL MaxSeperationToTriggerReactiveAttack[589825];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForMoveToMeleeSlot[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForMoveToMeleeSlotWhileStalking[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForMoveToMeleeSlotOnFormationChange[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfChargeRunIn[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfSaftyChargeRunIn[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfChargeStrike[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfTightManeuverForAttack[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfManeuverForAttack[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfMoveToChargePoint[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfMoveToTaunt[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfMoveToStrike[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfWithdraw[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfStrikeFollowThrough[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfMoveToTacWaitPoint[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfFakeJumpBackBeforeDamAss[65537];
var(0.25_Pct) /*0xC5CA0000-0x00000000*/ private byte StopTypeForEndOfMoveToHidingPlace[65537];
var(0.25_Pct) /*0xC6D20000-0x00000400*/ private editfixedsize @NULL MaxEnemyHitPointsToStartStruggle[589825];
var(0.25_Pct) /*0x94470000-0x00000000*/ private float MinSpeedToPlayProceduralMovementSound[65537];
var(0.25_Pct) /*0x94470000-0x00000000*/ private float UpdateDeltaForProceduralMovementSound[65537];
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL DefaultMovementZDiffAllowanceFactor[589825];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private float SleepTimeDuringRangeAttackDamageAssessment[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private float NumOfLobStrikeLocationsToLookForAtEachRange[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private float HorizontalSeperationBetweenPointsForLobStrike[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private @NULL OffsetForCalcOfLobFirStrike[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private float MinRangeFromOrbitBeforeLookingForTierOffsetStrikeLocations[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private int ForceAllLobAttacksFromThisTier[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private editfixedsize array RangedLobStrikeInfoByTier[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private int ForceAllLobAttacksFromThisZone[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private int ForceAllLobAttacksFromThisZonesAltArc[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private editfixedsize array RangedLobStrikeInfoByZone[65537];
var(0.25_Pct) /*0xA9640000-0x00000000*/ private float HieghtOffTargetPointForEndOfLobFireArc[65537];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL IntentionalLobMissChance[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL IntentionalLobMissPercentOfArcToCheckForCalc[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL DefaultMinNumberOfRangedStrikesPerAttack[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL DefaultMaxNumberOfRangedStrikesPerAttack[589825];
var(0.25_Pct) /*0x93E40000-0x00000000*/ private float MinAngleNeededForTurnToFaceCommandBeforeMortar[65537];
var(0.25_Pct) /*0x93E40000-0x00000000*/ private float MinAngleNeededForTurnToFaceCommandBeforeDamAssDuringMortar[65537];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL MaxFindLobStrikeLocTraversalDistance[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenMortarLobStrikeAttempts[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenMortarLobStrikeAttempts[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL DefaultMinNumberOfRangedStrikesPerMortarAttack[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL DefaultMaxNumberOfRangedStrikesPerMortarAttack[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom[589825];
var(0.25_Pct) /*0x93E40000-0x00000400*/ private editfixedsize @NULL SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer[589825];
var(0.25_Pct) /*0x93E40000-0x00000000*/ private @NULL AltToFormationLocMortarAttackSetupInfo[65537];
var(0.25_Pct) /*0xA9590000-0x00000000*/ private editfixedsize array RangedDirectFireStrikeInfoByZone[65537];
var(0.25_Pct) /*0xA9590000-0x00000000*/ private editfixedsize array RangedDirectFireStrikeInfoByTier[65537];
var(0.25_Pct) /*0xA9590000-0x00000000*/ private float NumOfDirectFireStrikeLocationsToLookForAtEachRange[65537];
var(0.25_Pct) /*0xA9590000-0x00000000*/ private int ForceAllDirectFireAttacksFromThisTier[65537];
var(0.25_Pct) /*0xA9590000-0x00000000*/ private int ForceAllDirectFireAttacksFromThisZone[65537];
var(0.25_Pct) /*0x098B0000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenAttacks[589825];
var(0.25_Pct) /*0x098B0000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenAttacks[589825];
var(0.25_Pct) /*0x098B0000-0x00000000*/ private float DefaultSeperationRequiredForMovingToAttackVolumesAttackLocation[65537];
var(0.25_Pct) /*0x44D70000-0x00000000*/ private editfixedsize array DefendVolumeMovesToPlay[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL BleedRate[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL BleedDamage[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL BleedCount[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL BleedAmount[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL BleedAmountVariance[589825];
var(0.25_Pct) /*0xC9F00000-0x00000400*/ private editfixedsize array TempPlaceHolderWeakPoint[589825];
var(0.25_Pct) /*0xA4000000-0x00000000*/ private float DesiredSeparationToPlayer[65537];
var(0.25_Pct) /*0xA4000000-0x00000000*/ private float TimeToDesiredSeparationToPlayer[65537];
var(0.25_Pct) /*0xA4000000-0x00000000*/ private float PctgDesiredSeparationStopAvoiding[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MinDistanceLosPositionFromMe[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MinDistanceLosPositionFromEnemy[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MinDistanceLosPositionFromTeammates[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MinTimeEnemyVisibleStopMoving[65537];
var(0.25_Pct) /*0xBA830000-0x00000000*/ private int AmountOfRawDamageToAbortSmartActorAttack[65537];
var(0.25_Pct) /*0xBA830000-0x00000000*/ private float AmountOfTimeBeforeAllowedToAttackSmartActorOnceDamaged[65537];

simulated function GetDamageMultiplier()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609], EnemyPawn;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x44
    if(int(ThePawn.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return 1.0000000;
    }
    return DamageModifier_MP;
    //return ReturnValue;    
}

simulated function GetNormalMaxSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return NormalMaxSpeedScale_Tunable.GetValue();
    //return ReturnValue;    
}

simulated function GetWanderingMaxSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return WanderingMaxSpeedScale_Tunable.GetValue();
    //return ReturnValue;    
}

simulated function GetFleeingMaxSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return FleeingMaxSpeedScale_Tunable.GetValue();
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    PushAlongImpulse=2000.0000000
    PushUpImpulse=1500.0000000
    TimeBetweenDeathAndDelete=10.0000000
    TimeAfterLastRenderToDeletePawn=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    NameOfBoneForDeathRipapartExplosion="JO_positionTracker"
    MaxSizeToIncreaseSizeByWhenGoingThroughMassiveDeathExplosion=10.0000000
    SizeOfWhenToDoDeathExplosionGibThrowOut=1.8000000
    bDoRipApartExplosionAtSameTimeAsGibThrowOut=true
    bUseDifferentSpeedScaleAndAccelerationWhenSeparatingFromEnemyAfterStrikeAndBeforeDamAss=true
    bUsePawnsAimDirInsteadOfRotation=true
    bUsePawnsAimDirInsteadOfRotationForReactiveAttacks=true
    bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike=true
    bUseMovementProgressMonitorForAllContinuousAttackRunInsBeforeStrike=true
    bUseTargetsCurrentLocAtLobRelease=true
    bCanMelee=true
    CoreFadeTime=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    ColorForDisplayStateOverlayLine1=(R=255,G=255,B=255,A=255)
    ColorForDisplayStateOverlayLine2=(R=255,G=150,B=0,A=255)
    ColorForDisplayStateOverlayLine3=(R=50,G=255,B=50,A=255)
    ColorForDisplayStateOverlayLine4=(R=255,G=40,B=255,A=255)
    ColorForDisplayStateOverlayLine5=(R=255,G=255,B=0,A=255)
    ColorForDisplayStateOverlayLine6=(R=255,G=255,B=255,A=255)
    ColorForDisplayStateOverlayLine7=(R=255,G=0,B=0,A=255)
    ColorForDisplayStateOverlayLine8=(R=0,G=0,B=255,A=255)
    ColorForHitLocationDebugInfo=(R=255,G=0,B=0,A=255)
    ColorForHitBoneDebugInfo=(R=0,G=255,B=255,A=255)
    NumOfLastHitsToShow=15
    OffsetBetweenBoneHitLines=30.0000000
    StartOffsetForBoneHitLines=-30.0000000
    SizeOfHotLocCross=15.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.FleeDistance'
    begin object name=FleeDistance class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinFleeTime'
    begin object name=MinFleeTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxFleeTime'
    begin object name=MaxFleeTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxFleeTime=MaxFleeTime
    FirmGrabRadius=100.0000000
    WeakGrabRadius=250.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    VSMeleeHitReactionSeparationDistance=200.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    DelayBetweenMovementHits=1.0000000
    DelayBetweenVsMovementHits=0.1000000
    DelayBetweenShutdownVsMovementHits=0.0500000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    WinchImpactPreservedMomentumPercentage=0.7500000
    DraggedByWinchSpeed=5000.0000000
    DraggedByWinchAccelRate=5000.0000000
    PlowedByWinchFollowThroughTime=0.7500000
    DelayAfterNotifyOfInternalExplosionBeforeFrontExplosionEffects=0.1000000
    DelayAfterNotifyOfInternalExplosionBeforeBackExplosionEffects=0.2000000
    DelayBetweenGrenadeGluedAndRejection=0.5000000
    SpeedToGiveToGrenadeWhenRejecting=500.0000000
    ExtraVerticalSpeedToGiveToGrenadeWhenRejecting=500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    DamageModifier_MP=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    GrenadeAssistZoneNumOfRadials=8.0000000
    GrenadeAssistZoneNumBiasPointsPerRadial=2.0000000
    GrenadeAssistZoneColorActive=(R=255,G=100,B=100,A=0)
    GrenadeAssistZoneColorInActive=(R=255,G=255,B=20,A=0)
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    WinchAssistZoneNumOfRadials=8.0000000
    WinchAssistZoneNumBiasPointsPerRadial=2.0000000
    WinchAssistZoneColorActive=(R=255,G=100,B=100,A=0)
    WinchAssistZoneColorInActive=(R=255,G=255,B=20,A=0)
    MinSpeedToConsideredMovingForAlternateAnimations=20.0000000
    MinSpeedToAllowTrippingAndPlowInWhileRunning=800.0000000
    MaxTimeForPlowInAnimation=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    DistanceAwayToSetFocalPointAfterMeleeStrike=5000.0000000
    ForwardSpeedsForAttackInterruption=(MinSpeedToConsideredMovingAtWalkSpeeds=400.0000000,MinSpeedToConsideredMovingAtJogSpeeds=500.0000000,MinSpeedToConsideredMovingAtRunSpeeds=600.0000000,MinSpeedToConsideredMovingAtSprintSpeeds=1100.0000000)
    ForwardAndToTheSideSpeedsForAttackInterruption=(MinSpeedToConsideredMovingAtWalkSpeeds=100.0000000,MinSpeedToConsideredMovingAtJogSpeeds=200.0000000,MinSpeedToConsideredMovingAtRunSpeeds=300.0000000,MinSpeedToConsideredMovingAtSprintSpeeds=800.0000000)
    ToTheSideSpeedsForAttackInterruption=(MinSpeedToConsideredMovingAtWalkSpeeds=100.0000000,MinSpeedToConsideredMovingAtJogSpeeds=200.0000000,MinSpeedToConsideredMovingAtRunSpeeds=300.0000000,MinSpeedToConsideredMovingAtSprintSpeeds=800.0000000)
    BackwardSpeedsForAttackInterruption=(MinSpeedToConsideredMovingAtWalkSpeeds=100.0000000,MinSpeedToConsideredMovingAtJogSpeeds=200.0000000,MinSpeedToConsideredMovingAtRunSpeeds=300.0000000,MinSpeedToConsideredMovingAtSprintSpeeds=800.0000000)
    BackwardToTheSideSpeedsForAttackInterruption=(MinSpeedToConsideredMovingAtWalkSpeeds=100.0000000,MinSpeedToConsideredMovingAtJogSpeeds=200.0000000,MinSpeedToConsideredMovingAtRunSpeeds=300.0000000,MinSpeedToConsideredMovingAtSprintSpeeds=800.0000000)
    MaxTimeForSpitOutGrenadeAnimation=5.0000000
    MinRangeToAllowDamageAssessmentOrAnnounceToPerformOrContinue=300.0000000
    MaxRangeToAllowDamageAssessmentToContinue=1000.0000000
    AttemptedSeperationFromEnemyBeforeDamageAssessment=400.0000000
    MinDistanceAwayFromSeperationPointForDamAssBeforeDoingMovement=40.0000000
    AccelRateWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss=3000.0000000
    MaxSpeedScaleWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss=2.0000000
    DurationBetweenMovementDeltaWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss=1.0000000
    MinMovementDeltaWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss=50.0000000
    DelayAfterStartSeparatingFromEnemyAfterStrikeAndBeforeDamAssBeforeMonitorStarts=1.0000000
    DistanceFromPlayerToDrawAttackArcs=2000.0000000
    DistanceFromPlayerToDrawReactiveAttacksArcs=500.0000000
    MaxTimeForAttackAnnounce=6.0000000
    DesiredSpeedCommingOutOfTheAnnounce=1.0000000
    MinSeperationToEnemyToAllowOutOfAnnounceSuperAcceleration=-200.0000000
    MinAngleNeededForTurnToFaceCommandBeforeAnnounce=40.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    DurationBetweenMovementDeltaDuringWithdraw=1.0000000
    MinMovementDeltaDuringWithdraw=75.0000000
    DelayAfterStartOfWithdrawBeforeMonitorStarts=2.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    SeperationBetweenPointsForPossibleOnFireWithdraw=700.0000000
    AmmountToReduceWithRangeByIfNoPointFoundAtCurrentRangeWhenOnFire=500.0000000
    NumOfOnFireWithPointsToLookForAtEachRange=20
    DurationBetweenMovementDeltaDuringOnFireWithdraw=1.0000000
    MinMovementDeltaDuringOnFireWithdraw=75.0000000
    DelayAfterStartOfOnFireWithdrawBeforeMonitorStarts=2.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike=0.5000000
    MinMovementDeltaDuringAttackRunInBeforeStrike=25.0000000
    DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts=0.5000000
    MaxSeperationForDirectPhysicalStrike=200.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    DurationBetweenMovementDeltaDuringContinuousAttackRunInBeforeStrike=0.5000000
    MinMovementDeltaDuringContinuousAttackRunInBeforeStrike=25.0000000
    DelayAfterStartOfContinuousAttackRunInBeforeStrikeBeforeMonitorStarts=0.5000000
    MaxSeperationForContinuousAttackDirectPhysicalStrike=100.0000000
    RateOfStrikeWarningRattleAnimation=1.0000000
    MaxSeperationToEvenTryContinuousStrike=500.0000000
    MaxSeperationToTriggerEndOfContinuousAttack=800.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=35.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    MinSpeedToPlayProceduralMovementSound=100.0000000
    UpdateDeltaForProceduralMovementSound=0.5000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    SleepTimeDuringRangeAttackDamageAssessment=0.0300000
    NumOfLobStrikeLocationsToLookForAtEachRange=1.0000000
    HorizontalSeperationBetweenPointsForLobStrike=150.0000000
    OffsetForCalcOfLobFirStrike=(X=95.0000000,Y=0.0000000,Z=55.0000000)
    MinRangeFromOrbitBeforeLookingForTierOffsetStrikeLocations=200.0000000
    ForceAllLobAttacksFromThisTier=-1
    ForceAllLobAttacksFromThisZone=-1
    ForceAllLobAttacksFromThisZonesAltArc=-1
    HieghtOffTargetPointForEndOfLobFireArc=50.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    MinAngleNeededForTurnToFaceCommandBeforeMortar=20.0000000
    MinAngleNeededForTurnToFaceCommandBeforeDamAssDuringMortar=30.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=99999.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=99999.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    AltToFormationLocMortarAttackSetupInfo=(bUseCombatManager=true,bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack=true,RangeToAnyEnemyToQuitAttack=300.0000000,MinDelayBetweenLobStrikes=0.5000000,MaxDelayBetweenLobStrikes=1.0000000,MinLobStrikesBetweenDamageAssessments=3,MaxLobStrikesBetweenDamageAssessments=4,MinDurationOfDamageAssessmentInSecs=2.0000000,MaxDurationOfDamageAssessmentInSecs=3.0000000,MinRangeToLaunchFrom=200.0000000,MaxRangeToLaunchFrom=4000.0000000,DistanceErrorBuffer=200.0000000,MinHeightDelta=-2000.0000000,MaxHeightDelta=2000.0000000,HeightErrorBuffer=200.0000000,bUseHeightInsteadOfPitchForEvaluations=false,MaxPitchAllowedInDegrees=45.0000000,MinPitchAllowedInDegrees=-45.0000000,PitchErrorBufferInDegrees=8.0000000)
    NumOfDirectFireStrikeLocationsToLookForAtEachRange=1.0000000
    ForceAllDirectFireAttacksFromThisTier=-1
    ForceAllDirectFireAttacksFromThisZone=-1
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    DefaultSeperationRequiredForMovingToAttackVolumesAttackLocation=100.0000000
    DefendVolumeMovesToPlay=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.BleedRateObject'
    begin object name=BleedRateObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.BleedDamageObject'
    begin object name=BleedDamageObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.BleedCountObject'
    begin object name=BleedCountObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.BleedAmountObject'
    begin object name=BleedAmountObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    DesiredSeparationToPlayer=30.0000000
    TimeToDesiredSeparationToPlayer=0.1500000
    PctgDesiredSeparationStopAvoiding=0.5000000
    MinDistanceLosPositionFromMe=700.0000000
    MinDistanceLosPositionFromEnemy=800.0000000
    MinDistanceLosPositionFromTeammates=400.0000000
    MinTimeEnemyVisibleStopMoving=2.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    MaxFallSpeed=500000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=(bEnableMeshRotation=true,MaxMeshRotation=45.0000000,MeshRotationSpeed=45.0000000,ConformType=EFloorConformType.EFCT_CenterSample)
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}