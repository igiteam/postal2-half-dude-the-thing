class SPCameraTuneDataPawn extends SPTuneDataBasePawn
    abstract
    hidecategories(Object,Object);

var(__Filter1__Delegate) /*0x049D0000-0x00000000*/ private @NULL PlayerSprintCameraParams[65537];
var(__Filter1__Delegate) /*0x04980000-0x00000000*/ private @NULL PlayerRollCameraParams[65537];

defaultproperties
{
    PlayerSprintCameraParams=(bEnableVelocityBasedSprintCamera=true,AdditiveLocalOffsetDuringPlayerSprints=(X=25.0000000,Y=-50.0000000,Z=15.0000000),SprintLocalOffsetFilterRate=0.8500000,AdditiveFOVDuringPlayerSprints=30.0000000,SprintFOVFilterRate=0.1500000,SprintBlendOutTime=2.0000000,ChaseCameraTurnRate=0.0300000,PitchMin=70.0000000,PitchMax=100.0000000,CenterPitchSpeed=20.0000000,PitchLimitSmoothRate=1.0000000,NarrowPitchAfterNoAimTime=0.2500000)
    PlayerRollCameraParams=(AdditiveLocalOffsetDuringRoll=(X=-55.0000000,Y=15.0000000,Z=-52.0000000),RollLocalOffsetFilterRate=1.2000000,AdditiveFOVDuringRoll=0.0000000,RollFOVFilterRate=0.1500000,RollBlendOutTime=0.5000000)
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.GroundSpeed_Tunable_Default'
    begin object name=GroundSpeed_Tunable_Default
    end object
    GroundSpeed_Tunable=GroundSpeed_Tunable_Default
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.AccelerationRate_Tunable_Default'
    begin object name=AccelerationRate_Tunable_Default
    end object
    AccelerationRate_Tunable=AccelerationRate_Tunable_Default
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.SprintSpeedScaleObj'
    begin object name=SprintSpeedScaleObj
    end object
    SprintSpeedScale=SprintSpeedScaleObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.SprintStaminaTimeObj'
    begin object name=SprintStaminaTimeObj
    end object
    SprintStaminaTime=SprintStaminaTimeObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.PctOfSprintTimeToStartSprintRegenObj'
    begin object name=PctOfSprintTimeToStartSprintRegenObj
    end object
    PctOfSprintTimeToStartSprintRegen=PctOfSprintTimeToStartSprintRegenObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.SprintTimeRegenRateObj'
    begin object name=SprintTimeRegenRateObj
    end object
    SprintTimeRegenRate=SprintTimeRegenRateObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.MaxPctOfSprintStaminaTimeToRegenObj'
    begin object name=MaxPctOfSprintStaminaTimeToRegenObj
    end object
    MaxPctOfSprintStaminaTimeToRegen=MaxPctOfSprintStaminaTimeToRegenObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.SprintRecoveryTimeObj'
    begin object name=SprintRecoveryTimeObj
    end object
    SprintRecoveryTime=SprintRecoveryTimeObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.SprintTurnRateMultiplierObj'
    begin object name=SprintTurnRateMultiplierObj
    end object
    SprintTurnRateMultiplier=SprintTurnRateMultiplierObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.SprintJumpBoostObj'
    begin object name=SprintJumpBoostObj
    end object
    SprintJumpBoost=SprintJumpBoostObj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.MinRecoveryDelay_Obj'
    begin object name=MinRecoveryDelay_Obj
    end object
    MinRecoveryDelay=MinRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.MaxRecoveryDelay_Obj'
    begin object name=MaxRecoveryDelay_Obj
    end object
    MaxRecoveryDelay=MaxRecoveryDelay_Obj
    // Reference: SPFloatDifficulty'Default__SPCameraTuneDataPawn.DamageToRagdollThreshold_Obj'
    begin object name=DamageToRagdollThreshold_Obj
    end object
    DamageToRagdollThreshold=DamageToRagdollThreshold_Obj
}