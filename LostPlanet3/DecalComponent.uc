class DecalComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Collision,Object,Physics,PrimitiveComponent);

enum EDecalTransform
{
    DecalTransform_OwnerAbsolute,   // 0
    DecalTransform_OwnerRelative,   // 1
    DecalTransform_SpawnRelative,   // 2
    DecalTransform_MAX              // 3
};

enum EFilterMode
{
    FM_None,                        // 0
    FM_Ignore,                      // 1
    FM_Affect,                      // 2
    FM_MAX                          // 3
};

struct native DecalReceiver
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL Component[655361];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RenderData[268566529];

    structdefaultproperties
    {
        Component=none
    }
};

var(*) /*0x16520000-0x00000000*/ private @NULL DecalMaterial[196609];
var(*) /*0x16520000-0x00000000*/ private float Width[65537];
var(*) /*0x16520000-0x00000000*/ private float Height[65537];
var(*) /*0x16520000-0x00000000*/ private float TileX[65537];
var(*) /*0x16520000-0x00000000*/ private float TileY[65537];
var(*) /*0x16520000-0x00000000*/ private float OffsetX[65537];
var(*) /*0x16520000-0x00000000*/ private float OffsetY[65537];
var(*) /*0x16520000-0x00000000*/ private float DecalRotation[65537];
var(*) /*0x35EA0000-0x00000000*/ private float FieldOfView;
var(*) /*0x16520000-0x00000000*/ private float NearPlane[65537];
var(*) /*0x16520000-0x00000000*/ private float FarPlane[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Location[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Orientation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL HitLocation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HitNormal;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HitTangent;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HitBinormal;
var(*) /*0x16520000-0x00000000*/ private bool bNoClip[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bStaticDecal[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceDynamicRenderElement;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceKeepOriginalSortOrder;
var(*) /*0x16590000-0x00000000*/ private bool bProjectOnBackfaces[65537];
var(*) /*0x16590000-0x00000000*/ private bool bProjectOnHidden[65537];
var(*) /*0x16590000-0x00000000*/ private bool bProjectOnBSP[65537];
var(*) /*0x16590000-0x00000000*/ private bool bProjectOnStaticMeshes[65537];
var(*) /*0x16590000-0x00000000*/ private bool bProjectOnSkeletalMeshes[65537];
var(*) /*0x16590000-0x00000000*/ private bool bProjectOnTerrain[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bFlipBackfaceDirection;
var(*) /*0x35EA0000-0x00000000*/ private bool bMovableDecal;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenAttached[536870913];
var(*) /*0x16570000-0x00000000*/ private bool bDecalMaterialSetAtRunTime[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL HitComponent[537395201];
var(*) /*0x35EA0000-0x00000000*/ private name HitBone[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int HitNodeIndex[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int HitLevelIndex[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int FracturedStaticMeshComponentIndex[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array HitNodeIndices[537001985];
var(*) /*0x35EA0000-0x00000100*/ private editfixedsize export array DecalReceivers[131073];
var(*) /*0x35EA0000-0x00000100*/ private array StaticReceivers[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseResourcesFence[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Planes[536870913];
var(*) /*0x16660000-0x00000000*/ private float DepthBias[65537];
var(*) /*0x16660000-0x00000000*/ private float SlopeScaleDepthBias[65537];
var(*) /*0x16660000-0x00000000*/ private int SortOrder[65537];
var(*) /*0x16660000-0x00000000*/ private float BackfaceAngle[65537];
var(*) /*0x16660000-0x00000000*/ private @NULL BlendRange[65537];
var(*) /*0x16660000-0x00000000*/ private float StreamingDistanceMultiplier[196609];
var(*) /*0x35EA0000-0x00000000*/ private byte DecalTransform[131073];
var(*) /*0x16590000-0x00000000*/ private byte FilterMode[65537];
var(*) /*0x16590000-0x00000000*/ private editfixedsize array Filter[65537];
var(*) /*0x16590000-0x00000400*/ private editfixedsize export array ReceiverImages[589825];
var(*) /*0x16660000-0x00000000*/ private @NULL ParentRelativeLocation[65537];
var(*) /*0x16660000-0x00000000*/ private @NULL ParentRelativeOrientation[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ParentRelLocRotMatrix[537001985];

// Export UDecalComponent::execResetToDefaults(FFrame&, void* const)
native final function ResetToDefaults();

// Export UDecalComponent::execSetDecalMaterial(FFrame&, void* const)
native final function SetDecalMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewDecalMaterial[8388609];


}

// Export UDecalComponent::execGetDecalMaterial(FFrame&, void* const)
native final function GetDecalMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UDecalComponent::execIsWaitingForResetToDefaultsToComplete(FFrame&, void* const)
native final function IsWaitingForResetToDefaultsToComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
