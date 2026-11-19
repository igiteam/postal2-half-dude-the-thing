class LPKynapseModifierSetting extends SPKynapseModifierSetting
    abstract
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSetting.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: SPKynapseModifierCanGo_NavMesh'Default__LPKynapseModifierSetting.SPDefaultCanGo'
    begin object name=SPDefaultCanGo class=Class'SPAIKynapse.SPKynapseModifierCanGo_NavMesh'
    end object
    CanGoModifier=SPDefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__LPKynapseModifierSetting.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSetting.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident class=Class'SPAIKynapse.SPKynapseModifierDetectAccident_PredictMove'
        accidentRatio=0.9000000
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSetting.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: SPKynapseModifierDetectGoalReached_DontQueue'Default__LPKynapseModifierSetting.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached class=Class'SPAIKynapse.SPKynapseModifierDetectGoalReached_DontQueue'
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__LPKynapseModifierSetting.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached
        maxDeltaHeight=20.0000000
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__LPKynapseModifierSetting.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness
        awarenessDist=50.0000000
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSetting.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions class=Class'SPAIKynapse.SPKynapseModifierFindNodesFromPositions_NearestReachable'
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSetting.DefaultGoto'
    begin object name=DefaultGoto
        MinSpeed=10.0000000
    end object
    GotoModifier=DefaultGoto
    // Reference: SPKynapseModifierRefineGoal_LPFCompatible'Default__LPKynapseModifierSetting.SPDefaultRefineGoal_LPFCompatible'
    begin object name=SPDefaultRefineGoal_LPFCompatible class=Class'SPAIKynapse.SPKynapseModifierRefineGoal_LPFCompatible'
    end object
    RefineGoalModifier=SPDefaultRefineGoal_LPFCompatible
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSetting.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: KynapseModifierSteering_SimpleBiped'Default__LPKynapseModifierSetting.DefaultSteering'
    begin object name=DefaultSteering
    end object
    SteeringModifier=DefaultSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSetting.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}