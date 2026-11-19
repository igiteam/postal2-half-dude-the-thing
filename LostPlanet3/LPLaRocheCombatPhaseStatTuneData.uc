class LPLaRocheCombatPhaseStatTuneData extends Object
    editinlinenew
    dontsortcategories(All)
    hidecategories(Object);

var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL JabChance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL hookChance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL armSwingChance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL threeArmSwingChance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL combo1Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL combo2Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL combo3Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL SawSideCombo1Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL SawSideCombo2Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL SawSideCombo3Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL TaserSideCombo1Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL TaserSideCombo2Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL TaserSideCombo3Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL hulkSmashCombo1Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL hulkSmashCombo2Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL hulkSmashCombo3Chance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL StrightSawChance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL shoulderChargeChance[589825];
var(0.25_Pct) /*0x09810000-0x00000400*/ private editfixedsize @NULL doubleArmSmashChance[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterJabWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterJabWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterHookWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterHookWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterArmSwingWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterArmSwingWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterThreeArmSwingWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterThreeArmSwingWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterSawSideCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterSawSideCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterSawSideCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterSawSideCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterSawSideCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterSawSideCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterTaserSideCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterTaserSideCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterTaserSideCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterTaserSideCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterTaserSideCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterTaserSideCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterHulkSmashCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterHulkSmashCombo1WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterHulkSmashCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterHulkSmashCombo2WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterHulkSmashCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterHulkSmashCombo3WaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterStrightSawWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterStrightSawWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterShoulderChargeWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterShoulderChargeWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterDoubleArmSmashWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterDoubleArmSmashWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MinAfterGrabForStruggleWaitTime[589825];
var(0.25_Pct) /*0xD59E0000-0x00000400*/ private editfixedsize @NULL MaxAfterGrabForStruggleWaitTime[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL MinNumOfHitsBeforeStruggleModeAttempt[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL MaxNumOfHitsBeforeStruggleModeAttempt[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL MinDelayRequiredBetweenAttemptedGrabsForStruggle[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL BaseEmpStruggleChance[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL TaserStruggleChance[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL KnockOutStruggleChance[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL DrillKillStruggleChance[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL CockKillStruggleChance[589825];
var(0.25_Pct) /*0xC6D40000-0x00000400*/ private editfixedsize @NULL bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt[589825];
var(0.25_Pct) /*0x01E40000-0x00000400*/ private editfixedsize @NULL NormalStrikeActiveDefenceInitialChance[589825];
var(0.25_Pct) /*0x01E40000-0x00000400*/ private editfixedsize @NULL NormalStrikeActiveDefenceChanceReductionPerSuccess[589825];
var(0.25_Pct) /*0x01E40000-0x00000400*/ private editfixedsize @NULL GrabsForStruggleModeActiveDefenceInitialChance[589825];
var(0.25_Pct) /*0x01E40000-0x00000400*/ private editfixedsize @NULL GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess[589825];
var(0.25_Pct) /*0x2AC10000-0x00000400*/ private editfixedsize @NULL bAllowedToPerformDamageAssessment[589825];
var(0.25_Pct) /*0x50940000-0x00000400*/ private editfixedsize @NULL bAllowedToLaunchEmpPulseStrike[589825];
var(0.25_Pct) /*0x50940000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenEmpPulseStrikes[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.JabChanceD0'
    begin object name=JabChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.7500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    JabChance=JabChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.HookChanceD0'
    begin object name=HookChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    hookChance=HookChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.ArmSwingChanceD0'
    begin object name=ArmSwingChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    armSwingChance=ArmSwingChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.ThreeArmSwingChanceD0'
    begin object name=ThreeArmSwingChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    threeArmSwingChance=ThreeArmSwingChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.Combo1ChanceD0'
    begin object name=Combo1ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    combo1Chance=Combo1ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.Combo2ChanceD0'
    begin object name=Combo2ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    combo2Chance=Combo2ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.Combo3ChanceD0'
    begin object name=Combo3ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    combo3Chance=Combo3ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.SawSideCombo1ChanceD0'
    begin object name=SawSideCombo1ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SawSideCombo1Chance=SawSideCombo1ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.SawSideCombo2ChanceD0'
    begin object name=SawSideCombo2ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SawSideCombo2Chance=SawSideCombo2ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.SawSideCombo3ChanceD0'
    begin object name=SawSideCombo3ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    SawSideCombo3Chance=SawSideCombo3ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.TaserSideCombo1ChanceD0'
    begin object name=TaserSideCombo1ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TaserSideCombo1Chance=TaserSideCombo1ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.TaserSideCombo2ChanceD0'
    begin object name=TaserSideCombo2ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TaserSideCombo2Chance=TaserSideCombo2ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.TaserSideCombo3ChanceD0'
    begin object name=TaserSideCombo3ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TaserSideCombo3Chance=TaserSideCombo3ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.HulkSmashCombo1ChanceD0'
    begin object name=HulkSmashCombo1ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.0500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    hulkSmashCombo1Chance=HulkSmashCombo1ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.HulkSmashCombo2ChanceD0'
    begin object name=HulkSmashCombo2ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    hulkSmashCombo2Chance=HulkSmashCombo2ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.HulkSmashCombo3ChanceD0'
    begin object name=HulkSmashCombo3ChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    hulkSmashCombo3Chance=HulkSmashCombo3ChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.StrightSawChanceD0'
    begin object name=StrightSawChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StrightSawChance=StrightSawChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.ShoulderChargeChanceD0'
    begin object name=ShoulderChargeChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    shoulderChargeChance=ShoulderChargeChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.DoubleArmSmashChanceD0'
    begin object name=DoubleArmSmashChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    doubleArmSmashChance=DoubleArmSmashChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterJabWaitTimeD0'
    begin object name=MinAfterJabWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterJabWaitTime=MinAfterJabWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterJabWaitTimeD0'
    begin object name=MaxAfterJabWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterJabWaitTime=MaxAfterJabWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterHookWaitTimeD0'
    begin object name=MinAfterHookWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterHookWaitTime=MinAfterHookWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterHookWaitTimeD0'
    begin object name=MaxAfterHookWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterHookWaitTime=MaxAfterHookWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterArmSwingWaitTimeD0'
    begin object name=MinAfterArmSwingWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterArmSwingWaitTime=MinAfterArmSwingWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterArmSwingWaitTimeD0'
    begin object name=MaxAfterArmSwingWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterArmSwingWaitTime=MaxAfterArmSwingWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterThreeArmSwingWaitTimeD0'
    begin object name=MinAfterThreeArmSwingWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterThreeArmSwingWaitTime=MinAfterThreeArmSwingWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterThreeArmSwingWaitTimeD0'
    begin object name=MaxAfterThreeArmSwingWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterThreeArmSwingWaitTime=MaxAfterThreeArmSwingWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterCombo1WaitTimeD0'
    begin object name=MinAfterCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterCombo1WaitTime=MinAfterCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterCombo1WaitTimeD0'
    begin object name=MaxAfterCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterCombo1WaitTime=MaxAfterCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterCombo2WaitTimeD0'
    begin object name=MinAfterCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterCombo2WaitTime=MinAfterCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterCombo2WaitTimeD0'
    begin object name=MaxAfterCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterCombo2WaitTime=MaxAfterCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterCombo3WaitTimeD0'
    begin object name=MinAfterCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterCombo3WaitTime=MinAfterCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterCombo3WaitTimeD0'
    begin object name=MaxAfterCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterCombo3WaitTime=MaxAfterCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterSawSideCombo1WaitTimeD0'
    begin object name=MinAfterSawSideCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterSawSideCombo1WaitTime=MinAfterSawSideCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterSawSideCombo1WaitTimeD0'
    begin object name=MaxAfterSawSideCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterSawSideCombo1WaitTime=MaxAfterSawSideCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterSawSideCombo2WaitTimeD0'
    begin object name=MinAfterSawSideCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterSawSideCombo2WaitTime=MinAfterSawSideCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterSawSideCombo2WaitTimeD0'
    begin object name=MaxAfterSawSideCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterSawSideCombo2WaitTime=MaxAfterSawSideCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterSawSideCombo3WaitTimeD0'
    begin object name=MinAfterSawSideCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterSawSideCombo3WaitTime=MinAfterSawSideCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterSawSideCombo3WaitTimeD0'
    begin object name=MaxAfterSawSideCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterSawSideCombo3WaitTime=MaxAfterSawSideCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterTaserSideCombo1WaitTimeD0'
    begin object name=MinAfterTaserSideCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterTaserSideCombo1WaitTime=MinAfterTaserSideCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterTaserSideCombo1WaitTimeD0'
    begin object name=MaxAfterTaserSideCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterTaserSideCombo1WaitTime=MaxAfterTaserSideCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterTaserSideCombo2WaitTimeD0'
    begin object name=MinAfterTaserSideCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterTaserSideCombo2WaitTime=MinAfterTaserSideCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterTaserSideCombo2WaitTimeD0'
    begin object name=MaxAfterTaserSideCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterTaserSideCombo2WaitTime=MaxAfterTaserSideCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterTaserSideCombo3WaitTimeD0'
    begin object name=MinAfterTaserSideCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterTaserSideCombo3WaitTime=MinAfterTaserSideCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterTaserSideCombo3WaitTimeD0'
    begin object name=MaxAfterTaserSideCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterTaserSideCombo3WaitTime=MaxAfterTaserSideCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterHulkSmashCombo1WaitTimeD0'
    begin object name=MinAfterHulkSmashCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterHulkSmashCombo1WaitTime=MinAfterHulkSmashCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterHulkSmashCombo1WaitTimeD0'
    begin object name=MaxAfterHulkSmashCombo1WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterHulkSmashCombo1WaitTime=MaxAfterHulkSmashCombo1WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterHulkSmashCombo2WaitTimeD0'
    begin object name=MinAfterHulkSmashCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterHulkSmashCombo2WaitTime=MinAfterHulkSmashCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterHulkSmashCombo2WaitTimeD0'
    begin object name=MaxAfterHulkSmashCombo2WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterHulkSmashCombo2WaitTime=MaxAfterHulkSmashCombo2WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterHulkSmashCombo3WaitTimeD0'
    begin object name=MinAfterHulkSmashCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterHulkSmashCombo3WaitTime=MinAfterHulkSmashCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterHulkSmashCombo3WaitTimeD0'
    begin object name=MaxAfterHulkSmashCombo3WaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=7.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterHulkSmashCombo3WaitTime=MaxAfterHulkSmashCombo3WaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterStrightSawWaitTimeD0'
    begin object name=MinAfterStrightSawWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterStrightSawWaitTime=MinAfterStrightSawWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterStrightSawWaitTimeD0'
    begin object name=MaxAfterStrightSawWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=4.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterStrightSawWaitTime=MaxAfterStrightSawWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterShoulderChargeWaitTimeD0'
    begin object name=MinAfterShoulderChargeWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=8.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterShoulderChargeWaitTime=MinAfterShoulderChargeWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterShoulderChargeWaitTimeD0'
    begin object name=MaxAfterShoulderChargeWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterShoulderChargeWaitTime=MaxAfterShoulderChargeWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterDoubleArmSmashWaitTimeD0'
    begin object name=MinAfterDoubleArmSmashWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterDoubleArmSmashWaitTime=MinAfterDoubleArmSmashWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterDoubleArmSmashWaitTimeD0'
    begin object name=MaxAfterDoubleArmSmashWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterDoubleArmSmashWaitTime=MaxAfterDoubleArmSmashWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinAfterGrabForStruggleWaitTimeD0'
    begin object name=MinAfterGrabForStruggleWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinAfterGrabForStruggleWaitTime=MinAfterGrabForStruggleWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxAfterGrabForStruggleWaitTimeD0'
    begin object name=MaxAfterGrabForStruggleWaitTimeD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=9.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAfterGrabForStruggleWaitTime=MaxAfterGrabForStruggleWaitTimeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinNumOfHitsBeforeStruggleModeAttemptD0'
    begin object name=MinNumOfHitsBeforeStruggleModeAttemptD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinNumOfHitsBeforeStruggleModeAttempt=MinNumOfHitsBeforeStruggleModeAttemptD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MaxNumOfHitsBeforeStruggleModeAttemptD0'
    begin object name=MaxNumOfHitsBeforeStruggleModeAttemptD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumOfHitsBeforeStruggleModeAttempt=MaxNumOfHitsBeforeStruggleModeAttemptD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinDelayRequiredBetweenAttemptedGrabsForStruggleD0'
    begin object name=MinDelayRequiredBetweenAttemptedGrabsForStruggleD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinDelayRequiredBetweenAttemptedGrabsForStruggle=MinDelayRequiredBetweenAttemptedGrabsForStruggleD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.BaseEmpStruggleChanceD0'
    begin object name=BaseEmpStruggleChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.7000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    BaseEmpStruggleChance=BaseEmpStruggleChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.TaserStruggleChanceD0'
    begin object name=TaserStruggleChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TaserStruggleChance=TaserStruggleChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.KnockOutStruggleChanceD0'
    begin object name=KnockOutStruggleChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.3000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    KnockOutStruggleChance=KnockOutStruggleChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.DrillKillStruggleChanceD0'
    begin object name=DrillKillStruggleChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DrillKillStruggleChance=DrillKillStruggleChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.CockKillStruggleChanceD0'
    begin object name=CockKillStruggleChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CockKillStruggleChance=CockKillStruggleChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.bLastStrikeOfComboRequiredToLandBeforeStruggleAttemptD0'
    begin object name=bLastStrikeOfComboRequiredToLandBeforeStruggleAttemptD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt=bLastStrikeOfComboRequiredToLandBeforeStruggleAttemptD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.NormalStrikeActiveDefenceInitialChanceD0'
    begin object name=NormalStrikeActiveDefenceInitialChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NormalStrikeActiveDefenceInitialChance=NormalStrikeActiveDefenceInitialChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.NormalStrikeActiveDefenceChanceReductionPerSuccessD0'
    begin object name=NormalStrikeActiveDefenceChanceReductionPerSuccessD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NormalStrikeActiveDefenceChanceReductionPerSuccess=NormalStrikeActiveDefenceChanceReductionPerSuccessD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.GrabsForStruggleModeActiveDefenceInitialChanceD0'
    begin object name=GrabsForStruggleModeActiveDefenceInitialChanceD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2500000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    GrabsForStruggleModeActiveDefenceInitialChance=GrabsForStruggleModeActiveDefenceInitialChanceD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.GrabsForStruggleModeActiveDefenceChanceReductionPerSuccessD0'
    begin object name=GrabsForStruggleModeActiveDefenceChanceReductionPerSuccessD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.1000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess=GrabsForStruggleModeActiveDefenceChanceReductionPerSuccessD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.bAllowedToPerformDamageAssessmentD0'
    begin object name=bAllowedToPerformDamageAssessmentD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowedToPerformDamageAssessment=bAllowedToPerformDamageAssessmentD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.bAllowedToLaunchEmpPulseStrikeD0'
    begin object name=bAllowedToLaunchEmpPulseStrikeD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    bAllowedToLaunchEmpPulseStrike=bAllowedToLaunchEmpPulseStrikeD0
    // Reference: SPFloatDifficulty'Default__LPLaRocheCombatPhaseStatTuneData.MinTimeBetweenEmpPulseStrikesD0'
    begin object name=MinTimeBetweenEmpPulseStrikesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenEmpPulseStrikes=MinTimeBetweenEmpPulseStrikesD0
}