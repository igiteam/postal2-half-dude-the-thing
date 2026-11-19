class LPTuneDataVsLaroche extends LPTuneDataMech
    dontsortcategories(StopingLocomotion,Melee,ChargeAttack,MovementHit,ClawPush,Taunt,RamAttack)
    hidecategories(Object,Object,Multiplayer,GrenadeAssist,AttackInteruption,PlayerSprint,View,Ragdoll,GrenadeExplosionInternal,Object,MortarAttack,BurstFireRangedAttack);

struct ComboInfo
{
    var(0.25_Pct) /*0x25D60000-0x00000000*/ private editfixedsize array Strikes[65537];
    var(0.25_Pct) /*0x25D60000-0x00000000*/ private editfixedsize array ShouldStrikeKnockVSPlayerOutOfBlock[65537];

    structdefaultproperties
    {
        Strikes=none
        ShouldStrikeKnockVSPlayerOutOfBlock=none
    }
};

var(0.25_Pct) /*0x2B350000-0x00000000*/ private editfixedsize array VSMeleeDamageRequiredToStunMultiplierSequence[65537];
var(0.25_Pct) /*0x2B350000-0x00000000*/ private int NumActiveDefensesWithNoStunBeforeTutorialHitMe[65537];
var(0.25_Pct) /*0x2B350000-0x00000000*/ private int NumActiveDefensesWithNoStunBeforeEnableMyAD[65537];
var(0.25_Pct) /*0x271D0000-0x00000000*/ private bool bPlayerAllowedToDestroySawGenCoreWhenLaRocheStunned[65537];
var(0.25_Pct) /*0xC9470000-0x00000000*/ private bool bFocusOnEnemyDuringTaunt[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bLeftClavLightTurnOnBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bLeftClavLightTurnOffBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bRightClavLightTurnOnBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bRightClavLightTurnOffBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bRightShieldLightTurnOnBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bLeftShieldLightTurnOnBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private bool bTaserGenLightTurnOnBasedOnAnimNotifyNotCoreHealth[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceGrabsOnlyNoFreeAttacks[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceNotAllowedToGrabOnlyFreeAttacks[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bAllowNonCoreDamageForDebug[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float BlockAngularCoverage[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float ActiveDefenseMaximumDistance[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float BlockProjectileMinimumDistance[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float ShieldBlockProjectileMinimumDistance[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float ShieldBlockBlendInTime[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float ShieldBlockBlendOutTime[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float MinShieldBlockTime[65537];
var(0.25_Pct) /*0x01E10000-0x00000000*/ private float ShieldBlockBlendWeightForDamageReduction[65537];
var(0.25_Pct) /*0x01E10000-0x00000400*/ private editfixedsize @NULL ShieldBlockDamageMultiplier[589825];
var(0.25_Pct) /*0x01E10000-0x00000400*/ private editfixedsize @NULL DeadZoneForCombatWindowInputChoice[589825];
var(0.25_Pct) /*0x2B550000-0x00000400*/ private editfixedsize array BoneNamesToHideOnSpawn[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL UpdateRateForLoiterPocessLookForAttackOpportunityTimer[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhileLoitering[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL AmountDamageOverIntervalToGoFromPassiveToAgitated[589825];
var(0.25_Pct) /*0x508F0000-0x00000400*/ private editfixedsize @NULL EmpPulseFireLaunchVelocityMin[589825];
var(0.25_Pct) /*0x508F0000-0x00000400*/ private editfixedsize @NULL EmpPulseFireLaunchVelocityMax[589825];
var(0.25_Pct) /*0x508F0000-0x00000000*/ private float HieghtOffTargetPointForEmpPulseFire[65537];
var(0.25_Pct) /*0x508F0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayFromTargetToAllowEmpPulseFireStrike[589825];
var(0.25_Pct) /*0x508F0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartEmpPulseProjLaunchStrikeVs[589825];
var(0.25_Pct) /*0x508F0000-0x00000400*/ private editfixedsize @NULL PlayersVsStunDurationOnHit[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private byte StartOfFightLaRocheStruggleModeAttempting[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private byte ForceThisLaRocheBossFightMacroCombatState[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private byte ForceThisLaRocheBossFightStruggleMode[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private byte ForceThisLaRocheStrikeType[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000400*/ private editfixedsize @NULL SawCentricLaRocheCombatPhaseStatInfo[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000400*/ private editfixedsize @NULL SawNoTaserLaRocheCombatPhaseStatInfo[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000400*/ private editfixedsize @NULL TaserCentricLaRocheCombatPhaseStatInfo[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000400*/ private editfixedsize @NULL BackupSawLaRocheCombatPhaseStatInfo[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000400*/ private editfixedsize @NULL HipsLaRocheCombatPhaseStatInfo[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000400*/ private editfixedsize @NULL BerserkLaRocheCombatPhaseStatInfo[589825];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL Combo1StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL Combo2StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL Combo3StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL SawSideCombo1StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL SawSideCombo2StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL SawSideCombo3StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL TaserSideCombo1StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL TaserSideCombo2StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL TaserSideCombo3StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL HulkSmashCombo1StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL HulkSmashCombo2StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private editfixedsize @NULL HulkSmashCombo3StrikeInfo[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private float MinAngleNeededForTurnToFaceCommandDuringWaitBetweenStrikes[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private float MaxDurationOfSeperationOpportunityAfterStrikes[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private float MinSeperationToBeAwayAfterStrikes[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private float MinSeperationAfterStrikesToTriggerMoveAway[65537];
var(0.25_Pct) /*0x0BAE0000-0x00000000*/ private float PlayRateForSeperationAfterStrikesAnimation[65537];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDurationOfDamageAssessmentWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopDirectAttack[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenBerserkAttack[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenBerserkAttack[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxDurationOfDamageAssessmentWhenBerserkAttack[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopBerserkAttack[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopBerserkAttack[589825];
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL MaxDistanceToNotAvoidVsDuringNormalMovement[589825];
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL AngleToSideStepVsDuringNormalMovement[589825];
var(0.25_Pct) /*0x94570000-0x00000000*/ private editfixedsize @NULL BaseTurnInPlaceTransitionData[65537];
var(0.25_Pct) /*0x94570000-0x00000000*/ private editfixedsize @NULL LimpingTurnInPlaceTransitionData[65537];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL BerserkStateMaxSpeedScale[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL RunningInForTauntAttackMaxSpeedScale[589825];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float ForkArmGrabRange2D[65537];
var(0.25_Pct) /*0x59760000-0x00000000*/ private float ForkArmGrabRangeZ[65537];
var(0.25_Pct) /*0x59780000-0x00000400*/ private editfixedsize @NULL ForkArmGrabMaxHydraulicPressure[589825];
var(0.25_Pct) /*0x59780000-0x00000400*/ private editfixedsize @NULL ForkArmWeakGrabHydraulicPressure[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameModerateDamageHalfAngle[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameModerateDamage[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameFullDamageHalfAngle[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameFullDamage[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000400*/ private editfixedsize @NULL MiniGameMissDamage[589825];
var(0.25_Pct) /*0x2AFD0000-0x00000000*/ private float MiniGameSoundBlendTime[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRange[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRangeExtension[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRetractVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchRetractDelay[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchLaunchVelocity[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchPointSearchRange[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private float WinchBlendAmount[65537];
var(0.25_Pct) /*0x61750000-0x00000400*/ private editfixedsize @NULL DurationOfWinchedStun[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForRaiseIntoTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForLoweringOutOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForStrikingOutOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForTakingGrenInTheMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForReactingToExplosionInTheMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayForReactiveTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinTauntLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTauntLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DamageAmountToCauseEndOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL ChanceToTryTauntAttackPof[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinTauntAttackLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTauntAttackLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDamageAmountToCauseEndOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDurationOfStunAfterGettingGrenadeInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSrightSawingStrikePof[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSrightSawingStrikeVs[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSrightSawingStrikeFvs[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL MaxStrightSawingTimePerStrikePof[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL MaxStrightSawingTimePerStrikeVs[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL MaxStrightSawingTimePerStrikeFvs[589825];
var(0.25_Pct) /*0xC6820000-0x00000400*/ private editfixedsize @NULL TimeDeltaBetweenNewSawCutEvents[589825];
var(0.25_Pct) /*0xC6820000-0x00000000*/ private float SawBladesSpinRateInUUsPerSecond[65537];
var(0.25_Pct) /*0xC6820000-0x00000000*/ private float SawBladesSpinRateWithBackUpGenInUUsPerSecond[65537];
var(0.25_Pct) /*0xC6820000-0x00000000*/ private float NewSawSoundIntensityUnderBackUpGen[65537];
var(0.25_Pct) /*0xAF2F0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSawArmSwingsPof[589825];
var(0.25_Pct) /*0xAF2F0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSawArmSwingsVs[589825];
var(0.25_Pct) /*0xAF2F0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSawArmSwingsFvs[589825];
var(0.25_Pct) /*0xAF2F0000-0x00000400*/ private editfixedsize @NULL MaxSawArmSwingTimePerStrikePof[589825];
var(0.25_Pct) /*0xAF2F0000-0x00000400*/ private editfixedsize @NULL MaxSawArmSwingTimePerStrikeVs[589825];
var(0.25_Pct) /*0xAF2F0000-0x00000400*/ private editfixedsize @NULL MaxSawArmSwingTimePerStrikeFvs[589825];
var(0.25_Pct) /*0x706D0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartJabStrikePof[589825];
var(0.25_Pct) /*0x706D0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartJabStrikeVs[589825];
var(0.25_Pct) /*0x706D0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartJabStrikeFvs[589825];
var(0.25_Pct) /*0x706D0000-0x00000400*/ private editfixedsize @NULL MaxJabTimePerStrikePof[589825];
var(0.25_Pct) /*0x706D0000-0x00000400*/ private editfixedsize @NULL MaxJabTimePerStrikeVs[589825];
var(0.25_Pct) /*0x706D0000-0x00000400*/ private editfixedsize @NULL MaxJabTimePerStrikeFvs[589825];
var(0.25_Pct) /*0x678C0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartHookStrikePof[589825];
var(0.25_Pct) /*0x678C0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartHookStrikeVs[589825];
var(0.25_Pct) /*0x678C0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartHookStrikeFvs[589825];
var(0.25_Pct) /*0x678C0000-0x00000400*/ private editfixedsize @NULL MaxHookTimePerStrikePof[589825];
var(0.25_Pct) /*0x678C0000-0x00000400*/ private editfixedsize @NULL MaxHookTimePerStrikeVs[589825];
var(0.25_Pct) /*0x678C0000-0x00000400*/ private editfixedsize @NULL MaxHookTimePerStrikeFvs[589825];
var(0.25_Pct) /*0xC75A0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSuperSawStrikePof[589825];
var(0.25_Pct) /*0xC75A0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSuperSawStrikeVs[589825];
var(0.25_Pct) /*0xC75A0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSuperSawStrikeFvs[589825];
var(0.25_Pct) /*0xC75A0000-0x00000400*/ private editfixedsize @NULL MaxSuperSawStrikeTimePerStrikePof[589825];
var(0.25_Pct) /*0xC75A0000-0x00000400*/ private editfixedsize @NULL MaxSuperSawStrikeTimePerStrikeVs[589825];
var(0.25_Pct) /*0xC75A0000-0x00000400*/ private editfixedsize @NULL MaxSuperSawStrikeTimePerStrikeFvs[589825];
var(0.25_Pct) /*0xC7610000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSuperTaserStrikePof[589825];
var(0.25_Pct) /*0xC7610000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSuperTaserStrikeVs[589825];
var(0.25_Pct) /*0xC7610000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartSuperTaserStrikeFvs[589825];
var(0.25_Pct) /*0xC7610000-0x00000400*/ private editfixedsize @NULL MaxSuperTaserStrikeTimePerStrikePof[589825];
var(0.25_Pct) /*0xC7610000-0x00000400*/ private editfixedsize @NULL MaxSuperTaserStrikeTimePerStrikeVs[589825];
var(0.25_Pct) /*0xC7610000-0x00000400*/ private editfixedsize @NULL MaxSuperTaserStrikeTimePerStrikeFvs[589825];
var(0.25_Pct) /*0x682D0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartHulkSmashStrikePof[589825];
var(0.25_Pct) /*0x682D0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartHulkSmashStrikeVs[589825];
var(0.25_Pct) /*0x682D0000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartHulkSmashStrikeFvs[589825];
var(0.25_Pct) /*0x682D0000-0x00000400*/ private editfixedsize @NULL MaxHulkSmashStrikeTimePerStrikePof[589825];
var(0.25_Pct) /*0x682D0000-0x00000400*/ private editfixedsize @NULL MaxHulkSmashStrikeTimePerStrikeVs[589825];
var(0.25_Pct) /*0x682D0000-0x00000400*/ private editfixedsize @NULL MaxHulkSmashStrikeTimePerStrikeFvs[589825];
var(0.25_Pct) /*0x0B930000-0x00000400*/ private editfixedsize @NULL MaxTimeForBaseGrabbing[589825];
var(0.25_Pct) /*0x0B930000-0x00000400*/ private editfixedsize @NULL DistanceToMoveToToStartGrabingUR[589825];
var(0.25_Pct) /*0x62E20000-0x00000400*/ private editfixedsize @NULL MaxGrabingUrRightArmTime[589825];
var(0.25_Pct) /*0xAF3E0000-0x00000400*/ private editfixedsize @NULL DelayBetweenDamageEventsWhenSawingTheCockpit[589825];
var(0.25_Pct) /*0xAF3E0000-0x00000000*/ private name NameOfSocketToStartTraceForSawingTheCockputDamageAt[65537];
var(0.25_Pct) /*0xAF3E0000-0x00000000*/ private name NameOfSocketToEndTraceForSawingTheCockputDamageAt[65537];
var(0.25_Pct) /*0xAF3E0000-0x00000400*/ private editfixedsize @NULL AmountOfDamagePerSawingTheCockpitEvent[589825];
var(0.25_Pct) /*0xAF3E0000-0x00000000*/ private class TypeOfDamageToApplyWhenSawingTheCockpit[65537];
var(0.25_Pct) /*0xAF3E0000-0x00000000*/ private class OnSawingTheCockpitCameraEffect[65537];
var(0.25_Pct) /*0xAF3E0000-0x00000400*/ private editfixedsize @NULL SucessPctgToStopDamagingWhenSawingTheCockpit[589825];
var(0.25_Pct) /*0xAF3E0000-0x00000400*/ private editfixedsize @NULL SucessPctgToStartDamagingWhenSawingTheCockpit[589825];
var(0.25_Pct) /*0xAF3E0000-0x00000400*/ private editfixedsize @NULL LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpit[589825];
var(0.25_Pct) /*0x50A10000-0x00000000*/ private name NameOfSocketToStartTraceForEmpStruggleModeEndingDamageAt[65537];
var(0.25_Pct) /*0x50A10000-0x00000000*/ private name NameOfSocketToEndTraceForEmpStruggleModeEndingDamageAt[65537];
var(0.25_Pct) /*0x50A10000-0x00000400*/ private editfixedsize @NULL AmountOfDamageForEmpStruggleModeEndingEvent[589825];
var(0.25_Pct) /*0x50A10000-0x00000000*/ private class TypeOfDamageToApplyForEmpStruggleModeEnding[65537];
var(0.25_Pct) /*0x50A10000-0x00000000*/ private class EmpStruggleModeEndingCameraEffect[65537];
var(0.25_Pct) /*0x50A10000-0x00000400*/ private editfixedsize @NULL LowestPctgAllowedToTakeEnemiesHealthAtEmpStruggleModeEnding[589825];
var(0.25_Pct) /*0xC9450000-0x00000000*/ private name NameOfSocketToStartTraceForTaserStruggleModeEndingDamageAt[65537];
var(0.25_Pct) /*0xC9450000-0x00000000*/ private name NameOfSocketToEndTraceForTaserStruggleModeEndingDamageAt[65537];
var(0.25_Pct) /*0xC9450000-0x00000400*/ private editfixedsize @NULL AmountOfDamageForTaserStruggleModeEndingEvent[589825];
var(0.25_Pct) /*0xC9450000-0x00000000*/ private class TypeOfDamageToApplyForTaserStruggleModeEnding[65537];
var(0.25_Pct) /*0xC9450000-0x00000000*/ private class TaserStruggleModeEndingCameraEffect[65537];
var(0.25_Pct) /*0xC9450000-0x00000400*/ private editfixedsize @NULL LowestPctgAllowedToTakeEnemiesHealthAtTaserStruggleModeEnding[589825];
var(0.25_Pct) /*0x0BB20000-0x00000400*/ private editfixedsize @NULL MinNumberOfMeleeStrikesRequredBetweenEMP_X_CrackLeftShieldStruggles[589825];
var(0.25_Pct) /*0x0BB20000-0x00000400*/ private editfixedsize @NULL MinNumberOfMeleeStrikesRequredBetweenTASER_X_KillCommStruggles[589825];
var(0.25_Pct) /*0x0BB20000-0x00000400*/ private editfixedsize @NULL MinNumberOfMeleeStrikesRequredBetweenKnockout_X_KillGenStruggles[589825];
var(0.25_Pct) /*0x0BB20000-0x00000400*/ private editfixedsize @NULL MinNumberOfMeleeStrikesRequredBetweenKillDrill_X_MoveKillStruggles[589825];
var(0.25_Pct) /*0x0BB20000-0x00000400*/ private editfixedsize @NULL MinNumberOfMeleeStrikesRequredBetweenKillRig_X_KillRigStruggles[589825];
var(0.25_Pct) /*0x040B0000-0x00000000*/ private name AimStartTraceSocketName[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL StartDefaultRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToSawCentricRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToSawNoTaserRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToTaserCentricRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToBackupSawRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToHipsRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToBerserkRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToFullStunRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL RecoveryFromFullStunRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToTaseredFullStunRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL RecoveryFromTaseredFullStunRigLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToRightShoulderShieldStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToSawGenStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToLeftShoulderShieldStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToCommUnitStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToHipsShieldStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToHipsStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToRippingOpenCockStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private @NULL ChangeToKoStruggleLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private float ChangeToKoStruggleLeftClavLightValues[65537];
var(0.25_Pct) /*0x25BD0000-0x00000000*/ private float LeftClavLightFactorWhenOn[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToSawGenDestroyedAndTaserStartUp[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForSawGenDestroyedAndTaserStartUp[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToSawGenDestroyedAndEnergyShield[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForSawGenDestroyedAndEnergyShield[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToTaserGenDestroyedAndEnergyShield[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForTaserGenDestroyedAndEnergyShield[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToJustTaserGenDestroyed[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForJustTaserGenDestroyed[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToHipDestroyedAndStartBackUpSawGen[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForHipDestroyedAndStartBackUpSawGen[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToShowOffSawDialog[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForShowOffSawDialog[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffToStartUpBackSawGenDialog[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForStartUpBackSawGenDialog[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffForThirdMajorComponentDestroyedNotSoSnarkyCommentDialog[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForThirdMajorComponentDestroyedNotSoSnarkyCommentDialog[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MaxTimeInBackoffForWaitAfterTaseringJim[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float MinDistanceToBeAwayForWaitAfterTaseringJim[65537];
var(0.25_Pct) /*0x0A620000-0x00000000*/ private float DelayAfterDialogCleanUpBeforeEndingCommandForWaitAfterTaseringJim[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MinTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MaxTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MinTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MaxTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MinTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MaxTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MinTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MaxTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MinTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private float MaxTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private int NumOfCoresToDestoryBeforePlayingRumageSellDialogMessageFromGale[65537];
var(0.25_Pct) /*0x72610000-0x00000000*/ private editfixedsize array LaRocheBossFightPhaseEventPriorities[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldMaxAllowedRandomMovementDeltaX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldMaxAllowedRandomMovementDeltaY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldMaxAllowedRandomMovementDeltaZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMaxMovementDeltaPerSecX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMinMovementDeltaPerSecX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMaxMovementDeltaPerSecY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMinMovementDeltaPerSecY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMaxMovementDeltaPerSecZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMinMovementDeltaPerSecZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MinTimeInSecBetweenChangesInEngeryShieldDriftX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MaxTimeInSecBetweenChangesInEngeryShieldDriftX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MinTimeInSecBetweenChangesInEngeryShieldDriftY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MaxTimeInSecBetweenChangesInEngeryShieldDriftY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MinTimeInSecBetweenChangesInEngeryShieldDriftZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MaxTimeInSecBetweenChangesInEngeryShieldDriftZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float TimeForNextChangeInEngeryShieldDriftX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float TimeForNextChangeInEngeryShieldDriftY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float TimeForNextChangeInEngeryShieldDriftZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private @NULL EnergyShieldOffsetForLeftSideGrabbed[65537];
var(0.25_Pct) /*0x03C30000-0x00000400*/ private editfixedsize array PhysMatsForDebugByCoreId[589825];

defaultproperties
{
    NumActiveDefensesWithNoStunBeforeTutorialHitMe=3
    NumActiveDefensesWithNoStunBeforeEnableMyAD=4
    bFocusOnEnemyDuringTaunt=true
    bLeftClavLightTurnOnBasedOnAnimNotifyNotCoreHealth=true
    bLeftClavLightTurnOffBasedOnAnimNotifyNotCoreHealth=true
    bRightClavLightTurnOnBasedOnAnimNotifyNotCoreHealth=true
    bRightClavLightTurnOffBasedOnAnimNotifyNotCoreHealth=true
    bRightShieldLightTurnOnBasedOnAnimNotifyNotCoreHealth=true
    bLeftShieldLightTurnOnBasedOnAnimNotifyNotCoreHealth=true
    bTaserGenLightTurnOnBasedOnAnimNotifyNotCoreHealth=true
    BlockAngularCoverage=120.0000000
    ActiveDefenseMaximumDistance=1500.0000000
    BlockProjectileMinimumDistance=2000.0000000
    ShieldBlockBlendInTime=0.2500000
    ShieldBlockBlendOutTime=0.5000000
    MinShieldBlockTime=0.3500000
    ShieldBlockBlendWeightForDamageReduction=0.7000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ShieldBlockDamageMultiplierA'
    begin object name=ShieldBlockDamageMultiplierA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ShieldBlockDamageMultiplier=ShieldBlockDamageMultiplierA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DeadZoneForCombatWindowInputChoiceD0'
    begin object name=DeadZoneForCombatWindowInputChoiceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DeadZoneForCombatWindowInputChoice=DeadZoneForCombatWindowInputChoiceD0
    BoneNamesToHideOnSpawn=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0'
    begin object name=UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UpdateRateForLoiterPocessLookForAttackOpportunityTimer=UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSeperationToDoReactivePhysicalAttackWhileLoiteringD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileLoiteringD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileLoitering=MaxSeperationToDoReactivePhysicalAttackWhileLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0'
    begin object name=TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated=TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AmountDamageOverIntervalToGoFromPassiveToAgitatedD0'
    begin object name=AmountDamageOverIntervalToGoFromPassiveToAgitatedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountDamageOverIntervalToGoFromPassiveToAgitated=AmountDamageOverIntervalToGoFromPassiveToAgitatedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.EmpPulseFireLaunchVelocityMinD0'
    begin object name=EmpPulseFireLaunchVelocityMinD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EmpPulseFireLaunchVelocityMin=EmpPulseFireLaunchVelocityMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.EmpPulseFireLaunchVelocityMaxD0'
    begin object name=EmpPulseFireLaunchVelocityMaxD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EmpPulseFireLaunchVelocityMax=EmpPulseFireLaunchVelocityMaxD0
    HieghtOffTargetPointForEmpPulseFire=200.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDistanceAwayFromTargetToAllowEmpPulseFireStrikeD0'
    begin object name=MinDistanceAwayFromTargetToAllowEmpPulseFireStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayFromTargetToAllowEmpPulseFireStrike=MinDistanceAwayFromTargetToAllowEmpPulseFireStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartEmpPulseProjLaunchStrikeVsD0'
    begin object name=DistanceToMoveToToStartEmpPulseProjLaunchStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartEmpPulseProjLaunchStrikeVs=DistanceToMoveToToStartEmpPulseProjLaunchStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.PlayersVsStunDurationOnHitD0'
    begin object name=PlayersVsStunDurationOnHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PlayersVsStunDurationOnHit=PlayersVsStunDurationOnHitD0
    StartOfFightLaRocheStruggleModeAttempting=eLaRocheStruggleModeTypes.eLaRocheStruggleModeTypes_SawTheCock
    // Reference: LPLaRocheCombatPhaseStatTuneData'Default__LPTuneDataVsLaroche.SawCentricLaRocheCombatPhaseStatInfoD0'
    begin object name=SawCentricLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatTuneData'
    end object
    SawCentricLaRocheCombatPhaseStatInfo=SawCentricLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatTuneData'Default__LPTuneDataVsLaroche.SawNoTaserLaRocheCombatPhaseStatInfoD0'
    begin object name=SawNoTaserLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatTuneData'
    end object
    SawNoTaserLaRocheCombatPhaseStatInfo=SawNoTaserLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatTuneData'Default__LPTuneDataVsLaroche.TaserCentricLaRocheCombatPhaseStatInfoD0'
    begin object name=TaserCentricLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatTuneData'
    end object
    TaserCentricLaRocheCombatPhaseStatInfo=TaserCentricLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatTuneData'Default__LPTuneDataVsLaroche.BackupSawLaRocheCombatPhaseStatInfoD0'
    begin object name=BackupSawLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatTuneData'
    end object
    BackupSawLaRocheCombatPhaseStatInfo=BackupSawLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatTuneData'Default__LPTuneDataVsLaroche.HipsLaRocheCombatPhaseStatInfoD0'
    begin object name=HipsLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatTuneData'
    end object
    HipsLaRocheCombatPhaseStatInfo=HipsLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatTuneData'Default__LPTuneDataVsLaroche.BerserkLaRocheCombatPhaseStatInfoD0'
    begin object name=BerserkLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatTuneData'
    end object
    BerserkLaRocheCombatPhaseStatInfo=BerserkLaRocheCombatPhaseStatInfoD0
    Combo1StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    Combo2StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    Combo3StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    SawSideCombo1StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    SawSideCombo2StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    SawSideCombo3StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    TaserSideCombo1StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    TaserSideCombo2StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    TaserSideCombo3StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    HulkSmashCombo1StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    HulkSmashCombo2StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    HulkSmashCombo3StrikeInfo=(Strikes=/* Array type was not detected. */,ShouldStrikeKnockVSPlayerOutOfBlock=/* Array type was not detected. */)
    MinAngleNeededForTurnToFaceCommandDuringWaitBetweenStrikes=30.0000000
    MaxDurationOfSeperationOpportunityAfterStrikes=2.0000000
    MinSeperationToBeAwayAfterStrikes=10.0000000
    PlayRateForSeperationAfterStrikesAnimation=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttack=MinNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttack=MaxNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDurationOfDamageAssessmentWhenDirectAttackD0'
    begin object name=MaxDurationOfDamageAssessmentWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDurationOfDamageAssessmentWhenDirectAttack=MaxDurationOfDamageAssessmentWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinAmountOfDamageRequiredToStopDirectAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopDirectAttack=MinAmountOfDamageRequiredToStopDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxAmountOfDamageRequiredToStopDirectAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopDirectAttack=MaxAmountOfDamageRequiredToStopDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfStrikeAttemptsWhenBerserkAttackD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttack=MinNumberOfStrikeAttemptsWhenBerserkAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxNumberOfStrikeAttemptsWhenBerserkAttackD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttack=MaxNumberOfStrikeAttemptsWhenBerserkAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDurationOfDamageAssessmentWhenBerserkAttackD0'
    begin object name=MaxDurationOfDamageAssessmentWhenBerserkAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDurationOfDamageAssessmentWhenBerserkAttack=MaxDurationOfDamageAssessmentWhenBerserkAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinAmountOfDamageRequiredToStopBerserkAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopBerserkAttack=MinAmountOfDamageRequiredToStopBerserkAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxAmountOfDamageRequiredToStopBerserkAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttack=MaxAmountOfDamageRequiredToStopBerserkAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDistanceToNotAvoidVsDuringNormalMovement_Default'
    begin object name=MaxDistanceToNotAvoidVsDuringNormalMovement_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceToNotAvoidVsDuringNormalMovement=MaxDistanceToNotAvoidVsDuringNormalMovement_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AngleToSideStepVsDuringNormalMovement_Default'
    begin object name=AngleToSideStepVsDuringNormalMovement_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleToSideStepVsDuringNormalMovement=AngleToSideStepVsDuringNormalMovement_Default
    BaseTurnInPlaceTransitionData=(MinSpeed=0.0000000,MaxSpeed=1000.0000000,SpeedBucketSize=0.6600000,TransitionEntries=/* Array type was not detected. */)
    LimpingTurnInPlaceTransitionData=(MinSpeed=0.0000000,MaxSpeed=1000.0000000,SpeedBucketSize=0.6600000,TransitionEntries=/* Array type was not detected. */)
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BerserkStateMaxSpeedScaleD0'
    begin object name=BerserkStateMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BerserkStateMaxSpeedScale=BerserkStateMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.RunningInForTauntAttackMaxSpeedScaleD0'
    begin object name=RunningInForTauntAttackMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RunningInForTauntAttackMaxSpeedScale=RunningInForTauntAttackMaxSpeedScaleD0
    ForkArmGrabRange2D=1415.0000000
    ForkArmGrabRangeZ=800.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ForkArmGrabMaxHydraulicPressureA'
    begin object name=ForkArmGrabMaxHydraulicPressureA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForkArmGrabMaxHydraulicPressure=ForkArmGrabMaxHydraulicPressureA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ForkArmWeakGrabHydraulicPressureA'
    begin object name=ForkArmWeakGrabHydraulicPressureA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=12.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ForkArmWeakGrabHydraulicPressure=ForkArmWeakGrabHydraulicPressureA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MiniGameModerateDamageHalfAngleA'
    begin object name=MiniGameModerateDamageHalfAngleA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameModerateDamageHalfAngle=MiniGameModerateDamageHalfAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MiniGameModerateDamageA'
    begin object name=MiniGameModerateDamageA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.3300000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameModerateDamage=MiniGameModerateDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MiniGameFullDamageHalfAngleA'
    begin object name=MiniGameFullDamageHalfAngleA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameFullDamageHalfAngle=MiniGameFullDamageHalfAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MiniGameFullDamageA'
    begin object name=MiniGameFullDamageA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameFullDamage=MiniGameFullDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MiniGameMissDamageA'
    begin object name=MiniGameMissDamageA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MiniGameMissDamage=MiniGameMissDamageA
    MiniGameSoundBlendTime=0.1000000
    WinchRange=8000.0000000
    WinchRangeExtension=4000.0000000
    WinchVelocity=4000.0000000
    WinchRetractVelocity=5000.0000000
    WinchRetractDelay=2.0000000
    WinchLaunchVelocity=5000.0000000
    WinchPointSearchRange=8000.0000000
    WinchBlendAmount=0.6500000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DurationOfWinchedStunD0'
    begin object name=DurationOfWinchedStunD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfWinchedStun=DurationOfWinchedStunD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDistanceAwayForReactiveTaunt_Default'
    begin object name=MinDistanceAwayForReactiveTaunt_Default class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayForReactiveTaunt=MinDistanceAwayForReactiveTaunt_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinTauntLoopTimeD0'
    begin object name=MinTauntLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntLoopTime=MinTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTauntLoopTimeD0'
    begin object name=MaxTauntLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntLoopTime=MaxTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DamageAmountToCauseEndOfTauntD0'
    begin object name=DamageAmountToCauseEndOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageAmountToCauseEndOfTaunt=DamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ChanceToTryTauntAttackPofD0'
    begin object name=ChanceToTryTauntAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryTauntAttackPof=ChanceToTryTauntAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinTauntAttackLoopTimeD0'
    begin object name=MinTauntAttackLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntAttackLoopTime=MinTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTauntAttackLoopTimeD0'
    begin object name=MaxTauntAttackLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntAttackLoopTime=MaxTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TauntAttackDamageAmountToCauseEndOfTauntD0'
    begin object name=TauntAttackDamageAmountToCauseEndOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDamageAmountToCauseEndOfTaunt=TauntAttackDamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDurationOfStunAfterGettingGrenadeInMouth=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikePofD0'
    begin object name=DistanceToMoveToToStartSrightSawingStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSrightSawingStrikePof=DistanceToMoveToToStartSrightSawingStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeVsD0'
    begin object name=DistanceToMoveToToStartSrightSawingStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSrightSawingStrikeVs=DistanceToMoveToToStartSrightSawingStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeFvsD0'
    begin object name=DistanceToMoveToToStartSrightSawingStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSrightSawingStrikeFvs=DistanceToMoveToToStartSrightSawingStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxStrightSawingTimePerStrikePofD0'
    begin object name=MaxStrightSawingTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxStrightSawingTimePerStrikePof=MaxStrightSawingTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxStrightSawingTimePerStrikeVsD0'
    begin object name=MaxStrightSawingTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxStrightSawingTimePerStrikeVs=MaxStrightSawingTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxStrightSawingTimePerStrikeFvsD0'
    begin object name=MaxStrightSawingTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxStrightSawingTimePerStrikeFvs=MaxStrightSawingTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TimeDeltaBetweenNewSawCutEventsD0'
    begin object name=TimeDeltaBetweenNewSawCutEventsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeDeltaBetweenNewSawCutEvents=TimeDeltaBetweenNewSawCutEventsD0
    SawBladesSpinRateInUUsPerSecond=720.0000000
    SawBladesSpinRateWithBackUpGenInUUsPerSecond=360.0000000
    NewSawSoundIntensityUnderBackUpGen=0.4000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsPofD0'
    begin object name=DistanceToMoveToToStartSawArmSwingsPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSawArmSwingsPof=DistanceToMoveToToStartSawArmSwingsPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsVsD0'
    begin object name=DistanceToMoveToToStartSawArmSwingsVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSawArmSwingsVs=DistanceToMoveToToStartSawArmSwingsVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsFvsD0'
    begin object name=DistanceToMoveToToStartSawArmSwingsFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSawArmSwingsFvs=DistanceToMoveToToStartSawArmSwingsFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSawArmSwingTimePerStrikePofD0'
    begin object name=MaxSawArmSwingTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSawArmSwingTimePerStrikePof=MaxSawArmSwingTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSawArmSwingTimePerStrikeVsD0'
    begin object name=MaxSawArmSwingTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSawArmSwingTimePerStrikeVs=MaxSawArmSwingTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSawArmSwingTimePerStrikeFvsD0'
    begin object name=MaxSawArmSwingTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSawArmSwingTimePerStrikeFvs=MaxSawArmSwingTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartJabStrikePofD0'
    begin object name=DistanceToMoveToToStartJabStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartJabStrikePof=DistanceToMoveToToStartJabStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartJabStrikeVsD0'
    begin object name=DistanceToMoveToToStartJabStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartJabStrikeVs=DistanceToMoveToToStartJabStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartJabStrikeFvsD0'
    begin object name=DistanceToMoveToToStartJabStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartJabStrikeFvs=DistanceToMoveToToStartJabStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxJabTimePerStrikePofD0'
    begin object name=MaxJabTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxJabTimePerStrikePof=MaxJabTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxJabTimePerStrikeVsD0'
    begin object name=MaxJabTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxJabTimePerStrikeVs=MaxJabTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxJabTimePerStrikeFvsD0'
    begin object name=MaxJabTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxJabTimePerStrikeFvs=MaxJabTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartHookStrikePofD0'
    begin object name=DistanceToMoveToToStartHookStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartHookStrikePof=DistanceToMoveToToStartHookStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartHookStrikeVsD0'
    begin object name=DistanceToMoveToToStartHookStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartHookStrikeVs=DistanceToMoveToToStartHookStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartHookStrikeFvsD0'
    begin object name=DistanceToMoveToToStartHookStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartHookStrikeFvs=DistanceToMoveToToStartHookStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxHookTimePerStrikePofD0'
    begin object name=MaxHookTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHookTimePerStrikePof=MaxHookTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxHookTimePerStrikeVsD0'
    begin object name=MaxHookTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHookTimePerStrikeVs=MaxHookTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxHookTimePerStrikeFvsD0'
    begin object name=MaxHookTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHookTimePerStrikeFvs=MaxHookTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSuperSawStrikePofD0'
    begin object name=DistanceToMoveToToStartSuperSawStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSuperSawStrikePof=DistanceToMoveToToStartSuperSawStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSuperSawStrikeVsD0'
    begin object name=DistanceToMoveToToStartSuperSawStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSuperSawStrikeVs=DistanceToMoveToToStartSuperSawStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSuperSawStrikeFvsD0'
    begin object name=DistanceToMoveToToStartSuperSawStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSuperSawStrikeFvs=DistanceToMoveToToStartSuperSawStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuperSawStrikeTimePerStrikePofD0'
    begin object name=MaxSuperSawStrikeTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuperSawStrikeTimePerStrikePof=MaxSuperSawStrikeTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuperSawStrikeTimePerStrikeVsD0'
    begin object name=MaxSuperSawStrikeTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuperSawStrikeTimePerStrikeVs=MaxSuperSawStrikeTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuperSawStrikeTimePerStrikeFvsD0'
    begin object name=MaxSuperSawStrikeTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuperSawStrikeTimePerStrikeFvs=MaxSuperSawStrikeTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSuperTaserStrikePofD0'
    begin object name=DistanceToMoveToToStartSuperTaserStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSuperTaserStrikePof=DistanceToMoveToToStartSuperTaserStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSuperTaserStrikeVsD0'
    begin object name=DistanceToMoveToToStartSuperTaserStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSuperTaserStrikeVs=DistanceToMoveToToStartSuperTaserStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartSuperTaserStrikeFvsD0'
    begin object name=DistanceToMoveToToStartSuperTaserStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartSuperTaserStrikeFvs=DistanceToMoveToToStartSuperTaserStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuperTaserStrikeTimePerStrikePofD0'
    begin object name=MaxSuperTaserStrikeTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuperTaserStrikeTimePerStrikePof=MaxSuperTaserStrikeTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuperTaserStrikeTimePerStrikeVsD0'
    begin object name=MaxSuperTaserStrikeTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuperTaserStrikeTimePerStrikeVs=MaxSuperTaserStrikeTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuperTaserStrikeTimePerStrikeFvsD0'
    begin object name=MaxSuperTaserStrikeTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuperTaserStrikeTimePerStrikeFvs=MaxSuperTaserStrikeTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartHulkSmashStrikePofD0'
    begin object name=DistanceToMoveToToStartHulkSmashStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartHulkSmashStrikePof=DistanceToMoveToToStartHulkSmashStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartHulkSmashStrikeVsD0'
    begin object name=DistanceToMoveToToStartHulkSmashStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartHulkSmashStrikeVs=DistanceToMoveToToStartHulkSmashStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartHulkSmashStrikeFvsD0'
    begin object name=DistanceToMoveToToStartHulkSmashStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartHulkSmashStrikeFvs=DistanceToMoveToToStartHulkSmashStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxHulkSmashStrikeTimePerStrikePofD0'
    begin object name=MaxHulkSmashStrikeTimePerStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHulkSmashStrikeTimePerStrikePof=MaxHulkSmashStrikeTimePerStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxHulkSmashStrikeTimePerStrikeVsD0'
    begin object name=MaxHulkSmashStrikeTimePerStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHulkSmashStrikeTimePerStrikeVs=MaxHulkSmashStrikeTimePerStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxHulkSmashStrikeTimePerStrikeFvsD0'
    begin object name=MaxHulkSmashStrikeTimePerStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHulkSmashStrikeTimePerStrikeFvs=MaxHulkSmashStrikeTimePerStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTimeForBaseGrabbingD0'
    begin object name=MaxTimeForBaseGrabbingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForBaseGrabbing=MaxTimeForBaseGrabbingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceToMoveToToStartGrabingURD0'
    begin object name=DistanceToMoveToToStartGrabingURD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceToMoveToToStartGrabingUR=DistanceToMoveToToStartGrabingURD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxGrabingUrRightArmTimeD0'
    begin object name=MaxGrabingUrRightArmTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxGrabingUrRightArmTime=MaxGrabingUrRightArmTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DelayBetweenDamageEventsWhenSawingTheCockpitD0'
    begin object name=DelayBetweenDamageEventsWhenSawingTheCockpitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3300000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenDamageEventsWhenSawingTheCockpit=DelayBetweenDamageEventsWhenSawingTheCockpitD0
    NameOfSocketToStartTraceForSawingTheCockputDamageAt="StartTraceForSawingTheCockputDamage"
    NameOfSocketToEndTraceForSawingTheCockputDamageAt="EndTraceForSawingTheCockputDamage"
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AmountOfDamagePerSawingTheCockpitEventD0'
    begin object name=AmountOfDamagePerSawingTheCockpitEventD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountOfDamagePerSawingTheCockpitEvent=AmountOfDamagePerSawingTheCockpitEventD0
    TypeOfDamageToApplyWhenSawingTheCockpit=Class'LPDamageTypeVsLarocheSawingCockpitStruggle'
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SucessPctgToStopDamagingWhenSawingTheCockpitD0'
    begin object name=SucessPctgToStopDamagingWhenSawingTheCockpitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.4500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SucessPctgToStopDamagingWhenSawingTheCockpit=SucessPctgToStopDamagingWhenSawingTheCockpitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SucessPctgToStartDamagingWhenSawingTheCockpitD0'
    begin object name=SucessPctgToStartDamagingWhenSawingTheCockpitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SucessPctgToStartDamagingWhenSawingTheCockpit=SucessPctgToStartDamagingWhenSawingTheCockpitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpitD0'
    begin object name=LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpit=LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpitD0
    NameOfSocketToStartTraceForEmpStruggleModeEndingDamageAt="StartTraceForSawingTheCockputDamage"
    NameOfSocketToEndTraceForEmpStruggleModeEndingDamageAt="EndTraceForSawingTheCockputDamage"
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AmountOfDamageForEmpStruggleModeEndingEventD0'
    begin object name=AmountOfDamageForEmpStruggleModeEndingEventD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountOfDamageForEmpStruggleModeEndingEvent=AmountOfDamageForEmpStruggleModeEndingEventD0
    TypeOfDamageToApplyForEmpStruggleModeEnding=Class'LPDamageTypeVsLarocheEmpCockpitStruggle'
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.LowestPctgAllowedToTakeEnemiesHealthAtEmpStruggleModeEndingD0'
    begin object name=LowestPctgAllowedToTakeEnemiesHealthAtEmpStruggleModeEndingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    LowestPctgAllowedToTakeEnemiesHealthAtEmpStruggleModeEnding=LowestPctgAllowedToTakeEnemiesHealthAtEmpStruggleModeEndingD0
    NameOfSocketToStartTraceForTaserStruggleModeEndingDamageAt="StartTraceForSawingTheCockputDamage"
    NameOfSocketToEndTraceForTaserStruggleModeEndingDamageAt="EndTraceForSawingTheCockputDamage"
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AmountOfDamageForTaserStruggleModeEndingEventD0'
    begin object name=AmountOfDamageForTaserStruggleModeEndingEventD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountOfDamageForTaserStruggleModeEndingEvent=AmountOfDamageForTaserStruggleModeEndingEventD0
    TypeOfDamageToApplyForTaserStruggleModeEnding=Class'LPDamageTypeVsLarocheTaserCockpitStruggle'
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.LowestPctgAllowedToTakeEnemiesHealthAtTaserStruggleModeEndingD0'
    begin object name=LowestPctgAllowedToTakeEnemiesHealthAtTaserStruggleModeEndingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    LowestPctgAllowedToTakeEnemiesHealthAtTaserStruggleModeEnding=LowestPctgAllowedToTakeEnemiesHealthAtTaserStruggleModeEndingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfMeleeStrikesRequredBetweenEMP_X_CrackLeftShieldStrugglesD0'
    begin object name=MinNumberOfMeleeStrikesRequredBetweenEMP_X_CrackLeftShieldStrugglesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfMeleeStrikesRequredBetweenEMP_X_CrackLeftShieldStruggles=MinNumberOfMeleeStrikesRequredBetweenEMP_X_CrackLeftShieldStrugglesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfMeleeStrikesRequredBetweenTASER_X_KillCommStrugglesD0'
    begin object name=MinNumberOfMeleeStrikesRequredBetweenTASER_X_KillCommStrugglesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfMeleeStrikesRequredBetweenTASER_X_KillCommStruggles=MinNumberOfMeleeStrikesRequredBetweenTASER_X_KillCommStrugglesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfMeleeStrikesRequredBetweenKnockout_X_KillGenStrugglesD0'
    begin object name=MinNumberOfMeleeStrikesRequredBetweenKnockout_X_KillGenStrugglesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfMeleeStrikesRequredBetweenKnockout_X_KillGenStruggles=MinNumberOfMeleeStrikesRequredBetweenKnockout_X_KillGenStrugglesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfMeleeStrikesRequredBetweenKillDrill_X_MoveKillStrugglesD0'
    begin object name=MinNumberOfMeleeStrikesRequredBetweenKillDrill_X_MoveKillStrugglesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfMeleeStrikesRequredBetweenKillDrill_X_MoveKillStruggles=MinNumberOfMeleeStrikesRequredBetweenKillDrill_X_MoveKillStrugglesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfMeleeStrikesRequredBetweenKillRig_X_KillRigStrugglesD0'
    begin object name=MinNumberOfMeleeStrikesRequredBetweenKillRig_X_KillRigStrugglesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfMeleeStrikesRequredBetweenKillRig_X_KillRigStruggles=MinNumberOfMeleeStrikesRequredBetweenKillRig_X_KillRigStrugglesD0
    AimStartTraceSocketName="AimStartTrace"
    StartDefaultRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=10.0000000,RightShoulderJointLightFactor=10.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToSawCentricRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=5.0000000,RightShoulderJointLightFactor=10.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToSawNoTaserRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=10.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToTaserCentricRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=10.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToBackupSawRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=15.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToHipsRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=5.0000000,RightShoulderJointLightFactor=5.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToBerserkRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=100.0000000,RightShoulderJointLightFactor=100.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToFullStunRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    RecoveryFromFullStunRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToTaseredFullStunRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    RecoveryFromTaseredFullStunRigLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToRightShoulderShieldStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToSawGenStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToLeftShoulderShieldStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToCommUnitStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToHipsShieldStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToHipsStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToRippingOpenCockStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    ChangeToKoStruggleLightValues=(SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpFacePlateLightsFactor=-1.0000000,LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftShoulderJointLightFactor=-1.0000000,RightShoulderJointLightFactor=-1.0000000,LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000),EmpChargeStateFactor=-1.0000000,EmpLightFactor=-1.0000000)
    LeftClavLightFactorWhenOn=10.0000000
    MaxTimeInBackoffToSawGenDestroyedAndTaserStartUp=30.0000000
    MaxTimeInBackoffToSawGenDestroyedAndEnergyShield=30.0000000
    MaxTimeInBackoffToTaserGenDestroyedAndEnergyShield=30.0000000
    MaxTimeInBackoffToJustTaserGenDestroyed=25.0000000
    MaxTimeInBackoffToHipDestroyedAndStartBackUpSawGen=30.0000000
    MaxTimeInBackoffToShowOffSawDialog=30.0000000
    DelayAfterDialogCleanUpBeforeEndingCommandForShowOffSawDialog=7.0000000
    MaxTimeInBackoffToStartUpBackSawGenDialog=30.0000000
    MaxTimeInBackoffForThirdMajorComponentDestroyedNotSoSnarkyCommentDialog=10.0000000
    DelayAfterDialogCleanUpBeforeEndingCommandForThirdMajorComponentDestroyedNotSoSnarkyCommentDialog=5.0000000
    MaxTimeInBackoffForWaitAfterTaseringJim=10.0000000
    MinDistanceToBeAwayForWaitAfterTaseringJim=1000.0000000
    DelayAfterDialogCleanUpBeforeEndingCommandForWaitAfterTaseringJim=5.0000000
    MinTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent=10.0000000
    MaxTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent=20.0000000
    MinTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent=10.0000000
    MaxTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent=20.0000000
    MinTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent=10.0000000
    MaxTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent=20.0000000
    MinTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent=10.0000000
    MaxTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent=20.0000000
    MinTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent=10.0000000
    MaxTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent=20.0000000
    NumOfCoresToDestoryBeforePlayingRumageSellDialogMessageFromGale=15
    LaRocheBossFightPhaseEventPriorities=/* Array type was not detected. */
    EnergyShieldMaxAllowedRandomMovementDeltaX=30.0000000
    EnergyShieldMaxAllowedRandomMovementDeltaY=30.0000000
    EnergyShieldMaxAllowedRandomMovementDeltaZ=30.0000000
    EnergyShieldAllowedMaxMovementDeltaPerSecX=0.5000000
    EnergyShieldAllowedMinMovementDeltaPerSecX=0.5000000
    EnergyShieldAllowedMaxMovementDeltaPerSecY=0.5000000
    EnergyShieldAllowedMinMovementDeltaPerSecY=0.5000000
    EnergyShieldAllowedMaxMovementDeltaPerSecZ=0.5000000
    EnergyShieldAllowedMinMovementDeltaPerSecZ=0.5000000
    MinTimeInSecBetweenChangesInEngeryShieldDriftX=1.0000000
    MaxTimeInSecBetweenChangesInEngeryShieldDriftX=1.0000000
    MinTimeInSecBetweenChangesInEngeryShieldDriftY=1.0000000
    MaxTimeInSecBetweenChangesInEngeryShieldDriftY=1.0000000
    MinTimeInSecBetweenChangesInEngeryShieldDriftZ=1.0000000
    MaxTimeInSecBetweenChangesInEngeryShieldDriftZ=1.0000000
    EnergyShieldOffsetForLeftSideGrabbed=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    StationaryToMovingTransitionData[0]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    StationaryToMovingTransitionData[1]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    StationaryToMovingTransitionData[2]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToMovingTransitionData[0]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToMovingTransitionData[1]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToMovingTransitionData[2]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    TurnInPlaceTransitionData=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToStationaryTransitionData[0]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToStationaryTransitionData[1]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToStationaryTransitionData[2]=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVsLaroche.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}