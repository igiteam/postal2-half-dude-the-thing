class LPTuneDataAIPawnStalker extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion)
    hidecategories(Object,Object,ActorStateComponent,AIBurstFire,AmmoTypes,Announce,Attackers,AttackInterruption,AttacksArcs,AttackVolumes,BurstFireRangeAttack,ContextSensitiveAnim,ContinuousAttack,CoreData,DamageReaction,DirectFireRangeAttack,EMP,ExitVS,ForceFeedback,ForkArm,Freeze,IceTrap,Jump,Leychttack,LobFireRangeAttack,Mantle,MovementAimDownSight,MovementAimGrenade,MovementHit,PlayerSprint,RangedLobStrike,ReactiveAttack,SituationAwareness,TempPlaceHolderWeakPoint,WithdrawFromAttack,MortarAttack);

var(0.25_Pct) /*0x03B80000-0x00000000*/ private float MinCoverSize[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DistanceToGrenadeDangerous[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DotProductGoodCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DotProductOkCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DotProductBadCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float MinDotProductForCoverFromEnemyToCover[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DistanceTooCloseToMainEnemy[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DamagedNegativeRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DamagedNegativeRatingTime[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float DamagedNegativeRatingSpreadDistance[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float SameCoverRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float SameCoverRatingTime[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float NoCoverActionRating[65537];
var(0.25_Pct) /*0x03B80000-0x00000000*/ private float NoCoverActionRatingTime[65537];
var(0.25_Pct) /*0x03BA0000-0x00000000*/ private bool SPUseCoversWithoutLineOfFire[65537];
var(0.25_Pct) /*0x03B90000-0x00000000*/ private bool MPUseCoversWithoutLineOfFire[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private bool bCanDoBullStrikes[65537];
var(0.25_Pct) /*0xAA070000-0x00000000*/ private bool EnableReactiveStrikeToPlayerMelee[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private int DamageReactMoving[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MaxTimeShootingFromTheSameCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MinDamageForExtraTimeSameCover[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float ExtraTimeSameCoverWhenLittleDamage[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float MaxTimeNoCoverAction[65537];
var(0.25_Pct) /*0x03B70000-0x00000000*/ private float TimeWaitEnemyChooseCover[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private int DamageToStopShootingInCover[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float DamageReactShootingBack[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float MinDistanceLeechAround[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float MinTimeNoFiringWhenLeechAround[65537];
var(0.25_Pct) /*0x03B40000-0x00000000*/ private float DegreesOutOfViewStartShooting[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MaxTimeChangePosition[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float DamageChangePosition[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float MinTimeAttackFromOpen[65537];
var(0.25_Pct) /*0x03A60000-0x00000000*/ private float DamageShootingBack[65537];
var(0.25_Pct) /*0x056D0000-0x00000000*/ private float AmbushDamageChangeCover[65537];
var(0.25_Pct) /*0x056D0000-0x00000000*/ private float AmbushDistancePlayerTooFar[65537];
var(0.25_Pct) /*0x056D0000-0x00000000*/ private float AmbushTimeChangeCover[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MeleeMinPlayerDistance[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MeleeAmountDamageCancelAttack[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MinSpeedToMovingFalldown[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float CheckDistanceInPlayersBackForBullStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000400*/ private editfixedsize @NULL ProbabilityBullStrikeIfEnoughSpace[589825];
var(0.25_Pct) /*0x8FE10000-0x00000400*/ private editfixedsize @NULL ProbabilityBullStrikeIfNotEnoughSpace[589825];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float DistanceMoveBackAfterBullStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MaxZDiffToAllowStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float DistanceBullStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float DistanceStandardStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MinDistanceStandardStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float DistanceReactiveStrike[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MinTimeReactiveAttack[65537];
var(0.25_Pct) /*0x8FE10000-0x00000400*/ private editfixedsize @NULL MeleeSpeedScale[589825];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float TooCloseToTaunt[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float MinTimeBetweenTaunts[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float SpaceInFrontOfMeToTaunt[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float TimeNoMeleeAttackMin[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float TimeNoMeleeAttackMax[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float TimeHaveToMeleeAttackMin[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float TimeHaveToMeleeAttackMax[65537];
var(0.25_Pct) /*0x8FE10000-0x00000000*/ private float FleeDistanceAfterMelee[65537];
var(0.25_Pct) /*0xAA070000-0x00000000*/ private float ReactiveStrikeToPlayerMeleeAngle[65537];
var(0.25_Pct) /*0xAA070000-0x00000000*/ private float ReactiveStrikeToPlayerMeleeDistance[65537];
var(0.25_Pct) /*0xBB6F0000-0x00000000*/ private float PctgCalloutSoundWhenInCover[65537];
var(0.25_Pct) /*0xBB6F0000-0x00000000*/ private float MinTimeBetweenCalloutSounds[65537];
var(0.25_Pct) /*0xBB6F0000-0x00000000*/ private float MinDistancePlayStrikeWarning[65537];
var(0.25_Pct) /*0xBB6F0000-0x00000000*/ private float MaxDistancePlayStrikeWarning[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowEyeIdle[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowEyeLooking[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowArmsIdle[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowArmsShooting[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowArmsStruggle[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowSpikesIdle[65537];
var(0.25_Pct) /*0x62630000-0x00000000*/ private float GlowSpikesStruggle[65537];
var(0.25_Pct) /*0x67030000-0x00000000*/ private float PctgAltHitReaction[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissMinTimeBetween[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissDegreesOutOfView[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissExtraHeightInMiddleCover[65537];
var(0.25_Pct) /*0xB7D90000-0x00000000*/ private float ShootToMissExtraHeight[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MinTimeToWaitBeforePeeking[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MaxTimeToWaitBeforePeeking[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private int DamageToStopPeeking[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MinPeekingDamageResponseTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MaxPeekingDamageResponseTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MinPeekTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MaxPeekTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MinPeekTimeBeforeFire[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float MaxPeekTimeBeforeFire[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float QuickPeekChance[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float QuickPeekMinTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float QuickPeekMaxTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float QuickPeekMinHideTime[65537];
var(0.25_Pct) /*0xA1680000-0x00000000*/ private float QuickPeekMaxHideTime[65537];

final function UseCoversWithoutLineOfFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4E
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        return SPUseCoversWithoutLineOfFire;        
    }
    else
    {
        return MPUseCoversWithoutLineOfFire;
    }
    //return ReturnValue;    
}

final function GetQuickPeekTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(QuickPeekMinTime, QuickPeekMaxTime);
    //return ReturnValue;    
}

final function GetQuickPeekHideTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(QuickPeekMinHideTime, QuickPeekMaxHideTime);
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

final function GetHideBeforePeekTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(MinTimeToWaitBeforePeeking, MaxTimeToWaitBeforePeeking);
    //return ReturnValue;    
}

final function GetPeekTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(MinPeekTime, MaxPeekTime);
    //return ReturnValue;    
}

final function GetMinPeekBeforeFireTime()
{
    local /*0x97E50000-0x00000000*/ private float CoolDownTimeLeft[8388609], ReturnValue, Time;

    Time = RandRange(MinPeekTimeBeforeFire, MaxPeekTimeBeforeFire);
    // End:0x50
    if(Time < CoolDownTimeLeft)
    {
        Time = CoolDownTimeLeft;
    }
    return Time;
    //return ReturnValue;    
}

defaultproperties
{
    MinCoverSize=90.0000000
    DistanceToGrenadeDangerous=750.0000000
    DotProductGoodCover=0.7500000
    DotProductOkCover=0.5000000
    DotProductBadCover=0.2500000
    DistanceTooCloseToMainEnemy=750.0000000
    DamagedNegativeRating=-100.0000000
    DamagedNegativeRatingTime=18.0000000
    DamagedNegativeRatingSpreadDistance=300.0000000
    SameCoverRating=-100.0000000
    SameCoverRatingTime=30.0000000
    NoCoverActionRating=-100.0000000
    NoCoverActionRatingTime=30.0000000
    SPUseCoversWithoutLineOfFire=true
    bCanDoBullStrikes=true
    EnableReactiveStrikeToPlayerMelee=true
    DamageReactMoving=50
    MaxTimeShootingFromTheSameCover=14.0000000
    MinDamageForExtraTimeSameCover=10.0000000
    ExtraTimeSameCoverWhenLittleDamage=5.0000000
    MaxTimeNoCoverAction=4.0000000
    TimeWaitEnemyChooseCover=4.0000000
    DamageToStopShootingInCover=15
    DamageReactShootingBack=10.0000000
    MinDistanceLeechAround=500.0000000
    MinTimeNoFiringWhenLeechAround=6.0000000
    DegreesOutOfViewStartShooting=60.0000000
    MaxTimeChangePosition=5.0000000
    DamageChangePosition=10.0000000
    MinTimeAttackFromOpen=8.0000000
    DamageShootingBack=5.0000000
    AmbushDamageChangeCover=50.0000000
    AmbushDistancePlayerTooFar=3000.0000000
    AmbushTimeChangeCover=3.0000000
    MeleeMinPlayerDistance=500.0000000
    MeleeAmountDamageCancelAttack=80.0000000
    MinSpeedToMovingFalldown=950.0000000
    CheckDistanceInPlayersBackForBullStrike=800.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ProbabilityBullStrikeIfEnoughSpace0'
    begin object name=ProbabilityBullStrikeIfEnoughSpace0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.7500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ProbabilityBullStrikeIfEnoughSpace=ProbabilityBullStrikeIfEnoughSpace0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ProbabilityBullStrikeIfNotEnoughSpace0'
    begin object name=ProbabilityBullStrikeIfNotEnoughSpace0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ProbabilityBullStrikeIfNotEnoughSpace=ProbabilityBullStrikeIfNotEnoughSpace0
    DistanceMoveBackAfterBullStrike=300.0000000
    MaxZDiffToAllowStrike=100.0000000
    DistanceBullStrike=200.0000000
    DistanceStandardStrike=175.0000000
    MinDistanceStandardStrike=75.0000000
    DistanceReactiveStrike=100.0000000
    MinTimeReactiveAttack=4.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MeleeSpeedScale_Default'
    begin object name=MeleeSpeedScale_Default class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeSpeedScale=MeleeSpeedScale_Default
    TooCloseToTaunt=800.0000000
    MinTimeBetweenTaunts=5.0000000
    SpaceInFrontOfMeToTaunt=250.0000000
    TimeNoMeleeAttackMin=8.0000000
    TimeNoMeleeAttackMax=13.0000000
    TimeHaveToMeleeAttackMin=15.0000000
    TimeHaveToMeleeAttackMax=20.0000000
    FleeDistanceAfterMelee=1000.0000000
    ReactiveStrikeToPlayerMeleeAngle=45.0000000
    ReactiveStrikeToPlayerMeleeDistance=350.0000000
    PctgCalloutSoundWhenInCover=25.0000000
    MinTimeBetweenCalloutSounds=15.0000000
    MinDistancePlayStrikeWarning=350.0000000
    MaxDistancePlayStrikeWarning=800.0000000
    GlowEyeLooking=1.0000000
    GlowArmsShooting=1.0000000
    GlowArmsStruggle=1.0000000
    GlowSpikesStruggle=1.0000000
    PctgAltHitReaction=0.3000000
    ShootToMissMinTimeBetween=15.0000000
    ShootToMissDegreesOutOfView=60.0000000
    ShootToMissExtraHeightInMiddleCover=10.0000000
    ShootToMissExtraHeight=90.0000000
    MinTimeToWaitBeforePeeking=0.5000000
    MaxTimeToWaitBeforePeeking=1.0000000
    DamageToStopPeeking=16
    MinPeekingDamageResponseTime=0.1000000
    MaxPeekingDamageResponseTime=0.3000000
    MinPeekTime=4.5000000
    MaxPeekTime=6.0000000
    MinPeekTimeBeforeFire=0.7500000
    MaxPeekTimeBeforeFire=1.5000000
    QuickPeekChance=0.7500000
    QuickPeekMinTime=0.4000000
    QuickPeekMaxTime=0.9000000
    QuickPeekMinHideTime=0.4000000
    QuickPeekMaxHideTime=0.8000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BurstFireFiringRate'
    begin object name=BurstFireFiringRate class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0010000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BurstFireFiringRate=BurstFireFiringRate
    BurstFireSocketName="Eye"
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    PushAlongImpulse=1000.0000000
    PushUpImpulse=1000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
        baseValue=1.0000000
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
        baseValue=1.0000000
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
        baseValue=1.0000000
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.FleeDistance'
    begin object name=FleeDistance
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
        baseValue=1.0000000
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    CoverStandingMovementSpeedScale=0.5000000
    CoverMiddleMovementSpeedScale=0.5000000
    ClaimCoverDistance=750.0000000
    bCanUseCover=true
    bCanDoBurstFire=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    MinTimeAiming=0.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
        baseValue=3.0000000
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
        baseValue=2.0000000
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
        baseValue=5.0000000
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    BurstFireAccuracyConeMax=(X=5.0000000,Y=5.0000000)
    EnterCoverMinDistance=200.0000000
    EnterCoverMinAngleLookAt=90.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.HealthDefaultObject'
    begin object name=HealthDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Health=HealthDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
        baseValue=800.0000000
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
        baseValue=3000.0000000
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    RotationRate=(Pitch=0,Yaw=131072,Roll=0)
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataAIPawnStalker.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}