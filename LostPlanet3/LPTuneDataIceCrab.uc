class LPTuneDataIceCrab extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion,Melee,ChargeAttack,MovementHit,ClawPush,Taunt,DismembermentBleed,RamAttack,ExplosiveGroundPound,DongoClawAttack,DongoFrenzyAttack,DongoFlee,DongoTaunt,DongoChargeAttack,DongoBankingDuringRoll,Multiplayer,CoreShell)
    hidecategories(Object,Object,MortarAttack);

struct native IceCrabBoneNameToCoreId
{
    var(0.25_Pct) /*0x68730000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0x68730000-0x00000000*/ private byte CoreID[65537];

    structdefaultproperties
    {
        BoneName="None"
        CoreID=eCrabCore.eCrabCore_RightClaw
    }
};

var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL ClawStuckPercentage[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL ClawStuckTimeMin[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL ClawStuckTimeMax[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenAttacksVs[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenAttacksVs[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL PincerBashReachPofDistance[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL PincerBashReachVsDistance[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL PincerBashReachPofMovementErrorDistance_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float PincerBashReachPofMovementErrorDistance;
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL PincerBashReachVsMovementErrorDistance_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float PincerBashReachVsMovementErrorDistance;
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered;
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL PincerBashHorizAngRangeInDegrees[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenPincerBashAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenPincerBashAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenVsPincerBashAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenVsPincerBashAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenHastyPincerBashAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenHastyPincerBashAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private bool bAllowHastyPincerBashDuringClawIn[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private bool bChargeHitsOnTouchAgainstPof[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private bool bChargeHitsOnTouchAgainstVs[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private bool bDontTripAndStunInMp[65537];
var(0.25_Pct) /*0xA8F40000-0x00000000*/ private bool bRamAttackDebugDraw[65537];
var(0.25_Pct) /*0x55CF0000-0x00000000*/ private bool bExplosiveGroundPoundDraw[65537];
var(0.25_Pct) /*0x4A120000-0x00000000*/ private bool bChargeAfterFrenzy[65537];
var(0.25_Pct) /*0x49FF0000-0x00000000*/ private bool bEnableFirstDodgeWindow[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private bool bAllowMovementHitOnTouch[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private bool bAllowMovementHitOnBump[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private bool bAllowMovementHitOnBumpEffects[65537];
var(0.25_Pct) /*0xC9470000-0x00000000*/ private bool bFocusOnEnemyDuringTaunt[65537];
var(0.25_Pct) /*0x47C80000-0x00000000*/ private bool bUsePostDismembermentStumpAutoBleed[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bOnlyWithdrawAndCharge[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bOnlyTauntAttack[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bOnlyCQBAttack[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL AmountToDecreaseHastyPincerBashRangeWhenStunned[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeToWaitForClawStrikeToFinish_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxTimeToWaitForClawStrikeToFinish;
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL AdditionalDelayTimeWhenStruckBlockedVsWithClawStrike[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeForClawAttackPhase[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeForClawAttackPhase[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL VSKnockOutChanceStart[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL VSKnockOutChanceIncrease[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinAngleInDegreesNeededForTurnToFaceCommandWhileInStrikeState[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL ClawAttackAnimationRateVS[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL ClawAttackAnimationRatePOF[589825];
var(0.25_Pct) /*0x22550000-0x00000400*/ private export @NULL ClawStrikeRadialBlur[720897];
var(0.25_Pct) /*0x22550000-0x00000400*/ private editfixedsize @NULL ClawStrikeRadialBlurFadeOutTime_Tunable[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawStrikeRadialBlurFadeOutTime[131073];
var(0.25_Pct) /*0x22550000-0x00000400*/ private editfixedsize @NULL ClawStrikeRadialBlurMaxBlur_Tunable[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawStrikeRadialBlurMaxBlur[131073];
var(0.25_Pct) /*0x22550000-0x00000400*/ private export @NULL ChargeStrikeRadialBlur[720897];
var(0.25_Pct) /*0x22550000-0x00000400*/ private editfixedsize @NULL ChargeStrikeRadialBlurFadeOutTime_Tunable[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ChargeStrikeRadialBlurFadeOutTime[131073];
var(0.25_Pct) /*0x22550000-0x00000400*/ private editfixedsize @NULL ChargeStrikeRadialBlurMaxBlur_Tunable[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ChargeStrikeRadialBlurMaxBlur[131073];
var(0.25_Pct) /*0x22550000-0x00000400*/ private export @NULL ClawPushRadialBlur[720897];
var(0.25_Pct) /*0x22550000-0x00000400*/ private editfixedsize @NULL ClawPushRadialBlurFadeOutTime_Tunable[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushRadialBlurFadeOutTime[131073];
var(0.25_Pct) /*0x22550000-0x00000400*/ private editfixedsize @NULL ClawPushRadialBlurMaxBlur_Tunable[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushRadialBlurMaxBlur[131073];
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL MaxDistanceToNotAvoidVsDuringNormalMovement_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxDistanceToNotAvoidVsDuringNormalMovement;
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL AngleToSideStepVsDuringNormalMovement_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float AngleToSideStepVsDuringNormalMovement;
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL HitPointsBackInnerShell[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL HitPointsBackOuterShell[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL HitPointsBellyShell[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL CapOnStartToggleGlowBrightness[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL CapOnStartToggleGlowEmissive[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL OuterShellOnStartToggleGlowBrightness[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL OuterShellOnStartToggleGlowEmissive[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL InnerShellOnStartToggleGlowBrightness[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL InnerShellOnStartToggleGlowEmissive[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL OuterShellOnCapDestructionGlowBrightness[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL OuterShellOnCapDestructionGlowEmissive[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL InnerShellOnOuterShellDestructionGlowBrightness[589825];
var(0.25_Pct) /*0x27430000-0x00000400*/ private editfixedsize @NULL InnerShellOnOuterShellDestructionGlowEmissive[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToTryChargeAttack_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinDistanceAwayToTryChargeAttack;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToStartChargingStrike_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinDistanceAwayToStartChargingStrike;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceBeyondTargetForChargingStrike_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DistanceBeyondTargetForChargingStrike;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToTryChargeAttackAgainstVs_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinDistanceAwayToTryChargeAttackAgainstVs;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToStartChargingStrikeAgainstVs_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinDistanceAwayToStartChargingStrikeAgainstVs;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToStartChargingStrikeAgainstVsIfEmpty[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceBeyondTargetForChargingStrikeAgainstVs_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DistanceBeyondTargetForChargingStrikeAgainstVs;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private float DongoDistanceToStartBounce[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private float DongoDistanceToStartBounceIfEmpty[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL AngleToSideStepVsDuringCharge_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float AngleToSideStepVsDuringCharge;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationOfChargingShakeOff[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationOfChargingShakeOffAgainstVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationOfFailedChargeStun[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationOfBlockedChargeStun[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeHitDamagePoF[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeHitDamageVS[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeHitDamageShutdownVS[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeBrushDamagePoF[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeBrushDamageVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeBrushDamageShutdownVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinAmountOfHealthForVsToTakeNonShutdownHitDamage[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceAwayToOpenDodgeWindowPof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceAwayToCloseDodgeWindowPof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayBetweenNewChargeHitsAgainstVsAllowed_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DelayBetweenNewChargeHitsAgainstVsAllowed;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayBetweenNewChargeHitsAgainstShutdownVsAllowed_Tunable[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayBetweenNewChargeHitsAllowed_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DelayBetweenNewChargeHitsAllowed;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL SpeedToAllowHitOnWhenTripping_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float SpeedToAllowHitOnWhenTripping;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DesiredSeperationWhenChargeIsNotPossible_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DesiredSeperationWhenChargeIsNotPossible;
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private editfixedsize @NULL ChargeDodgeMessage[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinSeperationFromEnemyToTryWithdrawPof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinSeperationFromEnemyToTryWithdrawVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChanceToTryWithdrawAndChargePof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChanceToTryWithdrawAndChargeVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDismemberedSeperationFromEnemyToTryWithdrawPof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDismemberedSeperationFromEnemyToTryWithdrawVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChanceToTryDismemberedWithdrawAndChargePof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChanceToTryDismemberedWithdrawAndChargeVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceBetweenWithdrawPointsToCheck_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DistanceBetweenWithdrawPointsToCheck;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ExtraBufferToAddToTheWithdrawDistance_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ExtraBufferToAddToTheWithdrawDistance;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient int NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationBetweenMovementDeltaDuringChargeRunIn_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DurationBetweenMovementDeltaDuringChargeRunIn;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinMovementDeltaDuringChargeRunIn_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinMovementDeltaDuringChargeRunIn;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DelayAfterStartOfChargeRunIneforeMonitorStarts;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DurationBetweenMovementDeltaDuringWithdrawForCharge;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinMovementDeltaDuringWithdrawForCharge_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinMovementDeltaDuringWithdrawForCharge;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts;
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeRampUpTime[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeLockOnDistanceMin[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChargeLockOnDistanceMax[589825];
var(0.25_Pct) /*0xA8F40000-0x00000000*/ private name RamAttackSocket[65537];
var(0.25_Pct) /*0xA8F40000-0x00000400*/ private editfixedsize @NULL RamAttackExplosionTemplate[589825];
var(0.25_Pct) /*0x55CF0000-0x00000000*/ private name ExplosiveGroundPoundSocket[65537];
var(0.25_Pct) /*0x55CF0000-0x00000400*/ private editfixedsize @NULL ExplosiveGroundPoundExplosionTemplate[589825];
var(0.25_Pct) /*0x4A0B0000-0x00000400*/ private editfixedsize @NULL MinMoveToStrikeTime[589825];
var(0.25_Pct) /*0x4A0B0000-0x00000400*/ private editfixedsize @NULL MaxMoveToStrikeTime[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyProbabilityAsPercentage[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyMinDuration[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyMaxDuration[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyBackUpDistance[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzySpeedScale[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyClawRepeatCount[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzySequenceRepeatCount[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyChaseTimeOut[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyBreakOutDistance[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyForwardArcInDeg[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL FrenzyRotationRate[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL MinFrenzySeparation[589825];
var(0.25_Pct) /*0x4A120000-0x00000400*/ private editfixedsize @NULL MaxFrenzySeparation[589825];
var(0.25_Pct) /*0x4A0E0000-0x00000400*/ private editfixedsize @NULL DamageForFlee[589825];
var(0.25_Pct) /*0x4A0E0000-0x00000400*/ private editfixedsize @NULL DamageWindowInSeconds[589825];
var(0.25_Pct) /*0x4A1F0000-0x00000400*/ private editfixedsize @NULL DamageForTaunt[589825];
var(0.25_Pct) /*0x4A1F0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenTaunts[589825];
var(0.25_Pct) /*0x4A1F0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenTaunts[589825];
var(0.25_Pct) /*0x49FF0000-0x00000400*/ private editfixedsize @NULL DongoChargeAttack_DistanceBeyondTargetForCharging_Min[589825];
var(0.25_Pct) /*0x49FF0000-0x00000400*/ private editfixedsize @NULL DongoChargeAttack_DistanceBeyondTargetForCharging_Max[589825];
var(0.25_Pct) /*0x49FF0000-0x00000400*/ private editfixedsize @NULL DongoChargeAttackRotationRate[589825];
var(0.25_Pct) /*0x49FF0000-0x00000400*/ private editfixedsize @NULL DongoChargeAttackDistToLookForAdditionalEnemies[589825];
var(0.25_Pct) /*0x49FF0000-0x00000400*/ private editfixedsize @NULL DongoChargeAttackAngleToLookForAdditionalEnemies[589825];
var(0.25_Pct) /*0x49FF0000-0x00000400*/ private editfixedsize @NULL AdditionalDistanceAwayToOpenFirstDodgeWindowPof[589825];
var(0.25_Pct) /*0x49FA0000-0x00000000*/ private @NULL DongoBankingSinglePlayer[65537];
var(0.25_Pct) /*0x49FA0000-0x00000000*/ private @NULL DongoBankingMultiPlayer[65537];
var(0.25_Pct) /*0x2C200000-0x00000400*/ private editfixedsize @NULL HeightOfPoFBashZoneArcs_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float HeightOfPoFBashZoneArcs;
var(0.25_Pct) /*0x2C200000-0x00000400*/ private editfixedsize @NULL HeightOfVsBashZoneArcs_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float HeightOfVsBashZoneArcs;
var(0.25_Pct) /*0x58580000-0x00000400*/ private editfixedsize @NULL MinTimeToFleeWhenDismemberedFromPof[589825];
var(0.25_Pct) /*0x58580000-0x00000400*/ private editfixedsize @NULL MaxTimeToFleeWhenDismemberedFromPof[589825];
var(0.25_Pct) /*0x58580000-0x00000400*/ private editfixedsize @NULL MinTimeToFleeWhenDismemberedFromVs[589825];
var(0.25_Pct) /*0x58580000-0x00000400*/ private editfixedsize @NULL MaxTimeToFleeWhenDismemberedFromVs[589825];
var(0.25_Pct) /*0x58580000-0x00000400*/ private editfixedsize @NULL ChanceToFleeWhenDismemberedFromPof[589825];
var(0.25_Pct) /*0x58580000-0x00000400*/ private editfixedsize @NULL ChanceToFleeWhenDismemberedFromVs[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL ChargingMaxSpeedScale_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ChargingMaxSpeedScale;
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL WithdrawForChargeMaxSpeedScale_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float WithdrawForChargeMaxSpeedScale;
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL RunningInForTauntAttackMaxSpeedScale_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float RunningInForTauntAttackMaxSpeedScale;
var(0.25_Pct) /*0x63B70000-0x00000400*/ private editfixedsize @NULL DurationOfGrenadeStun[589825];
var(0.25_Pct) /*0x63B70000-0x00000400*/ private editfixedsize @NULL DistanceGrenadeStunned[589825];
var(0.25_Pct) /*0x63B70000-0x00000400*/ private editfixedsize @NULL DistanceGrenadeReaction[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL DamageToHumanFromMovementHit[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL DamageToVsFromMovementHit[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL DamageToOtherFromMovementHit[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL FrontVecAngleMinForFrontBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float FrontVecAngleMinForFrontBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL FrontVecAngleMaxForFrontBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float FrontVecAngleMaxForFrontBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL FrontVecAngleMinForBackBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float FrontVecAngleMinForBackBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL FrontVecAngleMaxForBackBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float FrontVecAngleMaxForBackBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL SideVecAngleMinForRightBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float SideVecAngleMinForRightBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL SideVecAngleMaxForRightBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float SideVecAngleMaxForRightBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL SideVecAngleMinForLeftBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float SideVecAngleMinForLeftBumpHitInDegrees;
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL SideVecAngleMaxForLeftBumpHitInDegrees_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float SideVecAngleMaxForLeftBumpHitInDegrees;
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushMaxRangeOnDamageConcern_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushMaxRangeOnDamageConcern;
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushWithClawMaxRangeToTargetToThenPushTarget_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushWithClawMaxRangeToTargetToThenPushTarget;
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushWithOutClawMaxRangeToTargetToThenPushTarget_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushWithOutClawMaxRangeToTargetToThenPushTarget;
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushVelocityToPushTargetWithClaw_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushVelocityToPushTargetWithClaw;
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushVelocityToPushVsWithClaw_Tunable[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushVelocityToPushShutdownVsWithClaw_Tunable[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushVelocityToPushTargetWithOutClaw_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushVelocityToPushTargetWithOutClaw;
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushVelocityToPushVsWithOutClaw_Tunable[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushVelocityToPushShutdownVsWithOutClaw_Tunable[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushDamageWithClaw[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushDamageWithClawOnVs[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushDamageWithClawOnShutdownVs[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushDamageWithOutClaw[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushDamageWithOutClawOnVs[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushDamageWithOutClawOnShutdownVs[589825];
var(0.25_Pct) /*0x221D0000-0x00000400*/ private editfixedsize @NULL ClawPushBackAngleToBeOutsideForClawSlap_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawPushBackAngleToBeOutsideForClawSlap;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForRaiseIntoTaunt_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxTimeForRaiseIntoTaunt;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForLoweringOutOfTaunt_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxTimeForLoweringOutOfTaunt;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForStrikingOutOfTaunt_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxTimeForStrikingOutOfTaunt;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForTakingGrenInTheMouth_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxTimeForTakingGrenInTheMouth;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForReactingToExplosionInTheMouth_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxTimeForReactingToExplosionInTheMouth;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayForReactiveTaunt_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MinDistanceAwayForReactiveTaunt;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim;
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinTauntLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTauntLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DamageAmountToCauseEndOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DurationOfStunAfterGettingGrenadeInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DurationOfStunAfterTakingToMuchDirrectDamageInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL ChanceToTryTauntAttackPof[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntPincerBashReachPofDistance[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntPincerBashHorizAngRangeInDegrees[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinTauntAttackLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTauntAttackLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDamageAmountToCauseEndOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDurationOfStunAfterGettingGrenadeInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth[589825];
var(0.25_Pct) /*0x47C80000-0x00000400*/ private editfixedsize @NULL DurationOfStumpBleedingAfterDismemberement_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float DurationOfStumpBleedingAfterDismemberement;
var(0.25_Pct) /*0x47C80000-0x00000400*/ private editfixedsize @NULL WaitTimeBetweenStumpBleedsAfterDismemberement_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float WaitTimeBetweenStumpBleedsAfterDismemberement;
var(0.25_Pct) /*0x47C80000-0x00000400*/ private editfixedsize @NULL MaxUpdateDeltaToAllowDismemberedBleed_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxUpdateDeltaToAllowDismemberedBleed;
var(0.25_Pct) /*0x47C80000-0x00000400*/ private editfixedsize @NULL MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float MaxUpdateDeltaToAllowHighRedDismemberedBleed;
var(0.25_Pct) /*0x0E8C0000-0x00000400*/ private editfixedsize @NULL BellyCoreSize_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float BellyCoreSize;
var(0.25_Pct) /*0x0E8C0000-0x00000400*/ private editfixedsize @NULL BellyCoreRadius_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float BellyCoreRadius;
var(0.25_Pct) /*0x0E8C0000-0x00000000*/ private int BellyCoreSegments[65537];
var(0.25_Pct) /*0x0E8C0000-0x00000400*/ private @NULL BellyCoreColor[589825];
var(0.25_Pct) /*0x273B0000-0x00000400*/ private export @NULL UnderBellyLight[589825];
var(0.25_Pct) /*0x273B0000-0x00000400*/ private export @NULL MouthLight[589825];
var(0.25_Pct) /*0x22070000-0x00000400*/ private editfixedsize @NULL ClawAttackPlayerStumbleRadius_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ClawAttackPlayerStumbleRadius;
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize array BoneAttachPointByCore[589825];
var(0.25_Pct) /*0xD0140000-0x00000400*/ private editfixedsize @NULL UberHitDamagePoF[589825];
var(0.25_Pct) /*0xD0140000-0x00000400*/ private editfixedsize @NULL UberHitDamageVS[589825];
var(0.25_Pct) /*0xD0140000-0x00000400*/ private editfixedsize @NULL TimeAfterVsReleaseStartsToKillSpMove_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float TimeAfterVsReleaseStartsToKillSpMove;
var(0.25_Pct) /*0xB7880000-0x00000400*/ private editfixedsize @NULL ShakeRadius_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float ShakeRadius;
var(0.25_Pct) /*0xB7880000-0x00000400*/ private @NULL ShakeParams[65537];
var(0.25_Pct) /*0x5A190000-0x00000400*/ private editfixedsize @NULL TimeClawFreeze_Tunable[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient float TimeClawFreeze;
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxDistToEnemiesForGroundPound[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL GroundPoundHorizAngRangeInDegrees[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinEnemiesToGroundPound[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL ChanceToGroundPound[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL ChanceToGroundPoundWithNoClaws[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL ChanceToTauntBeforeGroundPound[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinGroundPoundTauntTime[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxGroundPoundTauntTime[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenGroundPounds[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenGroundPounds[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL GroundPoundDamageAmount[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL MaxDistToEnemiesForSwipeAttack[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL SwipeAttackHorizAngRangeInDegrees[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL MinEnemiesToSwipeAttack[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenSwipeAttacks[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenSwipeAttacks[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL ChanceToSwipeAttack[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL MinTauntAfterSwipeLoopTime[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL MaxTauntAfterSwipeLoopTime[589825];
var(0.25_Pct) /*0xC7B10000-0x00000400*/ private editfixedsize @NULL ChanceOfTauntAfterSwipe[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawStuckPercentageDefaultObject'
    begin object name=ClawStuckPercentageDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=85.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawStuckPercentage=ClawStuckPercentageDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawStuckTimeMinDefaultObject'
    begin object name=ClawStuckTimeMinDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawStuckTimeMin=ClawStuckTimeMinDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawStuckTimeMaxDefaultObject'
    begin object name=ClawStuckTimeMaxDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawStuckTimeMax=ClawStuckTimeMaxDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenAttacksDefaultObject'
    begin object name=MinTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenAttacks=MinTimeBetweenAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenAttacksDefaultObject'
    begin object name=MaxTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenAttacks=MaxTimeBetweenAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenAttacksVsDefaultObject'
    begin object name=MinTimeBetweenAttacksVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenAttacksVs=MinTimeBetweenAttacksVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenAttacksVsDefaultObject'
    begin object name=MaxTimeBetweenAttacksVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenAttacksVs=MaxTimeBetweenAttacksVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PincerBashReachPofDistanceDefaultObject'
    begin object name=PincerBashReachPofDistanceDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=750.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PincerBashReachPofDistance=PincerBashReachPofDistanceDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PincerBashReachVsDistanceDefaultObject'
    begin object name=PincerBashReachVsDistanceDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PincerBashReachVsDistance=PincerBashReachVsDistanceDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PincerBashReachPofMovementErrorDistance_Tunable_Default'
    begin object name=PincerBashReachPofMovementErrorDistance_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PincerBashReachPofMovementErrorDistance_Tunable=PincerBashReachPofMovementErrorDistance_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PincerBashReachVsMovementErrorDistance_Tunable_Default'
    begin object name=PincerBashReachVsMovementErrorDistance_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PincerBashReachVsMovementErrorDistance_Tunable=PincerBashReachVsMovementErrorDistance_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable_Default'
    begin object name=AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable=AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PincerBashHorizAngRangeInDegreesDefaultObject'
    begin object name=PincerBashHorizAngRangeInDegreesDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PincerBashHorizAngRangeInDegrees=PincerBashHorizAngRangeInDegreesDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenPincerBashAttacksDefaultObject'
    begin object name=MinTimeBetweenPincerBashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenPincerBashAttacks=MinTimeBetweenPincerBashAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenPincerBashAttacksDefaultObject'
    begin object name=MaxTimeBetweenPincerBashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenPincerBashAttacks=MaxTimeBetweenPincerBashAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenVsPincerBashAttacksDefaultObject'
    begin object name=MinTimeBetweenVsPincerBashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.4000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenVsPincerBashAttacks=MinTimeBetweenVsPincerBashAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenVsPincerBashAttacksDefaultObject'
    begin object name=MaxTimeBetweenVsPincerBashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenVsPincerBashAttacks=MaxTimeBetweenVsPincerBashAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenHastyPincerBashAttacksDefaultObject'
    begin object name=MinTimeBetweenHastyPincerBashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenHastyPincerBashAttacks=MinTimeBetweenHastyPincerBashAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenHastyPincerBashAttacksDefaultObject'
    begin object name=MaxTimeBetweenHastyPincerBashAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenHastyPincerBashAttacks=MaxTimeBetweenHastyPincerBashAttacksDefaultObject
    bChargeHitsOnTouchAgainstPof=true
    bChargeAfterFrenzy=true
    bEnableFirstDodgeWindow=true
    bAllowMovementHitOnTouch=true
    bAllowMovementHitOnBump=true
    bAllowMovementHitOnBumpEffects=true
    bFocusOnEnemyDuringTaunt=true
    bUsePostDismembermentStumpAutoBleed=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AmountToDecreaseHastyPincerBashRangeWhenStunnedDefaultObject'
    begin object name=AmountToDecreaseHastyPincerBashRangeWhenStunnedDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountToDecreaseHastyPincerBashRangeWhenStunned=AmountToDecreaseHastyPincerBashRangeWhenStunnedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeToWaitForClawStrikeToFinish_Tunable_Default'
    begin object name=MaxTimeToWaitForClawStrikeToFinish_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToWaitForClawStrikeToFinish_Tunable=MaxTimeToWaitForClawStrikeToFinish_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AdditionalDelayTimeWhenStruckBlockedVsWithClawStrikeDefaultObject'
    begin object name=AdditionalDelayTimeWhenStruckBlockedVsWithClawStrikeDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AdditionalDelayTimeWhenStruckBlockedVsWithClawStrike=AdditionalDelayTimeWhenStruckBlockedVsWithClawStrikeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeForClawAttackPhase'
    begin object name=MinTimeForClawAttackPhase class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeForClawAttackPhase=MinTimeForClawAttackPhase
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeForClawAttackPhase'
    begin object name=MaxTimeForClawAttackPhase class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForClawAttackPhase=MaxTimeForClawAttackPhase
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinAngleInDegreesNeededForTurnToFaceCommandWhileInStrikeStateDefaultObject'
    begin object name=MinAngleInDegreesNeededForTurnToFaceCommandWhileInStrikeStateDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAngleInDegreesNeededForTurnToFaceCommandWhileInStrikeState=MinAngleInDegreesNeededForTurnToFaceCommandWhileInStrikeStateDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawAttackAnimationRateVS_Default'
    begin object name=ClawAttackAnimationRateVS_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawAttackAnimationRateVS=ClawAttackAnimationRateVS_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawAttackAnimationRatePOF_Default'
    begin object name=ClawAttackAnimationRatePOF_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawAttackAnimationRatePOF=ClawAttackAnimationRatePOF_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawStrikeRadialBlurFadeOutTime_Tunable_Default'
    begin object name=ClawStrikeRadialBlurFadeOutTime_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawStrikeRadialBlurFadeOutTime_Tunable=ClawStrikeRadialBlurFadeOutTime_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawStrikeRadialBlurMaxBlur_Tunable_Default'
    begin object name=ClawStrikeRadialBlurMaxBlur_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawStrikeRadialBlurMaxBlur_Tunable=ClawStrikeRadialBlurMaxBlur_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeStrikeRadialBlurFadeOutTime_Tunable_Default'
    begin object name=ChargeStrikeRadialBlurFadeOutTime_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeStrikeRadialBlurFadeOutTime_Tunable=ChargeStrikeRadialBlurFadeOutTime_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeStrikeRadialBlurMaxBlur_Tunable_Default'
    begin object name=ChargeStrikeRadialBlurMaxBlur_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeStrikeRadialBlurMaxBlur_Tunable=ChargeStrikeRadialBlurMaxBlur_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushRadialBlurFadeOutTime_Tunable_Default'
    begin object name=ClawPushRadialBlurFadeOutTime_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushRadialBlurFadeOutTime_Tunable=ClawPushRadialBlurFadeOutTime_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushRadialBlurMaxBlur_Tunable_Default'
    begin object name=ClawPushRadialBlurMaxBlur_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushRadialBlurMaxBlur_Tunable=ClawPushRadialBlurMaxBlur_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDistanceToNotAvoidVsDuringNormalMovement_Tunable_Default'
    begin object name=MaxDistanceToNotAvoidVsDuringNormalMovement_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceToNotAvoidVsDuringNormalMovement_Tunable=MaxDistanceToNotAvoidVsDuringNormalMovement_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AngleToSideStepVsDuringNormalMovement_Tunable_Default'
    begin object name=AngleToSideStepVsDuringNormalMovement_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleToSideStepVsDuringNormalMovement_Tunable=AngleToSideStepVsDuringNormalMovement_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.HitPointsBackInnerShellDefaultObject'
    begin object name=HitPointsBackInnerShellDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HitPointsBackInnerShell=HitPointsBackInnerShellDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.HitPointsBackOuterShellDefaultObject'
    begin object name=HitPointsBackOuterShellDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HitPointsBackOuterShell=HitPointsBackOuterShellDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.HitPointsBellyShellDefaultObject'
    begin object name=HitPointsBellyShellDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HitPointsBellyShell=HitPointsBellyShellDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.CapOnStartToggleGlowBrightnessDefaultObject'
    begin object name=CapOnStartToggleGlowBrightnessDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CapOnStartToggleGlowBrightness=CapOnStartToggleGlowBrightnessDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.CapOnStartToggleGlowEmissiveDefaultObject'
    begin object name=CapOnStartToggleGlowEmissiveDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CapOnStartToggleGlowEmissive=CapOnStartToggleGlowEmissiveDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.OuterShellOnStartToggleGlowBrightnessDefaultObject'
    begin object name=OuterShellOnStartToggleGlowBrightnessDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OuterShellOnStartToggleGlowBrightness=OuterShellOnStartToggleGlowBrightnessDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.OuterShellOnStartToggleGlowEmissiveDefaultObject'
    begin object name=OuterShellOnStartToggleGlowEmissiveDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OuterShellOnStartToggleGlowEmissive=OuterShellOnStartToggleGlowEmissiveDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.InnerShellOnStartToggleGlowBrightnessDefaultObject'
    begin object name=InnerShellOnStartToggleGlowBrightnessDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    InnerShellOnStartToggleGlowBrightness=InnerShellOnStartToggleGlowBrightnessDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.InnerShellOnStartToggleGlowEmissiveDefaultObject'
    begin object name=InnerShellOnStartToggleGlowEmissiveDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    InnerShellOnStartToggleGlowEmissive=InnerShellOnStartToggleGlowEmissiveDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.OuterShellOnCapDestructionGlowBrightnessDefaultObject'
    begin object name=OuterShellOnCapDestructionGlowBrightnessDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OuterShellOnCapDestructionGlowBrightness=OuterShellOnCapDestructionGlowBrightnessDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.OuterShellOnCapDestructionGlowEmissiveeDefaultObject'
    begin object name=OuterShellOnCapDestructionGlowEmissiveeDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OuterShellOnCapDestructionGlowEmissive=OuterShellOnCapDestructionGlowEmissiveeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.InnerShellOnOuterShellDestructionGlowBrightnessDefaultObject'
    begin object name=InnerShellOnOuterShellDestructionGlowBrightnessDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    InnerShellOnOuterShellDestructionGlowBrightness=InnerShellOnOuterShellDestructionGlowBrightnessDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.InnerShellOnOuterShellDestructionGlowEmissiveDefaultObject'
    begin object name=InnerShellOnOuterShellDestructionGlowEmissiveDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    InnerShellOnOuterShellDestructionGlowEmissive=InnerShellOnOuterShellDestructionGlowEmissiveDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayToTryChargeAttack_Tunable_Default'
    begin object name=MinDistanceAwayToTryChargeAttack_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToTryChargeAttack_Tunable=MinDistanceAwayToTryChargeAttack_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayToStartChargingStrike_Tunable_Default'
    begin object name=MinDistanceAwayToStartChargingStrike_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToStartChargingStrike_Tunable=MinDistanceAwayToStartChargingStrike_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceBeyondTargetForChargingStrike_Tunable_Default'
    begin object name=DistanceBeyondTargetForChargingStrike_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceBeyondTargetForChargingStrike_Tunable=DistanceBeyondTargetForChargingStrike_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayToTryChargeAttackAgainstVs_Tunable_Default'
    begin object name=MinDistanceAwayToTryChargeAttackAgainstVs_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToTryChargeAttackAgainstVs_Tunable=MinDistanceAwayToTryChargeAttackAgainstVs_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayToStartChargingStrikeAgainstVs_Tunable_Default'
    begin object name=MinDistanceAwayToStartChargingStrikeAgainstVs_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToStartChargingStrikeAgainstVs_Tunable=MinDistanceAwayToStartChargingStrikeAgainstVs_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayToStartChargingStrikeAgainstVsIfEmpty_Default'
    begin object name=MinDistanceAwayToStartChargingStrikeAgainstVsIfEmpty_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToStartChargingStrikeAgainstVsIfEmpty=MinDistanceAwayToStartChargingStrikeAgainstVsIfEmpty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceBeyondTargetForChargingStrikeAgainstVs_Tunable_Default'
    begin object name=DistanceBeyondTargetForChargingStrikeAgainstVs_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceBeyondTargetForChargingStrikeAgainstVs_Tunable=DistanceBeyondTargetForChargingStrikeAgainstVs_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack_Default'
    begin object name=MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack=MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack_Default
    DongoDistanceToStartBounce=1200.0000000
    DongoDistanceToStartBounceIfEmpty=3100.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AngleToSideStepVsDuringCharge_Tunable_Default'
    begin object name=AngleToSideStepVsDuringCharge_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleToSideStepVsDuringCharge_Tunable=AngleToSideStepVsDuringCharge_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfChargingShakeOffDefaultObject'
    begin object name=DurationOfChargingShakeOffDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfChargingShakeOff=DurationOfChargingShakeOffDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfChargingShakeOffAgainstVsDefaultObject'
    begin object name=DurationOfChargingShakeOffAgainstVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfChargingShakeOffAgainstVs=DurationOfChargingShakeOffAgainstVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfFailedChargeStunDefaultObject'
    begin object name=DurationOfFailedChargeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfFailedChargeStun=DurationOfFailedChargeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfBlockedChargeStunDefaultObject'
    begin object name=DurationOfBlockedChargeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfBlockedChargeStun=DurationOfBlockedChargeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeHitDamagePoFDefaultObject'
    begin object name=ChargeHitDamagePoFDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeHitDamagePoF=ChargeHitDamagePoFDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeHitDamageVSDefaultObject'
    begin object name=ChargeHitDamageVSDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeHitDamageVS=ChargeHitDamageVSDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeHitDamageShutdownVSDefaultObject'
    begin object name=ChargeHitDamageShutdownVSDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeHitDamageShutdownVS=ChargeHitDamageShutdownVSDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeBrushDamagePoFDefaultObject'
    begin object name=ChargeBrushDamagePoFDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeBrushDamagePoF=ChargeBrushDamagePoFDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeBrushDamageVsDefaultObject'
    begin object name=ChargeBrushDamageVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeBrushDamageVs=ChargeBrushDamageVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeBrushDamageShutdownVsDefaultObject'
    begin object name=ChargeBrushDamageShutdownVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeBrushDamageShutdownVs=ChargeBrushDamageShutdownVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamageDefaultObject'
    begin object name=MinAmountOfHealthForVsToTakeNonShutdownHitDamageDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfHealthForVsToTakeNonShutdownHitDamage=MinAmountOfHealthForVsToTakeNonShutdownHitDamageDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceAwayToOpenDodgeWindowPofDefaultObject'
    begin object name=DistanceAwayToOpenDodgeWindowPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceAwayToOpenDodgeWindowPof=DistanceAwayToOpenDodgeWindowPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceAwayToCloseDodgeWindowPofDefaultObject'
    begin object name=DistanceAwayToCloseDodgeWindowPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceAwayToCloseDodgeWindowPof=DistanceAwayToCloseDodgeWindowPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayBetweenNewChargeHitsAgainstVsAllowed_Tunable_Default'
    begin object name=DelayBetweenNewChargeHitsAgainstVsAllowed_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenNewChargeHitsAgainstVsAllowed_Tunable=DelayBetweenNewChargeHitsAgainstVsAllowed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayBetweenNewChargeHitsAgainstShutdownVsAllowed_TunableD0'
    begin object name=DelayBetweenNewChargeHitsAgainstShutdownVsAllowed_TunableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenNewChargeHitsAgainstShutdownVsAllowed_Tunable=DelayBetweenNewChargeHitsAgainstShutdownVsAllowed_TunableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayBetweenNewChargeHitsAllowed_Tunable_Default'
    begin object name=DelayBetweenNewChargeHitsAllowed_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenNewChargeHitsAllowed_Tunable=DelayBetweenNewChargeHitsAllowed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SpeedToAllowHitOnWhenTripping_Tunable_Default'
    begin object name=SpeedToAllowHitOnWhenTripping_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpeedToAllowHitOnWhenTripping_Tunable=SpeedToAllowHitOnWhenTripping_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DesiredSeperationWhenChargeIsNotPossible_Tunable_Default'
    begin object name=DesiredSeperationWhenChargeIsNotPossible_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DesiredSeperationWhenChargeIsNotPossible_Tunable=DesiredSeperationWhenChargeIsNotPossible_Tunable_Default
    ChargeDodgeMessage=(MessageText="DODGE NOW!!!",AppendedText="",MessageFont=none,MessageFontScale=(X=6.0000000,Y=6.0000000),MessageOffset=(X=-200.0000000,Y=0.0000000,Z=0.0000000),MessageColor=(R=255,G=0,B=255,A=255),MessageEndTime=-1.0000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinSeperationFromEnemyToTryWithdrawPofDefaultObject'
    begin object name=MinSeperationFromEnemyToTryWithdrawPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationFromEnemyToTryWithdrawPof=MinSeperationFromEnemyToTryWithdrawPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinSeperationFromEnemyToTryWithdrawVsDefaultObject'
    begin object name=MinSeperationFromEnemyToTryWithdrawVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationFromEnemyToTryWithdrawVs=MinSeperationFromEnemyToTryWithdrawVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToTryWithdrawAndChargePofDefaultObject'
    begin object name=ChanceToTryWithdrawAndChargePofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryWithdrawAndChargePof=ChanceToTryWithdrawAndChargePofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToTryWithdrawAndChargeVsDefaultObject'
    begin object name=ChanceToTryWithdrawAndChargeVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryWithdrawAndChargeVs=ChanceToTryWithdrawAndChargeVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDismemberedSeperationFromEnemyToTryWithdrawPofDefaultObject'
    begin object name=MinDismemberedSeperationFromEnemyToTryWithdrawPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDismemberedSeperationFromEnemyToTryWithdrawPof=MinDismemberedSeperationFromEnemyToTryWithdrawPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDismemberedSeperationFromEnemyToTryWithdrawVsDefaultObject'
    begin object name=MinDismemberedSeperationFromEnemyToTryWithdrawVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDismemberedSeperationFromEnemyToTryWithdrawVs=MinDismemberedSeperationFromEnemyToTryWithdrawVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToTryDismemberedWithdrawAndChargePofDefaultObject'
    begin object name=ChanceToTryDismemberedWithdrawAndChargePofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryDismemberedWithdrawAndChargePof=ChanceToTryDismemberedWithdrawAndChargePofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToTryDismemberedWithdrawAndChargeVsDefaultObject'
    begin object name=ChanceToTryDismemberedWithdrawAndChargeVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryDismemberedWithdrawAndChargeVs=ChanceToTryDismemberedWithdrawAndChargeVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceBetweenWithdrawPointsToCheck_Tunable_Default'
    begin object name=DistanceBetweenWithdrawPointsToCheck_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceBetweenWithdrawPointsToCheck_Tunable=DistanceBetweenWithdrawPointsToCheck_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ExtraBufferToAddToTheWithdrawDistance_Tunable_Default'
    begin object name=ExtraBufferToAddToTheWithdrawDistance_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ExtraBufferToAddToTheWithdrawDistance_Tunable=ExtraBufferToAddToTheWithdrawDistance_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt_Tunable_Default'
    begin object name=NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt_Tunable=NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationBetweenMovementDeltaDuringChargeRunIn_Tunable_Default'
    begin object name=DurationBetweenMovementDeltaDuringChargeRunIn_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationBetweenMovementDeltaDuringChargeRunIn_Tunable=DurationBetweenMovementDeltaDuringChargeRunIn_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinMovementDeltaDuringChargeRunIn_Tunable_Default'
    begin object name=MinMovementDeltaDuringChargeRunIn_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinMovementDeltaDuringChargeRunIn_Tunable=MinMovementDeltaDuringChargeRunIn_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable_Default'
    begin object name=DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable=DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable_Default'
    begin object name=DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable=DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinMovementDeltaDuringWithdrawForCharge_Tunable_Default'
    begin object name=MinMovementDeltaDuringWithdrawForCharge_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinMovementDeltaDuringWithdrawForCharge_Tunable=MinMovementDeltaDuringWithdrawForCharge_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable_Default'
    begin object name=DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable=DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeRampUpTime_Default'
    begin object name=ChargeRampUpTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeRampUpTime=ChargeRampUpTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeLockOnDistanceMin_Default'
    begin object name=ChargeLockOnDistanceMin_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeLockOnDistanceMin=ChargeLockOnDistanceMin_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargeLockOnDistanceMax_Default'
    begin object name=ChargeLockOnDistanceMax_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=850.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeLockOnDistanceMax=ChargeLockOnDistanceMax_Default
    RamAttackSocket="ShellGrenadeBlowout"
    ExplosiveGroundPoundSocket="ShellGrenadeBlowout"
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinMoveToStrikeTime_Default'
    begin object name=MinMoveToStrikeTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinMoveToStrikeTime=MinMoveToStrikeTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxMoveToStrikeTime_Default'
    begin object name=MaxMoveToStrikeTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxMoveToStrikeTime=MaxMoveToStrikeTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyProbabilityAsPercentage_Default'
    begin object name=FrenzyProbabilityAsPercentage_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyProbabilityAsPercentage=FrenzyProbabilityAsPercentage_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyMinDuration_Default'
    begin object name=FrenzyMinDuration_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyMinDuration=FrenzyMinDuration_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyMaxDuration_Default'
    begin object name=FrenzyMaxDuration_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyMaxDuration=FrenzyMaxDuration_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyBackUpDistance_Default'
    begin object name=FrenzyBackUpDistance_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyBackUpDistance=FrenzyBackUpDistance_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzySpeedScale_Default'
    begin object name=FrenzySpeedScale_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzySpeedScale=FrenzySpeedScale_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyClawRepeatCount_Default'
    begin object name=FrenzyClawRepeatCount_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyClawRepeatCount=FrenzyClawRepeatCount_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzySequenceRepeatCount_Default'
    begin object name=FrenzySequenceRepeatCount_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzySequenceRepeatCount=FrenzySequenceRepeatCount_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyChaseTimeOut_Default'
    begin object name=FrenzyChaseTimeOut_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyChaseTimeOut=FrenzyChaseTimeOut_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyBreakOutDistance_Default'
    begin object name=FrenzyBreakOutDistance_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyBreakOutDistance=FrenzyBreakOutDistance_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyForwardArcInDeg_Default'
    begin object name=FrenzyForwardArcInDeg_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyForwardArcInDeg=FrenzyForwardArcInDeg_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrenzyRotationRate_Default'
    begin object name=FrenzyRotationRate_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrenzyRotationRate=FrenzyRotationRate_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinFrenzySeparation_Default'
    begin object name=MinFrenzySeparation_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinFrenzySeparation=MinFrenzySeparation_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxFrenzySeparation_Default'
    begin object name=MaxFrenzySeparation_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1600.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxFrenzySeparation=MaxFrenzySeparation_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageForFlee_Default'
    begin object name=DamageForFlee_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageForFlee=DamageForFlee_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageWindowInSeconds_Default'
    begin object name=DamageWindowInSeconds_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageWindowInSeconds=DamageWindowInSeconds_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageForTaunt_Default'
    begin object name=DamageForTaunt_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageForTaunt=DamageForTaunt_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenTaunts_Default'
    begin object name=MinTimeBetweenTaunts_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenTaunts=MinTimeBetweenTaunts_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenTaunts_Default'
    begin object name=MaxTimeBetweenTaunts_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenTaunts=MaxTimeBetweenTaunts_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DongoChargeAttack_DistanceBeyondTargetForCharging_Min_Default'
    begin object name=DongoChargeAttack_DistanceBeyondTargetForCharging_Min_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DongoChargeAttack_DistanceBeyondTargetForCharging_Min=DongoChargeAttack_DistanceBeyondTargetForCharging_Min_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DongoChargeAttack_DistanceBeyondTargetForCharging_Max_Default'
    begin object name=DongoChargeAttack_DistanceBeyondTargetForCharging_Max_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DongoChargeAttack_DistanceBeyondTargetForCharging_Max=DongoChargeAttack_DistanceBeyondTargetForCharging_Max_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DongoChargeAttackRotationRate_Default'
    begin object name=DongoChargeAttackRotationRate_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=360.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DongoChargeAttackRotationRate=DongoChargeAttackRotationRate_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DongoChargeAttackDistToLookForAdditionalEnemies_Default'
    begin object name=DongoChargeAttackDistToLookForAdditionalEnemies_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DongoChargeAttackDistToLookForAdditionalEnemies=DongoChargeAttackDistToLookForAdditionalEnemies_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DongoChargeAttackAngleToLookForAdditionalEnemies_Default'
    begin object name=DongoChargeAttackAngleToLookForAdditionalEnemies_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=80.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DongoChargeAttackAngleToLookForAdditionalEnemies=DongoChargeAttackAngleToLookForAdditionalEnemies_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AdditionalDistanceAwayToOpenFirstDodgeWindowPof_Default'
    begin object name=AdditionalDistanceAwayToOpenFirstDodgeWindowPof_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AdditionalDistanceAwayToOpenFirstDodgeWindowPof=AdditionalDistanceAwayToOpenFirstDodgeWindowPof_Default
    DongoBankingSinglePlayer=(bEnable=true,TurnRateDegreesPerSecond=190.0000000,MaximumBankAngleInDegrees=50.0000000,MinimumBankAngleInDegrees=20.0000000,BankRateInDegreesPerSecond=90.0000000,MinimumSpeedScaleFactor=0.1000000)
    DongoBankingMultiPlayer=(bEnable=true,TurnRateDegreesPerSecond=190.0000000,MaximumBankAngleInDegrees=50.0000000,MinimumBankAngleInDegrees=20.0000000,BankRateInDegreesPerSecond=90.0000000,MinimumSpeedScaleFactor=0.1000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.HeightOfPoFBashZoneArcs_Tunable_Default'
    begin object name=HeightOfPoFBashZoneArcs_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HeightOfPoFBashZoneArcs_Tunable=HeightOfPoFBashZoneArcs_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.HeightOfVsBashZoneArcs_Tunable_Default'
    begin object name=HeightOfVsBashZoneArcs_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HeightOfVsBashZoneArcs_Tunable=HeightOfVsBashZoneArcs_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeToFleeWhenDismemberedFromPofDefaultObject'
    begin object name=MinTimeToFleeWhenDismemberedFromPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeToFleeWhenDismemberedFromPof=MinTimeToFleeWhenDismemberedFromPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeToFleeWhenDismemberedFromPofDefaultObject'
    begin object name=MaxTimeToFleeWhenDismemberedFromPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToFleeWhenDismemberedFromPof=MaxTimeToFleeWhenDismemberedFromPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeToFleeWhenDismemberedFromVsDefaultObject'
    begin object name=MinTimeToFleeWhenDismemberedFromVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeToFleeWhenDismemberedFromVs=MinTimeToFleeWhenDismemberedFromVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeToFleeWhenDismemberedFromVsDefaultObject'
    begin object name=MaxTimeToFleeWhenDismemberedFromVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToFleeWhenDismemberedFromVs=MaxTimeToFleeWhenDismemberedFromVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToFleeWhenDismemberedFromPofDefaultObject'
    begin object name=ChanceToFleeWhenDismemberedFromPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToFleeWhenDismemberedFromPof=ChanceToFleeWhenDismemberedFromPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToFleeWhenDismemberedFromVsDefaultObject'
    begin object name=ChanceToFleeWhenDismemberedFromVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToFleeWhenDismemberedFromVs=ChanceToFleeWhenDismemberedFromVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChargingMaxSpeedScale_Tunable_Default'
    begin object name=ChargingMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargingMaxSpeedScale_Tunable=ChargingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.WithdrawForChargeMaxSpeedScale_Tunable_Default'
    begin object name=WithdrawForChargeMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WithdrawForChargeMaxSpeedScale_Tunable=WithdrawForChargeMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.RunningInForTauntAttackMaxSpeedScale_Tunable_Default'
    begin object name=RunningInForTauntAttackMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RunningInForTauntAttackMaxSpeedScale_Tunable=RunningInForTauntAttackMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfGrenadeStunDefaultObject'
    begin object name=DurationOfGrenadeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfGrenadeStun=DurationOfGrenadeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceGrenadeStunnedDefaultObject'
    begin object name=DistanceGrenadeStunnedDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeStunned=DistanceGrenadeStunnedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceGrenadeReactionDefaultObject'
    begin object name=DistanceGrenadeReactionDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeReaction=DistanceGrenadeReactionDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageToHumanFromMovementHitDefaultObject'
    begin object name=DamageToHumanFromMovementHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToHumanFromMovementHit=DamageToHumanFromMovementHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageToVsFromMovementHitDefaultObject'
    begin object name=DamageToVsFromMovementHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToVsFromMovementHit=DamageToVsFromMovementHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageToOtherFromMovementHitDefaultObject'
    begin object name=DamageToOtherFromMovementHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToOtherFromMovementHit=DamageToOtherFromMovementHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrontVecAngleMinForFrontBumpHitInDegrees_Tunable_Default'
    begin object name=FrontVecAngleMinForFrontBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrontVecAngleMinForFrontBumpHitInDegrees_Tunable=FrontVecAngleMinForFrontBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrontVecAngleMaxForFrontBumpHitInDegrees_Tunable_Default'
    begin object name=FrontVecAngleMaxForFrontBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrontVecAngleMaxForFrontBumpHitInDegrees_Tunable=FrontVecAngleMaxForFrontBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrontVecAngleMinForBackBumpHitInDegrees_Tunable_Default'
    begin object name=FrontVecAngleMinForBackBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrontVecAngleMinForBackBumpHitInDegrees_Tunable=FrontVecAngleMinForBackBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FrontVecAngleMaxForBackBumpHitInDegrees_Tunable_Default'
    begin object name=FrontVecAngleMaxForBackBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FrontVecAngleMaxForBackBumpHitInDegrees_Tunable=FrontVecAngleMaxForBackBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SideVecAngleMinForRightBumpHitInDegrees_Tunable_Default'
    begin object name=SideVecAngleMinForRightBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SideVecAngleMinForRightBumpHitInDegrees_Tunable=SideVecAngleMinForRightBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SideVecAngleMaxForRightBumpHitInDegrees_Tunable_Default'
    begin object name=SideVecAngleMaxForRightBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SideVecAngleMaxForRightBumpHitInDegrees_Tunable=SideVecAngleMaxForRightBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SideVecAngleMinForLeftBumpHitInDegrees_Tunable_Default'
    begin object name=SideVecAngleMinForLeftBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SideVecAngleMinForLeftBumpHitInDegrees_Tunable=SideVecAngleMinForLeftBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SideVecAngleMaxForLeftBumpHitInDegrees_Tunable_Default'
    begin object name=SideVecAngleMaxForLeftBumpHitInDegrees_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SideVecAngleMaxForLeftBumpHitInDegrees_Tunable=SideVecAngleMaxForLeftBumpHitInDegrees_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushMaxRangeOnDamageConcern_Tunable_Default'
    begin object name=ClawPushMaxRangeOnDamageConcern_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushMaxRangeOnDamageConcern_Tunable=ClawPushMaxRangeOnDamageConcern_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushWithClawMaxRangeToTargetToThenPushTarget_Tunable_Default'
    begin object name=ClawPushWithClawMaxRangeToTargetToThenPushTarget_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushWithClawMaxRangeToTargetToThenPushTarget_Tunable=ClawPushWithClawMaxRangeToTargetToThenPushTarget_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushWithOutClawMaxRangeToTargetToThenPushTarget_Tunable_Default'
    begin object name=ClawPushWithOutClawMaxRangeToTargetToThenPushTarget_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushWithOutClawMaxRangeToTargetToThenPushTarget_Tunable=ClawPushWithOutClawMaxRangeToTargetToThenPushTarget_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushVelocityToPushTargetWithClaw_Tunable_Default'
    begin object name=ClawPushVelocityToPushTargetWithClaw_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushVelocityToPushTargetWithClaw_Tunable=ClawPushVelocityToPushTargetWithClaw_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushVelocityToPushVsWithClaw_Tunable_Default'
    begin object name=ClawPushVelocityToPushVsWithClaw_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushVelocityToPushVsWithClaw_Tunable=ClawPushVelocityToPushVsWithClaw_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushVelocityToPushShutdownVsWithClaw_Tunable_Default'
    begin object name=ClawPushVelocityToPushShutdownVsWithClaw_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushVelocityToPushShutdownVsWithClaw_Tunable=ClawPushVelocityToPushShutdownVsWithClaw_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushVelocityToPushTargetWithOutClaw_Tunable_Default'
    begin object name=ClawPushVelocityToPushTargetWithOutClaw_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushVelocityToPushTargetWithOutClaw_Tunable=ClawPushVelocityToPushTargetWithOutClaw_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushVelocityToPushVsWithOutClaw_Tunable_Default'
    begin object name=ClawPushVelocityToPushVsWithOutClaw_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushVelocityToPushVsWithOutClaw_Tunable=ClawPushVelocityToPushVsWithOutClaw_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushVelocityToPushShutdownVsWithOutClaw_Tunable_Default'
    begin object name=ClawPushVelocityToPushShutdownVsWithOutClaw_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushVelocityToPushShutdownVsWithOutClaw_Tunable=ClawPushVelocityToPushShutdownVsWithOutClaw_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushDamageWithClawDO'
    begin object name=ClawPushDamageWithClawDO class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushDamageWithClaw=ClawPushDamageWithClawDO
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushDamageWithClawOnVsD0'
    begin object name=ClawPushDamageWithClawOnVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushDamageWithClawOnVs=ClawPushDamageWithClawOnVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushDamageWithClawOnShutdownVsD0'
    begin object name=ClawPushDamageWithClawOnShutdownVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushDamageWithClawOnShutdownVs=ClawPushDamageWithClawOnShutdownVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushDamageWithOutClawDO'
    begin object name=ClawPushDamageWithOutClawDO class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushDamageWithOutClaw=ClawPushDamageWithOutClawDO
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushDamageWithOutClawOnVsDO'
    begin object name=ClawPushDamageWithOutClawOnVsDO class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushDamageWithOutClawOnVs=ClawPushDamageWithOutClawOnVsDO
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushDamageWithOutClawOnShutdownVsDO'
    begin object name=ClawPushDamageWithOutClawOnShutdownVsDO class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushDamageWithOutClawOnShutdownVs=ClawPushDamageWithOutClawOnShutdownVsDO
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawPushBackAngleToBeOutsideForClawSlap_Tunable_Default'
    begin object name=ClawPushBackAngleToBeOutsideForClawSlap_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawPushBackAngleToBeOutsideForClawSlap_Tunable=ClawPushBackAngleToBeOutsideForClawSlap_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeForRaiseIntoTaunt_Tunable_Default'
    begin object name=MaxTimeForRaiseIntoTaunt_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForRaiseIntoTaunt_Tunable=MaxTimeForRaiseIntoTaunt_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeForLoweringOutOfTaunt_Tunable_Default'
    begin object name=MaxTimeForLoweringOutOfTaunt_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForLoweringOutOfTaunt_Tunable=MaxTimeForLoweringOutOfTaunt_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeForStrikingOutOfTaunt_Tunable_Default'
    begin object name=MaxTimeForStrikingOutOfTaunt_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForStrikingOutOfTaunt_Tunable=MaxTimeForStrikingOutOfTaunt_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeForTakingGrenInTheMouth_Tunable_Default'
    begin object name=MaxTimeForTakingGrenInTheMouth_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForTakingGrenInTheMouth_Tunable=MaxTimeForTakingGrenInTheMouth_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeForReactingToExplosionInTheMouth_Tunable_Default'
    begin object name=MaxTimeForReactingToExplosionInTheMouth_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForReactingToExplosionInTheMouth_Tunable=MaxTimeForReactingToExplosionInTheMouth_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayForReactiveTaunt_Tunable_Default'
    begin object name=MinDistanceAwayForReactiveTaunt_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayForReactiveTaunt_Tunable=MinDistanceAwayForReactiveTaunt_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable_Default'
    begin object name=HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable=HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTauntLoopTimeD0'
    begin object name=MinTauntLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntLoopTime=MinTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTauntLoopTimeD0'
    begin object name=MaxTauntLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntLoopTime=MaxTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageAmountToCauseEndOfTauntD0'
    begin object name=DamageAmountToCauseEndOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageAmountToCauseEndOfTaunt=DamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=DurationOfStunAfterGettingGrenadeInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfStunAfterGettingGrenadeInMouth=DurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfStunAfterTakingToMuchDirrectDamageInMouth=DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToTryTauntAttackPofD0'
    begin object name=ChanceToTryTauntAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryTauntAttackPof=ChanceToTryTauntAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TauntPincerBashReachPofDistanceD0'
    begin object name=TauntPincerBashReachPofDistanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=900.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntPincerBashReachPofDistance=TauntPincerBashReachPofDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TauntPincerBashHorizAngRangeInDegreesD0'
    begin object name=TauntPincerBashHorizAngRangeInDegreesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntPincerBashHorizAngRangeInDegrees=TauntPincerBashHorizAngRangeInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTauntAttackLoopTimeD0'
    begin object name=MinTauntAttackLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntAttackLoopTime=MinTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTauntAttackLoopTimeD0'
    begin object name=MaxTauntAttackLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntAttackLoopTime=MaxTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TauntAttackDamageAmountToCauseEndOfTauntD0'
    begin object name=TauntAttackDamageAmountToCauseEndOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDamageAmountToCauseEndOfTaunt=TauntAttackDamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDurationOfStunAfterGettingGrenadeInMouth=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfStumpBleedingAfterDismemberement_Tunable_Default'
    begin object name=DurationOfStumpBleedingAfterDismemberement_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfStumpBleedingAfterDismemberement_Tunable=DurationOfStumpBleedingAfterDismemberement_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.WaitTimeBetweenStumpBleedsAfterDismemberement_Tunable_Default'
    begin object name=WaitTimeBetweenStumpBleedsAfterDismemberement_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WaitTimeBetweenStumpBleedsAfterDismemberement_Tunable=WaitTimeBetweenStumpBleedsAfterDismemberement_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxUpdateDeltaToAllowDismemberedBleed_Tunable_Default'
    begin object name=MaxUpdateDeltaToAllowDismemberedBleed_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxUpdateDeltaToAllowDismemberedBleed_Tunable=MaxUpdateDeltaToAllowDismemberedBleed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable_Default'
    begin object name=MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable=MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BellyCoreSize_Tunable_Default'
    begin object name=BellyCoreSize_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BellyCoreSize_Tunable=BellyCoreSize_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BellyCoreRadius_Tunable_Default'
    begin object name=BellyCoreRadius_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BellyCoreRadius_Tunable=BellyCoreRadius_Tunable_Default
    BellyCoreSegments=10
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ClawAttackPlayerStumbleRadius_Tunable_Default'
    begin object name=ClawAttackPlayerStumbleRadius_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ClawAttackPlayerStumbleRadius_Tunable=ClawAttackPlayerStumbleRadius_Tunable_Default
    BoneAttachPointByCore=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.UberHitDamagePoFD0'
    begin object name=UberHitDamagePoFD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UberHitDamagePoF=UberHitDamagePoFD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.UberHitDamageVSD0'
    begin object name=UberHitDamageVSD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UberHitDamageVS=UberHitDamageVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TimeAfterVsReleaseStartsToKillSpMove_Tunable_Default'
    begin object name=TimeAfterVsReleaseStartsToKillSpMove_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeAfterVsReleaseStartsToKillSpMove_Tunable=TimeAfterVsReleaseStartsToKillSpMove_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ShakeRadius_Tunable_Default'
    begin object name=ShakeRadius_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ShakeRadius_Tunable=ShakeRadius_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TimeClawFreeze_Tunable_Default'
    begin object name=TimeClawFreeze_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeClawFreeze_Tunable=TimeClawFreeze_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDistToEnemiesForGroundPound_Default'
    begin object name=MaxDistToEnemiesForGroundPound_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistToEnemiesForGroundPound=MaxDistToEnemiesForGroundPound_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.GroundPoundHorizAngRangeInDegrees_Default'
    begin object name=GroundPoundHorizAngRangeInDegrees_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=80.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    GroundPoundHorizAngRangeInDegrees=GroundPoundHorizAngRangeInDegrees_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinEnemiesToGroundPound_Default'
    begin object name=MinEnemiesToGroundPound_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinEnemiesToGroundPound=MinEnemiesToGroundPound_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToGroundPound_Default'
    begin object name=ChanceToGroundPound_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToGroundPound=ChanceToGroundPound_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToGroundPoundWithNoClaws_Default'
    begin object name=ChanceToGroundPoundWithNoClaws_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToGroundPoundWithNoClaws=ChanceToGroundPoundWithNoClaws_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToTauntBeforeGroundPound_Default'
    begin object name=ChanceToTauntBeforeGroundPound_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.7500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTauntBeforeGroundPound=ChanceToTauntBeforeGroundPound_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinGroundPoundTauntTime_Default'
    begin object name=MinGroundPoundTauntTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.7500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinGroundPoundTauntTime=MinGroundPoundTauntTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxGroundPoundTauntTime_Default'
    begin object name=MaxGroundPoundTauntTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxGroundPoundTauntTime=MaxGroundPoundTauntTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenGroundPounds_Default'
    begin object name=MinTimeBetweenGroundPounds_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenGroundPounds=MinTimeBetweenGroundPounds_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenGroundPounds_Default'
    begin object name=MaxTimeBetweenGroundPounds_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenGroundPounds=MaxTimeBetweenGroundPounds_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.GroundPoundDamageAmount_Default'
    begin object name=GroundPoundDamageAmount_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    GroundPoundDamageAmount=GroundPoundDamageAmount_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDistToEnemiesForSwipeAttack_Default'
    begin object name=MaxDistToEnemiesForSwipeAttack_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=600.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistToEnemiesForSwipeAttack=MaxDistToEnemiesForSwipeAttack_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SwipeAttackHorizAngRangeInDegrees_Default'
    begin object name=SwipeAttackHorizAngRangeInDegrees_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SwipeAttackHorizAngRangeInDegrees=SwipeAttackHorizAngRangeInDegrees_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinEnemiesToSwipeAttack_Default'
    begin object name=MinEnemiesToSwipeAttack_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinEnemiesToSwipeAttack=MinEnemiesToSwipeAttack_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeBetweenSwipeAttacks_Default'
    begin object name=MinTimeBetweenSwipeAttacks_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenSwipeAttacks=MinTimeBetweenSwipeAttacks_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeBetweenSwipeAttacks_Default'
    begin object name=MaxTimeBetweenSwipeAttacks_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenSwipeAttacks=MaxTimeBetweenSwipeAttacks_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceToSwipeAttack_Default'
    begin object name=ChanceToSwipeAttack_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToSwipeAttack=ChanceToSwipeAttack_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTauntAfterSwipeLoopTime_Default'
    begin object name=MinTauntAfterSwipeLoopTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.8000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntAfterSwipeLoopTime=MinTauntAfterSwipeLoopTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTauntAfterSwipeLoopTime_Default'
    begin object name=MaxTauntAfterSwipeLoopTime_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntAfterSwipeLoopTime=MaxTauntAfterSwipeLoopTime_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ChanceOfTauntAfterSwipe_Default'
    begin object name=ChanceOfTauntAfterSwipe_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceOfTauntAfterSwipe=ChanceOfTauntAfterSwipe_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    DelayBetweenMovementHits=0.5000000
    MovementAdditionPushFactor=3.3000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    MaxSeperationForDirectPhysicalStrike=400.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    RadarParams=(IconType=EMapIconTypes.EMapIcon_Crab,bIconStaysOnEdge=true)
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    StrengthExplodeAfterFreeze=150.0000000
    SizeFractureMeshPartTooBig=41000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TEnergyCountObj'
    begin object name=TEnergyCountObj
        baseValue=3.0000000
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
        baseValue=20.0000000
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
        baseValue=30.0000000
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    TEnergyScale=1.7500000
    TEnergySpread=200.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=(ConformType=EFloorConformType.EFCT_CornerSamples)
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataIceCrab.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}