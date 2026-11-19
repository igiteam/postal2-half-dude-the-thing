class Pawn extends Actor
    abstract
    nativereplication
    config(Game)
    placeable
    hidecategories(AnimDependency,Navigation)
    implements(Interface_Speaker);

enum EPathSearchType
{
    PST_Default,                    // 0
    PST_Breadth,                    // 1
    PST_NewBestPathTo,              // 2
    PST_Constraint,                 // 3
    PST_MAX                         // 4
};

struct native ScalarParameterInterpStruct
{
    var(*) /*0x42D10000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x42D10000-0x00000000*/ private float ParameterValue[65537];
    var(*) /*0x42D10000-0x00000000*/ private float InterpTime[65537];
    var(*) /*0x42D10000-0x00000000*/ private float WarmupTime[65537];

    structdefaultproperties
    {
        ParameterName="None"
        ParameterValue=0.0000000
        InterpTime=0.0000000
        WarmupTime=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_Speaker[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float MaxStepHeight[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float MaxJumpHeight;
var(*) /*0x35EA0000-0x00000000*/ private float WalkableFloorZ[131073];
var(*) /*0x35EA0000-0x00000000*/ private float LedgeCheckThreshold[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartialLedgeMoveDir[131073];
var(*) /*0x35EA0000-0x00000400*/ private travel @NULL Controller[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextPawn[131073];
var(*) /*0x35EA0000-0x00000000*/ private float NetRelevancyTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastRealViewer;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastViewer;
var(*) /*0x35EA0000-0x00000000*/ private bool bScriptTickSpecial;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpAndOut;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsWalking[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bWantsToCrouch;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsCrouched[2228225];
var(*) /*0x35EA0000-0x00000000*/ private bool bTryToUncrouch[131073];
var(*) /*0x3B4E0000-0x00000000*/ private bool bCanCrouch[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCrawler;
var(*) /*0x35EA0000-0x00000000*/ private bool bReducedSpeed[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bJumpCapable;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanJump;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanWalk;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanSwim;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanFly;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanClimbLadders;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanStrafe;
var(*) /*0x35EA0000-0x00000000*/ private bool bAvoidLedges;
var(*) /*0x35EA0000-0x00000000*/ private bool bStopAtLedges;
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowLedgeOverhang;
var(*) /*0x35EA0000-0x00000000*/ private bool bPartiallyOverLedge[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bSimulateGravity[2228225];
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreForces;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanWalkOffLedges;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanBeBaseForPawns;
var(*) /*0x35EA0000-0x00000000*/ private bool bSimGravityDisabled[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bDirectHitWall;
var(*) /*0x35EA0000-0x00000000*/ private bool bPushesRigidBodies[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceFloorCheck;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceKeepAnchor;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanMantle[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanClimbUp[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanClimbCeilings;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanSwatTurn[1075838977];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanLeap[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanCoverSlip[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bDisplayPathErrors[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanPickupInventory;
var(*) /*0x35EA0000-0x00000000*/ private bool bAmbientCreature;
var(*) /*0x01C50000-0x00000000*/ private bool bLOSHearing[65537];
var(*) /*0x01C50000-0x00000000*/ private bool bMuffledHearing[65537];
var(*) /*0x01C50000-0x00000000*/ private bool bDontPossess[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRollToDesired;
var(*) /*0x35EA0000-0x00000000*/ private bool bStationary;
var(*) /*0x35EA0000-0x00000000*/ private bool bCachedRelevant;
var(*) /*0x35EA0000-0x00000000*/ private bool bNoWeaponFiring;
var(*) /*0x35EA0000-0x00000000*/ private bool bModifyReachSpecCost;
var(*) /*0x35EA0000-0x00000000*/ private bool bModifyNavPointDest;
var(*) /*0x35EA0000-0x00000000*/ private bool bPathfindsAsVehicle;
var(*) /*0x35EA0000-0x00000000*/ private bool bPrevBypassSimulatedClientPhysics;
var(*) /*0x35EA0000-0x00000000*/ private bool bRunPhysicsWithNoController;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceMaxAccel;
var(*) /*0x35EA0000-0x00000000*/ private bool bLimitFallAccel;
var(*) /*0x35EA0000-0x00000000*/ private bool bReplicateHealthToAll;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceRMVelocity;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceRegularVelocity;
var(*) /*0x35EA0000-0x00000000*/ private bool bPlayedDeath;
var(*) /*0x35EA0000-0x00000000*/ private bool bDesiredRotationSet[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bLockDesiredRotation[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUnlockWhenReached[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bSmoothSlopeMovement;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsBaseTickedFirst;
var(*) /*0x35EA0000-0x00000000*/ private travel bool bUsedByMatinee[538968065];
var(*) /*0x35EA0000-0x00000000*/ private bool bRootMotionFromInterpCurve[2097153];
var(*) /*0x16220000-0x00000000*/ private bool bDebugShowCameraLocation[65537];
var(*) /*0x3B4E0000-0x00000000*/ private bool bFastAttachedMove[2162689];
var(*) /*0x33AC0000-0x00000000*/ private byte WalkingPhysics[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte PathSearchType;
var(*) /*0x35EA0000-0x00000000*/ private byte RemoteViewPitch[2228225];
var(*) /*0x35EA0000-0x00000000*/ private travel byte FlashCount[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel byte FiringMode[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float UncrouchTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CrouchHeight;
var(*) /*0x35EA0000-0x00000000*/ private float CrouchRadius;
var(*) /*0x35EA0000-0x00000000*/ private int FullHeight[131073];
var(*) /*0x35EA0000-0x00000000*/ private float NonPreferredVehiclePathMultiplier;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PathConstraintList;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PathGoalList;
var(*) /*0x35EA0000-0x00000000*/ private float DesiredSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float MaxDesiredSpeed;
var(*) /*0x01C50000-0x00000000*/ private float HearingThreshold[65537];
var(*) /*0x01C50000-0x00000000*/ private float Alertness[65537];
var(*) /*0x01C50000-0x00000000*/ private float SightRadius[65537];
var(*) /*0x01C50000-0x00000000*/ private float PeripheralVision[65537];
var(*) /*0x35EA0000-0x00000000*/ private float AvgPhysicsTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private float Mass;
var(*) /*0x35EA0000-0x00000000*/ private float Buoyancy;
var(*) /*0x35EA0000-0x00000000*/ private float MeleeRange;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Anchor[131073];
var(*) /*0x35EA0000-0x00000000*/ private int AnchorItem[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastAnchor[131073];
var(*) /*0x35EA0000-0x00000000*/ private float FindAnchorFailedTime;
var(*) /*0x35EA0000-0x00000000*/ private float LastValidAnchorTime;
var(*) /*0x35EA0000-0x00000000*/ private float DestinationOffset;
var(*) /*0x35EA0000-0x00000000*/ private float NextPathRadius;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SerpentineDir;
var(*) /*0x35EA0000-0x00000000*/ private float SerpentineDist;
var(*) /*0x35EA0000-0x00000000*/ private float SerpentineTime;
var(*) /*0x35EA0000-0x00000000*/ private float SpawnTime;
var(*) /*0x35EA0000-0x00000000*/ private int MaxPitchLimit;
var(*) /*0x35EA0000-0x00000000*/ private float GroundSpeed[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float WaterSpeed[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float AirSpeed[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float LadderSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float AccelRate[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float JumpZ[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float OutofWaterZ;
var(*) /*0x35EA0000-0x00000000*/ private float MaxOutOfWaterStepHeight;
var(*) /*0x35EA0000-0x00000000*/ private float AirControl[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float WalkingPct;
var(*) /*0x35EA0000-0x00000000*/ private float MovementSpeedModifier;
var(*) /*0x35EA0000-0x00000000*/ private float CrouchedPct;
var(*) /*0x35EA0000-0x00000000*/ private float MaxFallSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float AIMaxFallSpeedFactor;
var(*) /*0x10A20000-0x00000000*/ private float BaseEyeHeight[65537];
var(*) /*0x10A20000-0x00000000*/ private float EyeHeight[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Floor;
var(*) /*0x35EA0000-0x00000000*/ private float SplashTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HeadVolume[536870913];
var(*) /*0x3B4E0000-0x00000000*/ private int Health[2162689];
var(*) /*0x3B4E0000-0x00000000*/ private int HealthMax[2162689];
var(*) /*0x35EA0000-0x00000000*/ private float BreathTime;
var(*) /*0x35EA0000-0x00000000*/ private float UnderWaterTime;
var(*) /*0x35EA0000-0x00000000*/ private float LastPainTime;
var(*) /*0x35EA0000-0x00000000*/ private float KismetDeathDelayTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL RMVelocity;
var(*) /*0x35EA0000-0x00000000*/ private @NULL noise1spot[131073];
var(*) /*0x35EA0000-0x00000000*/ private float noise1time[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL noise1other[131073];
var(*) /*0x35EA0000-0x00000000*/ private float noise1loudness[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL noise2spot[131073];
var(*) /*0x35EA0000-0x00000000*/ private float noise2time[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL noise2other[131073];
var(*) /*0x35EA0000-0x00000000*/ private float noise2loudness[131073];
var(*) /*0x35EA0000-0x00000000*/ private float SoundDampening;
var(*) /*0x35EA0000-0x00000000*/ private float DamageScaling;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MenuName;
var(*) /*0x35EA0000-0x00000000*/ private class ControllerClass;
var(*) /*0x35EA0000-0x00000400*/ private travel PlayerReplicationInfo PlayerReplicationInfo[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnLadder;
var(*) /*0x35EA0000-0x00000000*/ private name LandMovementState;
var(*) /*0x35EA0000-0x00000000*/ private name WaterMovementState;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastStartSpot;
var(*) /*0x35EA0000-0x00000000*/ private float LastStartTime;
var(*) /*0x35EA0000-0x00000000*/ private Vector TakeHitLocation[2097153];
var(*) /*0x35EA0000-0x00000000*/ private class<DamageType> HitDamageType[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TearOffMomentum[2097153];
var(*) /*0x3B4E0000-0x00000400*/ private export @NULL Mesh[589825];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CylinderComponent[524289];
var(*) /*0x3B4E0000-0x00000000*/ private float RBPushRadius[65537];
var(*) /*0x3B4E0000-0x00000000*/ private float RBPushStrength[65537];
var(*) /*0x35EA0000-0x00000000*/ private travel Vehicle DrivenVehicle[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float AlwaysRelevantDistanceSquared;
var(*) /*0x3B4E0000-0x00000000*/ private float VehicleCheckRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastHitBy;
var(*) /*0x3B4E0000-0x00000000*/ private float ViewPitchMin[65537];
var(*) /*0x3B4E0000-0x00000000*/ private float ViewPitchMax[65537];
var(*) /*0x35EA0000-0x00000000*/ private int AllowedYawError;
var(*) /*0x33AC0000-0x00000000*/ private @NULL DesiredRotation[196609];
var(*) /*0x35EA0000-0x00000000*/ private class InventoryManagerClass;
var(*) /*0x35EA0000-0x00000000*/ private travel @NULL InvManager[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Weapon;
var(*) /*0x35EA0000-0x00000000*/ private travel Vector FlashLocation[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastFiringFlashLocation;
var(*) /*0x35EA0000-0x00000000*/ private int ShotCount;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreRagdollCollisionComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PhysicsPushBody;
var(*) /*0x35EA0000-0x00000000*/ private int FailedLandingCount;
var(*) /*0x35EA0000-0x00000000*/ private float FailedFallingTime;
var(*) /*0x35EA0000-0x00000000*/ private float FailedFallingForceLandTime;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlotNodes[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InterpGroupList[536870913];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL FacialAudioComp[537395201];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MIC_PawnMat[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MIC_PawnHair[536870913];
var(*) /*0x3B4E0000-0x00000000*/ private editfixedsize array ScalarParameterInterpArray[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL RootMotionInterpCurve;
var(*) /*0x35EA0000-0x00000000*/ private float RootMotionInterpRate[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float RootMotionInterpCurrentTime[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMotionInterpCurveLastValue[2097153];

// Export UPawn::execPickWallAdjust(FFrame&, void* const)
native final function PickWallAdjust()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WallHitNormal[8388609], HitActor;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execSetDesiredRotation(FFrame&, void* const)
native function SetDesiredRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TargetDesiredRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool InLockDesiredRotation[9437185], InUnlockWhenReached;
    local /*0x35EA0000-0x00000000*/ private float InterpolationTime[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bResetRotationRate[9437185], ReturnValue;

    false
    false
    -1.0000000
    true                            
}

// Export UPawn::execLockDesiredRotation(FFrame&, void* const)
native final function LockDesiredRotation()
{
    local /*0x35EA0000-0x00000000*/ private bool Lock[8388609], InUnlockWhenReached;

    false                
}

// Export UPawn::execResetDesiredRotation(FFrame&, void* const)
native function ResetDesiredRotation()
{
    local /*0x35EA0000-0x00000000*/ private bool bKeepRotationRate[9437185];


}

// Export UPawn::execCheckDesiredRotation(FFrame&, void* const)
native final function CheckDesiredRotation();

// Export UPawn::execIsDesiredRotationInUse(FFrame&, void* const)
native final function IsDesiredRotationInUse()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execIsDesiredRotationLocked(FFrame&, void* const)
native final function IsDesiredRotationLocked()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execCanBeInterpolatedInMatinee(FFrame&, void* const)
native function CanBeInterpolatedInMatinee()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event @NULL PostInitAnimTree()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PostInitAnimTree(SkelComp);
    // End:0x3E
    if(SkelComp == Mesh)
    {
        ClearAnimNodes();
        CacheAnimNodes();
    }
    //return;    
}

// Export UPawn::execCacheAnimNodes(FFrame&, void* const)
native simulated event CacheAnimNodes();

simulated function ClearAnimNodes()
{
    SlotNodes.Length = 0;
    //return;    
}

// Export UPawn::execUpdateAnimSetList(FFrame&, void* const)
native final simulated function UpdateAnimSetList();

simulated event BuildScriptAnimSetList()
{
    //return;    
}

// Export UPawn::execAddAnimSets(FFrame&, void* const)
native final simulated function AddAnimSets()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array CustomAnimSets[25296897];


}

simulated event AnimSetListUpdated()
{
    //return;    
}

simulated event RestoreAnimSetsToDefault()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    Mesh.AnimSets = default.Mesh.AnimSets;
    return true;
    //return ReturnValue;    
}

simulated event BeginAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    MAT_BeginAnimControl(InInterpGroup);
    //return;    
}

// Export UPawn::execMAT_BeginAnimControl(FFrame&, void* const)
native function MAT_BeginAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];


}

simulated event FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    MAT_FinishAnimControl(InInterpGroup);
    //return;    
}

// Export UPawn::execMAT_FinishAnimControl(FFrame&, void* const)
native function MAT_FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];


}

simulated event SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;

    MAT_SetAnimPosition(SlotName, ChannelIndex, InAnimSeqName, InPosition, bFireNotifies, bLooping, bEnableRootMotion);
    //return;    
}

// Export UPawn::execMAT_SetAnimPosition(FFrame&, void* const)
native function MAT_SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;


}

// Export UPawn::execMAT_SetAnimWeights(FFrame&, void* const)
native function MAT_SetAnimWeights()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotInfos[8388609];


}

// Export UPawn::execMAT_SetMorphWeight(FFrame&, void* const)
native function MAT_SetMorphWeight()
{
    local /*0x35EA0000-0x00000000*/ private name MorphNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private float MorphWeight[8388609];


}

// Export UPawn::execMAT_SetSkelControlScale(FFrame&, void* const)
native function MAT_SetSkelControlScale()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];


}

// Export UPawn::execMAT_SetSkelControlStrength(FFrame&, void* const)
native function MAT_SetSkelControlStrength()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ControlStrength[8388609];


}

simulated event InterpolationStarted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609], GroupInst;

    super.InterpolationStarted(InterpAction, GroupInst);
    //return;    
}

simulated event InterpolationFinished()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609];

    super.InterpolationFinished(InterpAction);
    //return;    
}

simulated function BeginAIGroup()
{
    //return;    
}

simulated function FinishAIGroup()
{
    //return;    
}

event MAT_BeginAIGroup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartLoc[8388609], StartRot, InAIGroup;

    SetLocation(StartLoc);
    SetRotation(StartRot);
    BeginAIGroup();
    bUsedByMatinee = true;
    //return;    
}

event MAT_FinishAIGroup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InAIGroup[8388609];

    FinishAIGroup();
    bUsedByMatinee = false;
    //return;    
}

simulated event PlayActorFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSet[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GroupName[8388609], SeqName;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay, AkCBInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return Mesh.PlayFaceFXAnim(AnimSet, SeqName, GroupName, SoundCueToPlay, AkEventToPlay, AkCBInfo);
    //return ReturnValue;    
}

event StopActorFaceFXAnim()
{
    Mesh.StopFaceFXAnim();
    //return;    
}

simulated event @NULL GetFaceFXAudioComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    return FacialAudioComp;
    //return ReturnValue;    
}

simulated function IsActorPlayingFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (Mesh != none) && Mesh.IsPlayingFaceFXAnim();
    //return ReturnValue;    
}

simulated function CanActorPlayFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function OnPlayFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    Mesh.PlayFaceFXAnim(inAction.FaceFXAnimSetRef, inAction.FaceFXAnimName, inAction.FaceFXGroupName, inAction.SoundCueToPlay, inAction.AkEventToPlay);
    //return;    
}

simulated function @NULL FaceFXAudioFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL AC[8388609];

    //return;    
}

event GetActorFaceFXAsset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x81
    if((Mesh.SkeletalMesh != none) && !Mesh.bDisableFaceFX)
    {
        return Mesh.SkeletalMesh.FaceFXAsset;        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

event SetMorphWeight()
{
    local /*0x35EA0000-0x00000000*/ private name MorphNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private float MorphWeight[8388609];

    MAT_SetMorphWeight(MorphNodeName, MorphWeight);
    //return;    
}

event SetSkelControlScale()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];

    MAT_SetSkelControlScale(SkelControlName, Scale);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    super.ReplicatedEvent(VarName);
    // End:0x4A
    if(VarName == 'FlashCount')
    {
        FlashCountUpdated(Weapon, FlashCount, true);        
    }
    else
    {
        // End:0x81
        if(VarName == 'FlashLocation')
        {
            FlashLocationUpdated(Weapon, FlashLocation, true);            
        }
        else
        {
            // End:0xB8
            if(VarName == 'FiringMode')
            {
                FiringModeUpdated(Weapon, FiringMode, true);                
            }
            else
            {
                // End:0xEB
                if(VarName == 'DrivenVehicle')
                {
                    // End:0xE8
                    if(DrivenVehicle != none)
                    {
                        NotifyTeamChanged();
                    }                    
                }
                else
                {
                    // End:0x10F
                    if(VarName == 'PlayerReplicationInfo')
                    {
                        NotifyTeamChanged();                        
                    }
                    else
                    {
                        // End:0x1F7
                        if(VarName == 'Controller')
                        {
                            // End:0x1F4
                            if((Controller != none) && Controller.Pawn == none)
                            {
                                Controller.Pawn = self;
                                // End:0x1F4
                                if((PlayerController(Controller) != none) && PlayerController(Controller).ViewTarget == Controller)
                                {
                                    PlayerController(Controller).SetViewTarget(self);
                                }
                            }                            
                        }
                        else
                        {
                            // End:0x232
                            if(VarName == 'bUsedByMatinee')
                            {
                                // End:0x228
                                if(bUsedByMatinee)
                                {
                                    BeginAIGroup();                                    
                                }
                                else
                                {
                                    FinishAIGroup();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

// Export UPawn::execIsAliveAndWell(FFrame&, void* const)
native final simulated function IsAliveAndWell()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execAdjustDestination(FFrame&, void* const)
native final function AdjustDestination()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GoalActor[8388609], Dest, ReturnValue;


}

// Export UPawn::execValidAnchor(FFrame&, void* const)
native final function ValidAnchor()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execSuggestJumpVelocity(FFrame&, void* const)
native function SuggestJumpVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL JumpVelocity[25165825], Destination, Start;
    local /*0x35EA0000-0x00000000*/ private bool bRequireFallLanding[9437185], ReturnValue;


}

// Export UPawn::execGetFallDuration(FFrame&, void* const)
native function GetFallDuration()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UPawn::execIsValidEnemyTargetFor(FFrame&, void* const)
native function IsValidEnemyTargetFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8519681];
    local /*0x35EA0000-0x00000000*/ private bool bNoPRIisEnemy[8388609], ReturnValue;


}

// Export UPawn::execIsInvisible(FFrame&, void* const)
native function IsInvisible()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execSetRemoteViewPitch(FFrame&, void* const)
native final function SetRemoteViewPitch()
{
    local /*0x35EA0000-0x00000000*/ private int NewRemoteViewPitch[8388609];


}

// Export UPawn::execSetAnchor(FFrame&, void* const)
native function SetAnchor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewAnchor[8388609];


}

// Export UPawn::execGetBestAnchor(FFrame&, void* const)
native function GetBestAnchor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestActor[8388609], TestLocation;
    local /*0x35EA0000-0x00000000*/ private bool bStartPoint[8388609], bOnlyCheckVisible;
    local /*0x35EA0000-0x00000000*/ private float out_Dist[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPawn::execReachedDestination(FFrame&, void* const)
native function ReachedDestination()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Goal[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execReachedPoint(FFrame&, void* const)
native function ReachedPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Point[8388609], NewAnchor;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execForceCrouch(FFrame&, void* const)
native function ForceCrouch();

// Export UPawn::execSetPushesRigidBodies(FFrame&, void* const)
native function SetPushesRigidBodies()
{
    local /*0x35EA0000-0x00000000*/ private bool NewPush[8388609];


}

// Export UPawn::execReachedDesiredRotation(FFrame&, void* const)
native final function ReachedDesiredRotation()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execGetBoundingCylinder(FFrame&, void* const)
native function GetBoundingCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float CollisionRadius[25165825], CollisionHeight;


}

// Export UPawn::execInitRagdoll(FFrame&, void* const)
native function InitRagdoll()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execTermRagdoll(FFrame&, void* const)
native function TermRagdoll()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function SpecialMoveTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Start[8388609], End, Next;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event SpecialMoveThruEdge()
{
    local /*0x35EA0000-0x00000000*/ private byte EdgeType[8388609];
    local /*0x35EA0000-0x00000000*/ private int Dir[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL MoveStart[8388609], MoveDest, RelActor;
    local /*0x35EA0000-0x00000000*/ private int RelItem[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function SetBaseEyeheight()
{
    // End:0x25
    if(!bIsCrouched)
    {
        BaseEyeHeight = default.BaseEyeHeight;        
    }
    else
    {
        BaseEyeHeight = FMin(0.8000000 * CrouchHeight, CrouchHeight - float(10));
    }
    //return;    
}

function PlayerChangedTeam()
{
    Died(none, Class'DamageType', Location);
    //return;    
}

function Reset()
{
    // End:0x44
    if((Controller == none) || Controller.bIsPlayer)
    {
        DetachFromController();
        Destroy();        
    }
    else
    {
        super.Reset();
    }
    //return;    
}

function StopFiring()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(Weapon != none)
    {
        Weapon.StopFire(Weapon.CurrentFireMode);
    }
    return true;
    //return ReturnValue;    
}

simulated function StartFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x0F
    if(bNoWeaponFiring)
    {
        return;
    }
    // End:0x46
    if(Weapon != none)
    {
        Weapon.StartFire(FireModeNum);
    }
    //return;    
}

simulated function StopFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x37
    if(Weapon != none)
    {
        Weapon.StopFire(FireModeNum);
    }
    //return;    
}

simulated function GetWeaponFiringMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    return FiringMode;
    //return ReturnValue;    
}

simulated function SetFiringMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InFiringMode[8388609];

    // End:0x57
    if(int(FiringMode) != int(InFiringMode))
    {
        FiringMode = InFiringMode;
        bForceNetUpdate = true;
        FiringModeUpdated(InWeapon, FiringMode, false);
    }
    //return;    
}

simulated function FiringModeUpdated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InFiringMode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bViaReplication[8388609];

    // End:0x41
    if(InWeapon != none)
    {
        InWeapon.FireModeUpdated(InFiringMode, bViaReplication);
    }
    //return;    
}

simulated function IncrementFlashCount()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InFiringMode[8388609];

    bForceNetUpdate = true;
    FlashCount++;
    // End:0x38
    if(int(FlashCount) == int(0))
    {
        FlashCount += 2;
    }
    SetFiringMode(InWeapon, InFiringMode);
    FlashCountUpdated(InWeapon, FlashCount, false);
    //return;    
}

simulated function FlashCountUpdated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InFlashCount[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bViaReplication[8388609];

    // End:0x35
    if(int(InFlashCount) > int(0))
    {
        WeaponFired(InWeapon, bViaReplication);        
    }
    else
    {
        WeaponStoppedFiring(InWeapon, bViaReplication);
    }
    //return;    
}

simulated function ClearFlashCount()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];

    // End:0x49
    if(int(FlashCount) != int(0))
    {
        bForceNetUpdate = true;
        FlashCount = 0;
        FlashCountUpdated(InWeapon, FlashCount, false);
    }
    //return;    
}

simulated function SetFlashLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InFiringMode[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewLoc[8388609];

    // End:0x2F
    if(NewLoc == LastFiringFlashLocation)
    {
        NewLoc += vect(0.0000000, 0.0000000, 1.0000000);
    }
    // End:0x61
    if(NewLoc == vect(0.0000000, 0.0000000, 0.0000000))
    {
        NewLoc = vect(0.0000000, 0.0000000, 1.0000000);
    }
    bForceNetUpdate = true;
    FlashLocation = NewLoc;
    LastFiringFlashLocation = NewLoc;
    SetFiringMode(InWeapon, InFiringMode);
    FlashLocationUpdated(InWeapon, FlashLocation, false);
    //return;    
}

function ClearFlashLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];

    // End:0x51
    if(!IsZero(FlashLocation))
    {
        bForceNetUpdate = true;
        FlashLocation = vect(0.0000000, 0.0000000, 0.0000000);
        FlashLocationUpdated(InWeapon, FlashLocation, false);
    }
    //return;    
}

simulated function FlashLocationUpdated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609], InFlashLocation;
    local /*0x35EA0000-0x00000000*/ private bool bViaReplication[8388609];

    // End:0x3A
    if(!IsZero(InFlashLocation))
    {
        WeaponFired(InWeapon, bViaReplication, InFlashLocation);        
    }
    else
    {
        WeaponStoppedFiring(InWeapon, bViaReplication);
    }
    //return;    
}

simulated function WeaponFired()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[9437185];

    ShotCount++;
    // End:0x56
    if(InWeapon != none)
    {
        InWeapon.PlayFireEffects(GetWeaponFiringMode(InWeapon), HitLocation);
    }
    //return;    
}

simulated function WeaponStoppedFiring()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bViaReplication[8388609];

    ShotCount = 0;
    // End:0x4C
    if(InWeapon != none)
    {
        InWeapon.StopFireEffects(GetWeaponFiringMode(InWeapon));
    }
    //return;    
}

function BotFire()
{
    local /*0x35EA0000-0x00000000*/ private bool bFinished[8388609], ReturnValue;

    StartFire(0);
    return true;
    //return ReturnValue;    
}

function CanAttack()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(Weapon == none)
    {
        return false;
    }
    return Weapon.CanAttack(Other);
    //return ReturnValue;    
}

function TooCloseToAttack()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function FireOnRelease()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Weapon != none)
    {
        return Weapon.FireOnRelease();
    }
    return false;
    //return ReturnValue;    
}

function HasRangedAttack()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return Weapon != none;
    //return ReturnValue;    
}

function IsFiring()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Weapon != none)
    {
        return Weapon.IsFiring();
    }
    return false;
    //return ReturnValue;    
}

function NeedToTurn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL targ[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL LookDir, AimDir;

    LookDir = Vector(Rotation);
    LookDir.Z = 0.0000000;
    LookDir = Normal(LookDir);
    AimDir = targ - Location;
    AimDir.Z = 0.0000000;
    AimDir = Normal(AimDir);
    return (LookDir Dot AimDir) < 0.9300000;
    //return ReturnValue;    
}

simulated function GetHumanReadableName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x2E
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return MenuName;
    //return ReturnValue;    
}

function PlayTeleportEffect()
{
    local /*0x35EA0000-0x00000000*/ private bool bOut[8388609], bSound;

    MakeNoise(1.0000000);
    //return;    
}

simulated function NotifyTeamChanged()
{
    //return;    
}

function PossessedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

    Controller = C;
    NetPriority = 3.0000000;
    NetUpdateFrequency = 100.0000000;
    bForceNetUpdate = true;
    // End:0x89
    if(C.PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo = C.PlayerReplicationInfo;
    }
    UpdateControllerOnPossess(bVehicleTransition);
    SetOwner(Controller);
    EyeHeight = BaseEyeHeight;
    // End:0x147
    if(C.IsA('PlayerController'))
    {
        // End:0x114
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            RemoteRole = ROLE_AutonomousProxy;
        }
        // End:0x144
        if(Weapon != none)
        {
            Weapon.ClientWeaponSet(false);
        }        
    }
    else
    {
        RemoteRole = default.RemoteRole;
    }
    // End:0x188
    if(Weapon != none)
    {
        Weapon.CacheAIController();
    }
    //return;    
}

function UpdateControllerOnPossess()
{
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

    // End:0x37
    if(!bVehicleTransition)
    {
        Controller.SetRotation(Rotation);
    }
    //return;    
}

function UnPossessed()
{
    bForceNetUpdate = true;
    // End:0x2A
    if(DrivenVehicle != none)
    {
        NetUpdateFrequency = 5.0000000;
    }
    PlayerReplicationInfo = none;
    SetOwner(none);
    Controller = none;
    //return;    
}

simulated function GetDefaultCameraMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RequestedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x82
    if(((RequestedBy != none) && RequestedBy.PlayerCamera != none) && RequestedBy.PlayerCamera.CameraStyle == 'Fixed')
    {
        return 'Fixed';
    }
    return 'FirstPerson';
    //return ReturnValue;    
}

function DropToGround()
{
    bCollideWorld = true;
    // End:0x57
    if(Health > 0)
    {
        SetCollision(true, true);
        SetPhysics(2);
        // End:0x57
        if(IsHumanControlled())
        {
            Controller.GotoState(LandMovementState);
        }
    }
    //return;    
}

function CanGrabLadder()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((bCanClimbLadders && Controller != none) && int(Physics) != int(9)) && (int(Physics) != int(2)) || Abs(Velocity.Z) <= JumpZ;
    //return ReturnValue;    
}

function RecommendLongRangedAttack()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function RangedAttackTime()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

event SetWalking()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewIsWalking[8388609];

    // End:0x2E
    if(bNewIsWalking != bIsWalking)
    {
        bIsWalking = bNewIsWalking;
    }
    //return;    
}

simulated function CanSplash()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xB2
    if((((WorldInfo.TimeSeconds - SplashTime) > 0.1500000) && (int(Physics) == int(2)) || int(Physics) == int(4)) && Abs(Velocity.Z) > float(100))
    {
        SplashTime = WorldInfo.TimeSeconds;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EndClimbLadder()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldLadder[8388609];

    // End:0x2E
    if(Controller != none)
    {
        Controller.EndClimbLadder();
    }
    // End:0x47
    if(int(Physics) == int(9))
    {
        SetPhysics(2);
    }
    //return;    
}

function ClimbLadder()
{
    local /*0x35EA0000-0x00000000*/ private @NULL L[8388609];

    OnLadder = L;
    SetRotation(OnLadder.WallDir);
    SetPhysics(9);
    // End:0x71
    if(IsHumanControlled())
    {
        Controller.GotoState('PlayerClimbing');
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string T;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas, AnimTreeRootNode;
    local /*0x35EA0000-0x00000000*/ private int I;

    Canvas = HUD.Canvas;
    // End:0x1E4
    if(HUD.ShouldDisplayDebug('Player'))
    {
        // End:0xE4
        if(PlayerReplicationInfo == none)
        {
            Canvas.DrawText("NO PLAYERREPLICATIONINFO", false);
            out_YPos += out_YL;
            Canvas.SetPos(4.0000000, out_YPos);            
        }
        else
        {
            PlayerReplicationInfo.DisplayDebug(HUD, out_YL, out_YPos);
        }
        super.DisplayDebug(HUD, out_YL, out_YPos);
        Canvas.SetDrawColor(255, 255, 255);
        Canvas.DrawText("Health " $ string(Health));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    // End:0x2C3
    if(HUD.ShouldDisplayDebug('AI'))
    {
        Canvas.DrawText((((("Anchor " $ string(Anchor)) $ " Serpentine Dist ") $ string(SerpentineDist)) $ " Time ") $ string(SerpentineTime));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    // End:0x62F
    if(HUD.ShouldDisplayDebug('Physics'))
    {
        T = (((("Floor " $ string(Floor)) $ " DesiredSpeed ") $ string(DesiredSpeed)) $ " Crouched ") $ string(bIsCrouched);
        // End:0x39C
        if((OnLadder != none) || int(Physics) == int(9))
        {
            T = (T $ " on ladder ") $ string(OnLadder);
        }
        Canvas.DrawText(T);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        T = "Collision Component:" @ string(CollisionComponent);
        Canvas.DrawText(T);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        T = "bForceMaxAccel:" @ string(bForceMaxAccel);
        Canvas.DrawText(T);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        // End:0x62F
        if(Mesh != none)
        {
            T = (("RootMotionMode:" @ string(Mesh.RootMotionMode)) @ "RootMotionVelocity:") @ string(Mesh.RootMotionVelocity);
            Canvas.DrawText(T);
            out_YPos += out_YL;
            Canvas.SetPos(4.0000000, out_YPos);
        }
    }
    // End:0x6F8
    if(HUD.ShouldDisplayDebug('Camera'))
    {
        Canvas.DrawText((("EyeHeight " $ string(EyeHeight)) $ " BaseEyeHeight ") $ string(BaseEyeHeight));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    // End:0x7F3
    if(Controller == none)
    {
        Canvas.SetDrawColor(255, 0, 0);
        Canvas.DrawText("NO CONTROLLER");
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        HUD.PlayerOwner.DisplayDebug(HUD, out_YL, out_YPos);        
    }
    else
    {
        Controller.DisplayDebug(HUD, out_YL, out_YPos);
    }
    // End:0x93A
    if(HUD.ShouldDisplayDebug('Weapon'))
    {
        // End:0x900
        if(Weapon == none)
        {
            Canvas.SetDrawColor(0, 255, 0);
            Canvas.DrawText("NO WEAPON");
            out_YPos += out_YL;
            Canvas.SetPos(4.0000000, out_YPos);            
        }
        else
        {
            Weapon.DisplayDebug(HUD, out_YL, out_YPos);
        }
    }
    // End:0xC07
    if(HUD.ShouldDisplayDebug('Animation'))
    {
        // End:0xC07
        if((Mesh != none) && Mesh.Animations != none)
        {
            AnimTreeRootNode = AnimTree(Mesh.Animations);
            // End:0xC07
            if(AnimTreeRootNode != none)
            {
                Canvas.DrawText("AnimGroups count:" @ string(AnimTreeRootNode.AnimGroups.Length));
                out_YPos += out_YL;
                Canvas.SetPos(4.0000000, out_YPos);
                I = 0;
                J0xA80:

                // End:0xC07 [Loop If]
                if(I < AnimTreeRootNode.AnimGroups.Length)
                {
                    Canvas.DrawText(((((" GroupName:" @ string(AnimTreeRootNode.AnimGroups[I].GroupName)) @ "NodeCount:") @ string(AnimTreeRootNode.AnimGroups[I].SeqNodes.Length)) @ "RateScale:") @ string(AnimTreeRootNode.AnimGroups[I].RateScale));
                    out_YPos += out_YL;
                    Canvas.SetPos(4.0000000, out_YPos);
                    I++;
                    // [Loop Continue]
                    goto J0xA80;
                }
            }
        }
    }
    //return;    
}

// Export UPawn::execIsHumanControlled(FFrame&, void* const)
native final simulated function IsHumanControlled()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PawnController[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execIsLocallyControlled(FFrame&, void* const)
native final simulated function IsLocallyControlled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPawn::execIsPlayerPawn(FFrame&, void* const)
native simulated function IsPlayerPawn()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function IsFirstPerson()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    PC = PlayerController(Controller);
    return (PC != none) && PC.UsingFirstPersonCamera();
    //return ReturnValue;    
}

simulated function ProcessViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_ViewRotation[25165825], out_DeltaRot;

    out_ViewRotation += out_DeltaRot;
    out_DeltaRot = rot(0, 0, 0);
    // End:0x91
    if(PlayerController(Controller) != none)
    {
        out_ViewRotation = PlayerController(Controller).LimitViewRotation(out_ViewRotation, ViewPitchMin, ViewPitchMax);
    }
    //return;    
}

simulated event GetActorEyesViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    out_Location = GetPawnViewLocation();
    out_Rotation = GetViewRotation();
    //return;    
}

// Export UPawn::execGetViewRotation(FFrame&, void* const)
native simulated event GetViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPawn::execGetPawnViewLocation(FFrame&, void* const)
native simulated event GetPawnViewLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated event GetWeaponStartTraceLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CurrentWeapon[9437185], ReturnValue, POVLoc, POVRot;

    // End:0x4B
    if(Controller != none)
    {
        Controller.GetPlayerViewPoint(POVLoc, POVRot);
        return POVLoc;
    }
    return GetPawnViewLocation();
    //return ReturnValue;    
}

singular simulated event GetBaseAimRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], POVLoc, POVRot;

    // End:0x5B
    if((Controller != none) && !InFreeCam())
    {
        Controller.GetPlayerViewPoint(POVLoc, POVRot);
        return POVRot;
    }
    POVRot = Rotation;
    // End:0xBE
    if(POVRot.Pitch == 0)
    {
        POVRot.Pitch = int(RemoteViewPitch) << int(8);
    }
    return POVRot;
    //return ReturnValue;    
}

simulated event InFreeCam()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    PC = PlayerController(Controller);
    return ((PC != none) && PC.PlayerCamera != none) && ((PC.PlayerCamera.CameraStyle == 'FreeCam') || PC.PlayerCamera.CameraStyle == 'FreeCam_Default') || PC.PlayerCamera.CameraStyle == 'FreeCamNoCollision';
    //return ReturnValue;    
}

simulated function GetAdjustedAimFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL W[8388609], StartFireLoc, ReturnValue;

    // End:0x30
    if((Controller == none) || int(Role) < int(ROLE_Authority))
    {
        return GetBaseAimRotation();
    }
    return Controller.GetAdjustedAimFor(W, StartFireLoc);
    //return ReturnValue;    
}

simulated function SetViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];

    // End:0x3A
    if(Controller != none)
    {
        Controller.SetRotation(NewRotation);        
    }
    else
    {
        SetRotation(NewRotation);
    }
    //return;    
}

function InGodMode()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (Controller != none) && Controller.bGodMode;
    //return ReturnValue;    
}

function SetMoveTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTarget[8388609];

    // End:0x37
    if(Controller != none)
    {
        Controller.MoveTarget = NewTarget;
    }
    //return;    
}

function LineOfSightTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (Controller != none) && Controller.LineOfSightTo(Other);
    //return ReturnValue;    
}

function HandlePickup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Inv[8388609];

    MakeNoise(0.2000000);
    // End:0x40
    if(Controller != none)
    {
        Controller.HandlePickup(Inv);
    }
    //return;    
}

event ClientMessage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];

    // End:0x54
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).ClientMessage(S, Type);
    }
    //return;    
}

simulated event FellOutOfWorld()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];

    // End:0x79
    if(int(Role) == int(ROLE_Authority))
    {
        Health = -1;
        Died(none, dmgType, Location);
        // End:0x79
        if(dmgType == none)
        {
            SetPhysics(0);
            SetHidden(true);
            LifeSpan = FMin(LifeSpan, 1.0000000);
        }
    }
    //return;    
}

singular simulated event OutsideWorldBounds()
{
    // End:0x34
    if((int(Role) == int(ROLE_Authority)) && PlayerController(Controller) == none)
    {
        Destroy();        
    }
    else
    {
        // End:0x53
        if(int(Role) == int(ROLE_Authority))
        {
            KilledBy(self);
        }
        SetPhysics(ROLE_None);
        SetHidden(true);
        LifeSpan = FMin(LifeSpan, 1.0000000);
    }
    //return;    
}

simulated function UnCrouch()
{
    // End:0x27
    if(bIsCrouched || bWantsToCrouch)
    {
        ShouldCrouch(false);
    }
    //return;    
}

function ShouldCrouch()
{
    local /*0x35EA0000-0x00000000*/ private bool bCrouch[8388609];

    bWantsToCrouch = bCrouch;
    //return;    
}

simulated event EndCrouch()
{
    local /*0x35EA0000-0x00000000*/ private float HeightAdjust[8388609];

    EyeHeight -= HeightAdjust;
    SetBaseEyeheight();
    //return;    
}

simulated event StartCrouch()
{
    local /*0x35EA0000-0x00000000*/ private float HeightAdjust[8388609];

    EyeHeight += HeightAdjust;
    SetBaseEyeheight();
    //return;    
}

function HandleMomentum()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185];

    AddVelocity(Momentum, HitLocation, DamageType, HitInfo);
    //return;    
}

function AddVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewVelocity[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185];

    // End:0x2D
    if(bIgnoreForces || NewVelocity == vect(0.0000000, 0.0000000, 0.0000000))
    {
        return;
    }
    // End:0x9E
    if((int(Physics) == int(1)) || ((int(Physics) == int(9)) || int(Physics) == int(8)) && NewVelocity.Z > default.JumpZ)
    {
        SetPhysics(2);
    }
    // End:0x111
    if((Velocity.Z > default.JumpZ) && NewVelocity.Z > float(0))
    {
        NewVelocity.Z *= 0.5000000;
    }
    Velocity += NewVelocity;
    //return;    
}

function KilledBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], Killer;

    Health = 0;
    // End:0x4D
    if(EventInstigator != none)
    {
        Killer = EventInstigator.Controller;
        LastHitBy = none;
    }
    Died(Killer, Class'DmgType_Suicided', Location);
    //return;    
}

function TakeFallingDamage()
{
    local /*0x35EA0000-0x00000000*/ private float EffectiveSpeed;

    // End:0x13C
    if(Velocity.Z < (-0.5000000 * MaxFallSpeed))
    {
        // End:0x139
        if(int(Role) == int(ROLE_Authority))
        {
            MakeNoise(1.0000000);
            // End:0x139
            if(Velocity.Z < (float(-1) * MaxFallSpeed))
            {
                EffectiveSpeed = Velocity.Z;
                // End:0xC3
                if(TouchingWaterVolume())
                {
                    EffectiveSpeed += float(100);
                }
                // End:0x139
                if(EffectiveSpeed < (float(-1) * MaxFallSpeed))
                {
                    TakeDamage(int((float(-100) * (EffectiveSpeed + MaxFallSpeed)) / MaxFallSpeed), none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'DmgType_Fell');
                }
            }
        }        
    }
    else
    {
        // End:0x179
        if(Velocity.Z < (-1.4000000 * JumpZ))
        {
            MakeNoise(0.5000000);            
        }
        else
        {
            // End:0x1B3
            if(Velocity.Z < (-0.8000000 * JumpZ))
            {
                MakeNoise(0.2000000);
            }
        }
    }
    //return;    
}

function Restart()
{
    //return;    
}

simulated function ClientRestart()
{
    ZeroMovementVariables();
    SetBaseEyeheight();
    //return;    
}

function ClientSetRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];

    // End:0x38
    if(Controller != none)
    {
        Controller.ClientSetRotation(NewRotation);
    }
    //return;    
}

final simulated event UpdatePawnRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];

    FaceRotation(NewRotation, 0.0000000);
    //return;    
}

// Export UPawn::execFaceRotation(FFrame&, void* const)
native simulated function FaceRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];


}

event EncroachingOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if(Other.bWorldGeometry || Other.bBlocksTeleport)
    {
        return true;
    }
    // End:0x99
    if(((Controller == none) || !Controller.bIsPlayer) && Pawn(Other) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event EncroachedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x45
    if((Pawn(Other) != none) && Vehicle(Other) == none)
    {
        gibbedBy(Other);
    }
    //return;    
}

function gibbedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x16
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x74
    if(Pawn(Other) != none)
    {
        Died(Pawn(Other).Controller, Class'DmgType_Telefragged', Location);        
    }
    else
    {
        Died(none, Class'DmgType_Telefragged', Location);
    }
    //return;    
}

function JumpOffPawn()
{
    Velocity += ((float(100) + CylinderComponent.CollisionRadius) * VRand());
    // End:0x82
    if(VSize2D(Velocity) > FMax(500.0000000, GroundSpeed))
    {
        Velocity = FMax(500.0000000, GroundSpeed) * Normal(Velocity);
    }
    Velocity.Z = 200.0000000 + CylinderComponent.CollisionHeight;
    SetPhysics(2);
    //return;    
}

event StuckOnPawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OtherPawn[8388609];

    //return;    
}

singular event BaseChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Dyn;

    // End:0xB9
    if((Pawn(Base) != none) && (DrivenVehicle == none) || !DrivenVehicle.IsBasedOn(Base))
    {
        // End:0xB9
        if(!Pawn(Base).CanBeBaseForPawn(self))
        {
            Pawn(Base).CrushedBy(self);
            JumpOffPawn();
        }
    }
    Dyn = DynamicSMActor(Base);
    // End:0x115
    if((Dyn != none) && !Dyn.CanBasePawn(self))
    {
        JumpOffPawn();
    }
    //return;    
}

simulated function CanBeBaseForPawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPawn[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bCanBeBaseForPawns;
    //return ReturnValue;    
}

function CrushedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OtherPawn[8388609];

    TakeDamage(int(((float(1) - (OtherPawn.Velocity.Z / float(400))) * OtherPawn.Mass) / Mass), OtherPawn.Controller, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'DmgType_Crushed');
    //return;    
}

function DetachFromController()
{
    local /*0x35EA0000-0x00000000*/ private bool bDestroyController[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL OldController;

    // End:0x124
    if((Controller != none) && Controller.Pawn == self)
    {
        OldController = Controller;
        Controller.PawnDied(self);
        // End:0x97
        if(Controller != none)
        {
            Controller.UnPossess();
        }
        // End:0x119
        if(((bDestroyController && OldController != none) && !OldController.bDeleteMe) && !OldController.bIsPlayer)
        {
            OldController.Destroy();
        }
        Controller = none;
    }
    //return;    
}

simulated event Destroyed()
{
    DetachFromController();
    // End:0x32
    if(InvManager != none)
    {
        InvManager.Destroy();
    }
    // End:0x5D
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        return;
    }
    SetAnchor(none);
    Weapon = none;
    ClearPathStep();
    super.Destroyed();
    //return;    
}

simulated event PreBeginPlay()
{
    // End:0x22
    if(HealthMax == 0)
    {
        HealthMax = default.Health;
    }
    super.PreBeginPlay();
    Instigator = self;
    SetDesiredRotation(Rotation);
    EyeHeight = BaseEyeHeight;
    //return;    
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    SplashTime = 0.0000000;
    SpawnTime = WorldInfo.TimeSeconds;
    EyeHeight = BaseEyeHeight;
    // End:0xA2
    if((WorldInfo.bStartup && Health > 0) && !bDontPossess)
    {
        SpawnDefaultController();
    }
    // End:0xE1
    if(FacialAudioComp != none)
    {
        FacialAudioComp.__OnAudioFinished__Delegate = FaceFXAudioFinished;
    }
    // End:0x16D
    if(((int(Role) == int(ROLE_Authority)) && InvManager == none) && InventoryManagerClass != none)
    {
        InvManager = Spawn(InventoryManagerClass, self);
        // End:0x14D
        if(InvManager == none)
        {            
        }
        else
        {
            InvManager.SetupFor(self);
        }
    }
    ClearPathStep();
    //return;    
}

function SpawnDefaultController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewController;

    // End:0x11
    if(Controller != none)
    {
        return;
    }
    // End:0x44
    if(ControllerClass != none)
    {
        NewController = Spawn(ControllerClass);
    }
    // End:0x74
    if(NewController != none)
    {
        NewController.Possess(self, false);
    }
    //return;    
}

simulated event ReceivedNewEvent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Evt[8388609];

    // End:0x37
    if(Controller != none)
    {
        Controller.ReceivedNewEvent(Evt);
    }
    super.ReceivedNewEvent(Evt);
    //return;    
}

function OnAssignController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0xEF
    if(inAction.ControllerClass != none)
    {
        // End:0x3E
        if(Controller != none)
        {
            DetachFromController(true);
        }
        Controller = Spawn(inAction.ControllerClass);
        Controller.Possess(self, false);
        // End:0xEC
        if(Controller.IsA('AIController'))
        {
            ControllerClass = class<AIController>(Controller.Class);
        }        
    }
    //return;    
}

simulated function OnGiveInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private class InvClass;

    // End:0x41
    if(inAction.bClearExisting)
    {
        InvManager.DiscardInventory();
    }
    // End:0x16E
    if(inAction.InventoryList.Length > 0)
    {
        Idx = 0;
        J0x71:

        // End:0x16B [Loop If]
        if(Idx < inAction.InventoryList.Length)
        {
            InvClass = inAction.InventoryList[Idx];
            // End:0x110
            if(InvClass != none)
            {
                // End:0x10D
                if((FindInventoryType(InvClass, false)) == none)
                {
                    CreateInventory(InvClass);
                }                
            }
            else
            {
                inAction.ScriptLog("WARNING: Attempting to give NULL inventory!");
            }
            Idx++;
            // [Loop Continue]
            goto J0x71;
        }        
    }
    else
    {
        inAction.ScriptLog("WARNING: Give Inventory without any inventory specified!");
    }
    //return;    
}

function Gasp()
{
    //return;    
}

function SetMovementPhysics()
{
    // End:0x2A
    if(PhysicsVolume.bWaterVolume)
    {
        SetPhysics(3);        
    }
    else
    {
        // End:0x43
        if(int(Physics) != int(2))
        {
            SetPhysics(2);
        }
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x35EA0000-0x00000000*/ private int InDamage[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    //return;    
}

event HealDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Amount[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x56
    if((Health > 0) && Health < HealthMax)
    {
        Health = Min(HealthMax, Health + Amount);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function PruneDamagedBoneList()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Bones[25165825];

    //return;    
}

event TakeRadiusDamageOnBones()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Bones[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo;
    local /*0x35EA0000-0x00000000*/ private bool bResult;
    local /*0x35EA0000-0x00000000*/ private float DamageScale, Dist;
    local /*0x35EA0000-0x00000000*/ private @NULL Dir, BoneLoc;

    PruneDamagedBoneList(Bones);
    Idx = 0;
    J0x1E:

    // End:0x1EE [Loop If]
    if(Idx < Bones.Length)
    {
        HitInfo.BoneName = Bones[Idx];
        HitInfo.HitComponent = Mesh;
        BoneLoc = Mesh.GetBoneLocation(Bones[Idx]);
        Dir = BoneLoc - HurtOrigin;
        Dist = VSize(Dir);
        Dir = Normal(Dir);
        // End:0x130
        if(bFullDamage)
        {
            DamageScale = 1.0000000;            
        }
        else
        {
            DamageScale = 1.0000000 - (Dist / DamageRadius);
        }
        // End:0x1D4
        if(DamageScale > 0.0000000)
        {
            TakeDamage(int(DamageScale * BaseDamage), InstigatedBy, BoneLoc, (DamageScale * Momentum) * Dir, DamageType, HitInfo, DamageCauser);
        }
        bResult = true;
        Idx++;
        // [Loop Continue]
        goto J0x1E;
    }
    return bResult;
    //return ReturnValue;    
}

function NotifyTakeHit()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[8388609], DamageCauser;

    // End:0x5B
    if(Controller != none)
    {
        Controller.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    }
    //return;    
}

function SetKillInstigator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x35
    if((InstigatedBy != none) && InstigatedBy != Controller)
    {
        return InstigatedBy;        
    }
    else
    {
        // End:0x72
        if(DamageType.default.bCausedByWorld && LastHitBy != none)
        {
            return LastHitBy;
        }
    }
    return InstigatedBy;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x35EA0000-0x00000000*/ private int actualDamage;
    local /*0x35EA0000-0x00000000*/ private @NULL PC, Killer;

    // End:0x29
    if((int(Role) < int(ROLE_Authority)) || Health <= 0)
    {
        return;
    }
    // End:0x5D
    if(DamageType == none)
    {
        // End:0x4A
        if(InstigatedBy == none)
        {            
        }
        DamageType = Class'DamageType';
    }
    Damage = Max(Damage, 0);
    // End:0xA2
    if((int(Physics) == int(0)) && DrivenVehicle == none)
    {
        SetMovementPhysics();
    }
    // End:0x127
    if((int(Physics) == int(1)) && DamageType.default.bExtraMomentumZ)
    {
        Momentum.Z = FMax(Momentum.Z, 0.4000000 * VSize(Momentum));
    }
    Momentum = Momentum / Mass;
    // End:0x1A0
    if(DrivenVehicle != none)
    {
        DrivenVehicle.AdjustDriverDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType);
    }
    actualDamage = Damage;
    WorldInfo.Game.ReduceDamage(actualDamage, self, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
    AdjustDamage(actualDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    super.TakeDamage(actualDamage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    Health -= actualDamage;
    // End:0x2F2
    if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
    {
        HitLocation = Location;
    }
    // End:0x3CB
    if(Health <= 0)
    {
        PC = PlayerController(Controller);
        // End:0x36A
        if(PC != none)
        {
            PC.ClientPlayForceFeedbackWaveform(DamageType.default.KilledFFWaveform);
        }
        Killer = SetKillInstigator(InstigatedBy, DamageType);
        TearOffMomentum = Momentum;
        Died(Killer, DamageType, HitLocation);        
    }
    else
    {
        HandleMomentum(Momentum, HitLocation, DamageType, HitInfo);
        NotifyTakeHit(InstigatedBy, HitLocation, actualDamage, DamageType, Momentum, DamageCauser);
        // End:0x494
        if(DrivenVehicle != none)
        {
            DrivenVehicle.NotifyDriverTakeHit(InstigatedBy, HitLocation, actualDamage, DamageType, Momentum);
        }
        // End:0x4CF
        if((InstigatedBy != none) && InstigatedBy != Controller)
        {
            LastHitBy = InstigatedBy;
        }
    }
    PlayHit(float(actualDamage), InstigatedBy, HitLocation, DamageType, Momentum, HitInfo);
    MakeNoise(1.0000000);
    //return;    
}

// Export UPawn::execGetTeamNum(FFrame&, void* const)
native simulated function GetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

simulated event GetTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x6C
    if((Controller != none) && Controller.PlayerReplicationInfo != none)
    {
        return Controller.PlayerReplicationInfo.Team;        
    }
    else
    {
        // End:0x9D
        if(PlayerReplicationInfo != none)
        {
            return PlayerReplicationInfo.Team;            
        }
        else
        {
            // End:0x109
            if((DrivenVehicle != none) && DrivenVehicle.PlayerReplicationInfo != none)
            {
                return DrivenVehicle.PlayerReplicationInfo.Team;                
            }
            else
            {
                return none;
            }
        }
    }
    //return ReturnValue;    
}

simulated event IsSameTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((Other != none) && Other.GetTeam() != none) && Other.GetTeam() == (GetTeam());
    //return ReturnValue;    
}

function ThrowWeaponOnDeath()
{
    ThrowActiveWeapon();
    //return;    
}

function Died()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Action;

    // End:0x22
    if(DamageType == none)
    {
        DamageType = Class'DamageType';
    }
    // End:0x90
    if((bDeleteMe || WorldInfo.Game == none) || WorldInfo.Game.bLevelChange)
    {
        return false;
    }
    // End:0x100
    if((DamageType.default.bCausedByWorld && (Killer == none) || Killer == Controller) && LastHitBy != none)
    {
        Killer = LastHitBy;
    }
    // End:0x16B
    if(WorldInfo.Game.PreventDeath(self, Killer, DamageType, HitLocation))
    {
        Health = Max(Health, 1);
        return false;
    }
    Health = Min(0, Health);
    // End:0x19F
    if(default.KismetDeathDelayTime > float(0))
    {
        DelayTriggerDeath();        
    }
    else
    {
        TriggerEventClass(Class'SeqEvent_Death', self);
    }
    KismetDeathDelayTime = default.KismetDeathDelayTime + WorldInfo.TimeSeconds;
    // End:0x221
    foreach LatentActions(Action)
    {
        Action.AbortFor(self);        
    }    
    LatentActions.Length = 0;
    // End:0x290
    if(DrivenVehicle != none)
    {
        Velocity = DrivenVehicle.Velocity;
        DrivenVehicle.DriverDied(DamageType);        
    }
    else
    {
        // End:0x2C8
        if(Weapon != none)
        {
            Weapon.HolderDied();
            ThrowWeaponOnDeath();
        }
    }
    // End:0x32A
    if(Controller != none)
    {
        WorldInfo.Game.Killed(Killer, Controller, self, DamageType);        
    }
    else
    {
        WorldInfo.Game.Killed(Killer, Controller(Owner), self, DamageType);
    }
    DrivenVehicle = none;
    // End:0x3BC
    if(InvManager != none)
    {
        InvManager.OwnerDied();
    }
    Velocity.Z *= 1.3000000;
    // End:0x415
    if(IsHumanControlled())
    {
        PlayerController(Controller).ForceDeathUpdate();
    }
    NetUpdateFrequency = default.NetUpdateFrequency;
    PlayDying(DamageType, HitLocation);
    return true;
    //return ReturnValue;    
}

function DelayTriggerDeath()
{
    TriggerEventClass(Class'SeqEvent_Death', self);
    //return;    
}

event Falling()
{
    //return;    
}

event Landed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    TakeFallingDamage();
    // End:0x3F
    if(Health > 0)
    {
        PlayLanded(Velocity.Z);
    }
    LastHitBy = none;
    //return;    
}

event TickSpecial()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

event HeadVolumeChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL newHeadVolume[8388609];

    // End:0x3C
    if((int(WorldInfo.NetMode) == int(NM_Client)) || Controller == none)
    {
        return;
    }
    // End:0xF8
    if((HeadVolume != none) && HeadVolume.bWaterVolume)
    {
        // End:0xF5
        if(!newHeadVolume.bWaterVolume)
        {
            // End:0xE6
            if((Controller.bIsPlayer && BreathTime > float(0)) && BreathTime < float(8))
            {
                Gasp();
            }
            BreathTime = -1.0000000;
        }        
    }
    else
    {
        // End:0x12D
        if(newHeadVolume.bWaterVolume)
        {
            BreathTime = UnderWaterTime;
        }
    }
    //return;    
}

function TouchingWaterVolume()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL V;

    // End:0x3E
    foreach TouchingActors(Class'PhysicsVolume', V)
    {
        // End:0x3D
        if(V.bWaterVolume)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

event BreathTimer()
{
    // End:0x9A
    if(HeadVolume.bWaterVolume)
    {
        // End:0x6F
        if(((Health < 0) || int(WorldInfo.NetMode) == int(NM_Client)) || DrivenVehicle != none)
        {
            return;
        }
        TakeDrowningDamage();
        // End:0x97
        if(Health > 0)
        {
            BreathTime = 2.0000000;
        }        
    }
    else
    {
        BreathTime = 0.0000000;
    }
    //return;    
}

function TakeDrowningDamage()
{
    //return;    
}

function CheckWaterJump()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WallNormal[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL HitActor, HitLocation, HitNormal, Checkpoint, Start, checkNorm,
	    Extent;

    // End:0x14C
    if(AIController(Controller) != none)
    {
        // End:0x117
        if((Controller.InLatentExecution(Controller.503) && Controller.MoveTarget != none) && !Controller.MoveTarget.PhysicsVolume.bWaterVolume)
        {
            Checkpoint = Normal(Controller.MoveTarget.Location - Location);            
        }
        else
        {
            Checkpoint = Acceleration;
        }
        Checkpoint.Z = 0.0000000;
    }
    // End:0x17C
    if(Checkpoint == vect(0.0000000, 0.0000000, 0.0000000))
    {
        Checkpoint = Vector(Rotation);
    }
    Checkpoint.Z = 0.0000000;
    checkNorm = Normal(Checkpoint);
    Checkpoint = Location + ((1.2000000 * CylinderComponent.CollisionRadius) * checkNorm);
    Extent = CylinderComponent.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = CylinderComponent.CollisionHeight;
    HitActor = Trace(HitLocation, HitNormal, Checkpoint, Location, true, Extent,, 8);
    // End:0x3DB
    if((HitActor != none) && Pawn(HitActor) == none)
    {
        WallNormal = float(-1) * HitNormal;
        Start = Location;
        Start.Z += MaxOutOfWaterStepHeight;
        Checkpoint = Start + ((3.2000000 * CylinderComponent.CollisionRadius) * WallNormal);
        HitActor = Trace(HitLocation, HitNormal, Checkpoint, Start, true,,, 8);
        // End:0x3DB
        if((HitActor == none) || HitNormal.Z > 0.7000000)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function DoJump()
{
    local /*0x35EA0000-0x00000000*/ private bool bUpdating[8388609], ReturnValue;

    // End:0x203
    if(((bJumpCapable && !bIsCrouched) && !bWantsToCrouch) && ((int(Physics) == int(1)) || int(Physics) == int(9)) || int(Physics) == int(8))
    {
        // End:0xA6
        if(int(Physics) == int(8))
        {
            Velocity = JumpZ * Floor;            
        }
        else
        {
            // End:0xDF
            if(int(Physics) == int(9))
            {
                Velocity.Z = 0.0000000;                
            }
            else
            {
                // End:0x115
                if(bIsWalking)
                {
                    Velocity.Z = default.JumpZ;                    
                }
                else
                {
                    Velocity.Z = JumpZ;
                }
            }
        }
        // End:0x1FC
        if(((Base != none) && !Base.bWorldGeometry) && Base.Velocity.Z > 0.0000000)
        {
            Velocity.Z += Base.Velocity.Z;
        }
        SetPhysics(2);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PlayDyingSound()
{
    //return;    
}

function PlayHit()
{
    local /*0x35EA0000-0x00000000*/ private float Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[8388609], HitInfo;

    // End:0x4A
    if((Damage <= float(0)) && (Controller == none) || !Controller.bGodMode)
    {
        return;
    }
    LastPainTime = WorldInfo.TimeSeconds;
    //return;    
}

simulated function TurnOff()
{
    // End:0x20
    if(int(Role) == int(ROLE_Authority))
    {
        RemoteRole = ROLE_SimulatedProxy;
    }
    // End:0xD4
    if((int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && Mesh != none)
    {
        Mesh.bPauseAnims = true;
        // End:0xD4
        if(int(Physics) == int(10))
        {
            Mesh.PhysicsWeight = 1.0000000;
            Mesh.bUpdateKinematicBonesFromAnimation = false;
        }
    }
    SetCollision(true, false);
    bNoWeaponFiring = true;
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    SetPhysics(0);
    bIgnoreForces = true;
    // End:0x15A
    if(Weapon != none)
    {
        Weapon.StopFire(Weapon.CurrentFireMode);
    }
    //return;    
}

function SetDyingPhysics()
{
    // End:0x19
    if(int(Physics) != int(10))
    {
        SetPhysics(2);
    }
    //return;    
}

simulated function PlayDying()
{
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLoc[8388609];

    GotoState('Dying');
    bReplicateMovement = false;
    bTearOff = true;
    Velocity += TearOffMomentum;
    SetDyingPhysics();
    bPlayedDeath = true;
    KismetDeathDelayTime = default.KismetDeathDelayTime + WorldInfo.TimeSeconds;
    //return;    
}

simulated event TornOff()
{
    // End:0x2B
    if(!bPlayedDeath)
    {
        PlayDying(HitDamageType, TakeHitLocation);
    }
    //return;    
}

event PlayFootStepSound()
{
    local /*0x35EA0000-0x00000000*/ private int FootDown[8388609];

    //return;    
}

function CannotJumpNow()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PlayLanded()
{
    local /*0x35EA0000-0x00000000*/ private float ImpactVel[8388609];

    //return;    
}

// Export UPawn::execGetVehicleBase(FFrame&, void* const)
native function GetVehicleBase()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function Suicide()
{
    KilledBy(self);
    //return;    
}

simulated function CanThrowWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (Weapon != none) && Weapon.CanThrow();
    //return ReturnValue;    
}

simulated event StartDriving()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609];

    StopFiring();
    // End:0x1B
    if(Health <= 0)
    {
        return;
    }
    DrivenVehicle = V;
    bForceNetUpdate = true;
    ShouldCrouch(false);
    bIgnoreForces = true;
    bCanTeleport = false;
    BreathTime = 0.0000000;
    V.AttachDriver(self);
    //return;    
}

simulated event StopDriving()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609];

    // End:0x6C
    if(Mesh != none)
    {
        Mesh.SetCullDistance(default.Mesh.CachedMaxDrawDistance);
        Mesh.SetShadowParent(none);
    }
    bForceNetUpdate = true;
    // End:0xA6
    if(V != none)
    {
        V.StopFiring();
    }
    // End:0xBC
    if(int(Physics) == int(10))
    {
        return;
    }
    DrivenVehicle = none;
    bIgnoreForces = false;
    SetHardAttach(false);
    bCanTeleport = true;
    bCollideWorld = true;
    // End:0x125
    if(V != none)
    {
        V.DetachDriver(self);
    }
    SetCollision(true, true);
    // End:0x191
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x17A
        if(PhysicsVolume.bWaterVolume && Health > 0)
        {
            SetPhysics(3);            
        }
        else
        {
            SetPhysics(2);
        }
        SetBase(none);
        SetHidden(false);
    }
    //return;    
}

function AddDefaultInventory()
{
    //return;    
}

event CreateInventory()
{
    local /*0x35EA0000-0x00000000*/ private class NewInvClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDoNotActivate[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x43
    if(InvManager != none)
    {
        return InvManager.CreateInventory(NewInvClass, bDoNotActivate);
    }
    return none;
    //return ReturnValue;    
}

simulated function FindInventoryType()
{
    local /*0x35EA0000-0x00000000*/ private class DesiredClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAllowSubclass[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((InvManager != none) ? InvManager.FindInventoryType(DesiredClass, bAllowSubclass) : none);
    //return ReturnValue;    
}

simulated function DrawHUD()
{
    local /*0x35EA0000-0x00000000*/ private @NULL H[8388609];

    // End:0x37
    if(InvManager != none)
    {
        InvManager.DrawHUD(H);
    }
    //return;    
}

function ThrowActiveWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool bDestroyWeap[9437185];

    // End:0x24
    if(Weapon != none)
    {
        TossInventory(Weapon);
    }
    //return;    
}

function TossInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Inv[8388609], ForceVelocity, POVLoc, TossVel, POVRot, X,
	    Y, Z;

    // End:0x32
    if(ForceVelocity != vect(0.0000000, 0.0000000, 0.0000000))
    {
        TossVel = ForceVelocity;        
    }
    else
    {
        GetActorEyesViewPoint(POVLoc, POVRot);
        TossVel = Vector(POVRot);
        TossVel = (TossVel * ((Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 200.0000000);
    }
    GetAxes(Rotation, X, Y, Z);
    Inv.DropFrom((Location + ((0.8000000 * CylinderComponent.CollisionRadius) * X)) - ((0.5000000 * CylinderComponent.CollisionRadius) * Y), TossVel);
    //return;    
}

simulated function SetActiveWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewWeapon[8388609];

    // End:0x37
    if(InvManager != none)
    {
        InvManager.SetCurrentWeapon(NewWeapon);
    }
    //return;    
}

simulated function PlayWeaponSwitch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldWeapon[8388609], NewWeapon;

    //return;    
}

function CheatWalk()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    UnderWaterTime = default.UnderWaterTime;
    SetCollision(true, true);
    SetPhysics(2);
    bCollideWorld = true;
    SetPushesRigidBodies(default.bPushesRigidBodies);
    return true;
    //return ReturnValue;    
}

function CheatGhost()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    UnderWaterTime = -1.0000000;
    SetCollision(false, false);
    bCollideWorld = false;
    SetPushesRigidBodies(false);
    return true;
    //return ReturnValue;    
}

function CheatFly()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    UnderWaterTime = default.UnderWaterTime;
    SetCollision(true, true);
    bCollideWorld = true;
    return true;
    //return ReturnValue;    
}

simulated function GetCollisionRadius()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return ((CylinderComponent != none) ? CylinderComponent.CollisionRadius : 0.0000000);
    //return ReturnValue;    
}

simulated function GetCollisionHeight()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return ((CylinderComponent != none) ? CylinderComponent.CollisionHeight : 0.0000000);
    //return ReturnValue;    
}

final simulated function GetCollisionExtent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Extent;

    Extent = (GetCollisionRadius()) * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = GetCollisionHeight();
    return Extent;
    //return ReturnValue;    
}

function IsStationary()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event SpawnedByKismet()
{
    // End:0x2E
    if(Controller != none)
    {
        Controller.SpawnedByKismet();
    }
    //return;    
}

function DoKismetAttachment()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Attachment[8388609], Action;
    local /*0x35EA0000-0x00000000*/ private bool bOldCollideActors, bOldBlockActors, bValidBone, bValidSocket;

    // End:0xF7
    if((Mesh != none) && Action.BoneName != 'None')
    {
        bValidSocket = Mesh.GetSocketByName(Action.BoneName) != none;
        bValidBone = Mesh.MatchRefBone(Action.BoneName) != -1;
        // End:0xF7
        if(!bValidBone && !bValidSocket)
        {
        }
    }
    // End:0x4E3
    if(bValidBone || bValidSocket)
    {
        bOldCollideActors = Attachment.bCollideActors;
        bOldBlockActors = Attachment.bBlockActors;
        Attachment.SetCollision(false, false);
        Attachment.SetHardAttach(Action.bHardAttach);
        // End:0x2E2
        if(bValidBone && !bValidSocket)
        {
            // End:0x256
            if(Action.bUseRelativeOffset)
            {
                Attachment.SetLocation(Mesh.GetBoneLocation(Action.BoneName));
            }
            // End:0x2DF
            if(Action.bUseRelativeRotation)
            {
                Attachment.SetRotation(QuatToRotator(Mesh.GetBoneQuaternion(Action.BoneName)));
            }            
        }
        else
        {
            // End:0x373
            if(ClassIsChildOf(Attachment.Class, Class'Pawn'))
            {
                Mesh.AttachComponentToSocket(Pawn(Attachment).Mesh, Action.BoneName);
            }
        }
        Attachment.SetBase(self,, Mesh, Action.BoneName);
        // End:0x434
        if(Action.bUseRelativeRotation)
        {
            Attachment.SetRelativeRotation(Attachment.RelativeRotation + Action.RelativeRotation);
        }
        // End:0x4B3
        if(Action.bUseRelativeOffset)
        {
            Attachment.SetRelativeLocation(Attachment.RelativeLocation + Action.RelativeOffset);
        }
        Attachment.SetCollision(bOldCollideActors, bOldBlockActors);        
    }
    else
    {
        super.DoKismetAttachment(Attachment, Action);
    }
    //return;    
}

function GetDamageScaling()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return DamageScaling;
    //return ReturnValue;    
}

function OnSetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x6A
    if(Mesh != none)
    {
        Mesh.SetMaterial(Action.MaterialIndex, Action.NewMaterial);
    }
    //return;    
}

simulated function OnTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array objVars;

    Action.GetObjectVars(objVars, "Destination");
    // End:0xAB
    if(!HandleTeleport(objVars, Action.bUpdateRotation, Action.bCheckOverlap,, Action.TeleportVolumes))
    {
    }
    //return;    
}

simulated function HandleTeleport()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DestList[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bUpdateRotation[8388609], bCheckOverlap;
    local /*0x35EA0000-0x00000000*/ private float TeleportDistance[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array TeleportVolumes[9437185];
    local /*0x35EA0000-0x00000000*/ private int PreferredDestIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Idx, Cnt;
    local /*0x35EA0000-0x00000000*/ private @NULL destActor, tempActor, A, C;
    local /*0x35EA0000-0x00000000*/ private bool bOccupiedDest, bColliding;
    local /*0x35EA0000-0x00000000*/ private @NULL Extent;

    Extent = GetCollisionExtent();
    bOccupiedDest = false;
    // End:0x2AE
    if(DestList.Length > 0)
    {
        Idx = ((PreferredDestIndex >= 0) ? PreferredDestIndex : 0);
        // End:0x86
        if(Idx >= DestList.Length)
        {
            Idx = 0;
            PreferredDestIndex = 0;
        }
        Cnt = 0;
        J0x91:

        tempActor = Actor(DestList[Idx]);
        // End:0x241
        if(tempActor != none)
        {
            C = Controller(tempActor);
            // End:0x13F
            if((C != none) && C.Pawn != none)
            {
                tempActor = C.Pawn;
            }
            // End:0x1FA
            if(bCheckOverlap)
            {
                bColliding = false;
                // End:0x1E4
                foreach VisibleCollidingActors(Class'Actor', A, Extent.X * 2.0000000, tempActor.Location, false, Extent, true)
                {
                    // End:0x1E3
                    if(IsBlockedBy(A))
                    {
                        bColliding = true;
                        // End:0x1E4
                        break;
                    }                    
                }                
                bOccupiedDest = bColliding;
            }
            destActor = tempActor;
            // End:0x241
            if((!bCheckOverlap || !bOccupiedDest) && destActor != none)
            {
                // [Explicit Continue]
                goto J0x2AB;
            }
        }
        ++Idx;
        // End:0x26F
        if(Idx >= DestList.Length)
        {
            Idx = 0;
        }
        ++Cnt;
        // End:0x91
        if(!((Idx == PreferredDestIndex) || Cnt >= DestList.Length))
            goto J0x91;
        J0x2AB:
        
    }
    // End:0x4CD
    if((destActor != none) && Class'SeqAct_Teleport'.static.ShouldTeleport(self, destActor.Location, TeleportDistance, TeleportVolumes))
    {
        // End:0x4CB
        if(SetLocation(destActor.Location))
        {
            // End:0x3AE
            if(!IsLocallyControlled() && PlayerController(Controller) != none)
            {
                PlayerController(Controller).ClientSetLocation(destActor.Location, Rotation);
            }
            PlayTeleportEffect(false, true);
            // End:0x479
            if(bUpdateRotation)
            {
                SetRotation(destActor.Rotation);
                // End:0x479
                if(Controller != none)
                {
                    Controller.SetRotation(destActor.Rotation);
                    Controller.ClientSetRotation(destActor.Rotation);
                }
            }
            // End:0x4A8
            if(Controller != none)
            {
                Controller.OnTeleport(none);
            }
            Mesh.bOneTimeIgnoreKinematics = true;
            return true;
        }
        return false;
    }
    // End:0x4DE
    if(destActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

final event MessagePlayer()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];

    //return;    
}

simulated event BecomeViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    // End:0x38
    if(PhysicsVolume != none)
    {
        PhysicsVolume.NotifyPawnBecameViewTarget(self, PC);
    }
    // End:0x92
    if(!bReplicateHealthToAll && int(WorldInfo.NetMode) != int(NM_Client))
    {
        PC.ForceSingleNetUpdateFor(self);
    }
    //return;    
}

event SoakPause()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x58
    foreach WorldInfo.LocalPlayerControllers(Class'PlayerController', PC)
    {
        PC.SoakPause(self);
        // End:0x58
        break;        
    }    
    //return;    
}

// Export UPawn::execClearConstraints(FFrame&, void* const)
native function ClearConstraints();

// Export UPawn::execAddPathConstraint(FFrame&, void* const)
native function AddPathConstraint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Constraint[8388609];


}

// Export UPawn::execAddGoalEvaluator(FFrame&, void* const)
native function AddGoalEvaluator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Evaluator[8388609];


}

function CreatePathConstraint()
{
    local /*0x35EA0000-0x00000000*/ private class ConstraintClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return new (self) ConstraintClass;
    //return ReturnValue;    
}

function CreatePathGoalEvaluator()
{
    local /*0x35EA0000-0x00000000*/ private class GoalEvalClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return new (self) GoalEvalClass;
    //return ReturnValue;    
}

// Export UPawn::execIncrementPathStep(FFrame&, void* const)
native function IncrementPathStep()
{
    local /*0x35EA0000-0x00000000*/ private int Cnt[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];


}

// Export UPawn::execIncrementPathChild(FFrame&, void* const)
native function IncrementPathChild()
{
    local /*0x35EA0000-0x00000000*/ private int Cnt[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];


}

// Export UPawn::execDrawPathStep(FFrame&, void* const)
native function DrawPathStep()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];


}

// Export UPawn::execClearPathStep(FFrame&, void* const)
native function ClearPathStep();

simulated function ZeroMovementVariables()
{
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

simulated function SetCinematicMode()
{
    local /*0x35EA0000-0x00000000*/ private bool bInCinematicMode[8388609];

    //return;    
}

// Export UPawn::execSetRootMotionInterpCurrentTime(FFrame&, void* const)
native function SetRootMotionInterpCurrentTime()
{
    local /*0x35EA0000-0x00000000*/ private float inTime[8388609], DeltaTime;
    local /*0x35EA0000-0x00000000*/ private bool bUpdateSkelPose[9437185];


}

// Export UPawn::execSetScalarParameterInterp(FFrame&, void* const)
native final simulated function SetScalarParameterInterp()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ScalarParameterInterp[25296897];


}

simulated event Speak()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Cue[8388609];

    PlaySound(Cue, true);
    //return;    
}

simulated function OnSetVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    super.OnSetVelocity(Action);
    // End:0x53
    if(Action.VelocityMag == float(0))
    {
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        Acceleration = Velocity / 0.2000000;
    }
    //return;    
}

event ForceLanding()
{
    //return;    
}

state Dying
{
    ignores Bump, HitWall, HeadVolumeChange, PhysicsVolumeChange, Falling, BreathTimer, 
	    FellOutOfWorld, PlayWeaponSwitch, PlayNextAnimation, BaseChange, Landed, 
	    Died;

    singular simulated event OutsideWorldBounds()
    {
        SetPhysics(0);
        SetHidden(true);
        LifeSpan = FMin(LifeSpan, 1.0000000);
        //return;        
    }

    event Timer()
    {
        // End:0x0F
        if(!PlayerCanSeeMe())
        {
            Destroy();            
        }
        else
        {
            SetTimer(2.0000000, false);
        }
        //return;        
    }

    event TakeDamage()
    {
        local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
        local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

        SetPhysics(2);
        // End:0x66
        if((int(Physics) == int(0)) && Momentum.Z < float(0))
        {
            Momentum.Z *= float(-1);
        }
        Velocity += ((float(3) * Momentum) / (Mass + float(200)));
        // End:0xB3
        if(DamageType == none)
        {
            DamageType = Class'DamageType';
        }
        Health -= Damage;
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL A;
        local /*0x35EA0000-0x00000000*/ private editfixedsize array TouchEvents;
        local /*0x35EA0000-0x00000000*/ private int I;

        // End:0x4A
        if(bTearOff && int(WorldInfo.NetMode) == int(NM_DedicatedServer))
        {
            LifeSpan = 2.0000000;            
        }
        else
        {
            SetTimer(5.0000000, false);
            LifeSpan = 25.0000000;
        }
        SetDyingPhysics();
        SetCollision(true, false);
        // End:0xCB
        if(Controller != none)
        {
            // End:0xB3
            if(Controller.bIsPlayer)
            {
                DetachFromController();                
            }
            else
            {
                Controller.Destroy();
            }
        }
        // End:0x189
        foreach TouchingActors(Class'Actor', A)
        {
            // End:0x188
            if(A.FindEventsOfClass(Class'SeqEvent_Touch', TouchEvents))
            {
                I = 0;
                J0x123:

                // End:0x17C [Loop If]
                if(I < TouchEvents.Length)
                {
                    SeqEvent_Touch(TouchEvents[I]).NotifyTouchingPawnDied(self);
                    I++;
                    // [Loop Continue]
                    goto J0x123;
                }
                TouchEvents.Length = 0;
            }            
        }        
        // End:0x1C2
        foreach BasedActors(Class'Actor', A)
        {
            A.PawnBaseDied();            
        }        
        //return;        
    }
Begin:

    Sleep(0.2000000);
    PlayDyingSound();
    stop;        
}

defaultproperties
{
    MaxStepHeight=35.0000000
    MaxJumpHeight=96.0000000
    WalkableFloorZ=0.7000000
    LedgeCheckThreshold=4.0000000
    bJumpCapable=true
    bCanJump=true
    bCanWalk=true
    bAllowLedgeOverhang=true
    bSimulateGravity=true
    bLOSHearing=true
    bModifyNavPointDest=true
    bLimitFallAccel=true
    bSmoothSlopeMovement=true
    WalkingPhysics=EPhysics.PHYS_Walking
    CrouchHeight=40.0000000
    CrouchRadius=34.0000000
    NonPreferredVehiclePathMultiplier=1.0000000
    DesiredSpeed=1.0000000
    MaxDesiredSpeed=1.0000000
    HearingThreshold=2800.0000000
    SightRadius=5000.0000000
    AvgPhysicsTime=0.1000000
    Mass=100.0000000
    MaxPitchLimit=3072
    GroundSpeed=600.0000000
    WaterSpeed=300.0000000
    AirSpeed=600.0000000
    LadderSpeed=200.0000000
    AccelRate=2048.0000000
    JumpZ=420.0000000
    OutofWaterZ=420.0000000
    MaxOutOfWaterStepHeight=40.0000000
    AirControl=0.0500000
    WalkingPct=0.5000000
    MovementSpeedModifier=1.0000000
    CrouchedPct=0.5000000
    MaxFallSpeed=1200.0000000
    AIMaxFallSpeedFactor=1.0000000
    BaseEyeHeight=64.0000000
    EyeHeight=54.0000000
    Health=100
    noise1time=-10.0000000
    noise2time=-10.0000000
    SoundDampening=1.0000000
    DamageScaling=1.0000000
    ControllerClass=Class'AIController'
    LandMovementState="PlayerWalking"
    WaterMovementState="PlayerSwimming"
    // Reference: CylinderComponent'Default__Pawn.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    RBPushRadius=10.0000000
    RBPushStrength=50.0000000
    VehicleCheckRadius=150.0000000
    ViewPitchMin=-16384.0000000
    ViewPitchMax=16383.0000000
    AllowedYawError=2000
    InventoryManagerClass=Class'InventoryManager'
    RootMotionInterpRate=1.0000000
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bUpdateSimulatedPosition=true
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
    bCanTeleport=true
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    NetPriority=2.0000000
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=20000,Yaw=20000,Roll=20000)
}