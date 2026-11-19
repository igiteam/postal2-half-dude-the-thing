class SkeletalMeshComponent extends MeshComponent
    config(Engine)
    editinlinenew
    noexport
    hidecategories(Object);

enum EMaxDistanceScaleMode
{
    MDSM_Multiply,                  // 0
    MDSM_Substract,                 // 1
    MDSM_MAX                        // 2
};

enum EInstanceWeightUsage
{
    IWU_PartialSwap,                // 0
    IWU_FullSwap,                   // 1
    IWU_MAX                         // 2
};

enum ERootMotionMode
{
    RMM_Translate,                  // 0
    RMM_Velocity,                   // 1
    RMM_Ignore,                     // 2
    RMM_Accel,                      // 3
    RMM_Relative,                   // 4
    RMM_MAX                         // 5
};

enum ERootMotionRotationMode
{
    RMRM_Ignore,                    // 0
    RMRM_RotateActor,               // 1
    RMRM_MAX                        // 2
};

enum EAnimRotationOnly
{
    EARO_AnimSet,                   // 0
    EARO_ForceEnabled,              // 1
    EARO_ForceDisabled,             // 2
    EARO_MAX                        // 3
};

enum EFaceFXBlendMode
{
    FXBM_Overwrite,                 // 0
    FXBM_Additive,                  // 1
    FXBM_Mixed,                     // 2
    FXBM_MAX                        // 3
};

enum EFaceFXRegOp
{
    FXRO_Add,                       // 0
    FXRO_Multiply,                  // 1
    FXRO_Replace,                   // 2
    FXRO_MAX                        // 3
};

enum EBoneVisibilityStatus
{
    BVS_HiddenByParent,             // 0
    BVS_Visible,                    // 1
    BVS_ExplicitlyHidden,           // 2
    BVS_MAX                         // 3
};

enum EPhysBodyOp
{
    PBO_None,                       // 0
    PBO_Term,                       // 1
    PBO_Disable,                    // 2
    PBO_MAX                         // 3
};

struct ActiveMorph
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Target;
    var(*) /*0x35EA0000-0x00000000*/ private float Weight;

    structdefaultproperties
    {
        Target=none
        Weight=0.0000000
    }
};

struct Attachment
{
    var(*) /*0x03AB0000-0x00000400*/ private export @NULL Component[589825];
    var(*) /*0x03AB0000-0x00000000*/ private name BoneName[65537];
    var(*) /*0x03AB0000-0x00000000*/ private @NULL RelativeLocation[65537];
    var(*) /*0x03AB0000-0x00000000*/ private @NULL RelativeRotation[65537];
    var(*) /*0x03AB0000-0x00000000*/ private @NULL RelativeScale[65537];

    structdefaultproperties
    {
        Component=none
        BoneName="None"
        RelativeLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RelativeRotation=(Pitch=0,Yaw=0,Roll=0)
        RelativeScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    }
};

struct BonePair
{
    var(*) /*0x35EA0000-0x00000000*/ private name Bones[2];

    structdefaultproperties
    {
        Bones[0]="None"
        Bones[1]="None"
    }
};

struct SkelMeshComponentLODInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array HiddenMaterials[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsInstanceWeightUpdate[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysUseInstanceWeights[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte InstanceWeightUsage[537001985];
    var(*) /*0x35EA0000-0x00000000*/ private int InstanceWeightIdx[537001985];

    structdefaultproperties
    {
        HiddenMaterials=none
        bNeedsInstanceWeightUpdate=false
        bAlwaysUseInstanceWeights=false
        InstanceWeightUsage=EInstanceWeightUsage.IWU_PartialSwap
        InstanceWeightIdx=0
    }
};

var(*) /*0x47900000-0x00000000*/ private @NULL SkeletalMesh[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL AttachedToSkelComponent[524289];
var(*) /*0x47900000-0x00000000*/ private @NULL AnimTreeTemplate[196609];
var(*) /*0x47900000-0x00000400*/ private editfixedsize @NULL Animations[720897];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimTickArray[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimAlwaysTickArray[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimTickRelevancyArray[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimTickWeightsArray[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SkelControlTickArray[537001985];
var(*) /*0x47900000-0x00000000*/ private @NULL PhysicsAsset[196609];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL PhysicsAssetInstance[537526273];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ApexClothing[805437441];
var(*) /*0x47900000-0x00000000*/ private editconst float PhysicsWeight[65537];
var(*) /*0x35EA0000-0x00000000*/ private float TargetPhysicsWeight[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float PhysicsWeightBlendTimeRemaining[536870913];
var(*) /*0x47900000-0x00000000*/ private float GlobalAnimRateScale[65537];
var(*) /*0x47900000-0x00000000*/ private float StreamingDistanceMultiplier[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MeshObject[805437441];
var(*) /*0x47900000-0x00000000*/ private @NULL WireframeColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private array SpaceBases[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array LocalAtoms[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array CachedLocalAtoms[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array CachedSpaceBases[805437441];
var(*) /*0x35EA0000-0x00000000*/ private input int LowUpdateFrameRate[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private array RequiredBones[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ComposeOrderedRequiredBones[805437441];
var(*) /*0x47900000-0x00000400*/ private export @NULL ParentAnimComponent[720897];
var(*) /*0x35EA0000-0x00000000*/ private array ParentBoneMap[805437441];
var(*) /*0x47900000-0x00000000*/ private editfixedsize array AnimSets[65537];
var(*) /*0x35EA0000-0x00000000*/ private array TemporarySavedAnimSets[805437441];
var(*) /*0x47900000-0x00000000*/ private editfixedsize array MorphSets[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActiveMorphs[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActiveCurveMorphs[536870913];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} MorphTargetIndexMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export array Attachments[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SkelControlIndex[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PostPhysSkelControlIndex[537001985];
var(*) /*0x47900000-0x00000000*/ private int ForcedLodModel[65537];
var(*) /*0x47900000-0x00000000*/ private int MinLodModel[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PredictedLODLevel;
var(*) /*0x35EA0000-0x00000000*/ private int OldPredictedLODLevel;
var(*) /*0x47900000-0x00000000*/ private float AnimationLODDistanceFactor[65537];
var(*) /*0x47900000-0x00000000*/ private int AnimationLODFrameRate[65537];
var(*) /*0x35EA0000-0x00000000*/ private float MaxDistanceFactor[131073];
var(*) /*0x35EA0000-0x00000000*/ private int ChunkIndexPreview[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int SectionIndexPreview[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int bForceWireframe;
var(*) /*0x35EA0000-0x00000000*/ private int bForceRefpose;
var(*) /*0x35EA0000-0x00000000*/ private int bOldForceRefPose;
var(*) /*0x47900000-0x00000000*/ private bool bNoSkeletonUpdate[65537];
var(*) /*0x35EA0000-0x00000000*/ private int bDisplayBones;
var(*) /*0x35EA0000-0x00000000*/ private int bShowPrePhysBones;
var(*) /*0x35EA0000-0x00000000*/ private int bHideSkin;
var(*) /*0x35EA0000-0x00000000*/ private int bForceRawOffset;
var(*) /*0x35EA0000-0x00000000*/ private int bIgnoreControllers;
var(*) /*0x35EA0000-0x00000000*/ private int bTransformFromAnimParent;
var(*) /*0x35EA0000-0x00000000*/ private int TickTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int InitTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int CachedAtomsTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int bUseSingleBodyPhysics[131073];
var(*) /*0x35EA0000-0x00000000*/ private int bRequiredBonesUpToDate[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float MinDistFactorForKinematicUpdate;
var(*) /*0x35EA0000-0x00000000*/ private int FramesPhysicsAsleep[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasValidBodies[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipAllUpdateWhenPhysicsAsleep;
var(*) /*0x47900000-0x00000000*/ private bool bComponentUseFixedSkelBounds[65537];
var(*) /*0x47900000-0x00000000*/ private bool bUseBoundsFromParentAnimComponent[65537];
var(*) /*0x47900000-0x00000000*/ private bool bConsiderAllBodiesForBounds[65537];
var(*) /*0x47900000-0x00000000*/ private bool bUpdateSkelWhenNotRendered[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreControllersWhenNotRendered;
var(*) /*0x35EA0000-0x00000000*/ private bool bTickAnimNodesWhenNotRendered;
var(*) /*0x35EA0000-0x00000000*/ private bool bNotUpdatingKinematicDueToDistance[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bOneTimeIgnoreKinematics;
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingSetRootMotionModeToIgnore;
var(*) /*0x35EA0000-0x00000000*/ private bool bRegisteredDisableMaxDeltaTime;
var(*) /*0x47900000-0x00000000*/ private bool bForceDiscardRootMotion[65537];
var(*) /*0x47900000-0x00000000*/ private bool bNotifyRootMotionProcessed[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRootMotionModeChangeNotify;
var(*) /*0x35EA0000-0x00000000*/ private bool bRootMotionExtractedNotify;
var(*) /*0x35EA0000-0x00000000*/ private bool bProcessingRootMotion[536870913];
var(*) /*0x47900000-0x00000000*/ private bool bDisableFaceFXMaterialInstanceCreation[65537];
var(*) /*0x47900000-0x00000000*/ private bool bDisableFaceFX[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAnimTreeInitialised[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceMeshObjectUpdate[536870913];
var(*) /*0x47900000-0x00000000*/ private bool bHasPhysicsAssetInstance[196609];
var(*) /*0x47900000-0x00000000*/ private bool bUpdateKinematicBonesFromAnimation[65537];
var(*) /*0x47900000-0x00000000*/ private bool bUpdateJointsFromAnimation[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkelCompFixed[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasHadPhysicsBlendedIn[131073];
var(*) /*0x47900000-0x00000000*/ private bool bForceUpdateAttachmentsInTick[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableFullAnimWeightBodies[536870913];
var(*) /*0x47900000-0x00000000*/ private bool bPerBoneVolumeEffects[65537];
var(*) /*0x47900000-0x00000000*/ private bool bPerBoneMotionBlur[65537];
var(*) /*0x47900000-0x00000000*/ private bool bSyncActorLocationToRootRigidBody[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseRawData[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisableWarningWhenAnimNotFound;
var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideAttachmentOwnerVisibility;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsToDeleteHitMask[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bPauseAnims;
var(*) /*0x35EA0000-0x00000000*/ private bool bChartDistanceFactor;
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableLineCheckWithBounds;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanHighlightSelectedSections[536870913];
var(*) /*0x47900000-0x00000000*/ private bool bUpdateMorphWhenParentAnimComponentExists[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LineCheckBoundsScale;
var(*) /*0x12FE0000-0x00000000*/ private bool bEnableClothSimulation[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bDisableClothCollision[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bClothFrozen[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bAutoFreezeClothWhenNotRendered[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bClothAwakeOnStartup[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bClothBaseVelClamp[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bClothBaseVelInterp[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bAttachClothVertsToBaseBody[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bIsClothOnStaticObject[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdatedFixedClothVerts;
var(*) /*0x12FE0000-0x00000000*/ private bool bClothPositionalDampening[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bClothWindRelativeToOwner[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRecentlyRendered[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCacheAnimSequenceNodes;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsInstanceWeightUpdate[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysUseInstanceWeights[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateComposeSkeletonPasses[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bValidTemporarySavedAnimSets[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array InstanceVertexWeightBones[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LODInfo[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FrozenLocalToWorldPos[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FrozenLocalToWorldRot[131073];
var(*) /*0x12FE0000-0x00000000*/ private @NULL ClothExternalForce[196609];
var(*) /*0x12FE0000-0x00000000*/ private @NULL ClothWind[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL ClothBaseVelClampRange[65537];
var(*) /*0x12FE0000-0x00000000*/ private float ClothBlendWeight[65537];
var(*) /*0x35EA0000-0x00000000*/ private float ClothDynamicBlendWeight;
var(*) /*0x12FE0000-0x00000000*/ private float ClothBlendMinDistanceFactor[65537];
var(*) /*0x12FE0000-0x00000000*/ private float ClothBlendMaxDistanceFactor[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL MinPosDampRange[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL MaxPosDampRange[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL MinPosDampScale[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL MaxPosDampScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ClothSim[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothMeshPosData[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothMeshNormalData[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothMeshIndexData[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumClothMeshVerts;
var(*) /*0x35EA0000-0x00000000*/ private int NumClothMeshIndices;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothMeshParentData[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumClothMeshParentIndices;
var(*) /*0x35EA0000-0x00000000*/ private array ClothMeshWeldedPosData[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ClothMeshWeldedNormalData[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ClothMeshWeldedIndexData[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int ClothDirtyBufferFlag;
var(*) /*0x12FE0000-0x00000000*/ private byte ClothRBChannel[196609];
var(*) /*0x12FE0000-0x00000000*/ private @NULL ClothRBCollideWithChannels[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothForceScale[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothImpulseScale[65537];
var(*) /*0x12FE0000-0x00000000*/ private float ClothAttachmentTearFactor[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bClothUseCompartment[196609];
var(*) /*0x12FE0000-0x00000000*/ private float MinDistanceForClothReset[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastClothLocation[537001985];
var(*) /*0x03280000-0x00000000*/ private byte ApexClothingRBChannel[196609];
var(*) /*0x03280000-0x00000000*/ private @NULL ApexClothingRBCollideWithChannels[196609];
var(*) /*0x03280000-0x00000000*/ private byte ApexClothingCollisionRBChannel[196609];
var(*) /*0x03280000-0x00000000*/ private bool bAutoFreezeApexClothingWhenNotRendered[65537];
var(*) /*0x03280000-0x00000000*/ private bool bLocalSpaceWind[65537];
var(*) /*0x03280000-0x00000000*/ private editconst @NULL WindVelocity[65537];
var(*) /*0x03280000-0x00000000*/ private editconst float WindVelocityBlendTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipInitClothing[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoftBodySim[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int SoftBodySceneIndex[805437441];
var(*) /*0x48010000-0x00000000*/ private bool bEnableSoftBodySimulation[196609];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodyTetraPosData[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodyTetraIndexData[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumSoftBodyTetraVerts;
var(*) /*0x35EA0000-0x00000000*/ private int NumSoftBodyTetraIndices;
var(*) /*0x48010000-0x00000000*/ private float SoftBodyImpulseScale[65537];
var(*) /*0x48010000-0x00000000*/ private bool bSoftBodyFrozen[196609];
var(*) /*0x48010000-0x00000000*/ private bool bAutoFreezeSoftBodyWhenNotRendered[65537];
var(*) /*0x48010000-0x00000000*/ private bool bSoftBodyAwakeOnStartup[65537];
var(*) /*0x48010000-0x00000000*/ private bool bSoftBodyUseCompartment[196609];
var(*) /*0x48010000-0x00000000*/ private byte SoftBodyRBChannel[196609];
var(*) /*0x48010000-0x00000000*/ private @NULL SoftBodyRBCollideWithChannels[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoftBodyASVPlane[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LimitMaterial;
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMotionDelta[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMotionVelocity[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootBoneTranslation[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMotionAccelScale;
var(*) /*0x47900000-0x00000000*/ private byte RootMotionMode[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte PreviousRMM[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte PendingRMM;
var(*) /*0x35EA0000-0x00000000*/ private byte OldPendingRMM;
var(*) /*0x35EA0000-0x00000000*/ private int bRMMOneFrameDelay[131073];
var(*) /*0x47900000-0x00000000*/ private byte RootMotionRotationMode[65537];
var(*) /*0x47900000-0x00000000*/ private byte AnimRotationOnly[65537];
var(*) /*0x47900000-0x00000000*/ private byte FaceFXBlendMode[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FaceFXActorInstance[805306369];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CachedFaceFXAudioComp[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BoneVisibilityStates[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedFaceFxAkEvent;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedFaceFxAkEventCBInfo;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CachedFaceFXAKComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private float FaceFXAKCSpeedModifier;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL FaceFXChildComponent[655361];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FaceFXBlendModeMixedAdditiveBoneNames;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FaceFXBlendModeMixedAdditiveBones[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LocalToWorldBoneAtom[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float ProgressiveDrawingFraction[536870913];
var(*) /*0x35EA0000-0x00000000*/ private byte CustomSortAlternateIndexMode[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MorphTargetsQueried[536870913];

// Export USkeletalMeshComponent::execAttachComponent(FFrame&, void* const)
native final function @NULL AttachComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Component[8388609];
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RelativeLocation[9437185], RelativeRotation, RelativeScale;


}

// Export USkeletalMeshComponent::execDetachComponent(FFrame&, void* const)
native final function @NULL DetachComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Component[8388609];


}

// Export USkeletalMeshComponent::execAttachComponentToSocket(FFrame&, void* const)
native final function @NULL AttachComponentToSocket()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Component[8388609];
    local /*0x35EA0000-0x00000000*/ private name SocketName[8388609];


}

// Export USkeletalMeshComponent::execGetSocketWorldLocationAndRotation(FFrame&, void* const)
native final function GetSocketWorldLocationAndRotation()
{
    local /*0x35EA0000-0x00000000*/ private name InSocketName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutLocation[25165825], OutRotation;
    local /*0x35EA0000-0x00000000*/ private int Space[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetSocketByName(FFrame&, void* const)
native final function GetSocketByName()
{
    local /*0x35EA0000-0x00000000*/ private name InSocketName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetSocketBoneName(FFrame&, void* const)
native final function GetSocketBoneName()
{
    local /*0x35EA0000-0x00000000*/ private name InSocketName[8388609], ReturnValue;


}

// Export USkeletalMeshComponent::execFindComponentAttachedToBone(FFrame&, void* const)
native final function @NULL FindComponentAttachedToBone()
{
    local /*0x35EA0000-0x00000000*/ private name InBoneName[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execIsComponentAttached(FFrame&, void* const)
native final function @NULL IsComponentAttached()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Component[8388609];
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execAttachedComponents(FFrame&, void* const)
native final iterator function @NULL AttachedComponents()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL OutComponent[25165825];


}

// Export USkeletalMeshComponent::execGetTransformMatrix(FFrame&, void* const)
native final function GetTransformMatrix()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSetSkeletalMesh(FFrame&, void* const)
native final simulated function SetSkeletalMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMesh[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bKeepSpaceBases[9437185];


}

// Export USkeletalMeshComponent::execSetPhysicsAsset(FFrame&, void* const)
native final simulated function SetPhysicsAsset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPhysicsAsset[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceReInit[9437185];


}

// Export USkeletalMeshComponent::execSetForceRefPose(FFrame&, void* const)
native final simulated function SetForceRefPose()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewForceRefPose[8388609];


}

// Export USkeletalMeshComponent::execSPRestoreBodiesFixed(FFrame&, void* const)
native final simulated function SPRestoreBodiesFixed();

// Export USkeletalMeshComponent::execSetEnableClothSimulation(FFrame&, void* const)
native final simulated function SetEnableClothSimulation()
{
    local /*0x35EA0000-0x00000000*/ private bool bInEnable[8388609];


}

// Export USkeletalMeshComponent::execSetClothFrozen(FFrame&, void* const)
native final simulated function SetClothFrozen()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewFrozen[8388609];


}

// Export USkeletalMeshComponent::execSetEnableClothingSimulation(FFrame&, void* const)
native final simulated function SetEnableClothingSimulation()
{
    local /*0x35EA0000-0x00000000*/ private bool bInEnable[8388609];


}

// Export USkeletalMeshComponent::execUpdateClothParams(FFrame&, void* const)
native final simulated function UpdateClothParams();

// Export USkeletalMeshComponent::execSetClothExternalForce(FFrame&, void* const)
native final simulated function SetClothExternalForce()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InForce[8388609];


}

// Export USkeletalMeshComponent::execSetAttachClothVertsToBaseBody(FFrame&, void* const)
native final simulated function SetAttachClothVertsToBaseBody()
{
    local /*0x35EA0000-0x00000000*/ private bool bAttachVerts[8388609];


}

// Export USkeletalMeshComponent::execResetClothVertsToRefPose(FFrame&, void* const)
native final simulated function ResetClothVertsToRefPose();

// Export USkeletalMeshComponent::execForceApexClothingTeleportAndReset(FFrame&, void* const)
native final simulated function ForceApexClothingTeleportAndReset();

// Export USkeletalMeshComponent::execForceApexClothingTeleport(FFrame&, void* const)
native final simulated function ForceApexClothingTeleport();

// Export USkeletalMeshComponent::execGetClothAttachmentResponseCoefficient(FFrame&, void* const)
native final simulated function GetClothAttachmentResponseCoefficient()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothAttachmentTearFactor(FFrame&, void* const)
native final simulated function GetClothAttachmentTearFactor()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothBendingStiffness(FFrame&, void* const)
native final simulated function GetClothBendingStiffness()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothCollisionResponseCoefficient(FFrame&, void* const)
native final simulated function GetClothCollisionResponseCoefficient()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothDampingCoefficient(FFrame&, void* const)
native final simulated function GetClothDampingCoefficient()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothFlags(FFrame&, void* const)
native final simulated function GetClothFlags()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothFriction(FFrame&, void* const)
native final simulated function GetClothFriction()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothPressure(FFrame&, void* const)
native final simulated function GetClothPressure()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothSleepLinearVelocity(FFrame&, void* const)
native final simulated function GetClothSleepLinearVelocity()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothSolverIterations(FFrame&, void* const)
native final simulated function GetClothSolverIterations()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothStretchingStiffness(FFrame&, void* const)
native final simulated function GetClothStretchingStiffness()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothTearFactor(FFrame&, void* const)
native final simulated function GetClothTearFactor()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClothThickness(FFrame&, void* const)
native final simulated function GetClothThickness()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSetClothAttachmentResponseCoefficient(FFrame&, void* const)
native final simulated function SetClothAttachmentResponseCoefficient()
{
    local /*0x35EA0000-0x00000000*/ private float ClothAttachmentResponseCoefficient[8388609];


}

// Export USkeletalMeshComponent::execSetClothAttachmentTearFactor(FFrame&, void* const)
native final simulated function SetClothAttachmentTearFactor()
{
    local /*0x35EA0000-0x00000000*/ private float ClothAttachTearFactor[8388609];


}

// Export USkeletalMeshComponent::execSetClothBendingStiffness(FFrame&, void* const)
native final simulated function SetClothBendingStiffness()
{
    local /*0x35EA0000-0x00000000*/ private float ClothBendingStiffness[8388609];


}

// Export USkeletalMeshComponent::execSetClothCollisionResponseCoefficient(FFrame&, void* const)
native final simulated function SetClothCollisionResponseCoefficient()
{
    local /*0x35EA0000-0x00000000*/ private float ClothCollisionResponseCoefficient[8388609];


}

// Export USkeletalMeshComponent::execSetClothDampingCoefficient(FFrame&, void* const)
native final simulated function SetClothDampingCoefficient()
{
    local /*0x35EA0000-0x00000000*/ private float ClothDampingCoefficient[8388609];


}

// Export USkeletalMeshComponent::execSetClothFlags(FFrame&, void* const)
native final simulated function SetClothFlags()
{
    local /*0x35EA0000-0x00000000*/ private int ClothFlags[8388609];


}

// Export USkeletalMeshComponent::execSetClothFriction(FFrame&, void* const)
native final simulated function SetClothFriction()
{
    local /*0x35EA0000-0x00000000*/ private float ClothFriction[8388609];


}

// Export USkeletalMeshComponent::execSetClothPressure(FFrame&, void* const)
native final simulated function SetClothPressure()
{
    local /*0x35EA0000-0x00000000*/ private float ClothPressure[8388609];


}

// Export USkeletalMeshComponent::execSetClothSleepLinearVelocity(FFrame&, void* const)
native final simulated function SetClothSleepLinearVelocity()
{
    local /*0x35EA0000-0x00000000*/ private float ClothSleepLinearVelocity[8388609];


}

// Export USkeletalMeshComponent::execSetClothSolverIterations(FFrame&, void* const)
native final simulated function SetClothSolverIterations()
{
    local /*0x35EA0000-0x00000000*/ private int ClothSolverIterations[8388609];


}

// Export USkeletalMeshComponent::execSetClothStretchingStiffness(FFrame&, void* const)
native final simulated function SetClothStretchingStiffness()
{
    local /*0x35EA0000-0x00000000*/ private float ClothStretchingStiffness[8388609];


}

// Export USkeletalMeshComponent::execSetClothTearFactor(FFrame&, void* const)
native final simulated function SetClothTearFactor()
{
    local /*0x35EA0000-0x00000000*/ private float ClothTearFactor[8388609];


}

// Export USkeletalMeshComponent::execSetClothThickness(FFrame&, void* const)
native final simulated function SetClothThickness()
{
    local /*0x35EA0000-0x00000000*/ private float ClothThickness[8388609];


}

// Export USkeletalMeshComponent::execSetClothSleep(FFrame&, void* const)
native final simulated function SetClothSleep()
{
    local /*0x35EA0000-0x00000000*/ private bool IfClothSleep[8388609];


}

// Export USkeletalMeshComponent::execSetClothPosition(FFrame&, void* const)
native final simulated function SetClothPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClothOffSet[8388609];


}

// Export USkeletalMeshComponent::execSetClothVelocity(FFrame&, void* const)
native final simulated function SetClothVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL VelocityOffSet[8388609];


}

// Export USkeletalMeshComponent::execAttachClothToCollidingShapes(FFrame&, void* const)
native final simulated function AttachClothToCollidingShapes()
{
    local /*0x35EA0000-0x00000000*/ private bool AttatchTwoWay[8388609], AttachTearable;


}

// Export USkeletalMeshComponent::execEnableClothValidBounds(FFrame&, void* const)
native final simulated function EnableClothValidBounds()
{
    local /*0x35EA0000-0x00000000*/ private bool IfEnableClothValidBounds[8388609];


}

// Export USkeletalMeshComponent::execSetClothValidBounds(FFrame&, void* const)
native final simulated function SetClothValidBounds()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClothValidBoundsMin[8388609], ClothValidBoundsMax;


}

// Export USkeletalMeshComponent::execUpdateSoftBodyParams(FFrame&, void* const)
native final simulated function UpdateSoftBodyParams();

// Export USkeletalMeshComponent::execSetSoftBodyFrozen(FFrame&, void* const)
native final simulated function SetSoftBodyFrozen()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewFrozen[8388609];


}

// Export USkeletalMeshComponent::execWakeSoftBody(FFrame&, void* const)
native final simulated function WakeSoftBody();

// Export USkeletalMeshComponent::execFindAnimSequence(FFrame&, void* const)
native final function FindAnimSequence()
{
    local /*0x35EA0000-0x00000000*/ private name AnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSaveAnimSets(FFrame&, void* const)
native final function SaveAnimSets();

// Export USkeletalMeshComponent::execRestoreSavedAnimSets(FFrame&, void* const)
native final function RestoreSavedAnimSets();

final function GetAnimRateByDuration()
{
    local /*0x35EA0000-0x00000000*/ private name AnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Duration[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSeq;

    AnimSeq = FindAnimSequence(AnimSeqName);
    // End:0x5C
    if((AnimSeq == none) || AnimSeq.RateScale <= 0.0000000)
    {
        return 1.0000000;
    }
    return AnimSeq.SequenceLength / (Duration * AnimSeq.RateScale);
    //return ReturnValue;    
}

final function GetAnimLength()
{
    local /*0x35EA0000-0x00000000*/ private name AnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSeq;

    AnimSeq = FindAnimSequence(AnimSeqName);
    // End:0x5C
    if((AnimSeq == none) || AnimSeq.RateScale <= 0.0000000)
    {
        return 0.0000000;
    }
    return AnimSeq.SequenceLength / AnimSeq.RateScale;
    //return ReturnValue;    
}

// Export USkeletalMeshComponent::execFindMorphTarget(FFrame&, void* const)
native final function FindMorphTarget()
{
    local /*0x35EA0000-0x00000000*/ private name MorphTargetName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execFindAnimNode(FFrame&, void* const)
native final function FindAnimNode()
{
    local /*0x35EA0000-0x00000000*/ private name InNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execAllAnimNodes(FFrame&, void* const)
native final iterator function AllAnimNodes()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Node[25165825];


}

// Export USkeletalMeshComponent::execFindSkelControl(FFrame&, void* const)
native final function FindSkelControl()
{
    local /*0x35EA0000-0x00000000*/ private name InControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execFindMorphNode(FFrame&, void* const)
native final function FindMorphNode()
{
    local /*0x35EA0000-0x00000000*/ private name InNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetBoneQuaternion(FFrame&, void* const)
native final function GetBoneQuaternion()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private int Space[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetBoneLocation(FFrame&, void* const)
native final function GetBoneLocation()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private int Space[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execMatchRefBone(FFrame&, void* const)
native final function MatchRefBone()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetBoneName(FFrame&, void* const)
native final function GetBoneName()
{
    local /*0x35EA0000-0x00000000*/ private int BoneIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetBoneMatrix(FFrame&, void* const)
native final function GetBoneMatrix()
{
    local /*0x35EA0000-0x00000000*/ private int BoneIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetParentBone(FFrame&, void* const)
native final function GetParentBone()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609], ReturnValue;


}

// Export USkeletalMeshComponent::execGetBoneNames(FFrame&, void* const)
native final function GetBoneNames()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BoneNames[25165825];


}

// Export USkeletalMeshComponent::execBoneIsChildOf(FFrame&, void* const)
native final function BoneIsChildOf()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609], ParentBoneName;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetRefPosePosition(FFrame&, void* const)
native final function GetRefPosePosition()
{
    local /*0x35EA0000-0x00000000*/ private int BoneIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetBoneAxis(FFrame&, void* const)
native final function GetBoneAxis()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Axis[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execTransformToBoneSpace(FFrame&, void* const)
native final function TransformToBoneSpace()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InPosition[8388609], InRotation, OutPosition, OutRotation;


}

// Export USkeletalMeshComponent::execTransformFromBoneSpace(FFrame&, void* const)
native final function TransformFromBoneSpace()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InPosition[8388609], InRotation, OutPosition, OutRotation;


}

// Export USkeletalMeshComponent::execFindClosestBone(FFrame&, void* const)
native final function FindClosestBone()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestLocation[8388609], BoneLocation;
    local /*0x35EA0000-0x00000000*/ private float IgnoreScale[9437185];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetClosestCollidingBoneLocation(FFrame&, void* const)
native final function GetClosestCollidingBoneLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bCheckZeroExtent[8388609], bCheckNonZeroExtent;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSetAnimTreeTemplate(FFrame&, void* const)
native final function SetAnimTreeTemplate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTemplate[8388609];


}

// Export USkeletalMeshComponent::execSetParentAnimComponent(FFrame&, void* const)
native final function @NULL SetParentAnimComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL NewParentAnimComp[8388609];


}

// Export USkeletalMeshComponent::execUpdateParentBoneMap(FFrame&, void* const)
native final function UpdateParentBoneMap();

// Export USkeletalMeshComponent::execInitSkelControls(FFrame&, void* const)
native final function InitSkelControls();

// Export USkeletalMeshComponent::execInitMorphTargets(FFrame&, void* const)
native final function InitMorphTargets();

// Export USkeletalMeshComponent::execFindConstraintIndex(FFrame&, void* const)
native final function FindConstraintIndex()
{
    local /*0x35EA0000-0x00000000*/ private name ConstraintName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execFindConstraintBoneName(FFrame&, void* const)
native final function FindConstraintBoneName()
{
    local /*0x35EA0000-0x00000000*/ private int ConstraintIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execFindBodyInstanceNamed(FFrame&, void* const)
native final function FindBodyInstanceNamed()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSetHasPhysicsAssetInstance(FFrame&, void* const)
native final function SetHasPhysicsAssetInstance()
{
    local /*0x35EA0000-0x00000000*/ private bool bHasInstance[8388609], bUseCurrentPosition;


}

// Export USkeletalMeshComponent::execUpdateRBBonesFromSpaceBases(FFrame&, void* const)
native final function UpdateRBBonesFromSpaceBases()
{
    local /*0x35EA0000-0x00000000*/ private bool bMoveUnfixedBodies[8388609], bTeleport;


}

// Export USkeletalMeshComponent::execForceSkelUpdate(FFrame&, void* const)
native final function ForceSkelUpdate();

// Export USkeletalMeshComponent::execUpdateAnimations(FFrame&, void* const)
native final function UpdateAnimations();

// Export USkeletalMeshComponent::execGetBonesWithinRadius(FFrame&, void* const)
native final function GetBonesWithinRadius()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private int TraceFlags[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Bones[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execAddInstanceVertexWeightBoneParented(FFrame&, void* const)
native final function AddInstanceVertexWeightBoneParented()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bPairWithParent[9437185];

    true                
}

// Export USkeletalMeshComponent::execRemoveInstanceVertexWeightBoneParented(FFrame&, void* const)
native final function RemoveInstanceVertexWeightBoneParented()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];


}

// Export USkeletalMeshComponent::execFindInstanceVertexweightBonePair(FFrame&, void* const)
native final function FindInstanceVertexweightBonePair()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Bones[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execUpdateInstanceVertexWeightBones(FFrame&, void* const)
native final function UpdateInstanceVertexWeightBones()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BonePairs[8388609];


}

// Export USkeletalMeshComponent::execToggleInstanceVertexWeights(FFrame&, void* const)
native final function ToggleInstanceVertexWeights()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnable[8388609];
    local /*0x35EA0000-0x00000000*/ private int LODIdx[8388609];


}

// Export USkeletalMeshComponent::execPlayFaceFXAnim(FFrame&, void* const)
native final function PlayFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FaceFXAnimSetRef[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string AnimName[8388609], GroupName;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay, AkCBInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execStopFaceFXAnim(FFrame&, void* const)
native final function StopFaceFXAnim();

// Export USkeletalMeshComponent::execIsPlayingFaceFXAnim(FFrame&, void* const)
native final function IsPlayingFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execDeclareFaceFXRegister(FFrame&, void* const)
native final function DeclareFaceFXRegister()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string RegName[8388609];


}

// Export USkeletalMeshComponent::execGetFaceFXRegister(FFrame&, void* const)
native final function GetFaceFXRegister()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string RegName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSetFaceFXRegister(FFrame&, void* const)
native final function SetFaceFXRegister()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string RegName[8388609];
    local /*0x35EA0000-0x00000000*/ private float RegVal[8388609];
    local /*0x35EA0000-0x00000000*/ private byte RegOp[8388609];
    local /*0x35EA0000-0x00000000*/ private float InterpDuration[9437185];


}

// Export USkeletalMeshComponent::execSetFaceFXRegisterEx(FFrame&, void* const)
native final function SetFaceFXRegisterEx()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string RegName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte RegOp[8388609];
    local /*0x35EA0000-0x00000000*/ private float FirstValue[8388609], FirstInterpDuration, NextValue, NextInterpDuration;


}

// Export USkeletalMeshComponent::execHideBone(FFrame&, void* const)
native final function HideBone()
{
    local /*0x35EA0000-0x00000000*/ private int BoneIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PhysBodyOption[8388609];


}

// Export USkeletalMeshComponent::execUnHideBone(FFrame&, void* const)
native final function UnHideBone()
{
    local /*0x35EA0000-0x00000000*/ private int BoneIndex[8388609];


}

// Export USkeletalMeshComponent::execIsBoneHidden(FFrame&, void* const)
native final function IsBoneHidden()
{
    local /*0x35EA0000-0x00000000*/ private int BoneIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execHideBoneByName(FFrame&, void* const)
native final function HideBoneByName()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PhysBodyOption[8388609];


}

// Export USkeletalMeshComponent::execUnHideBoneByName(FFrame&, void* const)
native final function UnHideBoneByName()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[8388609];


}

// Export USkeletalMeshComponent::execUpdateMeshForBrokenConstraints(FFrame&, void* const)
native final simulated function UpdateMeshForBrokenConstraints();

// Export USkeletalMeshComponent::execShowMaterialSection(FFrame&, void* const)
native final simulated function ShowMaterialSection()
{
    local /*0x35EA0000-0x00000000*/ private int MaterialID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bShow[8388609];
    local /*0x35EA0000-0x00000000*/ private int LODIndex[8388609];


}

// Export USkeletalMeshComponent::execIsPlayParticleEffectNotifyAttachmentValid(FFrame&, void* const)
native final simulated function IsPlayParticleEffectNotifyAttachmentValid()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function PlayAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Duration[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185], bRestartIfAlreadyPlaying;
    local /*0x35EA0000-0x00000000*/ private float StartTime[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bPlayBackwards[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNode;
    local /*0x35EA0000-0x00000000*/ private float DesiredRate;

    true
    0.0000000
    false
    AnimNode = AnimNodeSequence(Animations);
    // End:0xB4
    if((AnimNode == none) && Animations.IsA('AnimTree'))
    {
        AnimNode = AnimNodeSequence(AnimTree(Animations).Children[0].Anim);
    }
    // End:0xC6
    if(AnimNode == none)
    {        
    }
    else
    {
        // End:0x2B7
        if((AnimNode.AnimSeq != none) && AnimNode.AnimSeq.SequenceName == AnimName)
        {
            DesiredRate = ((Duration > 0.0000000) ? AnimNode.AnimSeq.SequenceLength / (Duration * AnimNode.AnimSeq.RateScale) : 1.0000000);
            DesiredRate = ((bPlayBackwards) ? -DesiredRate : DesiredRate);
            // End:0x262
            if(bRestartIfAlreadyPlaying || !AnimNode.bPlaying)
            {
                AnimNode.PlayAnim(bLoop, DesiredRate, StartTime);                
            }
            else
            {
                AnimNode.Rate = DesiredRate;
                AnimNode.bLooping = bLoop;
            }            
        }
        else
        {
            AnimNode.SetAnim(AnimName);
            // End:0x402
            if(AnimNode.AnimSeq != none)
            {
                DesiredRate = ((Duration > 0.0000000) ? AnimNode.AnimSeq.SequenceLength / (Duration * AnimNode.AnimSeq.RateScale) : 1.0000000);
                DesiredRate = ((bPlayBackwards) ? -DesiredRate : DesiredRate);
                AnimNode.PlayAnim(bLoop, DesiredRate, StartTime);
            }
        }
    }
    //return;    
}

function StopAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNode;

    AnimNode = AnimNodeSequence(Animations);
    // End:0x9F
    if((AnimNode == none) && Animations.IsA('AnimTree'))
    {
        AnimNode = AnimNodeSequence(AnimTree(Animations).Children[0].Anim);
    }
    // End:0xB1
    if(AnimNode == none)
    {        
    }
    else
    {
        AnimNode.StopAnim();
    }
    //return;    
}

event @NULL CreateForceField()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000400*/ private @NULL NewForceFieldComponent;

    NewForceFieldComponent = new (self) AnimNotifyData.ForceFieldComponent.Class (AnimNotifyData.ForceFieldComponent);
    NewForceFieldComponent.DoInitRBPhys();
    // End:0xDE
    if(AnimNotifyData.SocketName != 'None')
    {
        AttachComponentToSocket(NewForceFieldComponent, AnimNotifyData.SocketName);        
    }
    else
    {
        // End:0x13E
        if(AnimNotifyData.BoneName != 'None')
        {
            AttachComponent(NewForceFieldComponent, AnimNotifyData.BoneName);
        }
    }
    return true;
    //return ReturnValue;    
}

event @NULL PlayParticleEffect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc, Rot, WI, PSC;
    local /*0x35EA0000-0x00000000*/ private bool bPlayNonExtreme;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    // End:0x55
    if(int(WI.NetMode) == int(NM_DedicatedServer))
    {
        return true;
    }
    // End:0x7B
    if(AnimNotifyData.PSTemplate == none)
    {
        return false;
    }
    bPlayNonExtreme = (AnimNotifyData.bIsExtremeContent && Class'Engine'.static.IsGame()) && !WI.GRI.ShouldShowGore();
    // End:0x139
    if(bPlayNonExtreme && AnimNotifyData.PSNonExtremeContentTemplate == none)
    {
        return false;
    }
    // End:0x326
    if(AnimNotifyData.bAttach)
    {
        // End:0x323
        if(IsPlayParticleEffectNotifyAttachmentValid(AnimNotifyData))
        {
            PSC = new (self) Class'ParticleSystemComponent';
            // End:0x1D6
            if(bPlayNonExtreme)
            {
                PSC.SetTemplate(AnimNotifyData.PSNonExtremeContentTemplate);                
            }
            else
            {
                PSC.SetTemplate(AnimNotifyData.PSTemplate);
            }
            // End:0x273
            if(AnimNotifyData.SocketName != 'None')
            {
                AttachComponentToSocket(PSC, AnimNotifyData.SocketName);                
            }
            else
            {
                // End:0x2D3
                if(AnimNotifyData.BoneName != 'None')
                {
                    AttachComponent(PSC, AnimNotifyData.BoneName);
                }
            }
            PSC.ActivateSystem(true);
            PSC.__OnSystemFinished__Delegate = SkelMeshCompOnParticleSystemFinished;
        }        
    }
    else
    {
        // End:0x390
        if(AnimNotifyData.SocketName != 'None')
        {
            GetSocketWorldLocationAndRotation(AnimNotifyData.SocketName, Loc, Rot);            
        }
        else
        {
            // End:0x409
            if(AnimNotifyData.BoneName != 'None')
            {
                Loc = GetBoneLocation(AnimNotifyData.BoneName);
                Rot = rot(0, 0, 1);                
            }
            else
            {
                Loc = GetPosition();
                Rot = rot(0, 0, 1);
            }
        }
        // End:0x5B1
        if(((Owner != none) && Owner.WorldInfo != none) && Owner.WorldInfo.MyEmitterPool != none)
        {
            // End:0x531
            if(bPlayNonExtreme)
            {
                Owner.WorldInfo.MyEmitterPool.SpawnEmitter(AnimNotifyData.PSNonExtremeContentTemplate, Loc, Rot);                
            }
            else
            {
                Owner.WorldInfo.MyEmitterPool.SpawnEmitter(AnimNotifyData.PSTemplate, Loc, Rot);
            }            
        }
        else
        {
            // End:0x6ED
            if(Class'Engine'.static.IsGame())
            {
                PSC = new (self) Class'ParticleSystemComponent';
                PSC.SetTemplate(AnimNotifyData.PSTemplate);
                PSC.SetAbsolute(true, true, true);
                PSC.SetTranslation(Loc);
                PSC.SetRotation(Rot);
                PSC.ActivateSystem(true);
                PSC.__OnSystemFinished__Delegate = SkelMeshCompOnParticleSystemFinished;                
            }
            else
            {
                // End:0x8E9
                if(Class'Engine'.static.IsEditor())
                {
                    PSC = new (self) Class'ParticleSystemComponent';
                    PSC.SetTemplate(AnimNotifyData.PSTemplate);
                    PSC.SetAbsolute(true, true, true);
                    PSC.SetTranslation(Loc);
                    PSC.SetRotation(Rot);
                    // End:0x836
                    if(AnimNotifyData.SocketName != 'None')
                    {
                        AttachComponentToSocket(PSC, AnimNotifyData.SocketName);                        
                    }
                    else
                    {
                        // End:0x896
                        if(AnimNotifyData.BoneName != 'None')
                        {
                            AttachComponent(PSC, AnimNotifyData.BoneName);
                        }
                    }
                    PSC.ActivateSystem(true);
                    PSC.__OnSystemFinished__Delegate = SkelMeshCompOnParticleSystemFinished;                    
                }
                else
                {
                    return false;
                }
            }
        }
    }
    // End:0x91E
    if(PSC != none)
    {
        PSC.SecondsBeforeInactive = 0.0000000;
    }
    // End:0x9B2
    if(((PSC != none) && AnimNotifyData.BoneSocketModuleActorName != 'None') && Owner != none)
    {
        PSC.SetActorParameter(AnimNotifyData.BoneSocketModuleActorName, Owner);
    }
    return true;
    //return ReturnValue;    
}

simulated function @NULL SkelMeshCompOnParticleSystemFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PSC[8388609], PDLE;

    PDLE = ParticleLightEnvironmentComponent(PSC.LightEnvironment);
    DetachComponent(PSC);
    // End:0x1B1
    if(PSC != none)
    {
        // End:0x189
        if((((PDLE != none) && !PDLE.IsPendingKill()) && PDLE.Owner == Owner) && !PDLE.bAllowDLESharing)
        {
            // End:0x120
            if(!PSC.IsPendingKill())
            {
                PSC.SetLightEnvironment(none);
            }
            // End:0x161
            if(PDLE.bAttached)
            {
                PDLE.DetachFromAny();
            }
            Class'SPObject'.static.MarkObjectAsPendingKill(PDLE);
        }
        Class'SPObject'.static.MarkObjectAsPendingKill(PSC);
    }
    //return;    
}

final simulated function BreakConstraint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Impulse[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private name InBoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bVelChange[9437185];
    local /*0x35EA0000-0x00000000*/ private int ConstraintIndex, LODIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL Constraint, ConstraintSetup, Body;

    ConstraintIndex = FindConstraintIndex(InBoneName);
    // End:0x33
    if(ConstraintIndex == -1)
    {
        return;
    }
    Constraint = PhysicsAssetInstance.Constraints[ConstraintIndex];
    // End:0x89
    if(Constraint.bTerminated)
    {
        return;
    }
    LODIdx = 0;
    J0x94:

    // End:0xFF [Loop If]
    if(LODIdx < LODInfo.Length)
    {
        // End:0xF1
        if(int(LODInfo[LODIdx].InstanceWeightUsage) == int(0))
        {
            ToggleInstanceVertexWeights(true, LODIdx);
        }
        LODIdx++;
        // [Loop Continue]
        goto J0x94;
    }
    AddInstanceVertexWeightBoneParented(InBoneName);
    ConstraintSetup = PhysicsAsset.ConstraintSetup[Constraint.ConstraintIndex];
    Body = FindBodyInstanceNamed(ConstraintSetup.JointName);
    // End:0x1DF
    if((Body != none) && Body.IsFixed())
    {
        Body.SetFixed(false);
    }
    Constraint.TermConstraint();
    UpdateMeshForBrokenConstraints();
    AddImpulse(Impulse, HitLocation, InBoneName, bVelChange);
    //return;    
}

// Export USkeletalMeshComponent::execGetPosition(FFrame&, void* const)
native function GetPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execGetRotation(FFrame&, void* const)
native function GetRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USkeletalMeshComponent::execSetMaterial(FFrame&, void* const)
native function SetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Material[8388609];


}
