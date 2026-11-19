class KynapseModifierSetting extends KynapseObject
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSetting);

var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL CanGoModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL ComputeTargetPointModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL DetectAccidentModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL DetectGoalChangedModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL DetectGoalReachedModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL DetectPathNodeReachedModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL EdgeStatusAwarenessModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL FindNodesFromPositionsModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL GotoModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL LpfShortcutModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL RefineGoalModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL SelectPathNodeModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL SteeringModifier[720897];
var(accidentRatio) /*0x01820000-0x00000400*/ private editfixedsize @NULL CheckDirectWayModifier[720897];

defaultproperties
{
    // Reference: KynapseModifierCanGo_NavMesh'Default__KynapseModifierSetting.DefaultCanGo'
    begin object name=DefaultCanGo class=Class'KynapseModifierCanGo_NavMesh'
    end object
    CanGoModifier=DefaultCanGo
    // Reference: KynapseModifierComputeTargetPoint_Queue'Default__KynapseModifierSetting.DefaultComputeTargetPoint'
    begin object name=DefaultComputeTargetPoint class=Class'KynapseModifierComputeTargetPoint_Queue'
    end object
    ComputeTargetPointModifier=DefaultComputeTargetPoint
    // Reference: KynapseModifierDetectAccident_PredictMove'Default__KynapseModifierSetting.DefaultDetectAccident'
    begin object name=DefaultDetectAccident class=Class'KynapseModifierDetectAccident_PredictMove'
    end object
    DetectAccidentModifier=DefaultDetectAccident
    // Reference: KynapseModifierDetectGoalChanged_Distance3D'Default__KynapseModifierSetting.DefaultDetectGoalChanged'
    begin object name=DefaultDetectGoalChanged class=Class'KynapseModifierDetectGoalChanged_Distance3D'
    end object
    DetectGoalChangedModifier=DefaultDetectGoalChanged
    // Reference: KynapseModifierDetectGoalReached_Distance2D5'Default__KynapseModifierSetting.DefaultGoalReached'
    begin object name=DefaultGoalReached class=Class'KynapseModifierDetectGoalReached_Distance2D5'
    end object
    DetectGoalReachedModifier=DefaultGoalReached
    // Reference: KynapseModifierDetectPathNodeReached_Distance2D5'Default__KynapseModifierSetting.DefaultPathNodeReached'
    begin object name=DefaultPathNodeReached class=Class'KynapseModifierDetectPathNodeReached_Distance2D5'
    end object
    DetectPathNodeReachedModifier=DefaultPathNodeReached
    // Reference: KynapseModifierEdgeStatusAwareness_Distance2dAndTime'Default__KynapseModifierSetting.DefaultEdgeStatusAwareness'
    begin object name=DefaultEdgeStatusAwareness class=Class'KynapseModifierEdgeStatusAwareness_Distance2dAndTime'
    end object
    EdgeStatusAwarenessModifier=DefaultEdgeStatusAwareness
    // Reference: KynapseModifierFindNodesFromPositions_NearestReachable'Default__KynapseModifierSetting.DefaultFindNodesFromPositions'
    begin object name=DefaultFindNodesFromPositions class=Class'KynapseModifierFindNodesFromPositions_NearestReachable'
    end object
    FindNodesFromPositionsModifier=DefaultFindNodesFromPositions
    // Reference: KynapseModifierGoto_GapDynamicAvoidance'Default__KynapseModifierSetting.DefaultGoto'
    begin object name=DefaultGoto class=Class'KynapseModifierGoto_GapDynamicAvoidance'
    end object
    GotoModifier=DefaultGoto
    // Reference: KynapseModifierRefineGoal_LpfCompatible'Default__KynapseModifierSetting.DefaultRefineGoal'
    begin object name=DefaultRefineGoal class=Class'KynapseModifierRefineGoal_LpfCompatible'
    end object
    RefineGoalModifier=DefaultRefineGoal
    // Reference: KynapseModifierSelectPathNodeCandidate_NextPathNode'Default__KynapseModifierSetting.DefaultSelectPathNode'
    begin object name=DefaultSelectPathNode class=Class'KynapseModifierSelectPathNodeCandidate_NextPathNode'
    end object
    SelectPathNodeModifier=DefaultSelectPathNode
    // Reference: KynapseModifierSteering_SimpleBiped'Default__KynapseModifierSetting.DefaultSteering'
    begin object name=DefaultSteering class=Class'KynapseModifierSteering_SimpleBiped'
    end object
    SteeringModifier=DefaultSteering
    // Reference: KynapseModifierCheckDirectWay_Distance'Default__KynapseModifierSetting.DefaultCheckDirectWay'
    begin object name=DefaultCheckDirectWay class=Class'KynapseModifierCheckDirectWay_Distance'
    end object
    CheckDirectWayModifier=DefaultCheckDirectWay
}