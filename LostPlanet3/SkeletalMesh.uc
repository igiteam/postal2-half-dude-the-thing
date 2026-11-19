class SkeletalMesh extends Object
    noexport
    hidecategories(Object);

enum BoneBreakOption
{
    BONEBREAK_SoftPreferred,        // 0
    BONEBREAK_AutoDetect,           // 1
    BONEBREAK_RigidPreferred,       // 2
    BONEBREAK_MAX                   // 3
};

enum TriangleSortOption
{
    TRISORT_None,                   // 0
    TRISORT_CenterRadialDistance,   // 1
    TRISORT_Random,                 // 2
    TRISORT_MergeContiguous,        // 3
    TRISORT_Custom,                 // 4
    TRISORT_CustomLeftRight,        // 5
    TRISORT_MAX                     // 6
};

enum ClothMovementScaleGen
{
    ECMDM_DistToFixedVert,          // 0
    ECMDM_VertexBoneWeight,         // 1
    ECMDM_Empty,                    // 2
    ECMDM_MAX                       // 3
};

enum TriangleSortAxis
{
    TSA_X_Axis,                     // 0
    TSA_Y_Axis,                     // 1
    TSA_Z_Axis,                     // 2
    TSA_MAX                         // 3
};

enum SkeletalMeshOptimizationImportance
{
    SMOI_Normal,                    // 0
    SMOI_High,                      // 1
    SMOI_Highest,                   // 2
    SMOI_MAX                        // 3
};

enum SkeletalMeshOptimizationNormalMode
{
    SMONM_Recalculate,              // 0
    SMONM_RecalculateSoft,          // 1
    SMONM_RecalculateHard,          // 2
    SMONM_MAX                       // 3
};

enum ClothBoneType
{
    CLOTHBONE_Fixed,                // 0
    CLOTHBONE_BreakableAttachment,  // 1
    CLOTHBONE_TearLine,             // 2
    CLOTHBONE_MAX                   // 3
};

enum SoftBodyBoneType
{
    SOFTBODYBONE_Fixed,             // 0
    SOFTBODYBONE_BreakableAttachment,// 1
    SOFTBODYBONE_TwoWayAttachment,  // 2
    SOFTBODYBONE_MAX                // 3
};

struct native ApexClothingLodInfo
{
    var(*) /*0x032D0000-0x00000000*/ private editfixedsize array ClothingSectionInfo[4259841];

    structdefaultproperties
    {
        ClothingSectionInfo=none
    }
};

struct native ApexClothingAssetInfo
{
    var(*) /*0x032A0000-0x00000000*/ private editfixedsize array ClothingLodInfo[4259841];
    var(*) /*0x35EA0000-0x00000000*/ private name ClothingAssetName;

    structdefaultproperties
    {
        ClothingLodInfo=none
        ClothingAssetName="None"
    }
};

struct native BoneMirrorInfo
{
    var(*) /*0x0B3B0000-0x00000000*/ private int SourceIndex[65537];
    var(*) /*0x0B3B0000-0x00000000*/ private byte BoneFlipAxis[65537];

    structdefaultproperties
    {
        SourceIndex=0
        BoneFlipAxis=EAxis.AXIS_NONE
    }
};

struct native BoneMirrorExport
{
    var(*) /*0x0B3A0000-0x00000000*/ private name BoneName[65537];
    var(*) /*0x0B3A0000-0x00000000*/ private name SourceBoneName[65537];
    var(*) /*0x0B3A0000-0x00000000*/ private byte BoneFlipAxis[65537];

    structdefaultproperties
    {
        BoneName="None"
        SourceBoneName="None"
        BoneFlipAxis=EAxis.AXIS_NONE
    }
};

struct TriangleSortSettings
{
    var(*) /*0x4DBF0000-0x00000000*/ private byte TriangleSorting[65537];
    var(*) /*0x4DBF0000-0x00000000*/ private byte CustomLeftRightAxis[65537];
    var(*) /*0x4DBF0000-0x00000000*/ private name CustomLeftRightBoneName[65537];

    structdefaultproperties
    {
        TriangleSorting=TriangleSortOption.TRISORT_None
        CustomLeftRightAxis=TriangleSortAxis.TSA_X_Axis
        CustomLeftRightBoneName="None"
    }
};

struct native SkeletalMeshLODInfo
{
    var(*) /*0x47930000-0x00000000*/ private float DisplayFactor[65537];
    var(*) /*0x47930000-0x00000000*/ private float LODHysteresis[65537];
    var(*) /*0x47930000-0x00000000*/ private editfixedsize array LODMaterialMap[4259841];
    var(*) /*0x47930000-0x00000000*/ private editfixedsize array bEnableShadowCasting[4259841];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array TriangleSorting;
    var(*) /*0x47930000-0x00000000*/ private editfixedsize array TriangleSortSettings[4259841];
    var(*) /*0x47930000-0x00000000*/ private editfixedsize array SectionsToExcludeFromViewOwnerDPG[65537];
    var(*) /*0x47930000-0x00000000*/ private bool bDisableCompressions[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenSimplified;

    structdefaultproperties
    {
        DisplayFactor=0.0000000
        LODHysteresis=0.0000000
        LODMaterialMap=none
        bEnableShadowCasting=none
        TriangleSortSettings=none
        SectionsToExcludeFromViewOwnerDPG=none
        bDisableCompressions=false
        bHasBeenSimplified=false
    }
};

struct native SkeletalMeshOptimizationSettings
{
    var(*) /*0x35EA0000-0x00000000*/ private float MaxDeviationPercentage;
    var(*) /*0x35EA0000-0x00000000*/ private byte SilhouetteImportance;
    var(*) /*0x35EA0000-0x00000000*/ private byte TextureImportance;
    var(*) /*0x35EA0000-0x00000000*/ private byte ShadingImportance;
    var(*) /*0x35EA0000-0x00000000*/ private byte SkinningImportance;
    var(*) /*0x35EA0000-0x00000000*/ private byte NormalMode;

    structdefaultproperties
    {
        MaxDeviationPercentage=0.0000000
        SilhouetteImportance=SkeletalMeshOptimizationImportance.SMOI_Normal
        TextureImportance=SkeletalMeshOptimizationImportance.SMOI_Normal
        ShadingImportance=SkeletalMeshOptimizationImportance.SMOI_Normal
        SkinningImportance=SkeletalMeshOptimizationImportance.SMOI_Normal
        NormalMode=SkeletalMeshOptimizationNormalMode.SMONM_Recalculate
    }
};

struct native ClothSpecialBoneInfo
{
    var(*) /*0x133E0000-0x00000000*/ private name BoneName[65537];
    var(*) /*0x133E0000-0x00000000*/ private byte BoneType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AttachedVertexIndices[131073];

    structdefaultproperties
    {
        BoneName="None"
        BoneType=ClothBoneType.CLOTHBONE_Fixed
        AttachedVertexIndices=none
    }
};

struct native SoftBodyTetraLink
{
    var(*) /*0x35EA0000-0x00000000*/ private int Index;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Bary;

    structdefaultproperties
    {
        Index=0
        Bary=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native SoftBodySpecialBoneInfo
{
    var(*) /*0x481A0000-0x00000000*/ private name BoneName[65537];
    var(*) /*0x481A0000-0x00000000*/ private byte BoneType[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AttachedVertexIndices[131073];

    structdefaultproperties
    {
        BoneName="None"
        BoneType=SoftBodyBoneType.SOFTBODYBONE_Fixed
        AttachedVertexIndices=none
    }
};

var(*) /*0x47870000-0x00000000*/ private @NULL Bounds[268632065];
var(*) /*0x47870000-0x00000000*/ private array Materials[268632065];
var(*) /*0x47870000-0x00000000*/ private editfixedsize array ClothingAssets[4259841];
var(*) /*0x47870000-0x00000000*/ private editfixedsize array ClothingLodMap[4259841];
var(*) /*0x47870000-0x00000000*/ private @NULL Origin[268632065];
var(*) /*0x47870000-0x00000000*/ private @NULL RotOrigin[268632065];
var(*) /*0x35EA0000-0x00000000*/ private array RefSkeleton[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int SkeletalDepth[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} NameIndexMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LODModels[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SourceData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array RefBasesInvMatrix[268566529];
var(*) /*0x47870000-0x00000000*/ private editfixedsize array SkelMirrorTable[4259841];
var(*) /*0x47870000-0x00000000*/ private byte SkelMirrorAxis[65537];
var(*) /*0x47870000-0x00000000*/ private byte SkelMirrorFlipAxis[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Sockets;
var(*) /*0x47870000-0x00000000*/ private const array BoneBreakNames[268632065];
var(*) /*0x47870000-0x00000000*/ private array BoneBreakOptions[268632065];
var(*) /*0x47870000-0x00000000*/ private editfixedsize array LODInfo[4259841];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OptimizationSettings;
var(*) /*0x47870000-0x00000000*/ private editfixedsize array PerPolyCollisionBones[65537];
var(*) /*0x47870000-0x00000000*/ private editfixedsize array AddToParentPerPolyCollisionBone[65537];
var(*) /*0x35EA0000-0x00000000*/ private array PerPolyBoneKDOPs[268566529];
var(*) /*0x47870000-0x00000000*/ private bool bPerPolyUseSoftWeighting[65537];
var(*) /*0x47870000-0x00000000*/ private bool bUseSimpleLineCollision[65537];
var(*) /*0x47870000-0x00000000*/ private bool bUseSimpleBoxCollision[65537];
var(*) /*0x47870000-0x00000000*/ private bool bForceCPUSkinning[196609];
var(*) /*0x47870000-0x00000000*/ private bool bUseFullPrecisionUVs[196609];
var(*) /*0x47870000-0x00000000*/ private bool bPartitionForEdgeGeometry[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenSimplified;
var(*) /*0x47870000-0x00000000*/ private @NULL FaceFXAsset[65537];
var(*) /*0x47870000-0x00000000*/ private @NULL BoundsPreviewAsset[65537];
var(*) /*0x47870000-0x00000000*/ private editfixedsize array PreviewMorphSets[65537];
var(*) /*0x47870000-0x00000000*/ private int LODBiasPC[65537];
var(*) /*0x47870000-0x00000000*/ private int LODBiasPS3[65537];
var(*) /*0x47870000-0x00000000*/ private int LODBiasXbox360[65537];
var(*) /*0x47870000-0x00000000*/ private const editfixedsize string SourceFilePath[196609];
var(*) /*0x47870000-0x00000000*/ private const editfixedsize string SourceFileTimestamp[196609];
var(*) /*0x35EA0000-0x00000000*/ private array ClothMesh[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ClothMeshScale[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothToGraphicsVertMap[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothMovementScale[131073];
var(*) /*0x12FE0000-0x00000000*/ private byte ClothMovementScaleGenMode[65537];
var(*) /*0x12FE0000-0x00000000*/ private float ClothToAnimMeshMaxDist[65537];
var(*) /*0x12FE0000-0x00000000*/ private bool bLimitClothToAnimMesh[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothWeldingMap[131073];
var(*) /*0x35EA0000-0x00000000*/ private int ClothWeldingDomain[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothWeldedIndices[131073];
var(*) /*0x12FF0000-0x00000000*/ private bool bForceNoWelding[196609];
var(*) /*0x35EA0000-0x00000000*/ private int NumFreeClothVerts[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClothIndexBuffer[131073];
var(*) /*0x12FE0000-0x00000000*/ private editfixedsize array ClothBones[196609];
var(*) /*0x12FE0000-0x00000000*/ private int ClothHierarchyLevels[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bEnableClothBendConstraints[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bEnableClothDamping[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bUseClothCOMDamping[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothStretchStiffness[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothBendStiffness[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothDensity[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothThickness[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothDamping[196609];
var(*) /*0x12FE0000-0x00000000*/ private int ClothIterations[196609];
var(*) /*0x12FE0000-0x00000000*/ private int ClothHierarchicalIterations[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothFriction[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothRelativeGridSpacing[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothPressure[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothCollisionResponseCoefficient[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothAttachmentResponseCoefficient[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothAttachmentTearFactor[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothSleepLinearVelocity[196609];
var(*) /*0x12FE0000-0x00000000*/ private float HardStretchLimitFactor[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bHardStretchLimit[196609];
var(*) /*0x12FF0000-0x00000000*/ private bool bEnableClothOrthoBendConstraints[196609];
var(*) /*0x12FF0000-0x00000000*/ private bool bEnableClothSelfCollision[196609];
var(*) /*0x12FF0000-0x00000000*/ private bool bEnableClothPressure[196609];
var(*) /*0x12FF0000-0x00000000*/ private bool bEnableClothTwoWayCollision[196609];
var(*) /*0x12FF0000-0x00000000*/ private editfixedsize array ClothSpecialBones[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bEnableClothLineChecks[196609];
var(*) /*0x12FF0000-0x00000000*/ private bool bClothMetal[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothMetalImpulseThreshold[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothMetalPenetrationDepth[196609];
var(*) /*0x12FF0000-0x00000000*/ private float ClothMetalMaxDeformationDistance[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bEnableClothTearing[196609];
var(*) /*0x12FE0000-0x00000000*/ private float ClothTearFactor[196609];
var(*) /*0x12FE0000-0x00000000*/ private int ClothTearReserve[196609];
var(*) /*0x12FE0000-0x00000000*/ private bool bEnableValidBounds[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL ValidBoundsMin[65537];
var(*) /*0x12FE0000-0x00000000*/ private @NULL ValidBoundsMax[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ClothTornTriMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodySurfaceToGraphicsVertMap[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodySurfaceIndices[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodyTetraVertsUnscaled[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodyTetraIndices[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoftBodyTetraLinks[131073];
var(*) /*0x35EA0000-0x00000000*/ private array CachedSoftBodyMeshes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array CachedSoftBodyMeshScales[805437441];
var(*) /*0x48010000-0x00000000*/ private editfixedsize array SoftBodyBones[196609];
var(*) /*0x48010000-0x00000000*/ private editfixedsize array SoftBodySpecialBones[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyVolumeStiffness[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyStretchingStiffness[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyDensity[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyParticleRadius[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyDamping[196609];
var(*) /*0x48010000-0x00000000*/ private int SoftBodySolverIterations[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyFriction[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyRelativeGridSpacing[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodySleepLinearVelocity[196609];
var(*) /*0x48010000-0x00000000*/ private bool bEnableSoftBodySelfCollision[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyAttachmentResponse[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyCollisionResponse[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyDetailLevel[196609];
var(*) /*0x48010000-0x00000000*/ private int SoftBodySubdivisionLevel[196609];
var(*) /*0x48010000-0x00000000*/ private bool bSoftBodyIsoSurface[196609];
var(*) /*0x48010000-0x00000000*/ private bool bEnableSoftBodyDamping[196609];
var(*) /*0x48010000-0x00000000*/ private bool bUseSoftBodyCOMDamping[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyAttachmentThreshold[196609];
var(*) /*0x48010000-0x00000000*/ private bool bEnableSoftBodyTwoWayCollision[196609];
var(*) /*0x48010000-0x00000000*/ private float SoftBodyAttachmentTearFactor[196609];
var(*) /*0x48010000-0x00000000*/ private bool bEnableSoftBodyLineChecks[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasVertexColors;
var(*) /*0x35EA0000-0x00000000*/ private array GraphicsIndexIsCloth[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array CachedStreamingTextureFactors[268566529];
var(*) /*0x47870000-0x00000000*/ private float StreamingDistanceMultiplier[196609];
var(*) /*0x35EA0000-0x00000000*/ private int ReleaseResourcesFence[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SkelMeshRUID[537001985];
var(*) /*0x03280000-0x00000000*/ private bool bUseClothingAssetMaterial[196609];

defaultproperties
{
    SkelMirrorAxis=EAxis.AXIS_X
    SkelMirrorFlipAxis=EAxis.AXIS_Z
    bUseSimpleLineCollision=true
    bUseSimpleBoxCollision=true
    bPartitionForEdgeGeometry=true
    ClothStretchStiffness=1.0000000
    ClothBendStiffness=1.0000000
    ClothDensity=1.0000000
    ClothThickness=0.5000000
    ClothDamping=0.5000000
    ClothIterations=5
    ClothHierarchicalIterations=2
    ClothFriction=0.5000000
    ClothRelativeGridSpacing=1.0000000
    ClothPressure=1.0000000
    ClothCollisionResponseCoefficient=0.2000000
    ClothAttachmentResponseCoefficient=0.2000000
    ClothAttachmentTearFactor=1.5000000
    ClothSleepLinearVelocity=-1.0000000
    HardStretchLimitFactor=1.1000000
    ClothMetalImpulseThreshold=10.0000000
    ClothTearFactor=3.5000000
    ClothTearReserve=128
    SoftBodyVolumeStiffness=1.0000000
    SoftBodyStretchingStiffness=1.0000000
    SoftBodyDensity=1.0000000
    SoftBodyParticleRadius=0.1000000
    SoftBodyDamping=0.5000000
    SoftBodySolverIterations=5
    SoftBodyFriction=0.5000000
    SoftBodyRelativeGridSpacing=1.0000000
    SoftBodySleepLinearVelocity=-1.0000000
    SoftBodyAttachmentResponse=0.2000000
    SoftBodyCollisionResponse=0.2000000
    SoftBodyDetailLevel=0.5000000
    SoftBodySubdivisionLevel=4
    bSoftBodyIsoSurface=true
    SoftBodyAttachmentThreshold=0.5000000
    bEnableSoftBodyTwoWayCollision=true
    SoftBodyAttachmentTearFactor=1.5000000
    StreamingDistanceMultiplier=1.0000000
}