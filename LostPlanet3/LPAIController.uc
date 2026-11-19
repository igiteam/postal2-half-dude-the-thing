class LPAIController extends SPGFCoverAIController
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum LPCmdStackClearOption
{
    LPCmdStackClear,                // 0
    LPCmdStackKeep,                 // 1
    LPCmdStackClearOption_MAX       // 2
};

enum LPCmdTurnOption
{
    LPCmdTurn_AlwaysTurn,           // 0
    LPCmdTurn_OnlyTurnIfAnimationNeeded,// 1
    LPCmdTurn_MAX                   // 2
};

enum ELookAtStartMoving
{
    LAS_DoNothing,                  // 0
    LAS_LookEnemy,                  // 1
    LAS_LookEnemyWhenADSFiring,     // 2
    LAS_LookForward,                // 3
    LAS_LookEnemyForShortPaths,     // 4
    LAS_MAX                         // 5
};

struct native AttackbleSmartActorInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionData;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SmartActor;

    structdefaultproperties
    {
        InteractionData=none
        TargetInfo=(Actor=none,Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),LastSeenTime=-1.0000000,LastDamageTime=-1.0000000,RecentDamageDone=0.0000000,PathNotValidTime=-1.0000000,LastAttackTime=-1.0000000,LastAttackCost=0.0000000)
        SmartActor=none
    }
};

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LPAICRecord;

    structdefaultproperties
    {
        LPAICRecord=(SPAIRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0,bAllowCombatTransitions=false,AttachmentArray=none,bAllowDamageWhenDisableAI=false,bDisableAI=false),AIPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""))
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myAIPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPSquad[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_MoveToPosition[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_MoveToActor[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Stunned[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Strike[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Attack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentObjective;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRetreatingToMeleePoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedToNotLookForAttacksWhileStalking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowAttacArtifacts;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleePointMoved[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStrikeCanBeRevoked;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRangedPointMoved[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBeSuperAggressive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleModeDisabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleModeForced[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowedToPerformReactiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingReactiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRunningSearchForAltToFormationLocPointToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFoundValidWithdrawToPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLookForAttackOpportunityWhileMovingToNonAttackLocations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedMoveLooking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool CachedCanMelee[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScriptedCanDoMelee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bConsumeAmmoWhileMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnsRunIntoWhileMoveing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyKynapseRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AiOverLayDebugMiscDisplay1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AiOverLayDebugMiscDisplay2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastAttackStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastAttackEnded[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MeleeResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StrikeResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StruggleAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StruggleResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StruggleTimerName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FeintAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FeintResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RangedAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RangedResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FireResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAdHocSquadMgrAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AdHocSquadMgrName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAdHocSquadMgrRef[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL MyAdHocSquadMemberData[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxEnemyHitPointsToStartStruggle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AIResMortarLocManagerRef[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AltToFormationLocMotarPointToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AltToFormationLocPointToStrikeFromIndexInManager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastAttackObjective[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToldToFleeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindWithdrawToSpotTraversal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PositionToWithdrawTo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastFindWithdrawToSpotTraversalStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NoticeDamagerMinLastSeenTimeDeltaMP[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ObstacleCheckRadius[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte lookWhenStartMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PrevLookAtStartMoving[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LookEnemyShortPathDist[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HitReactionCmdClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HitReactionToStunCmdClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrameCounterForLastThink[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampCanMelee[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeCanMeleeChecks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageReceivedMoving[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStumbled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToDelaySmartActorAttackUntil;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AccumulatedRawDamageTakenWhileAttackingSmartActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayFollowPathTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayDefendTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DelayDefendActor[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnProcessLookForAnotherAttackOpportunity__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnIsThereClearRangedAttackLaneDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __IsValidEnemy__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ValidTraversalCheck__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnTraversalFinish__Delegate;

delegate OnProcessLookForAnotherAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;

    //return ReturnValue;    
}

delegate OnIsThereClearRangedAttackLaneDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate IsValidEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate ValidTraversalCheck()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnTraversalFinish()
{
    //return;    
}

// Export ULPAIController::execLPFindAICommandInStack(FFrame&, void* const)
native function LPFindAICommandInStack()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCommand[8388609], ReturnValue;


}

// Export ULPAIController::execLPFindFirstAICommandOfClassInStack(FFrame&, void* const)
native function LPFindFirstAICommandOfClassInStack()
{
    local /*0x97E50000-0x00000000*/ private class InCommandClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL StartCommand[9437185], ReturnValue;


}

// Export ULPAIController::execGetCurrentStateName(FFrame&, void* const)
native function GetCurrentStateName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];


}

// Export ULPAIController::execGetDynamicAvoidanceRangeInUU(FFrame&, void* const)
native function GetDynamicAvoidanceRangeInUU()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execLosTestForAttackLane(FFrame&, void* const)
native static function LosTestForAttackLane()
{
    local /*0x97E50000-0x00000000*/ private @NULL From[8388609], To;
    local /*0x97E50000-0x00000000*/ private float Radius[8388609], Height;
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[26214401];
    local /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreActors[26345473], IgnoreActorsClasses;
    local /*0x97E50000-0x00000000*/ private @NULL outImpactInfo[26214401];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execMoveToWithConstraint(FFrame&, void* const)
native latent function MoveToWithConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewDestination[8388609], ViewFocus;
    local /*0x97E50000-0x00000000*/ private float DestinationOffset[9437185];
    local /*0x97E50000-0x00000000*/ private bool bShouldWalk[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Constraints[9437185];

    IsPawnWalking();                                
}

// Export ULPAIController::execMoveTowardWithConstraint(FFrame&, void* const)
native latent function MoveTowardWithConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTarget[8388609], ViewFocus;
    local /*0x97E50000-0x00000000*/ private float DestinationOffset[9437185];
    local /*0x97E50000-0x00000000*/ private bool bUseStrafing[9437185], bShouldWalk;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Constraints[9437185];

    IsPawnWalking();                                    
}

// Export ULPAIController::execAllAttackbleSmartActor(FFrame&, void* const)
native final iterator function AllAttackbleSmartActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25165825];


}

// Export ULPAIController::execNumberOfAttackersFor(FFrame&, void* const)
native event NumberOfAttackersFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAIController::execAmAdHocSquadLeader(FFrame&, void* const)
native final function AmAdHocSquadLeader()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execAmInAdHocSquad(FFrame&, void* const)
native final function AmInAdHocSquad()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execGetAdHocSquadLeader(FFrame&, void* const)
native final function GetAdHocSquadLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIController::execShouldLeaderMakeDecision(FFrame&, void* const)
native final function ShouldLeaderMakeDecision()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execNotifyCombatManagerToRetractAllOptionsForThisPublisher(FFrame&, void* const)
native function NotifyCombatManagerToRetractAllOptionsForThisPublisher();

// Export ULPAIController::execCanBeMyEnemy(FFrame&, void* const)
native event CanBeMyEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execHasEnemyGottenToCloseDurringAssessmentOrAnnounce(FFrame&, void* const)
native final function HasEnemyGottenToCloseDurringAssessmentOrAnnounce()
{
    local /*0x97E50000-0x00000000*/ private float outSepeartionToEnemySq[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execHasEnemyGottenToFarAwayDurringAssessment(FFrame&, void* const)
native final function HasEnemyGottenToFarAwayDurringAssessment()
{
    local /*0x97E50000-0x00000000*/ private float outSepeartionToEnemySq[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000            
}

// Export ULPAIController::execIsAnyEnemyTooClose(FFrame&, void* const)
native final function IsAnyEnemyTooClose()
{
    local /*0x97E50000-0x00000000*/ private float RangeEnemyMustBeCloserThan[8388609];
    local /*0x97E50000-0x00000000*/ private bool bStopTestingWhenAnyEnemyInsideRange[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy[25165825];
    local /*0x97E50000-0x00000000*/ private float RangeToClosestEnemy[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execGetIfAllowedToPerformReactiveAttack(FFrame&, void* const)
native final function GetIfAllowedToPerformReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execRange2D(FFrame&, void* const)
native final function Range2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRange2DSq(FFrame&, void* const)
native final function Range2DSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRangeToActor(FFrame&, void* const)
native final function RangeToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRangeToActorSq(FFrame&, void* const)
native final function RangeToActorSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperation2D(FFrame&, void* const)
native final function Seperation2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperation2DSq(FFrame&, void* const)
native final function Seperation2DSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperation2DTight(FFrame&, void* const)
native final function Seperation2DTight()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperation2DTightSq(FFrame&, void* const)
native final function Seperation2DTightSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRangeToPawn2D(FFrame&, void* const)
native final function RangeToPawn2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRangeToPawn2DSq(FFrame&, void* const)
native final function RangeToPawn2DSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRangeToPawn(FFrame&, void* const)
native final function RangeToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execRangeToPawnSq(FFrame&, void* const)
native final function RangeToPawnSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToActor(FFrame&, void* const)
native final function SeperationToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToActorSq(FFrame&, void* const)
native final function SeperationToActorSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToPawn(FFrame&, void* const)
native final function SeperationToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToPawnSq(FFrame&, void* const)
native final function SeperationToPawnSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToPawn2D(FFrame&, void* const)
native final function SeperationToPawn2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToPawn2DSq(FFrame&, void* const)
native final function SeperationToPawn2DSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToPawnFromLoc2D(FFrame&, void* const)
native final function SeperationToPawnFromLoc2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609], TestLoc;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execSeperationToPawnFromLoc2DSq(FFrame&, void* const)
native final function SeperationToPawnFromLoc2DSq()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609], TestLoc;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIController::execProcessStimulus(FFrame&, void* const)
native function ProcessStimulus()
{
    local /*0x97E50000-0x00000000*/ private @NULL E[8388609];
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private name EventName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execNoticeDamager(FFrame&, void* const)
native final function NoticeDamager();

// Export ULPAIController::execWantsToDoStruggleMode(FFrame&, void* const)
native function WantsToDoStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execCanDoStruggleModeAgainst(FFrame&, void* const)
native final function CanDoStruggleModeAgainst()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execIsStruggleModeForced(FFrame&, void* const)
native final function IsStruggleModeForced()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIController::execGetAssociatedPlayerPRI(FFrame&, void* const)
native simulated function GetAssociatedPlayerPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIController::execShouldCheckToSeeEnemy(FFrame&, void* const)
native function ShouldCheckToSeeEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], LineChkStart, LineChkEnd;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    SPAIControllerCreateCheckpointRecord(Record.LPAICRecord.SPAIRecord, Record.LPAICRecord.AIPawnRecord.SPPawnRecord);
    Class'LPPawn'.static.LPCreatePawnCheckpointRecord(true, Record.LPAICRecord.AIPawnRecord, Pawn, self);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897], RestoredPawn;

    RestoredPawn = SPAIControllerApplyCheckpointRecord(Record.LPAICRecord.SPAIRecord, Record.LPAICRecord.AIPawnRecord.SPPawnRecord);
    // End:0xEF
    if(RestoredPawn != none)
    {
        Class'LPPawn'.static.LPApplyPawnCheckpointRecord(true, Record.LPAICRecord.AIPawnRecord, RestoredPawn, false, self);
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super(SPKynapseAIController).PostBeginPlay();
    SetAttackResourceNames();
    ActorToldToFleeFrom = none;
    FindWithdrawToSpotTraversal = none;
    bFoundValidWithdrawToPosition = false;
    TimeLastFindWithdrawToSpotTraversalStarted = -1.0000000;
    bRetreatingToMeleePoint = false;
    // End:0x86
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        bStruggleModeDisabled = true;
    }
    TimeOfLastAttackStarted = -1.0000000;
    TimeOfLastAttackEnded = -1.0000000;
    // End:0xD3
    if(MyAdHocSquadMemberData != none)
    {
        MyAdHocSquadMemberData.Init(self);
    }
    //return;    
}

function CleanUpForBeingPutBackIntoPoolOnDeath()
{
    super.CleanUpForBeingPutBackIntoPoolOnDeath();
    ClearAllObjectives();
    AIObjectiveManager.EnableTicking(false);
    ActorToldToFleeFrom = none;
    FindWithdrawToSpotTraversal = none;
    bFoundValidWithdrawToPosition = false;
    TimeLastFindWithdrawToSpotTraversalStarted = -1.0000000;
    bRetreatingToMeleePoint = false;
    TimeOfLastAttackStarted = -1.0000000;
    TimeOfLastAttackEnded = -1.0000000;
    ReleaseAdHocSquadMgrAccess();
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'None';
    StrikeResourceName = 'None';
    StruggleResourceName = 'None';
    FeintResourceName = 'None';
    RangedResourceName = 'None';
    FireResourceName = 'None';
    AdHocSquadMgrName = 'None';
    //return;    
}

function IsValidResourceAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (ResAccess != none) && ResAccess.IsValid();
    //return ReturnValue;    
}

function IsValidResourceAccessForEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(IsValidResourceAccess(ResAccess))
    {
        return CanBeMyEnemy(ResAccess.GetOuterActor());
    }
    return false;
    //return ReturnValue;    
}

function HaveMeleeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ShouldUseMeleeResource() || (IsValidResourceAccessForEnemy(MeleeAccess)) && !bMeleePointMoved;
    //return ReturnValue;    
}

function CanHaveRangedAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xCD
    if((((ShouldUseRangedResource()) && TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.HasResource(RangedResourceName))
    {
        return TheEnemy.AIResourceManager.IsAccessPossible(RangedResourceName, myAIPawn);
    }
    return false;
    //return ReturnValue;    
}

function HaveRangedAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ShouldUseRangedResource() || (IsValidResourceAccessForEnemy(RangedAccess)) && !bRangedPointMoved;
    //return ReturnValue;    
}

function CanHaveStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xCD
    if((((ShouldUseStrikeResource()) && TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.HasResource(StrikeResourceName))
    {
        return TheEnemy.AIResourceManager.IsAccessPossible(StrikeResourceName, myAIPawn);
    }
    return false;
    //return ReturnValue;    
}

function HaveStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bBeSuperAggressive)
    {
        return true;
    }
    return !ShouldUseStrikeResource() || IsValidResourceAccessForEnemy(StrikeAccess);
    //return ReturnValue;    
}

function IsStrikeAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return EnemyForAttack.AIResourceManager.IsAccessPossible(StrikeResourceName, myAIPawn);
    //return ReturnValue;    
}

function IsThisControllerAllowedToStayInAttackCommandWithOutHavingRequiredAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeResourceReachTime()
{
    local /*0x97E50000-0x00000000*/ private float ReachTime[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL StrikeResource;

    // End:0xA2
    if(myAIPawn != none)
    {
        StrikeResource = LPAIResourceStrike(EnemyForAttack.AIResourceManager.GetResource(StrikeResourceName));
        // End:0xA2
        if(StrikeResource != none)
        {
            ReachTime = StrikeResource.GetUserReachTime(myAIPawn);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetStrikeResourceHolder()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], ReturnValue, StrikeResource;

    StrikeResource = LPAIResourceStrike(EnemyForAttack.AIResourceManager.GetResource(StrikeResourceName));
    // End:0x7F
    if(StrikeResource != none)
    {
        return StrikeResource.GetAUser();
    }
    return none;
    //return ReturnValue;    
}

function GetStrikeRevokeRatingModificationFactor()
{
    local /*0x97E50000-0x00000000*/ private float Scale[25165825], Constant;

    Scale = 1.0000000;
    Constant = 0.0000000;
    //return;    
}

function HaveFireAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ShouldUseFireResource() || IsValidResourceAccessForEnemy(FireAccess);
    //return ReturnValue;    
}

function CheckValidRangeToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveStruggleAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bBeSuperAggressive)
    {
        return true;
    }
    return IsValidResourceAccessForEnemy(StruggleAccess);
    //return ReturnValue;    
}

function GetStruggleAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xC3
    if((((ShouldUseStruggleResource()) && !HaveStruggleAccess()) && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        StruggleAccess = TheEnemy.AIResourceManager.GetAccess(StruggleResourceName, myAIPawn, RevokeTolerance);
        LockStruggleAccess(true);
    }
    //return;    
}

function HaveFeintAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ShouldUseFeintResource() || IsValidResourceAccessForEnemy(FeintAccess);
    //return ReturnValue;    
}

function HasAdHocSquadMgrAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsCurrentAdHocSquadMgrAccessForThisEnemy(InEnemy);
    //return ReturnValue;    
}

function GetCurrentAdHocSquadMgrAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0xE3
    if(CanBeMyEnemy(InEnemy))
    {
        // End:0xE0
        if(!HasAdHocSquadMgrAccess(InEnemy))
        {
            // End:0x47
            if(CurrentAdHocSquadMgrAccess != none)
            {
                ReleaseAdHocSquadMgrAccess();
            }
            CurrentAdHocSquadMgrAccess = InEnemy.AIResourceManager.GetAccess(AdHocSquadMgrName, myAIPawn);
            // End:0xDD
            if(CurrentAdHocSquadMgrAccess != none)
            {
                CurrentAdHocSquadMgrRef = LPAIResAdHocSquadMgr(CurrentAdHocSquadMgrAccess.GetResource());                
            }            
        }        
    }
    //return;    
}

function ReleaseAdHocSquadMgrAccess()
{
    // End:0xB1
    if(CurrentAdHocSquadMgrAccess != none)
    {
        // End:0x79
        if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
        {
            MyAdHocSquadMemberData.CurrentSquadIn.NotifySquadImDead(self);
        }
        CurrentAdHocSquadMgrAccess.Destroy();
        CurrentAdHocSquadMgrAccess = none;
        CurrentAdHocSquadMgrRef = none;        
    }
    //return;    
}

function CanMemberJoinMyAdHocSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsCurrentAdHocSquadMgrAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x65
    if(CurrentAdHocSquadMgrAccess != none)
    {
        // End:0x65
        if(CurrentAdHocSquadMgrAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!CurrentAdHocSquadMgrAccess.IsDestroyed())
            {
                return true;
            }            
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyGettingKickedFromAdHocSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadKickingMeOut[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSquadDisbanding[8388609], ReturnValue;

    // End:0x30
    if(MyAdHocSquadMemberData != none)
    {
        MyAdHocSquadMemberData.CleanForSquadRemoval();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanBecomeAdHocSquadLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadAsking[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(MyAdHocSquadMemberData != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function NotifyNowAdHocSquadLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadAsking[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function LetLeaderMakeStartAttackObjectiveForThisTargetDecision()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xCB
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xCB
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader != none)
        {
            // End:0xC9
            if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader.ShouldFollowerStartAttackObjectiveForThisTarget(InAttackTarget, self))
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFollowerStartAttackObjectiveForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897], FollowerAskingTheQ;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0xCE
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xCE
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader == self)
        {
            inPawn = LPPawn(InAttackTarget.Info.Actor);
            // End:0xCC
            if(inPawn == MyLPEnemy)
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function LetLeaderGiveRatingForAttackObjectiveForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Rating;

    Rating = 0.0000000;
    // End:0xDA
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xDA
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader != none)
        {
            Rating = MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader.GiveRatingForAttackObjectiveForThisTargetForFollower(InAttackTarget, self);
        }
    }
    return Rating;
    //return ReturnValue;    
}

function GiveRatingForAttackObjectiveForThisTargetForFollower()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897], FollowerAskingTheQ;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0xD6
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xD6
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader == self)
        {
            inPawn = LPPawn(InAttackTarget.Info.Actor);
            // End:0xD0
            if(inPawn == MyLPEnemy)
            {
                return 10000000.0000000;                
            }
            else
            {
                return 0.0000000;
            }
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

function GiveFollowerFormationSlotLocationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609], FollowerAskingTheQ, ReturnValue;

    return none;
    //return ReturnValue;    
}

function NotifyToFollowerLeaderIsReleasingFormationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL LeaderGivingUp[8388609], AccessGettingReleased, LocationReleasing;

    //return;    
}

function NotifyFromSquadCurrentAttackerIsRemovedFromSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadMemberLeaving[8388609];

    //return;    
}

function ReleaseMeleeAccess()
{
    // End:0x39
    if(MeleeAccess != none)
    {
        MeleeAccess.Destroy();
        MeleeAccess = none;
    }
    //return;    
}

function ReleaseRangedAccess()
{
    // End:0x39
    if(RangedAccess != none)
    {
        RangedAccess.Destroy();
        RangedAccess = none;
    }
    //return;    
}

function ReleaseStrikeAccess()
{
    // End:0x39
    if(StrikeAccess != none)
    {
        StrikeAccess.Destroy();
        StrikeAccess = none;
    }
    //return;    
}

function ReleaseLobStrikeAccess()
{
    //return;    
}

function ReleaseFireAccess()
{
    // End:0x39
    if(FireAccess != none)
    {
        FireAccess.Destroy();
        FireAccess = none;
    }
    //return;    
}

function ReleaseStruggleAccess()
{
    // End:0x39
    if(StruggleAccess != none)
    {
        StruggleAccess.Destroy();
        StruggleAccess = none;
    }
    //return;    
}

function ReleaseStrikeAccessForFailedAttack()
{
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseRangedStrikeAccessForFailedAttack()
{
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseRangedStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment()
{
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseRangedStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment()
{
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseFeintAccess()
{
    // End:0x39
    if(FeintAccess != none)
    {
        FeintAccess.Destroy();
        FeintAccess = none;
    }
    //return;    
}

function ReleaseAllAttackAccess()
{
    ReleaseMeleeAccess();
    ReleaseRangedAccess();
    ReleaseStrikeAccess();
    ReleaseFireAccess();
    ReleaseFeintAccess();
    ReleaseStruggleAccess();
    //return;    
}

function ShouldUseMeleeResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MeleeResourceName != 'None';
    //return ReturnValue;    
}

function ShouldUseRangedResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return RangedResourceName != 'None';
    //return ReturnValue;    
}

function ShouldUseStrikeResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return StrikeResourceName != 'None';
    //return ReturnValue;    
}

function ShouldUseFireResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return FireResourceName != 'None';
    //return ReturnValue;    
}

function GetFireAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    false
    // End:0xB9
    if((((ShouldUseFireResource()) && !HaveFireAccess()) && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        FireAccess = TheEnemy.AIResourceManager.GetAccess(FireResourceName, myAIPawn, 0.0000000, bForced);
    }
    //return;    
}

function CanHaveFireAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xCD
    if((((ShouldUseFireResource()) && TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.HasResource(FireResourceName))
    {
        return TheEnemy.AIResourceManager.IsAccessPossible(FireResourceName, myAIPawn);
    }
    return false;
    //return ReturnValue;    
}

function IsThereFireAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x73
    if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        return TheEnemy.AIResourceManager.HasResource(FireResourceName);
    }
    return false;
    //return ReturnValue;    
}

function ShouldUseAdHocSquadMgrResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return AdHocSquadMgrName != 'None';
    //return ReturnValue;    
}

function ShouldUseStruggleResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return StruggleResourceName != 'None';
    //return ReturnValue;    
}

function ShouldUseFeintResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return FeintResourceName != 'None';
    //return ReturnValue;    
}

function LockStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bLock[8388609];

    // End:0x86
    if(((bStrikeCanBeRevoked && HaveStrikeAccess()) && StrikeAccess != none) && bLock != StrikeAccess.IsLocked())
    {
        StrikeAccess.Lock(bLock);
    }
    //return;    
}

function GetStrikeTimerLeft()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private name TimerName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x73
    if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        return TheEnemy.AIResourceManager.GetTimeLeft(TimerName);
    }
    // End:0x88
    if(TheEnemy == none)
    {
        return 0.0000000;
    }
    return 0.0000000;
    //return ReturnValue;    
}

event HasStrikeTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private name TimerName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        return TheEnemy.AIResourceManager.HasTimerExpired(TimerName);        
    }
    else
    {
        // End:0x8A
        if(TheEnemy == none)
        {
            return false;            
        }
        else
        {
            return true;
        }
    }
    //return ReturnValue;    
}

function ResetStrikeTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private name TimerName[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        TheEnemy.AIResourceManager.ResetTimerRange(TimerName, MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(TheEnemy == none)
        {            
        }
    }
    //return;    
}

function ClearStrikeTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private name TimerName[8388609];

    // End:0x75
    if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        TheEnemy.AIResourceManager.ClearTimer(TimerName);        
    }
    else
    {
        // End:0x87
        if(TheEnemy == none)
        {            
        }
    }
    //return;    
}

function LockStruggleAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bLock[8388609];

    // End:0x77
    if(((HaveStruggleAccess()) && StruggleAccess != none) && bLock != StruggleAccess.IsLocked())
    {
        StruggleAccess.Lock(bLock);
    }
    //return;    
}

function NotifyPlayersOnly()
{
    //return;    
}

function GetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], ObjAttack;

    ObjAttack = LPAIObjectiveAttack(CurrentObjective);
    // End:0x73
    if(ObjAttack != none)
    {
        return ObjAttack.EnemyInfo.Info.Actor;        
    }
    else
    {
        // End:0x8C
        if(MyLPEnemy != none)
        {
            return MyLPEnemy;
        }
    }
    return none;
    //return ReturnValue;    
}

function GetCurrentObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CurrentObjective;
    //return ReturnValue;    
}

function ResetStruggleModeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    //return;    
}

function ResetStruggleModeGlobalTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x96
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        EnemyPawnToCheck.AIResourceManager.ResetTimerRange(StruggleTimerName, MinTime, MaxTime);
    }
    //return;    
}

function BanFormationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTarget[8388609];
    local /*0x97E50000-0x00000000*/ private name InResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InFormationPosition[8388609], ResSurround;

    ResSurround = LPAIResSurroundFormation(InTarget.AIResourceManager.GetResourceGroup(InResourceName));
    // End:0x87
    if(ResSurround != none)
    {
        ResSurround.BanFormationPosition(InFormationPosition);
    }
    //return;    
}

function GetFormationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609], FormationPosition;
    local /*0x97E50000-0x00000000*/ private float ReachDistance[26214401];
    local /*0x97E50000-0x00000000*/ private int SelectedSubPos[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation, ResourceLocation;

    -1
    ResourceLocation = SPAIResLocation(ResourceAccess.GetResource());
    // End:0x9F
    if(ResourceLocation != none)
    {
        ReachDistance = ResourceLocation.ReachDistance();
        FormationPosition = ResourceLocation.GetWorldPosition();
        return true;
    }
    ResourceMultiLocation = LPAIResMultiLocation(ResourceAccess.GetResource());
    // End:0x1C5
    if(ResourceMultiLocation != none)
    {
        ReachDistance = ResourceMultiLocation.ReachDistance();
        // End:0x17C
        if((SelectedSubPos >= 0) && SelectedSubPos < ResourceMultiLocation.NumPositions())
        {
            FormationPosition = ResourceMultiLocation.GetPosition(SelectedSubPos);            
        }
        else
        {
            FormationPosition = ResourceMultiLocation.GetNearestWorldPosition(myAIPawn.Location);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsThereSpaceToJumpBack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DirBack, HitLocation, TestMoveGoal;
    local /*0x97E50000-0x00000000*/ private float HitDistance, MaxDistanceCheck, MinAcceptableDistance;
    local /*0x97E50000-0x00000000*/ private bool bHit;

    MaxDistanceCheck = 300.0000000;
    MinAcceptableDistance = 200.0000000;
    DirBack = -Vector(Pawn.Rotation);
    DirBack.Z = 0.0000000;
    DirBack = Normal(DirBack);
    TestMoveGoal = Pawn.Location + (DirBack * MaxDistanceCheck);
    bHit = !MySPKynapseBotHandle.PathFinder_TraceLine(TestMoveGoal, Pawn.Location, HitLocation);
    // End:0x15C
    if(bHit)
    {
        // End:0x15C
        if(VSize2D(HitLocation - TestMoveGoal) < 1.0000000)
        {
            bHit = false;
        }
    }
    // End:0x1BF
    if(bHit)
    {
        HitDistance = VSize2D(HitLocation - Pawn.Location);
        // End:0x1BF
        if(HitDistance < MinAcceptableDistance)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function @NULL GetFormationRadiusForEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], OutRadius;
    local /*0x97E50000-0x00000400*/ private @NULL LPResMan;

    OutRadius = 0.0000000;
    // End:0x87
    if(InEnemy != none)
    {
        LPResMan = InEnemy.AIResourceManager;
        // End:0x87
        if(LPResMan != none)
        {
            OutRadius = LPResMan.GetFormationRadius(MeleeResourceName);
        }
    }
    return OutRadius;
    //return ReturnValue;    
}

function @NULL IsFormationBlockedByPawns()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL LPResMan;

    // End:0x6F
    if(InEnemy != none)
    {
        LPResMan = InEnemy.AIResourceManager;
        // End:0x6F
        if(LPResMan != none)
        {
            return LPResMan.IsFormationBlockedByPawns(MeleeResourceName);
        }
    }
    return false;
    //return ReturnValue;    
}

function @NULL ConstraintMovementInFacingDirection()
{
    local /*0x97E50000-0x00000000*/ private bool bConstraint[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;

    // End:0xA4
    if(myAIPawn != none)
    {
        BotHandle = SPKynapseBotHandle(myAIPawn.myKynapseHandle);
        // End:0x78
        if(BotHandle != none)
        {
            BotHandle.ConstraintMovementInFacingDirection(bConstraint);
        }
        myAIPawn.bCanStrafe = !bConstraint;
    }
    //return;    
}

function @NULL GetRangedFormationRadiusForEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], OutRadius;
    local /*0x97E50000-0x00000400*/ private @NULL LPResMan;

    OutRadius = 0.0000000;
    // End:0x87
    if(InEnemy != none)
    {
        LPResMan = InEnemy.AIResourceManager;
        // End:0x87
        if(LPResMan != none)
        {
            OutRadius = LPResMan.GetFormationRadius(RangedResourceName);
        }
    }
    return OutRadius;
    //return ReturnValue;    
}

function @NULL IsRangedFormationBlockedByPawns()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL LPResMan;

    // End:0x6F
    if(InEnemy != none)
    {
        LPResMan = InEnemy.AIResourceManager;
        // End:0x6F
        if(LPResMan != none)
        {
            return LPResMan.IsFormationBlockedByPawns(RangedResourceName);
        }
    }
    return false;
    //return ReturnValue;    
}

function SetAllowedToPerformReactiveAttack()
{
    bAllowedToPerformReactiveAttack = true;
    //return;    
}

function SetNotAllowedToPerformReactiveAttack()
{
    bAllowedToPerformReactiveAttack = false;
    //return;    
}

function SetPerformingReactiveAttack()
{
    bPerformingReactiveAttack = true;
    //return;    
}

function SetNotPerformingReactiveAttack()
{
    bPerformingReactiveAttack = false;
    //return;    
}

function GetIfPerformingReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bPerformingReactiveAttack;
    //return ReturnValue;    
}

event GetTimeOfLastAttackStarted()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TimeOfLastAttackStarted;
    //return ReturnValue;    
}

event GetTimeOfLastAttackEnded()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TimeOfLastAttackEnded;
    //return ReturnValue;    
}

function StampTimeOfLastAttackStarted()
{
    TimeOfLastAttackStarted = WorldInfo.TimeSeconds;
    //return;    
}

function ResetTimeOfLastAttackStarted()
{
    TimeOfLastAttackStarted = -1.0000000;
    //return;    
}

function StampTimeOfLastAttackEnded()
{
    TimeOfLastAttackEnded = WorldInfo.TimeSeconds;
    //return;    
}

function ResetTimeOfLastAttackEnded()
{
    TimeOfLastAttackEnded = -1.0000000;
    //return;    
}

function ShowAttackArtifacts()
{
    bShowAttacArtifacts = true;
    //return;    
}

function DoNotShowAttackArtifacts()
{
    bShowAttacArtifacts = false;
    //return;    
}

function AreWeShowingAttackArtifacts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bShowAttacArtifacts;
    //return ReturnValue;    
}

function DrawAttackArcs()
{
    //return;    
}

function ForceToNotLookForAttacksWhileStalking()
{
    bForcedToNotLookForAttacksWhileStalking = true;
    //return;    
}

function UnForceToNotLookForAttacksWhileStalking()
{
    bForcedToNotLookForAttacksWhileStalking = false;
    //return;    
}

function AreWeForcedToNotLookForAttacksWhileStalking()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bForcedToNotLookForAttacksWhileStalking;
    //return ReturnValue;    
}

function MoveLookingMode()
{
    local /*0x97E50000-0x00000000*/ private byte inLookMoveMode[8388609];

    // End:0x41
    if(!bForcedMoveLooking)
    {
        bForcedMoveLooking = true;
        PrevLookAtStartMoving = inLookMoveMode;
        lookWhenStartMoving = inLookMoveMode;
    }
    //return;    
}

function RestoreMoveLookingMode()
{
    // End:0x2C
    if(bForcedMoveLooking)
    {
        bForcedMoveLooking = false;
        lookWhenStartMoving = PrevLookAtStartMoving;
    }
    //return;    
}

function ShouldShowChargeAndWithDrawPointArtifacts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x44
    if(myAIPawn != none)
    {
        return myAIPawn.TuneDataAIPawn.bShowChargeAndWithDrawPointArtifacts;
    }
    return false;
    //return ReturnValue;    
}

event HandleAnimNotifyApplyMeleeDamage()
{
    local /*0x97E50000-0x00000000*/ private class DamageTypeToGive[8388609];

    //return;    
}

function NotifyStuckCollidingWithWorld()
{
    //return;    
}

function NotifyStuckPathingFailed()
{
    //return;    
}

function ResetRotationRate()
{
    // End:0x2E
    if(MySPPawn != none)
    {
        MySPPawn.super(LPAIController).ResetRotationRate();
    }
    //return;    
}

function ZeroRotationRate()
{
    // End:0x2E
    if(MySPPawn != none)
    {
        MySPPawn.super(LPAIController).ZeroRotationRate();
    }
    //return;    
}

function EnableRotation()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x92
    if(bEnable)
    {
        Kynapse_ActivateBot(false);
        MySPPawn.SetDesiredRotation(MySPPawn.Rotation);
        Kynapse_ActivateBot(true);
        MySPPawn.LockDesiredRotation(false);
        ResetRotationRate();        
    }
    else
    {
        Kynapse_ActivateBot(false);
        MySPPawn.RotationRate.Yaw = 0;
        Focus = none;
        MySPPawn.SetDesiredRotation(MySPPawn.Rotation);
        MySPPawn.LockDesiredRotation(true);
    }
    //return;    
}

function IsThisActorTheVsAndInGivenAvoidanceZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorToTest[8388609];
    local /*0x97E50000-0x00000000*/ private float ACosAngleOfZone[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyMovingTowards[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceRangeOfZoneSq[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, displacementToVs, displacementFromVs, displacementFromVsToEnemyMovingTowards, myHeading;

    local /*0x97E50000-0x00000000*/ private float dotToVs, dotFromVsToEnemyMovingTowards, rangeToVsSq;

    -1.0000000
    vsPawn = LPBaseVSPlayerPawn(ActorToTest);
    // End:0x2AC
    if((vsPawn != none) && vsPawn.Controller == none)
    {
        displacementToVs = vsPawn.Location - myAIPawn.Location;
        // End:0xE1
        if(DistanceRangeOfZoneSq > float(0))
        {
            rangeToVsSq = VSizeSq(displacementToVs);
            // End:0xE1
            if(rangeToVsSq > DistanceRangeOfZoneSq)
            {
                return false;
            }
        }
        displacementToVs.Z = 0.0000000;
        displacementToVs = Normal(displacementToVs);
        // End:0x214
        if(EnemyMovingTowards != none)
        {
            displacementFromVs = myAIPawn.Location - vsPawn.Location;
            displacementFromVs = Normal(displacementFromVs);
            displacementFromVsToEnemyMovingTowards = EnemyMovingTowards.Location - vsPawn.Location;
            displacementFromVsToEnemyMovingTowards = Normal(displacementFromVsToEnemyMovingTowards);
            dotFromVsToEnemyMovingTowards = displacementFromVs Dot displacementFromVsToEnemyMovingTowards;
            // End:0x214
            if(dotFromVsToEnemyMovingTowards > 0.0000000)
            {
                return false;
            }
        }
        myHeading = Vector(myAIPawn.Rotation);
        myHeading.Z = 0.0000000;
        myHeading = Normal(myHeading);
        dotToVs = displacementToVs Dot myHeading;
        // End:0x2AC
        if(dotToVs > ACosAngleOfZone)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function @NULL HandleRunIntoAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function @NULL RanIntoActorWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, hitPush, runIntoPawn,
	    newHitInfo;

    // End:0x3E1
    if(Other != none)
    {
        runIntoPawn = LPPawn(Other);
        // End:0x259
        if(runIntoPawn != none)
        {
            // End:0x256
            if(Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, PawnsRunIntoWhileMoveing, WorldInfo.TimeSeconds, true))
            {
                // End:0x256
                if(HandleRunIntoAnimation(Other, OtherComp, HitLocation, HitNormal))
                {
                    // End:0x102
                    if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
                    {
                        HitLocation = OtherComp.GetPosition();
                    }
                    hitPush = -HitNormal;
                    hitPush.Z = 0.0000000;
                    hitPush = ((hitPush * VSize(myAIPawn.Velocity)) * myAIPawn.Mass) * myAIPawn.TuneDataAIPawn.MovementAdditionPushFactor;
                    AdjustHitPushForUnoccupiedVs(runIntoPawn, hitPush);
                    PlayCorrectEffectsForMoveHit(runIntoPawn);
                    runIntoPawn.TakeDamage(int(GetDamageDoneToRanIntoActor(Other)), self, HitLocation, hitPush, GetDamageTypeDoneToRanIntoActor(Other),, myAIPawn);
                }
            }            
        }
        else
        {
            // End:0x2AE
            if((Other.Base != none) && Other.Base == myAIPawn)
            {                
            }
            else
            {
                // End:0x2F2
                if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
                {
                    HitLocation = OtherComp.GetPosition();
                }
                hitPush = Other.Location - myAIPawn.Location;
                hitPush = Normal(hitPush);
                newHitInfo.HitComponent = OtherComp;
                Other.TakeDamage(int(GetDamageDoneToRanIntoActor(Other)), self, HitLocation, hitPush, GetDamageTypeDoneToRanIntoActor(Other), newHitInfo, myAIPawn);
            }
        }
    }
    //return;    
}

function AdjustHitPushForUnoccupiedVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609], hitPush;

    //return;    
}

simulated function PlayCorrectEffectsForMoveHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];

    //return;    
}

function GetDamageDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function GetDamageTypeDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPDamageTypeMelee';
    //return ReturnValue;    
}

function ConvertRangeToSeperation()
{
    local /*0x97E50000-0x00000000*/ private float RangeToConvert[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = MyKynapseRadius + Class'LPAIUtils'.static.KynapseAdjustedRadius(OtherPawn);
    return RangeToConvert - combinedRadius;
    //return ReturnValue;    
}

function ConvertRangeToSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float RangeToConvert[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = MyKynapseRadius + Class'LPAIUtils'.static.KynapseAdjustedRadius(OtherPawn);
    return RangeToConvert - combinedRadius;
    //return ReturnValue;    
}

function CanPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsTurnToFaceTargetCommandNeeded()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetForCalc[8388609];
    local /*0x97E50000-0x00000000*/ private float MinAngleInDegreesNeededForTurnToFaceCommand[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL deltaToTarget, rotToTarget;
    local /*0x97E50000-0x00000000*/ private int RotDelta;
    local /*0x97E50000-0x00000000*/ private float deltaDegrees;

    deltaToTarget = TargetForCalc.Location - myAIPawn.Location;
    // End:0x76
    if(Class'SPEngine.SPUtil'.static.IsNearlyZero(deltaToTarget))
    {
        return false;
    }
    rotToTarget = Rotator(deltaToTarget);
    RotDelta = rotToTarget.Yaw - myAIPawn.Rotation.Yaw;
    deltaDegrees = NormalizeAngle(float(RotDelta) * 0.0054932);
    // End:0x125
    if(Abs(deltaDegrees) >= MinAngleInDegreesNeededForTurnToFaceCommand)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnConsoleCommand()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Command;

    // End:0x73
    foreach inAction.Commands(Command)
    {
        // End:0x72
        if(Command == "KillPawn")
        {
            // End:0x72
            if(myAIPawn != none)
            {
                myAIPawn.ScriptedKillPawn();
            }
        }        
    }    
    //return;    
}

function DoesTheDestenationPassMeToCloseToMyEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToCheckAgainst[8388609], PointMovingTo;
    local /*0x97E50000-0x00000000*/ private float WhatIsToClose[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vecNpcToDest, vecDestToNpc, vecNpcToEnemy, vecDestToEnemy;
    local /*0x97E50000-0x00000000*/ private float distanceFromEnemyToPath;

    vecNpcToDest = PointMovingTo - myAIPawn.Location;
    vecDestToNpc = myAIPawn.Location - PointMovingTo;
    vecNpcToEnemy = EnemyToCheckAgainst.Location - myAIPawn.Location;
    vecDestToEnemy = EnemyToCheckAgainst.Location - PointMovingTo;
    // End:0x1A0
    if((vecNpcToDest Dot vecNpcToEnemy) > float(0))
    {
        // End:0x1A0
        if((vecDestToNpc Dot vecDestToEnemy) > float(0))
        {
            distanceFromEnemyToPath = Class'SPEngine.SPUtil'.static.SPDistanceToLine(myAIPawn.Location, PointMovingTo, EnemyToCheckAgainst.Location);
            // End:0x1A0
            if(distanceFromEnemyToPath < WhatIsToClose)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x63
    if(seperationToEnemy2D < myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike)
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function IsPawnInMustStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x63
    if(seperationToEnemy2D < myAIPawn.TuneDataAIPawn.MaxSeperationForContinuousAttackDirectPhysicalStrike)
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function IsPawnToFarAwayToEvenTryContinuousStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    // End:0x11
    if(PawnToTest == none)
    {
        return true;
    }
    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x71
    if(seperationToEnemy2D > myAIPawn.TuneDataAIPawn.MaxSeperationToEvenTryContinuousStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsPawnFarEnoughAwayToEndContinuousAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    // End:0x11
    if(PawnToTest == none)
    {
        return true;
    }
    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x71
    if(seperationToEnemy2D > myAIPawn.TuneDataAIPawn.MaxSeperationToTriggerEndOfContinuousAttack)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CalculateRangedLobPointToStrikeFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom[25165825], LocationToStartAttackFrom, PawnAttacking;
    local /*0x97E50000-0x00000000*/ private float PitchAngleFromTargetForRangedStrikeInDegrees[8388609], DistanceFromTargetForRangedStrikeInUU, RangeToLookForMovementNode;
    local /*0x97E50000-0x00000000*/ private bool bCheckIfCanMoveToThisLocation[8388609], ReturnValue;

    return false;
    //return ReturnValue;    
}

event @NULL IsOnNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;

    // End:0x7E
    if(myAIPawn != none)
    {
        BotHandle = SPKynapseBotHandle(myAIPawn.myKynapseHandle);
        // End:0x7E
        if((BotHandle != none) && BotHandle.PathFinder_IsLocationInNavMesh(DesiredPos))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsThereAClearLobAttackLaneFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int IndexIntoValidationInfoList[8388609], ZoneCurrentlyIn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, baseLaunchLoc;
    local /*0x97E50000-0x00000000*/ private int currentZonesAltArc;
    local /*0x97E50000-0x00000000*/ private @NULL QRot, fireVel;
    local /*0x97E50000-0x00000000*/ private bool bfoundArc;
    local /*0x97E50000-0x00000000*/ private float desiredZPercentOfArc, distanceFromTarget;

    ZoneCurrentlyIn = -1;
    fireVel.X = 0.0000000;
    fireVel.Y = 0.0000000;
    fireVel.Z = 0.0000000;
    targetsOffsetForCals = Pawn2Attack.Location;
    targetsOffsetForCals.Z += myAIPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc;
    myAIPawn.LobStrikeLocValidationInfoList[IndexIntoValidationInfoList].LogAlgosSegmentValiditys.Length = 0;
    myAIPawn.LobStrikeLocValidationInfoList[IndexIntoValidationInfoList].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - myAIPawn.Location;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, myAIPawn.TuneDataAIPawn.OffsetForCalcOfLobFirStrike);
    // End:0x4FF
    if(myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone >= 0)
    {
        distanceFromTarget = myAIPawn.GetRangedLobFireMidZoneRangeForThisZone(myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone);
        baseLaunchLoc = myAIPawn.Location - Pawn2Attack.Location;
        baseLaunchLoc = Normal(baseLaunchLoc);
        baseLaunchLoc = baseLaunchLoc * distanceFromTarget;
        baseLaunchLoc = Pawn2Attack.Location + baseLaunchLoc;
        ZoneCurrentlyIn = myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone;
        // End:0x493
        if(myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZonesAltArc >= 0)
        {
            currentZonesAltArc = myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZonesAltArc;
            desiredZPercentOfArc = myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].AltDesiredZPercentOfLobList[myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZonesAltArc];            
        }
        else
        {
            currentZonesAltArc = -1;
            desiredZPercentOfArc = myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].DesiredZPercentOfLob;
        }        
    }
    else
    {
        ZoneCurrentlyIn = myAIPawn.FindCurrentLobFromAnywhereZone(Pawn2Attack);
        // End:0x542
        if(ZoneCurrentlyIn < 0)
        {
            return false;
        }
        baseLaunchLoc = myAIPawn.Location;
        currentZonesAltArc = IndexIntoValidationInfoList - 1;
        // End:0x5F6
        if(currentZonesAltArc >= 0)
        {
            desiredZPercentOfArc = myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].AltDesiredZPercentOfLobList[currentZonesAltArc];            
        }
        else
        {
            desiredZPercentOfArc = myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].DesiredZPercentOfLob;
        }
    }
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + baseLaunchLoc;
    myAIPawn.LobStrikeLocValidationInfoList[IndexIntoValidationInfoList].LobFireLastPointToStrikeFrom = baseLaunchLoc;
    bfoundArc = myAIPawn.FindTossVelocity(fireVel, targetsOffsetForCals, pointToCalcLaunchFrom, myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].RangedLobFireIdealSpeed, myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].RangedLobFireMinSpeed, myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].RangedLobFireMaxSpeed, 0.0000000, desiredZPercentOfArc, myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneCurrentlyIn].ShapeOfProjectileForLobCalc,,, true, myAIPawn.GetBestCurrentVelocityForThisTarget(Pawn2Attack),, false, true, IndexIntoValidationInfoList);
    // End:0x8C1
    if(bfoundArc)
    {
        myAIPawn.SetRangedLobStrikeZoneInfo(ZoneCurrentlyIn, currentZonesAltArc);
        return true;        
    }
    else
    {
        // End:0x8FC
        if(IndexIntoValidationInfoList <= 0)
        {
            myAIPawn.SetRangedLobStrikeZoneInfo(-1, -1);            
        }
        else
        {
            myAIPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();
        }
        return false;
    }
    return false;
    //return ReturnValue;    
}

function RangeBetweenPawnAndClosestVsToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetToTest[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsTesting;
    local /*0x97E50000-0x00000000*/ private float distanceToClosestVs, distanceToVsTesting;

    distanceToClosestVs = float(2147483647);
    // End:0xC4
    foreach WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', vsTesting)
    {
        distanceToVsTesting = VSize2D(TargetToTest.Location - vsTesting.Location);
        // End:0xC3
        if(distanceToVsTesting < distanceToClosestVs)
        {
            distanceToClosestVs = distanceToVsTesting;
        }        
    }    
    return distanceToClosestVs;
    //return ReturnValue;    
}

function GetCoverExplorer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function WantsToStartFiring()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn;

    TargetPawn = LPPawn(FireTarget);
    // End:0x51
    if((TargetPawn != none) && TargetPawn.InStruggleMode)
    {
        return false;
    }
    return super.WantsToStartFiring();
    //return ReturnValue;    
}

function WantsToKeepFiring()
{
    local /*0x97E50000-0x00000000*/ private @NULL Wpn[8388609];
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn;

    TargetPawn = LPPawn(FireTarget);
    // End:0x51
    if((TargetPawn != none) && TargetPawn.InStruggleMode)
    {
        return false;
    }
    return super.WantsToKeepFiring(Wpn, FireModeNum);
    //return ReturnValue;    
}

function @NULL AICanMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;

    // End:0x11
    if(!bScriptedCanDoMelee)
    {
        return false;
    }
    // End:0x4C
    if(!myAIPawn.TuneDataAIPawn.bCanMelee)
    {
        return false;
    }
    // End:0x72
    if(!CanHaveStrikeAccess(InEnemy))
    {
        CachedCanMelee = false;
        return false;
    }
    // End:0xBA
    if(HasDefendZones())
    {
        // End:0xBA
        if(!IsInDefendZone(InEnemy.Location))
        {
            CachedCanMelee = false;
            return false;
        }
    }
    // End:0xFC
    if((WorldInfo.TimeSeconds - TimeStampCanMelee) < MinTimeCanMeleeChecks)
    {
        return CachedCanMelee;
    }
    TimeStampCanMelee = WorldInfo.TimeSeconds;
    // End:0x177
    if(!HasDefendZones())
    {
        // End:0x177
        if(!CanReachToMelee(InEnemy.Location, InEnemy))
        {
            CachedCanMelee = false;
            return false;
        }
    }
    BotHandle = SPKynapseBotHandle(myAIPawn.myKynapseHandle);
    // End:0x214
    if(BotHandle != none)
    {
        // End:0x214
        if(BotHandle.PathFinder_IsCanPathToQueryEnabled(InEnemy))
        {
            // End:0x214
            if(!BotHandle.PathFinder_CanPathTo())
            {
                CachedCanMelee = false;
                return false;
            }
        }
    }
    CachedCanMelee = true;
    return true;
    //return ReturnValue;    
}

function AIWantsToFireWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialFireTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnFireTarget;

    // End:0x43
    if((WorldInfo.TimeSeconds - TimeStampLastTimeFiring) < WeaponFiringCooldownTime(PotentialFireTarget))
    {
        return false;
    }
    PawnFireTarget = LPPawn(PotentialFireTarget);
    // End:0x9E
    if(PawnFireTarget != none)
    {
        // End:0x9E
        if(IsThereFireAccess(PawnFireTarget))
        {
            // End:0x9E
            if(!CanHaveFireAccess(PawnFireTarget))
            {
                return false;
            }
        }
    }
    // End:0xDB
    if(!AIHaveLineOfFire(PotentialFireTarget, Pawn.GetWeaponStartTraceLocation()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    myAIPawn = LPAIPawn(inPawn);
    MyKynapseRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(myAIPawn);
    MyHeight = myAIPawn.CylinderComponent.CollisionHeight;
    AltToFormationLocMotarPointToStrikeFrom = vect(0.0000000, 0.0000000, 0.0000000);
    AltToFormationLocPointToStrikeFromIndexInManager = -1;
    bRunningSearchForAltToFormationLocPointToStrikeFrom = false;
    PawnsRunIntoWhileMoveing.MaxLifeTimeOfItemInList = myAIPawn.TuneDataAIPawn.DelayBetweenMovementHits;
    PawnsRunIntoWhileMoveing.MaxLifeTimeOfVsInList = myAIPawn.TuneDataAIPawn.DelayBetweenVsMovementHits;
    PawnsRunIntoWhileMoveing.MaxLifeTimeOfShutdownVsInList = myAIPawn.TuneDataAIPawn.DelayBetweenShutdownVsMovementHits;
    MaxEnemyHitPointsToStartStruggle = int(myAIPawn.TuneDataAIPawn.MaxEnemyHitPointsToStartStruggle.GetValue());
    // End:0x24E
    if(AIObjectiveManager != none)
    {
        AIObjectiveManager.EnableTicking(true);
    }
    //return;    
}

event UnPossess()
{
    super(SPKynapseAIController).UnPossess();
    ClearAllObjectives();
    // End:0x43
    if(AIObjectiveManager != none)
    {
        AIObjectiveManager.EnableTicking(false);
    }
    // End:0x5C
    if(AIResMortarLocManagerRef != none)
    {
        ReleaseAIResMortarLocManagerRef();
    }
    ReleaseAdHocSquadMgrAccess();
    //return;    
}

event Destroyed()
{
    super(SPKynapseAIController).Destroyed();
    // End:0x23
    if(AIResMortarLocManagerRef != none)
    {
        ReleaseAIResMortarLocManagerRef();
    }
    ReleaseAdHocSquadMgrAccess();
    ClearAllObjectives();
    // End:0x66
    if(AIObjectiveManager != none)
    {
        AIObjectiveManager.EnableTicking(false);
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, myCommand;

    myCommand = LPAICommand(CommandList);
    // End:0x6E
    if(myCommand != none)
    {
        myCommand.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, myCommand;

    myCommand = LPAICommand(CommandList);
    // End:0x65
    if(myCommand != none)
    {
        myCommand.Bump(Other, OtherComp, HitNormal);
    }
    //return;    
}

function @NULL TouchedOtherActorDuringMoveCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

function @NULL BumpedOtherActorDuringMoveCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    //return;    
}

function NotifyPreActiveDefenseSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatWindow[25296897], Activator, myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x5D
    if(myCommand != none)
    {
        myCommand.NotifyPreActiveDefenseSpecialMove(CombatWindow, Activator);
    }
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897], myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x54
    if(myCommand != none)
    {
        myCommand.MeleeHitSomethingNew(Info);
    }
    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0xAB [Loop If]
    if(curCommand != none)
    {
        curCommand.ImpactCombatTargetHitSomethingNew(HitActor, ImpactLocation, ImpactSocketName, ImpactRadius, DamageTypeToApplied);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function NotifyTraceDamagePartHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private int AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0xAB [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyTraceDamagePartHitSomething(HitActor, ImpactLocation, AmountOfDamage, DamageTypeToApplied, HitInfo);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event HandleAnimNotifyDamageSmartActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x7E [Loop If]
    if(curCommand != none)
    {
        curCommand.HandleAnimNotifyDamageSmartActor();
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event HandleAnimNotifyDamageSmartActorRanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x7E [Loop If]
    if(curCommand != none)
    {
        curCommand.HandleAnimNotifyDamageSmartActorRanged();
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function NotifyFormationLocationBecomingInvalid()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocBecomingInvalid[8388609], curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyFormationLocationBecomingInvalid(LocBecomingInvalid);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x90 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyThatSpecialDodgeReady()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609], curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyThatSpecialDodgeReady(Dodger);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeBegin()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte MomentumHint[8388609];

    super(SPAIController).HandleAnimNotifyMeleeStrikeBegin(GroupClass, MomentumHint);
    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];

    super(SPAIController).HandleAnimNotifyMeleeStrikeEnd(GroupClass);
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x4B
    if(myCommand != none)
    {
        myCommand.NotifyStopPawnChoreography();
    }
    //return;    
}

event EngagedInCommittedBehavior()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bengagedInCommittedBehavior;

    bengagedInCommittedBehavior = false;
    curCommand = LPAICommand(CommandList);
    J0x28:

    // End:0x9B [Loop If]
    if(curCommand != none)
    {
        // End:0x67
        if(!curCommand.IsInterruptible())
        {
            bengagedInCommittedBehavior = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    return bengagedInCommittedBehavior;
    //return ReturnValue;    
}

function NotfiyControllerOfPawnChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingFrom[8388609], PawnSwitchingTo;
    local /*0x97E50000-0x00000000*/ private bool bengagedInCommittedBehavior;
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    // End:0xC0
    if((MyLPEnemy == PawnSwitchingFrom) || MyLPEnemy == PawnSwitchingTo)
    {
        curCommand = LPAICommand(CommandList);
        J0x4C:

        // End:0xC0 [Loop If]
        if(curCommand != none)
        {
            curCommand.NotfiyEnemyChangedPawns(PawnSwitchingFrom, PawnSwitchingTo);
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x4C;
        }
    }
    // End:0x150
    if(MyLPEnemy == PawnSwitchingFrom)
    {
        bengagedInCommittedBehavior = EngagedInCommittedBehavior();
        // End:0x12E
        if(!bengagedInCommittedBehavior)
        {
            AddTarget(PawnSwitchingTo);
            RemoveThisTargetAndForceObjectiveUpdate(PawnSwitchingFrom);
            ReleaseAdHocSquadMgrAccess();            
        }
        else
        {
            AddTarget(PawnSwitchingTo);
            bNeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior = true;
        }        
    }
    else
    {
        // End:0x18C
        if(IsTarget(PawnSwitchingFrom))
        {
            RemoveTarget(PawnSwitchingFrom);
            AddTarget(PawnSwitchingTo);
        }
    }
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack;
    local /*0x97E50000-0x00000000*/ private bool ReturnVal;

    // End:0x97
    if(((StrikeAccess != none) && ResourceAccess == StrikeAccess) && StrikeAccess.GetResource() != none)
    {
        EnemyForAttack = LPPawn(StrikeAccess.GetResource().GetResourceOwner());
    }
    ReturnVal = super(SPBaseAIController).NotifyAIResourceAccessLost(ResourceAccess);
    // End:0xD7
    if(EnemyForAttack != none)
    {
        HandleStrikeAccessLost(EnemyForAttack);
    }
    return ReturnVal;
    //return ReturnValue;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return NotifyTopCommandAIResourceChanged(ResourceAccess);
    //return ReturnValue;    
}

function HandleStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], OtherPawn, OtherController;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Attackers;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x124
    if(EnemyForAttack != none)
    {
        EnemyForAttack.AIResourceManager.GetAllUsers(MeleeResourceName, Attackers);
        I = 0;
        J0x61:

        // End:0x124 [Loop If]
        if(I < Attackers.Length)
        {
            OtherPawn = LPAIPawn(Attackers[I]);
            // End:0x116
            if(OtherPawn != none)
            {
                OtherController = LPAIController(OtherPawn.Controller);
                // End:0x116
                if(OtherController != none)
                {
                    OtherController.NotifyStrikeAccessAvailable(myAIPawn);
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x61;
        }
    }
    //return;    
}

event NotifyStrikeAccessAvailable()
{
    local /*0x97E50000-0x00000000*/ private @NULL LastUser[8388609], Cmd;

    // End:0x8D
    if(CommandList != none)
    {
        Cmd = CommandList;
        J0x22:

        // End:0x8D [Loop If]
        if(Cmd != none)
        {
            LPAICommand(Cmd).NotifyStrikeAccessAvailable(LastUser);
            Cmd = Cmd.ChildCommand;
            // [Loop Continue]
            goto J0x22;
        }
    }
    //return;    
}

function AcquireAIResMortarLocManagerRef()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMapInfo;

    // End:0xB7
    if(AIResMortarLocManagerRef == none)
    {
        LPMapInfo = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0xB7
        if((LPMapInfo != none) && LPMapInfo.AIResManMapMaster != none)
        {
            AIResMortarLocManagerRef = LPMapInfo.AIResManMapMaster.AIResMortarLocManager;            
        }
    }
    //return;    
}

function ReleaseAIResMortarLocManagerRef()
{
    // End:0x3A
    if(AIResMortarLocManagerRef != none)
    {
        AIResMortarLocManagerRef.RemoveAllMortarLocationsAndRequestsForThisUser(self);
        AIResMortarLocManagerRef = none;
    }
    //return;    
}

function ReleaseMortarLocaion()
{
    local /*0x97E50000-0x00000000*/ private @NULL MortLoc[25296897];
    local /*0x97E50000-0x00000000*/ private int InPointToStrikeFromIndexInManager[8388609];

    // End:0x4F
    if(AIResMortarLocManagerRef != none)
    {
        // End:0x4F
        if(InPointToStrikeFromIndexInManager >= 0)
        {
            AIResMortarLocManagerRef.NotifyMortarLocaionGivenUpOrLost(MortLoc, InPointToStrikeFromIndexInManager);
        }
    }
    //return;    
}

function StartSearchForBestMortarPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheTarget[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxFindMortarLocTraversalDistance[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> HasValidMortarArcTest[8388609], FindMortarSpotTraversalFinished;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5D
    if(AIResMortarLocManagerRef != none)
    {
        return AIResMortarLocManagerRef.StartSearchForBestMortarPositionForUser(TheTarget, self, myAIPawn, MaxFindMortarLocTraversalDistance, HasValidMortarArcTest, FindMortarSpotTraversalFinished);
    }
    return false;
    //return ReturnValue;    
}

function RemoveThisTargetAndForceObjectiveUpdate()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawnToRemove[8388609];

    bNeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior = false;
    // End:0x2E
    if(TargetPawnToRemove != none)
    {
        RemoveTarget(TargetPawnToRemove);
    }
    // End:0x5C
    if(CurrentObjective != none)
    {
        CurrentObjective.Abort();
    }
    // End:0xCB
    if(myAIPawn.Health > 0)
    {
        AIObjectiveManager.ResetAllNonKismetTimesToNextGenerate(0.0000000);
        AIObjectiveManager.CallObjectiveGenerators(1.0000000);        
    }
    //return;    
}

function GetCurrentAttackDesirabilityScaler()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanFollowerBeGivingThisTypeOfAttack()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bcanBeGiving;
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    bcanBeGiving = true;
    myCommand = LPAICommand(CommandList);
    // End:0x6A
    if(myCommand != none)
    {
        bcanBeGiving = myCommand.CanFollowerBeGivingThisTypeOfAttack(TypeOfAttack);
    }
    return bcanBeGiving;
    //return ReturnValue;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    //return;    
}

function NotifyJustReleasedFromGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL MoveEnding[8388609], GrapplerReleasingMe;
    local /*0x97E50000-0x00000000*/ private bool bGrabAbruptRelease[8388609];

    //return;    
}

function NotifyToMassRetreat()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThingToRetreatFrom[8388609];

    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x5D
    if(myCommand != none)
    {
        myCommand.CoreDestroyed(CoreTag, CoreIndex);
    }
    //return;    
}

function HandleDismemberment()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x5E
    if(myCommand != none)
    {
        return myCommand.HandleDismemberment(CoreTag, CoreIndex);
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x99 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x90 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyOfDangerousAmountOfDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x7E [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyOfDangerousAmountOfDamage();
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyGettingGrabbed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x8C [Loop If]
    if(curCommand != none)
    {
        // End:0x58
        if(curCommand.NotifyGettingGrabbed(InVsPawn))
        {
            return true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    return false;
    //return ReturnValue;    
}

event NotifyWinchProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609], WinchProj, curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x90 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyWinchProjectileFire(InVsPawn, WinchProj);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyWinchProjectileRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609], curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyWinchProjectileRetracting(InVsPawn);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyVsMeleeSwingStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609], curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyVsMeleeSwingStart(InVsPawn);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyVsMeleeSwingEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609], curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyVsMeleeSwingEnd(InVsPawn);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function TriggerDisableAICmd()
{
    // End:0x2E
    if(AIObjectiveManager != none)
    {
        AIObjectiveManager.ClearAllObjectives();
    }
    Class'LPAICmd_DisableAI'.static.InitCommand(self);
    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetAngleFromPlayerView()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], PlayerTarget;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], AnglePlayerViewToStalker;
    local /*0x97E50000-0x00000000*/ private @NULL DirToStalker, PlayerCtrl, CameraDir;

    // End:0x15
    if(PlayerTarget == none)
    {
        return 0.0000000;
    }
    PlayerCtrl = PlayerController(PlayerTarget.Controller);
    // End:0x5B
    if(PlayerCtrl == none)
    {
        return 0.0000000;
    }
    CameraDir = Vector(PlayerCtrl.PlayerCamera.CameraCache.POV.Rotation);
    DirToStalker = Normal(InLocation - PlayerTarget.Location);
    AnglePlayerViewToStalker = Acos(DirToStalker Dot CameraDir) * 57.2957800;
    return AnglePlayerViewToStalker;
    //return ReturnValue;    
}

function IsInPlayerLookingDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToCheck[8388609], PlayerTarget;
    local /*0x97E50000-0x00000000*/ private float MaxDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float AnglePlayerViewToStalker;

    AnglePlayerViewToStalker = GetAngleFromPlayerView(PawnToCheck.Location, PlayerTarget);
    // End:0x57
    if(AnglePlayerViewToStalker < MaxDegrees)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

event IsAiPawnInGivenTargetsReativeArc()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float FrontalArcInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseTargetPawnsAimDirInsteadOfRotation[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL DirToTarget;
    local /*0x97E50000-0x00000000*/ private float enemysYaw, dirToTargetInDegrees;

    DirToTarget = myAIPawn.Location - TargetPawn2Test.Location;
    // End:0xA2
    if(bUseTargetPawnsAimDirInsteadOfRotation)
    {
        enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(TargetPawn2Test.GetWorldAimDir()));        
    }
    else
    {
        enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(TargetPawn2Test.Rotation));
    }
    dirToTargetInDegrees = Class'SPEngine.SPUtil'.static.GetYaw(DirToTarget);
    // End:0x147
    if(IsYawInRange(enemysYaw, dirToTargetInDegrees, FrontalArcInDegrees))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetEnemysFactorInArc()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float HalfFrontalArc[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL DirToTarget;
    local /*0x97E50000-0x00000000*/ private float enemysYaw, dirToTargetInDegrees, localBaringToTarget, frontalFactor;

    // End:0x17
    if(HalfFrontalArc == float(0))
    {
        return 0.0000000;
    }
    frontalFactor = 1.0000000;
    DirToTarget = myAIPawn.Location - Pawn2Test.Location;
    enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(Pawn2Test.GetWorldAimDir()));
    dirToTargetInDegrees = Class'SPEngine.SPUtil'.static.GetYaw(DirToTarget);
    localBaringToTarget = dirToTargetInDegrees - enemysYaw;
    // End:0x138
    if(localBaringToTarget > 180.0000000)
    {
        localBaringToTarget = -360.0000000 + localBaringToTarget;        
    }
    else
    {
        // End:0x165
        if(localBaringToTarget < -180.0000000)
        {
            localBaringToTarget = 360.0000000 + localBaringToTarget;
        }
    }
    // End:0x19C
    if(localBaringToTarget < HalfFrontalArc)
    {
        frontalFactor = Abs(localBaringToTarget) / HalfFrontalArc;
    }
    return frontalFactor;
    //return ReturnValue;    
}

function IsEnemyInAttackArc()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DirToTarget;
    local /*0x97E50000-0x00000000*/ private float enemysYaw, dirToTargetInDegrees;
    local /*0x97E50000-0x00000000*/ private int iter;

    DirToTarget = myAIPawn.Location - Pawn2Test.Location;
    // End:0xCC
    if(myAIPawn.TuneDataAIPawn.bUsePawnsAimDirInsteadOfRotation)
    {
        enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(Pawn2Test.GetWorldAimDir()));        
    }
    else
    {
        enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(Pawn2Test.Rotation));
    }
    dirToTargetInDegrees = Class'SPEngine.SPUtil'.static.GetYaw(DirToTarget);
    iter = 0;
    J0x152:

    // End:0x200 [Loop If]
    if(iter < myAIPawn.TuneDataAIPawn.AttacksArcs.Length)
    {
        // End:0x1F2
        if(IsYawInRangeOfAttackArc(enemysYaw, dirToTargetInDegrees, myAIPawn.TuneDataAIPawn.AttacksArcs[iter]))
        {
            return true;
        }
        iter++;
        // [Loop Continue]
        goto J0x152;
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyInReactiveAttackArc()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DirToTarget;
    local /*0x97E50000-0x00000000*/ private float enemysYaw, dirToTargetInDegrees;
    local /*0x97E50000-0x00000000*/ private int iter;

    DirToTarget = myAIPawn.Location - Pawn2Test.Location;
    // End:0xCC
    if(myAIPawn.TuneDataAIPawn.bUsePawnsAimDirInsteadOfRotationForReactiveAttacks)
    {
        enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(Pawn2Test.GetWorldAimDir()));        
    }
    else
    {
        enemysYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(Pawn2Test.Rotation));
    }
    dirToTargetInDegrees = Class'SPEngine.SPUtil'.static.GetYaw(DirToTarget);
    iter = 0;
    J0x152:

    // End:0x200 [Loop If]
    if(iter < myAIPawn.TuneDataAIPawn.ReactiveAttacksArcs.Length)
    {
        // End:0x1F2
        if(IsYawInRangeOfAttackArc(enemysYaw, dirToTargetInDegrees, myAIPawn.TuneDataAIPawn.ReactiveAttacksArcs[iter]))
        {
            return true;
        }
        iter++;
        // [Loop Continue]
        goto J0x152;
    }
    return false;
    //return ReturnValue;    
}

function IsYawInRange()
{
    local /*0x97E50000-0x00000000*/ private float YawOrgin[8388609], Yaw2Test, FrontalArc2BeIn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float localBaringToTarget, arcStart, arcEnd;

    arcStart = FrontalArc2BeIn / -2.0000000;
    arcEnd = FrontalArc2BeIn / 2.0000000;
    localBaringToTarget = Yaw2Test - YawOrgin;
    // End:0x82
    if(localBaringToTarget > 180.0000000)
    {
        localBaringToTarget = -360.0000000 + localBaringToTarget;        
    }
    else
    {
        // End:0xAF
        if(localBaringToTarget < -180.0000000)
        {
            localBaringToTarget = 360.0000000 + localBaringToTarget;
        }
    }
    // End:0xDF
    if(localBaringToTarget > arcStart)
    {
        // End:0xDF
        if(localBaringToTarget < arcEnd)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsYawInRangeOfAttackArc()
{
    local /*0x97E50000-0x00000000*/ private float YawOrgin[8388609], Yaw2Test;
    local /*0x97E50000-0x00000000*/ private @NULL Arc2BeIn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float localBaringToTarget, arcStart, arcEnd;

    arcStart = Arc2BeIn.TargetsFacing - Arc2BeIn.HalfArcSize;
    arcEnd = Arc2BeIn.TargetsFacing + Arc2BeIn.HalfArcSize;
    localBaringToTarget = Yaw2Test - YawOrgin;
    // End:0xD6
    if(localBaringToTarget > 180.0000000)
    {
        localBaringToTarget = -360.0000000 + localBaringToTarget;        
    }
    else
    {
        // End:0x103
        if(localBaringToTarget < -180.0000000)
        {
            localBaringToTarget = 360.0000000 + localBaringToTarget;
        }
    }
    // End:0x133
    if(localBaringToTarget > arcStart)
    {
        // End:0x133
        if(localBaringToTarget < arcEnd)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function FindLobSpotTraversalFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationFound[25296897];
    local /*0x97E50000-0x00000000*/ private int IndexOfMortarFromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SearchRequesterPawn[8388609], MortarLocationExplorerDone;

    bRunningSearchForAltToFormationLocPointToStrikeFrom = false;
    // End:0x89
    if(SearchRequesterPawn == myAIPawn)
    {
        AltToFormationLocMotarPointToStrikeFrom = LocationFound;
        AltToFormationLocPointToStrikeFromIndexInManager = IndexOfMortarFromLocation;
        myAIPawn.LobStrikeLocValidationInfoList[0].LobFireLastPointToStrikeFrom = LocationFound;        
    }
    //return;    
}

function IsValidLobStrikePositionInValidArea()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;

    // End:0x4E
    if(!IsThisValidLobStrikeRange(VSize2D(FromLocation - TestActor.Location), bUseErrorBuffer))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsThisValidLobStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private float RangeToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float MinRange, MaxRange;

    // End:0xAE
    if(bUseErrorBuffer)
    {
        MinRange = myAIPawn.TuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom.GetValue() - myAIPawn.TuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer.GetValue();        
    }
    else
    {
        MinRange = myAIPawn.TuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromMinRangeToLaunchFrom.GetValue();
    }
    // End:0x1AF
    if(bUseErrorBuffer)
    {
        MaxRange = myAIPawn.TuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom.GetValue() + myAIPawn.TuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromDistanceErrorBuffer.GetValue();        
    }
    else
    {
        MaxRange = myAIPawn.TuneDataAIPawn.SearchForAltToFormationLocPointToStrikeFromMaxRangeToLaunchFrom.GetValue();
    }
    // End:0x234
    if((RangeToTest < MinRange) || RangeToTest > MaxRange)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetMaxRangeFromMortarAlternateRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 50.0000000;
    //return ReturnValue;    
}

function IsValidLobStrikePosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int currentZoneIn;

    // End:0x24
    if(!IsValidLobStrikePositionInValidArea(FromLocation, TestActor, false))
    {
        return false;
    }
    // End:0xDB
    if(IsThereClearLobAttackLaneFromGivenLoc(FromLocation, TestActor, -1, 0, currentZoneIn))
    {
        myAIPawn.SetAimInfoForRangedLobStrike(TestActor.Location, TestActor, -1, currentZoneIn, myAIPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsThereClearLobAttackLaneFromGivenLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[25296897], TargetOfAttack;
    local /*0x97E50000-0x00000000*/ private int CurrentTierToTest[8388609], TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, ZoneCurrentlyIn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, QRot, fireVel;

    local /*0x97E50000-0x00000000*/ private bool bfoundArc;

    ZoneCurrentlyIn = -1;
    // End:0x6A
    if(CurrentTierToTest < 0)
    {
        ZoneCurrentlyIn = myAIPawn.FindCurrentLobFromGivenLocationZone(PointToStrikeFrom, TargetOfAttack);
        // End:0x6A
        if(ZoneCurrentlyIn < 0)
        {
            return false;
        }
    }
    fireVel.X = 0.0000000;
    fireVel.Y = 0.0000000;
    fireVel.Z = 0.0000000;
    targetsOffsetForCals = TargetOfAttack.Location;
    targetsOffsetForCals.Z += myAIPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc;
    myAIPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LogAlgosSegmentValiditys.Length = 0;
    myAIPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - PointToStrikeFrom;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, myAIPawn.TuneDataAIPawn.OffsetForCalcOfLobFirStrike);
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + PointToStrikeFrom;
    myAIPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LobFireLastPointToStrikeFrom = pointToCalcLaunchFrom;
    bfoundArc = myAIPawn.FindTossVelocity(fireVel, targetsOffsetForCals, pointToCalcLaunchFrom, myAIPawn.GetRangedLobFireIdealSpeedForThisTierOrZone(CurrentTierToTest, ZoneCurrentlyIn), myAIPawn.GetRangedLobFireMinSpeedForThisTierOrZone(CurrentTierToTest, ZoneCurrentlyIn), myAIPawn.GetRangedLobFireMaxSpeedForThisTierOrZone(CurrentTierToTest, ZoneCurrentlyIn), 0.0000000, myAIPawn.GetDesiredZPercentOfLobForThisTierOrZone(CurrentTierToTest, ZoneCurrentlyIn), myAIPawn.GetShapeOfProjectileForThisTierOrZone(CurrentTierToTest, ZoneCurrentlyIn),,, true, myAIPawn.GetBestCurrentVelocityForThisTarget(TargetOfAttack),, false, true, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement);
    // End:0x43E
    if(bfoundArc)
    {
        return true;        
    }
    else
    {
        return false;
    }
    return false;
    //return ReturnValue;    
}

function StartFindWithdrawToSpotTraversal()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThingWithdrawingFrom[8388609], LocToStartTraversal;
    local /*0x97E50000-0x00000000*/ private float RangeToExplore[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ValidSpotCallBack[9437185], NotifyTraversalFinish, NotifyTraversalAborted;

    IsValidWithdrawToPosition
    FindWithdrawToSpotTraversalFinished
    FindWithdrawToSpotTraversalAborted
    // End:0x81
    if(FindWithdrawToSpotTraversal == none)
    {
        FindWithdrawToSpotTraversal = LPKyTraversalFindWithdrawToSpot(Class'LPKyTraversalFindWithdrawToSpot'.static.Create());
    }
    PositionToWithdrawTo = vect(0.0000000, 0.0000000, 0.0000000);
    FindWithdrawToSpotTraversal.SetActor(ThingWithdrawingFrom);
    FindWithdrawToSpotTraversal.SetLosFunction(ValidSpotCallBack);
    FindWithdrawToSpotTraversal.SetFinishCallBack(NotifyTraversalFinish);
    FindWithdrawToSpotTraversal.SetAbortCallBack(NotifyTraversalFinish);
    // End:0x19D
    if(!IsOnNavMesh(LocToStartTraversal))
    {
        LocToStartTraversal = myAIPawn.Location;
        // End:0x19D
        if(!IsOnNavMesh(LocToStartTraversal))
        {
            FindWithdrawToSpotTraversal = none;
            return;
        }
    }
    FindWithdrawToSpotTraversal.StartAndBindToController(self, LocToStartTraversal, RangeToExplore);
    TimeLastFindWithdrawToSpotTraversalStarted = WorldInfo.TimeSeconds;
    bFoundValidWithdrawToPosition = false;
    //return;    
}

function FindWithdrawToSpotTraversalFinished()
{
    //return;    
}

function FindWithdrawToSpotTraversalAborted()
{
    TimeLastFindWithdrawToSpotTraversalStarted = -1.0000000;
    //return;    
}

function IsThisValidWithdrawFromCombatRange()
{
    local /*0x97E50000-0x00000000*/ private float RangeToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float MinRangeToLaunchFrom, MaxRangeToLaunchFrom;

    MinRangeToLaunchFrom = myAIPawn.TuneDataAIPawn.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway.GetValue();
    MaxRangeToLaunchFrom = myAIPawn.TuneDataAIPawn.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenRunningAway.GetValue();
    // End:0xD8
    if((RangeToTest < MinRangeToLaunchFrom) || RangeToTest > MaxRangeToLaunchFrom)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsValidWithdrawToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x61
    if(IsThisValidWithdrawFromCombatRange(VSize2D(LocationToTest - TestActor.Location)))
    {
        PositionToWithdrawTo = LocationToTest;
        bFoundValidWithdrawToPosition = true;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasValidWithdrawToPositionBeenFound()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x35
    if((FindWithdrawToSpotTraversal != none) && FindWithdrawToSpotTraversal.IsRunning())
    {
        return false;
    }
    return bFoundValidWithdrawToPosition;
    //return ReturnValue;    
}

function HasFindWithdrawToSpotTraversalRanToLongOrBeenAborted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float deltaFromTimeSearchStarted;

    // End:0x13
    if(TimeLastFindWithdrawToSpotTraversalStarted < float(0))
    {
        return true;
    }
    deltaFromTimeSearchStarted = WorldInfo.TimeSeconds - TimeLastFindWithdrawToSpotTraversalStarted;
    // End:0x9F
    if(deltaFromTimeSearchStarted >= myAIPawn.TuneDataAIPawn.MaxTimeFindWithdrawToSpotTraversalAllowedToRun.GetValue())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event OnAILatentStopped()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    //return;    
}

function OnAISetFocusEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    super(SPAIController).OnAISetFocusEnemy(inAction);
    // End:0x72
    if((inAction != none) && LPSeqAct_AISetFocusEnemy(inAction) != none)
    {
        // End:0x72
        if(LPSeqAct_AISetFocusEnemy(inAction).bForceObjectiveUpdate)
        {
            Think(true);
        }
    }
    //return;    
}

function OnMakeAiUnAwareOf()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], Action, LPPC, LPVS;
    local /*0x97E50000-0x00000000*/ private int I;

    Action = LPSeqAct_MakeAiUnAwareOf(inAction);
    // End:0x18D
    if(Action != none)
    {
        I = 0;
        J0x36:

        // End:0x18D [Loop If]
        if(I < Action.ActorList.Length)
        {
            // End:0x17F
            if(Action.bApplyToHumanPawnIfInVS)
            {
                LPPC = LPPlayerController(Action.ActorList[I]);
                LPVS = LPVSPlayerPawn(Action.ActorList[I]);
                // End:0x17F
                if(((LPVS != none) && LPPC != none) && LPPC.bIsInVitalSuit)
                {
                    Action.ActorList.AddItem(LPPC.HumanPlayerPawn);                    
                }
            }
            I++;
            // [Loop Continue]
            goto J0x36;
        }
    }
    super(SPAIController).OnMakeAiUnAwareOf(Action);
    //return;    
}

function OnAIDifficultlyTuning()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0xCA
    if(myAIPawn != none)
    {
        myAIPawn.HealthMax = int(inAction.NewMaxHealth);
        myAIPawn.Health = int(inAction.NewMaxHealth);
        myAIPawn.DifficultlyTuningDamageOutputFactor = inAction.DamageOutputChangeFactor;
    }
    //return;    
}

function OnAIMoveToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], ObjVar, Action;

    Action = LPSeqAct_AIMoveToActor(inAction);
    // End:0x3E
    if((myAIPawn == none) || Action == none)
    {
        return;
    }
    ClearLatentAction(Class'Engine.SeqAct_AIMoveToActor', true, Action);
    ScriptedFocus = none;
    // End:0xE8
    foreach Action.LinkedVariables(Class'Engine.SeqVar_Object', ObjVar, "Look At")
    {
        ScriptedFocus = Actor(ObjVar.GetObjectValue());
        // End:0xE7
        if(ScriptedFocus != none)
        {
            // End:0xE8
            break;
        }        
    }    
    ScriptedMoveTarget = Action.PickDestination(Pawn);
    CmdMoveToActorKismet(Action, ScriptedMoveTarget, ScriptedFocus, Action.bInterruptable, Action.WalkToDestination, Action.FaceTargetActorRotationOnArrival,,, Action.ArrivalStopType, Action.bAllowFiringWhileMoving,, Action.MovementSpeedModifier, Action.DistanceConsiderReached, Action.DistanceFaceDestinationOnArrival);
    //return;    
}

function OnAIAbortMoveToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    ClearLatentAction(Class'Engine.SeqAct_AIMoveToActor', true);
    AbortCommand(CommandList);
    //return;    
}

simulated function OnToggleStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], pawnForForceStruggleApon;

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bStruggleModeDisabled = false;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bStruggleModeDisabled = true;            
        }
        else
        {
            // End:0xDE
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bStruggleModeDisabled = !bStruggleModeDisabled;                
            }
            else
            {
                // End:0x249
                if(inAction.InputLinks[3].bHasImpulse)
                {
                    bStruggleModeForced = true;
                    // End:0x249
                    if(inAction.bForceTheImmediateStartOfStruggleModeNoMatterWhat)
                    {
                        // End:0x1D8
                        if(ClassIsChildOf(inAction.EnemyForForcedStruggle.Class, Class'Engine.Controller'))
                        {
                            pawnForForceStruggleApon = LPPawn(Controller(inAction.EnemyForForcedStruggle).Pawn);                            
                        }
                        else
                        {
                            pawnForForceStruggleApon = LPPawn(inAction.EnemyForForcedStruggle);
                        }
                        // End:0x249
                        if(pawnForForceStruggleApon != none)
                        {
                            ForceStruggleModeNow(pawnForForceStruggleApon, inAction.StruggleModeClass);
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function ClearAllObjectives()
{
    CurrentObjective = none;
    AIObjectiveManager.ClearAllObjectives();
    //return;    
}

function NotifyStartOfAnimatedPathCmd()
{
    myAIPawn.bWasInSemiGodWhenStartedAnimatedPath = myAIPawn.bSemiGodMode;
    // End:0x82
    if(myAIPawn.bShouldBeInSemiGodWhenOnAnimatedPaths)
    {
        myAIPawn.bSemiGodMode = true;
    }
    //return;    
}

function NotifyEndOfAnimatedPathCmd()
{
    // End:0x67
    if(myAIPawn.bShouldBeInSemiGodWhenOnAnimatedPaths)
    {
        // End:0x67
        if(!myAIPawn.bWasInSemiGodWhenStartedAnimatedPath)
        {
            myAIPawn.bSemiGodMode = false;
        }
    }
    //return;    
}

event StartAnimatedPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL Helper[8388609], myCommand;

    Class'LPAICmd_AnimatedPath'.static.InitCommand(self);
    myCommand = LPAICmd_AnimatedPath(GetActiveCommand());
    // End:0xA6
    if(myCommand != none)
    {
        myCommand.SetHelper(Helper);
        myCommand.SetAnimContext(GetAnimatedPathAnimContext(Helper));
    }
    //return;    
}

function GetAnimatedPathAnimContext()
{
    local /*0x97E50000-0x00000000*/ private @NULL Helper[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    //return;    
}

function CmdMoveToActorKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetAction[8388609], Target, LookAt;
    local /*0x97E50000-0x00000000*/ private bool bInterruptible[8388609], WalkToDestination, FaceTargetActorRotationOnArrival;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185];
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185], ReachDistance, InDistanceStartLooking;
    local /*0x97E50000-0x00000000*/ private bool bEnablePlayerSeparation[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_MoveToActor
    0
    0
    false
    0
    0.0000000
    0.0000000
    0.0000000
    false
    // End:0xB7
    if(int(CmdOption) == int(0))
    {
        // End:0xA3
        if(LPAICmd_MoveToActorKismet(CommandList) != none)
        {
            LPAICmd_MoveToActorKismet(CommandList).OnNewKismetAction(InKismetAction);
        }
        AbortCommand(CommandList);
    }
    // End:0xE7
    if(bInterruptible)
    {
        Class'LPAICmd_MoveToActorKismet'.static.InitCommand(self);        
    }
    else
    {
        Class'LPAICmd_MoveToActorKismetNonInterruptible'.static.InitCommand(self);
    }
    myCommand = LPAICmd_MoveToActorKismet(GetActiveCommand());
    // End:0x2D8
    if(myCommand != none)
    {
        myCommand.SetKismetAction(InKismetAction);
        myCommand.SetMaxSpeedScale(InMaxSpeedScale);
        myCommand.SetAllowFiring(bAllowFiring);
        myCommand.SetLookWhenStartMoving(inLookAtStartMoving);
        myCommand.SetDesiredTarget(Target);
        myCommand.SetDesiredReachDistance(ReachDistance);
        myCommand.SetDesiredSeperation(ReachDistance);
        myCommand.SetShouldWalk(WalkToDestination);
        myCommand.SetFaceDestinationRotation(FaceTargetActorRotationOnArrival, InDistanceStartLooking);
        myCommand.SetStopAtDestinationType(StopType, LookAt);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1.0000000
    CmdStatus_MoveToActor
    0
    0
    false
    true
    0
    0.0000000
    // End:0x63
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveToActor'.static.InitCommand(self);
    myCommand = LPAICmd_MoveToActor(GetActiveCommand());
    // End:0x1FA
    if(myCommand != none)
    {
        myCommand.SetMaxSpeedScale(InMaxSpeedScale);
        myCommand.SetAllowFiring(bAllowFiring);
        myCommand.SetLookWhenStartMoving(inLookAtStartMoving);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredTarget(Target);
        myCommand.SetDesiredSeperation(reachDist);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetStopAtDestinationType(StopType, LookAt);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToActorFly()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetToMoveTo[8388609], LookAtActor;
    local /*0x97E50000-0x00000000*/ private float distanceFromTarget[8388609], PitchAngleFromTargetInDegrees, HowCloseToTheOffsetToHaveToGetTo;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool b2dDistanceChecks[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_MoveToActor
    0
    0
    true
    // End:0x46
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveToActorFly'.static.InitCommand(self);
    myCommand = LPAICmd_MoveToActorFly(GetActiveCommand());
    // End:0x1B4
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredTarget(TargetToMoveTo);
        myCommand.SetDesiredSeperation(HowCloseToTheOffsetToHaveToGetTo);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetDesiredPitchAngleFromTarget(PitchAngleFromTargetInDegrees);
        myCommand.SetDistanceFromMoveToTarget(distanceFromTarget);
        myCommand.SetStopAtDestinationType(StopType, LookAtActor);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToActorTight()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool b2dDistanceChecks[9437185], bInKillTransitionComponentOnTouchOfTarget;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1.0000000
    CmdStatus_MoveToActor
    0
    0
    true
    false
    // End:0x54
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveToActorTight'.static.InitCommand(self);
    myCommand = LPAICmd_MoveToActorTight(GetActiveCommand());
    // End:0x19B
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredTarget(Target);
        myCommand.SetDesiredSeperation(reachDist);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetStopAtDestinationType(StopType, LookAt);
        myCommand.SetKillTransitionComponentOnTouchOfTarget(bInKillTransitionComponentOnTouchOfTarget);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    -1.0000000
    CmdStatus_MoveToPosition
    0
    0
    false
    true
    0
    0.0000000
    // End:0x68
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveToPosition'.static.InitCommand(self);
    myCommand = LPAICmd_MoveToPosition(GetActiveCommand());
    // End:0x1FF
    if(myCommand != none)
    {
        myCommand.SetMaxSpeedScale(InMaxSpeedScale);
        myCommand.SetAllowFiring(bAllowFiring);
        myCommand.SetLookWhenStartMoving(inLookAtStartMoving);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredDestination(Target);
        myCommand.SetDesiredSeperation(reachDist);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetStopAtDestinationType(StopType, LookAt);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToPositionFly()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool b2dDistanceChecks[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    -1.0000000
    CmdStatus_MoveToPosition
    0
    0
    true
    // End:0x54
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveToPositionFly'.static.InitCommand(self);
    myCommand = LPAICmd_MoveToPositionFly(GetActiveCommand());
    // End:0x172
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredDestination(Target);
        myCommand.SetDesiredSeperation(reachDist);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetStopAtDestinationType(StopType, LookAt);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCoverInfo[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185];
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_MoveToPosition
    1
    false
    0
    0.0000000
    // End:0x4F
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveToCover'.static.InitCommand(self);
    myCommand = LPAICmd_MoveToCover(GetActiveCommand());
    // End:0x164
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxSpeedScale(InMaxSpeedScale);
        myCommand.SetDesiredCoverInfo(InCoverInfo);
        myCommand.SetAllowFiring(bAllowFiring);
        myCommand.SetLookWhenStartMoving(inLookAtStartMoving);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCircleActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];
    local /*0x97E50000-0x00000000*/ private float InnerRadius[8388609], OuterRadius;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveCircling'.static.InitCommand(self);
    myCommand = LPAICmd_MoveCircling(GetActiveCommand());
    // End:0x11F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredTarget(Target);
        myCommand.SetInnerRadius(InnerRadius);
        myCommand.SetOuterRadius(OuterRadius);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCircleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];
    local /*0x97E50000-0x00000000*/ private float InnerRadius[8388609], OuterRadius;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveCircling'.static.InitCommand(self);
    myCommand = LPAICmd_MoveCircling(GetActiveCommand());
    // End:0x11F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredCenter(Target);
        myCommand.SetInnerRadius(InnerRadius);
        myCommand.SetOuterRadius(OuterRadius);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCircleArc()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];
    local /*0x97E50000-0x00000000*/ private float Radius[8388609], ArcStartRadian, ArcEndRadian, Alpha;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MoveCircleArc'.static.InitCommand(self);
    myCommand = LPAICmd_MoveCircleArc(GetActiveCommand());
    // End:0x150
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetCenter(Target);
        myCommand.SetRadius(Radius);
        myCommand.SetArcLimits(ArcStartRadian, ArcEndRadian);
        myCommand.SetDesiredPosition(Alpha);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBecomeStunned()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class SpecialMoveToUse[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsThisStunInterruptible[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    false
    CmdStatus_Stunned
    0
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_Stunned'.static.InitCommand(self);
    myCommand = LPAICmd_Stunned(GetActiveCommand());
    // End:0x12D
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetStunnedDuration(StunnedDuration);
        myCommand.SetSunnedSpecialMove(SpecialMoveToUse);
        myCommand.SetStunInterruptible(bIsThisStunInterruptible);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHitReaction()
{
    local /*0x97E50000-0x00000000*/ private float PostReactionPauseTime[8388609];
    local /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x2F
    if(myAIPawn.GetIfGettingBirthed())
    {
        return none;
    }
    // End:0x57
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    HitReactionCmdClass.static.InitCommand(self);
    myCommand = LPAICmd_HitReaction(GetActiveCommand());
    // End:0xF3
    if(myCommand != none)
    {
        myCommand.SetPostSMPauseTime(PostReactionPauseTime);
        myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHitReactionToStun()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class StunSpecialMove[8388609], HitReactionSpecialMove, RecoverSpecialMove;
    local /*0x97E50000-0x00000000*/ private @NULL InPawnCausingStun[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x35
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    HitReactionToStunCmdClass.static.InitCommand(self);
    myCommand = LPAICmd_HitReactionToStun(GetActiveCommand());
    // End:0x121
    if(myCommand != none)
    {
        myCommand.SetStunnedDuration(StunnedDuration);
        myCommand.SetSunnedSpecialMove(StunSpecialMove);
        myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
        myCommand.SetRecoverSpecialMove(RecoverSpecialMove);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDialogueManager()
{
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DialogueManager'.static.InitCommand(self);
    myCommand = LPAICmd_DialogueManager(GetActiveCommand());
    return myCommand;
    //return ReturnValue;    
}

function CmdPause()
{
    local /*0x97E50000-0x00000000*/ private float PauseDuration[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_Pause'.static.InitCommand(self);
    myCommand = LPAICmd_Pause(GetActiveCommand());
    // End:0xA2
    if(myCommand != none)
    {
        myCommand.SetPauseDuration(PauseDuration);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMoveClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceRestart[9437185];
    local /*0x97E50000-0x00000000*/ private float PostSMPauseTime[9437185], MaxSpecialMoveTime;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL InteractionActor[9437185];
    local /*0x97E50000-0x00000000*/ private bool bClearFocus[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    true
    0.0000000
    -1.0000000
    1
    none
    true
    // End:0x4F
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpecialMove'.static.InitCommand(self);
    myCommand = LPAICmd_SpecialMove(GetActiveCommand());
    // End:0x18E
    if(myCommand != none)
    {
        myCommand.SetSpecialMove(InSpecialMoveClass);
        myCommand.SetPostSMPauseTime(PostSMPauseTime);
        myCommand.SetMaxSpecialMoveTime(MaxSpecialMoveTime);
        myCommand.SetForceRestart(bForceRestart);
        myCommand.SetInteractionActor(InteractionActor);
        myCommand.bClearFocus = bClearFocus;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdWaitBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMoveClass[8388609];
    local /*0x97E50000-0x00000000*/ private float InHowLong[9437185];
    local /*0x97E50000-0x00000000*/ private bool bFaceTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1.0000000
    false
    1
    // End:0x3C
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_BasicWaitBetweenStrikes'.static.InitCommand(self);
    myCommand = LPAICmd_BasicWaitBetweenStrikes(GetActiveCommand());
    // End:0x101
    if(myCommand != none)
    {
        myCommand.SetWaitingSpecialMove(InSpecialMoveClass);
        myCommand.SetHowLongToWait(InHowLong);
        myCommand.SetFaceEnemyDuringWait(bFaceTarget);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFlee()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185], MaxFleeDist, DesiredSeperationFromDanger;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bFinishWhenSafe[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    10.0000000
    10000.0000000
    200.0000000    
    0
    true
    // End:0x4F
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_Flee'.static.InitCommand(self);
    myCommand = LPAICmd_Flee(GetActiveCommand());
    // End:0x164
    if(myCommand != none)
    {
        myCommand.Duration = Duration;
        myCommand.SetMaxFleeDistance(MaxFleeDist);
        myCommand.SetDesiredSeperationFromDanger(DesiredSeperationFromDanger);
        myCommand.SetFleeFromActors(FleeFrom);
        myCommand.SetFinishWhenSafe(bFinishWhenSafe);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdWander()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185];
    local /*0x97E50000-0x00000000*/ private bool bWanderFast[9437185];
    local /*0x97E50000-0x00000000*/ private float minTimeSleepBeforeWander[9437185], maxTimeSleepBeforeWander;
    local /*0x97E50000-0x00000000*/ private @NULL InObjective[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    10.0000000
    false
    1.0000000
    2.0000000
    none
    0
    // End:0x53
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0xA1
    if(InObjective != none)
    {
        myCommand = LPAICmd_Wander(Class'LPAICmd_Wander'.static.InitObjectiveCommand(self, InObjective));        
    }
    else
    {
        Class'LPAICmd_Wander'.static.InitCommand(self);
        myCommand = LPAICmd_Wander(GetActiveCommand());
    }
    // End:0x18F
    if(myCommand != none)
    {
        myCommand.Duration = Duration;
        myCommand.bWanderFast = bWanderFast;
        myCommand.MinSleepBeforeWanderTime = minTimeSleepBeforeWander;
        myCommand.MaxSleepBeforeWanderTime = maxTimeSleepBeforeWander;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTurnToFaceFocus()
{
    local /*0x97E50000-0x00000000*/ private byte TurnOption[8388609];
    local /*0x97E50000-0x00000000*/ private int AllowedYawError[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bClearFocusOnFinish[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1
    1
    false
    // End:0x25
    if(Focus == none)
    {
        return none;
    }
    // End:0x4D
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x84
    if(AllowedYawError < 0)
    {
        AllowedYawError = myAIPawn.default.AllowedYawError;
    }
    Class'LPAICmd_TurnToFaceFocus'.static.InitCommand(self);
    myCommand = LPAICmd_TurnToFaceFocus(GetActiveCommand());
    // End:0x149
    if(myCommand != none)
    {
        myCommand.SetTurnOption(TurnOption);
        myCommand.SetAllowedYawError(AllowedYawError);
        myCommand.SetClearFocusOnFinish(bClearFocusOnFinish);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTurnToFacePosition()
{
    local /*0x97E50000-0x00000000*/ private byte TurnOption[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PointToFace[8519681];
    local /*0x97E50000-0x00000000*/ private int AllowedYawError[9437185];
    local /*0x97E50000-0x00000000*/ private bool bAllowMovingToStationaryTurns[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1
    false
    1
    // End:0x3C
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x73
    if(AllowedYawError < 0)
    {
        AllowedYawError = myAIPawn.default.AllowedYawError;
    }
    Class'LPAICmd_TurnToFacePosition'.static.InitCommand(self);
    myCommand = LPAICmd_TurnToFacePosition(GetActiveCommand());
    // End:0x160
    if(myCommand != none)
    {
        myCommand.SetTurnOption(TurnOption);
        myCommand.SetPointToFace(PointToFace);
        myCommand.SetAllowedYawError(AllowedYawError);
        myCommand.SetAllowMovingToStationaryTurns(bAllowMovingToStationaryTurns);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSnapTurn()
{
    local /*0x97E50000-0x00000000*/ private class SnapTurnSpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SnapTurn'.static.InitCommand(self);
    myCommand = LPAICmd_SnapTurn(GetActiveCommand());
    // End:0xA2
    if(myCommand != none)
    {
        myCommand.SetSnapTurnSpecialMove(SnapTurnSpecialMove);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_BasicDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_BasicDamageAssessment(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMortarAttackDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment, InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue, InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MortarAttackDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_MortarAttackDamageAssessment(GetActiveCommand());
    // End:0x177
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue(InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue);
        myCommand.SetMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue(InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHideFromActor()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array HideFrom[8388609];
    local /*0x97E50000-0x00000000*/ private float HidingTime[8388609], MaxDistanceToSearchForHidingPlace;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HideFromActor'.static.InitCommand(self);
    myCommand = LPAICmd_HideFromActor(GetActiveCommand());
    // End:0xF7
    if(myCommand != none)
    {
        myCommand.SetActors(HideFrom);
        myCommand.SetHidingTime(HidingTime);
        myCommand.SetMaxSearchDistance(MaxDistanceToSearchForHidingPlace);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPlayAnimForSmartActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TemplateAnimTree[8388609];
    local /*0x97E50000-0x00000000*/ private name TemplateAnimName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InInteraction[8388609], ActorToDamage, ActorToAlignTo, CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    none
    none
    0
    // End:0x3D
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PlayAnimForSmartActor'.static.InitCommand(self);
    myCommand = LPAICmd_PlayAnimForSmartActor(GetActiveCommand());
    // End:0x151
    if(myCommand != none)
    {
        myCommand.SetTemplateAnimTree(TemplateAnimTree);
        myCommand.SetTemplateAnimName(TemplateAnimName);
        myCommand.SetInteraction(InInteraction);
        myCommand.SetActorToDamage(ActorToDamage);
        myCommand.SetAllignActor(ActorToAlignTo);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireFromOpen()
{
    local /*0x97E50000-0x00000000*/ private int InBursts[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    CmdStatus_Attack
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x10D
    if(InBursts <= 0)
    {
        InBursts = int(RandRange(myAIPawn.TuneDataAIPawn.MinBurstsToFire.GetValue(), myAIPawn.TuneDataAIPawn.MaxBurstsToFire.GetValue()));
        InBursts = Max(1, InBursts);
    }
    Class'LPAICmd_FireFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_FireFromOpen(GetActiveCommand());
    // End:0x1A9
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.BurstsToFire = InBursts;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticAttackFromOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_StaticAttackFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_StaticAttackFromOpen(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCoverAIMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CoverAIMelee'.static.InitCommand(self);
    myCommand = LPAICmd_CoverAIMelee(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticCoverAIMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CoverAIStaticMelee'.static.InitCommand(self);
    myCommand = LPAICmd_CoverAIStaticMelee(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CreateDefendCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Class'LPAICmd_Defend'.static.InitCommand(self);
    myCommand = LPAICmd_Defend(GetActiveCommand());
    return myCommand;
    //return ReturnValue;    
}

function CreateFollowPathCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Class'LPAICmd_FollowPath'.static.InitCommand(self);
    myCommand = LPAICmd_FollowPath(GetActiveCommand());
    return myCommand;
    //return ReturnValue;    
}

function CmdDefend()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefendVolume[8388609], NewLocationToWaitAt, LookAtThingy;
    local /*0x97E50000-0x00000000*/ private float HowCloseEnemiesGetBeforeAttacking[8388609], GreandeHowCloseRange, HowCloseToLocToTryAndStay, HowMuchDamage;
    local /*0x97E50000-0x00000000*/ private bool bRandomize[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array NewMovesToPlay[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTimeToWaitAtNode[8388609], MaxTimeToWaitAtNode;
    local /*0x97E50000-0x00000000*/ private bool bIgnoreEnemiesUnlessInDefendVolume[8388609], bIgnoreEnemiesNotOnNAVMesh;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    myCommand = CreateDefendCmd();
    // End:0x274
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDefendVolume(DefendVolume);
        myCommand.bIgnoreEnemiesUnlessInDefendVolume = bIgnoreEnemiesUnlessInDefendVolume;
        myCommand.bIgnoreEnemiesNotOnNAVMesh = bIgnoreEnemiesNotOnNAVMesh;
        myCommand.SetLocationToWaitAt(NewLocationToWaitAt);
        myCommand.SetThingToFocusOnWhenNoEnemy(LookAtThingy);
        myCommand.SetHowCloseToLetEnemiesGetBeforeAttacking(HowCloseEnemiesGetBeforeAttacking);
        myCommand.SetHowCloseToLocationToTryAndStay(HowCloseToLocToTryAndStay);
        myCommand.SetDamageThresholdBeforeEndingCommand(HowMuchDamage);
        myCommand.SetHowCloseToLetGrenadesGetBeforeAttacking(GreandeHowCloseRange);
        myCommand.SetIfShouldRandomizeWhichMovesToPlay(bRandomize);
        myCommand.SetMovesToPlay(NewMovesToPlay);
        myCommand.SetMinMaxTimeToWait(MinTimeToWaitAtNode, MaxTimeToWaitAtNode);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdJumpBack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyJumpingAwayFrom[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    CmdStatus_Strike
    0
    return none;
    //return ReturnValue;    
}

function CmdFollowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowPathData[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    myCommand = CreateFollowPathCmd();
    // End:0xAE
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetFollowPathData(FollowPathData);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdGotoFleePoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleePoint[8388609];
    local /*0x97E50000-0x00000000*/ private bool RotateToFaceSameDirectionAsFleePoint[8388609], InterpolateToExactPosition;
    local /*0x97E50000-0x00000000*/ private @NULL ActorToFaceWhileMoving[8388609], ActorToAvoidWhileMoving;
    local /*0x97E50000-0x00000000*/ private float SpeedScale[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_GotoFleePoint'.static.InitCommand(self);
    myCommand = LPAICmd_GotoFleePoint(GetActiveCommand());
    // End:0x173
    if(myCommand != none)
    {
        myCommand.SetFleePoint(FleePoint);
        myCommand.RotateToFaceSameDirectionAsFleePoint = RotateToFaceSameDirectionAsFleePoint;
        myCommand.ActorToFaceWhileMoving = ActorToFaceWhileMoving;
        myCommand.ActorToAvoidWhileMoving = ActorToAvoidWhileMoving;
        myCommand.InterpolateToExactPosition = InterpolateToExactPosition;
        myCommand.SpeedScale = SpeedScale;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAttackUsingAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], InObjective, CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    myCommand = LPAICmd_AttackViaAttackVolume(Class'LPAICmd_AttackViaAttackVolume'.static.InitObjectiveCommand(self, InObjective));
    // End:0x16E
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyPawn);
        myCommand.SetSPAIObjective(InObjective);
        // End:0x16B
        if(EnemyPawn.Controller != none)
        {
            EnemyPawn.Controller.TriggerEventClass(Class'LPSeqEvent_PlayerHasAggro', myAIPawn);
        }        
    }
    else
    {
        // End:0x1D1
        if(CmdStatus != none)
        {
            LPAICmdStatus_Attack(CmdStatus).Cmd_Attack_Error = 2;
            LPAICmdStatus_Attack(CmdStatus).Cmd_Error = 1;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function OverrideDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x47
    if((CommandList != none) && LPAICommand(CommandList).OverrideDamageReaction(DM))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsActiveCmdInterruptible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x4C
    if(myCommand != none)
    {
        return myCommand.IsInterruptible();
    }
    return true;
    //return ReturnValue;    
}

function IsInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5B
    if((Seperation >= Range.Min) && Seperation <= Range.Max)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsInRangeMax()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Seperation <= Range.Max)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsInRangeMin()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Seperation >= Range.Min)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsMeleeAttackFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bMeleeFinished;
    //return ReturnValue;    
}

function MeleeFinished()
{
    bMeleeFinished = true;
    //return;    
}

function PauseThinkTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    //return;    
}

function Think()
{
    local /*0x97E50000-0x00000000*/ private bool bForceObjectiveUpdate[9437185];

    false
    //return;    
}

function NotifyKnockedOutOfAttackByTakingToMuchDamage()
{
    //return;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function IsObstacleInTheWayKynapseTestLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !MySPKynapseBotHandle.PathFinder_CanGo(TestLocation, Pawn.Location);
    //return ReturnValue;    
}

function IsObstacleInTheWayKynapse()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !MySPKynapseBotHandle.PathFinder_CanGo(EnemyForAttack.Location, Pawn.Location);
    //return ReturnValue;    
}

function TraceLineToObstacleKynapse()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestLocation[8388609], ReturnValue, HitLocation;

    MySPKynapseBotHandle.PathFinder_TraceLine(TestLocation, Pawn.Location, HitLocation);
    return HitLocation;
    //return ReturnValue;    
}

function IsObstacleInTheWay()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreActors, IgnoreActorClasses;
    local /*0x97E50000-0x00000000*/ private bool bPathIsClear;
    local /*0x97E50000-0x00000000*/ private float CollisionHeight;
    local /*0x97E50000-0x00000000*/ private @NULL Dest;

    IgnoreActors.AddItem(myAIPawn);    
    IgnoreActors.AddItem(EnemyForAttack);    
    IgnoreActorClasses.AddItem(Class'LPAIPawnTurret');    
    CollisionHeight = myAIPawn.GetCollisionHeight() - myAIPawn.MaxStepHeight;
    Dest = EnemyForAttack.Location - (Normal(EnemyForAttack.Location - myAIPawn.Location) * EnemyForAttack.CylinderComponent.CollisionRadius);
    Dest.Z = (EnemyForAttack.Location.Z - EnemyForAttack.CylinderComponent.CollisionHeight) + myAIPawn.CylinderComponent.CollisionHeight;
    bPathIsClear = LosTestForAttackLane(myAIPawn.Location, Dest, ObstacleCheckRadius, CollisionHeight,, IgnoreActors, IgnoreActorClasses);
    // End:0x253
    if(bPathIsClear)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetNumOtherEnemiesWithinRange()
{
    local /*0x97E50000-0x00000000*/ private float Range[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentEnemy[8388609], ClosestEnemy;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InIsValidEnemy[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I, numOtherEnemies;
    local /*0x97E50000-0x00000000*/ private float Dist, ClosestDist;
    local /*0x97E50000-0x00000000*/ private @NULL AnEnemy;

    None
    numOtherEnemies = 0;
    I = 0;
    J0x2B:

    // End:0x1C1 [Loop If]
    if(I < TargetList.Length)
    {
        AnEnemy = Pawn(TargetList[I].Actor);
        // End:0x8E
        if(AnEnemy == none)
        {            
        }
        else
        {
            // End:0xB5
            if(!AnEnemy.IsAliveAndWell())
            {                
            }
            else
            {
                // End:0xCF
                if(AnEnemy == CurrentEnemy)
                {                    
                }
                else
                {
                    // End:0xEA
                    if(LPVSPlayerPawn(AnEnemy) != none)
                    {                        
                    }
                    else
                    {
                        Dist = SeperationToPawn2D(AnEnemy);
                        // End:0x1B3
                        if(Dist <= Range)
                        {
                            // End:0x15A
                            if(InIsValidEnemy != none)
                            {
                                // End:0x15A
                                if(!IsValidEnemy(LPPawn(AnEnemy)))
                                {
                                    // [Explicit Continue]
                                    goto J0x1B3;
                                }
                            }
                            numOtherEnemies++;
                            // End:0x1B3
                            if((ClosestEnemy == none) || Dist < ClosestDist)
                            {
                                ClosestDist = Dist;
                                ClosestEnemy = AnEnemy;
                            }
                        }
                    }
                }
            }
        }
        J0x1B3:

        ++I;
        // [Loop Continue]
        goto J0x2B;
    }
    return numOtherEnemies;
    //return ReturnValue;    
}

function IsEnemyKnockedDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float MinKnockedDownTime[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SpecialMove;
    local /*0x97E50000-0x00000000*/ private float ReactionAnimLength;

    1.0000000
    // End:0x1A
    if(EnemyPawn == none)
    {
        return false;
    }
    SpecialMove = LPSM_DirectionalHitReaction(EnemyPawn.GetCurrentSpecialMoveInstance());
    // End:0x5D
    if(SpecialMove == none)
    {
        return false;
    }
    ReactionAnimLength = SpecialMove.GetLengthOfAnim();
    // End:0xCA
    if((int(SpecialMove.PlaybackType) == int(0)) && ReactionAnimLength > MinKnockedDownTime)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetNumEnemiesWithinRangeAndAngle()
{
    local /*0x97E50000-0x00000000*/ private float Range[8388609], MinDotProd;
    local /*0x97E50000-0x00000000*/ private @NULL ClosestActor[25165825], ExcludeActor;
    local /*0x97E50000-0x00000000*/ private bool bIgnoreKnockedDown[9437185];
    local /*0x97E50000-0x00000000*/ private int MaxAttackers[9437185];
    local /*0x97E50000-0x00000000*/ private name AttackResourceName[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I, numOtherEnemies;
    local /*0x97E50000-0x00000000*/ private float Dist;
    local /*0x97E50000-0x00000000*/ private @NULL AnEnemy, Displacement, Horiz, Forward;
    local /*0x97E50000-0x00000000*/ private float ClosestDist;
    local /*0x97E50000-0x00000000*/ private @NULL LPEnemy;

    none
    false
    0    
    numOtherEnemies = 0;
    ClosestDist = 0.0000000;
    I = 0;
    J0x35:

    // End:0x3CB [Loop If]
    if(I < TargetList.Length)
    {
        AnEnemy = Pawn(TargetList[I].Actor);
        // End:0x98
        if(AnEnemy == none)
        {            
        }
        else
        {
            // End:0xB2
            if(AnEnemy == ExcludeActor)
            {                
            }
            else
            {
                // End:0xD9
                if(!AnEnemy.IsAliveAndWell())
                {                    
                }
                else
                {
                    // End:0xF4
                    if(!IsEnemyVisible(AnEnemy))
                    {                        
                    }
                    else
                    {
                        LPEnemy = LPPawn(AnEnemy);
                        // End:0x24D
                        if(LPEnemy != none)
                        {
                            // End:0x148
                            if(bIgnoreKnockedDown && IsEnemyKnockedDown(LPEnemy))
                            {
                                // [Explicit Continue]
                                goto J0x3BD;
                            }
                            // End:0x163
                            if(LPVSPlayerPawn(LPEnemy) != none)
                            {
                                // [Explicit Continue]
                                goto J0x3BD;
                            }
                            // End:0x198
                            if((MaxAttackers > 0) && (NumberOfAttackersFor(LPEnemy)) >= MaxAttackers)
                            {
                                // [Explicit Continue]
                                goto J0x3BD;
                            }
                            // End:0x1BF
                            if(LPEnemy.AIResourceManager == none)
                            {
                                // [Explicit Continue]
                                goto J0x3BD;
                            }
                            // End:0x24D
                            if(LPEnemy.AIResourceManager.IsResourceValid(AttackResourceName))
                            {
                                // End:0x24D
                                if(!LPEnemy.AIResourceManager.IsAccessPossible(AttackResourceName, Pawn))
                                {
                                    // [Explicit Continue]
                                    goto J0x3BD;
                                }
                            }
                        }
                        Displacement = AnEnemy.Location - Pawn.Location;
                        Horiz = Displacement;
                        Horiz.Z = 0.0000000;
                        Horiz = Normal(Horiz);
                        Forward = Vector(Pawn.Rotation);
                        // End:0x32E
                        if((Horiz Dot Forward) < MinDotProd)
                        {                            
                        }
                        else
                        {
                            Dist = SeperationToPawn2D(AnEnemy);
                            // End:0x3BD
                            if(Dist <= Range)
                            {
                                numOtherEnemies++;
                                // End:0x3BD
                                if((ClosestDist == float(0)) || Dist < ClosestDist)
                                {
                                    ClosestDist = Dist;
                                    ClosestActor = AnEnemy;
                                }
                            }
                        }
                    }
                }
            }
        }
        J0x3BD:

        ++I;
        // [Loop Continue]
        goto J0x35;
    }
    return numOtherEnemies;
    //return ReturnValue;    
}

simulated function NotifyCollisionWhileFlying()
{
    //return;    
}

function HasDefendZones()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsInDefendZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldUseFormations()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !HasDefendZones();
    //return ReturnValue;    
}

function @NULL CanReachToMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDesiredPos[8388609], InEnemyForCheck;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance;

    BotHandle = SPKynapseBotHandle(myAIPawn.myKynapseHandle);
    // End:0x20D
    if((BotHandle != none) && !BotHandle.PathFinder_IsLocationInNavMesh(InDesiredPos))
    {
        InDesiredPos.Z = (InEnemyForCheck.Location.Z - InEnemyForCheck.CylinderComponent.CollisionHeight) + myAIPawn.CylinderComponent.CollisionHeight;
        ReachDistance = myAIPawn.CylinderComponent.CollisionRadius + InEnemyForCheck.CylinderComponent.CollisionRadius;
        // End:0x20D
        if(!BotHandle.PathFinder_CanReach(InDesiredPos, ReachDistance, myAIPawn.CylinderComponent.CollisionHeight, 1.0000000))
        {
            return false;            
        }
    }
    return true;
    //return ReturnValue;    
}

function ShouldAllowFiringWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ActOnHearNoise()
{
    local /*0x97E50000-0x00000000*/ private float Loudness[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NoiseMaker[8388609];
    local /*0x97E50000-0x00000000*/ private name NoiseType[9437185];

    //return;    
}

function NotifyMoveCmdStartingMove()
{
    //return;    
}

function GetAnimatedPathHelper()
{
    //return;    
}

state LPAIBaseState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        StartThinkTimer();
        //return;        
    }

    protected function ThinkTimer()
    {
        // End:0x63
        if(FrameCounterForLastThink != Class'SPEngine.SPUtil'.static.GetFrameCounter())
        {
            // End:0x63
            if(myAIPawn.Health > 0)
            {
                Think();
            }
        }
        //return;        
    }

    final function StartThinkTimer()
    {
        // End:0x3E
        if(!bDisableAI && !IsThinkTimerActive())
        {
            Think();
            SetTimer(0.1000000, true, 'ThinkTimer', self);
        }
        //return;        
    }

    final function StopThinkTimer()
    {
        ClearTimer('ThinkTimer', self);
        //return;        
    }

    function PauseThinkTimer()
    {
        local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

        // End:0x1A
        if(bPause)
        {
            StopThinkTimer();            
        }
        else
        {
            StartThinkTimer();
        }
        //return;        
    }

    final function IsThinkTimerActive()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return IsTimerActive('ThinkTimer', self);
        //return ReturnValue;        
    }

    function ForceEnableAI()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x23
        if(super(SPAIController).ForceEnableAI())
        {
            ClearAllObjectives();
            StartThinkTimer();
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function ForceDisableAI()
    {
        local /*0x97E50000-0x00000000*/ private bool bNoClearLatentAction[9437185], ReturnValue;

        // End:0x24
        if(super(SPGFCoverAIController).ForceDisableAI(bNoClearLatentAction))
        {
            StopThinkTimer();
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function Think()
    {
        local /*0x97E50000-0x00000000*/ private bool bForceObjectiveUpdate[9437185];

        false
        // End:0x36
        if((bDisableAI || !IsActiveCmdInterruptible()) || myAIPawn == none)
        {
            return;
        }
        // End:0xD5
        if(((CurrentObjective == none) || !CurrentObjective.IsValid()) || CurrentObjective.AllowOtherObjectivesToInterrupt())
        {
            CurrentObjective = LPAIObjective(AIObjectiveManager.ActivateBestObjective(CurrentObjective, bForceObjectiveUpdate));
        }
        UpdateLastDamageTime();
        FrameCounterForLastThink = Class'SPEngine.SPUtil'.static.GetFrameCounter();
        //return;        
    }

    function UpdateLastDamageTime()
    {
        local /*0x97E50000-0x00000000*/ private int I;

        I = 0;
        J0x0B:

        // End:0xDF [Loop If]
        if(I < TargetList.Length)
        {
            // End:0xD1
            if(TargetList[I].LastDamageTime > float(0))
            {
                // End:0xD1
                if((WorldInfo.TimeSeconds - TargetList[I].LastDamageTime) > EnemyDamageMemoryTime)
                {
                    TargetList[I].LastDamageTime = 0.0000000;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x0B;
        }
        //return;        
    }
    stop;    
}

auto state Alive extends LPAIBaseState
{
    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }

    function OnAliveDefaults()
    {
        // End:0x6F
        if(SPKynapseBotHandle(myAIPawn.myKynapseHandle) != none)
        {
            // End:0x6F
            if(SPKynapseBotHandle(myAIPawn.myKynapseHandle).IsAnimatedPathInProgress())
            {
                return;
            }
        }
        // End:0x9F
        if(SPSM_PlayKismetAnim(myAIPawn.GetCurrentSpecialMoveInstance()) != none)
        {
            return;
        }
        // End:0x127
        if(!myAIPawn.GetIfGettingBirthed())
        {
            // End:0x113
            if(CurrentObjective != none)
            {
                // End:0x113
                if(CurrentObjective.IsActive())
                {
                    CurrentObjective.Abort();
                }
            }
            AbortCommand(CommandList);
        }
        Kynapse_ActivateBot(false);
        Focus = none;
        // End:0x20D
        if((myAIPawn != none) && !myAIPawn.GetIfGettingBirthed())
        {
            myAIPawn.SetMovementPhysics();
            myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            myAIPawn.StopCustomAnim(0.2500000);
        }
        StartThinkTimer();
        //return;        
    }

    event HearNoise()
    {
        local /*0x97E50000-0x00000000*/ private float Loudness[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL NoiseMaker[8388609];
        local /*0x97E50000-0x00000000*/ private name NoiseType[9437185];

        super(Controller).HearNoise(Loudness, NoiseMaker, NoiseType);
        ActOnHearNoise(Loudness, NoiseMaker, NoiseType);
        //return;        
    }
Begin:

    OnAliveDefaults();
    J0x0A:

    // End:0x23 [Loop If]
    if(true)
    {
        OnAliveDefaults();
        Sleep(0.1000000);
        // [Loop Continue]
        goto J0x0A;
    }
    stop;                    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIController.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0 class=Class'LPAICmdStatus_MoveToPosition'
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIController.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0 class=Class'LPAICmdStatus_MoveToActor'
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIController.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0 class=Class'LPAICmdStatus_Stunned'
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIController.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0 class=Class'LPAICmdStatus_Strike'
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIController.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0 class=Class'LPAICmdStatus_Attack'
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bScriptedCanDoMelee=true
    bConsumeAmmoWhileMoving=true
    PawnsRunIntoWhileMoveing=(PawnsHit=none,MaxLifeTimeOfItemInList=-1.0000000,MaxLifeTimeOfVsInList=-1.0000000,MaxLifeTimeOfShutdownVsInList=-1.0000000)
    AiOverLayDebugMiscDisplay1="Not Set"
    AiOverLayDebugMiscDisplay2="Not Set"
    StruggleTimerName="StruggleTimer"
    // Reference: LPAdHocSquadMemberData'Default__LPAIController.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0 class=Class'LPAdHocSquadMemberData'
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    NoticeDamagerMinLastSeenTimeDeltaMP=3.0000000
    ObstacleCheckRadius=10.0000000
    LookEnemyShortPathDist=800.0000000
    HitReactionCmdClass=Class'LPAICmd_HitReaction'
    HitReactionToStunCmdClass=Class'LPAICmd_HitReactionToStun'
    MinTimeCanMeleeChecks=0.5000000
    // Reference: SPAIReactionManager'Default__LPAIController.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIController.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0 class=Class'LPAIObjectiveManager'
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bIsPlayer=true
    Components[0]=LPAIObjectiveManager0
}