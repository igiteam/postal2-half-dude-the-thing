class LPKynapseModifierSettingLeech extends LPKynapseModifierSetting
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSettingLeech.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: SPKynapseModifierCanGo_NavMesh'Default__LPKynapseModifierSettingLeech.SPDefaultCanGo'
    begin object name=SPDefaultCanGo
    end object
    CanGoModifier=SPDefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__LPKynapseModifierSettingLeech.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint
        MaxDist=50.0000000
        maxBotDist=200.0000000
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSettingLeech.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSettingLeech.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: SPKynapseModifierDetectGoalReached_DontQueue'Default__LPKynapseModifierSettingLeech.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__LPKynapseModifierSettingLeech.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__LPKynapseModifierSettingLeech.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSettingLeech.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSettingLeech.DefaultGoto'
    begin object name=DefaultGoto
        DistMax=30.0000000
        DiagramMaxLength=10.0000000
        DiagramHalfWidth=2.5455850
        bContinuousSpeed=false
        MaxCollisionTestsPerFrame=10
    end object
    GotoModifier=DefaultGoto
    // Reference: SPKynapseModifierRefineGoal_LPFCompatible'Default__LPKynapseModifierSettingLeech.SPDefaultRefineGoal_LPFCompatible'
    begin object name=SPDefaultRefineGoal_LPFCompatible
    end object
    RefineGoalModifier=SPDefaultRefineGoal_LPFCompatible
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSettingLeech.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
        maxCandidatePerFrame=4
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: KynapseModifierSteering_SimpleBiped'Default__LPKynapseModifierSettingLeech.DefaultSteering'
    begin object name=DefaultSteering
        strafeRadius=10.0000000
        strafeAngle=3.0000000
    end object
    SteeringModifier=DefaultSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSettingLeech.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}