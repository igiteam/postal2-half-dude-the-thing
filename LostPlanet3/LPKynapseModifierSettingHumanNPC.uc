class LPKynapseModifierSettingHumanNPC extends LPKynapseModifierSetting
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPKynapseModifierSettingHumanNPC.NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0'
    begin object name=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    end object
    NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeout=NumOfEdgesDuringAstarComputePathBeforeCheckingForTimeoutD0
    // Reference: SPKynapseModifierCanGo_NavMesh'Default__LPKynapseModifierSettingHumanNPC.SPDefaultCanGo'
    begin object name=SPDefaultCanGo
        CheckRadiusSphereCastFromOutsideAIMesh=30.0000000
    end object
    CanGoModifier=SPDefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__LPKynapseModifierSettingHumanNPC.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: SPKynapseModifierDetectAccident_PredictMove'Default__LPKynapseModifierSettingHumanNPC.SPDefaultDetectAccident'
    begin object name=SPDefaultDetectAccident
    end object
    DetectAccidentModifier=SPDefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__LPKynapseModifierSettingHumanNPC.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: SPKynapseModifierDetectGoalReached_DontQueue'Default__LPKynapseModifierSettingHumanNPC.SPDefaultDetectGoalReached'
    begin object name=SPDefaultDetectGoalReached
    end object
    DetectGoalReachedModifier=SPDefaultDetectGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__LPKynapseModifierSettingHumanNPC.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__LPKynapseModifierSettingHumanNPC.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: SPKynapseModifierFindNodesFromPositions_NearestReachable'Default__LPKynapseModifierSettingHumanNPC.SPDefaultFindNodesFromPositions'
    begin object name=SPDefaultFindNodesFromPositions
    end object
    FindNodesFromPositionsModifier=SPDefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__LPKynapseModifierSettingHumanNPC.DefaultGoto'
    begin object name=DefaultGoto
    end object
    GotoModifier=DefaultGoto
    // Reference: SPKynapseModifierRefineGoal_LPFCompatible'Default__LPKynapseModifierSettingHumanNPC.SPDefaultRefineGoal_LPFCompatible'
    begin object name=SPDefaultRefineGoal_LPFCompatible
    end object
    RefineGoalModifier=SPDefaultRefineGoal_LPFCompatible
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__LPKynapseModifierSettingHumanNPC.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: KynapseModifierSteering_SimpleBiped'Default__LPKynapseModifierSettingHumanNPC.DefaultSteering'
    begin object name=DefaultSteering
        strafeRadius=0.0000000
        strafeAngle=0.0000000
    end object
    SteeringModifier=DefaultSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__LPKynapseModifierSettingHumanNPC.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}