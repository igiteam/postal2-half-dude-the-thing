class LPKynapseModifierSettingDongo extends LPKynapseModifierSettingPackHunter
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSettingDongo.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: SPKynapseModifierCanGo_NavMesh'Default__LPKynapseModifierSettingDongo.SPDefaultCanGo'
    begin object name=SPDefaultCanGo
    end object
    CanGoModifier=SPDefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__LPKynapseModifierSettingDongo.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSettingDongo.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSettingDongo.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: SPKynapseModifierDetectGoalReached_DontQueue'Default__LPKynapseModifierSettingDongo.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__LPKynapseModifierSettingDongo.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__LPKynapseModifierSettingDongo.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSettingDongo.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSettingDongo.DefaultGoto'
    begin object name=DefaultGoto
    end object
    GotoModifier=DefaultGoto
    // Reference: SPKynapseModifierRefineGoal_LPFCompatible'Default__LPKynapseModifierSettingDongo.SPDefaultRefineGoal_LPFCompatible'
    begin object name=SPDefaultRefineGoal_LPFCompatible
    end object
    RefineGoalModifier=SPDefaultRefineGoal_LPFCompatible
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSettingDongo.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: SPKynapseModifierSteering_ConstrainedTurnRate'Default__LPKynapseModifierSettingDongo.DongoSteering'
    begin object name=DongoSteering class=Class'SPAIKynapse.SPKynapseModifierSteering_ConstrainedTurnRate'
        bUseConstrainedSteeringOnInitialize=false
        strafeRadius=7.0000000
        strafeAngle=45.0000000
    end object
    SteeringModifier=DongoSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSettingDongo.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}