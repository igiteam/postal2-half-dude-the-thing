class LPKynapseModifierSettingPackHunter extends LPKynapseModifierSetting
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSettingPackHunter.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: SPKynapseModifierCanGo_NavMesh'Default__LPKynapseModifierSettingPackHunter.SPDefaultCanGo'
    begin object name=SPDefaultCanGo
    end object
    CanGoModifier=SPDefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__LPKynapseModifierSettingPackHunter.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint
        maxBotDist=10.0000000
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSettingPackHunter.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSettingPackHunter.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: SPKynapseModifierDetectGoalReached_DontQueue'Default__LPKynapseModifierSettingPackHunter.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__LPKynapseModifierSettingPackHunter.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__LPKynapseModifierSettingPackHunter.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSettingPackHunter.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSettingPackHunter.DefaultGoto'
    begin object name=DefaultGoto
        DistMax=60.0000000
        DiagramMaxLength=20.0000000
        DiagramHalfWidth=13.5764500
        Courtesy=0.0200000
        PushingDelay=2.0000000
        MaxCollisionTestsPerFrame=10
    end object
    GotoModifier=DefaultGoto
    // Reference: SPKynapseModifierRefineGoal_LPFCompatible'Default__LPKynapseModifierSettingPackHunter.SPDefaultRefineGoal_LPFCompatible'
    begin object name=SPDefaultRefineGoal_LPFCompatible
    end object
    RefineGoalModifier=SPDefaultRefineGoal_LPFCompatible
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSettingPackHunter.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
        maxCandidatePerFrame=4
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: KynapseModifierSteering_SimpleBiped'Default__LPKynapseModifierSettingPackHunter.DefaultSteering'
    begin object name=DefaultSteering
        strafeRadius=7.0000000
        strafeAngle=45.0000000
    end object
    SteeringModifier=DefaultSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSettingPackHunter.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}