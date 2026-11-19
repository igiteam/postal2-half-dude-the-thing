class LPTuneDataPawn extends SPGFTuneDataPawn
    abstract
    hidecategories(Object,Object);

var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthRegenDelay[65537];
var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthRegenRate[65537];
var(0.25_Pct) /*0x66270000-0x00000400*/ private editfixedsize @NULL HealthRegenRateDifficultyModifier[589825];
var(0.25_Pct) /*0x66270000-0x00000400*/ private editfixedsize @NULL HealthRegenDelayDifficultyModifier[589825];
var(0.25_Pct) /*0x50620000-0x00000400*/ private editfixedsize @NULL EMPDisruptionDuration[589825];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float HealthRegenDelay_MP[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float HealthRegenRate_MP[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float CreditsAwardedPerDamage[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private int BonusCreditsAwardedForKill[65537];
var(0.25_Pct) /*0xA8A20000-0x00000000*/ private @NULL RadarParams[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float TimeFreeze[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float TimeFreezeRagdoll[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float TimeFreezeParts[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float MaxTimeAnimationFreeze[65537];
var(0.25_Pct) /*0x5A190000-0x00000400*/ private editfixedsize @NULL MinTimeExplodeAfterFreeze[589825];
var(0.25_Pct) /*0x5A190000-0x00000400*/ private editfixedsize @NULL MaxTimeExplodeAfterFreeze[589825];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float MaxTimeNoMovementAfterFreeze[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float MaxTimeAfterFreeze[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float StrengthExplodeAfterFreeze[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private @NULL OffsetExplodeEffectAfterFreeze[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private bool AutoExplodeOnlyOneEffect[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private bool DebugDontDestroyPawn[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private bool bDropTEnergyOnDeath[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private bool bDropTEnergyOnFreeze[65537];
var(0.25_Pct) /*0xD3910000-0x00000000*/ private bool bShouldPlayRetractAnimWhenGrabbed[65537];
var(0.25_Pct) /*0x493E0000-0x00000000*/ private bool bCanBeTagged[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float SizeFractureMeshPartTooBig[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float MinTimeDestroyPartTooBig[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float MaxTimeDestroyPartTooBig[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private float PlayerMeleeDamageScale[65537];
var(0.25_Pct) /*0x5A190000-0x00000000*/ private @NULL SwapTranslationAdjustment[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL TEnergyCount[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL TEnergyDropMin[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL TEnergyDropMax[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL TEnergyDecayBegin[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL TEnergyDecayEnd[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL TEnergyMaxLimit[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float TEnergyScale[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float TEnergySpread[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private float TEnergySpreadRate[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private name TEnergyDropParticles[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000000*/ private class TEnergyContentClass[65537];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL AmountToDrainPerDrillerShot[589825];
var(0.25_Pct) /*0xC9FC0000-0x00000400*/ private editfixedsize @NULL AmountToDrainPerDrillerShotVariance[589825];
var(0.25_Pct) /*0x25C40000-0x00000400*/ private editfixedsize array ActiveDefenseWindows[589825];
var(0.25_Pct) /*0x25C40000-0x00000400*/ private editfixedsize array ForkArmWindows[589825];
var(0.25_Pct) /*0x25C40000-0x00000400*/ private editfixedsize array MeleeWindows[589825];
var(0.25_Pct) /*0x25C40000-0x00000400*/ private editfixedsize array VSMeleeInterruptWindows[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL bAllowTheVsToDamageThisTypeOfPawnOnMovementHit[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL MinVelocityForVsToCountAsKnockBackHit[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL DelayBetweenAllowedVsKnockBackHits[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL SpeedToUseLargeReactionWhenHitByVS[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL DamageToThisTypeOfPawnFromSlowVsKnockBackHit[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL DamageToThisTypeOfPawnFromFastVsKnockBackHit[589825];
var(0.25_Pct) /*0xD3910000-0x00000000*/ private class DamageTypeFromSlowVsKnockBackHit[65537];
var(0.25_Pct) /*0xD3910000-0x00000000*/ private class DamageTypeFromFastVsKnockBackHit[65537];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL bAllowVsKnockBackHitOnTouch[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL bAllowVsKnockBackHitOnBump[589825];
var(0.25_Pct) /*0xD3910000-0x00000000*/ private name SocketNameToAttachToWhenGrabbedByVs[65537];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL OverrideVSArmAimAssistTrackSpeed[589825];
var(0.25_Pct) /*0xD3910000-0x00000400*/ private editfixedsize @NULL OverrideVSArmAimAssistDuration[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL RequiredNumTags[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL RequiredTagHoverTime[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL DNATaggingQuestObjective[589825];
var(0.25_Pct) /*0x493E0000-0x00000000*/ private @NULL DNATagUIOffset[65537];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL VSMeleeDamageForFullHitReactionDecayRate[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL VSMeleeDamageForFullHitReaction[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL VSMeleeDamageForStunDecayRate[589825];
var(0.25_Pct) /*0x2B350000-0x00000400*/ private editfixedsize @NULL VSMeleeDamageForStun[589825];
var(0.25_Pct) /*0x2B350000-0x00000000*/ private float PushSpeedWhenMeleeHit[65537];
var(0.25_Pct) /*0x2B350000-0x00000000*/ private float PauseAnimationDurationOnPlayerMeleeDamage[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000000*/ private editfixedsize array WinchExclusionBodies[65537];
var(0.25_Pct) /*0xD6FB0000-0x00000400*/ private editfixedsize @NULL WinchAutoTargetAngle[589825];
var(0.25_Pct) /*0x76980000-0x00000000*/ private float HealthPercentForLowHealthCSA[65537];
var(0.25_Pct) /*0x76980000-0x00000000*/ private float HealthPercentToStopUsingLowHealthCSA[65537];
var(0.25_Pct) /*0x01E10000-0x00000400*/ private editfixedsize @NULL ActiveDefenseScale[589825];

// Export ULPTuneDataPawn::execGetHealthRegenDelayModifier(FFrame&, void* const)
native function GetHealthRegenDelayModifier()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPTuneDataPawn::execGetHealthRegenRate(FFrame&, void* const)
native function GetHealthRegenRate()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPTuneDataPawn::execGetHealthRegenDelay(FFrame&, void* const)
native function GetHealthRegenDelay()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated function GetDamageMultiplier()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609], EnemyPawn;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    HealthRegenDelay_MP=4.0000000
    HealthRegenRate_MP=20.0000000
    RadarParams=(IconType=EMapIconTypes.EMapIcon_GenericBlue,bIconStaysOnEdge=false,bRotatesWithActor=true)
    TimeFreeze=3.0000000
    TimeFreezeRagdoll=1.0000000
    TimeFreezeParts=3.0000000
    MaxTimeAnimationFreeze=3.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    MaxTimeAfterFreeze=5.0000000
    StrengthExplodeAfterFreeze=50.0000000
    AutoExplodeOnlyOneEffect=true
    bDropTEnergyOnDeath=true
    bCanBeTagged=true
    SizeFractureMeshPartTooBig=31000.0000000
    MinTimeDestroyPartTooBig=120.0000000
    MaxTimeDestroyPartTooBig=240.0000000
    PlayerMeleeDamageScale=10.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.TEnergyCountObj'
    begin object name=TEnergyCountObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    TEnergyScale=1.0000000
    TEnergySpread=100.0000000
    TEnergySpreadRate=2.0000000
    TEnergyDropParticles="TEnergyDropMedium"
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    DamageTypeFromSlowVsKnockBackHit=Class'LPDamageTypeVsSlowKnockBackHit'
    DamageTypeFromFastVsKnockBackHit=Class'LPDamageTypeVsFastKnockBackHit'
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    SocketNameToAttachToWhenGrabbedByVs="ClawAttachGrabbedPawn"
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.RequiredNumTags0'
    begin object name=RequiredNumTags0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    PauseAnimationDurationOnPlayerMeleeDamage=0.0700000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    HealthPercentForLowHealthCSA=0.2000000
    HealthPercentToStopUsingLowHealthCSA=0.3000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
    SnowTrailTestDistanceThreshold=5.0000000
    SnowTrailLineExtendAmount=10.0000000
    SnowTrailMeshCapacity=44
    SnowTrailMeshCountPerLightEnvironment=2
    SnowTrailScaleOutCountStart=40
    SnowTrailLifetime=10.0000000
    SnowTrailScaleOutTime=0.5000000
    SnowTrailViewDistanceMax=3000.0000000
}