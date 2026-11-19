class LPTuneDataBasePlayerPawn extends LPTuneDataPawn
    dontsortcategories(Attackers,PackHunterStaticFormationAttack)
    hidecategories(Object,Object);

struct native DodgeRollImmunityData
{
    var(0.25_Pct) /*0x49760000-0x00000000*/ private class DamageImmuneFrom[65537];
    var(0.25_Pct) /*0x49760000-0x00000000*/ private float StartOfRollVsDodgeWindowBuffer[65537];
    var(0.25_Pct) /*0x49760000-0x00000000*/ private float AngleOfImmunityExclusionInDegrees[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CosOfAngleOfImmunityExclusion[536870913];

    structdefaultproperties
    {
        DamageImmuneFrom=none
        StartOfRollVsDodgeWindowBuffer=0.3000000
        AngleOfImmunityExclusionInDegrees=45.0000000
        CosOfAngleOfImmunityExclusion=0.0000000
    }
};

var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthEffectThreshold[65537];
var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthEffectAudioThreshold[65537];
var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthEffectPulseDuration[65537];
var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthEffectPulseFadeTime[65537];
var(0.25_Pct) /*0x66270000-0x00000000*/ private float HealthEffectHeartBeatSpeed[65537];
var(0.25_Pct) /*0xA5330000-0x00000000*/ private float PoisonPulseSpeeed[65537];
var(0.25_Pct) /*0xA5330000-0x00000000*/ private float PoisonBlendToHealthSpeed[65537];
var(0.25_Pct) /*0xA5330000-0x00000000*/ private float PoisonPulseFadeTime[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private editfixedsize @NULL GrapplingHookParams[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private editfixedsize @NULL MagneticGrapplingHookParams[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private float GrappleHorizantalMaxAngle[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private float GrappleVerticalMinAngle[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private float FallRecoveryMaxSearchDistFromLastSolidFooting[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private float MinimumAngleToLookForRappelPoints[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private float MaxZDistanceToLookForRappelPoints[65537];
var(0.25_Pct) /*0x63610000-0x00000000*/ private float MaxZDistanceToLookForRappelPoints_Extended[65537];
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
var(0.25_Pct) /*0x9F990000-0x00000000*/ private float HowOfftenToUpdateThePackHunterStaticFormationAttackManager[65537];
var(0.25_Pct) /*0x9F990000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInThePackHunterStaticFormationAttackManager[65537];
var(0.25_Pct) /*0x9F990000-0x00000400*/ private editfixedsize array PackHunterStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x9F990000-0x00000400*/ private editfixedsize array PackHunterAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0xC6B20000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenStruggles[589825];
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
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_Melee_Circle_MinRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_Melee_Circle_MaxRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Phadyr_SectorsPerAttackerFactor[589825];
var(0.25_Pct) /*0x8FCE0000-0x00000400*/ private editfixedsize @NULL MedFlyer_FormationInfo[589825];
var(0.25_Pct) /*0x57D80000-0x00000000*/ private float HowOfftenToUpdateTheFireWaspCombatManager[65537];
var(0.25_Pct) /*0x57D80000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheFireWaspCombatManager[65537];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize array FireWaspStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize array FireWaspAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize @NULL FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x57D80000-0x00000400*/ private editfixedsize @NULL FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x449D0000-0x00000400*/ private editfixedsize @NULL Defender_FormationInfo[589825];
var(0.25_Pct) /*0x9AB90000-0x00000400*/ private editfixedsize @NULL NushiSpore_FormationInfo[589825];
var(0.25_Pct) /*0x44AE0000-0x00000000*/ private float HowOfftenToUpdateTheDefenderRogueCombatManager[65537];
var(0.25_Pct) /*0x44AE0000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderRogueCombatManager[65537];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize array DefenderRogueStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize array DefenderRogueAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize @NULL DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x44AE0000-0x00000400*/ private editfixedsize @NULL DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x44AE0000-0x00000000*/ private bool bCarrier_ForceNotAllowedToLaunchDefenders[65537];
var(0.25_Pct) /*0x8FCB0000-0x00000000*/ private bool bMedFlyer_ForceOnlyFullPhysicalAttacks[65537];
var(0.25_Pct) /*0x8FCB0000-0x00000000*/ private bool bMedFlyer_ForceOnlyRangedLobAttacks[65537];
var(0.25_Pct) /*0x8FCB0000-0x00000000*/ private bool bMedFlyer_ForceOnlyRamAttacks[65537];
var(0.25_Pct) /*0x63DB0000-0x00000000*/ private bool bShowGrenadeWarningForSelf[65537];
var(0.25_Pct) /*0x63DB0000-0x00000000*/ private bool bShowGrenadeWarningForTeammates[65537];
var(0.25_Pct) /*0x44BC0000-0x00000000*/ private float Defender_TimeSinceLastStrikeStart_WithCarrier[65537];
var(0.25_Pct) /*0x44BC0000-0x00000000*/ private float Defender_TimeSinceLastStrikeEnd_WithCarrier[65537];
var(0.25_Pct) /*0x44BC0000-0x00000000*/ private float Defender_TimeSinceLastStrikeStart_NoCarrier[65537];
var(0.25_Pct) /*0x44BC0000-0x00000000*/ private float Defender_TimeSinceLastStrikeEnd_NoCarrier[65537];
var(0.25_Pct) /*0x44C40000-0x00000000*/ private float HowOfftenToUpdateTheDefenderVsCarrierSupportCombatManager[65537];
var(0.25_Pct) /*0x44C40000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderVsCarrierSupportCombatManager[65537];
var(0.25_Pct) /*0x44C40000-0x00000400*/ private editfixedsize array DefenderVsCarrierSupportStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x44C40000-0x00000400*/ private editfixedsize array DefenderVsCarrierSupportAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x44C40000-0x00000400*/ private editfixedsize @NULL DefenderVsCarrierSupport_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x44C40000-0x00000400*/ private editfixedsize @NULL DefenderVsCarrierSupport_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[589825];
var(0.25_Pct) /*0x9AA40000-0x00000000*/ private float HowOfftenToUpdateTheNushiSporeCombatManager[65537];
var(0.25_Pct) /*0x9AA40000-0x00000000*/ private float HowOfftenToRemoveOutOfDataAttackOptionsInTheNushiSporeCombatManager[65537];
var(0.25_Pct) /*0x9AA40000-0x00000400*/ private editfixedsize array NushiSporeStrikeTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x9AA40000-0x00000400*/ private editfixedsize array NushiSporeAttackTimeInfoByTypeOfAttackList[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL HumanSoldier_MaxAttackers[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL HumanSoldier_Surround_Radius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL HumanSoldier_MaxFireAttacker[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_MaxInFormation[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_Formation_MinRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_Formation_IdealRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_Formation_MaxRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenStrikesMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenStrikesMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenWithdrawAndChargeMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenWithdrawAndChargeMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenFrenzyAttackMin[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Dongo_TimeBetweenFrenzyAttackMax[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_MaxInFormation[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_MeleeFormation_MinRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_MeleeFormation_IdealRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_MeleeFormation_MaxRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_SpitFrom_MinRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_SpitFrom_IdealRadius[589825];
var(0.25_Pct) /*0x08E30000-0x00000400*/ private editfixedsize @NULL Spitter_SpitFrom_MaxRadius[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxAttackers[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_MaxAttackAttempters[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_Melee_Circle_Radius[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_Melee_Circle_MinRadius[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_Melee_Circle_MaxRadius[589825];
var(0.25_Pct) /*0xB13B0000-0x00000400*/ private editfixedsize @NULL Sepia_SectorsPerAttackerFactor[589825];
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
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_MaxInFormation[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_LoiterFormation_MinRadius[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_LoiterFormation_IdealRadius[589825];
var(0.25_Pct) /*0x1CEA0000-0x00000400*/ private editfixedsize @NULL Carrier_LoiterFormation_MaxRadius[589825];
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
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MP_PackHunter_MaxInStaticFormation[589825];
var(0.25_Pct) /*0x95310000-0x00000400*/ private editfixedsize @NULL MP_PackHunter_StaticFormation_Radius[589825];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float HealthEffectThreshold_MP[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float MPRespawnDelay[65537];
var(0.25_Pct) /*0x95310000-0x00000000*/ private float MP_TEnergyPointExchangeRate[65537];
var(0.25_Pct) /*0x567E0000-0x00000000*/ private float RollToFallMaxAccel[65537];
var(0.25_Pct) /*0x567E0000-0x00000000*/ private float RollAfterFallDistance[65537];
var(0.25_Pct) /*0x497D0000-0x00000000*/ private editfixedsize array DodgeRollImmunityInfo[65537];
var(0.25_Pct) /*0xCA2A0000-0x00000000*/ private float TENGPointSearchRange[65537];
var(0.25_Pct) /*0xCA2A0000-0x00000000*/ private float TENGPostToPlayerTransferRate[65537];
var(0.25_Pct) /*0xCA2A0000-0x00000000*/ private float TENGPostToPlayerInputDelay[65537];
var(0.25_Pct) /*0x953B0000-0x00000000*/ private float MunitionsLockerSearchRange[65537];
var(0.25_Pct) /*0x63DB0000-0x00000000*/ private float GrenadeWarningVisibleRange[65537];
var(0.25_Pct) /*0x63DB0000-0x00000000*/ private float GrenadeWarningSenseRange[65537];
var(0.25_Pct) /*0x62240000-0x00000400*/ private editfixedsize @NULL MaxNumberOfDamageGibsForThisPlayer[589825];
var(0.25_Pct) /*0x62240000-0x00000400*/ private editfixedsize @NULL MaxNumberOfDecalsForDamageGibsForThisPlayer[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL SepiaTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL DefenderTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL WaspToCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL HiveTooCloseOnDeath_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL HiveAttack_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL NestingEggsPop_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GrenadeToClose_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericAsh_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericCinders_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericDirt_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericGoo_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericIce_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericSnow_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericWater_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL GenericT_Energy_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL OpaqueT_Energy_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL NushiAcid_CameraEffect[589825];
var(0.25_Pct) /*0x2AA20000-0x00000400*/ private editfixedsize @NULL ExtremeWeather_CameraEffect[589825];
var(0.25_Pct) /*0x26BF0000-0x00000000*/ private @NULL DefaultResinTrapCSA[65537];
var(0.25_Pct) /*0xA4150000-0x00000400*/ private editfixedsize @NULL RollDistanceMultiplier[589825];
var(0.25_Pct) /*0x739C0000-0x00000000*/ private float LedgeCheckCylinderRadius[65537];
var(0.25_Pct) /*0x739C0000-0x00000000*/ private float LedgeCheckSideRayAngle[65537];

// Export ULPTuneDataBasePlayerPawn::execGetGrappleParams(FFrame&, void* const)
native function GetGrappleParams()
{
    local /*0x97E50000-0x00000000*/ private bool bMagnetic[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];

    false            
}

function GetHealthEffectThreshold()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x48
    if(int(ThePawn.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return HealthEffectThreshold;
    }
    return HealthEffectThreshold_MP;
    //return ReturnValue;    
}

defaultproperties
{
    HealthEffectThreshold=0.3500000
    HealthEffectAudioThreshold=0.3500000
    HealthEffectPulseDuration=0.2000000
    HealthEffectPulseFadeTime=2.0000000
    HealthEffectHeartBeatSpeed=0.3000000
    GrapplingHookParams=(PlayerGrappleSpeed=1250.0000000,PlayerGrappleAccelRate=2500.0000000,bGrappleBonusEnabled=true,PlayerGrappleBonusMaxAngle=2.7500000,PlayerGrappleSpeedBonusModifier=1.5000000,PlayerGrappleAccelBonusModifier=1.5000000,HookSpeed=5000.0000000,HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.GrappleHookValidRange'
    begin object name=GrappleHookValidRange class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HookValidRange=GrappleHookValidRange,HookValidInnerRange=900.0000000,HookMinimumHeightOffset=100.0000000,HookInvalidRange=500.0000000,HookValidAngle=30.0000000,HookValidAngleToPlayer=15.0000000,PlayerRotateTowardsHookDist=200.0000000,PlayerHookRotationModifier=0.5000000,GrappleDescendVelocity=-1300.0000000,GrappleDownRunningLeapMaxAngle=30.0000000,GrappleDownMaxDistanceFromLedgeToPerformAnim=100.0000000,GrappleDownMaxDistanceFromLedge=300.0000000,GrappleDownMaxDistanceToShowIcon=500.0000000,GrapplePlayerHandOffset=(X=-25.0000000,Y=15.0000000,Z=75.0000000),FallRecoveryMinDistanceToGrapplePoint=30.0000000,FallRecoveryMaxDistanceToGrapplePoint=1000.0000000,FallRecoveryMaxAngleToGrapplePoint=10.0000000,FallRecoveryMaxDistanceFromLastFooting=30.0000000,FallRecoveryMinTimeNeededForRappelRecovery=0.7500000)
    MagneticGrapplingHookParams=(PlayerGrappleSpeed=1250.0000000,PlayerGrappleAccelRate=2500.0000000,bGrappleBonusEnabled=true,PlayerGrappleBonusMaxAngle=2.7500000,PlayerGrappleSpeedBonusModifier=1.5000000,PlayerGrappleAccelBonusModifier=1.5000000,HookSpeed=5000.0000000,HookValidRange=// Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MagneticGrappleHookValidRange'
    begin object name=MagneticGrappleHookValidRange class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HookValidRange=MagneticGrappleHookValidRange,HookValidInnerRange=900.0000000,HookMinimumHeightOffset=100.0000000,HookInvalidRange=500.0000000,HookValidAngle=30.0000000,HookValidAngleToPlayer=15.0000000,PlayerRotateTowardsHookDist=200.0000000,PlayerHookRotationModifier=0.5000000,GrappleDescendVelocity=-1300.0000000,GrappleDownRunningLeapMaxAngle=30.0000000,GrappleDownMaxDistanceFromLedgeToPerformAnim=100.0000000,GrappleDownMaxDistanceFromLedge=300.0000000,GrappleDownMaxDistanceToShowIcon=500.0000000,GrapplePlayerHandOffset=(X=-25.0000000,Y=15.0000000,Z=75.0000000),FallRecoveryMinDistanceToGrapplePoint=30.0000000,FallRecoveryMaxDistanceToGrapplePoint=1000.0000000,FallRecoveryMaxAngleToGrapplePoint=10.0000000,FallRecoveryMaxDistanceFromLastFooting=30.0000000,FallRecoveryMinTimeNeededForRappelRecovery=0.7500000)
    GrappleHorizantalMaxAngle=25.5000000
    GrappleVerticalMinAngle=72.5000000
    FallRecoveryMaxSearchDistFromLastSolidFooting=400.0000000
    MinimumAngleToLookForRappelPoints=15.0000000
    MaxZDistanceToLookForRappelPoints=200.0000000
    MaxZDistanceToLookForRappelPoints_Extended=400.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_TimeBetweenAttacksMin'
    begin object name=PackHunter_TimeBetweenAttacksMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeBetweenAttacksMin=PackHunter_TimeBetweenAttacksMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_TimeBetweenAttacksMax'
    begin object name=PackHunter_TimeBetweenAttacksMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeBetweenAttacksMax=PackHunter_TimeBetweenAttacksMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_MaxCircling'
    begin object name=PackHunter_MaxCircling class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_MaxCircling=PackHunter_MaxCircling
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_Circling_Radius'
    begin object name=PackHunter_Circling_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_Circling_Radius=PackHunter_Circling_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_MaxInStaticFormation'
    begin object name=PackHunter_MaxInStaticFormation class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_MaxInStaticFormation=PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_StaticFormation_MinRadius'
    begin object name=PackHunter_StaticFormation_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_StaticFormation_MinRadius=PackHunter_StaticFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_StaticFormation_Radius'
    begin object name=PackHunter_StaticFormation_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_StaticFormation_Radius=PackHunter_StaticFormation_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_StaticFormation_MaxRadius'
    begin object name=PackHunter_StaticFormation_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_StaticFormation_MaxRadius=PackHunter_StaticFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMin'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMin=PackHunter_TimeInPaternBeforeFirstAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMax'
    begin object name=PackHunter_TimeInPaternBeforeFirstAttackMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PackHunter_TimeInPaternBeforeFirstAttackMax=PackHunter_TimeInPaternBeforeFirstAttackMax
    HowOfftenToUpdateThePackHunterStaticFormationAttackManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInThePackHunterStaticFormationAttackManager=5.0000000
    PackHunterStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    PackHunterAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinTimeBetweenStruggles'
    begin object name=MinTimeBetweenStruggles class=Class'SPEngine.SPFloatDifficulty'
        baseValue=90.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenStruggles=MinTimeBetweenStruggles
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_MaxAttackers'
    begin object name=IceCrab_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_MaxAttackers=IceCrab_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_Melee_Circle_Radius'
    begin object name=IceCrab_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1960.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_Melee_Circle_Radius=IceCrab_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenStrikesMin'
    begin object name=IceCrab_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenStrikesMin=IceCrab_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenStrikesMax'
    begin object name=IceCrab_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenStrikesMax=IceCrab_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMin=IceCrab_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenWithdrawAndChargeMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenWithdrawAndChargeMax=IceCrab_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax'
    begin object name=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax=IceCrab_TimeBetweenDismemberedWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenTauntAttackMin'
    begin object name=IceCrab_TimeBetweenTauntAttackMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenTauntAttackMin=IceCrab_TimeBetweenTauntAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.IceCrab_TimeBetweenTauntAttackMax'
    begin object name=IceCrab_TimeBetweenTauntAttackMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IceCrab_TimeBetweenTauntAttackMax=IceCrab_TimeBetweenTauntAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_MaxAttackers'
    begin object name=Leech_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_MaxAttackers=Leech_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_MaxAttackAttempters'
    begin object name=Leech_MaxAttackAttempters class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_MaxAttackAttempters=Leech_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_Melee_Circle_Radius'
    begin object name=Leech_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_TimeBetweenStrikesMin'
    begin object name=Leech_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrikesMin=Leech_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_TimeBetweenStrikesMax'
    begin object name=Leech_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrikesMax=Leech_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_TimeBetweenStrugglesMin'
    begin object name=Leech_TimeBetweenStrugglesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrugglesMin=Leech_TimeBetweenStrugglesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_TimeBetweenStrugglesMax'
    begin object name=Leech_TimeBetweenStrugglesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeBetweenStrugglesMax=Leech_TimeBetweenStrugglesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_TimeToTrackStrikesOver'
    begin object name=Leech_TimeToTrackStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_TimeToTrackStrikesOver=Leech_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Leech_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Leech_MaxNumberOfStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Leech_MaxNumberOfStrikesOverTrackedTime=Leech_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Burrower_MaxAttackers'
    begin object name=Burrower_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_MaxAttackers=Burrower_MaxAttackers
    Burrower_Melee_Circle_Radius=Leech_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Burrower_TimeToTrackStrikesOver'
    begin object name=Burrower_TimeToTrackStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_TimeToTrackStrikesOver=Burrower_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Burrower_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Burrower_MaxNumberOfStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_MaxNumberOfStrikesOverTrackedTime=Burrower_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Burrower_TimeBetweenStrikesMin'
    begin object name=Burrower_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_TimeBetweenStrikesMin=Burrower_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Burrower_TimeBetweenStrikesMax'
    begin object name=Burrower_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Burrower_TimeBetweenStrikesMax=Burrower_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinTimeBetweenBurrowerAttacks'
    begin object name=MinTimeBetweenBurrowerAttacks class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenBurrowerAttacks=MinTimeBetweenBurrowerAttacks
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxTimeBetweenBurrowerAttacks'
    begin object name=MaxTimeBetweenBurrowerAttacks class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenBurrowerAttacks=MaxTimeBetweenBurrowerAttacks
    HowOfftenToUpdateTheBurrowerCombatManager=1.0000000
    HowOfftenToRemoveOutOfDateAttackOptionsInTheBurrowerCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_MaxAttackers'
    begin object name=Phadyr_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_MaxAttackers=Phadyr_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_Melee_Circle_Radius'
    begin object name=Phadyr_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_Melee_Circle_Radius=Phadyr_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_Melee_Circle_MinRadius'
    begin object name=Phadyr_Melee_Circle_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=300.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_Melee_Circle_MinRadius=Phadyr_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_Melee_Circle_MaxRadius'
    begin object name=Phadyr_Melee_Circle_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_Melee_Circle_MaxRadius=Phadyr_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_TimeBetweenStrikesMin'
    begin object name=Phadyr_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_TimeBetweenStrikesMin=Phadyr_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_TimeBetweenStrikesMax'
    begin object name=Phadyr_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_TimeBetweenStrikesMax=Phadyr_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Phadyr_SectorsPerAttackerFactor'
    begin object name=Phadyr_SectorsPerAttackerFactor class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Phadyr_SectorsPerAttackerFactor=Phadyr_SectorsPerAttackerFactor
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataBasePlayerPawn.MedFlyer_FormationInfo'
    begin object name=MedFlyer_FormationInfo class=Class'LPTuneDataSurroundFlyFormation'
        MaxAttackers=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_MaxAttackers'
        MaxNumberPerOrbitSlot=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_MaxNumberPerOrbitSlot'
        NumberOfExplorerSectors=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_NumberOfExplorerSectors'
        IdealRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_Radius'
        MinRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_MinRadius'
        MaxRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_MaxRadius'
        DistanceErrorBuffer=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_DistanceErrorBuffer'
        CostOfDistanceDeltaInsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter'
        CostOfDistanceDeltaOutsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter'
        IdealHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_HeightDelta'
        MinHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_MinHeightDelta'
        MaxHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_MaxHeightDelta'
        HeightErrorBuffer=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_HeightErrorBuffer'
        CostOfHeightDeltaBelowIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter'
        CostOfHeightDeltaAboveIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter'
        IdealPitchInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_IdealPitchInDegreesD0'
        MinPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_MinPitchAllowedInDegreesD0'
        MaxPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_MaxPitchAllowedInDegreesD0'
        PitchErrorBufferInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_PitchErrorBufferInDegreesD0'
        CostOfPitchDeltaBelowIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree'
        CostOfPitchDeltaAboveIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree'
        MinRangeFromVsForFlyLocToBeValid=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_Orbit_Circle_MinRangeFromVsForFlyLocToBeValid'
        bUseHeightInsteadOfPitchForEvaluations=false
        DefaultDelayTimeToTurnNoPathFoundFlagOff=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_DefaultDelayTimeToTurnNoPathFoundFlagOffD0'
        DefaultDelayTimeToTurnFoundNotCombatViableFlagOff=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0'
        PercentOfUsersRequiredToMarkLocNotCombatViable=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_PercentOfUsersRequiredToMarkLocNotCombatViableD0'
        NumberOfUsersRequiredToMarkLocNotPathViable=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_NumberOfUsersRequiredToMarkLocNotPathViableD0'
        MovementBufferBeforeRequireReexploration=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MedFlyer_MovementBufferBeforeRequireReexplorationD0'
    end object
    MedFlyer_FormationInfo=MedFlyer_FormationInfo
    HowOfftenToUpdateTheFireWaspCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheFireWaspCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FireWasp_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    FireWasp_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=FireWaspMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataBasePlayerPawn.Defender_FormationInfo'
    begin object name=Defender_FormationInfo class=Class'LPTuneDataSurroundFlyFormation'
        MaxAttackers=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_MaxAttackers'
        MaxNumberPerOrbitSlot=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_MaxNumberPerOrbitSlot'
        NumberOfExplorerSectors=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_NumberOfExplorerSectors'
        IdealRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_Radius'
        MinRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_MinRadius'
        MaxRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_MaxRadius'
        DistanceErrorBuffer=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_DistanceErrorBuffer'
        CostOfDistanceDeltaInsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter'
        CostOfDistanceDeltaOutsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter'
        IdealHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_HeightDelta'
        MinHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_MinHeightDelta'
        MaxHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_MaxHeightDelta'
        HeightErrorBuffer=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_HeightErrorBuffer'
        CostOfHeightDeltaBelowIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter'
        CostOfHeightDeltaAboveIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter'
        IdealPitchInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_IdealPitchInDegreesD0'
        MinPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_MinPitchAllowedInDegreesD0'
        MaxPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_MaxPitchAllowedInDegreesD0'
        PitchErrorBufferInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_PitchErrorBufferInDegreesD0'
        CostOfPitchDeltaBelowIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree'
        CostOfPitchDeltaAboveIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree'
        MinRangeFromVsForFlyLocToBeValid=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_Orbit_Circle_MinRangeFromVsForFlyLocToBeValid'
        DefaultDelayTimeToTurnNoPathFoundFlagOff=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_DefaultDelayTimeToTurnNoPathFoundFlagOffD0'
        DefaultDelayTimeToTurnFoundNotCombatViableFlagOff=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0'
        PercentOfUsersRequiredToMarkLocNotCombatViable=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_PercentOfUsersRequiredToMarkLocNotCombatViableD0'
        NumberOfUsersRequiredToMarkLocNotPathViable=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_NumberOfUsersRequiredToMarkLocNotPathViableD0'
        MovementBufferBeforeRequireReexploration=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Defender_MovementBufferBeforeRequireReexplorationD0'
        ReachDistance=90.0000000
    end object
    Defender_FormationInfo=Defender_FormationInfo
    // Reference: LPTuneDataSurroundFlyFormation'Default__LPTuneDataBasePlayerPawn.NushiSpore_FormationInfo'
    begin object name=NushiSpore_FormationInfo class=Class'LPTuneDataSurroundFlyFormation'
        MaxAttackers=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_MaxAttackers'
        MaxNumberPerOrbitSlot=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_MaxNumberPerOrbitSlot'
        NumberOfExplorerSectors=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_NumberOfExplorerSectors'
        IdealRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_Radius'
        MinRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_MinRadius'
        MaxRadius=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_MaxRadius'
        DistanceErrorBuffer=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_DistanceErrorBuffer'
        CostOfDistanceDeltaInsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter'
        CostOfDistanceDeltaOutsideIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter'
        IdealHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_HeightDelta'
        MinHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_MinHeightDelta'
        MaxHeightDelta=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_MaxHeightDelta'
        HeightErrorBuffer=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_HeightErrorBuffer'
        CostOfHeightDeltaBelowIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter'
        CostOfHeightDeltaAboveIdealPerMeter=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter'
        IdealPitchInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_IdealPitchInDegreesD0'
        MinPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_MinPitchAllowedInDegreesD0'
        MaxPitchAllowedInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_MaxPitchAllowedInDegreesD0'
        PitchErrorBufferInDegrees=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_PitchErrorBufferInDegreesD0'
        CostOfPitchDeltaBelowIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree'
        CostOfPitchDeltaAboveIdealPerDegree=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree'
        MinRangeFromVsForFlyLocToBeValid=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_Orbit_Circle_MinRangeFromVsForFlyLocToBeValid'
        bUseHeightInsteadOfPitchForEvaluations=false
        DefaultDelayTimeToTurnNoPathFoundFlagOff=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_DefaultDelayTimeToTurnNoPathFoundFlagOffD0'
        DefaultDelayTimeToTurnFoundNotCombatViableFlagOff=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0'
        PercentOfUsersRequiredToMarkLocNotCombatViable=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_PercentOfUsersRequiredToMarkLocNotCombatViableD0'
        NumberOfUsersRequiredToMarkLocNotPathViable=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_NumberOfUsersRequiredToMarkLocNotPathViableD0'
        MovementBufferBeforeRequireReexploration=SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.NushiSpore_MovementBufferBeforeRequireReexplorationD0'
    end object
    NushiSpore_FormationInfo=NushiSpore_FormationInfo
    HowOfftenToUpdateTheDefenderRogueCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderRogueCombatManager=5.0000000
    DefenderRogueStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    DefenderRogueAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefenderRogue_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefenderRogue_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderRogueMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    bShowGrenadeWarningForSelf=true
    Defender_TimeSinceLastStrikeStart_WithCarrier=3.0000000
    Defender_TimeSinceLastStrikeEnd_WithCarrier=1.0000000
    Defender_TimeSinceLastStrikeStart_NoCarrier=3.0000000
    Defender_TimeSinceLastStrikeEnd_NoCarrier=3.0000000
    HowOfftenToUpdateTheDefenderVsCarrierSupportCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheDefenderVsCarrierSupportCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefenderVsCarrierSupport_MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0'
    begin object name=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefenderVsCarrierSupport_MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=DefenderVsCarrierSupportMaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacksD0
    HowOfftenToUpdateTheNushiSporeCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheNushiSporeCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.HumanSoldier_MaxAttackers'
    begin object name=HumanSoldier_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HumanSoldier_MaxAttackers=HumanSoldier_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.HumanSoldier_Surround_Radius'
    begin object name=HumanSoldier_Surround_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HumanSoldier_Surround_Radius=HumanSoldier_Surround_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.HumanSoldier_MaxFireAttackers'
    begin object name=HumanSoldier_MaxFireAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HumanSoldier_MaxFireAttacker=HumanSoldier_MaxFireAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_MaxInFormation'
    begin object name=Dongo_MaxInFormation class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_MaxInFormation=Dongo_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_Formation_MinRadius'
    begin object name=Dongo_Formation_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_Formation_MinRadius=Dongo_Formation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_Formation_IdealRadius'
    begin object name=Dongo_Formation_IdealRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_Formation_IdealRadius=Dongo_Formation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_Formation_MaxRadius'
    begin object name=Dongo_Formation_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_Formation_MaxRadius=Dongo_Formation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_TimeBetweenStrikesMin'
    begin object name=Dongo_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenStrikesMin=Dongo_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_TimeBetweenStrikesMax'
    begin object name=Dongo_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenStrikesMax=Dongo_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMin'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenWithdrawAndChargeMin=Dongo_TimeBetweenWithdrawAndChargeMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_TimeBetweenWithdrawAndChargeMax'
    begin object name=Dongo_TimeBetweenWithdrawAndChargeMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenWithdrawAndChargeMax=Dongo_TimeBetweenWithdrawAndChargeMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_TimeBetweenFrenzyAttackMin'
    begin object name=Dongo_TimeBetweenFrenzyAttackMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenFrenzyAttackMin=Dongo_TimeBetweenFrenzyAttackMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Dongo_TimeBetweenFrenzyAttackMax'
    begin object name=Dongo_TimeBetweenFrenzyAttackMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Dongo_TimeBetweenFrenzyAttackMax=Dongo_TimeBetweenFrenzyAttackMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_MaxInFormation'
    begin object name=Spitter_MaxInFormation class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_MaxInFormation=Spitter_MaxInFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_MeleeFormation_MinRadius'
    begin object name=Spitter_MeleeFormation_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_MeleeFormation_MinRadius=Spitter_MeleeFormation_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_MeleeFormation_IdealRadius'
    begin object name=Spitter_MeleeFormation_IdealRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_MeleeFormation_IdealRadius=Spitter_MeleeFormation_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_MeleeFormation_MaxRadius'
    begin object name=Spitter_MeleeFormation_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_MeleeFormation_MaxRadius=Spitter_MeleeFormation_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_SpitFrom_MinRadius'
    begin object name=Spitter_SpitFrom_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=900.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_SpitFrom_MinRadius=Spitter_SpitFrom_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_SpitFrom_IdealRadius'
    begin object name=Spitter_SpitFrom_IdealRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_SpitFrom_IdealRadius=Spitter_SpitFrom_IdealRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Spitter_SpitFrom_MaxRadius'
    begin object name=Spitter_SpitFrom_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Spitter_SpitFrom_MaxRadius=Spitter_SpitFrom_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_MaxAttackers'
    begin object name=Sepia_MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxAttackers=Sepia_MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_MaxAttackAttempters'
    begin object name=Sepia_MaxAttackAttempters class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxAttackAttempters=Sepia_MaxAttackAttempters
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_Melee_Circle_Radius'
    begin object name=Sepia_Melee_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_Melee_Circle_Radius=Sepia_Melee_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_Melee_Circle_MinRadius'
    begin object name=Sepia_Melee_Circle_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_Melee_Circle_MinRadius=Sepia_Melee_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_Melee_Circle_MaxRadius'
    begin object name=Sepia_Melee_Circle_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_Melee_Circle_MaxRadius=Sepia_Melee_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_SectorsPerAttackerFactor'
    begin object name=Sepia_SectorsPerAttackerFactor class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_SectorsPerAttackerFactor=Sepia_SectorsPerAttackerFactor
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_TimeBetweenStrikesMin'
    begin object name=Sepia_TimeBetweenStrikesMin class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeBetweenStrikesMin=Sepia_TimeBetweenStrikesMin
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_TimeBetweenStrikesMax'
    begin object name=Sepia_TimeBetweenStrikesMax class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeBetweenStrikesMax=Sepia_TimeBetweenStrikesMax
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_TimeToTrackStrikesOver'
    begin object name=Sepia_TimeToTrackStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeToTrackStrikesOver=Sepia_TimeToTrackStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_MaxNumberOfStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxNumberOfStrikesOverTrackedTime=Sepia_MaxNumberOfStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_TimeToTrackLobStrikesOver'
    begin object name=Sepia_TimeToTrackLobStrikesOver class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_TimeToTrackLobStrikesOver=Sepia_TimeToTrackLobStrikesOver
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_MaxNumberOfLobStrikesOverTrackedTime'
    begin object name=Sepia_MaxNumberOfLobStrikesOverTrackedTime class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxNumberOfLobStrikesOverTrackedTime=Sepia_MaxNumberOfLobStrikesOverTrackedTime
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_MinNumToCausePanicRetreat'
    begin object name=Sepia_MinNumToCausePanicRetreat class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MinNumToCausePanicRetreat=Sepia_MinNumToCausePanicRetreat
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Sepia_MaxNumToCausePanicRetreat'
    begin object name=Sepia_MaxNumToCausePanicRetreat class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Sepia_MaxNumToCausePanicRetreat=Sepia_MaxNumToCausePanicRetreat
    HowOfftenToUpdateTheSentinelCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheSentinelCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Carrier_MaxInFormationD0'
    begin object name=Carrier_MaxInFormationD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_MaxInFormation=Carrier_MaxInFormationD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Carrier_LoiterFormation_MinRadiusD0'
    begin object name=Carrier_LoiterFormation_MinRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=700.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_LoiterFormation_MinRadius=Carrier_LoiterFormation_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Carrier_LoiterFormation_IdealRadiusD0'
    begin object name=Carrier_LoiterFormation_IdealRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_LoiterFormation_IdealRadius=Carrier_LoiterFormation_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.Carrier_LoiterFormation_MaxRadiusD0'
    begin object name=Carrier_LoiterFormation_MaxRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Carrier_LoiterFormation_MaxRadius=Carrier_LoiterFormation_MaxRadiusD0
    HowOfftenToUpdateTheCarrierDefenderCombatManager=1.0000000
    HowOfftenToRemoveOutOfDataAttackOptionsInTheCarrierDefenderCombatManager=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TimeBetweenDefenderElementLaunchesD0'
    begin object name=TimeBetweenDefenderElementLaunchesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenDefenderElementLaunches=TimeBetweenDefenderElementLaunchesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.RandomRangeForDefenderElementLaunchTimeD0'
    begin object name=RandomRangeForDefenderElementLaunchTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RandomRangeForDefenderElementLaunchTime=RandomRangeForDefenderElementLaunchTimeD0
    CarrierDefenderStrikeTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    CarrierDefenderAttackTimeInfoByTypeOfAttackList=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VsLaroche_MaxAttackers0'
    begin object name=VsLaroche_MaxAttackers0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_MaxAttackers=VsLaroche_MaxAttackers0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_IdealRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_IdealRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_Loiter_Circle_IdealRadius=VsLaroche_Loiter_Circle_IdealRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_MaxRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MaxRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_Loiter_Circle_MaxRadius=VsLaroche_Loiter_Circle_MaxRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_MinRadiusD0'
    begin object name=VsLaroche_Loiter_Circle_MinRadiusD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_Loiter_Circle_MinRadius=VsLaroche_Loiter_Circle_MinRadiusD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VsLaroche_TimeBetweenStrikesMinD0'
    begin object name=VsLaroche_TimeBetweenStrikesMinD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_TimeBetweenStrikesMin=VsLaroche_TimeBetweenStrikesMinD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VsLaroche_TimeBetweenStrikesMaxD0'
    begin object name=VsLaroche_TimeBetweenStrikesMaxD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VsLaroche_TimeBetweenStrikesMax=VsLaroche_TimeBetweenStrikesMaxD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MP_PackHunter_MaxInStaticFormation'
    begin object name=MP_PackHunter_MaxInStaticFormation class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MP_PackHunter_MaxInStaticFormation=MP_PackHunter_MaxInStaticFormation
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MP_PackHunter_StaticFormation_Radius'
    begin object name=MP_PackHunter_StaticFormation_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MP_PackHunter_StaticFormation_Radius=MP_PackHunter_StaticFormation_Radius
    HealthEffectThreshold_MP=1.0000000
    MPRespawnDelay=5.0000000
    MP_TEnergyPointExchangeRate=0.1000000
    RollToFallMaxAccel=6000.0000000
    RollAfterFallDistance=400.0000000
    TENGPointSearchRange=8000.0000000
    TENGPostToPlayerTransferRate=25.0000000
    TENGPostToPlayerInputDelay=0.5000000
    MunitionsLockerSearchRange=8000.0000000
    GrenadeWarningVisibleRange=3000.0000000
    GrenadeWarningSenseRange=1000.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxNumberOfDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDamageGibsForThisPlayerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfDamageGibsForThisPlayer=MaxNumberOfDamageGibsForThisPlayerD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxNumberOfDecalsForDamageGibsForThisPlayerD0'
    begin object name=MaxNumberOfDecalsForDamageGibsForThisPlayerD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberOfDecalsForDamageGibsForThisPlayer=MaxNumberOfDecalsForDamageGibsForThisPlayerD0
    SepiaTooCloseOnDeath_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    DefenderTooCloseOnDeath_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    WaspToCloseOnDeath_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    HiveTooCloseOnDeath_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    HiveAttack_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    NestingEggsPop_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GrenadeToClose_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericAsh_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericCinders_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericDirt_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericGoo_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericIce_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericSnow_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericWater_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    GenericT_Energy_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    OpaqueT_Energy_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    NushiAcid_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    ExtremeWeather_CameraEffect=(PS_CustomCameraEffect=none,PS_CustomCameraEffectNonExtremeContent=none,CustomBaseFOV=80.0000000,CustomEmittersToTreatAsSame=none,LifeSpan=10.0000000,bDestroyOnSystemFinish=true)
    DefaultResinTrapCSA=LPCSAO_Player'PlayerCSAs.PlayerResined'
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.RollDistanceMultiplierObj'
    begin object name=RollDistanceMultiplierObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RollDistanceMultiplier=RollDistanceMultiplierObj
    LedgeCheckCylinderRadius=1.0000000
    LedgeCheckSideRayAngle=20.0000000
    HealthRegenDelay=3.0000000
    HealthRegenRate=5.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.HealthRegenRateDifficultyModifier0'
    begin object name=HealthRegenRateDifficultyModifier0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HealthRegenRateDifficultyModifier=HealthRegenRateDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.HealthRegenDelayDifficultyModifier0'
    begin object name=HealthRegenDelayDifficultyModifier0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HealthRegenDelayDifficultyModifier=HealthRegenDelayDifficultyModifier0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.EMPDisruptionDurationObj'
    begin object name=EMPDisruptionDurationObj
    end object
    EMPDisruptionDuration=EMPDisruptionDurationObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinTimeExplodeAfterFreeze0'
    begin object name=MinTimeExplodeAfterFreeze0
    end object
    MinTimeExplodeAfterFreeze=MinTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxTimeExplodeAfterFreeze0'
    begin object name=MaxTimeExplodeAfterFreeze0
    end object
    MaxTimeExplodeAfterFreeze=MaxTimeExplodeAfterFreeze0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TEnergyCountObj'
    begin object name=TEnergyCountObj
    end object
    TEnergyCount=TEnergyCountObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TEnergyDropMinObj'
    begin object name=TEnergyDropMinObj
    end object
    TEnergyDropMin=TEnergyDropMinObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TEnergyDropMaxObj'
    begin object name=TEnergyDropMaxObj
    end object
    TEnergyDropMax=TEnergyDropMaxObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TEnergyDecayBeginObj'
    begin object name=TEnergyDecayBeginObj
    end object
    TEnergyDecayBegin=TEnergyDecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TEnergyDecayEndObj'
    begin object name=TEnergyDecayEndObj
    end object
    TEnergyDecayEnd=TEnergyDecayEndObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.TEnergyMaxLimitObj'
    begin object name=TEnergyMaxLimitObj
    end object
    TEnergyMaxLimit=TEnergyMaxLimitObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.AmountToDrainPerDrillerShot0'
    begin object name=AmountToDrainPerDrillerShot0
    end object
    AmountToDrainPerDrillerShot=AmountToDrainPerDrillerShot0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.AmountToDrainPerDrillerShotVariance0'
    begin object name=AmountToDrainPerDrillerShotVariance0
    end object
    AmountToDrainPerDrillerShotVariance=AmountToDrainPerDrillerShotVariance0
    MeleeWindows=/* Array type was not detected. */
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0'
    begin object name=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    end object
    bAllowTheVsToDamageThisTypeOfPawnOnMovementHit=bAllowTheVsToDamageThisTypeOfPawnOnMovementHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinVelocityForVsToCountAsKnockBackHitD0'
    begin object name=MinVelocityForVsToCountAsKnockBackHitD0
    end object
    MinVelocityForVsToCountAsKnockBackHit=MinVelocityForVsToCountAsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DelayBetweenAllowedVsKnockBackHitsD0'
    begin object name=DelayBetweenAllowedVsKnockBackHitsD0
    end object
    DelayBetweenAllowedVsKnockBackHits=DelayBetweenAllowedVsKnockBackHitsD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SpeedToUseLargeReactionWhenHitByVSD0'
    begin object name=SpeedToUseLargeReactionWhenHitByVSD0
    end object
    SpeedToUseLargeReactionWhenHitByVS=SpeedToUseLargeReactionWhenHitByVSD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromSlowVsKnockBackHit=DamageToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    DamageToThisTypeOfPawnFromFastVsKnockBackHit=DamageToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0'
    begin object name=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    end object
    MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit=MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHitD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.bAllowVsKnockBackHitOnTouchD0'
    begin object name=bAllowVsKnockBackHitOnTouchD0
    end object
    bAllowVsKnockBackHitOnTouch=bAllowVsKnockBackHitOnTouchD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.bAllowVsKnockBackHitOnBumpD0'
    begin object name=bAllowVsKnockBackHitOnBumpD0
    end object
    bAllowVsKnockBackHitOnBump=bAllowVsKnockBackHitOnBumpD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.RequiredNumTags0'
    begin object name=RequiredNumTags0
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VSMeleeDamageForFullHitReactionDecayRate0'
    begin object name=VSMeleeDamageForFullHitReactionDecayRate0
    end object
    VSMeleeDamageForFullHitReactionDecayRate=VSMeleeDamageForFullHitReactionDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VSMeleeDamageForFullHitReaction0'
    begin object name=VSMeleeDamageForFullHitReaction0
    end object
    VSMeleeDamageForFullHitReaction=VSMeleeDamageForFullHitReaction0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VSMeleeDamageForStunDecayRate0'
    begin object name=VSMeleeDamageForStunDecayRate0
    end object
    VSMeleeDamageForStunDecayRate=VSMeleeDamageForStunDecayRate0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VSMeleeDamageForStun0'
    begin object name=VSMeleeDamageForStun0
    end object
    VSMeleeDamageForStun=VSMeleeDamageForStun0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.WinchAutoTargetAngle0'
    begin object name=WinchAutoTargetAngle0
    end object
    WinchAutoTargetAngle=WinchAutoTargetAngle0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.ActiveDefenseScale0'
    begin object name=ActiveDefenseScale0
    end object
    ActiveDefenseScale=ActiveDefenseScale0
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxSuppressionFiringTimeA'
    begin object name=MaxSuppressionFiringTimeA
    end object
    MaxSuppressionFiringTime=MaxSuppressionFiringTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinBurstsToFireA'
    begin object name=MinBurstsToFireA
    end object
    MinBurstsToFire=MinBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxBurstsToFireA'
    begin object name=MaxBurstsToFireA
    end object
    MaxBurstsToFire=MaxBurstsToFireA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinBurstsToFireFromCoverA'
    begin object name=MinBurstsToFireFromCoverA
    end object
    MinBurstsToFireFromCover=MinBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxBurstsToFireFromCoverA'
    begin object name=MaxBurstsToFireFromCoverA
    end object
    MaxBurstsToFireFromCover=MaxBurstsToFireFromCoverA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA
    end object
    VisionAngleVertical=VisionAngleVerticalA
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    RotationRate=(Pitch=0,Yaw=65536,Roll=0)
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__LPTuneDataBasePlayerPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}