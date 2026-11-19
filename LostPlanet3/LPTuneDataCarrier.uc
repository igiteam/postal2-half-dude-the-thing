class LPTuneDataCarrier extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion,Melee,MovementHit,ClawPush,Taunt,HiveVisualEffects,RamAttack)
    hidecategories(Object,Object,Object,BurstFireRangeAttack,AIBurstFire,DirectFireRangeAttack,LobFireRangeAttack,StruggleMode,HealthRegen,EMP,Attackers,Cover,Mantle,RangedLobStrike,AIAccuracy,AIFiring,AICover,AICombat,PlayerSprint,MovementAimDownSight,MovementAimGrenade,AmmoTypes,MortarAttack);

struct native CarrierBoneNameToCoreId
{
    var(0.25_Pct) /*0x1CC40000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0x1CC40000-0x00000000*/ private byte CoreID[65537];

    structdefaultproperties
    {
        BoneName="None"
        CoreID=eCarrierCore.eCarrierCore_MainCore
    }
};

struct native AreaCheckSize
{
    var(0.25_Pct) /*0x07100000-0x00000000*/ private float Behind[65537];
    var(0.25_Pct) /*0x07100000-0x00000000*/ private float InFront[65537];
    var(0.25_Pct) /*0x07100000-0x00000000*/ private float ToLeft[65537];
    var(0.25_Pct) /*0x07100000-0x00000000*/ private float ToRight[65537];

    structdefaultproperties
    {
        Behind=0.0000000
        InFront=0.0000000
        ToLeft=0.0000000
        ToRight=0.0000000
    }
};

var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL DurationOfTripStun[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL DamageFactorForNonPlayerInstigatedDamage[589825];
var(0.25_Pct) /*0x2B350000-0x00000000*/ private float MaxTimeForTakeItInTheMouthInAnimation[65537];
var(0.25_Pct) /*0x06AF0000-0x00000400*/ private editfixedsize @NULL DurationOfPofDirectAttackAnnounceLoop[589825];
var(0.25_Pct) /*0x09040000-0x00000400*/ private editfixedsize @NULL AttackObjectiveCostPenaltyForZDiff[589825];
var(0.25_Pct) /*0x09040000-0x00000400*/ private editfixedsize @NULL AttackObjectiveCostPenaltyForAttackingUsingAttackVolume[589825];
var(0.25_Pct) /*0x09870000-0x00000000*/ private float MinAngleInDegreesNeededForTurnToFaceCommandBeforeStartOfBackOutOfAttackVol[65537];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL UpdateRateForLoiterPocessLookForAttackOpportunityTimer[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoDirectAttackWhileLoitering[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoDirectAttackWhileLoiteringVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationToDoDirectAttackWhileLoiteringFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinRangeToTryAndGetFromTargetWhenLoiteringPof[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinRangeToTryAndGetFromTargetWhenLoiteringVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinRangeToTryAndGetFromTargetWhenLoiteringFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxRangeToTryAndGetFromTargetWhenLoiteringPof[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxRangeToTryAndGetFromTargetWhenLoiteringVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxRangeToTryAndGetFromTargetWhenLoiteringFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000000*/ private float RadiusOfCheckForLoiterAttackLane[65537];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL AmountDamageOverIntervalToGoFromPassiveToAgitated[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinSeperationRequiredToMaintainLoiterPof[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationRequiredToMaintainLoiterPof[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinSeperationRequiredToMaintainLoiterVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationRequiredToMaintainLoiterVs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinSeperationRequiredToMaintainLoiterFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxSeperationRequiredToMaintainLoiterFvs[589825];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MinSizeOfAttackLaneRequiredToMaintainLoiter[589825];
var(0.25_Pct) /*0x761E0000-0x00000000*/ private @NULL MinSizeLoiterArea[65537];
var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL MaxTimeToSpendInBackUpSpecialMove[589825];
var(0.25_Pct) /*0x761E0000-0x00000000*/ private float MinAngleInDegreesNeededForTurnToFaceCommandBeforeStartOfLoiterAnims[65537];
var(0.25_Pct) /*0x761E0000-0x00000000*/ private float MaxLoiterTimeAfterLaunch[65537];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL TimeBetweenDefenderElementLaunches[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL RandomRangeForDefenderElementLaunchTime[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize array HiveCellDataForDefenders[589825];
var(0.25_Pct) /*0x44700000-0x00000000*/ private editfixedsize array DefenderHoverPositions[65537];
var(0.25_Pct) /*0x44700000-0x00000000*/ private @NULL EffectForDefenderLaunchOnCarrierAtCell[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL HowLongToLoopMiddlePartOfLaunchDefendersBehavior[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL DelayAfterLaunchingDefendersBeforeSettingThemFree[589825];
var(0.25_Pct) /*0x44700000-0x00000000*/ private name LaunchingDefendersRoarName[65537];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch[589825];
var(0.25_Pct) /*0x44700000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch[589825];
var(0.25_Pct) /*0x44700000-0x00000000*/ private byte DefaultDefenderLaunchType[65537];
var(0.25_Pct) /*0x44700000-0x00000000*/ private editfixedsize array DefenderLaunchPathDrawRepList[65537];
var(0.25_Pct) /*0x44700000-0x00000000*/ private float MinNumberOfLaunchSequences[65537];
var(0.25_Pct) /*0x44700000-0x00000000*/ private float MaxNumberOfLaunchSequences[65537];
var(0.25_Pct) /*0x44700000-0x00000000*/ private bool bAllowDirectAttackAfterLaunching[65537];
var(0.25_Pct) /*0x44710000-0x00000000*/ private bool bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInHive[65537];
var(0.25_Pct) /*0x44710000-0x00000000*/ private bool bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInMouth[65537];
var(0.25_Pct) /*0x44710000-0x00000000*/ private bool bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenGettingStunByCloseGrenBoom[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private bool bBackUpWhenDirectAttackFinished[65537];
var(0.25_Pct) /*0xC9470000-0x00000000*/ private bool bFocusOnEnemyDuringTaunt[65537];
var(0.25_Pct) /*0xD4BA0000-0x00000000*/ private bool bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingVsMeleeHit[65537];
var(0.25_Pct) /*0xD4BA0000-0x00000000*/ private bool bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingTakingVsMeleeHit[65537];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceCarrierNotToAttack[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bOnlyProactivelyLaunchDefendersAndNothingElse[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bNotAllowedToProactivelyLaunchDefenders[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bNotAllowedToReactivlyLaunchDefenders[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bNotAllowedToLaunchDefendersAtAll[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bOnlyReactionAttack[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceNotAllowedReactionPhysicalAttack[536936449];
var(0.25_Pct) /*0x03C30000-0x00000000*/ private bool bForceBerserkAttack[536936449];
var(0.25_Pct) /*0x44700000-0x00000000*/ private float MinDistanceToTargetForDirectAttackWithDefenders[65537];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinNumOfDefenderToSquirtOutWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxNumOfDefenderToSquirtOutWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinNumOfDefenderToSquirtOutWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinNumOfDefenderToSquirtOutWhenTripping[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxNumOfDefenderToSquirtOutWhenTripping[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinNumOfDefenderToSquirtOutWhenTazing[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxNumOfDefenderToSquirtOutWhenTazing[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom[589825];
var(0.25_Pct) /*0x44710000-0x00000000*/ private float DelayBeforeLaunchingWhenGettingStunByCloseGrenBoom[65537];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttackVs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttackFvs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttackVs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttackFvs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenDirectAttackVs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenDirectAttackFvs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenDirectAttackVs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopDirectAttackVs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopDirectAttackFvs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopDirectAttackVs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopDirectAttackFvs[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL PlayRateForLoopFlurryStrikeWhenDirectAttackPof[589825];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DirectAttackWeight_Sweep[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DirectAttackWeight_PushAway[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float DirectAttackWeight_Flurry[65537];
var(0.25_Pct) /*0x47210000-0x00000000*/ private int DirectAttack_PercentChanceToTaunt[65537];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvs[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000400*/ private editfixedsize @NULL PlayRateForLoopFlurryStrikeWhenBerserkAttackPof[589825];
var(0.25_Pct) /*0x0F010000-0x00000000*/ private float BerzerkAttackWeight_Sweep[65537];
var(0.25_Pct) /*0x0F010000-0x00000000*/ private float BerzerkAttackWeight_PushAway[65537];
var(0.25_Pct) /*0x0F010000-0x00000000*/ private float BerzerkAttackWeight_Flurry[65537];
var(0.25_Pct) /*0x0F010000-0x00000000*/ private int BerzerkAttack_PercentChanceToTaunt[65537];
var(0.25_Pct) /*0x0F010000-0x00000000*/ private int MaxHealthForBerserkPhase[65537];
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL MaxDistanceToNotAvoidVsDuringNormalMovement[589825];
var(0.25_Pct) /*0x94470000-0x00000400*/ private editfixedsize @NULL AngleToSideStepVsDuringNormalMovement[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL DirectAttackStateMaxSpeedScale[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL BerserkStateMaxSpeedScale[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL RunningInForTauntAttackMaxSpeedScale[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForRaiseIntoTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForLoweringOutOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForStrikingOutOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForTakingGrenInTheMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTimeForReactingToExplosionInTheMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayForReactiveTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinTauntLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTauntLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DamageAmountToCauseEndOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DurationOfStunAfterGettingGrenadeInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DurationOfStunAfterGettingGrenadeInHive[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL DurationOfStunAfterTakingToMuchDirrectDamageInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL ChanceToTryTauntAttackPof[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntPincerBashReachPofDistance[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntPincerBashHorizAngRangeInDegrees[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MinTauntAttackLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL MaxTauntAttackLoopTime[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDamageAmountToCauseEndOfTaunt[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDurationOfStunAfterGettingGrenadeInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000400*/ private editfixedsize @NULL TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth[589825];
var(0.25_Pct) /*0xC9470000-0x00000000*/ private name BetweenStrikesTauntRoarName[65537];
var(0.25_Pct) /*0x67420000-0x00000400*/ private editfixedsize @NULL MaxTimeForHiveSwellReaction[589825];
var(0.25_Pct) /*0x67420000-0x00000000*/ private float WhenKilledAndNotifedDeflationOfHiveAmountPerSecound[65537];
var(0.25_Pct) /*0x67420000-0x00000000*/ private float DamageAmountForAutoDeflate[65537];
var(0.25_Pct) /*0x25B70000-0x00000000*/ private float MouthCoreGlowFactorStartValue[65537];
var(0.25_Pct) /*0x25B70000-0x00000000*/ private float MouthCoreGlowFactorEndValue[65537];
var(0.25_Pct) /*0x25B70000-0x00000000*/ private float MouthCoreGlowFactorRampOnAnnounceStartVal[65537];
var(0.25_Pct) /*0x25B70000-0x00000000*/ private float MouthCoreGlowFactorRampOnAnnounceEndVal[65537];
var(0.25_Pct) /*0x25B70000-0x00000000*/ private float MouthCoreGlowFactorRampTotalTimeToTake[65537];
var(0.25_Pct) /*0xA50F0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenWantingToTryAndKnockDownPof[589825];
var(0.25_Pct) /*0xA50F0000-0x00000400*/ private editfixedsize @NULL SweepHitOnGroundTime[589825];
var(0.25_Pct) /*0xA50F0000-0x00000000*/ private int PercentChanceOfKnockingPlayerDownWithSweep[65537];
var(0.25_Pct) /*0xD53F0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenWantingToTryAndTalonBashVs[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartKnockdownStrikePof[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePof[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVs[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvs[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartComboBashStrikeVs[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvs[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartPushBackStrikePof[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartPushBackStrikeVs[589825];
var(0.25_Pct) /*0x1D110000-0x00000400*/ private editfixedsize @NULL SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvs[589825];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize @NULL MinNumberOfCellsRequiredToKeepHiveClosed[589825];
var(0.25_Pct) /*0x271D0000-0x00000000*/ private int HiveMaxNumOfCells[65537];
var(0.25_Pct) /*0x271D0000-0x00000000*/ private int HiveCellCoreIdStartIdx[65537];
var(0.25_Pct) /*0x271D0000-0x00000000*/ private name NameOfMorphTargetToSwellHive[65537];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize array CoresToHideOnSpawnAndUnHideWhenAllCellsDestroyed[65537];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize array SkelControlInfoForCoresToPresentWhenAllCellsDestroyed[65537];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize array CoreDestoryedEffectSocketToAttachByCore[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize array BoneAttachPointByCore[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize @NULL minHealthThatInternalGrenadeExplosionCanNotTakeLessThen[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize @NULL MinDamageForInternalGrenadeExplosionInMouth[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize @NULL MaxDamageForInternalGrenadeExplosionInMouth[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize @NULL NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell[589825];
var(0.25_Pct) /*0x63B70000-0x00000400*/ private editfixedsize @NULL DurationOfGrenadeStun[589825];
var(0.25_Pct) /*0x63B70000-0x00000400*/ private editfixedsize @NULL DistanceGrenadeStunned[589825];
var(0.25_Pct) /*0x63B70000-0x00000400*/ private editfixedsize @NULL DistanceGrenadeReaction[589825];
var(0.25_Pct) /*0x67480000-0x00000400*/ private editfixedsize @NULL bUsePostCellDestroyedAutoBleed[589825];
var(0.25_Pct) /*0x67480000-0x00000400*/ private editfixedsize @NULL DurationOfCellDestroyedBleeding[589825];
var(0.25_Pct) /*0x67480000-0x00000400*/ private editfixedsize @NULL WaitTimeBetweenCellDestroyedBleeds[589825];
var(0.25_Pct) /*0x67480000-0x00000400*/ private editfixedsize @NULL MaxUpdateDeltaToAllowLowResCellDestroyedBleed[589825];
var(0.25_Pct) /*0x67480000-0x00000400*/ private editfixedsize @NULL MaxUpdateDeltaToAllowHighResCellDestroyedBleed[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL NumCellsToExposeFrom_NormalMelee[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL NumCellsToExposeFrom_ShoulderCharge[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL NumCellsToExposeFrom_TwoHandBash[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL NumCellsToExposeFrom_ComboThirdHit[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000400*/ private editfixedsize @NULL MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit[589825];
var(0.25_Pct) /*0xD4BA0000-0x00000000*/ private float VulnerableCellDurationBoostWhenGrabbed[65537];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL StunDurationBoostWhenPlayerLeavesVS[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL StunDurationBoostDefendersOnVS[589825];
var(0.25_Pct) /*0x589A0000-0x00000000*/ private float MaxSeparationRequiredToMaintainFlurry[65537];
var(0.25_Pct) /*0x589A0000-0x00000000*/ private float FlurryAttack_MaxNumberHits[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfTripStunDefaultObject'
    begin object name=DurationOfTripStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfTripStun=DurationOfTripStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DamageFactorForNonPlayerInstigatedDamageDefaultObject'
    begin object name=DamageFactorForNonPlayerInstigatedDamageDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageFactorForNonPlayerInstigatedDamage=DamageFactorForNonPlayerInstigatedDamageDefaultObject
    MaxTimeForTakeItInTheMouthInAnimation=3.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfPofDirectAttackAnnounceLoopD0'
    begin object name=DurationOfPofDirectAttackAnnounceLoopD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfPofDirectAttackAnnounceLoop=DurationOfPofDirectAttackAnnounceLoopD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AttackObjectiveCostPenaltyForZDiffD0'
    begin object name=AttackObjectiveCostPenaltyForZDiffD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackObjectiveCostPenaltyForZDiff=AttackObjectiveCostPenaltyForZDiffD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AttackObjectiveCostPenaltyForAttackingUsingAttackVolumeD0'
    begin object name=AttackObjectiveCostPenaltyForAttackingUsingAttackVolumeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackObjectiveCostPenaltyForAttackingUsingAttackVolume=AttackObjectiveCostPenaltyForAttackingUsingAttackVolumeD0
    MinAngleInDegreesNeededForTurnToFaceCommandBeforeStartOfBackOutOfAttackVol=10.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0'
    begin object name=UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UpdateRateForLoiterPocessLookForAttackOpportunityTimer=UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVs=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvs=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVs=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvs=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoDirectAttackWhileLoiteringD0'
    begin object name=MaxSeperationToDoDirectAttackWhileLoiteringD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoDirectAttackWhileLoitering=MaxSeperationToDoDirectAttackWhileLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoDirectAttackWhileLoiteringVsD0'
    begin object name=MaxSeperationToDoDirectAttackWhileLoiteringVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoDirectAttackWhileLoiteringVs=MaxSeperationToDoDirectAttackWhileLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToDoDirectAttackWhileLoiteringFvsD0'
    begin object name=MaxSeperationToDoDirectAttackWhileLoiteringFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationToDoDirectAttackWhileLoiteringFvs=MaxSeperationToDoDirectAttackWhileLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinRangeToTryAndGetFromTargetWhenLoiteringPofD0'
    begin object name=MinRangeToTryAndGetFromTargetWhenLoiteringPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRangeToTryAndGetFromTargetWhenLoiteringPof=MinRangeToTryAndGetFromTargetWhenLoiteringPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinRangeToTryAndGetFromTargetWhenLoiteringVsD0'
    begin object name=MinRangeToTryAndGetFromTargetWhenLoiteringVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRangeToTryAndGetFromTargetWhenLoiteringVs=MinRangeToTryAndGetFromTargetWhenLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinRangeToTryAndGetFromTargetWhenLoiteringFvsD0'
    begin object name=MinRangeToTryAndGetFromTargetWhenLoiteringFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRangeToTryAndGetFromTargetWhenLoiteringFvs=MinRangeToTryAndGetFromTargetWhenLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxRangeToTryAndGetFromTargetWhenLoiteringPofD0'
    begin object name=MaxRangeToTryAndGetFromTargetWhenLoiteringPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeToTryAndGetFromTargetWhenLoiteringPof=MaxRangeToTryAndGetFromTargetWhenLoiteringPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxRangeToTryAndGetFromTargetWhenLoiteringVsD0'
    begin object name=MaxRangeToTryAndGetFromTargetWhenLoiteringVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeToTryAndGetFromTargetWhenLoiteringVs=MaxRangeToTryAndGetFromTargetWhenLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxRangeToTryAndGetFromTargetWhenLoiteringFvsD0'
    begin object name=MaxRangeToTryAndGetFromTargetWhenLoiteringFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRangeToTryAndGetFromTargetWhenLoiteringFvs=MaxRangeToTryAndGetFromTargetWhenLoiteringFvsD0
    RadiusOfCheckForLoiterAttackLane=20.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0'
    begin object name=TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated=TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AmountDamageOverIntervalToGoFromPassiveToAgitatedD0'
    begin object name=AmountDamageOverIntervalToGoFromPassiveToAgitatedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountDamageOverIntervalToGoFromPassiveToAgitated=AmountDamageOverIntervalToGoFromPassiveToAgitatedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinSeperationRequiredToMaintainLoiterPofD0'
    begin object name=MinSeperationRequiredToMaintainLoiterPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationRequiredToMaintainLoiterPof=MinSeperationRequiredToMaintainLoiterPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationRequiredToMaintainLoiterPofD0'
    begin object name=MaxSeperationRequiredToMaintainLoiterPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationRequiredToMaintainLoiterPof=MaxSeperationRequiredToMaintainLoiterPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinSeperationRequiredToMaintainLoiterVsD0'
    begin object name=MinSeperationRequiredToMaintainLoiterVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationRequiredToMaintainLoiterVs=MinSeperationRequiredToMaintainLoiterVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationRequiredToMaintainLoiterVsD0'
    begin object name=MaxSeperationRequiredToMaintainLoiterVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationRequiredToMaintainLoiterVs=MaxSeperationRequiredToMaintainLoiterVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinSeperationRequiredToMaintainLoiterFvsD0'
    begin object name=MinSeperationRequiredToMaintainLoiterFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationRequiredToMaintainLoiterFvs=MinSeperationRequiredToMaintainLoiterFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationRequiredToMaintainLoiterFvsD0'
    begin object name=MaxSeperationRequiredToMaintainLoiterFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxSeperationRequiredToMaintainLoiterFvs=MaxSeperationRequiredToMaintainLoiterFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinSizeOfAttackLaneRequiredToMaintainLoiterD0'
    begin object name=MinSizeOfAttackLaneRequiredToMaintainLoiterD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSizeOfAttackLaneRequiredToMaintainLoiter=MinSizeOfAttackLaneRequiredToMaintainLoiterD0
    MinSizeLoiterArea=(Behind=100.0000000,InFront=0.0000000,ToLeft=0.0000000,ToRight=200.0000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeToSpendInBackUpSpecialMoveD0'
    begin object name=MaxTimeToSpendInBackUpSpecialMoveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToSpendInBackUpSpecialMove=MaxTimeToSpendInBackUpSpecialMoveD0
    MinAngleInDegreesNeededForTurnToFaceCommandBeforeStartOfLoiterAnims=20.0000000
    MaxLoiterTimeAfterLaunch=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnceD0'
    begin object name=AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce=AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnceD0
    HiveCellDataForDefenders=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.HowLongToLoopMiddlePartOfLaunchDefendersBehaviorD0'
    begin object name=HowLongToLoopMiddlePartOfLaunchDefendersBehaviorD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HowLongToLoopMiddlePartOfLaunchDefendersBehavior=HowLongToLoopMiddlePartOfLaunchDefendersBehaviorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DelayAfterLaunchingDefendersBeforeSettingThemFreeD0'
    begin object name=DelayAfterLaunchingDefendersBeforeSettingThemFreeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterLaunchingDefendersBeforeSettingThemFree=DelayAfterLaunchingDefendersBeforeSettingThemFreeD0
    LaunchingDefendersRoarName="CarrierStartLaunchRoar"
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0'
    begin object name=MinDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch=MinDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch=MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch=MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch=MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0
    MinNumberOfLaunchSequences=1.0000000
    MaxNumberOfLaunchSequences=1.0000000
    bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInHive=true
    bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInMouth=true
    bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingVsMeleeHit=true
    MinDistanceToTargetForDirectAttackWithDefenders=2000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumOfDefenderToSquirtOutWhenTakingGrenInHive=MinNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfDefenderToSquirtOutWhenTakingGrenInHive=MaxNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHiveD0'
    begin object name=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHive=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumOfDefenderToSquirtOutWhenTakingGrenInMouth=MinNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouth=MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouthD0'
    begin object name=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouth=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTrippingD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumOfDefenderToSquirtOutWhenTripping=MinNumOfDefenderToSquirtOutWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTrippingD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfDefenderToSquirtOutWhenTripping=MaxNumOfDefenderToSquirtOutWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTazingD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTazingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=18.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumOfDefenderToSquirtOutWhenTazing=MinNumOfDefenderToSquirtOutWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTazingD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTazingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=18.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfDefenderToSquirtOutWhenTazing=MaxNumOfDefenderToSquirtOutWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom=MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom=MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    DelayBeforeLaunchingWhenGettingStunByCloseGrenBoom=1.2000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackPof=MinNumberOfStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackVs=MinNumberOfStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackFvs=MinNumberOfStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackPof=MaxNumberOfStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackVs=MaxNumberOfStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackFvs=MaxNumberOfStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackPof=MinDelayBetweenStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackVs=MinDelayBetweenStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackFvs=MinDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackPof=MaxDelayBetweenStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackVs=MaxDelayBetweenStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvs=MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopDirectAttackPofD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopDirectAttackPof=MinAmountOfDamageRequiredToStopDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopDirectAttackVsD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopDirectAttackVs=MinAmountOfDamageRequiredToStopDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopDirectAttackFvsD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopDirectAttackFvs=MinAmountOfDamageRequiredToStopDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopDirectAttackPofD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopDirectAttackPof=MaxAmountOfDamageRequiredToStopDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopDirectAttackVsD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopDirectAttackVs=MaxAmountOfDamageRequiredToStopDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopDirectAttackFvsD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopDirectAttackFvs=MaxAmountOfDamageRequiredToStopDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0'
    begin object name=MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof=MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0'
    begin object name=MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof=MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.PlayRateForLoopFlurryStrikeWhenDirectAttackPofD0'
    begin object name=PlayRateForLoopFlurryStrikeWhenDirectAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PlayRateForLoopFlurryStrikeWhenDirectAttackPof=PlayRateForLoopFlurryStrikeWhenDirectAttackPofD0
    DirectAttackWeight_Sweep=1.0000000
    DirectAttackWeight_PushAway=1.0000000
    DirectAttackWeight_Flurry=1.0000000
    DirectAttack_PercentChanceToTaunt=33
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttackPof=MinNumberOfStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttackVs=MinNumberOfStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttackFvs=MinNumberOfStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttackPof=MaxNumberOfStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttackVs=MaxNumberOfStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttackFvs=MaxNumberOfStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenBerserkAttackPof=MinDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenBerserkAttackVs=MinDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvs=MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPof=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVs=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvs=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopBerserkAttackPofD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=65.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopBerserkAttackPof=MinAmountOfDamageRequiredToStopBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopBerserkAttackVsD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=65.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopBerserkAttackVs=MinAmountOfDamageRequiredToStopBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopBerserkAttackFvsD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=65.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopBerserkAttackFvs=MinAmountOfDamageRequiredToStopBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopBerserkAttackPofD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=65.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttackPof=MaxAmountOfDamageRequiredToStopBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopBerserkAttackVsD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=65.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttackVs=MaxAmountOfDamageRequiredToStopBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopBerserkAttackFvsD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=65.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttackFvs=MaxAmountOfDamageRequiredToStopBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPofD0'
    begin object name=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPof=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVsD0'
    begin object name=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVsD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVs=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvsD0'
    begin object name=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvs=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0'
    begin object name=MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof=MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0'
    begin object name=MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof=MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.PlayRateForLoopFlurryStrikeWhenBerserkAttackPofD0'
    begin object name=PlayRateForLoopFlurryStrikeWhenBerserkAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.8000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PlayRateForLoopFlurryStrikeWhenBerserkAttackPof=PlayRateForLoopFlurryStrikeWhenBerserkAttackPofD0
    BerzerkAttackWeight_Sweep=1.0000000
    BerzerkAttackWeight_PushAway=1.0000000
    BerzerkAttackWeight_Flurry=2.0000000
    BerzerkAttack_PercentChanceToTaunt=15
    MaxHealthForBerserkPhase=800
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDistanceToNotAvoidVsDuringNormalMovement_Default'
    begin object name=MaxDistanceToNotAvoidVsDuringNormalMovement_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistanceToNotAvoidVsDuringNormalMovement=MaxDistanceToNotAvoidVsDuringNormalMovement_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AngleToSideStepVsDuringNormalMovement_Default'
    begin object name=AngleToSideStepVsDuringNormalMovement_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleToSideStepVsDuringNormalMovement=AngleToSideStepVsDuringNormalMovement_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DirectAttackStateMaxSpeedScaleD0'
    begin object name=DirectAttackStateMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.4000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DirectAttackStateMaxSpeedScale=DirectAttackStateMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BerserkStateMaxSpeedScaleD0'
    begin object name=BerserkStateMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.7500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BerserkStateMaxSpeedScale=BerserkStateMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RunningInForTauntAttackMaxSpeedScaleD0'
    begin object name=RunningInForTauntAttackMaxSpeedScaleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.4000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RunningInForTauntAttackMaxSpeedScale=RunningInForTauntAttackMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeForRaiseIntoTauntD0'
    begin object name=MaxTimeForRaiseIntoTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForRaiseIntoTaunt=MaxTimeForRaiseIntoTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeForLoweringOutOfTauntD0'
    begin object name=MaxTimeForLoweringOutOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForLoweringOutOfTaunt=MaxTimeForLoweringOutOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeForStrikingOutOfTauntD0'
    begin object name=MaxTimeForStrikingOutOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForStrikingOutOfTaunt=MaxTimeForStrikingOutOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeForTakingGrenInTheMouthD0'
    begin object name=MaxTimeForTakingGrenInTheMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForTakingGrenInTheMouth=MaxTimeForTakingGrenInTheMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeForReactingToExplosionInTheMouthD0'
    begin object name=MaxTimeForReactingToExplosionInTheMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForReactingToExplosionInTheMouth=MaxTimeForReactingToExplosionInTheMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDistanceAwayForReactiveTaunt_Default'
    begin object name=MinDistanceAwayForReactiveTaunt_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayForReactiveTaunt=MinDistanceAwayForReactiveTaunt_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinTauntLoopTimeD0'
    begin object name=MinTauntLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntLoopTime=MinTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTauntLoopTimeD0'
    begin object name=MaxTauntLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntLoopTime=MaxTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DamageAmountToCauseEndOfTauntD0'
    begin object name=DamageAmountToCauseEndOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageAmountToCauseEndOfTaunt=DamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=DurationOfStunAfterGettingGrenadeInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfStunAfterGettingGrenadeInMouth=DurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfStunAfterGettingGrenadeInHiveD0'
    begin object name=DurationOfStunAfterGettingGrenadeInHiveD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfStunAfterGettingGrenadeInHive=DurationOfStunAfterGettingGrenadeInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfStunAfterTakingToMuchDirrectDamageInMouth=DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.ChanceToTryTauntAttackPofD0'
    begin object name=ChanceToTryTauntAttackPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryTauntAttackPof=ChanceToTryTauntAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TauntPincerBashReachPofDistanceD0'
    begin object name=TauntPincerBashReachPofDistanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=900.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntPincerBashReachPofDistance=TauntPincerBashReachPofDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TauntPincerBashHorizAngRangeInDegreesD0'
    begin object name=TauntPincerBashHorizAngRangeInDegreesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntPincerBashHorizAngRangeInDegrees=TauntPincerBashHorizAngRangeInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinTauntAttackLoopTimeD0'
    begin object name=MinTauntAttackLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTauntAttackLoopTime=MinTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTauntAttackLoopTimeD0'
    begin object name=MaxTauntAttackLoopTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTauntAttackLoopTime=MaxTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TauntAttackDamageAmountToCauseEndOfTauntD0'
    begin object name=TauntAttackDamageAmountToCauseEndOfTauntD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDamageAmountToCauseEndOfTaunt=TauntAttackDamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDurationOfStunAfterGettingGrenadeInMouth=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    BetweenStrikesTauntRoarName="CarrierTauntRoar"
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeForHiveSwellReactionD0'
    begin object name=MaxTimeForHiveSwellReactionD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForHiveSwellReaction=MaxTimeForHiveSwellReactionD0
    WhenKilledAndNotifedDeflationOfHiveAmountPerSecound=1.0000000
    DamageAmountForAutoDeflate=200.0000000
    MouthCoreGlowFactorStartValue=0.1000000
    MouthCoreGlowFactorEndValue=0.9500000
    MouthCoreGlowFactorRampOnAnnounceEndVal=1.0000000
    MouthCoreGlowFactorRampTotalTimeToTake=4.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinTimeBetweenWantingToTryAndKnockDownPofD0'
    begin object name=MinTimeBetweenWantingToTryAndKnockDownPofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenWantingToTryAndKnockDownPof=MinTimeBetweenWantingToTryAndKnockDownPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SweepHitOnGroundTimeD0'
    begin object name=SweepHitOnGroundTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SweepHitOnGroundTime=SweepHitOnGroundTimeD0
    PercentChanceOfKnockingPlayerDownWithSweep=50
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinTimeBetweenWantingToTryAndTalonBashVsD0'
    begin object name=MinTimeBetweenWantingToTryAndTalonBashVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenWantingToTryAndTalonBashVs=MinTimeBetweenWantingToTryAndTalonBashVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartKnockdownStrikePofD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartKnockdownStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartKnockdownStrikePof=SeperationRquiredAtEndOfMoveToStartKnockdownStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePofD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePof=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVs=SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvs=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartComboBashStrikeVsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartComboBashStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartComboBashStrikeVs=SeperationRquiredAtEndOfMoveToStartComboBashStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvs=SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikePofD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartPushBackStrikePofD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartPushBackStrikePof=SeperationRquiredAtEndOfMoveToStartPushBackStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikeVsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartPushBackStrikeVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartPushBackStrikeVs=SeperationRquiredAtEndOfMoveToStartPushBackStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvs=SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfCellsRequiredToKeepHiveClosedD0'
    begin object name=MinNumberOfCellsRequiredToKeepHiveClosedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfCellsRequiredToKeepHiveClosed=MinNumberOfCellsRequiredToKeepHiveClosedD0
    HiveMaxNumOfCells=18
    HiveCellCoreIdStartIdx=2
    NameOfMorphTargetToSwellHive="AKD_carrie_meshxx_bodyBlendOpen"
    CoresToHideOnSpawnAndUnHideWhenAllCellsDestroyed=/* Array type was not detected. */
    SkelControlInfoForCoresToPresentWhenAllCellsDestroyed=/* Array type was not detected. */
    CoreDestoryedEffectSocketToAttachByCore=/* Array type was not detected. */
    BoneAttachPointByCore=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinHealthThatInternalGrenadeExplosionCanNotTakeLessThenD0'
    begin object name=MinHealthThatInternalGrenadeExplosionCanNotTakeLessThenD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    minHealthThatInternalGrenadeExplosionCanNotTakeLessThen=MinHealthThatInternalGrenadeExplosionCanNotTakeLessThenD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDamageForInternalGrenadeExplosionInMouthD0'
    begin object name=MinDamageForInternalGrenadeExplosionInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDamageForInternalGrenadeExplosionInMouth=MinDamageForInternalGrenadeExplosionInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDamageForInternalGrenadeExplosionInMouthD0'
    begin object name=MaxDamageForInternalGrenadeExplosionInMouthD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDamageForInternalGrenadeExplosionInMouth=MaxDamageForInternalGrenadeExplosionInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCellD0'
    begin object name=NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCellD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell=NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCellD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfGrenadeStunDefaultObject'
    begin object name=DurationOfGrenadeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfGrenadeStun=DurationOfGrenadeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DistanceGrenadeStunnedDefaultObject'
    begin object name=DistanceGrenadeStunnedDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeStunned=DistanceGrenadeStunnedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DistanceGrenadeReactionDefaultObject'
    begin object name=DistanceGrenadeReactionDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeReaction=DistanceGrenadeReactionDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bUsePostCellDestroyedAutoBleedD0'
    begin object name=bUsePostCellDestroyedAutoBleedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bUsePostCellDestroyedAutoBleed=bUsePostCellDestroyedAutoBleedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfCellDestroyedBleedingD0'
    begin object name=DurationOfCellDestroyedBleedingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfCellDestroyedBleeding=DurationOfCellDestroyedBleedingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.WaitTimeBetweenCellDestroyedBleedsD0'
    begin object name=WaitTimeBetweenCellDestroyedBleedsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WaitTimeBetweenCellDestroyedBleeds=WaitTimeBetweenCellDestroyedBleedsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxUpdateDeltaToAllowLowResCellDestroyedBleedD0'
    begin object name=MaxUpdateDeltaToAllowLowResCellDestroyedBleedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxUpdateDeltaToAllowLowResCellDestroyedBleed=MaxUpdateDeltaToAllowLowResCellDestroyedBleedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxUpdateDeltaToAllowHighResCellDestroyedBleedD0'
    begin object name=MaxUpdateDeltaToAllowHighResCellDestroyedBleedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxUpdateDeltaToAllowHighResCellDestroyedBleed=MaxUpdateDeltaToAllowHighResCellDestroyedBleedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumCellsToExposeFrom_NormalMelee0'
    begin object name=NumCellsToExposeFrom_NormalMelee0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumCellsToExposeFrom_NormalMelee=NumCellsToExposeFrom_NormalMelee0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumCellsToExposeFrom_ShoulderCharge0'
    begin object name=NumCellsToExposeFrom_ShoulderCharge0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumCellsToExposeFrom_ShoulderCharge=NumCellsToExposeFrom_ShoulderCharge0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumCellsToExposeFrom_TwoHandBash0'
    begin object name=NumCellsToExposeFrom_TwoHandBash0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumCellsToExposeFrom_TwoHandBash=NumCellsToExposeFrom_TwoHandBash0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumCellsToExposeFrom_ComboThirdHit0'
    begin object name=NumCellsToExposeFrom_ComboThirdHit0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumCellsToExposeFrom_ComboThirdHit=NumCellsToExposeFrom_ComboThirdHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    VulnerableCellDurationBoostWhenGrabbed=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.StunDurationBoostWhenPlayerLeavesVSA'
    begin object name=StunDurationBoostWhenPlayerLeavesVSA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StunDurationBoostWhenPlayerLeavesVS=StunDurationBoostWhenPlayerLeavesVSA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.StunDurationBoostDefendersOnVSA'
    begin object name=StunDurationBoostDefendersOnVSA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StunDurationBoostDefendersOnVS=StunDurationBoostDefendersOnVSA
    MaxSeparationRequiredToMaintainFlurry=500.0000000
    FlurryAttack_MaxNumberHits=3.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    MaxTimeForAttackAnnounce=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    bDropTEnergyOnDeath=false
    bDropTEnergyOnFreeze=true
    SizeFractureMeshPartTooBig=41000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.OverrideVSArmAimAssistTrackSpeedA'
    begin object name=OverrideVSArmAimAssistTrackSpeedA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=550.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OverrideVSArmAimAssistTrackSpeed=OverrideVSArmAimAssistTrackSpeedA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.OverrideVSArmAimAssistDurationA'
    begin object name=OverrideVSArmAimAssistDurationA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.4000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    OverrideVSArmAimAssistDuration=OverrideVSArmAimAssistDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    StationaryToMovingTransitionData=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToMovingTransitionData=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    TurnInPlaceTransitionData=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    MovingToStationaryTransitionData=(MaxSpeed=1000.0000000,TransitionEntries=/* Array type was not detected. */)
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataCarrier.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}