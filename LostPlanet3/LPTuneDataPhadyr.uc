class LPTuneDataPhadyr extends LPTuneDataAkrid
    dontsortcategories(StopingLocomotion)
    hidecategories(Object,Object,MortarAttack);

struct PhadyrBoneNameToCoreId
{
    var(0.25_Pct) /*0xA2460000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0xA2460000-0x00000000*/ private byte CoreID[65537];

    structdefaultproperties
    {
        BoneName="None"
        CoreID=ePhadyrCore.ePhadyrCore_Mouth
    }
};

var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenAttacks[589825];
var(0.25_Pct) /*0x8FDC0000-0x00000000*/ private float DefaultStrikeRange[65537];
var(0.25_Pct) /*0x8FDC0000-0x00000400*/ private editfixedsize @NULL RangeToStartAlwaysFacingTargetWhileMovingToIt[589825];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize array BoneAttachPointByCore[589825];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private bool bUseTimeDelayAfterGrenadeGluedBeforeExplosion[65537];
var(0.25_Pct) /*0x2B200000-0x00000000*/ private bool bRandomizePustuleGrowth[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private float HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private float MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion[65537];
var(0.25_Pct) /*0x636E0000-0x00000000*/ private float DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion[65537];
var(0.25_Pct) /*0x636E0000-0x00000400*/ private editfixedsize @NULL AmountToIncreaseGibImpulseByWhenDyingByGrenadeEating[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL ChanceToPerformHeadButtStrike[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinNumberOfStrikeAttemptsWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxNumberOfStrikeAttemptsWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxDurationOfDamageAssessmentWhenDirectAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageRequiredToStopAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageRequiredToStopAttack[589825];
var(0.25_Pct) /*0x47210000-0x00000000*/ private float MaxTimeForJumpBackBeforeDamageAssessment[65537];
var(0.25_Pct) /*0x018B0000-0x00000400*/ private editfixedsize @NULL AcidSpitRange[589825];
var(0.25_Pct) /*0x018B0000-0x00000400*/ private editfixedsize @NULL NumAcidSpitPellets[589825];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private int AcidPelletSpreadHorizontal[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private int AcidPelletSpreadVertical[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private @NULL AcidSpitTracerScale[65537];
var(0.25_Pct) /*0x018B0000-0x00000400*/ private editfixedsize @NULL DamagePerAcidBlob[589825];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private float MomentumPerAcidBlob[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private float AcidBlobTracerProjectileSpeed[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private float AcidBlobTracerProjectileMaxSpeed[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private @NULL AcidBlobTracerSmokeTrailEffect[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private class AcidBlobTracerSmokeEmitterSpawnableClass[65537];
var(0.25_Pct) /*0x018B0000-0x00000000*/ private float AcidBlobLifeTimeBuffer[65537];
var(0.25_Pct) /*0x018B0000-0x00000400*/ private editfixedsize @NULL MinRangeForAcidSpitStrike[589825];
var(0.25_Pct) /*0x018B0000-0x00000400*/ private editfixedsize @NULL DesiredRangeForAcidSpitStrike[589825];
var(0.25_Pct) /*0x018B0000-0x00000400*/ private editfixedsize @NULL FireAllAcidBallsUpdateRate[589825];
var(0.25_Pct) /*0xBA780000-0x00000400*/ private editfixedsize @NULL MaxSeperationForMedRangeSlowPreyDownAttack[589825];
var(0.25_Pct) /*0xBA780000-0x00000400*/ private editfixedsize @NULL MinSeperationForMedRangeSlowPreyDownAttack[589825];
var(0.25_Pct) /*0xBA780000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenMedRangeSlowPreyDownAttack[589825];
var(0.25_Pct) /*0xBA780000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenMedRangeSlowPreyDownAttack[589825];
var(0.25_Pct) /*0xBA780000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenChecksForMedRangeSlowPreyDownAttack[589825];
var(0.25_Pct) /*0xBA780000-0x00000400*/ private editfixedsize @NULL RadiusOfCheckForMedRangeSlowPreyDownAttack[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL bCanDoLongRangeLobAttack[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL MinDelayBetweenLongRangeLobAttack[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenLongRangeLobAttack[589825];
var(0.25_Pct) /*0xA9640000-0x00000400*/ private editfixedsize @NULL MaxDelayBetweenChecksForLongRangeAttack[589825];
var(0.25_Pct) /*0x2B200000-0x00000400*/ private editfixedsize array PustuleGrowthDataList[589825];
var(0.25_Pct) /*0x2B200000-0x00000000*/ private float DamagePustuleDefaultSkelCtrlStrength[65537];
var(0.25_Pct) /*0x2B200000-0x00000000*/ private float DamagePustuleDefaultSkelCtrlBlendInTime[65537];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitHorizontalImpulse[589825];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitUpwardImpulse[589825];
var(0.25_Pct) /*0x90110000-0x00000400*/ private editfixedsize @NULL MeleeHitImpulseSizeFactor[589825];
var(0.25_Pct) /*0x26C90000-0x00000400*/ private editfixedsize @NULL SeperationToStopMovingToSlotAndJustAttack[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL bAllowedToTurtle[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL MaxTimeForGoingIntoTurtleSM[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL MaxTimeForCommingOutOfTurtleSM[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL MinAmountOfDamageToCauseTurtle[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL MaxAmountOfDamageToCauseTurtle[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL MinTimeToTurtle[589825];
var(0.25_Pct) /*0xCFDB0000-0x00000400*/ private editfixedsize @NULL MaxTimeToTurtle[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinTimeBetweenAttacksDefaultObject'
    begin object name=MinTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenAttacks=MinTimeBetweenAttacksDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeBetweenAttacksDefaultObject'
    begin object name=MaxTimeBetweenAttacksDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenAttacks=MaxTimeBetweenAttacksDefaultObject
    DefaultStrikeRange=300.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RangeToStartAlwaysFacingTargetWhileMovingToItD0'
    begin object name=RangeToStartAlwaysFacingTargetWhileMovingToItD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RangeToStartAlwaysFacingTargetWhileMovingToIt=RangeToStartAlwaysFacingTargetWhileMovingToItD0
    BoneAttachPointByCore=/* Array type was not detected. */
    bRandomizePustuleGrowth=true
    HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion=1.0450000
    MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion=2.0000000
    DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AmountToIncreaseGibImpulseByWhenDyingByGrenadeEatingD0'
    begin object name=AmountToIncreaseGibImpulseByWhenDyingByGrenadeEatingD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountToIncreaseGibImpulseByWhenDyingByGrenadeEating=AmountToIncreaseGibImpulseByWhenDyingByGrenadeEatingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MinNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumberOfStrikeAttemptsWhenDirectAttack=MinNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxNumberOfStrikeAttemptsWhenDirectAttackD0'
    begin object name=MaxNumberOfStrikeAttemptsWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfStrikeAttemptsWhenDirectAttack=MaxNumberOfStrikeAttemptsWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDurationOfDamageAssessmentWhenDirectAttackD0'
    begin object name=MaxDurationOfDamageAssessmentWhenDirectAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDurationOfDamageAssessmentWhenDirectAttack=MaxDurationOfDamageAssessmentWhenDirectAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinAmountOfDamageRequiredToStopAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageRequiredToStopAttack=MinAmountOfDamageRequiredToStopAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxAmountOfDamageRequiredToStopAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageRequiredToStopAttack=MaxAmountOfDamageRequiredToStopAttackD0
    MaxTimeForJumpBackBeforeDamageAssessment=10.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AcidSpitRangeD0'
    begin object name=AcidSpitRangeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AcidSpitRange=AcidSpitRangeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.NumAcidSpitPelletsD0'
    begin object name=NumAcidSpitPelletsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumAcidSpitPellets=NumAcidSpitPelletsD0
    AcidPelletSpreadHorizontal=4000
    AcidPelletSpreadVertical=4000
    AcidSpitTracerScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DamagePerAcidBlobD0'
    begin object name=DamagePerAcidBlobD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamagePerAcidBlob=DamagePerAcidBlobD0
    MomentumPerAcidBlob=5000.0000000
    AcidBlobTracerProjectileSpeed=450.0000000
    AcidBlobTracerProjectileMaxSpeed=600.0000000
    AcidBlobTracerSmokeEmitterSpawnableClass=Class'LPEmitterSpawnable'
    AcidBlobLifeTimeBuffer=0.1000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinRangeForAcidSpitStrikeD0'
    begin object name=MinRangeForAcidSpitStrikeD0
    end object
    MinRangeForAcidSpitStrike=MinRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DesiredRangeForAcidSpitStrikeD0'
    begin object name=DesiredRangeForAcidSpitStrikeD0
    end object
    DesiredRangeForAcidSpitStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.FireAllAcidBallsUpdateRateD0'
    begin object name=FireAllAcidBallsUpdateRateD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0400000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FireAllAcidBallsUpdateRate=FireAllAcidBallsUpdateRateD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MaxSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MaxSeperationForMedRangeSlowPreyDownAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinSeperationForMedRangeSlowPreyDownAttackD0'
    begin object name=MinSeperationForMedRangeSlowPreyDownAttackD0
    end object
    MinSeperationForMedRangeSlowPreyDownAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenMedRangeSlowPreyDownAttackD0'
    begin object name=MinDelayBetweenMedRangeSlowPreyDownAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenMedRangeSlowPreyDownAttack=MinDelayBetweenMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenMedRangeSlowPreyDownAttackD0'
    begin object name=MaxDelayBetweenMedRangeSlowPreyDownAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenMedRangeSlowPreyDownAttack=MaxDelayBetweenMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RadiusOfCheckForMedRangeSlowPreyDownAttackD0'
    begin object name=RadiusOfCheckForMedRangeSlowPreyDownAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RadiusOfCheckForMedRangeSlowPreyDownAttack=RadiusOfCheckForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bCanDoLongRangeLobAttackD0'
    begin object name=bCanDoLongRangeLobAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bCanDoLongRangeLobAttack=bCanDoLongRangeLobAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenLongRangeLobAttackD0'
    begin object name=MinDelayBetweenLongRangeLobAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayBetweenLongRangeLobAttack=MinDelayBetweenLongRangeLobAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenLongRangeLobAttackD0'
    begin object name=MaxDelayBetweenLongRangeLobAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenLongRangeLobAttack=MaxDelayBetweenLongRangeLobAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenChecksForLongRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForLongRangeAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxDelayBetweenChecksForLongRangeAttack=MaxDelayBetweenChecksForLongRangeAttackD0
    PustuleGrowthDataList=/* Array type was not detected. */
    DamagePustuleDefaultSkelCtrlStrength=1.0000000
    DamagePustuleDefaultSkelCtrlBlendInTime=0.1000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MeleeHitHorizontalImpulseD0'
    begin object name=MeleeHitHorizontalImpulseD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitHorizontalImpulse=MeleeHitHorizontalImpulseD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MeleeHitUpwardImpulseD0'
    begin object name=MeleeHitUpwardImpulseD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitUpwardImpulse=MeleeHitUpwardImpulseD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MeleeHitImpulseSizeFactorD0'
    begin object name=MeleeHitImpulseSizeFactorD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=110.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MeleeHitImpulseSizeFactor=MeleeHitImpulseSizeFactorD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SeperationToStopMovingToSlotAndJustAttackD0'
    begin object name=SeperationToStopMovingToSlotAndJustAttackD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SeperationToStopMovingToSlotAndJustAttack=SeperationToStopMovingToSlotAndJustAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bAllowedToTurtleD0'
    begin object name=bAllowedToTurtleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowedToTurtle=bAllowedToTurtleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeForGoingIntoTurtleSMD0'
    begin object name=MaxTimeForGoingIntoTurtleSMD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForGoingIntoTurtleSM=MaxTimeForGoingIntoTurtleSMD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeForCommingOutOfTurtleSMD0'
    begin object name=MaxTimeForCommingOutOfTurtleSMD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeForCommingOutOfTurtleSM=MaxTimeForCommingOutOfTurtleSMD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinAmountOfDamageToCauseTurtleD0'
    begin object name=MinAmountOfDamageToCauseTurtleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAmountOfDamageToCauseTurtle=MinAmountOfDamageToCauseTurtleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxAmountOfDamageToCauseTurtleD0'
    begin object name=MaxAmountOfDamageToCauseTurtleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAmountOfDamageToCauseTurtle=MaxAmountOfDamageToCauseTurtleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinTimeToTurtleD0'
    begin object name=MinTimeToTurtleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeToTurtle=MinTimeToTurtleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeToTurtleD0'
    begin object name=MaxTimeToTurtleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeToTurtle=MaxTimeToTurtleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.NumProjectilesPerBurst'
    begin object name=NumProjectilesPerBurst
    end object
    NumProjectilesPerBurst=NumProjectilesPerBurst
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.NumProjectilesPerBurstVariance'
    begin object name=NumProjectilesPerBurstVariance
    end object
    NumProjectilesPerBurstVariance=NumProjectilesPerBurstVariance
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BurstFireFiringRate'
    begin object name=BurstFireFiringRate
    end object
    BurstFireFiringRate=BurstFireFiringRate
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BurstFireProjectileVelocityMin'
    begin object name=BurstFireProjectileVelocityMin
    end object
    BurstFireProjectileVelocityMin=BurstFireProjectileVelocityMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BurstFireProjectileVelocityMax'
    begin object name=BurstFireProjectileVelocityMax
    end object
    BurstFireProjectileVelocityMax=BurstFireProjectileVelocityMax
    MaxSeperationForDirectBurstFireRangeAttack=MaxSeperationForMedRangeSlowPreyDownAttackD0
    MinSeperationForDirectBurstFireRangeAttack=MinSeperationForMedRangeSlowPreyDownAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MaxDelayBetweenChecksForDirectBurstFireRangeAttack=MaxDelayBetweenChecksForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenChecksForDirectBurstFireRangeAttackD0'
    begin object name=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    end object
    MinDelayBetweenChecksForDirectBurstFireRangeAttack=MinDelayBetweenChecksForDirectBurstFireRangeAttackD0
    MinRangeForDirectBurstFireProjectileStrike=MinRangeForAcidSpitStrikeD0
    DesiredRangeForDirectBurstFireProjectileStrike=DesiredRangeForAcidSpitStrikeD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RadiusOfCheckForDirectBurstFireRangeAttackD0'
    begin object name=RadiusOfCheckForDirectBurstFireRangeAttackD0
    end object
    RadiusOfCheckForDirectBurstFireRangeAttack=RadiusOfCheckForDirectBurstFireRangeAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0'
    begin object name=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    end object
    MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate=MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdateD0
    FactorToIncreaseLongRageLobBy=10.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DirectFireLaunchVelocityD0'
    begin object name=DirectFireLaunchVelocityD0
    end object
    DirectFireLaunchVelocity=DirectFireLaunchVelocityD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.HowMuchToIncreaseHealthByWhenConsumingGrenadeD0'
    begin object name=HowMuchToIncreaseHealthByWhenConsumingGrenadeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HowMuchToIncreaseHealthByWhenConsumingGrenade=HowMuchToIncreaseHealthByWhenConsumingGrenadeD0
    HowMuchToIncreaseSizeByWhenConsumingGrenade=1.1000000
    MaxSizeToIncreaseSizeByWhenConsumingGrenade=2.5000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0'
    begin object name=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    end object
    DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions=DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptionsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bDisableAllAiWhileSpawningFromHiveD0'
    begin object name=bDisableAllAiWhileSpawningFromHiveD0
    end object
    bDisableAllAiWhileSpawningFromHive=bDisableAllAiWhileSpawningFromHiveD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TimeAfterStartOfOnFirePanicToForceKillD0'
    begin object name=TimeAfterStartOfOnFirePanicToForceKillD0
    end object
    TimeAfterStartOfOnFirePanicToForceKill=TimeAfterStartOfOnFirePanicToForceKillD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0'
    begin object name=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    end object
    MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath=MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeathD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DamagePercentageForNonCoreHitDefaultObject'
    begin object name=DamagePercentageForNonCoreHitDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    damagePercentageForNonCoreHit=DamagePercentageForNonCoreHitDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bShouldBeInSemiGodWhenOnAnimatedPathsD0'
    begin object name=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    end object
    bShouldBeInSemiGodWhenOnAnimatedPaths=bShouldBeInSemiGodWhenOnAnimatedPathsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.NormalMaxSpeedScale_Tunable_Default'
    begin object name=NormalMaxSpeedScale_Tunable_Default
    end object
    NormalMaxSpeedScale_Tunable=NormalMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.WanderingMaxSpeedScale_Tunable_Default'
    begin object name=WanderingMaxSpeedScale_Tunable_Default
    end object
    WanderingMaxSpeedScale_Tunable=WanderingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.FleeingMaxSpeedScale_Tunable_Default'
    begin object name=FleeingMaxSpeedScale_Tunable_Default
    end object
    FleeingMaxSpeedScale_Tunable=FleeingMaxSpeedScale_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.FleeDistance'
    begin object name=FleeDistance class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FleeDistance=FleeDistance
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinFleeTime'
    begin object name=MinFleeTime
    end object
    MinFleeTime=MinFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxFleeTime'
    begin object name=MaxFleeTime
    end object
    MaxFleeTime=MaxFleeTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.ForkArmGrabPressureDepletionRateA'
    begin object name=ForkArmGrabPressureDepletionRateA
    end object
    ForkArmGrabPressureDepletionRate=ForkArmGrabPressureDepletionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.ForkArmGrabRightArmUseDepetionRateA'
    begin object name=ForkArmGrabRightArmUseDepetionRateA
    end object
    ForkArmGrabRightArmUseDepetionRate=ForkArmGrabRightArmUseDepetionRateA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VSMeleeDamagePauseDurationDefaultObject'
    begin object name=VSMeleeDamagePauseDurationDefaultObject
    end object
    VSMeleeDamagePauseDuration=VSMeleeDamagePauseDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VSMeleeStunDurationDefaultObject'
    begin object name=VSMeleeStunDurationDefaultObject
    end object
    VSMeleeStunDuration=VSMeleeStunDurationDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DurationOfShockStunDefaultObject'
    begin object name=DurationOfShockStunDefaultObject
    end object
    DurationOfShockStun=DurationOfShockStunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BaseDamageTrackingWindowInSecondsD0'
    begin object name=BaseDamageTrackingWindowInSecondsD0
    end object
    BaseDamageTrackingWindowInSeconds=BaseDamageTrackingWindowInSecondsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SecondsUntilWinchEscapeDefaultObject'
    begin object name=SecondsUntilWinchEscapeDefaultObject
    end object
    SecondsUntilWinchEscape=SecondsUntilWinchEscapeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bSpitOutGrenadeOnAnimNotifyRejectingD0'
    begin object name=bSpitOutGrenadeOnAnimNotifyRejectingD0
    end object
    bSpitOutGrenadeOnAnimNotifyRejecting=bSpitOutGrenadeOnAnimNotifyRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MinTimeToExplosionGiveToGrenadeWhenRejecting=MinTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeToExplosionGiveToGrenadeWhenRejectingD0'
    begin object name=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    end object
    MaxTimeToExplosionGiveToGrenadeWhenRejecting=MaxTimeToExplosionGiveToGrenadeWhenRejectingD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.WantsNewEnemyPenalty_Default'
    begin object name=WantsNewEnemyPenalty_Default
    end object
    WantsNewEnemyPenalty=WantsNewEnemyPenalty_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TimePenaltyForEnemyInCover_Default'
    begin object name=TimePenaltyForEnemyInCover_Default
    end object
    TimePenaltyForEnemyInCover=TimePenaltyForEnemyInCover_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RangeFromPawnToStartWinchAssistD0'
    begin object name=RangeFromPawnToStartWinchAssistD0
    end object
    RangeFromPawnToStartWinchAssist=RangeFromPawnToStartWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AngleInDegreesInFrontOfPawnToAllowWinchAssistD0'
    begin object name=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    end object
    AngleInDegreesInFrontOfPawnToAllowWinchAssist=AngleInDegreesInFrontOfPawnToAllowWinchAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0'
    begin object name=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    end object
    bUsePawnToWinchLauncherDirInsteadOfSocketRotation=bUsePawnToWinchLauncherDirInsteadOfSocketRotationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bUsePawnsLocationInsteadOfWinchTargetSocketLocD0'
    begin object name=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    end object
    bUsePawnsLocationInsteadOfWinchTargetSocketLoc=bUsePawnsLocationInsteadOfWinchTargetSocketLocD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinAmountOfDamageForTripAndPlowInD0'
    begin object name=MinAmountOfDamageForTripAndPlowInD0
    end object
    MinAmountOfDamageForTripAndPlowIn=MinAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxAmountOfDamageForTripAndPlowInD0'
    begin object name=MaxAmountOfDamageForTripAndPlowInD0
    end object
    MaxAmountOfDamageForTripAndPlowIn=MaxAmountOfDamageForTripAndPlowInD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject'
    begin object name=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    end object
    MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway=MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAwayDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DistanceAwayToStartLookingForWithdrawPointDefaultObject'
    begin object name=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    end object
    DistanceAwayToStartLookingForWithdrawPoint=DistanceAwayToStartLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject'
    begin object name=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    end object
    MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint=MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject'
    begin object name=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    end object
    MaxTimeFindWithdrawToSpotTraversalAllowedToRun=MaxTimeFindWithdrawToSpotTraversalAllowedToRunDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject'
    begin object name=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    end object
    PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased=PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleasedDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0'
    begin object name=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    end object
    MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFire=MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenOnFireD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenStrikeAttemptsD0'
    begin object name=MinDelayBetweenStrikeAttemptsD0
    end object
    MinDelayBetweenStrikeAttempts=MinDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenStrikeAttemptsD0'
    begin object name=MaxDelayBetweenStrikeAttemptsD0
    end object
    MaxDelayBetweenStrikeAttempts=MaxDelayBetweenStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackStrikeAttempts=MinDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenContinuousAttackStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackStrikeAttempts=MaxDelayBetweenContinuousAttackStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MinDelayBetweenContinuousAttackMustStrikeAttempts=MinDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenContinuousAttackMustStrikeAttempts0'
    begin object name=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    end object
    MaxDelayBetweenContinuousAttackMustStrikeAttempts=MaxDelayBetweenContinuousAttackMustStrikeAttempts0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MinDelayBetweenContinuousAttackStrikeWarningRattles=MinDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenContinuousAttackStrikeWarningRattles0'
    begin object name=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    end object
    MaxDelayBetweenContinuousAttackStrikeWarningRattles=MaxDelayBetweenContinuousAttackStrikeWarningRattles0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bShouldPerformAnnounceAtStartOfContinuousAttack0'
    begin object name=bShouldPerformAnnounceAtStartOfContinuousAttack0
    end object
    bShouldPerformAnnounceAtStartOfContinuousAttack=bShouldPerformAnnounceAtStartOfContinuousAttack0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MinNumberOfStrikesToAttemptPerReactiveAttack=MinNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxNumberOfStrikesToAttemptPerReactiveAttackD0'
    begin object name=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    end object
    MaxNumberOfStrikesToAttemptPerReactiveAttack=MaxNumberOfStrikesToAttemptPerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MinAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MinAmountOfDamageRequiredToStopReactiveAttack=MinAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxAmountOfDamageRequiredToStopReactiveAttackD0'
    begin object name=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    end object
    MaxAmountOfDamageRequiredToStopReactiveAttack=MaxAmountOfDamageRequiredToStopReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DelayAfterPhysicalAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterPhysicalAttackToResetReactiveAttackFlag=DelayAfterPhysicalAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DelayAfterReactiveAttackToResetReactiveAttackFlagD0'
    begin object name=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    end object
    DelayAfterReactiveAttackToResetReactiveAttackFlag=DelayAfterReactiveAttackToResetReactiveAttackFlagD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxSeperationToTriggerReactiveAttackD0'
    begin object name=MaxSeperationToTriggerReactiveAttackD0
    end object
    MaxSeperationToTriggerReactiveAttack=MaxSeperationToTriggerReactiveAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxEnemyHitPointsToStartStruggleD0'
    begin object name=MaxEnemyHitPointsToStartStruggleD0
    end object
    MaxEnemyHitPointsToStartStruggle=MaxEnemyHitPointsToStartStruggleD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DefaultMovementZDiffAllowanceFactorD0'
    begin object name=DefaultMovementZDiffAllowanceFactorD0
    end object
    DefaultMovementZDiffAllowanceFactor=DefaultMovementZDiffAllowanceFactorD0
    RangedLobStrikeInfoByZone=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.IntentionalLobMissChanceD0'
    begin object name=IntentionalLobMissChanceD0
    end object
    IntentionalLobMissChance=IntentionalLobMissChanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.IntentionalLobMissPercentOfArcToCheckForCalcD0'
    begin object name=IntentionalLobMissPercentOfArcToCheckForCalcD0
    end object
    IntentionalLobMissPercentOfArcToCheckForCalc=IntentionalLobMissPercentOfArcToCheckForCalcD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch=ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0'
    begin object name=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    end object
    ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch=ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DefaultMinNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerAttack=DefaultMinNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DefaultMaxNumberOfRangedStrikesPerAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerAttack=DefaultMaxNumberOfRangedStrikesPerAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxFindLobStrikeLocTraversalDistanceD0'
    begin object name=MaxFindLobStrikeLocTraversalDistanceD0
    end object
    MaxFindLobStrikeLocTraversalDistance=MaxFindLobStrikeLocTraversalDistanceD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0'
    begin object name=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    end object
    MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded=MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeededD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MinDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MinDelayBetweenMortarLobStrikeAttempts=MinDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenMortarLobStrikeAttemptsD0'
    begin object name=MaxDelayBetweenMortarLobStrikeAttemptsD0
    end object
    MaxDelayBetweenMortarLobStrikeAttempts=MaxDelayBetweenMortarLobStrikeAttemptsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DefaultMinNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMinNumberOfRangedStrikesPerMortarAttack=DefaultMinNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DefaultMaxNumberOfRangedStrikesPerMortarAttackD0'
    begin object name=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    end object
    DefaultMaxNumberOfRangedStrikesPerMortarAttack=DefaultMaxNumberOfRangedStrikesPerMortarAttackD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0'
    begin object name=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    end object
    DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom=DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    end object
    SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom=SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFromD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0'
    begin object name=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    end object
    SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer=SearchForAltToFormationLocPointToStrikeFromDistanceErrorBufferD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinDelayBetweenAttacksA'
    begin object name=MinDelayBetweenAttacksA
    end object
    MinDelayBetweenAttacks=MinDelayBetweenAttacksA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxDelayBetweenAttacksA'
    begin object name=MaxDelayBetweenAttacksA
    end object
    MaxDelayBetweenAttacks=MaxDelayBetweenAttacksA
    DefendVolumeMovesToPlay=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BleedRateObject'
    begin object name=BleedRateObject
    end object
    BleedRate=BleedRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BleedDamageObject'
    begin object name=BleedDamageObject
    end object
    BleedDamage=BleedDamageObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BleedCountObject'
    begin object name=BleedCountObject
    end object
    BleedCount=BleedCountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BleedAmountObject'
    begin object name=BleedAmountObject
    end object
    BleedAmount=BleedAmountObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.BleedAmountVarianceObject'
    begin object name=BleedAmountVarianceObject
    end object
    BleedAmountVariance=BleedAmountVarianceObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    RadarParams=(IconType=EMapIconTypes.EMapIcon_GenericRed,bIconStaysOnEdge=true)
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0100000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    FloorConformInfo=(ConformType=EFloorConformType.EFCT_Floor)
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPhadyr.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}