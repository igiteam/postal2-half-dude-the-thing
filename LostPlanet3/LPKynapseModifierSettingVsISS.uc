class LPKynapseModifierSettingVsISS extends LPKynapseModifierSetting
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSettingVsISS.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: SPKynapseModifierCanGo_NavMesh'Default__LPKynapseModifierSettingVsISS.SPDefaultCanGo'
    begin object name=SPDefaultCanGo
    end object
    CanGoModifier=SPDefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__LPKynapseModifierSettingVsISS.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint
        MaxDist=200.0000000
        maxBotDist=200.0000000
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSettingVsISS.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSettingVsISS.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
        MaxDist=2.0000000
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: SPKynapseModifierDetectGoalReached_DontQueue'Default__LPKynapseModifierSettingVsISS.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__LPKynapseModifierSettingVsISS.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached
        MaxDist=0.5000000
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__LPKynapseModifierSettingVsISS.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSettingVsISS.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSettingVsISS.DefaultGoto'
    begin object name=DefaultGoto
        DistMax=60.0000000
        DiagramMaxLength=30.0000000
        DiagramHalfWidth=27.6800000
        CandidateSpacing=0.5000000
        bContinuousSpeed=false
        Courtesy=0.3000000
        PushingDelay=2.0000000
        MaxAngularSpeed=180.0000000
        MaxCollisionTestsPerFrame=10
    end object
    GotoModifier=DefaultGoto
    // Reference: SPKynapseModifierRefineGoal_LPFCompatible'Default__LPKynapseModifierSettingVsISS.SPDefaultRefineGoal_LPFCompatible'
    begin object name=SPDefaultRefineGoal_LPFCompatible
    end object
    RefineGoalModifier=SPDefaultRefineGoal_LPFCompatible
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSettingVsISS.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
        maxDistancePathNode=100.0000000
        maxCandidatePerFrame=4
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: KynapseModifierSteering_SimpleBiped'Default__LPKynapseModifierSettingVsISS.DefaultSteering'
    begin object name=DefaultSteering
        strafeRadius=0.0000000
        strafeAngle=0.0000000
    end object
    SteeringModifier=DefaultSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSettingVsISS.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}