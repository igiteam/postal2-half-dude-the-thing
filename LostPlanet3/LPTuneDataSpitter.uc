class LPTuneDataSpitter extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion,SpitterVSTailHold,SpitterAttackSelectionPof,SpitterAttackSelectionVs,SpitterAttackAggressive,SpitterSpitAttack,SpitterAcidPool,SpitterTailStingAttack,SpitterTalonAttack,SpitterTalonAttackQuick,SpitterReactiveAttack,SpiiterTailDamage,SpitterTailStingQuickAttack,Melee,SpiiterStalk,SpitterHunkerDown)
    hidecategories(Object,Object,GrenadeExplosionInternal,AttackInterruption,SituationAwareness,AttacksArcs,Announce,WithdrawFromAttack,RespondToOnFire,Leychttack,ContinousAttack,ReactiveAttack,IceTrap,Cover,AIAccuracy,AIFiring,AICover,PlayerSprint,MovementAimDownSight,MovementAimGrenade,View,ForceFeedback,AmmoTypes,MortarAttack);

struct TailStingOverrides
{
    var(0.25_Pct) /*0xC85C0000-0x00000400*/ private const editfixedsize @NULL PercentChanceTailGettingStuckInGround[589825];
    var(0.25_Pct) /*0xC85C0000-0x00000400*/ private const editfixedsize @NULL MinTimeGettingStuckInGround[589825];
    var(0.25_Pct) /*0xC85C0000-0x00000400*/ private const editfixedsize @NULL MaxTimeGettingStuckInGround[589825];

    structdefaultproperties
    {
        PercentChanceTailGettingStuckInGround=none
        MinTimeGettingStuckInGround=none
        MaxTimeGettingStuckInGround=none
    }
};

struct QuickTailStingOverrides extends TailStingOverrides
{
    var(0.25_Pct) /*0xA8940000-0x00000400*/ private const editfixedsize @NULL RepeatCount_Min[589825];
    var(0.25_Pct) /*0xA8940000-0x00000400*/ private const editfixedsize @NULL RepeatCount_Max[589825];
    var(0.25_Pct) /*0xA8940000-0x00000000*/ private bool bUseNumberOfSuccessfulHitsToEndAttack[65537];
    var(0.25_Pct) /*0xA8940000-0x00000400*/ private const editfixedsize @NULL NumberOfSuccessfulHitsToEndAttack[589825];
    var(0.25_Pct) /*0xA8940000-0x00000400*/ private const editfixedsize @NULL DelayBetweenStrikesPof[589825];
    var(0.25_Pct) /*0xA8940000-0x00000400*/ private const editfixedsize @NULL DelayBetweenStrikesVS[589825];
};

struct SpitterAggressiveOverrides
{
    var(0.25_Pct) /*0xBEE10000-0x00000000*/ private editfixedsize @NULL TailSting[65537];
    var(0.25_Pct) /*0xBEE10000-0x00000000*/ private editfixedsize @NULL QuickTailSting[65537];

    structdefaultproperties
    {
        TailSting=(PercentChanceTailGettingStuckInGround=none,MinTimeGettingStuckInGround=none,MaxTimeGettingStuckInGround=none)
        QuickTailSting=(RepeatCount_Min=none,RepeatCount_Max=none,bUseNumberOfSuccessfulHitsToEndAttack=false,NumberOfSuccessfulHitsToEndAttack=none,DelayBetweenStrikesPof=none,DelayBetweenStrikesVS=none,PercentChanceTailGettingStuckInGround=none,MinTimeGettingStuckInGround=none,MaxTimeGettingStuckInGround=none)
    }
};

var(0.25_Pct) /*0xBEF90000-0x00000400*/ private editfixedsize @NULL PercentageOfHealthToUseAsMaxForTailDamageTexture[589825];
var(0.25_Pct) /*0xBF2C0000-0x00000400*/ private editfixedsize @NULL TailHold_UpSpitDuration[589825];
var(0.25_Pct) /*0xBF2C0000-0x00000400*/ private editfixedsize @NULL TailHold_RightToNeutralSpitDuration[589825];
var(0.25_Pct) /*0xBF2C0000-0x00000400*/ private editfixedsize @NULL TailHold_TimeoutToSpit[589825];
var(0.25_Pct) /*0xBF2C0000-0x00000000*/ private editfixedsize array DrillAcidEffects[589825];
var(0.25_Pct) /*0xBF230000-0x00000000*/ private float ReelInBeginTimerMaxWalkAway[65537];
var(0.25_Pct) /*0xBF230000-0x00000000*/ private float ReelInBeginTimerMaxNoMovement[65537];
var(0.25_Pct) /*0xBF230000-0x00000000*/ private float ReelInStruggleStartDistance[65537];
var(0.25_Pct) /*0xBF230000-0x00000000*/ private float ReelInFarUIDistance[65537];
var(0.25_Pct) /*0xBF230000-0x00000000*/ private float ReelInSuccessDistance[65537];
var(0.25_Pct) /*0xBF230000-0x00000000*/ private float ReelInSuccessLeeway[65537];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInDepletionRate[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInVelocity[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private float ReelInVelocityMax[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private float ReelInVelocityRevMax[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInReverseVelocity[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInRandomMulAmount[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInRandomAddAmount[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInMinTimeForRandom[589825];
var(0.25_Pct) /*0xBF230000-0x00000400*/ private editfixedsize @NULL ReelInMaxTimeForRandom[589825];
var(0.25_Pct) /*0xBEE70000-0x00000400*/ private editfixedsize @NULL AttackSelectionPofNotResined[589825];
var(0.25_Pct) /*0xBEE70000-0x00000400*/ private editfixedsize @NULL AttackSelectionPofNotResinedSpitDisabled[589825];
var(0.25_Pct) /*0xBEE70000-0x00000400*/ private editfixedsize @NULL AttackSelectionPofNotResinedTailDisabled[589825];
var(0.25_Pct) /*0xBEE70000-0x00000400*/ private editfixedsize @NULL AttackSelectionPofResined[589825];
var(0.25_Pct) /*0xBEE70000-0x00000400*/ private editfixedsize @NULL AttackSelectionPofTailBurning[589825];
var(0.25_Pct) /*0xBEE80000-0x00000400*/ private editfixedsize @NULL AttackSelectionVsNotResined[589825];
var(0.25_Pct) /*0xBEE80000-0x00000400*/ private editfixedsize @NULL AttackSelectionVsNotResinedSpitDisabled[589825];
var(0.25_Pct) /*0xBEE80000-0x00000400*/ private editfixedsize @NULL AttackSelectionVsNotResinedTailDisabled[589825];
var(0.25_Pct) /*0xBEE80000-0x00000400*/ private editfixedsize @NULL AttackSelectionVsResined[589825];
var(0.25_Pct) /*0xBEE80000-0x00000400*/ private editfixedsize @NULL AttackSelectionVsTailBurning[589825];
var(0.25_Pct) /*0xBEE30000-0x00000400*/ private const editfixedsize @NULL AttackSelection_Aggressive_Tail[589825];
var(0.25_Pct) /*0xBEE30000-0x00000400*/ private const editfixedsize @NULL AttackSelection_Aggressive_Without_Tail[589825];
var(0.25_Pct) /*0xBEE30000-0x00000400*/ private editfixedsize @NULL Aggressive_Overrides[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AttackSeperation_SpitAttackPof_Min[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AttackSeperation_SpitAttackPof_Max[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AttackSeperation_SpitAttackVs_Min[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AttackSeperation_SpitAttackVs_Max[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL DamagePerSecondFromSpit[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL DamagePerSecondFromSpit_VS[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL Duration_SpitAttackPof_Min[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL Duration_SpitAttackPof_Max[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL Duration_SpitAttackVs_Min[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL Duration_SpitAttackVs_Max[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL RateOfFire_SpitAttack[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL ErrorInAimingInDegrees_Min[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL ErrorInAimingInDegrees_Max[524289];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL ErrorInAimingInUnrealUnits_Min[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL ErrorInAimingInUnrealUnits_Max[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL ErrorInAimingInUnrealUnits_VS_Min[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL ErrorInAimingInUnrealUnits_VS_Max[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AimingErrorCorrectionInMeteresPerSecond[589825];
var(0.25_Pct) /*0xBF120000-0x00000000*/ private bool bAllowPlayerRollToSlowAutoCorrection[65537];
var(0.25_Pct) /*0xBF120000-0x00000000*/ private bool bAllowPlayerSprintToSlowAutoCorrection[65537];
var(0.25_Pct) /*0xBEDE0000-0x00000000*/ private bool AcidPoolEnabled[65537];
var(0.25_Pct) /*0xBEDE0000-0x00000000*/ private bool bDebugSpitterAcidPoolCreationExplosion[65537];
var(0.25_Pct) /*0xBF220000-0x00000000*/ private bool bTailStingQuick_UseNumberOfSuccessfulHitsToEndAttack[65537];
var(0.25_Pct) /*0xBF220000-0x00000000*/ private bool bAllowStuckIfLastAttackDodged[65537];
var(0.25_Pct) /*0xBE8F0000-0x00000000*/ private bool bAllowOffScreenSpitterAttacksToBeLessAccurate[65537];
var(0.25_Pct) /*0xBE900000-0x00000000*/ private bool bPauseDuringStalk[65537];
var(0.25_Pct) /*0xBE900000-0x00000000*/ private bool bAllowAttaksToInterruptIdleTime[65537];
var(0.25_Pct) /*0xBF030000-0x00000000*/ private bool bAllowToSpinOnTheSpotWithoutAnimationDuringHunkerDownBeforeTailSting[65537];
var(0.25_Pct) /*0xBF030000-0x00000000*/ private bool bAllowToSpinOnTheSpotWithoutAnimationDuringHunkerDownBeforeSpit[65537];
var(0.25_Pct) /*0xBE910000-0x00000000*/ private bool bDebugDrawTailExplosion[65537];
var(0.25_Pct) /*0xBE910000-0x00000000*/ private bool bDebugDrawTailDismemberExplosion[65537];
var(0.25_Pct) /*0xBE910000-0x00000000*/ private bool bCanDamageTailCoreInMutiplayer[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private bool bChargeHitsOnTouchAgainstPof[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private bool bChargeHitsOnTouchAgainstVs[65537];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL DistanceFromSpitToSlowAutoCorrection[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL TimeToContinueSlowAutoCorrectionAfterPlayerSprintEnds[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AutoCorrectionSlowDownPercentageOfOriginalSpeed[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AutoCorrectionSlowDownPercentageOfOriginalSpeed_DueToSprint[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerPushBackMaxSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerPushBackAcceleration;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL ErrorInAimingInDegreesVS_Min[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL ErrorInAimingInDegreesVS_Max[524289];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL AimingErrorCorrectionInMeteresPerSecondVS[589825];
var(0.25_Pct) /*0xBF120000-0x00000400*/ private editfixedsize @NULL TimeBetween_ResinBreakAndSpitAttack[589825];
var(0.25_Pct) /*0xBF120000-0x00000000*/ private editfixedsize array SpitParticleSystem[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000400*/ private editfixedsize @NULL SpitterAcidPoolCreationExplosion[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000400*/ private editfixedsize @NULL AcidPoolDamagePerSecond[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000400*/ private editfixedsize @NULL AcidPoolSize[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000400*/ private editfixedsize @NULL AcidPoolLifeSpan[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000400*/ private editfixedsize @NULL AcidPoolMinSpaceSeperation[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000400*/ private editfixedsize @NULL AcidPoolMaxPerSecond[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000000*/ private editfixedsize array AcidPoolDecalMaterial[589825];
var(0.25_Pct) /*0xBEDE0000-0x00000000*/ private editfixedsize array AcidPoolParticleSystem[589825];
var(0.25_Pct) /*0xBF130000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenTailTwitch[589825];
var(0.25_Pct) /*0xBF130000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenTailTwitch[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TailStingPof_Min[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TailStingPof_Max[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TailStingVs_Min[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TailStingVs_Max[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL TailStingForwardArcInDegrees[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL PercentChanceTailGettingStuckInGround[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL MinTimeGettingStuckInGround[589825];
var(0.25_Pct) /*0xBF210000-0x00000400*/ private editfixedsize @NULL MaxTimeGettingStuckInGround[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL TailStingQuick_RepeatCount_Min[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL TailStingQuick_RepeatCount_Max[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL TailStingQuick_NumberOfSuccessfulHitsToEndAttack[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL TailStingQuick_DelayBetweenStrikesPof[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL TailStingQuick_DelayBetweenStrikesVS[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL PercentChanceTailGettingStuckInGroundForQuick[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL MinTimeGettingStuckInGroundForQuick[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL MaxTimeGettingStuckInGroundForQuick[589825];
var(0.25_Pct) /*0xBF220000-0x00000400*/ private editfixedsize @NULL QuickStrikeChanceToKnockVSOutOfBlock[589825];
var(0.25_Pct) /*0xBF240000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TalonAttackPof_Max[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TalonAttackPof_Min[524289];
var(0.25_Pct) /*0xBF240000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TalonAttackReactivePof_Max[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TalonAttackReactivePof_Min[524289];
var(0.25_Pct) /*0xBF240000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TalonAttackVs_Max[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TalonAttackVs_Min[524289];
var(0.25_Pct) /*0xBF240000-0x00000400*/ private editfixedsize @NULL TalonAttackForwardArcInDegrees[589825];
var(0.25_Pct) /*0xBF250000-0x00000400*/ private editfixedsize @NULL TalonAttackQuick_RepeatCount_Min[589825];
var(0.25_Pct) /*0xBF250000-0x00000400*/ private editfixedsize @NULL TalonAttackQuick_RepeatCount_Max[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL AttackSeperation_TailSwing_Max[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TimeBetween_TailSwing_Min[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TimeBetween_TailSwing_Max[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TailSwingRearArcInDegrees[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL AttackSeperation_ReactiveTailSting_Max[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL AttackSeperation_ReactiveTailStingVS_Max[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TimeBetween_ReactiveTailSting_Min[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TimeBetween_ReactiveTailSting_Max[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TimeBetween_ReactiveTalonAttack_Min[589825];
var(0.25_Pct) /*0xBF0B0000-0x00000400*/ private editfixedsize @NULL TimeBetween_ReactiveTalonAttack_Max[589825];
var(0.25_Pct) /*0xBE8F0000-0x00000400*/ private editfixedsize @NULL TimeNotRenderedToBeConsideredOffScreen[589825];
var(0.25_Pct) /*0xBE8F0000-0x00000400*/ private editfixedsize @NULL PercentageChanceOfUsingChoreographyForAttacksWhenOffScreen[589825];
var(0.25_Pct) /*0xBF040000-0x00000400*/ private editfixedsize @NULL Time_Leg_Stun[589825];
var(0.25_Pct) /*0xBF040000-0x00000400*/ private editfixedsize @NULL DistanceGrenadeStunned[589825];
var(0.25_Pct) /*0xBF1B0000-0x00000400*/ private editfixedsize @NULL Time_VsHit_Stun[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL TimeBetweenStandIdleMin[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL TimeBetweenStandIdleMax[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL TimeToStandIdleMin[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL TimeToStandIdleMax[524289];
var(0.25_Pct) /*0xBF030000-0x00000400*/ private editfixedsize @NULL Seperation_ToBreakOutOfHunkerDown[589825];
var(0.25_Pct) /*0xBF030000-0x00000400*/ private editfixedsize @NULL AngularSeperation_ToBreakOutOfHunkerDown_Degrees[589825];
var(0.25_Pct) /*0xBF030000-0x00000400*/ private editfixedsize @NULL Seperation_ToBreakOutOfHunkerDown_DuringSpit[589825];
var(0.25_Pct) /*0xBF030000-0x00000400*/ private editfixedsize @NULL AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DuringSpit[589825];
var(0.25_Pct) /*0xBF030000-0x00000400*/ private editfixedsize @NULL MaxTimeInHunkerDown[589825];
var(0.25_Pct) /*0xBF030000-0x00000400*/ private editfixedsize @NULL TimeBetweenTalonPushAway[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL DamageForBreakingTailAttack[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL DamageWindowInSecondsForBreakingTailAttack[589825];
var(0.25_Pct) /*0xBF1E0000-0x00000400*/ private editfixedsize @NULL DamageForBreakingSpitAttack[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TimeBetweenDismembermentAndExplosion[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TailExplosionTemplate[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TailDismemberExplosionTemplate[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TailTwitchStrengthMin[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TailTwitchStrengthMax[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TailTwitchDelayMin[589825];
var(0.25_Pct) /*0xBE910000-0x00000400*/ private editfixedsize @NULL TailTwitchDelayMax[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL SpitterStalkSpeedScalePof[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL SpitterStalkSpeedScaleVs[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL SpitterAttackSpeedScalePof[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL SpitterAttackSpeedScaleVs[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL ChargingMaxSpeedScale[589825];
var(0.25_Pct) /*0xBDBF0000-0x00000400*/ private editfixedsize @NULL WithdrawForChargeMaxSpeedScale[589825];
var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize @NULL PercentageDamageToDismemberTail[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient @NULL SpitAttackCSA;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient @NULL TailStingCSA;
var(0.25_Pct) /*0x26BF0000-0x00000000*/ private @NULL AttackPofCSA[65537];
var(0.25_Pct) /*0x26BF0000-0x00000000*/ private @NULL AttackVsCSA[65537];
var(0.25_Pct) /*0x26BF0000-0x00000000*/ private @NULL StalkCSA[65537];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL DamageToHumanFromMovementHit[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL DamageToVsFromMovementHit[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL DamageToOtherFromMovementHit[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL bAllowMovementHitOnTouch[589825];
var(0.25_Pct) /*0x94510000-0x00000400*/ private editfixedsize @NULL bAllowMovementHitOnBump[589825];
var(0.25_Pct) /*0x94510000-0x00000000*/ private class DamageTypeToHumanFromMovementHit[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private class DamageTypeToVsFromMovementHit[65537];
var(0.25_Pct) /*0x94510000-0x00000000*/ private class DamageTypeToOtherFromMovementHit[65537];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL CloseCombatMinDist[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL CloseCombatMaxDist[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenSpitAttacks[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenSpitAttacks[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinDistanceForSpitAttack[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinTimeBeforeSwitchingTargets[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxTimeBeforeSwitchingTargets[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxDistToLookForSecondaryTargets[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL TailTargetAcquireMoveSpeed[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinManueverTraversalDistance[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxManueverTraversalDistance[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinManueverTime[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MinLockOnTargetDuringSpitTime[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MaxLockOnTargetDuringSpitTime[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL PostTargetLockTargetRateModifier[589825];
var(0.25_Pct) /*0xD3B10000-0x00000000*/ private @NULL RightAcidSocket[65537];
var(0.25_Pct) /*0xD3B10000-0x00000000*/ private @NULL CenterAcidSocket[65537];
var(0.25_Pct) /*0xD3B10000-0x00000000*/ private @NULL LeftAcidSocket[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToTryChargeAttack[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToStartChargingStrike[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceBeyondTargetForChargingStrike[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToTryChargeAttackAgainstVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinDistanceAwayToStartChargingStrikeAgainstVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceBeyondTargetForChargingStrikeAgainstVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL AngleToSideStepVsDuringCharge[589825];
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
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayBetweenNewChargeHitsAgainstVsAllowed[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayBetweenNewChargeHitsAgainstShutdownVsAllowed[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayBetweenNewChargeHitsAllowed[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL SpeedToAllowHitOnWhenTripping[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DesiredSeperationWhenChargeIsNotPossible[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000000*/ private editfixedsize @NULL ChargeDodgeMessage[65537];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinSeperationFromEnemyToTryWithdrawPof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinSeperationFromEnemyToTryWithdrawVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChanceToTryWithdrawAndChargePof[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ChanceToTryWithdrawAndChargeVs[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DistanceBetweenWithdrawPointsToCheck[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL ExtraBufferToAddToTheWithdrawDistance[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationBetweenMovementDeltaDuringChargeRunIn[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinMovementDeltaDuringChargeRunIn[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayAfterStartOfChargeRunIneforeMonitorStarts[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DurationBetweenMovementDeltaDuringWithdrawForCharge[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL MinMovementDeltaDuringWithdrawForCharge[589825];
var(0.25_Pct) /*0x1FFE0000-0x00000400*/ private editfixedsize @NULL DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PercentageOfHealthToUseAsMaxForTailDamageTexture_DefaultObject'
    begin object name=PercentageOfHealthToUseAsMaxForTailDamageTexture_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentageOfHealthToUseAsMaxForTailDamageTexture=PercentageOfHealthToUseAsMaxForTailDamageTexture_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailHold_UpSpitDurationObject'
    begin object name=TailHold_UpSpitDurationObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailHold_UpSpitDuration=TailHold_UpSpitDurationObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailHold_RightToNeutralSpitDurationObject'
    begin object name=TailHold_RightToNeutralSpitDurationObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailHold_RightToNeutralSpitDuration=TailHold_RightToNeutralSpitDurationObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailHold_TimeoutToSpitObject'
    begin object name=TailHold_TimeoutToSpitObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailHold_TimeoutToSpit=TailHold_TimeoutToSpitObject
    ReelInBeginTimerMaxWalkAway=0.7500000
    ReelInBeginTimerMaxNoMovement=0.2500000
    ReelInStruggleStartDistance=2000.0000000
    ReelInFarUIDistance=5000.0000000
    ReelInSuccessDistance=1925.0000000
    ReelInSuccessLeeway=25.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInDepletionRateObject'
    begin object name=ReelInDepletionRateObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInDepletionRate=ReelInDepletionRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInVelocityObject'
    begin object name=ReelInVelocityObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInVelocity=ReelInVelocityObject
    ReelInVelocityMax=3000.0000000
    ReelInVelocityRevMax=-1000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInReverseVelocityObject'
    begin object name=ReelInReverseVelocityObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInReverseVelocity=ReelInReverseVelocityObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInRandomMulAmountObject'
    begin object name=ReelInRandomMulAmountObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInRandomMulAmount=ReelInRandomMulAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInRandomAddAmountObject'
    begin object name=ReelInRandomAddAmountObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInRandomAddAmount=ReelInRandomAddAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInMinTimeForRandomObject'
    begin object name=ReelInMinTimeForRandomObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInMinTimeForRandom=ReelInMinTimeForRandomObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ReelInMaxTimeForRandomObject'
    begin object name=ReelInMaxTimeForRandomObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ReelInMaxTimeForRandom=ReelInMaxTimeForRandomObject
    AttackSelectionPofNotResined=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASPOF_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASPOF_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASPOF_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASPOF_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_Probablility_Spit_DefaultObject'
    begin object name=ASPOF_Probablility_Spit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_Spit=ASPOF_Probablility_Spit_DefaultObject,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_Probablility_TailSting_DefaultObject'
    begin object name=ASPOF_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASPOF_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASPOF_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASPOF_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_Probablility_TalonAttack_DefaultObject'
    begin object name=ASPOF_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASPOF_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASPOF_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASPOF_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASPOF_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASPOF_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TauntDuration_DefaultObject'
    begin object name=ASPOF_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASPOF_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASPOF_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASPOF_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASPOF_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASPOF_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TimeBetweenHunkerAndSpit_DefaultObject'
    begin object name=ASPOF_TimeBetweenHunkerAndSpit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSpit=ASPOF_TimeBetweenHunkerAndSpit_DefaultObject,TimeBetweenHunkerAndSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOF_TimeBetweenHunkerAndSting_DefaultObject'
    begin object name=ASPOF_TimeBetweenHunkerAndSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSting=ASPOF_TimeBetweenHunkerAndSting_DefaultObject)
    AttackSelectionPofNotResinedSpitDisabled=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASPOFSD_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASPOFSD_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASPOFSD_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASPOFSD_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=none,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_Probablility_TailSting_DefaultObject'
    begin object name=ASPOFSD_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASPOFSD_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASPOFSD_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=75.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASPOFSD_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_Probablility_TalonAttack_DefaultObject'
    begin object name=ASPOFSD_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASPOFSD_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASPOFSD_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASPOFSD_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASPOFSD_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASPOFSD_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_TauntDuration_DefaultObject'
    begin object name=ASPOFSD_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASPOFSD_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASPOFSD_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASPOFSD_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFSD_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASPOFSD_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASPOFSD_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFD_TimeBetweenHunkerAndSting_DefaultObject'
    begin object name=ASPOFD_TimeBetweenHunkerAndSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSting=ASPOFD_TimeBetweenHunkerAndSting_DefaultObject)
    AttackSelectionPofNotResinedTailDisabled=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASPOFTD_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASPOFTD_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASPOFTD_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASPOFTD_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=none,Probablility_TailSting=none,Probablility_QuickTailSting=none,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_Probablility_TalonAttack_DefaultObject'
    begin object name=ASPOFTD_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASPOFTD_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASPOFTD_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASPOFTD_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASPOFTD_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASPOFTD_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_TauntDuration_DefaultObject'
    begin object name=ASPOFTD_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASPOFTD_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASPOFTD_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASPOFTD_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTD_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASPOFTD_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASPOFTD_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    AttackSelectionPofResined=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASPOFRES_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASPOFRES_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASPOFRES_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASPOFRES_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_Probablility_Spit_DefaultObject'
    begin object name=ASPOFRES_Probablility_Spit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_Spit=ASPOFRES_Probablility_Spit_DefaultObject,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_Probablility_TailSting_DefaultObject'
    begin object name=ASPOFRES_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASPOFRES_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASPOFRES_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASPOFRES_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_Probablility_TalonAttack_DefaultObject'
    begin object name=ASPOFRES_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASPOFRES_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASPOFRES_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASPOFRES_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASPOFRES_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASPOFRES_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TauntDuration_DefaultObject'
    begin object name=ASPOFRES_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASPOFRES_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASPOFRES_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASPOFRES_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASPOFRES_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASPOFRES_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TimeBetweenHunkerAndSpit_DefaultObject'
    begin object name=ASPOFRES_TimeBetweenHunkerAndSpit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSpit=ASPOFRES_TimeBetweenHunkerAndSpit_DefaultObject,TimeBetweenHunkerAndSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFRES_TimeBetweenHunkerAndSting_DefaultObject'
    begin object name=ASPOFRES_TimeBetweenHunkerAndSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSting=ASPOFRES_TimeBetweenHunkerAndSting_DefaultObject)
    AttackSelectionPofTailBurning=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASPOFTB_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASPOFTB_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASPOFTB_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASPOFTB_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=none,Probablility_TailSting=none,Probablility_QuickTailSting=none,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_Probablility_TalonAttack_DefaultObject'
    begin object name=ASPOFTB_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASPOFTB_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASPOFTB_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=80.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASPOFTB_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASPOFTB_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASPOFTB_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_TauntDuration_DefaultObject'
    begin object name=ASPOFTB_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASPOFTB_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASPOFTB_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASPOFTB_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASPOFTB_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASPOFTB_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASPOFTB_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    AttackSelectionVsNotResined=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASVS_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASVS_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASVS_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASVS_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_Probablility_Spit_DefaultObject'
    begin object name=ASVS_Probablility_Spit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_Spit=ASVS_Probablility_Spit_DefaultObject,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_Probablility_TailSting_DefaultObject'
    begin object name=ASVS_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASVS_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASVS_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASVS_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_Probablility_TalonAttack_DefaultObject'
    begin object name=ASVS_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASVS_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASVS_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASVS_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASVS_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASVS_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_TauntDuration_DefaultObject'
    begin object name=ASVS_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASVS_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASVS_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASVS_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVS_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASVS_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASVS_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    AttackSelectionVsNotResinedSpitDisabled=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASVSSD_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASVSSD_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASVSSD_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASVSSD_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=none,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_Probablility_TailSting_DefaultObject'
    begin object name=ASVSSD_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASVSSD_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASVSSD_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASVSSD_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_Probablility_TalonAttack_DefaultObject'
    begin object name=ASVSSD_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASVSSD_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASVSSD_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASVSSD_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASVSSD_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASVSSD_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_TauntDuration_DefaultObject'
    begin object name=ASVSSD_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASVSSD_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASVSSD_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASVSSD_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSSD_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASVSSD_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASVSSD_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    AttackSelectionVsNotResinedTailDisabled=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASVSTD_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASVSTD_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASVSTD_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASVSTD_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=none,Probablility_TailSting=none,Probablility_QuickTailSting=none,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_Probablility_TalonAttack_DefaultObject'
    begin object name=ASVSTD_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASVSTD_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASVSTD_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASVSTD_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASVSTD_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASVSTD_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_TauntDuration_DefaultObject'
    begin object name=ASVSTD_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASVSTD_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASVSTD_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASVSTD_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTD_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASVSTD_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASVSTD_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    AttackSelectionVsResined=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASVSRES_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASVSRES_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASVSRES_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASVSRES_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_Probablility_Spit_DefaultObject'
    begin object name=ASVSRES_Probablility_Spit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_Spit=ASVSRES_Probablility_Spit_DefaultObject,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_Probablility_TailSting_DefaultObject'
    begin object name=ASVSRES_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASVSRES_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASVSRES_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASVSRES_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_Probablility_TalonAttack_DefaultObject'
    begin object name=ASVSRES_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASVSRES_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASVSRES_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASVSRES_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASVSRES_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASVSRES_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_TauntDuration_DefaultObject'
    begin object name=ASVSRES_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASVSRES_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASVSRES_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASVSRES_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSRES_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASVSRES_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASVSRES_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    AttackSelectionVsTailBurning=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASVSTB_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASVSTB_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASVSTB_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASVSTB_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=none,Probablility_TailSting=none,Probablility_QuickTailSting=none,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_Probablility_TalonAttack_DefaultObject'
    begin object name=ASVSTB_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASVSTB_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASVSTB_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=80.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASVSTB_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_Probablility_ChargeAttack_DefaultObject'
    begin object name=ASVSTB_Probablility_ChargeAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_ChargeAttack=ASVSTB_Probablility_ChargeAttack_DefaultObject,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_TauntDuration_DefaultObject'
    begin object name=ASVSTB_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASVSTB_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASVSTB_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASVSTB_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ASVSTB_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASVSTB_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASVSTB_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
    // Reference: LPTuneDataSpitterAttackSelection'Default__LPTuneDataSpitter.AttackSelection_Aggressive_Tail_DefaultObject'
    begin object name=AttackSelection_Aggressive_Tail_DefaultObject class=Class'LPTuneDataSpitterAttackSelection'
    end object
    AttackSelection_Aggressive_Tail=AttackSelection_Aggressive_Tail_DefaultObject
    // Reference: LPTuneDataSpitterAttackSelectionTailLess'Default__LPTuneDataSpitter.AttackSelection_Aggressive_Without_Tail_DefaultObject'
    begin object name=AttackSelection_Aggressive_Without_Tail_DefaultObject class=Class'LPTuneDataSpitterAttackSelectionTailLess'
    end object
    AttackSelection_Aggressive_Without_Tail=AttackSelection_Aggressive_Without_Tail_DefaultObject
    Aggressive_Overrides=(TailSting=(PercentChanceTailGettingStuckInGround=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailSting_PercentChanceTailGettingStuckInGround_DefaultObject'
    begin object name=AO_TailSting_PercentChanceTailGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentChanceTailGettingStuckInGround=AO_TailSting_PercentChanceTailGettingStuckInGround_DefaultObject,MinTimeGettingStuckInGround=AO_TailSting_PercentChanceTailGettingStuckInGround_DefaultObject,MaxTimeGettingStuckInGround=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailSting_MaxTimeGettingStuckInGround_DefaultObject'
    begin object name=AO_TailSting_MaxTimeGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeGettingStuckInGround=AO_TailSting_MaxTimeGettingStuckInGround_DefaultObject),QuickTailSting=(RepeatCount_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_RepeatCount_Min_DefaultObject'
    begin object name=AO_TailStingQ_RepeatCount_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RepeatCount_Min=AO_TailStingQ_RepeatCount_Min_DefaultObject,RepeatCount_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_RepeatCount_Max_DefaultObject'
    begin object name=AO_TailStingQ_RepeatCount_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RepeatCount_Max=AO_TailStingQ_RepeatCount_Max_DefaultObject,bUseNumberOfSuccessfulHitsToEndAttack=false,NumberOfSuccessfulHitsToEndAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQuick_NumberOfSuccessfulHitsToEndAttack_DefaultObject'
    begin object name=AO_TailStingQuick_NumberOfSuccessfulHitsToEndAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumberOfSuccessfulHitsToEndAttack=AO_TailStingQuick_NumberOfSuccessfulHitsToEndAttack_DefaultObject,DelayBetweenStrikesPof=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_DelayBetweenStrikesPof_DefaultObject'
    begin object name=AO_TailStingQ_DelayBetweenStrikesPof_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenStrikesPof=AO_TailStingQ_DelayBetweenStrikesPof_DefaultObject,DelayBetweenStrikesVS=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_DelayBetweenStrikesVS_DefaultObject'
    begin object name=AO_TailStingQ_DelayBetweenStrikesVS_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenStrikesVS=AO_TailStingQ_DelayBetweenStrikesVS_DefaultObject,PercentChanceTailGettingStuckInGround=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_PercentChanceTailGettingStuckInGround_DefaultObject'
    begin object name=AO_TailStingQ_PercentChanceTailGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentChanceTailGettingStuckInGround=AO_TailStingQ_PercentChanceTailGettingStuckInGround_DefaultObject,MinTimeGettingStuckInGround=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_MinTimeGettingStuckInGround_DefaultObject'
    begin object name=AO_TailStingQ_MinTimeGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeGettingStuckInGround=AO_TailStingQ_MinTimeGettingStuckInGround_DefaultObject,MaxTimeGettingStuckInGround=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AO_TailStingQ_MaxTimeGettingStuckInGround_DefaultObject'
    begin object name=AO_TailStingQ_MaxTimeGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeGettingStuckInGround=AO_TailStingQ_MaxTimeGettingStuckInGround_DefaultObject))
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_SpitAttackPof_Min_DefaultObject'
    begin object name=AttackSeperation_SpitAttackPof_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=370.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_SpitAttackPof_Min=AttackSeperation_SpitAttackPof_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_SpitAttackPof_Max_DefaultObject'
    begin object name=AttackSeperation_SpitAttackPof_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_SpitAttackPof_Max=AttackSeperation_SpitAttackPof_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_SpitAttackVs_Min_DefaultObject'
    begin object name=AttackSeperation_SpitAttackVs_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_SpitAttackVs_Min=AttackSeperation_SpitAttackVs_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_SpitAttackVs_Max_DefaultObject'
    begin object name=AttackSeperation_SpitAttackVs_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_SpitAttackVs_Max=AttackSeperation_SpitAttackVs_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamagePerSecondFromSpit_DefaultObject'
    begin object name=DamagePerSecondFromSpit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamagePerSecondFromSpit=DamagePerSecondFromSpit_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamagePerSecondFromSpit_VS_DefaultObject'
    begin object name=DamagePerSecondFromSpit_VS_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamagePerSecondFromSpit_VS=DamagePerSecondFromSpit_VS_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Duration_SpitAttackPof_Min_DefaultObject'
    begin object name=Duration_SpitAttackPof_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Duration_SpitAttackPof_Min=Duration_SpitAttackPof_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Duration_SpitAttackPof_Max_DefaultObject'
    begin object name=Duration_SpitAttackPof_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Duration_SpitAttackPof_Max=Duration_SpitAttackPof_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Duration_SpitAttackVs_Min_DefaultObject'
    begin object name=Duration_SpitAttackVs_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Duration_SpitAttackVs_Min=Duration_SpitAttackVs_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Duration_SpitAttackVs_Max_DefaultObject'
    begin object name=Duration_SpitAttackVs_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Duration_SpitAttackVs_Max=Duration_SpitAttackVs_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.RateOfFire_SpitAttack_DefaultObject'
    begin object name=RateOfFire_SpitAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RateOfFire_SpitAttack=RateOfFire_SpitAttack_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ErrorInAimingInUnrealUnits_Min_DefaultObject'
    begin object name=ErrorInAimingInUnrealUnits_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ErrorInAimingInUnrealUnits_Min=ErrorInAimingInUnrealUnits_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ErrorInAimingInUnrealUnits_Max_DefaultObject'
    begin object name=ErrorInAimingInUnrealUnits_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=600.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ErrorInAimingInUnrealUnits_Max=ErrorInAimingInUnrealUnits_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ErrorInAimingInUnrealUnits_VS_Min_DefaultObject'
    begin object name=ErrorInAimingInUnrealUnits_VS_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ErrorInAimingInUnrealUnits_VS_Min=ErrorInAimingInUnrealUnits_VS_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ErrorInAimingInUnrealUnits_VS_Max_DefaultObject'
    begin object name=ErrorInAimingInUnrealUnits_VS_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ErrorInAimingInUnrealUnits_VS_Max=ErrorInAimingInUnrealUnits_VS_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AimingErrorCorrectionInMeteresPerSecond_DefaultObject'
    begin object name=AimingErrorCorrectionInMeteresPerSecond_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AimingErrorCorrectionInMeteresPerSecond=AimingErrorCorrectionInMeteresPerSecond_DefaultObject
    bAllowPlayerSprintToSlowAutoCorrection=true
    AcidPoolEnabled=true
    bAllowStuckIfLastAttackDodged=true
    bPauseDuringStalk=true
    bAllowAttaksToInterruptIdleTime=true
    bCanDamageTailCoreInMutiplayer=true
    bChargeHitsOnTouchAgainstPof=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceFromSpitToSlowAutoCorrection_DefaultObject'
    begin object name=DistanceFromSpitToSlowAutoCorrection_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceFromSpitToSlowAutoCorrection=DistanceFromSpitToSlowAutoCorrection_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds_DefaultObject'
    begin object name=TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds=TimeToContinueSlowAutoCorrectionAfterPlayerRollEnds_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeToContinueSlowAutoCorrectionAfterPlayerSprintEnds_DefaultObject'
    begin object name=TimeToContinueSlowAutoCorrectionAfterPlayerSprintEnds_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeToContinueSlowAutoCorrectionAfterPlayerSprintEnds=TimeToContinueSlowAutoCorrectionAfterPlayerSprintEnds_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AutoCorrectionSlowDownPercentageOfOriginalSpeed_DefaultObject'
    begin object name=AutoCorrectionSlowDownPercentageOfOriginalSpeed_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=75.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AutoCorrectionSlowDownPercentageOfOriginalSpeed=AutoCorrectionSlowDownPercentageOfOriginalSpeed_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AutoCorrectionSlowDownPercentageOfOriginalSpeed_DueToSprint_DefaultObject'
    begin object name=AutoCorrectionSlowDownPercentageOfOriginalSpeed_DueToSprint_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AutoCorrectionSlowDownPercentageOfOriginalSpeed_DueToSprint=AutoCorrectionSlowDownPercentageOfOriginalSpeed_DueToSprint_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AimingErrorCorrectionInMeteresPerSecondVS_DefaultObject'
    begin object name=AimingErrorCorrectionInMeteresPerSecondVS_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AimingErrorCorrectionInMeteresPerSecondVS=AimingErrorCorrectionInMeteresPerSecondVS_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_ResinBreakAndSpitAttack_DefaultObject'
    begin object name=TimeBetween_ResinBreakAndSpitAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_ResinBreakAndSpitAttack=TimeBetween_ResinBreakAndSpitAttack_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AcidPoolDamagePerSecond_DefaultObject'
    begin object name=AcidPoolDamagePerSecond_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolDamagePerSecond=AcidPoolDamagePerSecond_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AcidPoolSize_DefaultObject'
    begin object name=AcidPoolSize_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolSize=AcidPoolSize_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AcidPoolLifeSpan_DefaultObject'
    begin object name=AcidPoolLifeSpan_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolLifeSpan=AcidPoolLifeSpan_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AcidPoolMinSpaceSeperation_DefaultObject'
    begin object name=AcidPoolMinSpaceSeperation_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolMinSpaceSeperation=AcidPoolMinSpaceSeperation_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AcidPoolMaxPerSecond_DefaultObject'
    begin object name=AcidPoolMaxPerSecond_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidPoolMaxPerSecond=AcidPoolMaxPerSecond_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeBetweenTailTwitch_DefaultObject'
    begin object name=MinTimeBetweenTailTwitch_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenTailTwitch=MinTimeBetweenTailTwitch_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeBetweenTailTwitch_DefaultObject'
    begin object name=MaxTimeBetweenTailTwitch_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenTailTwitch=MaxTimeBetweenTailTwitch_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TailStingPof_Min_DefaultObject'
    begin object name=AttackSeperation_TailStingPof_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=350.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TailStingPof_Min=AttackSeperation_TailStingPof_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TailStingPof_Max_DefaultObject'
    begin object name=AttackSeperation_TailStingPof_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TailStingPof_Max=AttackSeperation_TailStingPof_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TailStingVs_Min_DefaultObject'
    begin object name=AttackSeperation_TailStingVs_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=140.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TailStingVs_Min=AttackSeperation_TailStingVs_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TailStingVs_Max_DefaultObject'
    begin object name=AttackSeperation_TailStingVs_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=635.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TailStingVs_Max=AttackSeperation_TailStingVs_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailStingForwardArcInDegrees_DefaultObject'
    begin object name=TailStingForwardArcInDegrees_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailStingForwardArcInDegrees=TailStingForwardArcInDegrees_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PercentChanceTailGettingStuckInGround_DefaultObject'
    begin object name=PercentChanceTailGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentChanceTailGettingStuckInGround=PercentChanceTailGettingStuckInGround_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeGettingStuckInGround_DefaultObject'
    begin object name=MinTimeGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeGettingStuckInGround=MinTimeGettingStuckInGround_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeGettingStuckInGround_DefaultObject'
    begin object name=MaxTimeGettingStuckInGround_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeGettingStuckInGround=MaxTimeGettingStuckInGround_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailStingQuick_RepeatCount_Min_DefaultObject'
    begin object name=TailStingQuick_RepeatCount_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailStingQuick_RepeatCount_Min=TailStingQuick_RepeatCount_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailStingQuick_RepeatCount_Max_DefaultObject'
    begin object name=TailStingQuick_RepeatCount_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailStingQuick_RepeatCount_Max=TailStingQuick_RepeatCount_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailStingQuick_NumberOfSuccessfulHitsToEndAttack_DefaultObject'
    begin object name=TailStingQuick_NumberOfSuccessfulHitsToEndAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailStingQuick_NumberOfSuccessfulHitsToEndAttack=TailStingQuick_NumberOfSuccessfulHitsToEndAttack_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailStingQuick_DelayBetweenStrikesPof_DefaultObject'
    begin object name=TailStingQuick_DelayBetweenStrikesPof_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailStingQuick_DelayBetweenStrikesPof=TailStingQuick_DelayBetweenStrikesPof_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailStingQuick_DelayBetweenStrikesVS_DefaultObject'
    begin object name=TailStingQuick_DelayBetweenStrikesVS_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailStingQuick_DelayBetweenStrikesVS=TailStingQuick_DelayBetweenStrikesVS_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PercentChanceTailGettingStuckInGroundForQuick_DefaultObject'
    begin object name=PercentChanceTailGettingStuckInGroundForQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentChanceTailGettingStuckInGroundForQuick=PercentChanceTailGettingStuckInGroundForQuick_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeGettingStuckInGroundForQuick_DefaultObject'
    begin object name=MinTimeGettingStuckInGroundForQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeGettingStuckInGroundForQuick=MinTimeGettingStuckInGroundForQuick_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeGettingStuckInGroundForQuick_DefaultObject'
    begin object name=MaxTimeGettingStuckInGroundForQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeGettingStuckInGroundForQuick=MaxTimeGettingStuckInGroundForQuick_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.QuickStrikeChanceToKnockVSOutOfBlock_DefaultObject'
    begin object name=QuickStrikeChanceToKnockVSOutOfBlock_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    QuickStrikeChanceToKnockVSOutOfBlock=QuickStrikeChanceToKnockVSOutOfBlock_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TalonAttackPof_Max_DefaultObject'
    begin object name=AttackSeperation_TalonAttackPof_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TalonAttackPof_Max=AttackSeperation_TalonAttackPof_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TalonAttackPof_Min_DefaultObject'
    begin object name=AttackSeperation_TalonAttackPof_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-100000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TalonAttackPof_Min=AttackSeperation_TalonAttackPof_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TalonAttackReactivePof_Max_DefaultObject'
    begin object name=AttackSeperation_TalonAttackReactivePof_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TalonAttackReactivePof_Max=AttackSeperation_TalonAttackReactivePof_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TalonAttackReactivePof_Min_DefaultObject'
    begin object name=AttackSeperation_TalonAttackReactivePof_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-100000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TalonAttackReactivePof_Min=AttackSeperation_TalonAttackReactivePof_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TalonAttackVs_Max_DefaultObject'
    begin object name=AttackSeperation_TalonAttackVs_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TalonAttackVs_Max=AttackSeperation_TalonAttackVs_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TalonAttackVs_Min_DefaultObject'
    begin object name=AttackSeperation_TalonAttackVs_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-100000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TalonAttackVs_Min=AttackSeperation_TalonAttackVs_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TalonAttackForwardArcInDegrees_DefaultObject'
    begin object name=TalonAttackForwardArcInDegrees_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TalonAttackForwardArcInDegrees=TalonAttackForwardArcInDegrees_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TalonAttackQuick_RepeatCount_Min_DefaultObject'
    begin object name=TalonAttackQuick_RepeatCount_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TalonAttackQuick_RepeatCount_Min=TalonAttackQuick_RepeatCount_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TalonAttackQuick_RepeatCount_Max_DefaultObject'
    begin object name=TalonAttackQuick_RepeatCount_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TalonAttackQuick_RepeatCount_Max=TalonAttackQuick_RepeatCount_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_TailSwing_Max_DefaultObject'
    begin object name=AttackSeperation_TailSwing_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_TailSwing_Max=AttackSeperation_TailSwing_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_TailSwing_Min_DefaultObject'
    begin object name=TimeBetween_TailSwing_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_TailSwing_Min=TimeBetween_TailSwing_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_TailSwing_Max_DefaultObject'
    begin object name=TimeBetween_TailSwing_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_TailSwing_Max=TimeBetween_TailSwing_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailSwingRearArcInDegrees_DefaultObject'
    begin object name=TailSwingRearArcInDegrees_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailSwingRearArcInDegrees=TailSwingRearArcInDegrees_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_ReactiveTailSting_Max_DefaultObject'
    begin object name=AttackSeperation_ReactiveTailSting_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=350.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_ReactiveTailSting_Max=AttackSeperation_ReactiveTailSting_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AttackSeperation_ReactiveTailStingVS_Max_DefaultObject'
    begin object name=AttackSeperation_ReactiveTailStingVS_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=640.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AttackSeperation_ReactiveTailStingVS_Max=AttackSeperation_ReactiveTailStingVS_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_ReactiveTailSting_Min_DefaultObject'
    begin object name=TimeBetween_ReactiveTailSting_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_ReactiveTailSting_Min=TimeBetween_ReactiveTailSting_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_ReactiveTailSting_Max_DefaultObject'
    begin object name=TimeBetween_ReactiveTailSting_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_ReactiveTailSting_Max=TimeBetween_ReactiveTailSting_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_ReactiveTalonAttack_Min_DefaultObject'
    begin object name=TimeBetween_ReactiveTalonAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_ReactiveTalonAttack_Min=TimeBetween_ReactiveTalonAttack_Min_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetween_ReactiveTalonAttack_Max_DefaultObject'
    begin object name=TimeBetween_ReactiveTalonAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetween_ReactiveTalonAttack_Max=TimeBetween_ReactiveTalonAttack_Max_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeNotRenderedToBeConsideredOffScreen_DefaultObject'
    begin object name=TimeNotRenderedToBeConsideredOffScreen_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeNotRenderedToBeConsideredOffScreen=TimeNotRenderedToBeConsideredOffScreen_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PercentageChanceOfUsingChoreographyForAttacksWhenOffScreen_DefaultObject'
    begin object name=PercentageChanceOfUsingChoreographyForAttacksWhenOffScreen_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentageChanceOfUsingChoreographyForAttacksWhenOffScreen=PercentageChanceOfUsingChoreographyForAttacksWhenOffScreen_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Time_Leg_Stun_DefaultObject'
    begin object name=Time_Leg_Stun_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Time_Leg_Stun=Time_Leg_Stun_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceGrenadeStunned_DefaultObject'
    begin object name=DistanceGrenadeStunned_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeStunned=DistanceGrenadeStunned_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Time_VsHit_Stun_DefaultObject'
    begin object name=Time_VsHit_Stun_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Time_VsHit_Stun=Time_VsHit_Stun_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Seperation_ToBreakOutOfHunkerDown_DefaultObject'
    begin object name=Seperation_ToBreakOutOfHunkerDown_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=850.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Seperation_ToBreakOutOfHunkerDown=Seperation_ToBreakOutOfHunkerDown_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DefaultObject'
    begin object name=AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngularSeperation_ToBreakOutOfHunkerDown_Degrees=AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.Seperation_ToBreakOutOfHunkerDown_DuringSpit_DefaultObject'
    begin object name=Seperation_ToBreakOutOfHunkerDown_DuringSpit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=850.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Seperation_ToBreakOutOfHunkerDown_DuringSpit=Seperation_ToBreakOutOfHunkerDown_DuringSpit_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DuringSpit_DefaultObject'
    begin object name=AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DuringSpit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DuringSpit=AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DuringSpit_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeInHunkerDown_DefaultObject'
    begin object name=MaxTimeInHunkerDown_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.6000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeInHunkerDown=MaxTimeInHunkerDown_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetweenTalonPushAway_DefaultObject'
    begin object name=TimeBetweenTalonPushAway_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTalonPushAway=TimeBetweenTalonPushAway_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageForBreakingTailAttack_DefaultObject'
    begin object name=DamageForBreakingTailAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageForBreakingTailAttack=DamageForBreakingTailAttack_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageWindowInSecondsForBreakingTailAttack_DefaultObject'
    begin object name=DamageWindowInSecondsForBreakingTailAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageWindowInSecondsForBreakingTailAttack=DamageWindowInSecondsForBreakingTailAttack_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageForBreakingSpitAttack_DefaultObject'
    begin object name=DamageForBreakingSpitAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=125.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageForBreakingSpitAttack=DamageForBreakingSpitAttack_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeBetweenDismembermentAndExplosion_DefaultObject'
    begin object name=TimeBetweenDismembermentAndExplosion_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenDismembermentAndExplosion=TimeBetweenDismembermentAndExplosion_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailTwitchStrengthMin_DefaultObject'
    begin object name=TailTwitchStrengthMin_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailTwitchStrengthMin=TailTwitchStrengthMin_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailTwitchStrengthMax_DefaultObject'
    begin object name=TailTwitchStrengthMax_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=9000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailTwitchStrengthMax=TailTwitchStrengthMax_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailTwitchDelayMin_DefaultObject'
    begin object name=TailTwitchDelayMin_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailTwitchDelayMin=TailTwitchDelayMin_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailTwitchDelayMax_DefaultObject'
    begin object name=TailTwitchDelayMax_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailTwitchDelayMax=TailTwitchDelayMax_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SpitterStalkSpeedScalePof_DefaultObject'
    begin object name=SpitterStalkSpeedScalePof_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpitterStalkSpeedScalePof=SpitterStalkSpeedScalePof_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SpitterStalkSpeedScaleVs_DefaultObject'
    begin object name=SpitterStalkSpeedScaleVs_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpitterStalkSpeedScaleVs=SpitterStalkSpeedScaleVs_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SpitterAttackSpeedScalePof_DefaultObject'
    begin object name=SpitterAttackSpeedScalePof_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpitterAttackSpeedScalePof=SpitterAttackSpeedScalePof_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SpitterAttackSpeedScaleVs_DefaultObject'
    begin object name=SpitterAttackSpeedScaleVs_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpitterAttackSpeedScaleVs=SpitterAttackSpeedScaleVs_DefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargingMaxSpeedScale_Tunable_Default'
    begin object name=ChargingMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargingMaxSpeedScale=ChargingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.WithdrawForChargeMaxSpeedScale_Tunable_Default'
    begin object name=WithdrawForChargeMaxSpeedScale_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WithdrawForChargeMaxSpeedScale=WithdrawForChargeMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PercentageDamageToDismemberTail_DefaultObject'
    begin object name=PercentageDamageToDismemberTail_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentageDamageToDismemberTail=PercentageDamageToDismemberTail_DefaultObject
    AttackPofCSA=LPCSAO_Spitter'SpitterCSAs.Attack'
    AttackVsCSA=LPCSAO_Spitter'SpitterCSAs.AttackVS'
    StalkCSA=LPCSAO_Spitter'SpitterCSAs.Stalk'
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageToHumanFromMovementHitDefaultObject'
    begin object name=DamageToHumanFromMovementHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToHumanFromMovementHit=DamageToHumanFromMovementHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageToVsFromMovementHitDefaultObject'
    begin object name=DamageToVsFromMovementHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToVsFromMovementHit=DamageToVsFromMovementHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageToOtherFromMovementHitDefaultObject'
    begin object name=DamageToOtherFromMovementHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToOtherFromMovementHit=DamageToOtherFromMovementHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bAllowMovementHitOnTouchDefaultObject'
    begin object name=bAllowMovementHitOnTouchDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowMovementHitOnTouch=bAllowMovementHitOnTouchDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bAllowMovementHitOnBumpDefaultObject'
    begin object name=bAllowMovementHitOnBumpDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowMovementHitOnBump=bAllowMovementHitOnBumpDefaultObject
    DamageTypeToHumanFromMovementHit=Class'LPDamageTypeSpitterTalonPush'
    DamageTypeToVsFromMovementHit=Class'LPDamageTypeSpitterTalonPush'
    DamageTypeToOtherFromMovementHit=Class'LPDamageTypeSpitterTalonPush'
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.CloseCombatMinDist_01'
    begin object name=CloseCombatMinDist_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CloseCombatMinDist=CloseCombatMinDist_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.CloseCombatMaxDist_01'
    begin object name=CloseCombatMaxDist_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=600.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CloseCombatMaxDist=CloseCombatMaxDist_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeBetweenSpitAttacks_01'
    begin object name=MinTimeBetweenSpitAttacks_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenSpitAttacks=MinTimeBetweenSpitAttacks_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeBetweenSpitAttacks_01'
    begin object name=MaxTimeBetweenSpitAttacks_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenSpitAttacks=MaxTimeBetweenSpitAttacks_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDistanceForSpitAttack_01'
    begin object name=MinDistanceForSpitAttack_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceForSpitAttack=MinDistanceForSpitAttack_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeBeforeSwitchingTargets_01'
    begin object name=MinTimeBeforeSwitchingTargets_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBeforeSwitchingTargets=MinTimeBeforeSwitchingTargets_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeBeforeSwitchingTargets_01'
    begin object name=MaxTimeBeforeSwitchingTargets_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBeforeSwitchingTargets=MaxTimeBeforeSwitchingTargets_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDistToLookForSecondaryTargets_01'
    begin object name=MaxDistToLookForSecondaryTargets_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDistToLookForSecondaryTargets=MaxDistToLookForSecondaryTargets_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TailTargetAcquireMoveSpeed_01'
    begin object name=TailTargetAcquireMoveSpeed_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3600.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TailTargetAcquireMoveSpeed=TailTargetAcquireMoveSpeed_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinManueverTraversalDistance_01'
    begin object name=MinManueverTraversalDistance_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinManueverTraversalDistance=MinManueverTraversalDistance_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxManueverTraversalDistance_01'
    begin object name=MaxManueverTraversalDistance_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxManueverTraversalDistance=MaxManueverTraversalDistance_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinManueverTime_01'
    begin object name=MinManueverTime_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinManueverTime=MinManueverTime_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinLockOnTargetDuringSpitTime_01'
    begin object name=MinLockOnTargetDuringSpitTime_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinLockOnTargetDuringSpitTime=MinLockOnTargetDuringSpitTime_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxLockOnTargetDuringSpitTime_01'
    begin object name=MaxLockOnTargetDuringSpitTime_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxLockOnTargetDuringSpitTime=MaxLockOnTargetDuringSpitTime_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PostTargetLockTargetRateModifier_01'
    begin object name=PostTargetLockTargetRateModifier_01 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PostTargetLockTargetRateModifier=PostTargetLockTargetRateModifier_01
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDistanceAwayToTryChargeAttackD0'
    begin object name=MinDistanceAwayToTryChargeAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToTryChargeAttack=MinDistanceAwayToTryChargeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDistanceAwayToStartChargingStrikeD0'
    begin object name=MinDistanceAwayToStartChargingStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToStartChargingStrike=MinDistanceAwayToStartChargingStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceBeyondTargetForChargingStrikeD0'
    begin object name=DistanceBeyondTargetForChargingStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceBeyondTargetForChargingStrike=DistanceBeyondTargetForChargingStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDistanceAwayToTryChargeAttackAgainstVsD0'
    begin object name=MinDistanceAwayToTryChargeAttackAgainstVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToTryChargeAttackAgainstVs=MinDistanceAwayToTryChargeAttackAgainstVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDistanceAwayToStartChargingStrikeAgainstVsD0'
    begin object name=MinDistanceAwayToStartChargingStrikeAgainstVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDistanceAwayToStartChargingStrikeAgainstVs=MinDistanceAwayToStartChargingStrikeAgainstVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceBeyondTargetForChargingStrikeAgainstVsD0'
    begin object name=DistanceBeyondTargetForChargingStrikeAgainstVsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceBeyondTargetForChargingStrikeAgainstVs=DistanceBeyondTargetForChargingStrikeAgainstVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack_Default'
    begin object name=MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack=MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AngleToSideStepVsDuringChargeD0'
    begin object name=AngleToSideStepVsDuringChargeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleToSideStepVsDuringCharge=AngleToSideStepVsDuringChargeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationOfChargingShakeOffDefaultObject'
    begin object name=DurationOfChargingShakeOffDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfChargingShakeOff=DurationOfChargingShakeOffDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationOfChargingShakeOffAgainstVsDefaultObject'
    begin object name=DurationOfChargingShakeOffAgainstVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfChargingShakeOffAgainstVs=DurationOfChargingShakeOffAgainstVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationOfFailedChargeStunDefaultObject'
    begin object name=DurationOfFailedChargeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfFailedChargeStun=DurationOfFailedChargeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationOfBlockedChargeStunDefaultObject'
    begin object name=DurationOfBlockedChargeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfBlockedChargeStun=DurationOfBlockedChargeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargeHitDamagePoFDefaultObject'
    begin object name=ChargeHitDamagePoFDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeHitDamagePoF=ChargeHitDamagePoFDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargeHitDamageVSDefaultObject'
    begin object name=ChargeHitDamageVSDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeHitDamageVS=ChargeHitDamageVSDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargeHitDamageShutdownVSDefaultObject'
    begin object name=ChargeHitDamageShutdownVSDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeHitDamageShutdownVS=ChargeHitDamageShutdownVSDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargeBrushDamagePoFDefaultObject'
    begin object name=ChargeBrushDamagePoFDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeBrushDamagePoF=ChargeBrushDamagePoFDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargeBrushDamageVsDefaultObject'
    begin object name=ChargeBrushDamageVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=150.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeBrushDamageVs=ChargeBrushDamageVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChargeBrushDamageShutdownVsDefaultObject'
    begin object name=ChargeBrushDamageShutdownVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChargeBrushDamageShutdownVs=ChargeBrushDamageShutdownVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinAmountOfHealthForVsToTakeNonShutdownHitDamageDefaultObject'
    begin object name=MinAmountOfHealthForVsToTakeNonShutdownHitDamageDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfHealthForVsToTakeNonShutdownHitDamage=MinAmountOfHealthForVsToTakeNonShutdownHitDamageDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceAwayToOpenDodgeWindowPofDefaultObject'
    begin object name=DistanceAwayToOpenDodgeWindowPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceAwayToOpenDodgeWindowPof=DistanceAwayToOpenDodgeWindowPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceAwayToCloseDodgeWindowPofDefaultObject'
    begin object name=DistanceAwayToCloseDodgeWindowPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceAwayToCloseDodgeWindowPof=DistanceAwayToCloseDodgeWindowPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayBetweenNewChargeHitsAgainstVsAllowedD0'
    begin object name=DelayBetweenNewChargeHitsAgainstVsAllowedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenNewChargeHitsAgainstVsAllowed=DelayBetweenNewChargeHitsAgainstVsAllowedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayBetweenNewChargeHitsAgainstShutdownVsAllowedD0'
    begin object name=DelayBetweenNewChargeHitsAgainstShutdownVsAllowedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenNewChargeHitsAgainstShutdownVsAllowed=DelayBetweenNewChargeHitsAgainstShutdownVsAllowedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayBetweenNewChargeHitsAllowedD0'
    begin object name=DelayBetweenNewChargeHitsAllowedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenNewChargeHitsAllowed=DelayBetweenNewChargeHitsAllowedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SpeedToAllowHitOnWhenTrippingD0'
    begin object name=SpeedToAllowHitOnWhenTrippingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpeedToAllowHitOnWhenTripping=SpeedToAllowHitOnWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DesiredSeperationWhenChargeIsNotPossibleD0'
    begin object name=DesiredSeperationWhenChargeIsNotPossibleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DesiredSeperationWhenChargeIsNotPossible=DesiredSeperationWhenChargeIsNotPossibleD0
    ChargeDodgeMessage=(MessageText="DODGE NOW!!!",AppendedText="",MessageFont=none,MessageFontScale=(X=6.0000000,Y=6.0000000),MessageOffset=(X=-200.0000000,Y=0.0000000,Z=0.0000000),MessageColor=(R=255,G=0,B=255,A=255),MessageEndTime=-1.0000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinSeperationFromEnemyToTryWithdrawPofDefaultObject'
    begin object name=MinSeperationFromEnemyToTryWithdrawPofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationFromEnemyToTryWithdrawPof=MinSeperationFromEnemyToTryWithdrawPofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinSeperationFromEnemyToTryWithdrawVsDefaultObject'
    begin object name=MinSeperationFromEnemyToTryWithdrawVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=40.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSeperationFromEnemyToTryWithdrawVs=MinSeperationFromEnemyToTryWithdrawVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChanceToTryWithdrawAndChargePofDefaultObject'
    begin object name=ChanceToTryWithdrawAndChargePofDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryWithdrawAndChargePof=ChanceToTryWithdrawAndChargePofDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ChanceToTryWithdrawAndChargeVsDefaultObject'
    begin object name=ChanceToTryWithdrawAndChargeVsDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.9000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ChanceToTryWithdrawAndChargeVs=ChanceToTryWithdrawAndChargeVsDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceBetweenWithdrawPointsToCheck_Default'
    begin object name=DistanceBetweenWithdrawPointsToCheck_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceBetweenWithdrawPointsToCheck=DistanceBetweenWithdrawPointsToCheck_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ExtraBufferToAddToTheWithdrawDistance_Default'
    begin object name=ExtraBufferToAddToTheWithdrawDistance_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=600.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ExtraBufferToAddToTheWithdrawDistance=ExtraBufferToAddToTheWithdrawDistance_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttemptD0'
    begin object name=NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttemptD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt=NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttemptD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationBetweenMovementDeltaDuringChargeRunInD0'
    begin object name=DurationBetweenMovementDeltaDuringChargeRunInD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationBetweenMovementDeltaDuringChargeRunIn=DurationBetweenMovementDeltaDuringChargeRunInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinMovementDeltaDuringChargeRunIn_Tunable_Default'
    begin object name=MinMovementDeltaDuringChargeRunIn_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=75.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinMovementDeltaDuringChargeRunIn=MinMovementDeltaDuringChargeRunIn_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable_Default'
    begin object name=DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterStartOfChargeRunIneforeMonitorStarts=DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable_Default'
    begin object name=DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationBetweenMovementDeltaDuringWithdrawForCharge=DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinMovementDeltaDuringWithdrawForCharge_Tunable_Default'
    begin object name=MinMovementDeltaDuringWithdrawForCharge_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinMovementDeltaDuringWithdrawForCharge=MinMovementDeltaDuringWithdrawForCharge_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable_Default'
    begin object name=DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts=DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    DelayBetweenMovementHits=0.5000000
    MovementAdditionPushFactor=3.3000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
        baseValue=0.0000000
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    StrengthExplodeAfterFreeze=150.0000000
    SizeFractureMeshPartTooBig=41000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    WinchExclusionBodies=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    DefaultCSA=LPCSAO_Spitter'SpitterCSAs.Default'
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataSpitter.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}