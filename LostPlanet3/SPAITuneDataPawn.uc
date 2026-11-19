class SPAITuneDataPawn extends SPCameraTuneDataPawn
    abstract
    hidecategories(Object,Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03590000-0x00000400*/ private editfixedsize array MeleeDamage[589825];
var(__NotifyAccessLostDelegate__Delegate) /*0x00340000-0x00000000*/ private float EnemyDistanceShort[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x00340000-0x00000000*/ private float EnemyDistanceMedium[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x00340000-0x00000000*/ private float EnemyDistanceLong[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x00340000-0x00000000*/ private bool bUseAimDownSightGroundSpeed[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x00340000-0x00000000*/ private float MinSpeedUseAimDownSight[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x00400000-0x00000000*/ private float SensorMinEnemySeenTime[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x00400000-0x00000400*/ private editfixedsize @NULL EnemyTooLongNoSeeTime[589825];
var(__NotifyAccessLostDelegate__Delegate) /*0x00400000-0x00000400*/ private editfixedsize @NULL VisionAngleHorizontal[589825];
var(__NotifyAccessLostDelegate__Delegate) /*0x00400000-0x00000400*/ private editfixedsize @NULL VisionAngleVertical[589825];
var(__NotifyAccessLostDelegate__Delegate) /*0x00400000-0x00000000*/ private float SightRadius[65537];

defaultproperties
{
    EnemyDistanceShort=256.0000000
    EnemyDistanceMedium=650.0000000
    EnemyDistanceLong=1600.0000000
    MinSpeedUseAimDownSight=300.0000000
    SensorMinEnemySeenTime=0.5000000
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.EnemyTooLongNoSeeTimeA'
    begin object name=EnemyTooLongNoSeeTimeA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EnemyTooLongNoSeeTime=EnemyTooLongNoSeeTimeA
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.VisionAngleHorizontalA'
    begin object name=VisionAngleHorizontalA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=360.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VisionAngleHorizontal=VisionAngleHorizontalA
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.VisionAngleVerticalA'
    begin object name=VisionAngleVerticalA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=180.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    VisionAngleVertical=VisionAngleVerticalA
    SightRadius=10000.0000000
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__SPAITuneDataPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}