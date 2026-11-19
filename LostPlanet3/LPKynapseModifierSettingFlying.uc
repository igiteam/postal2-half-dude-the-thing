class LPKynapseModifierSettingFlying extends SPKynapseModifierSetting
    abstract
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSettingFlying.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: KynapseModifierCanGo_RayCast'Default__LPKynapseModifierSettingFlying.DefaultCanGo'
    begin object name=DefaultCanGo class=Class'KynapseEngine.KynapseModifierCanGo_RayCast'
    end object
    CanGoModifier=DefaultCanGo
    // Reference: LPKynapseModifierComputeFlyTargetPointShortcut'Default__LPKynapseModifierSettingFlying.DefaultComputeTargetPointD0'
    begin object name=DefaultComputeTargetPointD0 class=Class'LPKynapseModifierComputeFlyTargetPointShortcut'
        ExtraClearenceBuffer=0.1500000
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPointD0
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSettingFlying.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident class=Class'SPAIKynapse.SPKynapseModifierDetectAccident_PredictMove'
        accidentRatio=0.9000000
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSettingFlying.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: KynapseModifierDetectGoalReached_Distance3D'Default__LPKynapseModifierSettingFlying.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached class=Class'KynapseEngine.KynapseModifierDetectGoalReached_Distance3D'
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance3D'Default__LPKynapseModifierSettingFlying.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached class=Class'KynapseEngine.KynapseModifierDetectPathNodeReached_Distance3D'
        MaxDist=0.3000000
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    EdgeStatusAwarenessModifier=none
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSettingFlying.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions class=Class'SPAIKynapse.SPKynapseModifierFindNodesFromPositions_NearestReachable'
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSettingFlying.DefaultGoto'
    begin object name=DefaultGoto
        MinSpeed=10.0000000
    end object
    GotoModifier=DefaultGoto
    // Reference: KynapseModifierRefineGoal_Trivial'Default__LPKynapseModifierSettingFlying.SPKynapseModifierRefineGoal_Trivial'
    begin object name=SPKynapseModifierRefineGoal_Trivial class=Class'KynapseEngine.KynapseModifierRefineGoal_Trivial'
    end object
    RefineGoalModifier=SPKynapseModifierRefineGoal_Trivial
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSettingFlying.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: LPKynapseModifierSteeringFly'Default__LPKynapseModifierSettingFlying.LPKynapseModifierSteeringFly'
    begin object name=LPKynapseModifierSteeringFly class=Class'LPKynapseModifierSteeringFly'
    end object
    SteeringModifier=LPKynapseModifierSteeringFly
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSettingFlying.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}