class LPTuneDataSurroundFlyFormation extends Object
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MaxAttackers[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MaxNumberPerOrbitSlot[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL NumberOfExplorerSectors[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL IdealRadius[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MinRadius[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MaxRadius[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL DistanceErrorBuffer[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL CostOfDistanceDeltaInsideIdealPerMeter[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL CostOfDistanceDeltaOutsideIdealPerMeter[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL IdealHeightDelta[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MinHeightDelta[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MaxHeightDelta[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL HeightErrorBuffer[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL CostOfHeightDeltaBelowIdealPerMeter[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL CostOfHeightDeltaAboveIdealPerMeter[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL IdealPitchInDegrees[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MinPitchAllowedInDegrees[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MaxPitchAllowedInDegrees[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL PitchErrorBufferInDegrees[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL CostOfPitchDeltaBelowIdealPerDegree[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL CostOfPitchDeltaAboveIdealPerDegree[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MinRangeFromVsForFlyLocToBeValid[589825];
var(0.25_Pct) /*0x8A500000-0x00000000*/ private bool bUseHeightInsteadOfPitchForEvaluations[65537];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL DefaultDelayTimeToTurnNoPathFoundFlagOff[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL DefaultDelayTimeToTurnFoundNotCombatViableFlagOff[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL PercentOfUsersRequiredToMarkLocNotCombatViable[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL NumberOfUsersRequiredToMarkLocNotPathViable[589825];
var(0.25_Pct) /*0x8A500000-0x00000400*/ private editfixedsize @NULL MovementBufferBeforeRequireReexploration[589825];
var(0.25_Pct) /*0x8A500000-0x00000000*/ private float ReachDistance[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.MaxAttackers'
    begin object name=MaxAttackers class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxAttackers=MaxAttackers
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.MaxNumberPerOrbitSlot'
    begin object name=MaxNumberPerOrbitSlot class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxNumberPerOrbitSlot=MaxNumberPerOrbitSlot
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.NumberOfExplorerSectors'
    begin object name=NumberOfExplorerSectors class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumberOfExplorerSectors=NumberOfExplorerSectors
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_Radius'
    begin object name=Orbit_Circle_Radius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdealRadius=Orbit_Circle_Radius
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_MinRadius'
    begin object name=Orbit_Circle_MinRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1900.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRadius=Orbit_Circle_MinRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_MaxRadius'
    begin object name=Orbit_Circle_MaxRadius class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxRadius=Orbit_Circle_MaxRadius
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.DistanceErrorBuffer'
    begin object name=DistanceErrorBuffer class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DistanceErrorBuffer=DistanceErrorBuffer
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter'
    begin object name=Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CostOfDistanceDeltaInsideIdealPerMeter=Orbit_Circle_CostOfDistanceDeltaInsideIdealPerMeter
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter'
    begin object name=Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CostOfDistanceDeltaOutsideIdealPerMeter=Orbit_Circle_CostOfDistanceDeltaOutsideIdealPerMeter
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_HeightDelta'
    begin object name=Orbit_Circle_HeightDelta class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdealHeightDelta=Orbit_Circle_HeightDelta
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_MinHeightDelta'
    begin object name=Orbit_Circle_MinHeightDelta class=Class'SPEngine.SPFloatDifficulty'
        baseValue=200.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinHeightDelta=Orbit_Circle_MinHeightDelta
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_MaxHeightDelta'
    begin object name=Orbit_Circle_MaxHeightDelta class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxHeightDelta=Orbit_Circle_MaxHeightDelta
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.HeightErrorBuffer'
    begin object name=HeightErrorBuffer class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1000.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    HeightErrorBuffer=HeightErrorBuffer
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter'
    begin object name=Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CostOfHeightDeltaBelowIdealPerMeter=Orbit_Circle_CostOfHeightDeltaBelowIdealPerMeter
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter'
    begin object name=Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CostOfHeightDeltaAboveIdealPerMeter=Orbit_Circle_CostOfHeightDeltaAboveIdealPerMeter
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.IdealPitchInDegreesD0'
    begin object name=IdealPitchInDegreesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    IdealPitchInDegrees=IdealPitchInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.MinPitchAllowedInDegreesD0'
    begin object name=MinPitchAllowedInDegreesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinPitchAllowedInDegrees=MinPitchAllowedInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.MaxPitchAllowedInDegreesD0'
    begin object name=MaxPitchAllowedInDegreesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxPitchAllowedInDegrees=MaxPitchAllowedInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.PitchErrorBufferInDegreesD0'
    begin object name=PitchErrorBufferInDegreesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=5.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PitchErrorBufferInDegrees=PitchErrorBufferInDegreesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree'
    begin object name=Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CostOfPitchDeltaBelowIdealPerDegree=Orbit_Circle_CostOfPitchDeltaBelowIdealPerDegree
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree'
    begin object name=Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    CostOfPitchDeltaAboveIdealPerDegree=Orbit_Circle_CostOfPitchDeltaAboveIdealPerDegree
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.Orbit_Circle_MinRangeFromVsForFlyLocToBeValid'
    begin object name=Orbit_Circle_MinRangeFromVsForFlyLocToBeValid class=Class'SPEngine.SPFloatDifficulty'
        baseValue=800.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinRangeFromVsForFlyLocToBeValid=Orbit_Circle_MinRangeFromVsForFlyLocToBeValid
    bUseHeightInsteadOfPitchForEvaluations=true
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.DefaultDelayTimeToTurnNoPathFoundFlagOffD0'
    begin object name=DefaultDelayTimeToTurnNoPathFoundFlagOffD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=30.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultDelayTimeToTurnNoPathFoundFlagOff=DefaultDelayTimeToTurnNoPathFoundFlagOffD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0'
    begin object name=DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=6.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DefaultDelayTimeToTurnFoundNotCombatViableFlagOff=DefaultDelayTimeToTurnFoundNotCombatViableFlagOffD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.PercentOfUsersRequiredToMarkLocNotCombatViableD0'
    begin object name=PercentOfUsersRequiredToMarkLocNotCombatViableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentOfUsersRequiredToMarkLocNotCombatViable=PercentOfUsersRequiredToMarkLocNotCombatViableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.NumberOfUsersRequiredToMarkLocNotPathViableD0'
    begin object name=NumberOfUsersRequiredToMarkLocNotPathViableD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    NumberOfUsersRequiredToMarkLocNotPathViable=NumberOfUsersRequiredToMarkLocNotPathViableD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataSurroundFlyFormation.MovementBufferBeforeRequireReexplorationD0'
    begin object name=MovementBufferBeforeRequireReexplorationD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MovementBufferBeforeRequireReexploration=MovementBufferBeforeRequireReexplorationD0
    ReachDistance=45.0000000
}