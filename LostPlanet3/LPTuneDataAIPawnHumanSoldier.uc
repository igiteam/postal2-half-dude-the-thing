class LPTuneDataAIPawnHumanSoldier extends LPTuneDataAIPawnHuman
    dontsortcategories(StopingLocomotion)
    hidecategories(Object,Object,CoreData,ForkArm,MovemementHit,Winch,GrenadeAssist,AttackInterruption,SituationAwareness,AttacksArcs,Announce,WithdrawFromAttack,Leychttack,ContinuousAttack,StopingLocomotion,StruggleMode,Freeze,TEnergy,Melee,PlayerSprint,Jump,MovementAimDownSight,MovementAimGrenade,View,ForceFeedback,ContextSensitiveAnim,ActorStateComponent,DeathBloom,BurrowerCombatManager,BurstFireRangeAttack,GrenadeExplosionInternal,RangedLobStrike,ReactiveAttack,TempPlaceHolderWeakPoint,MortarAttack);

var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DistanceToGrenadeDangerous[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DotProductGoodCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DotProductOkCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DotProductBadCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float FactorDistanceToMeRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DistanceToMainEnemyInvalidCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DistanceTooCloseToMainEnemy[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DamagedNegativeRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DamagedNegativeRatingTime[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DamagedNegativeRatingSpreadDistance[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float SameCoverRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float SameCoverRatingTime[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float NoCoverActionRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float NoCoverActionRatingTime[65537];
var(0.25_Pct) /*0x03C80000-0x00000000*/ private float FlankingGuyFactorDistanceToMeRating[65537];
var(0.25_Pct) /*0x03C80000-0x00000000*/ private float FlankingGuyMaxTimeShootingFromTheSameCover[65537];
var(0.25_Pct) /*0x03C80000-0x00000000*/ private float FlankingGuyExtraTimeSameCoverWhenLittleDamage[65537];
var(0.25_Pct) /*0x03C80000-0x00000000*/ private float FlankingGuyMinPctgBetterToChangeWhenNoCoverAction[65537];
var(0.25_Pct) /*0x03C80000-0x00000000*/ private float FlankingGuyMinPctgBetterToChangeWhenTooLongSameCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private int DamageToReactMoving[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MaxTimeShootingFromTheSameCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private int MinDamageExtraTimeSameCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float ExtraTimeSameCoverWhenLittleDamage[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MaxTimeNoCoverAction[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float TimeWaitEnemyChooseCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float TimeWaitForAllySuppressionFire[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MinPctgPeopleInCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float KeepDistanceFromEnemy[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MinPctgBetterToChangeWhenNoCoverAction[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MinPctgBetterToChangeWhenTooLongSameCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private int NoCoverActionDamageToReactMoving[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float NoCoverActionTimeReactWhenDamaged[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float DelayEnterCoverAndStartShooting[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private int DamageToStopShootingInCover[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float DamageReactShootingBack[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float MinDistanceLeechAround[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float MinTimeNoFiringWhenLeechAround[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float DegreesOutOfViewStartShooting[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float MinTimeSomeoneShootThePlayer[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MaxTimeChangePosition[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float DamageChangePosition[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float DamageShootingBack[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MinTimeAttackFromOpen[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float DistanceDoStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MeleeMinPlayerDistance[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MeleeTimeOut[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MinTimeBetweenMelees[65537];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_TimeBetweenAttacksMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_TimeBetweenAttacksMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_MaxCircling[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_Circling_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_MaxInStaticFormation[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_StaticFormation_MinRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_StaticFormation_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_StaticFormation_MaxRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_TimeInPaternBeforeFirstAttackMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL PackHunter_TimeInPaternBeforeFirstAttackMax[589825];
var(0.25_Pct) /*0x9FCC0000-0x00000000*/ private float HowOfftenToUpdateThePackHunterStaticFormationAttackManager[65537];
var(0.25_Pct) /*0x9FCC0000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInThePackHunterStaticFormationAttackManager[65537];
var(0.25_Pct) /*0x9F990000-0x00000400*/ private editfixedsize array PackHunterStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x9F990000-0x00000400*/ private editfixedsize array PackHunterAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_MaxAttackers[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_Melee_Circle_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenWithdrawAndChargeMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenWithdrawAndChargeMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenTauntAttackMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL IceCrab_TimeBetweenTauntAttackMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_MaxAttackers[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_MaxAttackAttempters[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_Melee_Circle_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_TimeBetweenStrugglesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_TimeBetweenStrugglesMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_TimeToTrackStrikesOver[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Leech_MaxNumberOfStrikesOverTrackedTime[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Burrower_MaxAttackers[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Burrower_Melee_Circle_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Burrower_TimeToTrackStrikesOver[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Burrower_MaxNumberOfStrikesOverTrackedTime[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Burrower_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Burrower_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x19820000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenBurrowerAttacks[589825];
var(0.25_Pct) /*0x19820000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenBurrowerAttacks[589825];
var(0.25_Pct) /*0x19820000-0x00000000*/ private float HowOfftenToUpdateTheBurrowerCombatManager[65537];
var(0.25_Pct) /*0x19820000-0x00000000*/ private float HowOfftenToRemoveOutOfDateAttackOptionsInTheBurrowerCombatManager[65537];
var(0.25_Pct) /*0x19820000-0x00000400*/ private editfixedsize array BurrowerStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_MaxAttackers[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_Melee_Circle_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x8FCE0000-0x00000400*/ private editfixedsize @NULL MedFlyer_FormationInfo[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_MaxInFormation[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_Formation_MinRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_Formation_IdealRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_Formation_MaxRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenWithdrawAndChargeMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenWithdrawAndChargeMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL HumanSoldier_MaxAttackers[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL HumanSoldier_Surround_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL HumanSoldier_MaxFireAttacker[589825];
var(0.25_Pct) /*0x57D80000-0x00000000*/ private float HowOfftenToUpdateTheFireWaspCombatManager[65537];
var(0.25_Pct) /*0x57D80000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheFireWaspCombatManager[65537];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize array FireWaspStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize array FireWaspAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize @NULL FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize @NULL FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x449D0000-0x00000400*/ private editfixedsize @NULL Defender_FormationInfo[589825];
var(0.25_Pct) /*0x9AB90000-0x00000400*/ private editfixedsize @NULL NushiSpore_FormationInfo[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_MaxInFormation[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_LoiterFormation_MinRadius[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_LoiterFormation_IdealRadius[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_LoiterFormation_MaxRadius[589825];
var(0.25_Pct) /*0x44AE0000-0x00000000*/ private float HowOfftenToUpdateTheDefenderRogueCombatManager[65537];
var(0.25_Pct) /*0x44AE0000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderRogueCombatManager[65537];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize array DefenderRogueStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize array DefenderRogueAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize @NULL DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize @NULL DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x9AA40000-0x00000000*/ private float HowOfftenToUpdateTheNushiSporeCombatManager[65537];
var(0.25_Pct) /*0x9AA40000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheNushiSporeCombatManager[65537];
var(0.25_Pct) /*0x9AA40000-0x00000400*/ private editfixedsize array NushiSporeStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x9AA40000-0x00000400*/ private editfixedsize array NushiSporeAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MP_PackHunter_MaxInStaticFormation[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MP_PackHunter_StaticFormation_Radius[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxAttackers[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxAttackAttempters[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_Melee_Circle_Radius[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_TimeToTrackStrikesOver[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxNumberOfStrikesOverTrackedTime[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_TimeToTrackLobStrikesOver[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxNumberOfLobStrikesOverTrackedTime[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MinNumToCausePanicRetreat[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxNumToCausePanicRetreat[589825];
var(0.25_Pct) /*0xB0EE0000-0x00000000*/ private float HowOfftenToUpdateTheSentinelCombatManager[65537];
var(0.25_Pct) /*0xB0EE0000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheSentinelCombatManager[65537];
var(0.25_Pct) /*0xB0EE0000-0x00000400*/ private editfixedsize array SentinelStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0xB0EE0000-0x00000400*/ private editfixedsize array SentinelAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x1CCD0000-0x00000000*/ private float HowOfftenToUpdateTheCarrierDefenderCombatManager[65537];
var(0.25_Pct) /*0x1CCD0000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheCarrierDefenderCombatManager[65537];
var(0.25_Pct) /*0x1CCD0000-0x00000400*/ private editfixedsize @NULL TimeBetweenDefenderElementLaunches[589825];
var(0.25_Pct) /*0x1CCD0000-0x00000400*/ private editfixedsize @NULL RandomRangeForDefenderElementLaunchTime[589825];
var(0.25_Pct) /*0x1CCD0000-0x00000400*/ private editfixedsize array CarrierDefenderStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x1CCD0000-0x00000400*/ private editfixedsize array CarrierDefenderAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0xD47F0000-0x00000400*/ private editfixedsize @NULL VsLaroche_MaxAttackers[589825];
var(0.25_Pct) /*0xD47F0000-0x00000400*/ private editfixedsize @NULL VsLaroche_Loiter_Circle_IdealRadius[589825];
var(0.25_Pct) /*0xD47F0000-0x00000400*/ private editfixedsize @NULL VsLaroche_Loiter_Circle_MaxRadius[589825];
var(0.25_Pct) /*0xD47F0000-0x00000400*/ private editfixedsize @NULL VsLaroche_Loiter_Circle_MinRadius[589825];
var(0.25_Pct) /*0xD47F0000-0x00000400*/ private editfixedsize @NULL VsLaroche_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0xD47F0000-0x00000400*/ private editfixedsize @NULL VsLaroche_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundGlobal[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundGrenadeWarning[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundMoveForward[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimePlayerNotSeen[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundPlayerSeen[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MaxTimeNoSoundTryAGeneric[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundGeneric1[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundGeneric2[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundHitByBullet[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundDeath[65537];
var(0.25_Pct) /*0x048D0000-0x00000000*/ private float MinTimeRepeatSoundGrenadeDeath[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ADSDistanceToTargetMin[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ADSDistanceToTargetMax[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ADSDistanceDontShootTarget[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ADSMaxTimeWhileMoving[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ADSDamageReactStopAiming[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float MinTimeDontShootAfterMelee[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ADSTimeSinceCover[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ShootCloserToCoverMidCover[65537];
var(0.25_Pct) /*0x03C70000-0x00000000*/ private float ShootCloserToCoverStandingCover[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float MinTimePeekBeforeFiring[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float MaxTimePeekBeforeFiring[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float MinTimePeekWhileWaiting[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float MaxTimePeekWhileWaiting[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float MinTimeBetweenPeeks[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float MaxTimeBetweenPeeks[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float ReactionTimeGettingShotWhilePeeking[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float ReactionTimePlayerExposedWhilePeeking[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float QuickPeekChance[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float QuickPeekMinTime[65537];
var(0.25_Pct) /*0x04490000-0x00000000*/ private float QuickPeekMaxTime[65537];
var(0.25_Pct) /*0x03CA0000-0x00000000*/ private float MinTimeBetweenGrenades[65537];
var(0.25_Pct) /*0x03CA0000-0x00000000*/ private float MinTimeSameCoverThrowGrenade[65537];
var(0.25_Pct) /*0x03CA0000-0x00000000*/ private float TimeHoldGrenadeBeforeThrowing[65537];
var(0.25_Pct) /*0x03CA0000-0x00000000*/ private float TimeCooldownAfterGrenadeThrow[65537];
var(0.25_Pct) /*0x03CA0000-0x00000000*/ private float TimeToExplodeRunAway[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissMinTimeBetween[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissDegreesOutOfView[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissExtraHeightInMiddleCover[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissExtraHeight[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSGrenadeWarning;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSJimKilled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSMoveForward;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSPlayerSeen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSGeneric1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSGeneric2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSHitByBullet;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSDeath;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHSSDeathGrenade;
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMinDistance[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMinDistanceMultiplier[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMaxDistance[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMaxDistanceMultiplier[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMinTimeNoCover[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMinTimeNoCoverMultiplier[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMaxTimeNoCover[65537];
var(0.25_Pct) /*0xA3A90000-0x00000000*/ private float PDMMaxTimeNoCoverMultiplier[65537];
var(0.25_Pct) /*0x1FF10000-0x00000000*/ private float ChargeMinTimeInCover[65537];
var(0.25_Pct) /*0x1FF10000-0x00000000*/ private float ChargeMinDegreesToLineOfFire[65537];
var(0.25_Pct) /*0x1FF10000-0x00000000*/ private float ChargeMaxTimePlayerNotFiring[65537];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private float ShotgunHealthMultiplier[65537];

simulated function GetDamageMultiplier()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609], EnemyPawn;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPlayerPawn;
    local /*0x97E50000-0x00000000*/ private float DamageMultiplier, TimeSinceCover, DistancePctg, TimePctg, DistanceToPawn;

    DamageMultiplier = super(LPTuneDataAIPawn).GetDamageMultiplier(ThePawn, EnemyPawn);
    EnemyPlayerPawn = LPPlayerPawn(EnemyPawn);
    // End:0x272
    if(EnemyPlayerPawn != none)
    {
        DistanceToPawn = VSize(EnemyPlayerPawn.Location - ThePawn.Location);
        // End:0xC9
        if(DistanceToPawn > PDMMaxDistance)
        {
            DamageMultiplier *= PDMMaxDistanceMultiplier;            
        }
        else
        {
            // End:0xF7
            if(DistanceToPawn < PDMMinDistance)
            {
                DamageMultiplier *= PDMMinDistanceMultiplier;                
            }
            else
            {
                DistancePctg = (DistanceToPawn - PDMMinDistance) / (PDMMaxDistance - PDMMinDistance);
                DamageMultiplier *= (PDMMinDistanceMultiplier + ((PDMMaxDistanceMultiplier - PDMMinDistanceMultiplier) * DistancePctg));
            }
        }
        TimeSinceCover = EnemyPlayerPawn.TimeSinceCover();
        // End:0x272
        if(!EnemyPlayerPawn.IsInCover())
        {
            // End:0x1DB
            if(TimeSinceCover > PDMMaxTimeNoCover)
            {
                DamageMultiplier *= PDMMaxTimeNoCoverMultiplier;                
            }
            else
            {
                // End:0x209
                if(TimeSinceCover < PDMMinTimeNoCover)
                {
                    DamageMultiplier *= PDMMinTimeNoCoverMultiplier;                    
                }
                else
                {
                    TimePctg = (TimeSinceCover - PDMMinTimeNoCover) / (PDMMaxTimeNoCover - PDMMinTimeNoCover);
                    DamageMultiplier *= (PDMMinTimeNoCoverMultiplier + ((PDMMaxTimeNoCoverMultiplier - PDMMinTimeNoCoverMultiplier) * TimePctg));
                }
            }
        }
    }
    return DamageMultiplier;
    //return ReturnValue;    
}

final function GetQuickPeekTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(QuickPeekMinTime, QuickPeekMaxTime);
    //return ReturnValue;    
}

final function ShouldQuickPeek()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(RandRange(0.0000000, 1.0000000) <= QuickPeekChance)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    DistanceToGrenadeDangerous=750.0000000
    DotProductGoodCover=0.7500000
    DotProductOkCover=0.5000000
    DotProductBadCover=0.2500000
    FactorDistanceToMeRating=2.0000000
    DistanceToMainEnemyInvalidCover=500.0000000
    DistanceTooCloseToMainEnemy=750.0000000
    DamagedNegativeRating=-100.0000000
    DamagedNegativeRatingTime=18.0000000
    DamagedNegativeRatingSpreadDistance=300.0000000
    SameCoverRating=-100.0000000
    SameCoverRatingTime=30.0000000
    NoCoverActionRating=-100.0000000
    NoCoverActionRatingTime=30.0000000
    FlankingGuyFactorDistanceToMeRating=1.5000000
    FlankingGuyMaxTimeShootingFromTheSameCover=5.0000000
    FlankingGuyExtraTimeSameCoverWhenLittleDamage=0.1000000
    FlankingGuyMinPctgBetterToChangeWhenNoCoverAction=0.5000000
    FlankingGuyMinPctgBetterToChangeWhenTooLongSameCover=0.7500000
    DamageToReactMoving=1000
    MaxTimeShootingFromTheSameCover=20.0000000
    MinDamageExtraTimeSameCover=25
    ExtraTimeSameCoverWhenLittleDamage=25.0000000
    MaxTimeNoCoverAction=4.0000000
    TimeWaitEnemyChooseCover=10.0000000
    TimeWaitForAllySuppressionFire=10.0000000
    MinPctgPeopleInCover=0.6700000
    KeepDistanceFromEnemy=500.0000000
    MinPctgBetterToChangeWhenNoCoverAction=1.1500000
    MinPctgBetterToChangeWhenTooLongSameCover=1.3000000
    NoCoverActionDamageToReactMoving=10
    NoCoverActionTimeReactWhenDamaged=2.0000000
    DelayEnterCoverAndStartShooting=1.0000000
    DamageToStopShootingInCover=15
    DamageReactShootingBack=10.0000000
    MinDistanceLeechAround=500.0000000
    MinTimeNoFiringWhenLeechAround=6.0000000
    DegreesOutOfViewStartShooting=60.0000000
    MinTimeSomeoneShootThePlayer=5.0000000
    MaxTimeChangePosition=10.0000000
    DamageChangePosition=10.0000000
    DamageShootingBack=5.0000000
    MinTimeAttackFromOpen=5.0000000
    DistanceDoStrike=75.0000000
    MeleeMinPlayerDistance=100.0000000
    MeleeTimeOut=3.0000000
    MinTimeBetweenMelees=8.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_TimeBetweenAttacksMin'
    begin object name=PackHunter_TimeBetweenAttacksMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeBetweenAttacksMin=PackHunter_TimeBetweenAttacksMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_TimeBetweenAttacksMax'
    begin object name=PackHunter_TimeBetweenAttacksMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeBetweenAttacksMax=PackHunter_TimeBetweenAttacksMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_MaxCircling'
    begin object name=PackHunter_MaxCircling class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_MaxCircling=PackHunter_MaxCircling
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_Circling_Radius'
    begin object name=PackHunter_Circling_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_Circling_Radius=PackHunter_Circling_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_MaxInStaticFormation'
    begin object name=PackHunter_MaxInStaticFormation class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_MaxInStaticFormation=PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_StaticFormation_MinRadius'
    begin object name=PackHunter_StaticFormation_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_StaticFormation_MinRadius=PackHunter_StaticFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_StaticFormation_Radius'
    begin object name=PackHunter_StaticFormation_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_StaticFormation_Radius=PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_StaticFormation_MaxRadius'
    begin object name=PackHunter_StaticFormation_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_StaticFormation_MaxRadius=PackHunter_StaticFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_TimeInPaternBeforeFirstAttackMin'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMin=PackHunter_TimeInPaternBeforeFirstAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PackHunter_TimeInPaternBeforeFirstAttackMax'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMax=PackHunter_TimeInPaternBeforeFirstAttackMax
    HowOfftenToUpdateThePackHunterStaticFormationAttackManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInThePackHunterStaticFormationAttackManager=5.0000000
    PackHunterStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    PackHunterAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_MaxAttackers'
    begin object name=IceCrab_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_MaxAttackers=IceCrab_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_Melee_Circle_Radius'
    begin object name=IceCrab_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1960.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_Melee_Circle_Radius=IceCrab_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenStrikesMin'
    begin object name=IceCrab_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenStrikesMin=IceCrab_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenStrikesMax'
    begin object name=IceCrab_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenStrikesMax=IceCrab_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMin=IceCrab_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMax=IceCrab_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenTauntAttackMin'
    begin object name=IceCrab_TimeBetweenTauntAttackMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenTauntAttackMin=IceCrab_TimeBetweenTauntAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IceCrab_TimeBetweenTauntAttackMax'
    begin object name=IceCrab_TimeBetweenTauntAttackMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenTauntAttackMax=IceCrab_TimeBetweenTauntAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_MaxAttackers'
    begin object name=Leech_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_MaxAttackers=Leech_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_MaxAttackAttempters'
    begin object name=Leech_MaxAttackAttempters class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_MaxAttackAttempters=Leech_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_Melee_Circle_Radius'
    begin object name=Leech_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_TimeBetweenStrikesMin'
    begin object name=Leech_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrikesMin=Leech_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_TimeBetweenStrikesMax'
    begin object name=Leech_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrikesMax=Leech_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_TimeBetweenStrugglesMin'
    begin object name=Leech_TimeBetweenStrugglesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrugglesMin=Leech_TimeBetweenStrugglesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_TimeBetweenStrugglesMax'
    begin object name=Leech_TimeBetweenStrugglesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrugglesMax=Leech_TimeBetweenStrugglesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_TimeToTrackStrikesOver'
    begin object name=Leech_TimeToTrackStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeToTrackStrikesOver=Leech_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Leech_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Leech_MaxNumberOfStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_MaxNumberOfStrikesOverTrackedTime=Leech_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Burrower_MaxAttackers'
    begin object name=Burrower_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_MaxAttackers=Burrower_MaxAttackers
    Burrower_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Burrower_TimeToTrackStrikesOver'
    begin object name=Burrower_TimeToTrackStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_TimeToTrackStrikesOver=Burrower_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Burrower_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Burrower_MaxNumberOfStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_MaxNumberOfStrikesOverTrackedTime=Burrower_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Burrower_TimeBetweenStrikesMin'
    begin object name=Burrower_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_TimeBetweenStrikesMin=Burrower_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Burrower_TimeBetweenStrikesMax'
    begin object name=Burrower_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_TimeBetweenStrikesMax=Burrower_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinTimeBetweenBurrowerAttacks'
    begin object name=MinTimeBetweenBurrowerAttacks class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenBurrowerAttacks=MinTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxTimeBetweenBurrowerAttacks'
    begin object name=MaxTimeBetweenBurrowerAttacks class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenBurrowerAttacks=MaxTimeBetweenBurrowerAttacks
    HowOfftenToUpdateTheBurrowerCombatManager=1.0000000
    HowOfftenToRemoveOutOfDateAttackOptionsInTheBurrowerCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Phadyr_MaxAttackers'
    begin object name=Phadyr_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_MaxAttackers=Phadyr_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Phadyr_Melee_Circle_Radius'
    begin object name=Phadyr_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_Melee_Circle_Radius=Phadyr_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Phadyr_TimeBetweenStrikesMin'
    begin object name=Phadyr_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_TimeBetweenStrikesMin=Phadyr_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Phadyr_TimeBetweenStrikesMax'
    begin object name=Phadyr_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_TimeBetweenStrikesMax=Phadyr_TimeBetweenStrikesMax
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_FormationInfo'
    begin object name=MedFlyer_FormationInfo class=Class'LPTuneDataSurroundFlyFormation'
        MaxAttackers=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_MaxAttackers'
        MaxNumberPerOrbitSlot=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_MaxNumberPerOrbitSlot'
        NumberOfExplorerSectors=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_NumberOfExplorerSectors'
        IdealRadius=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_Radius'
        MinRadius=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_MinRadius'
        MaxRadius=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_MaxRadius'
        DistanceErrorBuffer=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_DistanceErrorBuffer'
        CostOfDistanceDeltaInsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter'
        CostOfDistanceDeltaOutsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter'
        IdealHeightDelta=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_HeightDelta'
        MinHeightDelta=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_MinHeightDelta'
        MaxHeightDelta=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_MaxHeightDelta'
        HeightErrorBuffer=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_HeightErrorBuffer'
        CostOfHeightDeltaBelowIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter'
        CostOfHeightDeltaAboveIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter'
        IdealPitchInDegrees=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_IdealPitchInDegreesD0'
        MinPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_MinPitchAllowedInDegreesD0'
        MaxPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_MaxPitchAllowedInDegreesD0'
        PitchErrorBufferInDegrees=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_PitchErrorBufferInDegreesD0'
        CostOfPitchDeltaBelowIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree'
        CostOfPitchDeltaAboveIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree'
        MinRangeFromVsForFlyLocToBeValid=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_Orbit_Circle_MinRangeFromVsForFlyLocToBeValid'
        DefaultDelayTimeToTurnNoPathFoundFlagOff=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_DefaultDelayTimeToTurnNoPathFoundFlagOffD0'
        DefaultDelayTimeToTurnFoundNotCombatViableFlagOff=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0'
        PercentOfUsersRequiredToMarkLocNotCombatViable=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_PercentOfUsersRequiredToMarkLocNotCombatViableD0'
        NumberOfUsersRequiredToMarkLocNotPathViable=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_NumberOfUsersRequiredToMarkLocNotPathViableD0'
        MovementBufferBeforeRequireReexploration=SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MedFlyer_MovementBufferBeforeRequireReexplorationD0'
    end object
    MedFlyer_FormationInfo=MedFlyer_FormationInfo
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_MaxInFormation'
    begin object name=Dongo_MaxInFormation class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_MaxInFormation=Dongo_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_Formation_MinRadius'
    begin object name=Dongo_Formation_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_Formation_MinRadius=Dongo_Formation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_Formation_IdealRadius'
    begin object name=Dongo_Formation_IdealRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_Formation_IdealRadius=Dongo_Formation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_Formation_MaxRadius'
    begin object name=Dongo_Formation_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_Formation_MaxRadius=Dongo_Formation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_TimeBetweenStrikesMin'
    begin object name=Dongo_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenStrikesMin=Dongo_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_TimeBetweenStrikesMax'
    begin object name=Dongo_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenStrikesMax=Dongo_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_TimeBetweenWithdrawAndChargeMin'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenWithdrawAndChargeMin=Dongo_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Dongo_TimeBetweenWithdrawAndChargeMax'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenWithdrawAndChargeMax=Dongo_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.HumanSoldier_MaxAttackers'
    begin object name=HumanSoldier_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HumanSoldier_MaxAttackers=HumanSoldier_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.HumanSoldier_Surround_Radius'
    begin object name=HumanSoldier_Surround_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HumanSoldier_Surround_Radius=HumanSoldier_Surround_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.HumanSoldier_MaxFireAttackers'
    begin object name=HumanSoldier_MaxFireAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HumanSoldier_MaxFireAttacker=HumanSoldier_MaxFireAttackers
    HowOfftenToUpdateTheFireWaspCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheFireWaspCombatManager=5.0000000
    FireWaspStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    FireWaspAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Carrier_MaxInFormationD0'
    begin object name=Carrier_MaxInFormationD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_MaxInFormation=Carrier_MaxInFormationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Carrier_LoiterFormation_MinRadiusD0'
    begin object name=Carrier_LoiterFormation_MinRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_LoiterFormation_MinRadius=Carrier_LoiterFormation_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Carrier_LoiterFormation_IdealRadiusD0'
    begin object name=Carrier_LoiterFormation_IdealRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_LoiterFormation_IdealRadius=Carrier_LoiterFormation_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Carrier_LoiterFormation_MaxRadiusD0'
    begin object name=Carrier_LoiterFormation_MaxRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_LoiterFormation_MaxRadius=Carrier_LoiterFormation_MaxRadiusD0
    HowOfftenToUpdateTheDefenderRogueCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderRogueCombatManager=5.0000000
    DefenderRogueStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    DefenderRogueAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    HowOfftenToUpdateTheNushiSporeCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheNushiSporeCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MP_PackHunter_MaxInStaticFormation'
    begin object name=MP_PackHunter_MaxInStaticFormation class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MP_PackHunter_MaxInStaticFormation=MP_PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MP_PackHunter_StaticFormation_Radius'
    begin object name=MP_PackHunter_StaticFormation_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MP_PackHunter_StaticFormation_Radius=MP_PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_MaxAttackers'
    begin object name=Sepia_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxAttackers=Sepia_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_MaxAttackAttempters'
    begin object name=Sepia_MaxAttackAttempters class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxAttackAttempters=Sepia_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_Melee_Circle_Radius'
    begin object name=Sepia_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_Melee_Circle_Radius=Sepia_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_TimeBetweenStrikesMin'
    begin object name=Sepia_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeBetweenStrikesMin=Sepia_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_TimeBetweenStrikesMax'
    begin object name=Sepia_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeBetweenStrikesMax=Sepia_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_TimeToTrackStrikesOver'
    begin object name=Sepia_TimeToTrackStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeToTrackStrikesOver=Sepia_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxNumberOfStrikesOverTrackedTime=Sepia_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_TimeToTrackLobStrikesOver'
    begin object name=Sepia_TimeToTrackLobStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeToTrackLobStrikesOver=Sepia_TimeToTrackLobStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_MaxNumberOfLobStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfLobStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxNumberOfLobStrikesOverTrackedTime=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_MinNumToCausePanicRetreat'
    begin object name=Sepia_MinNumToCausePanicRetreat class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MinNumToCausePanicRetreat=Sepia_MinNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.Sepia_MaxNumToCausePanicRetreat'
    begin object name=Sepia_MaxNumToCausePanicRetreat class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxNumToCausePanicRetreat=Sepia_MaxNumToCausePanicRetreat
    HowOfftenToUpdateTheSentinelCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheSentinelCombatManager=5.0000000
    HowOfftenToUpdateTheCarrierDefenderCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheCarrierDefenderCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    CarrierDefenderStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    CarrierDefenderAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VsLaroche_MaxAttackers0'
    begin object name=VsLaroche_MaxAttackers0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_MaxAttackers=VsLaroche_MaxAttackers0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VsLaroche_Loiter_Circle_IdealRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_IdealRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_Loiter_Circle_IdealRadius=VsLaroche_Loiter_Circle_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VsLaroche_Loiter_Circle_MaxRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MaxRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_Loiter_Circle_MaxRadius=VsLaroche_Loiter_Circle_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VsLaroche_Loiter_Circle_MinRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MinRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_Loiter_Circle_MinRadius=VsLaroche_Loiter_Circle_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VsLaroche_TimeBetweenStrikesMinD0'
    begin object name=VsLaroche_TimeBetweenStrikesMinD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_TimeBetweenStrikesMin=VsLaroche_TimeBetweenStrikesMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VsLaroche_TimeBetweenStrikesMaxD0'
    begin object name=VsLaroche_TimeBetweenStrikesMaxD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_TimeBetweenStrikesMax=VsLaroche_TimeBetweenStrikesMaxD0
    MinTimeRepeatSoundGlobal=4.0000000
    MinTimeRepeatSoundGrenadeWarning=10.0000000
    MinTimeRepeatSoundMoveForward=10.0000000
    MinTimePlayerNotSeen=10.0000000
    MinTimeRepeatSoundPlayerSeen=15.0000000
    MaxTimeNoSoundTryAGeneric=20.0000000
    MinTimeRepeatSoundGeneric1=5.0000000
    MinTimeRepeatSoundGeneric2=8.0000000
    MinTimeRepeatSoundHitByBullet=15.0000000
    MinTimeRepeatSoundDeath=10.0000000
    MinTimeRepeatSoundGrenadeDeath=4.0000000
    ADSDistanceToTargetMin=700.0000000
    ADSDistanceToTargetMax=900.0000000
    ADSMaxTimeWhileMoving=4.0000000
    ADSDamageReactStopAiming=25.0000000
    MinTimeDontShootAfterMelee=3.5000000
    ADSTimeSinceCover=2.0000000
    ShootCloserToCoverMidCover=35.0000000
    ShootCloserToCoverStandingCover=35.0000000
    MinTimePeekBeforeFiring=1.0000000
    MaxTimePeekBeforeFiring=1.5000000
    MinTimePeekWhileWaiting=1.5000000
    MaxTimePeekWhileWaiting=2.0000000
    MinTimeBetweenPeeks=2.0000000
    MaxTimeBetweenPeeks=5.0000000
    ReactionTimeGettingShotWhilePeeking=0.3500000
    ReactionTimePlayerExposedWhilePeeking=0.2500000
    QuickPeekChance=0.7500000
    QuickPeekMinTime=0.7000000
    QuickPeekMaxTime=1.4000000
    MinTimeBetweenGrenades=40.0000000
    MinTimeSameCoverThrowGrenade=20.0000000
    TimeHoldGrenadeBeforeThrowing=0.5000000
    TimeCooldownAfterGrenadeThrow=1.0000000
    TimeToExplodeRunAway=1.0000000
    ShootToMissMinTimeBetween=15.0000000
    ShootToMissDegreesOutOfView=60.0000000
    ShootToMissExtraHeightInMiddleCover=10.0000000
    ShootToMissExtraHeight=90.0000000
    bEnableHSSGrenadeWarning=true
    bEnableHSSJimKilled=true
    bEnableHSSMoveForward=true
    bEnableHSSPlayerSeen=true
    bEnableHSSGeneric1=true
    bEnableHSSGeneric2=true
    bEnableHSSHitByBullet=true
    bEnableHSSDeath=true
    bEnableHSSDeathGrenade=true
    PDMMinDistance=100.0000000
    PDMMinDistanceMultiplier=5.0000000
    PDMMaxDistance=900.0000000
    PDMMaxDistanceMultiplier=1.0000000
    PDMMinTimeNoCover=1.5000000
    PDMMinTimeNoCoverMultiplier=1.0000000
    PDMMaxTimeNoCover=10.0000000
    PDMMaxTimeNoCoverMultiplier=2.0000000
    ChargeMinTimeInCover=5.0000000
    ChargeMinDegreesToLineOfFire=25.0000000
    ChargeMaxTimePlayerNotFiring=20.0000000
    ShotgunHealthMultiplier=1.2500000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MeleeDefaultDamageDefaultObject'
    begin object name=MeleeDefaultDamageDefaultObject
    end object
    MeleeDefaultDamage=MeleeDefaultDamageDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    bCanMelee=false
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    MinDistanceLosPositionFromMe=400.0000000
    MinDistanceLosPositionFromEnemy=350.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    PushSpeedWhenMeleeHit=1500.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    HealthPercentForLowHealthCSA=0.5000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    CoverStandingMovementSpeedScale=0.5000000
    CoverMiddleMovementSpeedScale=0.5000000
    ClaimCoverDistance=750.0000000
    bCanShoot360=true
    bCanUseCover=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    MinTimeAiming=3.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinBurstsToFireA'
    begin object name=MinBurstsToFireA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    MinDistanceEnemyToCoverForExposureCheck=3000.0000000
    bUseAimDownSightGroundSpeed=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
        baseValue=15.0000000
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.HealthDefaultObject'
    begin object name=HealthDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Health=HealthDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
        baseValue=540.0000000
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
        baseValue=650.0000000
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    RotationRate=(Pitch=0,Yaw=65536,Roll=0)
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    DefaultCSA=LPCSAO_HumanNPC'NPC_CSA.HumanSoldierDefault'
    FloorConformInfo=(bEnableMeshRotation=false,MaxMeshRotation=5.0000000,MeshRotationSpeed=20.0000000)
    MovingToMovingTransitionData=(MinSpeed=400.0000000,MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnHumanSoldier.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}