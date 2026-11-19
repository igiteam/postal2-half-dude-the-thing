class LPTuneDataDefenderHive extends LPTuneDataCarrier
    dontsortcategories(StopingLocomotion,Melee,MovementHit,ClawPush,Taunt,HiveVisualEffects,RamAttack,ChargeAttack,DismembermentBleed)
    hidecategories(Object,Object,Object,BurstFireRangeAttack,AIBurstFire,DirectFireRangeAttack,LobFireRangeAttack,StruggleMode,HealthRegen,EMP,Attackers,Cover,Mantle,RangedLobStrike,AIAccuracy,AIFiring,AICover,AICombat,PlayerSprint,MovementAimDownSight,MovementAimGrenade,AmmoTypes,MortarAttack,Object,BurstFireRangeAttack,AIBurstFire,LobFireRangeAttack,StruggleMode,HealthRegen,EMP,Attackers,CombatWindows,Cover,Mantle,RangedLobStrike,AIAccuracy,AIFiring,AICover,AICombat,PlayerSprint,MovementAimDownSight,MovementAimGrenade,AmmoTypes,MortarAttack,LoiterBehavior,DamageReaction,DirectAttack,BerserkAttack,Movement,SpeedScales,Taunt,HiveSwellReaction,PofKnockDown,VsTalonBash,CarrierStrikeRanges,VSMelee,ForkArmGrab);

var(0.25_Pct) /*0x761E0000-0x00000400*/ private editfixedsize @NULL DelayAfterLastLaunchToAllowAnotherLaunch[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize @NULL DelayAfterGrenadeGoesIntoCellBeforeStartingExplosion[589825];
var(0.25_Pct) /*0xCAD60000-0x00000400*/ private editfixedsize @NULL ThermalEnergyPoolAllowedForDefenders[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayAfterLastLaunchToAllowAnotherLaunchD0'
    begin object name=DelayAfterLastLaunchToAllowAnotherLaunchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterLastLaunchToAllowAnotherLaunch=DelayAfterLastLaunchToAllowAnotherLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayAfterGrenadeGoesIntoCellBeforeStartingExplosionD0'
    begin object name=DelayAfterGrenadeGoesIntoCellBeforeStartingExplosionD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayAfterGrenadeGoesIntoCellBeforeStartingExplosion=DelayAfterGrenadeGoesIntoCellBeforeStartingExplosionD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ThermalEnergyPoolAllowedForDefenders0'
    begin object name=ThermalEnergyPoolAllowedForDefenders0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ThermalEnergyPoolAllowedForDefenders=ThermalEnergyPoolAllowedForDefenders0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfTripStunDefaultObject'
    begin object name=DurationOfTripStunDefaultObject
    end object
    DurationOfTripStun=DurationOfTripStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DamageFactorForNonPlayerInstigatedDamageDefaultObject'
    begin object name=DamageFactorForNonPlayerInstigatedDamageDefaultObject
    end object
    DamageFactorForNonPlayerInstigatedDamage=DamageFactorForNonPlayerInstigatedDamageDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfPofDirectAttackAnnounceLoopD0'
    begin object name=DurationOfPofDirectAttackAnnounceLoopD0
    end object
    DurationOfPofDirectAttackAnnounceLoop=DurationOfPofDirectAttackAnnounceLoopD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AttackObjectiveCostPenaltyForZDiffD0'
    begin object name=AttackObjectiveCostPenaltyForZDiffD0
    end object
    AttackObjectiveCostPenaltyForZDiff=AttackObjectiveCostPenaltyForZDiffD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AttackObjectiveCostPenaltyForAttackingUsingAttackVolumeD0'
    begin object name=AttackObjectiveCostPenaltyForAttackingUsingAttackVolumeD0
    end object
    AttackObjectiveCostPenaltyForAttackingUsingAttackVolume=AttackObjectiveCostPenaltyForAttackingUsingAttackVolumeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0'
    begin object name=UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    UpdateRateForLoiterPocessLookForAttackOpportunityTimer=UpdateRateForLoiterPocessLookForAttackOpportunityTimerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringD0
    end object
    MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVsD0
    end object
    MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVs=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvsD0
    end object
    MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvs=MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringD0
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVsD0
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVs=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvsD0'
    begin object name=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvsD0
    end object
    MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvs=MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoDirectAttackWhileLoiteringD0'
    begin object name=MaxSeperationToDoDirectAttackWhileLoiteringD0
    end object
    MaxSeperationToDoDirectAttackWhileLoitering=MaxSeperationToDoDirectAttackWhileLoiteringD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoDirectAttackWhileLoiteringVsD0'
    begin object name=MaxSeperationToDoDirectAttackWhileLoiteringVsD0
    end object
    MaxSeperationToDoDirectAttackWhileLoiteringVs=MaxSeperationToDoDirectAttackWhileLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToDoDirectAttackWhileLoiteringFvsD0'
    begin object name=MaxSeperationToDoDirectAttackWhileLoiteringFvsD0
    end object
    MaxSeperationToDoDirectAttackWhileLoiteringFvs=MaxSeperationToDoDirectAttackWhileLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinRangeToTryAndGetFromTargetWhenLoiteringPofD0'
    begin object name=MinRangeToTryAndGetFromTargetWhenLoiteringPofD0
    end object
    MinRangeToTryAndGetFromTargetWhenLoiteringPof=MinRangeToTryAndGetFromTargetWhenLoiteringPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinRangeToTryAndGetFromTargetWhenLoiteringVsD0'
    begin object name=MinRangeToTryAndGetFromTargetWhenLoiteringVsD0
    end object
    MinRangeToTryAndGetFromTargetWhenLoiteringVs=MinRangeToTryAndGetFromTargetWhenLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinRangeToTryAndGetFromTargetWhenLoiteringFvsD0'
    begin object name=MinRangeToTryAndGetFromTargetWhenLoiteringFvsD0
    end object
    MinRangeToTryAndGetFromTargetWhenLoiteringFvs=MinRangeToTryAndGetFromTargetWhenLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxRangeToTryAndGetFromTargetWhenLoiteringPofD0'
    begin object name=MaxRangeToTryAndGetFromTargetWhenLoiteringPofD0
    end object
    MaxRangeToTryAndGetFromTargetWhenLoiteringPof=MaxRangeToTryAndGetFromTargetWhenLoiteringPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxRangeToTryAndGetFromTargetWhenLoiteringVsD0'
    begin object name=MaxRangeToTryAndGetFromTargetWhenLoiteringVsD0
    end object
    MaxRangeToTryAndGetFromTargetWhenLoiteringVs=MaxRangeToTryAndGetFromTargetWhenLoiteringVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxRangeToTryAndGetFromTargetWhenLoiteringFvsD0'
    begin object name=MaxRangeToTryAndGetFromTargetWhenLoiteringFvsD0
    end object
    MaxRangeToTryAndGetFromTargetWhenLoiteringFvs=MaxRangeToTryAndGetFromTargetWhenLoiteringFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0'
    begin object name=TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated=TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitatedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AmountDamageOverIntervalToGoFromPassiveToAgitatedD0'
    begin object name=AmountDamageOverIntervalToGoFromPassiveToAgitatedD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountDamageOverIntervalToGoFromPassiveToAgitated=AmountDamageOverIntervalToGoFromPassiveToAgitatedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinSeperationRequiredToMaintainLoiterPofD0'
    begin object name=MinSeperationRequiredToMaintainLoiterPofD0
    end object
    MinSeperationRequiredToMaintainLoiterPof=MinSeperationRequiredToMaintainLoiterPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationRequiredToMaintainLoiterPofD0'
    begin object name=MaxSeperationRequiredToMaintainLoiterPofD0
    end object
    MaxSeperationRequiredToMaintainLoiterPof=MaxSeperationRequiredToMaintainLoiterPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinSeperationRequiredToMaintainLoiterVsD0'
    begin object name=MinSeperationRequiredToMaintainLoiterVsD0
    end object
    MinSeperationRequiredToMaintainLoiterVs=MinSeperationRequiredToMaintainLoiterVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationRequiredToMaintainLoiterVsD0'
    begin object name=MaxSeperationRequiredToMaintainLoiterVsD0
    end object
    MaxSeperationRequiredToMaintainLoiterVs=MaxSeperationRequiredToMaintainLoiterVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinSeperationRequiredToMaintainLoiterFvsD0'
    begin object name=MinSeperationRequiredToMaintainLoiterFvsD0
    end object
    MinSeperationRequiredToMaintainLoiterFvs=MinSeperationRequiredToMaintainLoiterFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationRequiredToMaintainLoiterFvsD0'
    begin object name=MaxSeperationRequiredToMaintainLoiterFvsD0
    end object
    MaxSeperationRequiredToMaintainLoiterFvs=MaxSeperationRequiredToMaintainLoiterFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinSizeOfAttackLaneRequiredToMaintainLoiterD0'
    begin object name=MinSizeOfAttackLaneRequiredToMaintainLoiterD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinSizeOfAttackLaneRequiredToMaintainLoiter=MinSizeOfAttackLaneRequiredToMaintainLoiterD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeToSpendInBackUpSpecialMoveD0'
    begin object name=MaxTimeToSpendInBackUpSpecialMoveD0
    end object
    MaxTimeToSpendInBackUpSpecialMove=MaxTimeToSpendInBackUpSpecialMoveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnceD0'
    begin object name=AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnceD0
    end object
    AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce=AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnceD0
    HiveCellDataForDefenders=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.HowLongToLoopMiddlePartOfLaunchDefendersBehaviorD0'
    begin object name=HowLongToLoopMiddlePartOfLaunchDefendersBehaviorD0
    end object
    HowLongToLoopMiddlePartOfLaunchDefendersBehavior=HowLongToLoopMiddlePartOfLaunchDefendersBehaviorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayAfterLaunchingDefendersBeforeSettingThemFreeD0'
    begin object name=DelayAfterLaunchingDefendersBeforeSettingThemFreeD0
    end object
    DelayAfterLaunchingDefendersBeforeSettingThemFree=DelayAfterLaunchingDefendersBeforeSettingThemFreeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0'
    begin object name=MinDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0
    end object
    MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch=MinDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0
    end object
    MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch=MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0
    end object
    MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch=MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0
    end object
    MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch=MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunchD0
    DefaultDefenderLaunchType=eDefenderHiveLaunchType.eDefenderHiveLaunchType_SlightArcUpThenBackDown
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0
    end object
    MinNumOfDefenderToSquirtOutWhenTakingGrenInHive=MinNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0
    end object
    MaxNumOfDefenderToSquirtOutWhenTakingGrenInHive=MaxNumOfDefenderToSquirtOutWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHiveD0'
    begin object name=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHiveD0
    end object
    bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHive=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0
    end object
    MinNumOfDefenderToSquirtOutWhenTakingGrenInMouth=MinNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0
    end object
    MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouth=MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouthD0'
    begin object name=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouthD0
    end object
    bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouth=bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumOfDefenderToSquirtOutWhenTrippingD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTrippingD0
    end object
    MinNumOfDefenderToSquirtOutWhenTripping=MinNumOfDefenderToSquirtOutWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumOfDefenderToSquirtOutWhenTrippingD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTrippingD0
    end object
    MaxNumOfDefenderToSquirtOutWhenTripping=MaxNumOfDefenderToSquirtOutWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTrippingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumOfDefenderToSquirtOutWhenTazingD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenTazingD0
    end object
    MinNumOfDefenderToSquirtOutWhenTazing=MinNumOfDefenderToSquirtOutWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumOfDefenderToSquirtOutWhenTazingD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenTazingD0
    end object
    MaxNumOfDefenderToSquirtOutWhenTazing=MaxNumOfDefenderToSquirtOutWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0'
    begin object name=MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0
    end object
    MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom=MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0'
    begin object name=MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0
    end object
    MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom=MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoomD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackPofD0
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackPof=MinNumberOfStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackVsD0
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackVs=MinNumberOfStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackFvsD0
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttackFvs=MinNumberOfStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackPofD0
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackPof=MaxNumberOfStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackVsD0
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackVs=MaxNumberOfStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackFvsD0
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttackFvs=MaxNumberOfStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackPofD0
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackPof=MinDelayBetweenStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackVsD0
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackVs=MinDelayBetweenStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0
    end object
    MinDelayBetweenStrikeAttemptsWhenDirectAttackFvs=MinDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsWhenDirectAttackPofD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackPofD0
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackPof=MaxDelayBetweenStrikeAttemptsWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsWhenDirectAttackVsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackVsD0
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackVs=MaxDelayBetweenStrikeAttemptsWhenDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0
    end object
    MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvs=MaxDelayBetweenStrikeAttemptsWhenDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopDirectAttackPofD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackPofD0
    end object
    MinAmountOfDamageRequiredToStopDirectAttackPof=MinAmountOfDamageRequiredToStopDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopDirectAttackVsD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackVsD0
    end object
    MinAmountOfDamageRequiredToStopDirectAttackVs=MinAmountOfDamageRequiredToStopDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopDirectAttackFvsD0'
    begin object name=MinAmountOfDamageRequiredToStopDirectAttackFvsD0
    end object
    MinAmountOfDamageRequiredToStopDirectAttackFvs=MinAmountOfDamageRequiredToStopDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopDirectAttackPofD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackPofD0
    end object
    MaxAmountOfDamageRequiredToStopDirectAttackPof=MaxAmountOfDamageRequiredToStopDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopDirectAttackVsD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackVsD0
    end object
    MaxAmountOfDamageRequiredToStopDirectAttackVs=MaxAmountOfDamageRequiredToStopDirectAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopDirectAttackFvsD0'
    begin object name=MaxAmountOfDamageRequiredToStopDirectAttackFvsD0
    end object
    MaxAmountOfDamageRequiredToStopDirectAttackFvs=MaxAmountOfDamageRequiredToStopDirectAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0'
    begin object name=MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0
    end object
    MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof=MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0'
    begin object name=MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0
    end object
    MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof=MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.PlayRateForLoopFlurryStrikeWhenDirectAttackPofD0'
    begin object name=PlayRateForLoopFlurryStrikeWhenDirectAttackPofD0
    end object
    PlayRateForLoopFlurryStrikeWhenDirectAttackPof=PlayRateForLoopFlurryStrikeWhenDirectAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackPofD0
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttackPof=MinNumberOfStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackVsD0
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttackVs=MinNumberOfStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MinNumberOfStrikeAttemptsWhenBerserkAttackFvsD0
    end object
    MinNumberOfStrikeAttemptsWhenBerserkAttackFvs=MinNumberOfStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackPofD0
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttackPof=MaxNumberOfStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackVsD0
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttackVs=MaxNumberOfStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenBerserkAttackFvsD0
    end object
    MaxNumberOfStrikeAttemptsWhenBerserkAttackFvs=MaxNumberOfStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0
    end object
    MinDelayBetweenStrikeAttemptsWhenBerserkAttackPof=MinDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0
    end object
    MinDelayBetweenStrikeAttemptsWhenBerserkAttackVs=MinDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0
    end object
    MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvs=MinDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0
    end object
    MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPof=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0
    end object
    MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVs=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0
    end object
    MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvs=MaxDelayBetweenStrikeAttemptsWhenBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopBerserkAttackPofD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackPofD0
    end object
    MinAmountOfDamageRequiredToStopBerserkAttackPof=MinAmountOfDamageRequiredToStopBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopBerserkAttackVsD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackVsD0
    end object
    MinAmountOfDamageRequiredToStopBerserkAttackVs=MinAmountOfDamageRequiredToStopBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopBerserkAttackFvsD0'
    begin object name=MinAmountOfDamageRequiredToStopBerserkAttackFvsD0
    end object
    MinAmountOfDamageRequiredToStopBerserkAttackFvs=MinAmountOfDamageRequiredToStopBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopBerserkAttackPofD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackPofD0
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttackPof=MaxAmountOfDamageRequiredToStopBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopBerserkAttackVsD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackVsD0
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttackVs=MaxAmountOfDamageRequiredToStopBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopBerserkAttackFvsD0'
    begin object name=MaxAmountOfDamageRequiredToStopBerserkAttackFvsD0
    end object
    MaxAmountOfDamageRequiredToStopBerserkAttackFvs=MaxAmountOfDamageRequiredToStopBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPofD0'
    begin object name=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPofD0
    end object
    bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPof=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVsD0'
    begin object name=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVsD0
    end object
    bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVs=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvsD0'
    begin object name=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvsD0
    end object
    bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvs=bAllowMainCoreDamageToCountTowardsStoppingTheBerserkAttackFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0'
    begin object name=MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0
    end object
    MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof=MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0'
    begin object name=MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0
    end object
    MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof=MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.PlayRateForLoopFlurryStrikeWhenBerserkAttackPofD0'
    begin object name=PlayRateForLoopFlurryStrikeWhenBerserkAttackPofD0
    end object
    PlayRateForLoopFlurryStrikeWhenBerserkAttackPof=PlayRateForLoopFlurryStrikeWhenBerserkAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDistanceToNotAvoidVsDuringNormalMovement_Default'
    begin object name=MaxDistanceToNotAvoidVsDuringNormalMovement_Default
    end object
    MaxDistanceToNotAvoidVsDuringNormalMovement=MaxDistanceToNotAvoidVsDuringNormalMovement_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AngleToSideStepVsDuringNormalMovement_Default'
    begin object name=AngleToSideStepVsDuringNormalMovement_Default
    end object
    AngleToSideStepVsDuringNormalMovement=AngleToSideStepVsDuringNormalMovement_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DirectAttackStateMaxSpeedScaleD0'
    begin object name=DirectAttackStateMaxSpeedScaleD0
    end object
    DirectAttackStateMaxSpeedScale=DirectAttackStateMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BerserkStateMaxSpeedScaleD0'
    begin object name=BerserkStateMaxSpeedScaleD0
    end object
    BerserkStateMaxSpeedScale=BerserkStateMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RunningInForTauntAttackMaxSpeedScaleD0'
    begin object name=RunningInForTauntAttackMaxSpeedScaleD0
    end object
    RunningInForTauntAttackMaxSpeedScale=RunningInForTauntAttackMaxSpeedScaleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeForRaiseIntoTauntD0'
    begin object name=MaxTimeForRaiseIntoTauntD0
    end object
    MaxTimeForRaiseIntoTaunt=MaxTimeForRaiseIntoTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeForLoweringOutOfTauntD0'
    begin object name=MaxTimeForLoweringOutOfTauntD0
    end object
    MaxTimeForLoweringOutOfTaunt=MaxTimeForLoweringOutOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeForStrikingOutOfTauntD0'
    begin object name=MaxTimeForStrikingOutOfTauntD0
    end object
    MaxTimeForStrikingOutOfTaunt=MaxTimeForStrikingOutOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeForTakingGrenInTheMouthD0'
    begin object name=MaxTimeForTakingGrenInTheMouthD0
    end object
    MaxTimeForTakingGrenInTheMouth=MaxTimeForTakingGrenInTheMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeForReactingToExplosionInTheMouthD0'
    begin object name=MaxTimeForReactingToExplosionInTheMouthD0
    end object
    MaxTimeForReactingToExplosionInTheMouth=MaxTimeForReactingToExplosionInTheMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDistanceAwayForReactiveTaunt_Default'
    begin object name=MinDistanceAwayForReactiveTaunt_Default
    end object
    MinDistanceAwayForReactiveTaunt=MinDistanceAwayForReactiveTaunt_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinTauntLoopTimeD0'
    begin object name=MinTauntLoopTimeD0
    end object
    MinTauntLoopTime=MinTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTauntLoopTimeD0'
    begin object name=MaxTauntLoopTimeD0
    end object
    MaxTauntLoopTime=MaxTauntLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DamageAmountToCauseEndOfTauntD0'
    begin object name=DamageAmountToCauseEndOfTauntD0
    end object
    DamageAmountToCauseEndOfTaunt=DamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=DurationOfStunAfterGettingGrenadeInMouthD0
    end object
    DurationOfStunAfterGettingGrenadeInMouth=DurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfStunAfterGettingGrenadeInHiveD0'
    begin object name=DurationOfStunAfterGettingGrenadeInHiveD0
    end object
    DurationOfStunAfterGettingGrenadeInHive=DurationOfStunAfterGettingGrenadeInHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    end object
    DurationOfStunAfterTakingToMuchDirrectDamageInMouth=DurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ChanceToTryTauntAttackPofD0'
    begin object name=ChanceToTryTauntAttackPofD0
    end object
    ChanceToTryTauntAttackPof=ChanceToTryTauntAttackPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TauntPincerBashReachPofDistanceD0'
    begin object name=TauntPincerBashReachPofDistanceD0
    end object
    TauntPincerBashReachPofDistance=TauntPincerBashReachPofDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TauntPincerBashHorizAngRangeInDegreesD0'
    begin object name=TauntPincerBashHorizAngRangeInDegreesD0
    end object
    TauntPincerBashHorizAngRangeInDegrees=TauntPincerBashHorizAngRangeInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinTauntAttackLoopTimeD0'
    begin object name=MinTauntAttackLoopTimeD0
    end object
    MinTauntAttackLoopTime=MinTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTauntAttackLoopTimeD0'
    begin object name=MaxTauntAttackLoopTimeD0
    end object
    MaxTauntAttackLoopTime=MaxTauntAttackLoopTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TauntAttackDamageAmountToCauseEndOfTauntD0'
    begin object name=TauntAttackDamageAmountToCauseEndOfTauntD0
    end object
    TauntAttackDamageAmountToCauseEndOfTaunt=TauntAttackDamageAmountToCauseEndOfTauntD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0
    end object
    TauntAttackDurationOfStunAfterGettingGrenadeInMouth=TauntAttackDurationOfStunAfterGettingGrenadeInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0'
    begin object name=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    end object
    TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth=TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeForHiveSwellReactionD0'
    begin object name=MaxTimeForHiveSwellReactionD0
    end object
    MaxTimeForHiveSwellReaction=MaxTimeForHiveSwellReactionD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinTimeBetweenWantingToTryAndKnockDownPofD0'
    begin object name=MinTimeBetweenWantingToTryAndKnockDownPofD0
    end object
    MinTimeBetweenWantingToTryAndKnockDownPof=MinTimeBetweenWantingToTryAndKnockDownPofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SweepHitOnGroundTimeD0'
    begin object name=SweepHitOnGroundTimeD0
    end object
    SweepHitOnGroundTime=SweepHitOnGroundTimeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinTimeBetweenWantingToTryAndTalonBashVsD0'
    begin object name=MinTimeBetweenWantingToTryAndTalonBashVsD0
    end object
    MinTimeBetweenWantingToTryAndTalonBashVs=MinTimeBetweenWantingToTryAndTalonBashVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartKnockdownStrikePofD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartKnockdownStrikePofD0
    end object
    SeperationRquiredAtEndOfMoveToStartKnockdownStrikePof=SeperationRquiredAtEndOfMoveToStartKnockdownStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePofD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePofD0
    end object
    SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePof=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVsD0
    end object
    SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVs=SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvsD0
    end object
    SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvs=SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartComboBashStrikeVsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartComboBashStrikeVsD0
    end object
    SeperationRquiredAtEndOfMoveToStartComboBashStrikeVs=SeperationRquiredAtEndOfMoveToStartComboBashStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvsD0
    end object
    SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvs=SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartPushBackStrikePofD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartPushBackStrikePofD0
    end object
    SeperationRquiredAtEndOfMoveToStartPushBackStrikePof=SeperationRquiredAtEndOfMoveToStartPushBackStrikePofD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartPushBackStrikeVsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartPushBackStrikeVsD0
    end object
    SeperationRquiredAtEndOfMoveToStartPushBackStrikeVs=SeperationRquiredAtEndOfMoveToStartPushBackStrikeVsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvsD0'
    begin object name=SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvsD0
    end object
    SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvs=SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfCellsRequiredToKeepHiveClosedD0'
    begin object name=MinNumberOfCellsRequiredToKeepHiveClosedD0
    end object
    MinNumberOfCellsRequiredToKeepHiveClosed=MinNumberOfCellsRequiredToKeepHiveClosedD0
    HiveMaxNumOfCells=7
    CoreDestoryedEffectSocketToAttachByCore=/* Array type was not detected. */
    BoneAttachPointByCore=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinHealthThatInternalGrenadeExplosionCanNotTakeLessThenD0'
    begin object name=MinHealthThatInternalGrenadeExplosionCanNotTakeLessThenD0
    end object
    minHealthThatInternalGrenadeExplosionCanNotTakeLessThen=MinHealthThatInternalGrenadeExplosionCanNotTakeLessThenD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDamageForInternalGrenadeExplosionInMouthD0'
    begin object name=MinDamageForInternalGrenadeExplosionInMouthD0
    end object
    MinDamageForInternalGrenadeExplosionInMouth=MinDamageForInternalGrenadeExplosionInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDamageForInternalGrenadeExplosionInMouthD0'
    begin object name=MaxDamageForInternalGrenadeExplosionInMouthD0
    end object
    MaxDamageForInternalGrenadeExplosionInMouth=MaxDamageForInternalGrenadeExplosionInMouthD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCellD0'
    begin object name=NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCellD0
    end object
    NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell=NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCellD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfGrenadeStunDefaultObject'
    begin object name=DurationOfGrenadeStunDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DurationOfGrenadeStun=DurationOfGrenadeStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DistanceGrenadeStunnedDefaultObject'
    begin object name=DistanceGrenadeStunnedDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeStunned=DistanceGrenadeStunnedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DistanceGrenadeReactionDefaultObject'
    begin object name=DistanceGrenadeReactionDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceGrenadeReaction=DistanceGrenadeReactionDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bUsePostCellDestroyedAutoBleedD0'
    begin object name=bUsePostCellDestroyedAutoBleedD0
    end object
    bUsePostCellDestroyedAutoBleed=bUsePostCellDestroyedAutoBleedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfCellDestroyedBleedingD0'
    begin object name=DurationOfCellDestroyedBleedingD0
    end object
    DurationOfCellDestroyedBleeding=DurationOfCellDestroyedBleedingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.WaitTimeBetweenCellDestroyedBleedsD0'
    begin object name=WaitTimeBetweenCellDestroyedBleedsD0
    end object
    WaitTimeBetweenCellDestroyedBleeds=WaitTimeBetweenCellDestroyedBleedsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxUpdateDeltaToAllowLowResCellDestroyedBleedD0'
    begin object name=MaxUpdateDeltaToAllowLowResCellDestroyedBleedD0
    end object
    MaxUpdateDeltaToAllowLowResCellDestroyedBleed=MaxUpdateDeltaToAllowLowResCellDestroyedBleedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxUpdateDeltaToAllowHighResCellDestroyedBleedD0'
    begin object name=MaxUpdateDeltaToAllowHighResCellDestroyedBleedD0
    end object
    MaxUpdateDeltaToAllowHighResCellDestroyedBleed=MaxUpdateDeltaToAllowHighResCellDestroyedBleedD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumCellsToExposeFrom_NormalMelee0'
    begin object name=NumCellsToExposeFrom_NormalMelee0
    end object
    NumCellsToExposeFrom_NormalMelee=NumCellsToExposeFrom_NormalMelee0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumCellsToExposeFrom_ShoulderCharge0'
    begin object name=NumCellsToExposeFrom_ShoulderCharge0
    end object
    NumCellsToExposeFrom_ShoulderCharge=NumCellsToExposeFrom_ShoulderCharge0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumCellsToExposeFrom_TwoHandBash0'
    begin object name=NumCellsToExposeFrom_TwoHandBash0
    end object
    NumCellsToExposeFrom_TwoHandBash=NumCellsToExposeFrom_TwoHandBash0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumCellsToExposeFrom_ComboThirdHit0'
    begin object name=NumCellsToExposeFrom_ComboThirdHit0
    end object
    NumCellsToExposeFrom_ComboThirdHit=NumCellsToExposeFrom_ComboThirdHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    end object
    MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    end object
    MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    end object
    MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0'
    begin object name=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    end object
    MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit=MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.StunDurationBoostWhenPlayerLeavesVSA'
    begin object name=StunDurationBoostWhenPlayerLeavesVSA
    end object
    StunDurationBoostWhenPlayerLeavesVS=StunDurationBoostWhenPlayerLeavesVSA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.StunDurationBoostDefendersOnVSA'
    begin object name=StunDurationBoostDefendersOnVSA
    end object
    StunDurationBoostDefendersOnVS=StunDurationBoostDefendersOnVSA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.OverrideVSArmAimAssistTrackSpeedA'
    begin object name=OverrideVSArmAimAssistTrackSpeedA
    end object
    OverrideVSArmAimAssistTrackSpeed=OverrideVSArmAimAssistTrackSpeedA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.OverrideVSArmAimAssistDurationA'
    begin object name=OverrideVSArmAimAssistDurationA
    end object
    OverrideVSArmAimAssistDuration=OverrideVSArmAimAssistDurationA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=360.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=(bEnableMeshTranslation=false,bEnableMeshRotation=false,MaxMeshRotation=0.0000000,MeshRotationSpeed=0.0000000,ConformType=EFloorConformType.EFCT_Floor)
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataDefenderHive.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}