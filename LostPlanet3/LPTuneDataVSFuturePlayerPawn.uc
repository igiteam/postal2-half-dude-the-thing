class LPTuneDataVSFuturePlayerPawn extends LPTuneDataVSPlayerPawn
    dontsortcategories(Attackers,PackHunterStaticFormationAttack)
    hidecategories(Object,Object,CustomScreenEffectManagement);

struct native VSDamageParticles
{
    var(0.25_Pct) /*0xD3E40000-0x00000000*/ private name SocketName[65537];
    var(0.25_Pct) /*0xD3E40000-0x00000000*/ private @NULL ParticleSystem[65537];

    structdefaultproperties
    {
        SocketName="None"
        ParticleSystem=none
    }
};

struct native VSDamageThresholds
{
    var(0.25_Pct) /*0xD3E30000-0x00000000*/ private float DamageEffectsThresholdMin[65537];
    var(0.25_Pct) /*0xD3E30000-0x00000000*/ private float DamageEffectsThresholdMax[65537];
    var(0.25_Pct) /*0xD3E30000-0x00000000*/ private editfixedsize array DamageParticles[65537];
    var(0.25_Pct) /*0xD3E30000-0x00000000*/ private editfixedsize array DamageSounds[65537];

    structdefaultproperties
    {
        DamageEffectsThresholdMin=0.0000000
        DamageEffectsThresholdMax=0.0000000
        DamageParticles=none
        DamageSounds=none
    }
};

var(0.25_Pct) /*0xD5530000-0x00000400*/ private editfixedsize @NULL RearWeakSpotAngle[589825];
var(0.25_Pct) /*0xD5530000-0x00000400*/ private editfixedsize @NULL RearWeakSpotDamageBonus[589825];
var(0.25_Pct) /*0x2BA70000-0x00000400*/ private editfixedsize @NULL DashSpeed[589825];
var(0.25_Pct) /*0x2BA70000-0x00000400*/ private editfixedsize @NULL DashDuration[589825];
var(0.25_Pct) /*0x2BA70000-0x00000400*/ private editfixedsize @NULL DashDecelerationRate[589825];
var(0.25_Pct) /*0x2BA70000-0x00000400*/ private editfixedsize @NULL DashCooldownTime[589825];
var(0.25_Pct) /*0xD3EB0000-0x00000000*/ private float TimeBetweenCriticalAndExplode[65537];
var(0.25_Pct) /*0xD3EB0000-0x00000400*/ private editfixedsize @NULL VSExplosionTemplate[589825];
var(0.25_Pct) /*0x25980000-0x00000000*/ private @NULL TeamColorEmissiveMaterialExterior[65537];
var(0.25_Pct) /*0x25980000-0x00000000*/ private @NULL TeamColorEmissiveMaterialInterior[65537];
var(0.25_Pct) /*0x25980000-0x00000000*/ private @NULL NeutralColor[65537];
var(0.25_Pct) /*0xD3E30000-0x00000000*/ private editfixedsize array DamageThresholdList[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.RearWeakSpotAngle0'
    begin object name=RearWeakSpotAngle0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RearWeakSpotAngle=RearWeakSpotAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.RearWeakSpotDamageBonus0'
    begin object name=RearWeakSpotDamageBonus0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.1500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RearWeakSpotDamageBonus=RearWeakSpotDamageBonus0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DashSpeedObject'
    begin object name=DashSpeedObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DashSpeed=DashSpeedObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DashDurationObject'
    begin object name=DashDurationObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.8000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DashDuration=DashDurationObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DashDecelerationRateObject'
    begin object name=DashDecelerationRateObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5400.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DashDecelerationRate=DashDecelerationRateObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DashCooldownTimeObject'
    begin object name=DashCooldownTimeObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DashCooldownTime=DashCooldownTimeObject
    TimeBetweenCriticalAndExplode=6.7500000
    // Reference: LPExplosion'Default__LPTuneDataVSFuturePlayerPawn.LPExplosion1'
    begin object name=LPExplosion1 class=Class'LPExplosion'
    end object
    VSExplosionTemplate=LPExplosion1
    NeutralColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSFuturePlayerPawn.ForceFeedbackWaveformFastBump'
    begin object name=ForceFeedbackWaveformFastBump
    end object
    FastBumpKillFFWaveform=ForceFeedbackWaveformFastBump
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSFuturePlayerPawn.ForceFeedbackWaveformSlowBump'
    begin object name=ForceFeedbackWaveformSlowBump
    end object
    SlowBumpKillFFWaveform=ForceFeedbackWaveformSlowBump
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.ForkArmGrabMaxHydraulicPressureA'
    begin object name=ForkArmGrabMaxHydraulicPressureA
    end object
    ForkArmGrabMaxHydraulicPressure=ForkArmGrabMaxHydraulicPressureA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.ForkArmWeakGrabHydraulicPressureA'
    begin object name=ForkArmWeakGrabHydraulicPressureA
    end object
    ForkArmWeakGrabHydraulicPressure=ForkArmWeakGrabHydraulicPressureA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.HealthStartingPercentageAfterDeathA'
    begin object name=HealthStartingPercentageAfterDeathA
    end object
    HealthStartingPercentageAfterDeath=HealthStartingPercentageAfterDeathA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MiniGameModerateDamageHalfAngleA'
    begin object name=MiniGameModerateDamageHalfAngleA
    end object
    MiniGameModerateDamageHalfAngle=MiniGameModerateDamageHalfAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MiniGameModerateDamageA'
    begin object name=MiniGameModerateDamageA
    end object
    MiniGameModerateDamage=MiniGameModerateDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MiniGameFullDamageHalfAngleA'
    begin object name=MiniGameFullDamageHalfAngleA
    end object
    MiniGameFullDamageHalfAngle=MiniGameFullDamageHalfAngleA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MiniGameFullDamageA'
    begin object name=MiniGameFullDamageA
    end object
    MiniGameFullDamage=MiniGameFullDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MiniGameMissDamageA'
    begin object name=MiniGameMissDamageA
    end object
    MiniGameMissDamage=MiniGameMissDamageA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.ShieldBlockDamageMultiplierA'
    begin object name=ShieldBlockDamageMultiplierA
    end object
    ShieldBlockDamageMultiplier=ShieldBlockDamageMultiplierA
    // Reference: CameraShake'Default__LPTuneDataVSFuturePlayerPawn.ShieldBlockCameraShakeInA'
    begin object name=ShieldBlockCameraShakeInA
    end object
    ShieldBlockCameraShakeIn=ShieldBlockCameraShakeInA
    // Reference: CameraShake'Default__LPTuneDataVSFuturePlayerPawn.ShieldBlockCameraShakeOutA'
    begin object name=ShieldBlockCameraShakeOutA
    end object
    ShieldBlockCameraShakeOut=ShieldBlockCameraShakeOutA
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSFuturePlayerPawn.MeleeForceFeedbackOnImpactA'
    begin object name=MeleeForceFeedbackOnImpactA
    end object
    MeleeForceFeedbackOnImpact=MeleeForceFeedbackOnImpactA
    GrapplingHookParams=(HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.GrappleHookValidRange'
    begin object name=GrappleHookValidRange
    end object
    HookValidRange=GrappleHookValidRange)
    MagneticGrapplingHookParams=(HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MagneticGrappleHookValidRange'
    begin object name=MagneticGrappleHookValidRange
    end object
    HookValidRange=MagneticGrappleHookValidRange)
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_TimeBetweenAttacksMin'
    begin object name=PackHunter_TimeBetweenAttacksMin
    end object
    PackHunter_TimeBetweenAttacksMin=PackHunter_TimeBetweenAttacksMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_TimeBetweenAttacksMax'
    begin object name=PackHunter_TimeBetweenAttacksMax
    end object
    PackHunter_TimeBetweenAttacksMax=PackHunter_TimeBetweenAttacksMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_MaxCircling'
    begin object name=PackHunter_MaxCircling
    end object
    PackHunter_MaxCircling=PackHunter_MaxCircling
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_Circling_Radius'
    begin object name=PackHunter_Circling_Radius
    end object
    PackHunter_Circling_Radius=PackHunter_Circling_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_MaxInStaticFormation'
    begin object name=PackHunter_MaxInStaticFormation
    end object
    PackHunter_MaxInStaticFormation=PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_StaticFormation_MinRadius'
    begin object name=PackHunter_StaticFormation_MinRadius
    end object
    PackHunter_StaticFormation_MinRadius=PackHunter_StaticFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_StaticFormation_Radius'
    begin object name=PackHunter_StaticFormation_Radius
    end object
    PackHunter_StaticFormation_Radius=PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_StaticFormation_MaxRadius'
    begin object name=PackHunter_StaticFormation_MaxRadius
    end object
    PackHunter_StaticFormation_MaxRadius=PackHunter_StaticFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMin'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMin
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMin=PackHunter_TimeInPaternBeforeFirstAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMax'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMax
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMax=PackHunter_TimeInPaternBeforeFirstAttackMax
    PackHunterStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    PackHunterAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinTimeBetweenStruggles'
    begin object name=MinTimeBetweenStruggles
    end object
    MinTimeBetweenStruggles=MinTimeBetweenStruggles
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_MaxAttackers'
    begin object name=IceCrab_MaxAttackers
    end object
    IceCrab_MaxAttackers=IceCrab_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_Melee_Circle_Radius'
    begin object name=IceCrab_Melee_Circle_Radius
    end object
    IceCrab_Melee_Circle_Radius=IceCrab_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenStrikesMin'
    begin object name=IceCrab_TimeBetweenStrikesMin
    end object
    IceCrab_TimeBetweenStrikesMin=IceCrab_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenStrikesMax'
    begin object name=IceCrab_TimeBetweenStrikesMax
    end object
    IceCrab_TimeBetweenStrikesMax=IceCrab_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMin
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMin=IceCrab_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMax
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMax=IceCrab_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenTauntAttackMin'
    begin object name=IceCrab_TimeBetweenTauntAttackMin
    end object
    IceCrab_TimeBetweenTauntAttackMin=IceCrab_TimeBetweenTauntAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.IceCrab_TimeBetweenTauntAttackMax'
    begin object name=IceCrab_TimeBetweenTauntAttackMax
    end object
    IceCrab_TimeBetweenTauntAttackMax=IceCrab_TimeBetweenTauntAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_MaxAttackers'
    begin object name=Leech_MaxAttackers
    end object
    Leech_MaxAttackers=Leech_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_MaxAttackAttempters'
    begin object name=Leech_MaxAttackAttempters
    end object
    Leech_MaxAttackAttempters=Leech_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_Melee_Circle_Radius'
    begin object name=Leech_Melee_Circle_Radius
    end object
    Leech_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_TimeBetweenStrikesMin'
    begin object name=Leech_TimeBetweenStrikesMin
    end object
    Leech_TimeBetweenStrikesMin=Leech_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_TimeBetweenStrikesMax'
    begin object name=Leech_TimeBetweenStrikesMax
    end object
    Leech_TimeBetweenStrikesMax=Leech_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_TimeBetweenStrugglesMin'
    begin object name=Leech_TimeBetweenStrugglesMin
    end object
    Leech_TimeBetweenStrugglesMin=Leech_TimeBetweenStrugglesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_TimeBetweenStrugglesMax'
    begin object name=Leech_TimeBetweenStrugglesMax
    end object
    Leech_TimeBetweenStrugglesMax=Leech_TimeBetweenStrugglesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_TimeToTrackStrikesOver'
    begin object name=Leech_TimeToTrackStrikesOver
    end object
    Leech_TimeToTrackStrikesOver=Leech_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Leech_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Leech_MaxNumberOfStrikesOverTrackedTime
    end object
    Leech_MaxNumberOfStrikesOverTrackedTime=Leech_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Burrower_MaxAttackers'
    begin object name=Burrower_MaxAttackers
    end object
    Burrower_MaxAttackers=Burrower_MaxAttackers
    Burrower_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Burrower_TimeToTrackStrikesOver'
    begin object name=Burrower_TimeToTrackStrikesOver
    end object
    Burrower_TimeToTrackStrikesOver=Burrower_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Burrower_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Burrower_MaxNumberOfStrikesOverTrackedTime
    end object
    Burrower_MaxNumberOfStrikesOverTrackedTime=Burrower_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Burrower_TimeBetweenStrikesMin'
    begin object name=Burrower_TimeBetweenStrikesMin
    end object
    Burrower_TimeBetweenStrikesMin=Burrower_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Burrower_TimeBetweenStrikesMax'
    begin object name=Burrower_TimeBetweenStrikesMax
    end object
    Burrower_TimeBetweenStrikesMax=Burrower_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinTimeBetweenBurrowerAttacks'
    begin object name=MinTimeBetweenBurrowerAttacks
    end object
    MinTimeBetweenBurrowerAttacks=MinTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxTimeBetweenBurrowerAttacks'
    begin object name=MaxTimeBetweenBurrowerAttacks
    end object
    MaxTimeBetweenBurrowerAttacks=MaxTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_MaxAttackers'
    begin object name=Phadyr_MaxAttackers
    end object
    Phadyr_MaxAttackers=Phadyr_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_Melee_Circle_Radius'
    begin object name=Phadyr_Melee_Circle_Radius
    end object
    Phadyr_Melee_Circle_Radius=Phadyr_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_Melee_Circle_MinRadius'
    begin object name=Phadyr_Melee_Circle_MinRadius
    end object
    Phadyr_Melee_Circle_MinRadius=Phadyr_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_Melee_Circle_MaxRadius'
    begin object name=Phadyr_Melee_Circle_MaxRadius
    end object
    Phadyr_Melee_Circle_MaxRadius=Phadyr_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_TimeBetweenStrikesMin'
    begin object name=Phadyr_TimeBetweenStrikesMin
    end object
    Phadyr_TimeBetweenStrikesMin=Phadyr_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_TimeBetweenStrikesMax'
    begin object name=Phadyr_TimeBetweenStrikesMax
    end object
    Phadyr_TimeBetweenStrikesMax=Phadyr_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Phadyr_SectorsPerAttackerFactor'
    begin object name=Phadyr_SectorsPerAttackerFactor
    end object
    Phadyr_SectorsPerAttackerFactor=Phadyr_SectorsPerAttackerFactor
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataVSFuturePlayerPawn.MedFlyer_FormationInfo'
    begin object name=MedFlyer_FormationInfo
    end object
    MedFlyer_FormationInfo=MedFlyer_FormationInfo
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataVSFuturePlayerPawn.Defender_FormationInfo'
    begin object name=Defender_FormationInfo
    end object
    Defender_FormationInfo=Defender_FormationInfo
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataVSFuturePlayerPawn.NushiSpore_FormationInfo'
    begin object name=NushiSpore_FormationInfo
    end object
    NushiSpore_FormationInfo=NushiSpore_FormationInfo
    DefenderRogueStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    DefenderRogueAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderVsCarrierSupport_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    end object
    DefenderVsCarrierSupport_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.HumanSoldier_MaxAttackers'
    begin object name=HumanSoldier_MaxAttackers
    end object
    HumanSoldier_MaxAttackers=HumanSoldier_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.HumanSoldier_Surround_Radius'
    begin object name=HumanSoldier_Surround_Radius
    end object
    HumanSoldier_Surround_Radius=HumanSoldier_Surround_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.HumanSoldier_MaxFireAttackers'
    begin object name=HumanSoldier_MaxFireAttackers
    end object
    HumanSoldier_MaxFireAttacker=HumanSoldier_MaxFireAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_MaxInFormation'
    begin object name=Dongo_MaxInFormation
    end object
    Dongo_MaxInFormation=Dongo_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_Formation_MinRadius'
    begin object name=Dongo_Formation_MinRadius
    end object
    Dongo_Formation_MinRadius=Dongo_Formation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_Formation_IdealRadius'
    begin object name=Dongo_Formation_IdealRadius
    end object
    Dongo_Formation_IdealRadius=Dongo_Formation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_Formation_MaxRadius'
    begin object name=Dongo_Formation_MaxRadius
    end object
    Dongo_Formation_MaxRadius=Dongo_Formation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_TimeBetweenStrikesMin'
    begin object name=Dongo_TimeBetweenStrikesMin
    end object
    Dongo_TimeBetweenStrikesMin=Dongo_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_TimeBetweenStrikesMax'
    begin object name=Dongo_TimeBetweenStrikesMax
    end object
    Dongo_TimeBetweenStrikesMax=Dongo_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMin'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMin
    end object
    Dongo_TimeBetweenWithdrawAndChargeMin=Dongo_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMax'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMax
    end object
    Dongo_TimeBetweenWithdrawAndChargeMax=Dongo_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_TimeBetweenFrenzyAttackMin'
    begin object name=Dongo_TimeBetweenFrenzyAttackMin
    end object
    Dongo_TimeBetweenFrenzyAttackMin=Dongo_TimeBetweenFrenzyAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Dongo_TimeBetweenFrenzyAttackMax'
    begin object name=Dongo_TimeBetweenFrenzyAttackMax
    end object
    Dongo_TimeBetweenFrenzyAttackMax=Dongo_TimeBetweenFrenzyAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_MaxInFormation'
    begin object name=Spitter_MaxInFormation
    end object
    Spitter_MaxInFormation=Spitter_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_MeleeFormation_MinRadius'
    begin object name=Spitter_MeleeFormation_MinRadius
    end object
    Spitter_MeleeFormation_MinRadius=Spitter_MeleeFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_MeleeFormation_IdealRadius'
    begin object name=Spitter_MeleeFormation_IdealRadius
    end object
    Spitter_MeleeFormation_IdealRadius=Spitter_MeleeFormation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_MeleeFormation_MaxRadius'
    begin object name=Spitter_MeleeFormation_MaxRadius
    end object
    Spitter_MeleeFormation_MaxRadius=Spitter_MeleeFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_SpitFrom_MinRadius'
    begin object name=Spitter_SpitFrom_MinRadius
    end object
    Spitter_SpitFrom_MinRadius=Spitter_SpitFrom_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_SpitFrom_IdealRadius'
    begin object name=Spitter_SpitFrom_IdealRadius
    end object
    Spitter_SpitFrom_IdealRadius=Spitter_SpitFrom_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Spitter_SpitFrom_MaxRadius'
    begin object name=Spitter_SpitFrom_MaxRadius
    end object
    Spitter_SpitFrom_MaxRadius=Spitter_SpitFrom_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_MaxAttackers'
    begin object name=Sepia_MaxAttackers
    end object
    Sepia_MaxAttackers=Sepia_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_MaxAttackAttempters'
    begin object name=Sepia_MaxAttackAttempters
    end object
    Sepia_MaxAttackAttempters=Sepia_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_Melee_Circle_Radius'
    begin object name=Sepia_Melee_Circle_Radius
    end object
    Sepia_Melee_Circle_Radius=Sepia_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_Melee_Circle_MinRadius'
    begin object name=Sepia_Melee_Circle_MinRadius
    end object
    Sepia_Melee_Circle_MinRadius=Sepia_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_Melee_Circle_MaxRadius'
    begin object name=Sepia_Melee_Circle_MaxRadius
    end object
    Sepia_Melee_Circle_MaxRadius=Sepia_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_SectorsPerAttackerFactor'
    begin object name=Sepia_SectorsPerAttackerFactor
    end object
    Sepia_SectorsPerAttackerFactor=Sepia_SectorsPerAttackerFactor
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_TimeBetweenStrikesMin'
    begin object name=Sepia_TimeBetweenStrikesMin
    end object
    Sepia_TimeBetweenStrikesMin=Sepia_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_TimeBetweenStrikesMax'
    begin object name=Sepia_TimeBetweenStrikesMax
    end object
    Sepia_TimeBetweenStrikesMax=Sepia_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_TimeToTrackStrikesOver'
    begin object name=Sepia_TimeToTrackStrikesOver
    end object
    Sepia_TimeToTrackStrikesOver=Sepia_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfStrikesOverTrackedTime
    end object
    Sepia_MaxNumberOfStrikesOverTrackedTime=Sepia_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_TimeToTrackLobStrikesOver'
    begin object name=Sepia_TimeToTrackLobStrikesOver
    end object
    Sepia_TimeToTrackLobStrikesOver=Sepia_TimeToTrackLobStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_MaxNumberOfLobStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    end object
    Sepia_MaxNumberOfLobStrikesOverTrackedTime=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_MinNumToCausePanicRetreat'
    begin object name=Sepia_MinNumToCausePanicRetreat
    end object
    Sepia_MinNumToCausePanicRetreat=Sepia_MinNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Sepia_MaxNumToCausePanicRetreat'
    begin object name=Sepia_MaxNumToCausePanicRetreat
    end object
    Sepia_MaxNumToCausePanicRetreat=Sepia_MaxNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Carrier_MaxInFormationD0'
    begin object name=Carrier_MaxInFormationD0
    end object
    Carrier_MaxInFormation=Carrier_MaxInFormationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Carrier_LoiterFormation_MinRadiusD0'
    begin object name=Carrier_LoiterFormation_MinRadiusD0
    end object
    Carrier_LoiterFormation_MinRadius=Carrier_LoiterFormation_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Carrier_LoiterFormation_IdealRadiusD0'
    begin object name=Carrier_LoiterFormation_IdealRadiusD0
    end object
    Carrier_LoiterFormation_IdealRadius=Carrier_LoiterFormation_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.Carrier_LoiterFormation_MaxRadiusD0'
    begin object name=Carrier_LoiterFormation_MaxRadiusD0
    end object
    Carrier_LoiterFormation_MaxRadius=Carrier_LoiterFormation_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    CarrierDefenderStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    CarrierDefenderAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VsLaroche_MaxAttackers0'
    begin object name=VsLaroche_MaxAttackers0
    end object
    VsLaroche_MaxAttackers=VsLaroche_MaxAttackers0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VsLaroche_Loiter_Circle_IdealRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_IdealRadiusD0
    end object
    VsLaroche_Loiter_Circle_IdealRadius=VsLaroche_Loiter_Circle_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VsLaroche_Loiter_Circle_MaxRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MaxRadiusD0
    end object
    VsLaroche_Loiter_Circle_MaxRadius=VsLaroche_Loiter_Circle_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VsLaroche_Loiter_Circle_MinRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MinRadiusD0
    end object
    VsLaroche_Loiter_Circle_MinRadius=VsLaroche_Loiter_Circle_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VsLaroche_TimeBetweenStrikesMinD0'
    begin object name=VsLaroche_TimeBetweenStrikesMinD0
    end object
    VsLaroche_TimeBetweenStrikesMin=VsLaroche_TimeBetweenStrikesMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VsLaroche_TimeBetweenStrikesMaxD0'
    begin object name=VsLaroche_TimeBetweenStrikesMaxD0
    end object
    VsLaroche_TimeBetweenStrikesMax=VsLaroche_TimeBetweenStrikesMaxD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MP_PackHunter_MaxInStaticFormation'
    begin object name=MP_PackHunter_MaxInStaticFormation
    end object
    MP_PackHunter_MaxInStaticFormation=MP_PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MP_PackHunter_StaticFormation_Radius'
    begin object name=MP_PackHunter_StaticFormation_Radius
    end object
    MP_PackHunter_StaticFormation_Radius=MP_PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxNumberOfDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDamageGibsForThisPlayerD0
    end object
    MaxNumberOfDamageGibsForThisPlayer=MaxNumberOfDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxNumberOfDecalsForDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    end object
    MaxNumberOfDecalsForDamageGibsForThisPlayer=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.RollDistanceMultiplierObj'
    begin object name=RollDistanceMultiplierObj
    end object
    RollDistanceMultiplier=RollDistanceMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.HealthRegenRateDifficultyModifier0'
    begin object name=HealthRegenRateDifficultyModifier0
    end object
    HealthRegenRateDifficultyModifier=HealthRegenRateDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.HealthRegenDelayDifficultyModifier0'
    begin object name=HealthRegenDelayDifficultyModifier0
    end object
    HealthRegenDelayDifficultyModifier=HealthRegenDelayDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0100000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSFuturePlayerPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
    WallSlideCylinderHeight=115.0000000
}