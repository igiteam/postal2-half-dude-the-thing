class LPLaRocheCombatPhaseStatData extends Object
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float JabChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float hookChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float armSwingChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float threeArmSwingChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float combo1Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float combo2Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float combo3Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SawSideCombo1Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SawSideCombo2Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SawSideCombo3Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaserSideCombo1Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaserSideCombo2Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaserSideCombo3Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float hulkSmashCombo1Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float hulkSmashCombo2Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float hulkSmashCombo3Chance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrightSawChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float shoulderChargeChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float doubleArmSmashChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterJabWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterJabWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterHookWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterHookWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterArmSwingWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterArmSwingWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterThreeArmSwingWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterThreeArmSwingWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterSawSideCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterSawSideCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterSawSideCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterSawSideCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterSawSideCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterSawSideCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterTaserSideCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterTaserSideCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterTaserSideCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterTaserSideCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterTaserSideCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterTaserSideCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterHulkSmashCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterHulkSmashCombo1WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterHulkSmashCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterHulkSmashCombo2WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterHulkSmashCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterHulkSmashCombo3WaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterStrightSawWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterStrightSawWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterShoulderChargeWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterShoulderChargeWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterDoubleArmSmashWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterDoubleArmSmashWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAfterGrabForStruggleWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAfterGrabForStruggleWaitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinNumOfHitsBeforeStruggleModeAttempt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumOfHitsBeforeStruggleModeAttempt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayRequiredBetweenAttemptedGrabsForStruggle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BaseEmpStruggleChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaserStruggleChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float KnockOutStruggleChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillKillStruggleChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CockKillStruggleChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowedToPerformDamageAssessment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowedToLaunchEmpPulseStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NormalStrikeActiveDefenceInitialChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NormalStrikeActiveDefenceChanceReductionPerSuccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrabsForStruggleModeActiveDefenceInitialChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenEmpPulseStrikes;

static function SetPhaseDataFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL LaRocheCombatPhaseStatTuneData[8388609], LaRocheCombatPhaseStatDataToSet, CtrlSettingFor;

    // End:0x31
    if((LaRocheCombatPhaseStatTuneData == none) || LaRocheCombatPhaseStatDataToSet == none)
    {
        // End:0x2F
        if(CtrlSettingFor != none)
        {
        }
        return;
    }
    LaRocheCombatPhaseStatDataToSet.JabChance = LaRocheCombatPhaseStatTuneData.JabChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.hookChance = LaRocheCombatPhaseStatTuneData.hookChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.armSwingChance = LaRocheCombatPhaseStatTuneData.armSwingChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.threeArmSwingChance = LaRocheCombatPhaseStatTuneData.threeArmSwingChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.combo1Chance = LaRocheCombatPhaseStatTuneData.combo1Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.combo2Chance = LaRocheCombatPhaseStatTuneData.combo2Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.combo3Chance = LaRocheCombatPhaseStatTuneData.combo3Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.SawSideCombo1Chance = LaRocheCombatPhaseStatTuneData.SawSideCombo1Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.SawSideCombo2Chance = LaRocheCombatPhaseStatTuneData.SawSideCombo2Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.SawSideCombo3Chance = LaRocheCombatPhaseStatTuneData.SawSideCombo3Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.TaserSideCombo1Chance = LaRocheCombatPhaseStatTuneData.TaserSideCombo1Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.TaserSideCombo2Chance = LaRocheCombatPhaseStatTuneData.TaserSideCombo2Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.TaserSideCombo3Chance = LaRocheCombatPhaseStatTuneData.TaserSideCombo3Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.hulkSmashCombo1Chance = LaRocheCombatPhaseStatTuneData.hulkSmashCombo1Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.hulkSmashCombo2Chance = LaRocheCombatPhaseStatTuneData.hulkSmashCombo2Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.hulkSmashCombo3Chance = LaRocheCombatPhaseStatTuneData.hulkSmashCombo3Chance.GetValue();
    LaRocheCombatPhaseStatDataToSet.StrightSawChance = LaRocheCombatPhaseStatTuneData.StrightSawChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.shoulderChargeChance = LaRocheCombatPhaseStatTuneData.shoulderChargeChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.doubleArmSmashChance = LaRocheCombatPhaseStatTuneData.doubleArmSmashChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterJabWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterJabWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterJabWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterJabWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterHookWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterHookWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterHookWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterHookWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterArmSwingWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterArmSwingWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterArmSwingWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterArmSwingWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterThreeArmSwingWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterThreeArmSwingWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterThreeArmSwingWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterThreeArmSwingWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterSawSideCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterSawSideCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterSawSideCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterSawSideCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterSawSideCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterSawSideCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterSawSideCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterSawSideCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterSawSideCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterSawSideCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterSawSideCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterSawSideCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterTaserSideCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterTaserSideCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterTaserSideCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterTaserSideCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterTaserSideCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterTaserSideCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterTaserSideCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterTaserSideCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterTaserSideCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterTaserSideCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterTaserSideCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterTaserSideCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterHulkSmashCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterHulkSmashCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterHulkSmashCombo1WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterHulkSmashCombo1WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterHulkSmashCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterHulkSmashCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterHulkSmashCombo2WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterHulkSmashCombo2WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterHulkSmashCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MinAfterHulkSmashCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterHulkSmashCombo3WaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterHulkSmashCombo3WaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterStrightSawWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterStrightSawWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterStrightSawWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterStrightSawWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterShoulderChargeWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterShoulderChargeWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterShoulderChargeWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterShoulderChargeWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterDoubleArmSmashWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterDoubleArmSmashWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterDoubleArmSmashWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterDoubleArmSmashWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinAfterGrabForStruggleWaitTime = LaRocheCombatPhaseStatTuneData.MinAfterGrabForStruggleWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MaxAfterGrabForStruggleWaitTime = LaRocheCombatPhaseStatTuneData.MaxAfterGrabForStruggleWaitTime.GetValue();
    LaRocheCombatPhaseStatDataToSet.MinNumOfHitsBeforeStruggleModeAttempt = int(LaRocheCombatPhaseStatTuneData.MinNumOfHitsBeforeStruggleModeAttempt.GetValue());
    LaRocheCombatPhaseStatDataToSet.MaxNumOfHitsBeforeStruggleModeAttempt = int(LaRocheCombatPhaseStatTuneData.MaxNumOfHitsBeforeStruggleModeAttempt.GetValue());
    LaRocheCombatPhaseStatDataToSet.MinDelayRequiredBetweenAttemptedGrabsForStruggle = LaRocheCombatPhaseStatTuneData.MinDelayRequiredBetweenAttemptedGrabsForStruggle.GetValue();
    LaRocheCombatPhaseStatDataToSet.BaseEmpStruggleChance = LaRocheCombatPhaseStatTuneData.BaseEmpStruggleChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.TaserStruggleChance = LaRocheCombatPhaseStatTuneData.TaserStruggleChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.KnockOutStruggleChance = LaRocheCombatPhaseStatTuneData.KnockOutStruggleChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.DrillKillStruggleChance = LaRocheCombatPhaseStatTuneData.DrillKillStruggleChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.CockKillStruggleChance = LaRocheCombatPhaseStatTuneData.CockKillStruggleChance.GetValue();
    // End:0x164E
    if(LaRocheCombatPhaseStatTuneData.bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt.GetValue() != float(0))
    {
        LaRocheCombatPhaseStatDataToSet.bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt = true;        
    }
    else
    {
        LaRocheCombatPhaseStatDataToSet.bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt = false;
    }
    LaRocheCombatPhaseStatDataToSet.NormalStrikeActiveDefenceInitialChance = LaRocheCombatPhaseStatTuneData.NormalStrikeActiveDefenceInitialChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.NormalStrikeActiveDefenceChanceReductionPerSuccess = LaRocheCombatPhaseStatTuneData.NormalStrikeActiveDefenceChanceReductionPerSuccess.GetValue();
    LaRocheCombatPhaseStatDataToSet.GrabsForStruggleModeActiveDefenceInitialChance = LaRocheCombatPhaseStatTuneData.GrabsForStruggleModeActiveDefenceInitialChance.GetValue();
    LaRocheCombatPhaseStatDataToSet.GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess = LaRocheCombatPhaseStatTuneData.GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess.GetValue();
    // End:0x181B
    if(LaRocheCombatPhaseStatTuneData.bAllowedToPerformDamageAssessment.GetValue() != float(0))
    {
        LaRocheCombatPhaseStatDataToSet.bAllowedToPerformDamageAssessment = true;        
    }
    else
    {
        LaRocheCombatPhaseStatDataToSet.bAllowedToPerformDamageAssessment = false;
    }
    // End:0x189C
    if(LaRocheCombatPhaseStatTuneData.bAllowedToLaunchEmpPulseStrike.GetValue() != float(0))
    {
        LaRocheCombatPhaseStatDataToSet.bAllowedToLaunchEmpPulseStrike = true;        
    }
    else
    {
        LaRocheCombatPhaseStatDataToSet.bAllowedToLaunchEmpPulseStrike = false;
    }
    LaRocheCombatPhaseStatDataToSet.MinTimeBetweenEmpPulseStrikes = LaRocheCombatPhaseStatTuneData.MinTimeBetweenEmpPulseStrikes.GetValue();
    //return;    
}

defaultproperties
{
    JabChance=0.7500000
    hookChance=0.1000000
    armSwingChance=0.1000000
    combo1Chance=0.0500000
    MinNumOfHitsBeforeStruggleModeAttempt=3
    MaxNumOfHitsBeforeStruggleModeAttempt=5
    BaseEmpStruggleChance=0.7000000
    KnockOutStruggleChance=0.3000000
    bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt=true
    bAllowedToPerformDamageAssessment=true
    NormalStrikeActiveDefenceInitialChance=0.7500000
    NormalStrikeActiveDefenceChanceReductionPerSuccess=0.1000000
    GrabsForStruggleModeActiveDefenceInitialChance=0.7500000
    GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess=0.1000000
}