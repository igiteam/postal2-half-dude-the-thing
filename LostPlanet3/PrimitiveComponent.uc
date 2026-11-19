class PrimitiveComponent extends ActorComponent
    abstract
    noexport;

enum ERBCollisionChannel
{
    RBCC_Default,                   // 0
    RBCC_Nothing,                   // 1
    RBCC_Pawn,                      // 2
    RBCC_Vehicle,                   // 3
    RBCC_Water,                     // 4
    RBCC_GameplayPhysics,           // 5
    RBCC_EffectPhysics,             // 6
    RBCC_Untitled1,                 // 7
    RBCC_Untitled2,                 // 8
    RBCC_Untitled3,                 // 9
    RBCC_Untitled4,                 // 10
    RBCC_Cloth,                     // 11
    RBCC_FluidDrain,                // 12
    RBCC_SoftBody,                  // 13
    RBCC_FracturedMeshPart,         // 14
    RBCC_BlockingVolume,            // 15
    RBCC_DeadPawn,                  // 16
    RBCC_Clothing,                  // 17
    RBCC_ClothingCollision,         // 18
    RBCC_PhatPawnSize1,             // 19
    RBCC_PhatPawnSize2,             // 20
    RBCC_PhatPawnSize3,             // 21
    RBCC_MAX                        // 22
};

enum GJKResult
{
    GJK_Intersect,                  // 0
    GJK_NoIntersection,             // 1
    GJK_Fail,                       // 2
    GJK_MAX                         // 3
};

enum ERadialImpulseFalloff
{
    RIF_Constant,                   // 0
    RIF_Linear,                     // 1
    RIF_MAX                         // 2
};

struct MaterialViewRelevance
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bOpaque;
    var(*) /*0x35EA0000-0x00000000*/ private bool bTranslucent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDistortion;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOneLayerDistortionRelevance;
    var(*) /*0x35EA0000-0x00000000*/ private bool bLit;
    var(*) /*0x35EA0000-0x00000000*/ private bool bUsesSceneColor;

    structdefaultproperties
    {
        bOpaque=false
        bTranslucent=false
        bDistortion=false
        bOneLayerDistortionRelevance=false
        bLit=false
        bUsesSceneColor=false
    }
};

struct RBCollisionChannelContainer
{
    var(*) /*0x40160000-0x00000000*/ private bool Default[196609];
    var(*) /*0x35EA0000-0x00000000*/ private bool Nothing[131073];
    var(*) /*0x40160000-0x00000000*/ private bool Pawn[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Vehicle[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Water[196609];
    var(*) /*0x40160000-0x00000000*/ private bool GameplayPhysics[196609];
    var(*) /*0x40160000-0x00000000*/ private bool EffectPhysics[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Untitled1[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Untitled2[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Untitled3[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Untitled4[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Cloth[196609];
    var(*) /*0x40160000-0x00000000*/ private bool FluidDrain[196609];
    var(*) /*0x40160000-0x00000000*/ private bool SoftBody[196609];
    var(*) /*0x40160000-0x00000000*/ private bool FracturedMeshPart[196609];
    var(*) /*0x40160000-0x00000000*/ private bool BlockingVolume[196609];
    var(*) /*0x40160000-0x00000000*/ private bool DeadPawn[196609];
    var(*) /*0x40160000-0x00000000*/ private bool Clothing[196609];
    var(*) /*0x40160000-0x00000000*/ private bool ClothingCollision[196609];
    var(*) /*0x35EA0000-0x00000000*/ private bool PhatPawnSize1[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool PhatPawnSize2[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool PhatPawnSize3[131073];

    structdefaultproperties
    {
        Default=false
        Nothing=false
        Pawn=false
        Vehicle=false
        Water=false
        GameplayPhysics=false
        EffectPhysics=false
        Untitled1=false
        Untitled2=false
        Untitled3=false
        Untitled4=false
        Cloth=false
        FluidDrain=false
        SoftBody=false
        FracturedMeshPart=false
        BlockingVolume=false
        DeadPawn=false
        Clothing=false
        ClothingCollision=false
        PhatPawnSize1=false
        PhatPawnSize2=false
        PhatPawnSize3=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private int Tag[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Bounds[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SceneInfo[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int DetachFence[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float LocalToWorldDeterminant[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LocalToWorld[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int MotionBlurInfoIndex[805437441];
var(*) /*0x35EA0000-0x00000100*/ private array DecalList[268566529];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array DecalsToReattach[537526273];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL ShadowParent[655361];
var(*) /*0x41420000-0x10000400*/ private export @NULL ReplacementPrimitive[589825];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL FogVolumeComponent[537526273];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL OverrideLightComponent[537526273];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL LightEnvironment[655361];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviousLightEnvironment[537526273];
var(*) /*0x41420000-0x00000000*/ private float MinDrawDistance[65537];
var(*) /*0x41420000-0x00000000*/ private float MassiveLODDistance[65537];
var(*) /*0x41420000-0x00000080*/ private float MaxDrawDistance[196609];
var(*) /*0x41420000-0x00000000*/ private const float CachedMaxDrawDistance[65537];
var(*) /*0x41420000-0x00000000*/ private float MotionBlurInstanceScale[65537];
var(*) /*0x35EA0000-0x00000080*/ private transient float CullDistance[131073];
var(*) /*0x35EA0000-0x00000000*/ private const transient float CachedCullDistance;
var(*) /*0x41420000-0x00000000*/ private byte DepthPriorityGroup[196609];
var(*) /*0x35EA0000-0x00000000*/ private byte ViewOwnerDepthPriorityGroup[131073];
var(*) /*0x41420000-0x00000000*/ private byte DetailMode[196609];
var(*) /*0x136C0000-0x00000000*/ private byte RBChannel[196609];
var(*) /*0x3C500000-0x00000000*/ private byte RBDominanceGroup[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte PreviewEnvironmentShadowing;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseViewOwnerDepthPriorityGroup[131073];
var(*) /*0x41420000-0x00000000*/ private bool bAllowCullDistanceVolume[196609];
var(*) /*0x41420000-0x00000000*/ private bool HiddenGame[196609];
var(*) /*0x41420000-0x00000000*/ private bool HiddenEditor[196609];
var(*) /*0x41420000-0x00000000*/ private bool bOwnerNoSee[196609];
var(*) /*0x41420000-0x00000000*/ private bool bOnlyOwnerSee[196609];
var(*) /*0x41420000-0x00000000*/ private bool bIgnoreOwnerHidden[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseAsOccluder;
var(*) /*0x41420000-0x00000000*/ private bool bAllowApproximateOcclusion[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bFirstFrameOcclusion;
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreNearPlaneIntersection;
var(*) /*0x35EA0000-0x00000000*/ private bool bSelectable;
var(*) /*0x41420000-0x00000000*/ private bool bForceMipStreaming[196609];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bAcceptsDecals[131073];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bAcceptsDecalsDuringGameplay[131073];
var(*) /*0x41420000-0x00000000*/ private bool bAcceptsStaticDecals[196609];
var(*) /*0x41420000-0x00000000*/ private bool bAcceptsDynamicDecals[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsRefreshingDecals[805437441];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowDecalAutomaticReAttach[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsePerInstanceHitProxies;
var(*) /*0x2EB00000-0x00000000*/ private bool CastShadow[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceDirectLightMap[131073];
var(*) /*0x2EB00000-0x00000000*/ private bool bCastDynamicShadow[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bCastStaticShadow[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bSelfShadowOnly[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bNoModSelfShadow[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bAcceptsDynamicDominantLightShadows[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bCastHiddenShadow[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bCastShadowAsTwoSided[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bAcceptsLights[196609];
var(*) /*0x2EB00000-0x00000000*/ private bool bAcceptsDynamicLights[196609];
var(*) /*0x2EB00000-0x00000000*/ private bool bUseOnePassLightingOnTranslucency[196609];
var(*) /*0x2EB00000-0x00000000*/ private bool bUsePrecomputedShadows[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasExplicitShadowParent[537001985];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bAllowAmbientOcclusion;
var(*) /*0x136C0000-0x00000000*/ private bool CollideActors[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeverAddToCollisionOctree[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool AlwaysCheckCollision[131073];
var(*) /*0x136C0000-0x00000000*/ private bool BlockActors[196609];
var(*) /*0x136C0000-0x00000000*/ private bool BlockZeroExtent[196609];
var(*) /*0x136C0000-0x00000000*/ private bool BlockNonZeroExtent[196609];
var(*) /*0x136C0000-0x00000000*/ private bool CanBlockCamera[196609];
var(*) /*0x136C0000-0x00000000*/ private bool BlockRigidBody[196609];
var(*) /*0x136C0000-0x00000000*/ private bool bBlockFootPlacement[196609];
var(*) /*0x136C0000-0x00000000*/ private bool CanBlockLegIK[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bDisableAllRigidBody[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bSkipRBGeomCreation[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bNotifyRigidBodyCollision[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bFluidDrain[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bFluidTwoWay[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bIgnoreRadialImpulse[65537];
var(*) /*0x3C500000-0x00000000*/ private bool bIgnoreRadialForce[65537];
var(*) /*0x3C500000-0x00000000*/ private bool bIgnoreForceField[65537];
var(*) /*0x3C500000-0x00000000*/ private bool bUseCompartment[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool AlwaysLoadOnClient[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool AlwaysLoadOnServer[131073];
var(*) /*0x3E6B0000-0x00000000*/ private bool bIgnoreHiddenActorsMembership[65537];
var(*) /*0x3E6B0000-0x00000000*/ private bool AbsoluteTranslation[196609];
var(*) /*0x3E6B0000-0x00000000*/ private bool AbsoluteRotation[196609];
var(*) /*0x3E6B0000-0x00000000*/ private bool AbsoluteScale[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowShadowFade;
var(*) /*0x35EA0000-0x00000000*/ private bool bSupportedOnMobile;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasSNFiltered[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array OctreeNodes[805437441];
var(*) /*0x41420000-0x00000000*/ private int TranslucencySortPriority[65537];
var(*) /*0x35EA0000-0x00000000*/ private int VisibilityId;
var(*) /*0x2EB00000-0x00000000*/ private @NULL LightingChannels[196609];
var(*) /*0x136C0000-0x00000000*/ private @NULL RBCollideWithChannels[196609];
var(*) /*0x3C500000-0x00000000*/ private @NULL PhysMaterialOverride[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BodyInstance[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedParentToWorld[805437441];
var(*) /*0x3E6B0000-0x00000000*/ private @NULL Translation[196609];
var(*) /*0x3E6B0000-0x00000000*/ private @NULL Rotation[196609];
var(*) /*0x3E6B0000-0x00000000*/ private float Scale[196609];
var(*) /*0x3E6B0000-0x00000000*/ private @NULL Scale3D[196609];
var(*) /*0x3E6B0000-0x00000000*/ private float BoundsScale[196609];
var(*) /*0x35EA0000-0x00000000*/ private float LastSubmitTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float LastRenderTime[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float ScriptRigidBodyCollisionThreshold;

// Export UPrimitiveComponent::execAddImpulse(FFrame&, void* const)
native final function AddImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Impulse[8388609], Position;
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bVelChange[9437185];


}

// Export UPrimitiveComponent::execAddRadialImpulse(FFrame&, void* const)
native final function AddRadialImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609], Strength;
    local /*0x35EA0000-0x00000000*/ private byte Falloff[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bVelChange[9437185];


}

// Export UPrimitiveComponent::execAddForce(FFrame&, void* const)
native final function AddForce()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Force[8388609], Position;
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];


}

// Export UPrimitiveComponent::execAddRadialForce(FFrame&, void* const)
native final function AddRadialForce()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609], Strength;
    local /*0x35EA0000-0x00000000*/ private byte Falloff[8388609];


}

// Export UPrimitiveComponent::execAddTorque(FFrame&, void* const)
native final function AddTorque()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Torque[8388609];
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];


}

// Export UPrimitiveComponent::execSetRBLinearVelocity(FFrame&, void* const)
native final function SetRBLinearVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewVel[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAddToCurrent[9437185];


}

// Export UPrimitiveComponent::execSetRBAngularVelocity(FFrame&, void* const)
native final function SetRBAngularVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewAngVel[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAddToCurrent[9437185];


}

// Export UPrimitiveComponent::execRetardRBLinearVelocity(FFrame&, void* const)
native final function RetardRBLinearVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RetardDir[8388609];
    local /*0x35EA0000-0x00000000*/ private float VelScale[8388609];


}

// Export UPrimitiveComponent::execSetRBPosition(FFrame&, void* const)
native final function SetRBPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPos[8388609];
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];


}

// Export UPrimitiveComponent::execSetRBRotation(FFrame&, void* const)
native final function SetRBRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRot[8388609];
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];


}

// Export UPrimitiveComponent::execWakeRigidBody(FFrame&, void* const)
native final function WakeRigidBody()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];


}

// Export UPrimitiveComponent::execPutRigidBodyToSleep(FFrame&, void* const)
native final function PutRigidBodyToSleep()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];


}

// Export UPrimitiveComponent::execRigidBodyIsAwake(FFrame&, void* const)
native final function RigidBodyIsAwake()
{
    local /*0x35EA0000-0x00000000*/ private name BoneName[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPrimitiveComponent::execSetBlockRigidBody(FFrame&, void* const)
native final function SetBlockRigidBody()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewBlockRigidBody[8388609];


}

// Export UPrimitiveComponent::execSetRBCollidesWithChannel(FFrame&, void* const)
native final function SetRBCollidesWithChannel()
{
    local /*0x35EA0000-0x00000000*/ private byte Channel[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNewCollides[8388609];


}

// Export UPrimitiveComponent::execSetRBCollisionChannels(FFrame&, void* const)
native final function SetRBCollisionChannels()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Channels[8388609];


}

// Export UPrimitiveComponent::execSetRBChannel(FFrame&, void* const)
native final function SetRBChannel()
{
    local /*0x35EA0000-0x00000000*/ private byte Channel[8388609];


}

// Export UPrimitiveComponent::execSetNotifyRigidBodyCollision(FFrame&, void* const)
native final function SetNotifyRigidBodyCollision()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewNotifyRigidBodyCollision[8388609];


}

// Export UPrimitiveComponent::execInitRBPhys(FFrame&, void* const)
native final function InitRBPhys();

// Export UPrimitiveComponent::execSetPhysMaterialOverride(FFrame&, void* const)
native final function SetPhysMaterialOverride()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPhysMaterial[8388609];


}

// Export UPrimitiveComponent::execGetRootBodyInstance(FFrame&, void* const)
native final function GetRootBodyInstance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPrimitiveComponent::execSetRBDominanceGroup(FFrame&, void* const)
native final function SetRBDominanceGroup()
{
    local /*0x35EA0000-0x00000000*/ private byte InDomGroup[8388609];


}

// Export UPrimitiveComponent::execShouldComponentAddToScene(FFrame&, void* const)
native final function ShouldComponentAddToScene()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPrimitiveComponent::execSetHidden(FFrame&, void* const)
native final function SetHidden()
{
    local /*0x35EA0000-0x00000000*/ private bool NewHidden[8388609];


}

// Export UPrimitiveComponent::execSetOwnerNoSee(FFrame&, void* const)
native final function SetOwnerNoSee()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewOwnerNoSee[8388609];


}

// Export UPrimitiveComponent::execSetOnlyOwnerSee(FFrame&, void* const)
native final function SetOnlyOwnerSee()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewOnlyOwnerSee[8388609];


}

// Export UPrimitiveComponent::execSetIgnoreOwnerHidden(FFrame&, void* const)
native final function SetIgnoreOwnerHidden()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewIgnoreOwnerHidden[8388609];


}

// Export UPrimitiveComponent::execSetShadowParent(FFrame&, void* const)
native final function @NULL SetShadowParent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL NewShadowParent[8388609];


}

// Export UPrimitiveComponent::execSetLightEnvironment(FFrame&, void* const)
native final function @NULL SetLightEnvironment()
{
    local /*0x35EA0000-0x00000400*/ private @NULL NewLightEnvironment[8388609];


}

// Export UPrimitiveComponent::execSetCullDistance(FFrame&, void* const)
native final function SetCullDistance()
{
    local /*0x35EA0000-0x00000000*/ private float NewCullDistance[8388609];


}

// Export UPrimitiveComponent::execSetLightingChannels(FFrame&, void* const)
native final function SetLightingChannels()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLightingChannels[8388609];


}

// Export UPrimitiveComponent::execSetDepthPriorityGroup(FFrame&, void* const)
native final function SetDepthPriorityGroup()
{
    local /*0x35EA0000-0x00000000*/ private byte NewDepthPriorityGroup[8388609];


}

// Export UPrimitiveComponent::execSetViewOwnerDepthPriorityGroup(FFrame&, void* const)
native final function SetViewOwnerDepthPriorityGroup()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewUseViewOwnerDepthPriorityGroup[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NewViewOwnerDepthPriorityGroup[8388609];


}

// Export UPrimitiveComponent::execSetTraceBlocking(FFrame&, void* const)
native final function SetTraceBlocking()
{
    local /*0x35EA0000-0x00000000*/ private bool NewBlockZeroExtent[8388609], NewBlockNonZeroExtent;


}

// Export UPrimitiveComponent::execSetActorCollision(FFrame&, void* const)
native final function SetActorCollision()
{
    local /*0x35EA0000-0x00000000*/ private bool NewCollideActors[8388609], NewBlockActors, NewAlwaysCheckCollision;


}

// Export UPrimitiveComponent::execSetTranslation(FFrame&, void* const)
native function SetTranslation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTranslation[8388609];


}

// Export UPrimitiveComponent::execSetRotation(FFrame&, void* const)
native function SetRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];


}

// Export UPrimitiveComponent::execSetScale(FFrame&, void* const)
native function SetScale()
{
    local /*0x35EA0000-0x00000000*/ private float NewScale[8388609];


}

// Export UPrimitiveComponent::execSetScale3D(FFrame&, void* const)
native function SetScale3D()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewScale3D[8388609];


}

// Export UPrimitiveComponent::execSetAbsolute(FFrame&, void* const)
native function SetAbsolute()
{
    local /*0x35EA0000-0x00000000*/ private bool NewAbsoluteTranslation[9437185], NewAbsoluteRotation, NewAbsoluteScale;


}

// Export UPrimitiveComponent::execGetPosition(FFrame&, void* const)
native function GetPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPrimitiveComponent::execGetRotation(FFrame&, void* const)
native function GetRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPrimitiveComponent::execClosestPointOnComponentToPoint(FFrame&, void* const)
native final function ClosestPointOnComponentToPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL POI[25165825], Extent, OutPointA, OutPointB;
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UPrimitiveComponent::execClosestPointOnComponentToComponent(FFrame&, void* const)
native function @NULL ClosestPointOnComponentToComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL OtherComponent[25165825], PointOnComponentA, PointOnComponentB;
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}
