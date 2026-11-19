class Actor extends SPStateObject
    abstract
    nativereplication
    hidecategories(AnimDependency,Navigation);

const TRACEFLAG_Bullet = 1;
const TRACEFLAG_PhysicsVolumes = 2;
const TRACEFLAG_SkipMovers = 4;
const TRACEFLAG_Blocking = 8;
const TRACEFLAG_ForceController = 16;
const REP_RBLOCATION_ERROR_TOLERANCE_SQ = 16.0f;
const MINFLOORZ = 0.7;
const ACTORMAXSTEPHEIGHT = 35.0;
const RBSTATE_LINVELSCALE = 10.0;
const RBSTATE_ANGVELSCALE = 1000.0;
const RB_None = 0x00;
const RB_NeedsUpdate = 0x01;
const RB_Sleeping = 0x02;

enum EPhysics
{
    PHYS_None,                      // 0
    PHYS_Walking,                   // 1
    PHYS_Falling,                   // 2
    PHYS_Swimming,                  // 3
    PHYS_Flying,                    // 4
    PHYS_Rotating,                  // 5
    PHYS_Projectile,                // 6
    PHYS_Interpolating,             // 7
    PHYS_Spider,                    // 8
    PHYS_Ladder,                    // 9
    PHYS_RigidBody,                 // 10
    PHYS_SoftBody,                  // 11
    PHYS_NavMeshWalking,            // 12
    PHYS_Unused,                    // 13
    PHYS_Custom,                    // 14
    PHYS_MAX                        // 15
};

enum EMoveDir
{
    MD_Stationary,                  // 0
    MD_Forward,                     // 1
    MD_Backward,                    // 2
    MD_Left,                        // 3
    MD_Right,                       // 4
    MD_Up,                          // 5
    MD_Down,                        // 6
    MD_MAX                          // 7
};

enum EActorMetricsType
{
    METRICS_VERTS,                  // 0
    METRICS_TRIS,                   // 1
    METRICS_SECTIONS,               // 2
    METRICS_MAX                     // 3
};

enum ENetRole
{
    ROLE_None,                      // 0
    ROLE_SimulatedProxy,            // 1
    ROLE_AutonomousProxy,           // 2
    ROLE_Authority,                 // 3
    ROLE_MAX                        // 4
};

enum ECollisionType
{
    COLLIDE_CustomDefault,          // 0
    COLLIDE_NoCollision,            // 1
    COLLIDE_BlockAll,               // 2
    COLLIDE_BlockWeapons,           // 3
    COLLIDE_TouchAll,               // 4
    COLLIDE_TouchWeapons,           // 5
    COLLIDE_BlockAllButWeapons,     // 6
    COLLIDE_TouchAllButWeapons,     // 7
    COLLIDE_BlockWeaponsKickable,   // 8
    COLLIDE_MAX                     // 9
};

enum ETravelType
{
    TRAVEL_Absolute,                // 0
    TRAVEL_Partial,                 // 1
    TRAVEL_Relative,                // 2
    TRAVEL_MAX                      // 3
};

enum EDoubleClickDir
{
    DCLICK_None,                    // 0
    DCLICK_Left,                    // 1
    DCLICK_Right,                   // 2
    DCLICK_Forward,                 // 3
    DCLICK_Back,                    // 4
    DCLICK_Active,                  // 5
    DCLICK_Done,                    // 6
    DCLICK_MAX                      // 7
};

struct native TimerData
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bLoop;
    var(*) /*0x35EA0000-0x00000000*/ private bool bPaused;
    var(*) /*0x35EA0000-0x00000000*/ private name FuncName;
    var(*) /*0x35EA0000-0x00000000*/ private float Rate;
    var(*) /*0x35EA0000-0x00000000*/ private float Count;
    var(*) /*0x35EA0000-0x00000000*/ private float TimerTimeDilation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL TimerObj;

    structdefaultproperties
    {
        bLoop=false
        bPaused=false
        FuncName="None"
        Rate=0.0000000
        Count=0.0000000
        TimerTimeDilation=1.0000000
        TimerObj=none
    }
};

struct native transient TraceHitInfo
{
    var(*) /*0x35EA0000-0x00000010*/ private @NULL Material;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL PhysMaterial;
    var(*) /*0x35EA0000-0x00000010*/ private int Item;
    var(*) /*0x35EA0000-0x00000010*/ private int LevelIndex;
    var(*) /*0x35EA0000-0x00000010*/ private name BoneName;
    var(*) /*0x35EA0000-0x00000410*/ private export @NULL HitComponent[524289];

    structdefaultproperties
    {
        Material=none
        PhysMaterial=none
        Item=0
        LevelIndex=0
        BoneName="None"
        HitComponent=none
    }
};

struct native transient ImpactInfo
{
    var(*) /*0x35EA0000-0x00000010*/ private @NULL HitActor;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL HitLocation;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL HitNormal;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL RayDir;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL StartTrace;
    var(*) /*0x35EA0000-0x00000010*/ private export @NULL HitInfo;

    structdefaultproperties
    {
        HitActor=none
        HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        HitNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RayDir=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        StartTrace=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        HitInfo=(Material=none,PhysMaterial=none,Item=0,LevelIndex=0,BoneName="None",HitComponent=none)
    }
};

struct native transient AnimSlotInfo
{
    var(*) /*0x35EA0000-0x00000010*/ private name SlotName;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array ChannelWeights;

    structdefaultproperties
    {
        SlotName="None"
        ChannelWeights=none
    }
};

struct native transient AnimSlotDesc
{
    var(*) /*0x35EA0000-0x00000010*/ private name SlotName;
    var(*) /*0x35EA0000-0x00000010*/ private int NumChannels;

    structdefaultproperties
    {
        SlotName="None"
        NumChannels=0
    }
};

struct native AkCallbackInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private int AkFlags[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private @NULL AkFnCallback[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private @NULL AkCookie[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private @NULL KismetID[536870913];

    structdefaultproperties
    {
        AkFlags=0
        AkFnCallback=none
        AkCookie=none
        KismetID=none
    }
};

struct native PawnAnimationDependency
{
    var(*) /*0x3B500000-0x00000000*/ private class PawnClass[65537];
    var(*) /*0x3B500000-0x00000000*/ private @NULL AnimSetDependency[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int RefCount;

    structdefaultproperties
    {
        PawnClass=none
        AnimSetDependency=none
        RefCount=0
    }
};

struct native SPDamageFractionalEntry
{
    var(*) /*0x35EA0000-0x00000000*/ private float DamageAmount;
    var(*) /*0x35EA0000-0x00000000*/ private class DamageType;
    var(*) /*0x35EA0000-0x00000000*/ private float ExpireTime;

    structdefaultproperties
    {
        DamageAmount=0.0000000
        DamageType=none
        ExpireTime=-1.0000000
    }
};

struct RigidBodyState
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Position;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Quaternion;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LinVel;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL AngVel;
    var(*) /*0x35EA0000-0x00000000*/ private byte bNewData;

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Quaternion=(X=0.0000000,Y=0.0000000,Z=0.0000000,W=0.0000000)
        LinVel=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        AngVel=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bNewData=0
    }
};

struct RigidBodyContactInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ContactPosition;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ContactNormal;
    var(*) /*0x35EA0000-0x00000000*/ private float ContactPenetration;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ContactVelocity[2];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PhysMaterial[2];

    structdefaultproperties
    {
        ContactPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ContactNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ContactPenetration=0.0000000
        ContactVelocity[0]=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ContactVelocity[1]=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        PhysMaterial[0]=none
        PhysMaterial[1]=none
    }
};

struct CollisionImpactData
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ContactInfos;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL TotalNormalForceVector;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL TotalFrictionForceVector;

    structdefaultproperties
    {
        ContactInfos=none
        TotalNormalForceVector=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        TotalFrictionForceVector=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native PhysEffectInfo
{
    var(*) /*0x3C490000-0x00000000*/ private float Threshold[65537];
    var(*) /*0x3C490000-0x00000000*/ private float ReFireDelay[65537];
    var(*) /*0x3C490000-0x00000000*/ private @NULL Effect[65537];
    var(*) /*0x3C490000-0x00000000*/ private @NULL Sound[65537];

    structdefaultproperties
    {
        Threshold=0.0000000
        ReFireDelay=0.0000000
        Effect=none
        Sound=none
    }
};

struct native atomicwhencooked immutablewhencooked ActorReference
{
    var(*) /*0x00CD0000-0x00000000*/ private @NULL Actor[65537];
    var(*) /*0x00CD0000-0x00000000*/ private const @NULL Guid[196609];

    structdefaultproperties
    {
        Actor=none
        Guid=(A=0,B=0,C=0,D=0)
    }
};

struct native atomicwhencooked immutablewhencooked NavReference
{
    var(*) /*0x34B30000-0x00000000*/ private @NULL Nav[65537];
    var(*) /*0x34B30000-0x00000000*/ private const @NULL Guid[196609];

    structdefaultproperties
    {
        Nav=none
        Guid=(A=0,B=0,C=0,D=0)
    }
};

struct native BasedPosition
{
    var(*) /*0x04F80000-0x00000000*/ private @NULL Base[65537];
    var(*) /*0x04F80000-0x00000000*/ private @NULL Position[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedBaseLocation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedBaseRotation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedTransPosition;

    structdefaultproperties
    {
        Base=none
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        CachedBaseLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        CachedBaseRotation=(Pitch=0,Yaw=0,Roll=0)
        CachedTransPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array Components[655361];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array AllComponents[537526273];
var(*) /*0x33AC0000-0x00000000*/ private Vector Location[2293761];
var(*) /*0x33AC0000-0x00000000*/ private travel Rotator Rotation[2293761];
var(*) /*0x1CE70000-0x00000000*/ private editconst travel float DrawScale[2293761];
var(*) /*0x1CE70000-0x00000000*/ private editconst @NULL DrawScale3D[196609];
var(*) /*0x1CE70000-0x00000000*/ private @NULL PrePivot[196609];
var(*) /*0x1CE70000-0x00000000*/ private @NULL EditorIconColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DetachFence[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CustomTimeDilation;
var(*) /*0x33AC0000-0x00000000*/ private byte Physics[2293761];
var(*) /*0x35EA0000-0x00000000*/ private byte RemoteRole[2097153];
var(*) /*0x35EA0000-0x00000000*/ private byte Role[2097153];
var(*) /*0x136C0000-0x00000000*/ private byte CollisionType[537067521];
var(*) /*0x35EA0000-0x00000000*/ private byte ReplicatedCollisionType[538968065];
var(*) /*0x35EA0000-0x00000000*/ private byte TickGroup[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Owner[2228225];
var(*) /*0x03AB0000-0x00000000*/ private @NULL Base[2293761];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Timers[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bStatic[131073];
var(*) /*0x1CE70000-0x00000000*/ private bool bHidden[2293761];
var(*) /*0x35EA0000-0x00000000*/ private bool bNoDelete[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bDeleteMe[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bTicked[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bOnlyOwnerSee[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bTickIsDisabled[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bWorldGeometry;
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreRigidBodyPawns;
var(*) /*0x35EA0000-0x00000000*/ private bool bOrientOnSlope;
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreEncroachers[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bPushedByEncroachers;
var(*) /*0x35EA0000-0x00000000*/ private bool bDestroyedByInterpActor;
var(*) /*0x35EA0000-0x00000000*/ private bool bRouteBeginPlayEvenIfStatic[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsMoving[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysEncroachCheck;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasAlternateTargetLocation;
var(*) /*0x136C0000-0x00000000*/ private bool bCanStepUpOn[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNetTemporary[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bOnlyRelevantToOwner[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bNetDirty[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysRelevant;
var(*) /*0x35EA0000-0x00000000*/ private bool bReplicateInstigator;
var(*) /*0x35EA0000-0x00000000*/ private bool bReplicateMovement;
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipActorPropertyReplication;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateSimulatedPosition;
var(*) /*0x35EA0000-0x00000000*/ private bool bTearOff[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bOnlyDirtyReplication;
var(*) /*0x3C500000-0x00000000*/ private bool bAllowFluidSurfaceInteraction[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDemoRecording[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bDemoOwner;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceDemoRelevant;
var(*) /*0x35EA0000-0x00000000*/ private bool bNetInitialRotation[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bReplicateRigidBodyLocation;
var(*) /*0x35EA0000-0x00000000*/ private bool bKillDuringLevelTransition;
var(*) /*0x35EA0000-0x00000000*/ private bool bExchangedRoles[131073];
var(*) /*0x01B30000-0x00000000*/ private bool bConsiderAllStaticMeshComponentsForStreaming[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDebug[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bPostRenderIfNotVisible;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceNetUpdate[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingNetUpdate[537001985];
var(*) /*0x03AB0000-0x00000000*/ private bool bHardAttach[2293761];
var(*) /*0x03AB0000-0x00000000*/ private bool bIgnoreBaseRotation[65537];
var(*) /*0x03AB0000-0x00000000*/ private bool bShadowParented[65537];
var(*) /*0x03AB0000-0x00000000*/ private bool bSkipAttachedMoves[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanBeAdheredTo;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanBeFrictionedTo;
var(*) /*0x35EA0000-0x00000000*/ private bool bRegisteredPawnAnimationDependencies[536870913];
var(*) /*0x136C0000-0x00000000*/ private bool bAlwaysWalkableZ[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSaveToPersistentDataManager;
var(*) /*0x35EA0000-0x00000000*/ private bool bHurtEntry;
var(*) /*0x35EA0000-0x00000000*/ private bool bGameRelevant;
var(*) /*0x35EA0000-0x00000000*/ private bool bMovable[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bDestroyInPainVolume;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanBeDamaged;
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldBaseAtStartup;
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingDelete;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanTeleport;
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysTick[131073];
var(*) /*0x34770000-0x00000000*/ private bool bBlocksNavigation[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNotifyPrimitiveComponentUpdates[131073];
var(*) /*0x136C0000-0x00000000*/ private bool BlockRigidBody[537067521];
var(*) /*0x35EA0000-0x00000000*/ private bool bCollideWhenPlacing;
var(*) /*0x35EA0000-0x00000000*/ private bool bCollideActors[2228225];
var(*) /*0x35EA0000-0x00000000*/ private bool bCollideWorld[2097153];
var(*) /*0x136C0000-0x00000000*/ private bool bCollideComplex[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bBlockActors[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bProjTarget[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bBlocksTeleport;
var(*) /*0x35EA0000-0x00000000*/ private bool bMoveIgnoresDestruction;
var(*) /*0x35EA0000-0x00000000*/ private bool bProjectileMoveSingleBlocking;
var(*) /*0x136C0000-0x00000000*/ private bool bNoEncroachCheck[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCollideAsEncroacher;
var(*) /*0x136C0000-0x00000000*/ private bool bPhysRigidBodyOutOfWorldCheck[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bComponentOutsideWorld[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceOctreeSNFilter;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceOctreeMNFilter;
var(*) /*0x35EA0000-0x00000000*/ private bool bRigidBodyWasAwake[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bCallRigidBodyWakeEvents;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseMultipleExtent;
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckAIMeshWhenMoving;
var(*) /*0x136C0000-0x00000000*/ private bool bForcedBlockRadiusDamage[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bBounce;
var(*) /*0x35EA0000-0x00000000*/ private bool bJustTeleported[131073];
var(*) /*0x32E40000-0x00000000*/ private bool bEnableMobileTouch[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNetInitial[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bNetOwner[2228225];
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenEd[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bEditable[131073];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bHiddenEdGroup[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenEdLayer[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenEdCustom[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenEdTemporary[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenEdLevel[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenEdScene[536870913];
var(*) /*0x01B30000-0x00000000*/ private bool bEdShouldSnap[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bTempEditor[537001985];
var(*) /*0x136C0000-0x00000000*/ private bool bPathColliding[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bPathTemp[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bScriptInitialized;
var(*) /*0x01B30000-0x00000000*/ private bool bLockLocation[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceAllowKismetModification[131073];
var(*) /*0x16220000-0x00000000*/ private bool bDebugEffectIsRelevant[65537];
var(*) /*0x35EA0000-0x00000000*/ private int NetTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float NetUpdateTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private float NetUpdateFrequency;
var(*) /*0x35EA0000-0x00000000*/ private float NetPriority;
var(*) /*0x35EA0000-0x00000000*/ private float LastNetUpdateTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float TimeSinceLastTick;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Instigator[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WorldInfo[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float LifeSpan;
var(*) /*0x35EA0000-0x00000000*/ private float CreationTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private float LastRenderTime[536870913];
var(*) /*0x36F00000-0x00000000*/ private name Tag[65537];
var(*) /*0x35EA0000-0x00000000*/ private name InitialState;
var(*) /*0x36F00000-0x00000000*/ private name Layer[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient name Group;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HiddenEditorViews[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Touching[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Children[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float LatentFloat[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LatentSeqNode[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PhysicsVolume[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Velocity[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Acceleration;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AngularVelocity[537001985];
var(*) /*0x03AB0000-0x00000400*/ private export @NULL BaseSkelComponent[589825];
var(*) /*0x03AB0000-0x00000000*/ private name BaseBoneName[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Attached[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RelativeLocation[2228225];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RelativeRotation[2228225];
var(*) /*0x02AF0000-0x00000000*/ private editfixedsize array PawnAnimationDependencies[65537];
var(*) /*0x2B570000-0x00000400*/ private editfixedsize @NULL InteractionMetaData[589825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SpawnedFromActorFactory;
var(*) /*0x35EA0000-0x00000000*/ private int ProcessingTag[536870913];
var(*) /*0x1C9B0000-0x00000400*/ private const export @NULL DestructComponent[589825];
var(*) /*0x35EA0000-0x00000400*/ private const export @NULL InteractionComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private travel @NULL ReplicatedDestructProperty[538968065];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SPDamageFractional;
var(*) /*0x136C0000-0x00000400*/ private const export @NULL CollisionComponent[589825];
var(*) /*0x35EA0000-0x00000000*/ private int OverlapTag[268435457];
var(*) /*0x33AC0000-0x00000000*/ private @NULL RotationRate[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingTouch;
var(*) /*0x35EA0000-0x00000000*/ private class MessageClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SupportedEvents[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GeneratedEvents[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LatentActions;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnSpawnPreBeginPlayCallback__Delegate;

// Export UActor::execForceUpdateComponents(FFrame&, void* const)
native function ForceUpdateComponents()
{
    local /*0x35EA0000-0x00000000*/ private bool bCollisionUpdate[9437185], bTransformOnly;

    false
    true                
}

// Export UActor::execConsoleCommand(FFrame&, void* const)
native function ConsoleCommand()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWriteToLog[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    true                
}

// Export UActor::execSleep(FFrame&, void* const)
native(256) final latent function Sleep()
{
    local /*0x35EA0000-0x00000000*/ private float Seconds[8388609];


}

// Export UActor::execFinishAnim(FFrame&, void* const)
native(261) final latent function FinishAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFinishOnBlendOut[9437185];


}

// Export UActor::execSetCollision(FFrame&, void* const)
native(262) final function SetCollision()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewColActors[9437185], bNewBlockActors, bNewIgnoreEncroachers;


}

// Export UActor::execSetCollisionSize(FFrame&, void* const)
native(283) final function SetCollisionSize()
{
    local /*0x35EA0000-0x00000000*/ private float NewRadius[8388609], NewHeight;


}

// Export UActor::execSetCollisionType(FFrame&, void* const)
native final function SetCollisionType()
{
    local /*0x35EA0000-0x00000000*/ private byte NewCollisionType[8388609];


}

// Export UActor::execSetDrawScale(FFrame&, void* const)
native final function SetDrawScale()
{
    local /*0x35EA0000-0x00000000*/ private float NewScale[8388609];


}

// Export UActor::execSetDrawScale3D(FFrame&, void* const)
native final function SetDrawScale3D()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewScale3D[8388609];


}

// Export UActor::execMove(FFrame&, void* const)
native(266) final function Move()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Delta[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execSetLocation(FFrame&, void* const)
native(267) final function SetLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execSetRotation(FFrame&, void* const)
native function SetRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execMovingWhichWay(FFrame&, void* const)
native function MovingWhichWay()
{
    local /*0x35EA0000-0x00000000*/ private float Amount[25165825];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UActor::execSetZone(FFrame&, void* const)
native final function SetZone()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceRefresh[8388609];


}

// Export UActor::execSetRelativeRotation(FFrame&, void* const)
native final function SetRelativeRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execSetRelativeLocation(FFrame&, void* const)
native final function SetRelativeLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execSetHardAttach(FFrame&, void* const)
native final function SetHardAttach()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewHardAttach[9437185];


}

// Export UActor::execSetShadowParentOnAllAttachedComponents(FFrame&, void* const)
native simulated function @NULL SetShadowParentOnAllAttachedComponents()
{
    local /*0x35EA0000-0x00000400*/ private @NULL MyPrimComp[8388609], MyLightEnv;


}

// Export UActor::execfixedTurn(FFrame&, void* const)
native final function fixedTurn()
{
    local /*0x35EA0000-0x00000000*/ private int Current[8388609], Desired, DeltaRate, ReturnValue;


}

// Export UActor::execMoveSmooth(FFrame&, void* const)
native(3969) final function MoveSmooth()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Delta[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execAutonomousPhysics(FFrame&, void* const)
native(3971) final function AutonomousPhysics()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaSeconds[8388609];


}

// Export UActor::execGetTerminalVelocity(FFrame&, void* const)
native function GetTerminalVelocity()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UActor::execSetBase(FFrame&, void* const)
native(298) final function @NULL SetBase()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewBase[8388609], NewFloor, SkelComp;
    local /*0x35EA0000-0x00000000*/ private name AttachName[9437185];


}

// Export UActor::execSetOwner(FFrame&, void* const)
native(272) final function SetOwner()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewOwner[8388609];


}

// Export UActor::execFindBase(FFrame&, void* const)
native function FindBase();

// Export UActor::execSearchForBaseBelow(FFrame&, void* const)
native function SearchForBaseBelow()
{
    local /*0x35EA0000-0x00000000*/ private float HeightBelow[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewBase[25165825], HitNormal;


}

// Export UActor::execIsBasedOn(FFrame&, void* const)
native final function IsBasedOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execGetBaseMost(FFrame&, void* const)
native function GetBaseMost()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UActor::execIsOwnedBy(FFrame&, void* const)
native final function IsOwnedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execGetAggregateBaseVelocity(FFrame&, void* const)
native final function GetAggregateBaseVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestBase[9437185], ReturnValue;


}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x2A
    if(VarName == 'ReplicatedDestructProperty')
    {
        SetDestructibleProperties(ReplicatedDestructProperty);
    }
    //return;    
}

reliable client final simulated function MulticastDestructComponentDestruction()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];

    // End:0x40
    if(DestructComponent != none)
    {
        DestructComponent.ClientCauseDestruction(HitLocation, DamageType);
    }
    //return;    
}

// Export UActor::execSetDestructibleProperties(FFrame&, void* const)
native final simulated function SetDestructibleProperties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewProperty[8388609];


}

// Export UActor::execSPTakeDamageFractional(FFrame&, void* const)
native event SPTakeDamageFractional()
{
    local /*0x35EA0000-0x00000000*/ private float DamageAmount[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x35EA0000-0x00000000*/ private float TimeToStayActive[9437185];

    1.0000000                                        
}

// Export UActor::execSetForcedInitialReplicatedProperty(FFrame&, void* const)
native final function SetForcedInitialReplicatedProperty()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PropToReplicate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAdd[8388609];


}

// Export UActor::execVect2BP(FFrame&, void* const)
native static final function Vect2BP()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BP[25165825], pos, ForcedBase;


}

// Export UActor::execBP2Vect(FFrame&, void* const)
native static final function BP2Vect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BP[8388609], ReturnValue;


}

// Export UActor::execSetBasedPosition(FFrame&, void* const)
native static final function SetBasedPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BP[25165825], pos, ForcedBase;


}

// Export UActor::execGetBasedPosition(FFrame&, void* const)
native static final function GetBasedPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BP[8388609], ReturnValue;


}

// Export UActor::execFlushPersistentDebugLines(FFrame&, void* const)
native static final function FlushPersistentDebugLines();

// Export UActor::execDrawDebugLine(FFrame&, void* const)
native static final function DrawDebugLine()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LineStart[8388609], LineEnd;
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B;
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugPoint(FFrame&, void* const)
native static final function DrawDebugPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Position[8388609];
    local /*0x35EA0000-0x00000000*/ private float Size[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PointColor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugBox(FFrame&, void* const)
native static final function DrawDebugBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Center[8388609], Extent;
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B;
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugStar(FFrame&, void* const)
native static final function DrawDebugStar()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Position[8388609];
    local /*0x35EA0000-0x00000000*/ private float Size[8388609];
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B;
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugCoordinateSystem(FFrame&, void* const)
native static final function DrawDebugCoordinateSystem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AxisLoc[8388609], AxisRot;
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugSphere(FFrame&, void* const)
native static final function DrawDebugSphere()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Center[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private int Segments[8388609];
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B;
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugCylinder(FFrame&, void* const)
native static final function DrawDebugCylinder()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Start[8388609], End;
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private int Segments[8388609];
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B;
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugCone(FFrame&, void* const)
native static final function DrawDebugCone()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609], Direction;
    local /*0x35EA0000-0x00000000*/ private float Length[8388609], AngleWidth, AngleHeight;
    local /*0x35EA0000-0x00000000*/ private int NumSides[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DrawColor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execDrawDebugString(FFrame&, void* const)
native static final function DrawDebugString()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TextLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[142606337];
    local /*0x35EA0000-0x00000000*/ private @NULL TestBaseActor[9437185], TextColor;
    local /*0x35EA0000-0x00000000*/ private float Duration[9437185];

    -1.0000000                            
}

// Export UActor::execDrawDebugFrustrum(FFrame&, void* const)
native static final function DrawDebugFrustrum()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FrustumToWorld[25296897];
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B;
    local /*0x35EA0000-0x00000000*/ private bool bPersistentLines[9437185];


}

// Export UActor::execFlushDebugStrings(FFrame&, void* const)
native static final exec function FlushDebugStrings();

// Export UActor::execChartData(FFrame&, void* const)
native final function ChartData()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DataName[8388609];
    local /*0x35EA0000-0x00000000*/ private float DataValue[8388609];


}

// Export UActor::execSetHidden(FFrame&, void* const)
native final function SetHidden()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewHidden[8388609];


}

// Export UActor::execSetOnlyOwnerSee(FFrame&, void* const)
native final function SetOnlyOwnerSee()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewOnlyOwnerSee[8388609];


}

// Export UActor::execSetPhysics(FFrame&, void* const)
native(3970) final function SetPhysics()
{
    local /*0x35EA0000-0x00000000*/ private byte newPhysics[8388609];


}

// Export UActor::execClock(FFrame&, void* const)
native final function Clock()
{
    local /*0x35EA0000-0x00000000*/ private float Time[25165825];


}

// Export UActor::execUnClock(FFrame&, void* const)
native final function UnClock()
{
    local /*0x35EA0000-0x00000000*/ private float Time[25165825];


}

// Export UActor::execAttachComponent(FFrame&, void* const)
native final function @NULL AttachComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL NewComponent[8388609];


}

// Export UActor::execDetachComponent(FFrame&, void* const)
native final function @NULL DetachComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ExComponent[8388609];


}

// Export UActor::execReattachComponent(FFrame&, void* const)
native final function @NULL ReattachComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ComponentToReattach[8388609];


}

// Export UActor::execSetTickGroup(FFrame&, void* const)
native final function SetTickGroup()
{
    local /*0x35EA0000-0x00000000*/ private byte NewTickGroup[8388609];


}

// Export UActor::execSetTickIsDisabled(FFrame&, void* const)
native final function SetTickIsDisabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bInDisabled[8388609];


}

event Destroyed()
{
    //return;    
}

event GainedChild()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event LostChild()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event Tick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

event Timer()
{
    //return;    
}

event @NULL HitWall()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    TriggerEventClass(Class'SeqEvent_HitWall', Wall);
    //return;    
}

event Falling()
{
    //return;    
}

event Landed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    // End:0x40
    if(DestructComponent != none)
    {
        DestructComponent.NotifyLanded(HitNormal, FloorActor);
    }
    //return;    
}

event PhysicsVolumeChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewVolume[8388609];

    //return;    
}

event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

event PostTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event UnTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event @NULL Bump()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    //return;    
}

event BaseChange()
{
    //return;    
}

event Attach()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event Detach()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event SpecialHandling()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], ReturnValue;

    //return ReturnValue;    
}

event CollisionChanged()
{
    //return;    
}

event EncroachingOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event EncroachedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event RanInto()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event OnWakeRBPhysics()
{
    //return;    
}

event OnSleepRBPhysics()
{
    //return;    
}

// Export UActor::execClampRotation(FFrame&, void* const)
native final simulated function ClampRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Rot[25165825], rBase, rUpperLimits, rLowerLimits;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event OverRotated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Desired[25165825], out_Actual;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UsedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL User[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return TriggerEventClass(Class'SeqEvent_Used', User, -1);
    //return ReturnValue;    
}

simulated event FellOutOfWorld()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];

    SetPhysics(0);
    SetHidden(true);
    SetCollision(false, false);
    Destroy();
    //return;    
}

simulated event OutsideWorldBounds()
{
    Destroy();
    //return;    
}

simulated function VolumeBasedDestroy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PV[8388609];

    Destroy();
    //return;    
}

// Export UActor::execTrace(FFrame&, void* const)
native(277) final function Trace()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[25165825], HitNormal, TraceEnd, TraceStart;
    local /*0x35EA0000-0x00000000*/ private bool bTraceActors[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[9437185], HitInfo;
    local /*0x35EA0000-0x00000000*/ private int ExtraTraceFlags[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UActor::execTraceComponent(FFrame&, void* const)
native final function @NULL TraceComponent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[25165825], HitNormal, InComponent, TraceEnd, TraceStart, Extent,
	    HitInfo;

    local /*0x35EA0000-0x00000000*/ private bool bComplexCollision[9437185], ReturnValue;


}

// Export UActor::execPointCheckComponent(FFrame&, void* const)
native final function @NULL PointCheckComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL InComponent[8388609], PointLocation, PointExtent;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execFastTrace(FFrame&, void* const)
native(548) final function FastTrace()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TraceEnd[8388609], TraceStart, BoxExtent;
    local /*0x35EA0000-0x00000000*/ private bool bTraceBullet[9437185], ReturnValue;


}

// Export UActor::execTraceAllPhysicsAssetInteractions(FFrame&, void* const)
native final function @NULL TraceAllPhysicsAssetInteractions()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMeshComp[8388609], EndTrace, StartTrace;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Hits[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execFindSpot(FFrame&, void* const)
native final function FindSpot()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BoxExtent[8388609], SpotLocation;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execContainsPoint(FFrame&, void* const)
native final function ContainsPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Spot[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execIsOverlapping(FFrame&, void* const)
native final function IsOverlapping()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execGetComponentsBoundingBox(FFrame&, void* const)
native final function GetComponentsBoundingBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ActorBox[25165825];


}

// Export UActor::execGetBoundingCylinder(FFrame&, void* const)
native function GetBoundingCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float CollisionRadius[25165825], CollisionHeight;


}

// Export UActor::execIsBlockedBy(FFrame&, void* const)
native final function IsBlockedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

delegate OnSpawnPreBeginPlayCallback()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnedActor[8388609];

    //return;    
}

// Export UActor::execSpawn(FFrame&, void* const)
native final function Spawn()
{
    local /*0x35EA0000-0x00000000*/ private class SpawnClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnOwner[9437185];
    local /*0x35EA0000-0x00000000*/ private name SpawnTag[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnLocation[9437185], SpawnRotation, ActorTemplate;
    local /*0x35EA0000-0x00000000*/ private bool bNoCollisionFail[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> PreBeginPlayCallback[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[226492417];


}

simulated event ReceivedNewOwner()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldOwner[8388609];

    //return;    
}

simulated event InitTuneData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TuneData[8388609];

    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

// Export UActor::execAddToActorFactorySpawnedList(FFrame&, void* const)
native final simulated function AddToActorFactorySpawnedList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[8388609];


}

// Export UActor::execDestroy(FFrame&, void* const)
native(279) final function Destroy()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event TornOff()
{
    //return;    
}

// Export UActor::execSetTimer(FFrame&, void* const)
native(280) final function SetTimer()
{
    local /*0x35EA0000-0x00000000*/ private float InRate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool inbLoop[9437185];
    local /*0x35EA0000-0x00000000*/ private name inTimerFunc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];

    'Timer'                            
}

// Export UActor::execClearTimer(FFrame&, void* const)
native final function ClearTimer()
{
    local /*0x35EA0000-0x00000000*/ private name inTimerFunc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];

    'Timer'                    
}

// Export UActor::execClearAllTimers(FFrame&, void* const)
native final function ClearAllTimers()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];


}

// Export UActor::execPauseTimer(FFrame&, void* const)
native final function PauseTimer()
{
    local /*0x35EA0000-0x00000000*/ private bool bPause[8388609];
    local /*0x35EA0000-0x00000000*/ private name inTimerFunc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];

    'Timer'                        
}

// Export UActor::execIsTimerActive(FFrame&, void* const)
native final function IsTimerActive()
{
    local /*0x35EA0000-0x00000000*/ private name inTimerFunc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    'Timer'                    
}

// Export UActor::execGetTimerCount(FFrame&, void* const)
native final function GetTimerCount()
{
    local /*0x35EA0000-0x00000000*/ private name inTimerFunc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    'Timer'                    
}

// Export UActor::execGetTimerRate(FFrame&, void* const)
native final function GetTimerRate()
{
    local /*0x35EA0000-0x00000000*/ private name TimerFuncName[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    'Timer'                    
}

final simulated function GetRemainingTimeForTimer()
{
    local /*0x35EA0000-0x00000000*/ private name TimerFuncName[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689], Count, Rate;

    'Timer'    
    Rate = GetTimerRate(TimerFuncName, inObj);
    // End:0x82
    if(Rate != -1.0000000)
    {
        Count = GetTimerCount(TimerFuncName, inObj);
        return Rate - Count;
    }
    return -1.0000000;
    //return ReturnValue;    
}

// Export UActor::execModifyTimerTimeDilation(FFrame&, void* const)
native final function ModifyTimerTimeDilation()
{
    local /*0x35EA0000-0x00000000*/ private name TimerName[8519681];
    local /*0x35EA0000-0x00000000*/ private float InTimerTimeDilation[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];


}

// Export UActor::execResetTimerTimeDilation(FFrame&, void* const)
native final function ResetTimerTimeDilation()
{
    local /*0x35EA0000-0x00000000*/ private name TimerName[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL inObj[9437185];


}

// Export UActor::execCreateAudioComponent(FFrame&, void* const)
native final function @NULL CreateAudioComponent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InSoundCue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bPlay[9437185], bStopWhenOwnerDestroyed, bUseLocation;
    local /*0x35EA0000-0x00000000*/ private @NULL SourceLocation[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bAttachToSelf[9437185];
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    true                                
}

// Export UActor::execPlaySound(FFrame&, void* const)
native final function PlaySound()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InSoundCue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNotReplicated[9437185], bNoRepToOwner, bStopWhenOwnerDestroyed;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundLocation[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bNoRepToRelevant[9437185];


}

// Export UActor::execPlayAkEvent(FFrame&, void* const)
native final function PlayAkEvent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InSoundCue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNotReplicated[9437185], bNoRepToOwner, bStopWhenOwnerDestroyed;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundLocation[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bNoRepToRelevant[9437185];


}

// Export UActor::execPlaySoundBase(FFrame&, void* const)
native final function PlaySoundBase()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InSoundCue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNotReplicated[9437185], bNoRepToOwner, bStopWhenOwnerDestroyed;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundLocation[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bNoRepToRelevant[9437185];


}

// Export UActor::execPostAkEvent(FFrame&, void* const)
native final function PostAkEvent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InAkEvent[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNoTarget[9437185];


}

// Export UActor::execPostAkEventAtLoc(FFrame&, void* const)
native final function PostAkEventAtLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InAkEvent[8388609], SourceLocation;
    local /*0x35EA0000-0x00000000*/ private bool bStopWhenOwnerDestroyed[8388609];


}

// Export UActor::execSetRTPCValue(FFrame&, void* const)
native final function SetRTPCValue()
{
    local /*0x35EA0000-0x00000000*/ private name InRTPC[8388609];
    local /*0x35EA0000-0x00000000*/ private float targetvalue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNoTarget[9437185];


}

// Export UActor::execSetState(FFrame&, void* const)
native final function SetState()
{
    local /*0x35EA0000-0x00000000*/ private name InStateGroup[8388609], InState;


}

// Export UActor::execSetSwitch(FFrame&, void* const)
native final function SetSwitch()
{
    local /*0x35EA0000-0x00000000*/ private name InSwitchGroup[8388609], InSwitch;
    local /*0x35EA0000-0x00000000*/ private bool bNoTarget[9437185];


}

// Export UActor::execPostTrigger(FFrame&, void* const)
native final function PostTrigger()
{
    local /*0x35EA0000-0x00000000*/ private name InTrigger[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNoTarget[9437185];


}

// Export UActor::execActivateOcclusion(FFrame&, void* const)
native final function ActivateOcclusion()
{
    local /*0x35EA0000-0x00000000*/ private bool bInActivate[8388609];


}

// Export UActor::execMakeNoise(FFrame&, void* const)
native(512) final function MakeNoise()
{
    local /*0x35EA0000-0x00000000*/ private float Loudness[8388609];
    local /*0x35EA0000-0x00000000*/ private name NoiseType[9437185];


}

// Export UActor::execPlayerCanSeeMe(FFrame&, void* const)
native(532) final function PlayerCanSeeMe()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceLOSCheck[9437185], ReturnValue;


}

// Export UActor::execSuggestTossVelocity(FFrame&, void* const)
native final function SuggestTossVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TossVelocity[25165825], Destination, Start;
    local /*0x35EA0000-0x00000000*/ private float TossSpeed[8388609], BaseTossZ, DesiredZPct;
    local /*0x35EA0000-0x00000000*/ private @NULL CollisionSize[9437185];
    local /*0x35EA0000-0x00000000*/ private float TerminalVelocity[9437185], OverrideGravityZ;
    local /*0x35EA0000-0x00000000*/ private bool bOnlyTraceUp[9437185], ReturnValue;


}

// Export UActor::execCalculateMinSpeedTrajectory(FFrame&, void* const)
native final function CalculateMinSpeedTrajectory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Velocity[25165825], End, Start;
    local /*0x35EA0000-0x00000000*/ private float MaxTossSpeed[8388609], MinTossSpeed;
    local /*0x35EA0000-0x00000000*/ private @NULL CollisionSize[9437185];
    local /*0x35EA0000-0x00000000*/ private float TerminalVelocity[9437185], GravityZ;
    local /*0x35EA0000-0x00000000*/ private bool bOnlyTraceUp[9437185], ReturnValue;

    GetGravityZ();                                                
}

// Export UActor::execGetDestination(FFrame&, void* const)
native final function GetDestination()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609], ReturnValue;


}

function PreTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InTeleporter[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function PostTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutTeleporter[8388609];

    //return;    
}

// Export UActor::execGetURLMap(FFrame&, void* const)
native(547) final function GetURLMap()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UActor::execAllActors(FFrame&, void* const)
native(304) final iterator function AllActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];
    local /*0x35EA0000-0x00000000*/ private class InterfaceClass[9437185];


}

// Export UActor::execDynamicActors(FFrame&, void* const)
native(313) final iterator function DynamicActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];
    local /*0x35EA0000-0x00000000*/ private class InterfaceClass[9437185];


}

// Export UActor::execChildActors(FFrame&, void* const)
native(305) final iterator function ChildActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];


}

// Export UActor::execBasedActors(FFrame&, void* const)
native(306) final iterator function BasedActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];


}

// Export UActor::execTouchingActors(FFrame&, void* const)
native(307) final iterator function TouchingActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];


}

// Export UActor::execTraceActors(FFrame&, void* const)
native(309) final iterator function TraceActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825], HitLoc, HitNorm, End, Start, Extent,
	    HitInfo;

    local /*0x35EA0000-0x00000000*/ private int ExtraTraceFlags[9437185];


}

// Export UActor::execVisibleActors(FFrame&, void* const)
native(311) final iterator function VisibleActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];
    local /*0x35EA0000-0x00000000*/ private float Radius[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc[9437185];


}

// Export UActor::execVisibleCollidingActors(FFrame&, void* const)
native(312) final iterator function VisibleCollidingActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreHidden[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bTraceActors[9437185];
    local /*0x35EA0000-0x00000000*/ private class InterfaceClass[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[26214401];


}

// Export UActor::execCollidingActors(FFrame&, void* const)
native(321) final iterator function CollidingActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Actor[25165825];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bUseOverlapCheck[9437185];
    local /*0x35EA0000-0x00000000*/ private class InterfaceClass[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[26214401];


}

// Export UActor::execOverlappingActors(FFrame&, void* const)
native final iterator function OverlappingActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_Actor[25165825];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreHidden[9437185];


}

// Export UActor::execComponentList(FFrame&, void* const)
native final iterator function @NULL ComponentList()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL out_Component[25165825];


}

// Export UActor::execAllOwnedComponents(FFrame&, void* const)
native final iterator function @NULL AllOwnedComponents()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL OutComponent[25165825];


}

// Export UActor::execLocalPlayerControllers(FFrame&, void* const)
native final iterator function LocalPlayerControllers()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PC[25165825];


}

// Export UActor::execGetALocalPlayerController(FFrame&, void* const)
native final function GetALocalPlayerController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UActor::execGetComponentsOfClass(FFrame&, void* const)
native final function array GetComponentsOfClass()
{
    local /*0x35EA0000-0x00000000*/ private class ComponentClass[8388609];
    local /*0x35EA0000-0x00000400*/ private editfixedsize array outComponents[25165825];


}

// Export UActor::execCanPlaySounds(FFrame&, void* const)
native simulated function CanPlaySounds()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PreBeginPlay()
{
    // End:0xA4
    if(((!bGameRelevant && !bStatic) && int(WorldInfo.NetMode) != int(NM_Client)) && !WorldInfo.Game.CheckRelevance(self))
    {
        // End:0xA1
        if(bNoDelete)
        {
            ShutDown();            
        }
        else
        {
            Destroy();
        }
    }
    //return;    
}

event PostOverride()
{
    //return;    
}

event BroadcastLocalizedMessage()
{
    local /*0x35EA0000-0x00000000*/ private class InMessageClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;

    WorldInfo.Game.BroadcastLocalized(self, InMessageClass, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

event BroadcastLocalizedTeamMessage()
{
    local /*0x35EA0000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private class InMessageClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;

    WorldInfo.Game.BroadcastLocalizedTeam(TeamIndex, self, InMessageClass, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

event PostBeginPlay()
{
    // End:0x77
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x77
        if((DestructComponent != none) && int(Role) == int(ROLE_Authority))
        {
            SetDestructibleProperties(DestructComponent.GetProperties());
        }
    }
    //return;    
}

simulated event SetInitialState()
{
    bScriptInitialized = true;
    // End:0x34
    if(InitialState != 'None')
    {
        GotoState(InitialState);        
    }
    else
    {
        GotoState('Auto');
    }
    //return;    
}

simulated event ConstraintBrokenNotify()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ConOwner[8388609], ConSetup, ConInstance;

    //return;    
}

simulated event NotifySkelControlBeyondLimit()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LookAt[8388609];

    //return;    
}

simulated function StopsProjectile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bProjTarget || bBlockActors;
    //return ReturnValue;    
}

simulated function @NULL HurtRadius()
{
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609], IgnoredActor, InstigatedByController;
    local /*0x35EA0000-0x00000000*/ private bool bDoFullDamage[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Victim;
    local /*0x35EA0000-0x00000000*/ private bool bCausedDamage;
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo, HitComponent, NewKActor;

    ((Instigator != none) ? Instigator.Controller : none);    
    // End:0x45
    if(bHurtEntry)
    {
        return false;
    }
    bHurtEntry = true;
    bCausedDamage = false;
    // End:0x29D
    foreach VisibleCollidingActors(Class'Actor', Victim, DamageRadius, HurtOrigin,,,,, HitInfo)
    {
        // End:0x16C
        if(Victim.bWorldGeometry)
        {
            HitComponent = StaticMeshComponent(HitInfo.HitComponent);
            // End:0x16C
            if((HitComponent != none) && HitComponent.CanBecomeDynamic())
            {
                NewKActor = Class'KActorFromStatic'.static.MakeDynamic(HitComponent);
                // End:0x16C
                if(NewKActor != none)
                {
                    Victim = NewKActor;
                }
            }
        }
        // End:0x29C
        if(((!Victim.bWorldGeometry && Victim != self) && Victim != IgnoredActor) && Victim.bCanBeDamaged || Victim.bProjTarget)
        {
            Victim.TakeRadiusDamage(InstigatedByController, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bDoFullDamage, self);
            bCausedDamage = bCausedDamage || Victim.bProjTarget;
        }        
    }    
    bHurtEntry = false;
    return bCausedDamage;
    //return ReturnValue;    
}

function KilledBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609];

    //return;    
}

event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL dmgEvent;

    Idx = 0;
    J0x0D:

    // End:0xA3 [Loop If]
    if(Idx < GeneratedEvents.Length)
    {
        dmgEvent = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        // End:0x95
        if(dmgEvent != none)
        {
            dmgEvent.HandleDamage(self, EventInstigator, DamageType, DamageAmount);
        }
        Idx++;
        // [Loop Continue]
        goto J0x0D;
    }
    NotifyDestructComponentOfDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

function NotifyDestructComponentOfDamage()
{
    local /*0x35EA0000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x71
    if(DestructComponent != none)
    {
        DestructComponent.NotifyDamage(float(DamageAmount), EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

event HealDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Amount[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function TakeRadiusDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185], ColRadius, ColHeight, DamageScale, Dist, ScaledDamage;

    local /*0x35EA0000-0x00000000*/ private @NULL Dir;

    1.0000000
    GetBoundingCylinder(ColRadius, ColHeight);
    Dir = Location - HurtOrigin;
    Dist = VSize(Dir);
    Dir = Normal(Dir);
    // End:0x8C
    if(bFullDamage)
    {
        DamageScale = 1.0000000;        
    }
    else
    {
        Dist = FMax(Dist - ColRadius, 0.0000000);
        DamageScale = FClamp(1.0000000 - (Dist / DamageRadius), 0.0000000, 1.0000000);
        DamageScale = DamageScale ** DamageFalloffExponent;
    }
    // End:0x1B2
    if(DamageScale > 0.0000000)
    {
        ScaledDamage = DamageScale * BaseDamage;
        TakeDamage(int(ScaledDamage), InstigatedBy, Location - ((0.5000000 * (ColHeight + ColRadius)) * Dir), (DamageScale * Momentum) * Dir, DamageType,, DamageCauser);
    }
    //return;    
}

final simulated function @NULL CheckHitInfo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[25165825], FallBackComponent, Dir, out_HitLocation, out_NewHitLocation, out_HitNormal,
	    TraceEnd, TraceStart, newHitInfo;

    // End:0x59
    if((SkeletalMeshComponent(HitInfo.HitComponent) != none) && HitInfo.BoneName != 'None')
    {
        return;
    }
    // End:0xE8
    if((HitInfo.HitComponent == none) || (SkeletalMeshComponent(HitInfo.HitComponent) == none) && SkeletalMeshComponent(FallBackComponent) != none)
    {
        HitInfo.HitComponent = FallBackComponent;
    }
    // End:0x2BA
    if((SkeletalMeshComponent(HitInfo.HitComponent) != none) && HitInfo.BoneName == 'None')
    {
        // End:0x163
        if(IsZero(Dir))
        {
            Dir = Vector(Rotation);
        }
        // End:0x185
        if(IsZero(out_HitLocation))
        {
            out_HitLocation = Location;
        }
        TraceStart = out_HitLocation - (float(128) * Normal(Dir));
        TraceEnd = out_HitLocation + (float(128) * Normal(Dir));
        // End:0x2BA
        if(TraceComponent(out_NewHitLocation, out_HitNormal, HitInfo.HitComponent, TraceEnd, TraceStart, vect(0.0000000, 0.0000000, 0.0000000), newHitInfo))
        {
            HitInfo.BoneName = newHitInfo.BoneName;
            HitInfo.PhysMaterial = newHitInfo.PhysMaterial;
            out_HitLocation = out_NewHitLocation;
        }
    }
    //return;    
}

// Export UActor::execGetGravityZ(FFrame&, void* const)
native function GetGravityZ()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

event DebugFreezeGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ActorToLookAt[9437185];

    //return;    
}

function CheckForErrors()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event BecomeViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    //return;    
}

event EndViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    //return;    
}

simulated function CalcCamera()
{
    local /*0x35EA0000-0x00000000*/ private float fDeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_CamLoc[25165825], out_CamRot;
    local /*0x35EA0000-0x00000000*/ private float out_FOV[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal;
    local /*0x35EA0000-0x00000000*/ private float Radius, Height;

    GetBoundingCylinder(Radius, Height);
    // End:0x9F
    if(Trace(out_CamLoc, HitNormal, Location - ((Vector(out_CamRot) * Radius) * float(20)), Location, false) == none)
    {
        out_CamLoc = Location - ((Vector(out_CamRot) * Radius) * float(20));        
    }
    else
    {
        out_CamLoc = Location + (Height * Vector(Rotation));
    }
    return false;
    //return ReturnValue;    
}

simulated function GetItemName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FullName[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private int pos;

    pos = InStr(FullName, ".");
    J0x1B:

    // End:0x7A [Loop If]
    if(pos != -1)
    {
        FullName = Right(FullName, (Len(FullName) - pos) - 1);
        pos = InStr(FullName, ".");
        // [Loop Continue]
        goto J0x1B;
    }
    return FullName;
    //return ReturnValue;    
}

simulated function GetHumanReadableName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return GetItemName(string(Class));
    //return ReturnValue;    
}

static function ReplaceText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[25165825], Replace, With;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Input;

    Input = Text;
    Text = "";
    I = InStr(Input, Replace);
    J0x40:

    // End:0xD7 [Loop If]
    if(I != -1)
    {
        Text = (Text $ Left(Input, I)) $ With;
        Input = Mid(Input, I + Len(Replace));
        I = InStr(Input, Replace);
        // [Loop Continue]
        goto J0x40;
    }
    Text = Text $ Input;
    //return;    
}

static function GetLocalString()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "";
    //return ReturnValue;    
}

function MatchStarting()
{
    //return;    
}

function GetDebugName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return GetItemName(string(self));
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string T;
    local /*0x35EA0000-0x00000000*/ private @NULL A;
    local /*0x35EA0000-0x00000000*/ private float MyRadius, MyHeight;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    Canvas.SetPos(4.0000000, out_YPos);
    Canvas.SetDrawColor(255, 0, 0);
    T = GetDebugName();
    // End:0xD0
    if(bDeleteMe)
    {
        T = T $ " DELETED (bDeleteMe == true)";
    }
    // End:0x14E
    if(T != "")
    {
        Canvas.DrawText(T, false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    Canvas.SetDrawColor(255, 255, 255);
    // End:0x2CA
    if(HUD.ShouldDisplayDebug('net'))
    {
        // End:0x2CA
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            T = (((("ROLE:" @ string(Role)) @ "RemoteRole:") @ string(RemoteRole)) @ "NetMode:") @ string(WorldInfo.NetMode);
            // End:0x25C
            if(bTearOff)
            {
                T = T @ "Tear Off";
            }
            Canvas.DrawText(T, false);
            out_YPos += out_YL;
            Canvas.SetPos(4.0000000, out_YPos);
        }
    }
    Canvas.DrawText((("Location:" @ string(Location)) @ "Rotation:") @ string(Rotation), false);
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    // End:0x6D6
    if(HUD.ShouldDisplayDebug('Physics'))
    {
        T = (((((("Physics" @ (GetPhysicsName())) @ "in physicsvolume") @ (GetItemName(string(PhysicsVolume)))) @ "on base") @ (GetItemName(string(Base)))) @ "gravity") @ string(GetGravityZ());
        // End:0x443
        if(bBounce)
        {
            T = T $ " - will bounce";
        }
        Canvas.DrawText(T, false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText((((((((("bHardAttach:" @ string(bHardAttach)) @ "RelativeLoc:") @ string(RelativeLocation)) @ "RelativeRot:") @ string(RelativeRotation)) @ "SkelComp:") @ string(BaseSkelComponent)) @ "Bone:") @ string(BaseBoneName), false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText((((("Velocity:" @ string(Velocity)) @ "Speed:") @ string(VSize(Velocity))) @ "Speed2D:") @ string(VSize2D(Velocity)), false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText("Acceleration:" @ string(Acceleration), false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    // End:0xA34
    if(HUD.ShouldDisplayDebug('Collision'))
    {
        Canvas.DrawColor.B = 0;
        GetBoundingCylinder(MyRadius, MyHeight);
        Canvas.DrawText((("Collision Radius:" @ string(MyRadius)) @ "Height:") @ string(MyHeight));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText((((("Collides with Actors:" @ string(bCollideActors)) @ " world:") @ string(bCollideWorld)) @ "proj. target:") @ string(bProjTarget));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText("Blocks Actors:" @ string(bBlockActors));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        T = "Touching ";
        // End:0x990
        foreach TouchingActors(Class'Actor', A)
        {
            T = (T $ (GetItemName(string(A)))) $ " ";            
        }        
        // End:0x9C6
        if(T == "Touching ")
        {
            T = "Touching nothing";
        }
        Canvas.DrawText(T, false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    Canvas.DrawColor.B = 255;
    Canvas.DrawText(" STATE:" @ string(GetStateName()), false);
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText(((" Instigator:" @ (GetItemName(string(Instigator)))) @ "Owner:") @ (GetItemName(string(Owner))));
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    //return;    
}

simulated function GetPhysicsName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    switch(Physics)
    {
        // End:0x22
        case 0:
            return "None";
            // End:0x105
            break;
        // End:0x34
        case 1:
            return "Walking";
            // End:0x105
            break;
        // End:0x46
        case 2:
            return "Falling";
            // End:0x105
            break;
        // End:0x59
        case 3:
            return "Swimming";
            // End:0x105
            break;
        // End:0x6A
        case 4:
            return "Flying";
            // End:0x105
            break;
        // End:0x7D
        case 5:
            return "Rotating";
            // End:0x105
            break;
        // End:0x92
        case 6:
            return "Projectile";
            // End:0x105
            break;
        // End:0xAA
        case 7:
            return "Interpolating";
            // End:0x105
            break;
        // End:0xBB
        case 8:
            return "Spider";
            // End:0x105
            break;
        // End:0xCC
        case 9:
            return "Ladder";
            // End:0x105
            break;
        // End:0xE0
        case 10:
            return "RigidBody";
            // End:0x105
            break;
        // End:0xF1
        case 13:
            return "Unused";
            // End:0x105
            break;
        // End:0x102
        case 14:
            return "Custom";
            // End:0x105
            break;
        // End:0xFFFF
        default:
            break;
    }
    return "Unknown";
    //return ReturnValue;    
}

simulated event @NULL ModifyHearSoundComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL AC[8388609];

    //return;    
}

simulated event @NULL GetFaceFXAudioComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

event Reset()
{
    //return;    
}

function IsInPain()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL V;

    // End:0x66
    foreach TouchingActors(Class'PhysicsVolume', V)
    {
        // End:0x65
        if(V.bPainCausing && V.DamagePerSec > float(0))
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function PlayTeleportEffect()
{
    local /*0x35EA0000-0x00000000*/ private bool bOut[8388609], bSound;

    //return;    
}

simulated function CanSplash()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ApplyFluidSurfaceImpact()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Fluid[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private float Radius, Height, AdjustedVelocity;

    // End:0xE4
    if(bAllowFluidSurfaceInteraction)
    {
        AdjustedVelocity = 0.0100000 * Abs(Velocity.Z);
        GetBoundingCylinder(Radius, Height);
        Fluid.FluidComponent.ApplyForce(HitLocation, AdjustedVelocity * Fluid.FluidComponent.ForceImpact, Radius * 0.3000000, true);
    }
    //return;    
}

simulated function EffectIsRelevant()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceDedicated[8388609];
    local /*0x35EA0000-0x00000000*/ private float VisibleCullDistance[9437185], HiddenCullDistance;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    5000.0000000
    350.0000000
    // End:0x5C
    if(SpawnLocation == Location)
    {
        return ActorEffectIsRelevant(Instigator, bForceDedicated, VisibleCullDistance, HiddenCullDistance);        
    }
    else
    {
        return ImpactEffectIsRelevant(Instigator, SpawnLocation, bForceDedicated, VisibleCullDistance, HiddenCullDistance);
    }
    //return ReturnValue;    
}

simulated function ActorEffectIsRelevant()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EffectInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceDedicated[8388609];
    local /*0x35EA0000-0x00000000*/ private float VisibleCullDistance[9437185], HiddenCullDistance;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL P;
    local /*0x35EA0000-0x00000000*/ private float DistSq;
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot;

    5000.0000000
    350.0000000
    // End:0x98
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        // End:0x8D
        if(bDebugEffectIsRelevant && bForceDedicated)
        {
            DebugMessagePlayer("EffectIsRelevant FAILED - dedicated server");
        }
        return bForceDedicated;
    }
    // End:0x10D
    if((bForceDedicated && int(WorldInfo.NetMode) == int(NM_ListenServer)) && WorldInfo.Game.NumPlayers > 1)
    {
        return true;
    }
    // End:0x167
    if(((EffectInstigator != none) && EffectInstigator.IsHumanControlled()) && EffectInstigator.IsLocallyControlled())
    {
        return true;
    }
    DistSq = 10000000000.0000000;
    // End:0x23C
    foreach LocalPlayerControllers(Class'PlayerController', P)
    {
        // End:0x1BD
        if(P.GetViewTarget() == self)
        {            
            return true;
        }
        P.GetPlayerViewPoint(CameraLoc, CameraRot);
        DistSq = FMin(DistSq, VSizeSq(Location - CameraLoc) * Square(P.LODDistanceFactor));        
    }    
    // End:0x2B0
    if(DistSq > (VisibleCullDistance * VisibleCullDistance))
    {
        // End:0x2AB
        if(bDebugEffectIsRelevant && true)
        {
            DebugMessagePlayer("EffectIsRelevant FAILED - VisibleCullDistance");
        }
        return false;        
    }
    else
    {
        // End:0x2D4
        if(DistSq < (HiddenCullDistance * HiddenCullDistance))
        {
            return true;
        }
    }
    return (WorldInfo.TimeSeconds - LastRenderTime) < 0.3000000;
    //return ReturnValue;    
}

simulated function ImpactEffectIsRelevant()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EffectInstigator[8388609], SpawnLocation;
    local /*0x35EA0000-0x00000000*/ private bool bForceDedicated[8388609];
    local /*0x35EA0000-0x00000000*/ private float VisibleCullDistance[9437185], HiddenCullDistance;
    local /*0x35EA0000-0x00000000*/ private bool bSkipLOSCheck[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL P;
    local /*0x35EA0000-0x00000000*/ private float DistSq, InViewThreshold;
    local /*0x35EA0000-0x00000000*/ private bool bIsInViewFrustrum;
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot;

    5000.0000000
    350.0000000    
    // End:0x99
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        // End:0x8E
        if(bDebugEffectIsRelevant && bForceDedicated)
        {
            DebugMessagePlayer("EffectIsRelevant FAILED - dedicated server");
        }
        return bForceDedicated;
    }
    // End:0x10E
    if((bForceDedicated && int(WorldInfo.NetMode) == int(NM_ListenServer)) && WorldInfo.Game.NumPlayers > 1)
    {
        return true;
    }
    // End:0x168
    if(((EffectInstigator != none) && EffectInstigator.IsHumanControlled()) && EffectInstigator.IsLocallyControlled())
    {
        return true;
    }
    DistSq = 10000000000.0000000;
    // End:0x215
    foreach LocalPlayerControllers(Class'PlayerController', P)
    {
        P.GetPlayerViewPoint(CameraLoc, CameraRot);
        DistSq = FMin(DistSq, VSizeSq(SpawnLocation - CameraLoc) * Square(P.LODDistanceFactor));        
    }    
    // End:0x289
    if(DistSq > (VisibleCullDistance * VisibleCullDistance))
    {
        // End:0x284
        if(bDebugEffectIsRelevant && true)
        {
            DebugMessagePlayer("EffectIsRelevant FAILED - VisibleCullDistance");
        }
        return false;        
    }
    else
    {
        // End:0x2AD
        if(DistSq < (HiddenCullDistance * HiddenCullDistance))
        {
            return true;
        }
    }
    bIsInViewFrustrum = false;
    // End:0x3A5
    foreach LocalPlayerControllers(Class'PlayerController', P)
    {
        P.GetPlayerViewPoint(CameraLoc, CameraRot);
        InViewThreshold = Cos(P.GetFOVAngle()) - 0.1000000;
        // End:0x3A4
        if((Normal(SpawnLocation - CameraLoc) Dot Vector(CameraRot)) > InViewThreshold)
        {
            // End:0x3A4
            if(bSkipLOSCheck || FastTrace(SpawnLocation, CameraLoc))
            {
                bIsInViewFrustrum = true;
                // End:0x3A5
                break;
            }
        }        
    }    
    // End:0x3FD
    if(bDebugEffectIsRelevant && bIsInViewFrustrum)
    {
        DebugMessagePlayer("EffectIsRelevant FAILED - Outside View Frustrum");
    }
    return bIsInViewFrustrum;
    //return ReturnValue;    
}

final event DebugMessagePlayer()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];

    //return;    
}

simulated function TriggerEventClass()
{
    local /*0x35EA0000-0x00000000*/ private class InEventClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private int ActivateIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bTest[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivatedEvents[26214401];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;

    -1        
    // End:0x2F
    if(ActivateIndex >= 0)
    {
        ActivateIndices[0] = ActivateIndex;
    }
    return ActivateEventClass(InEventClass, InInstigator, GeneratedEvents, ActivateIndices, bTest, ActivatedEvents);
    //return ReturnValue;    
}

simulated event ReceivedNewEvent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Evt[8388609];

    //return;    
}

simulated function TriggerGlobalEventClass()
{
    local /*0x35EA0000-0x00000000*/ private class InEventClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private int ActivateIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array EventsToActivate, ActivateIndices;
    local /*0x35EA0000-0x00000000*/ private @NULL GameSeq;
    local /*0x35EA0000-0x00000000*/ private bool bResult;
    local /*0x35EA0000-0x00000000*/ private int I;

    -1
    // End:0x2D
    if(ActivateIndex >= 0)
    {
        ActivateIndices[0] = ActivateIndex;
    }
    GameSeq = WorldInfo.GetGameSequence();
    // End:0x11E
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(InEventClass, true, EventsToActivate);
        I = 0;
        J0xA2:

        // End:0x11E [Loop If]
        if(I < EventsToActivate.Length)
        {
            // End:0x110
            if(SequenceEvent(EventsToActivate[I]).CheckActivate(self, InInstigator,, ActivateIndices))
            {
                bResult = true;
            }
            I++;
            // [Loop Continue]
            goto J0xA2;
        }
    }
    return bResult;
    //return ReturnValue;    
}

final simulated function ActivateEventClass()
{
    local /*0x35EA0000-0x00000000*/ private class InClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array EventList[25296897], ActivateIndices;
    local /*0x35EA0000-0x00000000*/ private bool bTest[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivatedEvents[26214401];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Evt;

    ActivatedEvents.Length = 0;
    // End:0xAC
    foreach EventList(Evt)
    {
        // End:0xAB
        if(ClassIsChildOf(Evt.Class, InClass) && Evt.CheckActivate(self, InInstigator, bTest, ActivateIndices))
        {
            ActivatedEvents.AddItem(Evt);            
        }        
    }    
    return ActivatedEvents.Length > 0;
    //return ReturnValue;    
}

final simulated function FindEventsOfClass()
{
    local /*0x35EA0000-0x00000000*/ private class EventClass[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_EventList[26214401];
    local /*0x35EA0000-0x00000000*/ private bool bIncludeDisabled[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Evt;
    local /*0x35EA0000-0x00000000*/ private bool bFoundEvent;

    // End:0x116
    foreach GeneratedEvents(Evt)
    {
        // End:0x115
        if((((Evt != none) && Evt.bEnabled || bIncludeDisabled) && ClassIsChildOf(Evt.Class, EventClass)) && (Evt.MaxTriggerCount == 0) || Evt.MaxTriggerCount > Evt.TriggerCount)
        {
            out_EventList.AddItem(Evt);            
            bFoundEvent = true;
        }        
    }    
    return bFoundEvent;
    //return ReturnValue;    
}

final simulated function ClearLatentAction()
{
    local /*0x35EA0000-0x00000000*/ private class actionClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAborted[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL exceptionAction[9437185];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0D:

    // End:0x10E [Loop If]
    if(Idx < LatentActions.Length)
    {
        // End:0x58
        if(LatentActions[Idx] == none)
        {
            LatentActions.Remove(Idx--, 1);                        
        }
        else
        {
            // End:0x100
            if(ClassIsChildOf(LatentActions[Idx].Class, actionClass) && LatentActions[Idx] != exceptionAction)
            {
                // End:0xE9
                if(bAborted)
                {
                    LatentActions[Idx].AbortFor(self);
                }
                LatentActions.Remove(Idx--, 1);                
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

simulated function OnDestroy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private int AttachIdx, IgnoreIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0x14A
    if(Action.bDestroyBasedActors)
    {
        AttachIdx = 0;
        J0x2D:

        // End:0x14A [Loop If]
        if(AttachIdx < Attached.Length)
        {
            A = Attached[AttachIdx];
            IgnoreIdx = 0;
            J0x6D:

            // End:0x102 [Loop If]
            if(IgnoreIdx < Action.IgnoreBasedClasses.Length)
            {
                // End:0xF4
                if(ClassIsChildOf(A.Class, Action.IgnoreBasedClasses[IgnoreIdx]))
                {
                    A = none;
                    // [Explicit Break]
                    goto J0x102;
                }
                IgnoreIdx++;
                // [Loop Continue]
                goto J0x6D;
            }
            J0x102:

            // End:0x114
            if(A == none)
            {                
            }
            else
            {
                A.OnDestroy(Action);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    // End:0x17A
    if(bNoDelete || int(Role) < int(ROLE_Authority))
    {
        ShutDown();        
    }
    else
    {
        // End:0x18C
        if(!bDeleteMe)
        {
            Destroy();
        }
    }
    //return;    
}

event ForceNetRelevant()
{
    // End:0x5B
    if(((int(RemoteRole) == int(ROLE_None)) && bNoDelete) && !bStatic)
    {
        RemoteRole = ROLE_SimulatedProxy;
        bAlwaysRelevant = true;
        NetUpdateFrequency = 0.1000000;
    }
    bForceNetUpdate = true;
    //return;    
}

// Export UActor::execSetNetUpdateTime(FFrame&, void* const)
native final function SetNetUpdateTime()
{
    local /*0x35EA0000-0x00000000*/ private float NewUpdateTime[8388609];


}

simulated event ShutDown()
{
    SetPhysics(0);
    SetCollision(false, false);
    // End:0x3A
    if(CollisionComponent != none)
    {
        CollisionComponent.SetBlockRigidBody(false);
    }
    SetHidden(true);
    SetTickIsDisabled(true);
    ForceNetRelevant();
    // End:0x114
    if(int(RemoteRole) != int(ROLE_None))
    {
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bCollideActors', bCollideActors == default.bCollideActors);
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bBlockActors', bBlockActors == default.bBlockActors);
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bHidden', bHidden == default.bHidden);
        SetForcedInitialReplicatedProperty(ByteProperty'Actor.Physics', int(Physics) == int(default.Physics));
    }
    NetUpdateFrequency = 0.1000000;
    bForceNetUpdate = true;
    //return;    
}

// Export UActor::execPrestreamTextures(FFrame&, void* const)
native function PrestreamTextures()
{
    local /*0x35EA0000-0x00000000*/ private float Seconds[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bEnableStreaming[8388609];
    local /*0x35EA0000-0x00000000*/ private int CinematicTextureGroups[9437185];

    0                    
}

simulated function OnModifyHealth()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609], InstigatorController, InstigatorPawn;

    InstigatorController = Controller(Action.Instigator);
    // End:0xA8
    if(InstigatorController == none)
    {
        InstigatorPawn = Pawn(Action.Instigator);
        // End:0xA8
        if(InstigatorPawn != none)
        {
            InstigatorController = InstigatorPawn.Controller;
        }
    }
    // End:0x11E
    if(Action.bHeal)
    {
        HealDamage(int(Action.Amount), InstigatorController, Action.DamageType);        
    }
    else
    {
        TakeDamage(int(Action.Amount), InstigatorController, Location, Vector(Rotation) * -Action.Momentum, Action.DamageType);
    }
    //return;    
}

simulated function OnTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array objVars;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL destActor, tempActor, A, C;
    local /*0x35EA0000-0x00000000*/ private bool bOccupiedDest, bColliding;
    local /*0x35EA0000-0x00000000*/ private float ColRadius, ColHeight;
    local /*0x35EA0000-0x00000000*/ private @NULL Extent;

    GetBoundingCylinder(ColRadius, ColHeight);
    Extent.X = ColRadius;
    Extent.Y = ColRadius;
    Extent.Z = ColHeight;
    bOccupiedDest = false;
    Action.GetObjectVars(objVars, "Destination");
    Idx = 0;
    J0xDA:

    // End:0x2CA [Loop If]
    if(Idx < objVars.Length)
    {
        tempActor = Actor(objVars[Idx]);
        // End:0x12A
        if(tempActor == none)
        {            
        }
        else
        {
            C = Controller(tempActor);
            // End:0x1A3
            if((C != none) && C.Pawn != none)
            {
                tempActor = C.Pawn;
            }
            // End:0x260
            if(Action.bCheckOverlap)
            {
                bColliding = false;
                // End:0x24A
                foreach VisibleCollidingActors(Class'Actor', A, ColRadius * 2.0000000, tempActor.Location, false, Extent, true)
                {
                    // End:0x249
                    if(IsBlockedBy(A))
                    {
                        bColliding = true;
                        // End:0x24A
                        break;
                    }                    
                }                
                bOccupiedDest = bColliding;
            }
            destActor = tempActor;
            // End:0x2BC
            if((!Action.bCheckOverlap || !bOccupiedDest) && destActor != none)
            {
                // [Explicit Break]
                goto J0x2CA;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0xDA;
    }
    J0x2CA:

    // End:0x3FA
    if((destActor != none) && Action.ShouldTeleport(self, destActor.Location, Action.TeleportDistance, Action.TeleportVolumes))
    {
        // End:0x3F7
        if(SetLocation(destActor.Location))
        {
            PlayTeleportEffect(false, true);
            // End:0x3D2
            if(Action.bUpdateRotation)
            {
                SetRotation(destActor.Rotation);
            }
            ForceNetRelevant();
            bUpdateSimulatedPosition = true;
            bNetDirty = true;            
        }        
    }
    else
    {
        // End:0x409
        if(destActor != none)
        {
        }
    }
    //return;    
}

simulated function OnSetVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609], V;
    local /*0x35EA0000-0x00000000*/ private float Mag;

    Mag = Action.VelocityMag;
    // End:0x65
    if(Mag <= 0.0000000)
    {
        Mag = VSize(Action.VelocityDir);
    }
    V = Normal(Action.VelocityDir) * Mag;
    // End:0xDB
    if(Action.bVelocityRelativeToActorRotation)
    {
        V = V >> Rotation;
    }
    Velocity = V;
    // End:0x13C
    if((int(Physics) == int(10)) && CollisionComponent != none)
    {
        CollisionComponent.SetRBLinearVelocity(Velocity);
    }
    //return;    
}

simulated function OnSetBlockRigidBody()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0xC0
    if(CollisionComponent != none)
    {
        // End:0x69
        if(Action.InputLinks[0].bHasImpulse)
        {
            CollisionComponent.SetBlockRigidBody(true);            
        }
        else
        {
            // End:0xC0
            if(Action.InputLinks[1].bHasImpulse)
            {
                CollisionComponent.SetBlockRigidBody(false);
            }
        }
    }
    //return;    
}

simulated function OnSetPhysics()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    ForceNetRelevant();
    SetPhysics(Action.newPhysics);
    // End:0xA3
    if(int(RemoteRole) != int(ROLE_None))
    {
        // End:0x78
        if(int(Physics) != int(0))
        {
            bUpdateSimulatedPosition = true;
            // End:0x78
            if(bOnlyDirtyReplication)
            {
                bNetDirty = true;
            }
        }
        SetForcedInitialReplicatedProperty(ByteProperty'Actor.Physics', int(Physics) == int(default.Physics));
    }
    //return;    
}

function OnChangeCollision()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0xA5
    if(Action.ObjInstanceVersion < Action.GetObjClassVersion())
    {
        SetCollision(Action.bCollideActors, Action.bBlockActors, Action.bIgnoreEncroachers);        
    }
    else
    {
        SetCollisionType(Action.CollisionType);
    }
    ForceNetRelevant();
    // End:0x13D
    if(int(RemoteRole) != int(ROLE_None))
    {
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bCollideActors', bCollideActors == default.bCollideActors);
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bBlockActors', bBlockActors == default.bBlockActors);
    }
    //return;    
}

simulated function OnToggleHidden()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private int AttachIdx, IgnoreIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0x14A
    if(Action.bToggleBasedActors)
    {
        AttachIdx = 0;
        J0x2D:

        // End:0x14A [Loop If]
        if(AttachIdx < Attached.Length)
        {
            A = Attached[AttachIdx];
            IgnoreIdx = 0;
            J0x6D:

            // End:0x102 [Loop If]
            if(IgnoreIdx < Action.IgnoreBasedClasses.Length)
            {
                // End:0xF4
                if(ClassIsChildOf(A.Class, Action.IgnoreBasedClasses[IgnoreIdx]))
                {
                    A = none;
                    // [Explicit Break]
                    goto J0x102;
                }
                IgnoreIdx++;
                // [Loop Continue]
                goto J0x6D;
            }
            J0x102:

            // End:0x114
            if(A == none)
            {                
            }
            else
            {
                A.OnToggleHidden(Action);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    // End:0x18F
    if(Action.InputLinks[0].bHasImpulse)
    {
        SetHidden(true);        
    }
    else
    {
        // End:0x1D4
        if(Action.InputLinks[1].bHasImpulse)
        {
            SetHidden(false);            
        }
        else
        {
            SetHidden(!bHidden);
        }
    }
    ForceNetRelevant();
    // End:0x231
    if(int(RemoteRole) != int(ROLE_None))
    {
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bHidden', bHidden == default.bHidden);
    }
    //return;    
}

function OnAttachToActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL Attachment, C;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array objVars;

    Action.GetObjectVars(objVars, "Attachment");
    Idx = 0;
    J0x3F:

    // End:0x233 [Loop If]
    if((Idx < objVars.Length) && Attachment == none)
    {
        Attachment = Actor(objVars[Idx]);
        C = Controller(Attachment);
        // End:0x107
        if((C != none) && C.Pawn != none)
        {
            Attachment = C.Pawn;
        }
        // End:0x225
        if(Attachment != none)
        {
            // End:0x177
            if(Action.bDetach)
            {
                Attachment.SetBase(none);
                Attachment.SetHardAttach(false);                
            }
            else
            {
                C = Controller(self);
                // End:0x209
                if((C != none) && C.Pawn != none)
                {
                    C.Pawn.DoKismetAttachment(Attachment, Action);                    
                }
                else
                {
                    DoKismetAttachment(Attachment, Action);
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x3F;
    }
    //return;    
}

function DoKismetAttachment()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Attachment[8388609], Action;
    local /*0x35EA0000-0x00000000*/ private bool bOldCollideActors, bOldBlockActors;
    local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z;

    Attachment.SetBase(none);
    Attachment.SetHardAttach(Action.bHardAttach);
    // End:0x2CA
    if(Action.bUseRelativeOffset || Action.bUseRelativeRotation)
    {
        bOldCollideActors = Attachment.bCollideActors;
        bOldBlockActors = Attachment.bBlockActors;
        Attachment.SetCollision(false, false);
        // End:0x17A
        if(Action.bUseRelativeRotation)
        {
            Attachment.SetRotation(Rotation + Action.RelativeRotation);
        }
        // End:0x29D
        if(Action.bUseRelativeOffset)
        {
            GetAxes(Rotation, X, Y, Z);
            Attachment.SetLocation(((Location + (Action.RelativeOffset.X * X)) + (Action.RelativeOffset.Y * Y)) + (Action.RelativeOffset.Z * Z));
        }
        Attachment.SetCollision(bOldCollideActors, bOldBlockActors);
    }
    Attachment.SetBase(self);
    Attachment.ForceNetRelevant();
    Attachment.bNetDirty = true;
    // End:0x463
    if((int(Attachment.RemoteRole) != int(ROLE_None)) && Attachment.bStatic || Attachment.bNoDelete)
    {
        Attachment.SetForcedInitialReplicatedProperty(StructProperty'Actor.RelativeLocation', Attachment.RelativeLocation == Attachment.default.RelativeLocation);
        Attachment.SetForcedInitialReplicatedProperty(StructProperty'Actor.RelativeRotation', Attachment.RelativeRotation == Attachment.default.RelativeRotation);
    }
    //return;    
}

event OnAnimEnd()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode[8388609];
    local /*0x35EA0000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

    //return;    
}

event OnAnimPlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode[8388609];

    //return;    
}

event BeginAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    //return;    
}

event SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;

    //return;    
}

event FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    //return;    
}

event PlayActorFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSet[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GroupName[8388609], SeqName;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay, AkCBInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event StopActorFaceFXAnim()
{
    //return;    
}

event SetMorphWeight()
{
    local /*0x35EA0000-0x00000000*/ private name MorphNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private float MorphWeight[8388609];

    //return;    
}

event SetSkelControlScale()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];

    //return;    
}

event @NULL TickSkelControl()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609], SkelCtrl;

    //return;    
}

simulated function IsActorPlayingFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function CanActorPlayFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event GetActorFaceFXAsset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function IsStationary()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated event GetActorEyesViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    out_Location = Location;
    out_Rotation = Rotation;
    //return;    
}

// Export UActor::execIsPlayerOwned(FFrame&, void* const)
native simulated function IsPlayerOwned()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function PawnBaseDied()
{
    //return;    
}

// Export UActor::execGetTeamNum(FFrame&, void* const)
native simulated function GetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

simulated event ScriptGetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    return 255;
    //return ReturnValue;    
}

simulated function NotifyLocalPlayerTeamReceived()
{
    //return;    
}

simulated function FindGoodEndView()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609], GoodRotation;

    GoodRotation = PC.Rotation;
    //return;    
}

// Export UActor::execGetTargetLocation(FFrame&, void* const)
native simulated function GetTargetLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RequestedBy[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bRequestAlternateLoc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event SpawnedByKismet()
{
    //return;    
}

simulated event InterpolationStarted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609], GroupInst;

    //return;    
}

simulated event InterpolationFinished()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609];

    //return;    
}

simulated event InterpolationChanged()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609];

    //return;    
}

simulated event InterpPropertyChanged()
{
    local /*0x35EA0000-0x00000000*/ private name TrackPropertyName[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event @NULL RigidBodyCollision()
{
    local /*0x35EA0000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x35EA0000-0x00000000*/ private int ContactIndex[8388609];

    //return;    
}

event @NULL OnRanOver()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Vehicle[8388609], RunOverComponent;
    local /*0x35EA0000-0x00000000*/ private int WheelIndex[8388609];

    //return;    
}

// Export UActor::execSetHUDLocation(FFrame&, void* const)
native simulated function SetHUDLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewHUDLocation[8388609];


}

// Export UActor::execNativePostRenderFor(FFrame&, void* const)
native simulated function NativePostRenderFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609], Canvas, CameraPosition, CameraDir;


}

simulated event PostRenderFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609], Canvas, CameraPosition, CameraDir;

    //return;    
}

simulated event @NULL RootMotionModeChanged()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    //return;    
}

simulated event @NULL RootMotionProcessed()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    //return;    
}

simulated event @NULL RootMotionExtracted()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609], ExtractedRootMotionDelta;

    //return;    
}

event @NULL PostInitAnimTree()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    //return;    
}

simulated event @NULL PreInitAnimTree()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    //return;    
}

// Export UActor::execGetPackageGuid(FFrame&, void* const)
native static final function GetPackageGuid()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated event OnRigidBodySpringOverextension()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BodyInstance[8388609];

    //return;    
}

// Export UActor::execIsInPersistentLevel(FFrame&, void* const)
native final function IsInPersistentLevel()
{
    local /*0x35EA0000-0x00000000*/ private bool bIncludeLevelStreamingPersistent[9437185], ReturnValue;


}

simulated function GetAimFrictionExtent()
{
    local /*0x35EA0000-0x00000000*/ private float Width[25165825], Height;
    local /*0x35EA0000-0x00000000*/ private @NULL Center[25165825];

    // End:0x2C
    if(bCanBeFrictionedTo)
    {
        GetBoundingCylinder(Width, Height);        
    }
    else
    {
        Width = 0.0000000;
        Height = 0.0000000;
    }
    Center = Location;
    //return;    
}

simulated function GetAimAdhesionExtent()
{
    local /*0x35EA0000-0x00000000*/ private float Width[25165825], Height;
    local /*0x35EA0000-0x00000000*/ private @NULL Center[25165825];

    // End:0x2C
    if(bCanBeAdheredTo)
    {
        GetBoundingCylinder(Width, Height);        
    }
    else
    {
        Width = 0.0000000;
        Height = 0.0000000;
    }
    Center = Location;
    //return;    
}

event PlayParticleEffect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event CreateForceField()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event TrailsNotify()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];

    //return;    
}

event TrailsNotifyTick()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];

    //return;    
}

event TrailsNotifyEnd()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];

    //return;    
}

// Export UActor::execGetAnimTrailParticleSystem(FFrame&, void* const)
native function GetAnimTrailParticleSystem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681], ReturnValue;


}

// Export UActor::execSupportsKismetModification(FFrame&, void* const)
native final function SupportsKismetModification()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AskingOp[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event @NULL AnimTreeUpdated()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[8388609];

    //return;    
}

simulated event PostDemoRewind()
{
    //return;    
}

simulated event ReplicationEnded()
{
    //return;    
}

// Export UActor::execGetAvoidanceVector(FFrame&, void* const)
native final function GetAvoidanceVector()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Obstacles[25296897];
    local /*0x35EA0000-0x00000000*/ private @NULL GoalLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private float CollisionRadius[8388609], MaxSpeed;
    local /*0x35EA0000-0x00000000*/ private int NumSamples[9437185];
    local /*0x35EA0000-0x00000000*/ private float VelocityStepRate[9437185], MaxTimeTilOverlap;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    8
    0.1000000
    1.0000000                                    
}

// Export UActor::execWillOverlap(FFrame&, void* const)
native final function WillOverlap()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PosA[8388609], VelA, PosB, VelB;
    local /*0x35EA0000-0x00000000*/ private float StepSize[8388609], Radius, Time;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UActor::execShouldBeHiddenBySHOW_NavigationNodes(FFrame&, void* const)
native function ShouldBeHiddenBySHOW_NavigationNodes()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function IsMobileTouchEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bEnableMobileTouch && bCollideActors;
    //return ReturnValue;    
}

event OnMobileTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPC[8388609], TouchLocation;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    TriggerEventClass(Class'SeqEvent_MobileTouch', InPC, 0);
    return true;
    //return ReturnValue;    
}

// Export UActor::execGetActorMetrics(FFrame&, void* const)
native simulated function GetActorMetrics()
{
    local /*0x35EA0000-0x00000000*/ private byte MetricsType[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UActor::execGetActorSpriteComponent(FFrame&, void* const)
native function @NULL GetActorSpriteComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    DrawScale=1.0000000
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    CustomTimeDilation=1.0000000
    Role=ENetRole.ROLE_Authority
    ReplicatedCollisionType=ECollisionType.None
    bPushedByEncroachers=true
    bRouteBeginPlayEvenIfStatic=true
    bCanStepUpOn=true
    bReplicateMovement=true
    bAllowFluidSurfaceInteraction=true
    bSkipAttachedMoves=true
    bMovable=true
    bJustTeleported=true
    bEditable=true
    NetUpdateFrequency=100.0000000
    NetPriority=1.0000000
    MessageClass=Class'LocalMessage'
    SupportedEvents=/* Array type was not detected. */
}