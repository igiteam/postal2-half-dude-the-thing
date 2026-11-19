class LPPawn extends SPGFCoverPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum EVSInventoryPartSlot
{
    EIPS_Unknown,                   // 0
    EIPS_RightArm,                  // 1
    EIPS_LeftArm,                   // 2
    EIPS_MAX                        // 3
};

enum EVSAnimationSlotType
{
    eastFullBody,                   // 0
    eastUpperBody,                  // 1
    eastRightArm,                   // 2
    eastLeftArm,                    // 3
    EVSAnimationSlotType_MAX        // 4
};

enum EPartIKType
{
    EDT_None,                       // 0
    EDT_Basic,                      // 1
    EDT_Assisted,                   // 2
    EDT_MAX                         // 3
};

struct native GrabPointInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FirmGrabRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WeakGrabRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VulnerableCoreID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabledForFreeGrab;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDestroyed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayIgnoreRange;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStickyAimOnFSMShields;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bManualRotation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HoldSMClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte IKType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IKDrillTargetSocket;

    structdefaultproperties
    {
        SocketName="None"
        FirmGrabRadius=0.0000000
        WeakGrabRadius=0.0000000
        VulnerableCoreID=-1
        bEnabledForFreeGrab=false
        bDestroyed=false
        bDisplayIgnoreRange=false
        bStickyAimOnFSMShields=false
        bManualRotation=false
        HoldSMClass=none
        IKType=EPartIKType.EDT_None
        IKDrillTargetSocket="None"
    }
};

struct native GrabPointHitInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitPawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabPointIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirmGrab;

    structdefaultproperties
    {
        HitPawn=none
        GrabPointIndex=0
        bFirmGrab=false
    }
};

struct native LPTemplateLogicDataStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetPawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabPointIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirmGrab;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HoldStateIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name CombatWindowName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThrowingGrenade;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AnimatedPickupHeight;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceStrafeAnims;

    structdefaultproperties
    {
        TargetPawn=none
        GrabPointIndex=0
        bFirmGrab=false
        HoldStateIndex=0
        CombatWindowName="None"
        bThrowingGrenade=false
        AnimatedPickupHeight=EAnimatedPickupHeight.ECPH_Low
        bForceStrafeAnims=false
    }
};

struct native PawnHealthRegenInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthRegenDelayTimer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthRegenRemainder;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHealthRegenEnabled;

    structdefaultproperties
    {
        HealthRegenDelayTimer=0.0000000
        HealthRegenRemainder=0.0000000
        bHealthRegenEnabled=false
    }
};

struct native LPAimNodeInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsesAimNode;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AimState;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentAimContextIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentAimZoneIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocalAim;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdjustedLocalAim;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndWantsToAimTime;

    structdefaultproperties
    {
        bUsesAimNode=false
        AimState=EAimStateType.AST_NotAiming
        CurrentAimContextIndex=0
        CurrentAimZoneIndex=0
        LocalAim=(Pitch=0,Yaw=0,Roll=0)
        AdjustedLocalAim=(Pitch=0,Yaw=0,Roll=0)
        EndWantsToAimTime=0.0000000
    }
};

struct native LPShieldFracture_DamageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Base;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ShieldId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ChunkIdx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Damage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Momentum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int bWantPhysChunksAndParticles;

    structdefaultproperties
    {
        Base=none
        ShieldId="None"
        ChunkIdx=0
        Damage=0
        Momentum=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bWantPhysChunksAndParticles=0
    }
};

struct native AttackVolumeInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TouchingVolume;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsCurrentlyTouching;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TouchTimeStamp;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UnTouchTimeStamp;

    structdefaultproperties
    {
        TouchingVolume=none
        bIsCurrentlyTouching=false
        TouchTimeStamp=0.0000000
        UnTouchTimeStamp=0.0000000
    }
};

struct native LPAttackVolumeScriptedAttack
{
    var(0.25_Pct) /*0x7C450000-0x00000000*/ private class PawnClass[196609];
    var(0.25_Pct) /*0x7C450000-0x00000000*/ private @NULL Animation[65537];
    var(0.25_Pct) /*0x7C450000-0x00000000*/ private editfixedsize array ActorsToStandOn[65537];

    structdefaultproperties
    {
        PawnClass=none
        Animation=(TemplateAnimTree=none,TemplateAnimName="None")
        ActorsToStandOn=none
    }
};

struct native ReplicatedCombatWindow
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Count;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Window;

    structdefaultproperties
    {
        Count=0
        Window=(CombatWindow=none,Publisher=none,bTimedWindow=false,StartTime=0.0000000,EndTime=0.0000000)
    }
};

struct native ForcedAimZoneInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AimZoneType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndForceTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OutOfRangeHint;

    structdefaultproperties
    {
        AimZoneType=EAimStateType.AST_NotAiming
        EndForceTime=0.0000000
        OutOfRangeHint=0.0000000
    }
};

struct native AttachedEffect
{
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Emitter[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AttachSocket;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndTime;

    structdefaultproperties
    {
        Emitter=none
        AttachSocket="None"
        EndTime=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array AttachedEffects;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GrabPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WinchPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceDisableBeingGrabbed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsLastSentWorldAimDirInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReplicateWorldAimDir;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingCinematicLod;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bITakeOverGrenadeExplosionWhenAttachedToMe;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStopAllPhysicalActionsOfGrenadeOnAttachment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRejectsAnyAttachedGrenades;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbsorbsAnyAttachedGrenades;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugTraceDamageActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool InStruggleMode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool InStruggleMode9PointAim[536870913];
var(0.25_Pct) /*0x81600000-0x00000000*/ private bool bCanDropTEnergy[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayImpactEffectsWhenDead;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotValidForAiWhileHidenRightNow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideFromRadar[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsAnyAimStateNodeAiming[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBearTrapped;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDelayFiringDuringFullBodyAnims;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDelayFiringDuringUpperBodyAnims;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDNATagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasDNATagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bPlayWeaponChargeUpEffect[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bPlayWeaponFullyChargedEffect[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTrackAimStateNodesThatDelayFiring;
var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataPawn[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TemplateLogicData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HealthRegenInfo;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL AIResourceManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimNodeInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RagdollImpulseScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RagdollRadialImpulseScale;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL DamageReactionManager[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_AdditiveHitReaction_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_AdditiveHitReaction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private SPTuneDataGFWeapon.EAimStateType AimState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPTypes.EMapIconStates RadarIconState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PrevRadarIconState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL WorldAimDir[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastSentWorldAimDirToServer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeBumpedByVs;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DebugTraceDamageActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CourierItems[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShowObjectivesForActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttackVolume;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SubscribedCombatWindows[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> SubscribedActiveDefense[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ReplicatedCombatWindowInfo[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HeadshotDeathDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForcedAimZone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesTagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaggedTime;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DNAParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NearestDNABoneName;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array AudioComponentsToNotStopOnFollowerAtStartOfActiveDefenses[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveAimingAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAdditiveAimingAnimationTemplate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AdditiveAimingBlendStrengthNodeName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveAimingBlendStrengthNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CarrierKnockDownTimeToStayOnGround[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ReplicatedName[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TEnergyDropLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EdgeGlowPhysicalMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array EdgeGlowMICs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL EdgeGlow[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LowHealthCSA;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveHitReactionAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AdditiveHitBlenderName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveHitBlenderNode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AimStateNodesThatDelayFiring;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL EMPInfo[2097153];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ActiveDefenseFunction__Delegate;

// Export ULPPawn::execTraceGrabPoint(FFrame&, void* const)
native function TraceGrabPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Start[25296897], Dir;
    local /*0x97E50000-0x00000000*/ private float Max2DDelta[8388609], MaxZDelta;
    local /*0x97E50000-0x00000000*/ private @NULL HitGrabPointInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsGrabPointInRange(FFrame&, void* const)
native function IsGrabPointInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Start[25296897], GrabPointLoc;
    local /*0x97E50000-0x00000000*/ private float Max2DDelta[8388609], MaxZDelta;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execComputeAdjustedLocalAim(FFrame&, void* const)
native function ComputeAdjustedLocalAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocalAim[25296897], ReturnValue;


}

// Export ULPPawn::execOnTouchAttackVolume(FFrame&, void* const)
native function OnTouchAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVolume[8388609];


}

// Export ULPPawn::execOnUnTouchAttackVolume(FFrame&, void* const)
native function OnUnTouchAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVolume[8388609];


}

// Export ULPPawn::execHasAttackVolume(FFrame&, void* const)
native function HasAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVolume[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execGetAttackVolumeInfo(FFrame&, void* const)
native function GetAttackVolumeInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutInfo[25165825], Requester;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execCanUsePrimaryHandIKController(FFrame&, void* const)
native simulated function CanUsePrimaryHandIKController()
{
    local /*0x97E50000-0x00000000*/ private bool bBypassMirrorCheck[9437185], ReturnValue;


}

// Export ULPPawn::execCanUseSecondaryHandIKController(FFrame&, void* const)
native simulated function CanUseSecondaryHandIKController()
{
    local /*0x97E50000-0x00000000*/ private bool bBypassMirrorCheck[9437185], ReturnValue;


}

// Export ULPPawn::execIsInAttackVolumeFor(FFrame&, void* const)
native function IsInAttackVolumeFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsAttackVolumeAccessPossible(FFrame&, void* const)
native function IsAttackVolumeAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsGhost(FFrame&, void* const)
native function IsGhost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsValidForAi(FFrame&, void* const)
native simulated event IsValidForAi()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsValidEnemy(FFrame&, void* const)
native simulated event IsValidEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execGetDefaultContextSensitiveAnimObject(FFrame&, void* const)
native simulated function GetDefaultContextSensitiveAnimObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPawn::execUpdateContextSensitveAnimation(FFrame&, void* const)
native simulated function UpdateContextSensitveAnimation()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPawn::execIsUsingForcedAimZoneOfType(FFrame&, void* const)
native final simulated function IsUsingForcedAimZoneOfType()
{
    local /*0x97E50000-0x00000000*/ private byte AimZone[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execUpdateHealth(FFrame&, void* const)
native function UpdateHealth()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPawn::execUpdateRegenRate(FFrame&, void* const)
native function UpdateRegenRate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPawn::execIsAllowedToRegenHealth(FFrame&, void* const)
native final function IsAllowedToRegenHealth()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execGetHealthRegenRate(FFrame&, void* const)
native function GetHealthRegenRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPawn::execGetHealthRegenDelay(FFrame&, void* const)
native function GetHealthRegenDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPawn::execGetHoldAimAfterFiringTime(FFrame&, void* const)
native simulated function GetHoldAimAfterFiringTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPawn::execWantsToAim(FFrame&, void* const)
native simulated function WantsToAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execCanAim(FFrame&, void* const)
native simulated function CanAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsAiming(FFrame&, void* const)
native simulated function IsAiming()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execTryToNotifyServerOfWorldAimDir(FFrame&, void* const)
native final simulated function TryToNotifyServerOfWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAimDir[25296897];


}

// Export ULPPawn::execServerSetWorldAimDir(FFrame&, void* const)
unreliable server native final function ServerSetWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private int Pitch[8388609], Yaw;


}

// Export ULPPawn::execSetAimState(FFrame&, void* const)
native function SetAimState()
{
    local /*0x97E50000-0x00000000*/ private byte NewAimState[8388609];


}

// Export ULPPawn::execServerSetAimState(FFrame&, void* const)
reliable server native final function ServerSetAimState()
{
    local /*0x97E50000-0x00000000*/ private byte NewAimState[8388609];


}

// Export ULPPawn::execUpdateAimNodeInfo(FFrame&, void* const)
native final simulated function UpdateAimNodeInfo()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPawn::execGetAimZoneTypeByIndex(FFrame&, void* const)
native final function GetAimZoneTypeByIndex()
{
    local /*0x97E50000-0x00000000*/ private int ContextIndex[8388609], ZoneIndex;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export ULPPawn::execUpdateAdditiveAimingAnimationLayer(FFrame&, void* const)
native final simulated function UpdateAdditiveAimingAnimationLayer();

// Export ULPPawn::execGetBestAdditivateAimingAnimation(FFrame&, void* const)
native simulated function GetBestAdditivateAimingAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPawn::execGetWorldAimDir(FFrame&, void* const)
native simulated event GetWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPawn::execShouldDelayFiring(FFrame&, void* const)
native simulated function ShouldDelayFiring()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execRaiseWeaponInPrepForFiring(FFrame&, void* const)
native simulated function RaiseWeaponInPrepForFiring();

// Export ULPPawn::execDidRaiseWeaponInPrepForFiringExpire(FFrame&, void* const)
native simulated function DidRaiseWeaponInPrepForFiringExpire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execUpdateAdjustedLocalAim(FFrame&, void* const)
native final function UpdateAdjustedLocalAim();

// Export ULPPawn::execGetNormalizedAimValue(FFrame&, void* const)
native final simulated function GetNormalizedAimValue()
{
    local /*0x97E50000-0x00000000*/ private float ValDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LimitInfo[25296897];
    local /*0x97E50000-0x00000000*/ private float OutOfRangeHint[9437185], ReturnValue;


}

// Export ULPPawn::execGetBackToWallAim(FFrame&, void* const)
native final simulated function GetBackToWallAim()
{
    local /*0x97E50000-0x00000000*/ private int ContextIndex[8388609], ZoneIdx;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPawn::execGetAimForAimZone(FFrame&, void* const)
native final simulated function GetAimForAimZone()
{
    local /*0x97E50000-0x00000000*/ private byte AimZoneType[8388609];
    local /*0x97E50000-0x00000000*/ private name ForcedContext[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPawn::execPutGrenadeAway(FFrame&, void* const)
native simulated function PutGrenadeAway();

// Export ULPPawn::execTakeDamage_SetParams(FFrame&, void* const)
native simulated function TakeDamage_SetParams()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], InHitLocation, InMomentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], InstigatedByPawn, DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool bShouldPlayHitReactAnim[9437185], bShouldPlayHitEffects;

    true
    true                                                
}

// Export ULPPawn::execLPPawnTick(FFrame&, void* const)
private native final function LPPawnTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

delegate ActiveDefenseFunction()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender[8388609];
    local /*0x97E50000-0x00000000*/ private class SMClass[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Window[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function CameraFocusSocketName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'CameraFocus';
    //return ReturnValue;    
}

simulated function CameraFocusRadius()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 20.0000000;
    //return ReturnValue;    
}

simulated function HideFromRadar()
{
    local /*0x97E50000-0x00000000*/ private @NULL RadarController[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHideFromRadar;
    //return ReturnValue;    
}

simulated function GetMaxTEnergyCapacity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x44
    if(TuneDataPawn != none)
    {
        return TuneDataPawn.TEnergyMaxLimit.GetValue();
    }
    return 100.0000000;
    //return ReturnValue;    
}

simulated event Destroyed()
{
    // End:0x2E
    if(AIResourceManager != none)
    {
        AIResourceManager.ShutDown();
    }
    // End:0x7C
    if(DNAParticles != none)
    {
        DNAParticles.DeactivateSystem();
        DNAParticles.SetHidden(true);
    }
    // End:0xAA
    if(DamageReactionManager != none)
    {
        DamageReactionManager.TurnOffAnyLoopingDamageActions();
    }
    StopAllAttachedFX();
    super(SPPawn).Destroyed();
    //return;    
}

function DoTraceDamageOnShieldFracture()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamageInfo[8388609];

    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], MyAiController;
    local /*0x97E50000-0x00000000*/ private float YL, Y;
    local /*0x97E50000-0x00000000*/ private @NULL OldFont;

    // End:0x20E
    if(ShowObjectivesForActor != none)
    {
        MyAiController = LPAIController(ShowObjectivesForActor.Controller);
        // End:0x203
        if((MyAiController != none) && MyAiController.AIObjectiveManager != none)
        {
            Y = 10.0000000;
            OldFont = H.Canvas.Font;
            H.Canvas.Font = Class'Engine.Engine'.static.GetTinyFont();
            YL = H.Canvas.Font.GetMaxCharHeight();
            YL *= 1.0500000;
            MyAiController.AIObjectiveManager.DisplayDebug(H, YL, Y);
            H.Canvas.Font = OldFont;
        }
        ShowObjectivesForActor = none;
    }
    super(SPGFPawn).DrawHUD(H);
    //return;    
}

simulated function OnToggleResourceAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x17B
    if(((AIResourceManager != none) && inAction != none) && inAction.ResourceName != 'None')
    {
        // End:0xC6
        if(inAction.InputLinks[0].bHasImpulse)
        {
            AIResourceManager.AllowAccessForResource(inAction.ResourceName, true);            
        }
        else
        {
            // End:0x13E
            if(inAction.InputLinks[1].bHasImpulse)
            {
                AIResourceManager.AllowAccessForResource(inAction.ResourceName, false);                
            }
            else
            {
                AIResourceManager.ToggleAccessForResource(inAction.ResourceName);
            }
        }
    }
    //return;    
}

simulated function OnToggleStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPController;

    LPController = LPAIController(Controller);
    // End:0x53
    if(LPController != none)
    {
        LPController.OnToggleStruggleMode(inAction);
    }
    //return;    
}

simulated function OnSetTEnergyDropLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], A;

    // End:0x8F
    if(inAction.DropLocation.Length > 0)
    {
        A = Actor(inAction.DropLocation[0]);
        // End:0x8F
        if(A != none)
        {
            TEnergyDropLocation = A.Location;
        }
    }
    //return;    
}

function OnKillPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    Died(none, Class'Engine.DamageType', Location);
    //return;    
}

function DNAExtracted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTagger[8388609], Objective;

    // End:0xB0
    if((InTagger != none) && TuneDataPawn.DNATaggingQuestObjective != none)
    {
        Objective = SPQO_ObjectiveBool(TuneDataPawn.DNATaggingQuestObjective.GetQuestObject());
        // End:0xB0
        if(Objective != none)
        {
            Objective.AdjustQuestProgress(1.0000000);
        }
    }
    // End:0xDE
    if(DNAParticles != none)
    {
        DNAParticles.DeactivateSystem();
    }
    bIsDNATagged = false;
    bWasDNATagged = true;
    //return;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_head';
    //return ReturnValue;    
}

simulated event BaseBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_positionTracker';
    //return ReturnValue;    
}

function ServerShouldPlayHitReactAnimGlobalMasterSwitch()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(SPGFPawn).ServerShouldPlayHitReactAnimGlobalMasterSwitch(DamageType);
    //return ReturnValue;    
}

simulated function DoAdditiveHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool bOverride[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    true
    // End:0x7D
    if(ATL_AdditiveHitReaction != none)
    {
        AnimSeqTemplate = ATL_AdditiveHitReaction.GetBestSequenceTemplate(self);
        PlayAdditiveHitReactionAnimationSequence(AnimSeqTemplate, None, 0, 1.0000000, 0.1000000, 0.2000000, false, bOverride);
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, PlayerCtrl;

    PlayerCtrl = LPPlayerController(InstigatedBy);
    // End:0x60
    if((PlayerCtrl != none) && PlayerCtrl.bSemiDukeMode)
    {
        InDamage = 10000;
        return;
    }
    super(SPGFPawn).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    TakeDamageParams.DamageType = DamageType;
    // End:0x3F
    if(IsInMatinee())
    {
        bDiedDuringMatinee = true;
    }
    // End:0x96
    if(TuneDataPawn.bDropTEnergyOnDeath && !TuneDataPawn.bDropTEnergyOnFreeze)
    {
        DropThermalEnergy();
    }
    DropCourierItems();
    return super(SPAIPawn).Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

simulated function DoGibSystemDeathExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExplosionTemplateToUse[8388609], ExplosionLoc, ExplosionRot;
    local /*0x97E50000-0x00000000*/ private bool bExplosionDrawDebug[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor;

    explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, ExplosionRot);
    // End:0x16C
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = self;
        explosionActor.Instigator = self;
        explosionActor.InstigatorController = Controller;
        explosionActor.bDrawDebug = bExplosionDrawDebug;
        explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
        explosionActor.Explode(ExplosionTemplateToUse);
    }
    //return;    
}

simulated function OnToggleDamageDuringMatinee()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bAllowHitReactionsInMatinee = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bAllowHitReactionsInMatinee = false;            
        }
        else
        {
            bAllowHitReactionsInMatinee = !bAllowHitReactionsInMatinee;
        }
    }
    //return;    
}

simulated function OnOverrideFormationRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x55
    if(AIResourceManager != none)
    {
        AIResourceManager.HandleSequenceAction(inAction.ResourceName, inAction);
    }
    //return;    
}

event SetupAiResourcesForAiPawnClass()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClassToActiveResourcesFor[8388609];

    // End:0x37
    if(AIResourceManager != none)
    {
        AIResourceManager.SetupResourcesForClass(AiPawnClassToActiveResourcesFor);
    }
    //return;    
}

event RemoveAiResourcesForAiPawnClass()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClassToActiveResourcesFor[8388609];

    // End:0x37
    if(AIResourceManager != none)
    {
        AIResourceManager.RemoveResourcesForClass(AiPawnClassToActiveResourcesFor);
    }
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609], AimStateNode;

    super.PerformPostInitAnimTreeActions(SkelComp);
    AdditiveAimingAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(AdditiveAimingAnimInfo.AnimNodeSlotName));
    AdditiveAimingBlendStrengthNode = LPAnimNodeBlend(SkelComp.FindAnimNode(AdditiveAimingBlendStrengthNodeName));
    // End:0x13A
    if(AdditiveHitReactionAnimInfo.AnimNodeSlotName != 'None')
    {
        AdditiveHitReactionAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(AdditiveHitReactionAnimInfo.AnimNodeSlotName));
    }
    // End:0x18C
    if(AdditiveHitBlenderName != 'None')
    {
        AdditiveHitBlenderNode = LPAnimNode_AdditiveHitBlender(SkelComp.FindAnimNode(AdditiveHitBlenderName));
    }
    // End:0x213
    if(bTrackAimStateNodesThatDelayFiring)
    {
        AimStateNodesThatDelayFiring.Length = 0;
        // End:0x212
        foreach Mesh.AllAnimNodes(Class'LPAnimNodeBlendByAimState', AimStateNode)
        {
            // End:0x211
            if(AimStateNode.bCanDelayFiring)
            {
                AimStateNodesThatDelayFiring.AddItem(AimStateNode);                
            }            
        }        
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x39
    if(DamageReactionManager != none)
    {
        DamageReactionManager.InitWithPawn(self);
    }
    SetLodForInGame();
    SetRadarIconState(0);
    // End:0x78
    if(int(Role) == int(ROLE_Authority))
    {
        ReplicatedName = string(Name);
    }
    // End:0xAD
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        bSmoothSlopeMovement = false;
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataPawn = LPTuneDataPawn(TuneData);
    RagdollImpulseScale = TuneDataPawn.RagdollImpulseScale;
    RagdollRadialImpulseScale = TuneDataPawn.RagdollRadialImpulseScale;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WorldAimVec;

    // End:0x66
    if(VarName == 'WorldAimDir')
    {
        // End:0x63
        if(AimController != none)
        {
            WorldAimVec = Vector(WorldAimDir);
            AimController.ForceWorldAimDir(WorldAimVec);
        }        
    }
    else
    {
        // End:0x106
        if(VarName == 'bPlayWeaponChargeUpEffect')
        {
            // End:0x103
            if(LPWeapon(self.Weapon) != none)
            {
                // End:0xDA
                if(bPlayWeaponChargeUpEffect)
                {
                    LPWeapon(Weapon).PlayWeaponChargeUpEffect();                    
                }
                else
                {
                    LPWeapon(Weapon).StopWeaponChargeUpEffect();
                }
            }            
        }
        else
        {
            // End:0x1A5
            if(VarName == 'bPlayWeaponFullyChargedEffect')
            {
                // End:0x1A2
                if(LPWeapon(self.Weapon) != none)
                {
                    // End:0x17A
                    if(bPlayWeaponFullyChargedEffect)
                    {
                        LPWeapon(Weapon).PlayWeaponFullyChargedEffect();                        
                    }
                    else
                    {
                        LPWeapon(Weapon).StopWeaponFullyChargedEffect();
                    }
                }                
            }
            else
            {
                // End:0x1C9
                if(VarName == 'EMPInfo')
                {
                    HandleEMP();                    
                }
                else
                {
                    super.ReplicatedEvent(VarName);
                }
            }
        }
    }
    //return;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array NodeNames, Nodes;

    super(SPInventoryPawn).InitAnimTemplates();
    // End:0x87
    if(HitReactLogicAnimTree != none)
    {
        NodeNames.AddItem(ATL_AdditiveHitReaction_Name);        
        HitReactLogicAnimTree.FindAnimNodes(NodeNames, Nodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        ATL_AdditiveHitReaction = LPAnimNodeTemplateLogicNamedRoot(Nodes[0]);
    }
    //return;    
}

event EncroachedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

function gibbedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

function HasRoomInInventory()
{
    local /*0x97E50000-0x00000000*/ private class UniqueClass[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    none
    return true;
    //return ReturnValue;    
}

simulated function @NULL StartAttachedFX()
{
    local /*0x97E50000-0x00000000*/ private @NULL Template[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609];
    local /*0x97E50000-0x00000000*/ private bool inIsLooping[9437185];
    local /*0x97E50000-0x00000000*/ private float Duration[9437185];
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], ThePool, NewEffect, PSComp;

    false
    16777220.0000000
    // End:0x1F
    if(Template == none)
    {
        return none;
    }
    ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
    PSComp = ThePool.SPSpawnEmitterMeshAttachment(Template, Mesh, AttachSocket, true);
    // End:0xA8
    if(PSComp == none)
    {
        return none;
    }
    // End:0x183
    if(inIsLooping)
    {
        NewEffect.Emitter = PSComp;
        // End:0xFE
        if(AttachedEffects.Length == 0)
        {
            SetTimer(0.0100000, true, 'UpdateAttachedFX');
        }
        NewEffect.AttachSocket = AttachSocket;
        NewEffect.EndTime = Duration + WorldInfo.TimeSeconds;
        AttachedEffects.AddItem(NewEffect);                
    }
    else
    {
        PSComp.ActivateSystem();
    }
    return PSComp;
    //return ReturnValue;    
}

simulated function UpdateAttachedFX()
{
    local /*0x97E50000-0x00000000*/ private int Idx, End;
    local /*0x97E50000-0x00000000*/ private @NULL FX;
    local /*0x97E50000-0x00000000*/ private float CurrentTime;

    CurrentTime = WorldInfo.TimeSeconds;
    Idx = 0;
    End = AttachedEffects.Length;
    J0x47:

    // End:0x111 [Loop If]
    if(Idx < End)
    {
        FX = AttachedEffects[Idx];
        // End:0x103
        if(CurrentTime > FX.EndTime)
        {
            FX.Emitter.DeactivateSystem();
            AttachedEffects[Idx] = AttachedEffects[--End];            
        }
        else
        {
            ++Idx;
        }
        // [Loop Continue]
        goto J0x47;
    }
    // End:0x152
    if(End < AttachedEffects.Length)
    {
        AttachedEffects.Remove(End, AttachedEffects.Length - End);        
    }
    // End:0x175
    if(End == 0)
    {
        ClearTimer('UpdateAttachedFX');
    }
    //return;    
}

simulated function @NULL StopAttachedFX()
{
    local /*0x97E50000-0x00000400*/ private @NULL inAttachedFX[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xB8 [Loop If]
    if(Idx < AttachedEffects.Length)
    {
        // End:0xAA
        if(AttachedEffects[Idx].Emitter == inAttachedFX)
        {
            AttachedEffects[Idx].Emitter.DeactivateSystem();
            AttachedEffects.Remove(Idx, 1);            
            return;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function StopAllAttachedFX()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x6D [Loop If]
    if(Idx < AttachedEffects.Length)
    {
        AttachedEffects[Idx].Emitter.DeactivateSystem();
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    AttachedEffects.Length = 0;
    //return;    
}

static function CreatePartsInventoryCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array PartsRecords[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL InPawnToSave[8519681], InInvManager;
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array SavedClassesRefsToPreventFromGC[26214401], SavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL DefaultInvRecord, InvRecord, InvParts;

    false        
    PartsRecords.Length = 0;
    // End:0x24
    if(InInvManager == none)
    {
        return;
    }
    // End:0xE2
    foreach InInvManager.InventoryActors(Class'LPInventoryParts', InvParts)
    {
        InvRecord = DefaultInvRecord;
        InvParts.CreateCheckpointRecord(InvRecord);
        PartsRecords.AddItem(InvRecord);        
        // End:0xE1
        if(bPreventSavedClassesAndAssetsFromGC)
        {
            SavedClassesRefsToPreventFromGC.AddItem(InvParts.Class);            
        }        
    }    
    //return;    
}

static function ApplyPartsInventoryCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array PartsRecords[8519681];
    local /*0x97E50000-0x00000000*/ private @NULL PawnToApply[8388609], InvManagerToApply;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL InvItem, InvRecord, ExistingInv;

    // End:0x11
    if(InvManagerToApply == none)
    {
        return;
    }
    // End:0x17C
    foreach PartsRecords(InvRecord)
    {
        InvClass = class<Inventory>(FindObject(InvRecord.SPPartsRecord.InventoryClassPath, Class'Core.Class'));
        // End:0x8F
        if(InvClass == none)
        {            
        }
        else
        {
            ExistingInv = LPInventoryParts(InvManagerToApply.FindInventoryType(InvClass, true));
            // End:0x153
            if(ExistingInv == none)
            {
                InvItem = LPInventoryParts(InvManagerToApply.CreateInventory(InvClass));
                // End:0x128
                if(InvItem == none)
                {                    
                }
                else
                {
                    InvItem.ApplyCheckpointRecord(InvRecord);
                }                
            }
            else
            {
                ExistingInv.ApplyCheckpointRecord(InvRecord);
            }
        }        
    }    
    //return;    
}

static function CreateTEnergyInventoryCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecord[25165825], InPawnToSave, InInvManager;
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array SavedClassesRefsToPreventFromGC[26214401], SavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecordDefault, CurrTEnergyInv;

    false        
    TEnergyRecord = TEnergyRecordDefault;
    // End:0x2B
    if(InInvManager == none)
    {
        return;
    }
    CurrTEnergyInv = LPThermalEnergy(InInvManager.FindInventoryType(Class'LPThermalEnergy', true));
    // End:0xD6
    if(CurrTEnergyInv != none)
    {
        CurrTEnergyInv.CreateCheckpointRecord(TEnergyRecord);
        // End:0xD6
        if(bPreventSavedClassesAndAssetsFromGC)
        {
            SavedClassesRefsToPreventFromGC.AddItem(CurrTEnergyInv.Class);            
        }
    }
    //return;    
}

static function ApplyTEnergyInventoryCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecord[25296897], PawnToApply, InvManagerToApply;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL ExistingInv, InvItem;

    // End:0x25
    if(TEnergyRecord.InventoryClassPath == "")
    {
        return;
    }
    // End:0x36
    if(InvManagerToApply == none)
    {
        return;
    }
    InvClass = class<Inventory>(FindObject(TEnergyRecord.InventoryClassPath, Class'Core.Class'));
    // End:0x89
    if(InvClass == none)
    {
        return;
    }
    ExistingInv = LPThermalEnergy(InvManagerToApply.FindInventoryType(InvClass, true));
    // End:0x14D
    if(ExistingInv == none)
    {
        InvItem = LPThermalEnergy(InvManagerToApply.CreateInventory(InvClass));
        // End:0x122
        if(InvItem == none)
        {            
        }
        else
        {
            InvItem.ApplyCheckpointRecord(TEnergyRecord);
        }        
    }
    else
    {
        ExistingInv.ApplyCheckpointRecord(TEnergyRecord);
    }
    //return;    
}

static function CreateTEnergyFannyPackInventoryCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecord[25165825], InPawnToSave, InInvManager;
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array SavedClassesRefsToPreventFromGC[26214401], SavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecordDefault, CurrTEnergyInv;

    false        
    TEnergyRecord = TEnergyRecordDefault;
    // End:0x2B
    if(InInvManager == none)
    {
        return;
    }
    CurrTEnergyInv = LPThermalEnergyFannyPack(InInvManager.FindInventoryType(Class'LPThermalEnergyFannyPack', true));
    // End:0xD6
    if(CurrTEnergyInv != none)
    {
        CurrTEnergyInv.CreateCheckpointRecord(TEnergyRecord);
        // End:0xD6
        if(bPreventSavedClassesAndAssetsFromGC)
        {
            SavedClassesRefsToPreventFromGC.AddItem(CurrTEnergyInv.Class);            
        }
    }
    //return;    
}

static function ApplyTEnergyFannyPackInventoryCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecord[25296897], PawnToApply, InvManagerToApply;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL ExistingInv, InvItem;

    // End:0x25
    if(TEnergyRecord.InventoryClassPath == "")
    {
        return;
    }
    // End:0x36
    if(InvManagerToApply == none)
    {
        return;
    }
    InvClass = class<Inventory>(FindObject(TEnergyRecord.InventoryClassPath, Class'Core.Class'));
    // End:0x89
    if(InvClass == none)
    {
        return;
    }
    ExistingInv = LPThermalEnergyFannyPack(InvManagerToApply.FindInventoryType(InvClass, true));
    // End:0x14D
    if(ExistingInv == none)
    {
        InvItem = LPThermalEnergyFannyPack(InvManagerToApply.CreateInventory(InvClass));
        // End:0x122
        if(InvItem == none)
        {            
        }
        else
        {
            InvItem.ApplyCheckpointRecord(TEnergyRecord);
        }        
    }
    else
    {
        ExistingInv.ApplyCheckpointRecord(TEnergyRecord);
    }
    //return;    
}

static function LPCreatePawnCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private bool bSaveLPRecordOnly[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnRecord[25165825], InPawnToSave, InController;
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array SavedClassesRefsToPreventFromGC[26214401], SavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private @NULL LPVSPawn, PartsInvManager;

    none
    false        
    // End:0x84
    if(!bSaveLPRecordOnly)
    {
        Class'SPGameFramework.SPGFCoverPawn'.static.SPGFCreatePawnCheckpointRecord(PawnRecord.SPPawnRecord, InPawnToSave, InController, bPreventSavedClassesAndAssetsFromGC, SavedClassesRefsToPreventFromGC, SavedObjectRefsToPreventFromGC);
    }
    LPVSPawn = LPVSPlayerPawn(InPawnToSave);
    // End:0xDA
    if(LPVSPawn != none)
    {
        PartsInvManager = LPVSPawn.PartsInvManager;        
    }
    else
    {
        // End:0x111
        if(InPawnToSave != none)
        {
            PartsInvManager = InPawnToSave.InvManager;
        }
    }
    // End:0x21D
    if(LPPlayerPawn(InPawnToSave) != none)
    {
        // End:0x1D9
        if((InPawnToSave.Weapon != none) && LPInventoryWeaponNone(InPawnToSave.Weapon) == none)
        {
            PawnRecord.LastEquippedWeaponClassName = PathName(InPawnToSave.Weapon.Class);            
        }
        else
        {
            PawnRecord.LastEquippedWeaponClassName = LPPlayerPawn(InPawnToSave).LastEquippedWeaponClassName;
        }
    }
    // End:0x295
    if(PartsInvManager != none)
    {
        Class'LPPawn'.static.CreatePartsInventoryCheckpointRecord(PawnRecord.PartsInventory, InPawnToSave, PartsInvManager, bPreventSavedClassesAndAssetsFromGC, SavedClassesRefsToPreventFromGC, SavedObjectRefsToPreventFromGC);
    }
    // End:0x3C6
    if((InPawnToSave != none) && InPawnToSave.InvManager != none)
    {
        Class'LPPawn'.static.CreateTEnergyInventoryCheckpoint(PawnRecord.TEnergyRecord, InPawnToSave, InPawnToSave.InvManager, bPreventSavedClassesAndAssetsFromGC, SavedClassesRefsToPreventFromGC, SavedObjectRefsToPreventFromGC);
        Class'LPPawn'.static.CreateTEnergyFannyPackInventoryCheckpoint(PawnRecord.TEnergyFannyPackRecord, InPawnToSave, InPawnToSave.InvManager, bPreventSavedClassesAndAssetsFromGC, SavedClassesRefsToPreventFromGC, SavedObjectRefsToPreventFromGC);
    }
    //return;    
}

static function LPApplyPawnCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private bool bApplyLPRecordOnly[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnRecord[25296897], PawnToApply;
    local /*0x97E50000-0x00000000*/ private bool bPossessRestoredPawn[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL InController[9437185];
    local /*0x97E50000-0x00000000*/ private bool bDoNotRestoreBase[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPHumanPlayer, LPVSPawn, PartsInvManager;

    none            
    // End:0x82
    if(!bApplyLPRecordOnly)
    {
        PawnToApply = Class'SPGameFramework.SPGFCoverPawn'.static.SPGFApplyPawnCheckpointRecord(PawnRecord.SPPawnRecord, PawnToApply, bPossessRestoredPawn, InController, bDoNotRestoreBase);
    }
    // End:0x2D3
    if(PawnToApply != none)
    {
        LPVSPawn = LPVSPlayerPawn(PawnToApply);
        // End:0xE7
        if(LPVSPawn != none)
        {
            PartsInvManager = LPVSPawn.PartsInvManager;            
        }
        else
        {
            PartsInvManager = PawnToApply.InvManager;
        }
        // End:0x16B
        if(PartsInvManager != none)
        {
            Class'LPPawn'.static.ApplyPartsInventoryCheckpointRecord(PawnRecord.PartsInventory, PawnToApply, PartsInvManager);
        }
        Class'LPPawn'.static.ApplyTEnergyInventoryCheckpoint(PawnRecord.TEnergyRecord, PawnToApply, PawnToApply.InvManager);
        Class'LPPawn'.static.ApplyTEnergyFannyPackInventoryCheckpoint(PawnRecord.TEnergyFannyPackRecord, PawnToApply, PawnToApply.InvManager);
        LPHumanPlayer = LPPlayerPawn(PawnToApply);
        // End:0x2D3
        if(LPHumanPlayer != none)
        {
            LPHumanPlayer.LastEquippedWeaponClassName = PawnRecord.LastEquippedWeaponClassName;
            LPHumanPlayer.CheckCSAForSwitchToBestWeapon();
            LPHumanPlayer.InitGrenades();
        }
    }
    return PawnToApply;
    //return ReturnValue;    
}

simulated function ReceivedInventoryItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewItem[8388609];

    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, vsPawn, LPCI;

    super(SPPawn).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0xEF
    if(TuneDataPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHit.GetValue() != float(0))
    {
        vsPawn = LPBaseVSPlayerPawn(Other);
        // End:0xEF
        if((vsPawn != none) && TuneDataPawn.bAllowVsKnockBackHitOnTouch.GetValue() != float(0))
        {
            VsHitMe(vsPawn, HitNormal);
        }
    }
    // End:0x14A
    foreach CourierItems(LPCI)
    {
        LPCI.Touch(Other, OtherComp, HitLocation, HitNormal);        
    }    
    //return;    
}

simulated event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPCI;

    super(SPPawn).UnTouch(Other);
    // End:0x53
    foreach CourierItems(LPCI)
    {
        LPCI.UnTouch(Other);        
    }    
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, vsPawn;

    super.Bump(Other, OtherComp, HitNormal);
    // End:0xE6
    if(TuneDataPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHit.GetValue() != float(0))
    {
        vsPawn = LPBaseVSPlayerPawn(Other);
        // End:0xE6
        if((vsPawn != none) && TuneDataPawn.bAllowVsKnockBackHitOnBump.GetValue() != float(0))
        {
            VsHitMe(vsPawn, HitNormal);
        }
    }
    //return;    
}

function VsHitMe()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609], HitNormal;
    local /*0x97E50000-0x00000000*/ private bool FastHit;

    // End:0x49D
    if(VSize2D(TheVs.Velocity) > TuneDataPawn.MinVelocityForVsToCountAsKnockBackHit.GetValue())
    {
        // End:0x49D
        if((WorldInfo.TimeSeconds - LastTimeBumpedByVs) > TuneDataPawn.DelayBetweenAllowedVsKnockBackHits.GetValue())
        {
            LastTimeBumpedByVs = WorldInfo.TimeSeconds;
            FastHit = VSize2D(TheVs.Velocity) > TuneDataPawn.SpeedToUseLargeReactionWhenHitByVS.GetValue();
            // End:0x25E
            if(FastHit)
            {
                TakeDamage(int(TuneDataPawn.DamageToThisTypeOfPawnFromFastVsKnockBackHit.GetValue()), TheVs.Controller, Location, (-VSize2D(TheVs.Velocity) * HitNormal) * TuneDataPawn.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit.GetValue(), TuneDataPawn.DamageTypeFromFastVsKnockBackHit,, TheVs);                
            }
            else
            {
                TakeDamage(int(TuneDataPawn.DamageToThisTypeOfPawnFromSlowVsKnockBackHit.GetValue()), TheVs.Controller, Location, (-VSize2D(TheVs.Velocity) * HitNormal) * TuneDataPawn.MomentumFactorToThisTypeOfPawnFromSlowVsKnockBackHit.GetValue(), TuneDataPawn.DamageTypeFromSlowVsKnockBackHit,, TheVs);
            }
            // End:0x49D
            if((Health <= 0) && ClassIsChildOf(TheVs.Controller.Class, Class'Engine.PlayerController'))
            {
                // End:0x42C
                if(FastHit)
                {
                    PlayerController(TheVs.Controller).ClientPlayForceFeedbackWaveform(TheVs.TuneDataVSPlayerPawn.FastBumpKillFFWaveform);                    
                }
                else
                {
                    PlayerController(TheVs.Controller).ClientPlayForceFeedbackWaveform(TheVs.TuneDataVSPlayerPawn.SlowBumpKillFFWaveform);
                }
            }
        }
    }
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0x11
    if(OtherComponent == none)
    {
        return;
    }
    // End:0x10F
    if(TuneDataPawn.bAllowTheVsToDamageThisTypeOfPawnOnMovementHit.GetValue() != float(0))
    {
        vsPawn = LPBaseVSPlayerPawn(OtherComponent.Owner);
        // End:0x10F
        if((vsPawn != none) && TuneDataPawn.bAllowVsKnockBackHitOnBump.GetValue() != float(0))
        {
            VsHitMe(vsPawn, RigidCollisionData.ContactInfos[0].ContactNormal);
        }
    }
    //return;    
}

function SetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    //return;    
}

simulated function IsInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event StopRightArmPartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAbrupt[9437185];
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    false
    0.2500000
    //return;    
}

simulated function PlayAnimationSequenceOnBodyPart()
{
    local /*0x97E50000-0x00000000*/ private byte BodyPart[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params[25296897], ReturnValue;

    return none;
    //return ReturnValue;    
}

simulated function PlayAdditiveHitReactionAnimationSequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL SequenceTemplate[8519681];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EndDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private int InUserData[9437185];
    local /*0x97E50000-0x00000000*/ private float Rate[9437185], BlendInTime, BlendOutTime;
    local /*0x97E50000-0x00000000*/ private bool bLooping[9437185], bOverride;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    None
    0
    1.0000000
    0.2000000
    0.2000000
    false
    true
    // End:0x132
    if(AdditiveHitReactionAnimInfo.AnimNodeSlot != none)
    {
        // End:0xAE
        if(AdditiveHitBlenderNode != none)
        {
            AdditiveHitBlenderNode.SetAdditiveStrength(SequenceTemplate.Rate);
        }
        return AdditiveHitReactionAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(EndDelegate, InUserData, SequenceTemplate, Rate, BlendInTime, BlendOutTime, bLooping, bOverride);        
    }
    else
    {
        return PlayAdditiveAnimationSequence(SequenceTemplate, EndDelegate, InUserData, Rate, BlendInTime, BlendOutTime, bLooping, bOverride);
    }
    //return ReturnValue;    
}

simulated function StopAnimationSequenceOnPart()
{
    local /*0x97E50000-0x00000000*/ private byte BodyPart[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    0.2500000
    //return;    
}

reliable server function ServerDoTraceDamageOnShieldFracture()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFractureDamageInfo[8388609];

    //return;    
}

reliable server function ServerDoTraceDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];

    //return;    
}

function SetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];

    //return;    
}

function NotifyArmDrill()
{
    //return;    
}

function NotifyArmSaw()
{
    //return;    
}

reliable server function ServerFireWinchProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private class WinchProjClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609], vel;
    local /*0x97E50000-0x00000000*/ private float Time[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Rot[8388609];

    //return;    
}

function NotifyTraceDamagePartHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private int AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609];

    //return;    
}

simulated function PlayTakeDamageEffects()
{
    super(SPPawn).PlayTakeDamageEffects();
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayTakeDamageEffects, self);
    // End:0x7E
    if((int(Role) == int(ROLE_Authority)) || IsLocallyControlled())
    {
        HealthRegenInfo.HealthRegenDelayTimer = GetHealthRegenDelay();
    }
    // End:0xCF
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeDNATag'))
    {
        ConditionalAttachDNATag(TakeDamageParams.HitLocation);
    }
    // End:0x13E
    if(((int(Role) == int(ROLE_Authority)) && TakeDamageParams.InstigatedByPawn != none) && ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeTENGDriller'))
    {
        HandleTENGDriller();
    }
    //return;    
}

simulated function ShowGrenades()
{
    local /*0x97E50000-0x00000000*/ private int Count[8388609];
    local /*0x97E50000-0x00000000*/ private class GrenadeClass[9437185];

    //return;    
}

simulated function StartGrenadeMovement()
{
    TemplateLogicData.bThrowingGrenade = true;
    SetTurnInPlaceSpineControlStrength(1.0000000, 1.0000000);
    //return;    
}

simulated function EndGrenadeMovement()
{
    TemplateLogicData.bThrowingGrenade = false;
    SetTurnInPlaceSpineControlStrength(0.0000000);
    //return;    
}

simulated event GetGrenade()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x2D
    if(Controller != none)
    {
        return LPWeaponGrenade(FindInventoryType(Class'LPWeaponGrenade', true));
    }
    return none;
    //return ReturnValue;    
}

simulated function NotifyAttachGrenade()
{
    // End:0x76
    if(((GetGrenade()) != none) && LPSM_GrenadePrime(GetCurrentSpecialMoveInstance()) != none)
    {
        GetGrenade().AttachGrenadeMesh();
        LPSM_GrenadePrime(GetCurrentSpecialMoveInstance()).bGrenadeAttached = true;
    }
    //return;    
}

simulated function NotifyGrenadeCanQuickRelease()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_GrenadeCanQuickRelease, self);
    //return;    
}

simulated function NotifyGrenadeReleased()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    GrenadeWeapon = GetGrenade();
    // End:0x66
    if((GrenadeWeapon != none) && GrenadeWeapon.IsPrimed())
    {
        GrenadeWeapon.ThrowGrenade();
    }
    SetGrenade360DegreeSkelControlStrength(0.0000000);
    //return;    
}

simulated function UpdateGrenadeHold()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade;

    Grenade = GetGrenade();
    // End:0x4C
    if(Grenade != none)
    {
        Grenade.ReattachGrenadeMesh(bIsMirrored);
    }
    //return;    
}

simulated function NotifySwapGrenadeHand()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade;

    Grenade = GetGrenade();
    // End:0x4C
    if(Grenade != none)
    {
        Grenade.ReattachGrenadeMesh(bIsMirrored);
    }
    //return;    
}

simulated function PauseGrenadeHold()
{
    local /*0x97E50000-0x00000000*/ private @NULL SM;

    SM = LPSM_GrenadePrime(GetCurrentSpecialMoveInstance());
    // End:0x4B
    if(SM != none)
    {
        SM.PauseGrenadeHold();
    }
    //return;    
}

simulated function NotifyGrenadeDropped()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    GrenadeWeapon = GetGrenade();
    // End:0x66
    if((GrenadeWeapon != none) && GrenadeWeapon.IsPrimed())
    {
        GrenadeWeapon.DropGrenade();
    }
    //return;    
}

simulated function NotifyGrenadeAborted()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    GrenadeWeapon = GetGrenade();
    // End:0x66
    if((GrenadeWeapon != none) && GrenadeWeapon.IsPrimed())
    {
        GrenadeWeapon.AbortGrenade();
    }
    //return;    
}

simulated event OnMirrorBlendOutNotify()
{
    local /*0x97E50000-0x00000000*/ private @NULL SM;

    super.OnMirrorBlendOutNotify();
    SM = LPSM_GrenadePrime(GetCurrentSpecialMoveInstance());
    // End:0x55
    if(SM != none)
    {
        SM.ResumeGrenadeHold();
    }
    //return;    
}

simulated function HandleEMP()
{
    // End:0x31
    if(EMPInfo.EMPDuration > float(0))
    {
        StartEMP();        
    }
    else
    {
        StopEMP();
    }
    //return;    
}

simulated function StartEMP()
{
    SetTimer(EMPInfo.EMPDuration, false, 'EndEMPEffect');
    //return;    
}

simulated function StopEMP()
{
    // End:0x35
    if(IsTimerActive('EndEMPEffect'))
    {
        ClearTimer('EndEMPEffect');
        EndEMPEffect();
    }
    //return;    
}

simulated function EndEMPEffect()
{
    EMPInfo.EMPRepCount++;
    EMPInfo.EMPDuration = 0.0000000;
    //return;    
}

simulated function GetDefaultEMPDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TuneDataPawn.EMPDisruptionDuration.GetValue();
    //return ReturnValue;    
}

simulated function NotifyEmpShutdownInstigatorShutdownOver()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRecovering[8388609];

    //return;    
}

simulated function GetTENGDrillerExtractAmount()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillerTuneData[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0xBF
    if(TuneDataPawn != none)
    {
        return DrillerTuneData.DrainMultiplier.GetValue() * (TuneDataPawn.AmountToDrainPerDrillerShot.GetValue() + (((FRand() * float(2)) - float(1)) * TuneDataPawn.AmountToDrainPerDrillerShotVariance.GetValue()));
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function ExtractDrilledTENG()
{
    local /*0x97E50000-0x00000000*/ private float EnergyAmount[8388609];

    //return;    
}

simulated function HandleTENGDriller()
{
    local /*0x97E50000-0x00000000*/ private float EnergyAmount, RecieveDelay;
    local /*0x97E50000-0x00000000*/ private @NULL DrillerPawn, DrillerTD;

    DrillerPawn = LPPlayerPawn(TakeDamageParams.InstigatedByPawn);
    // End:0x1C7
    if(DrillerPawn != none)
    {
        DrillerTD = LPTuneDataAmmoTENGDriller(SPInventoryWeapon(DrillerPawn.Weapon).TuneDataBaseWeapon.SupportedAmmoTypes[1]);
        // End:0x1C7
        if(DrillerTD != none)
        {
            EnergyAmount = GetTENGDrillerExtractAmount(DrillerTD);
            // End:0x1C7
            if(EnergyAmount > 0.0000000)
            {
                ExtractDrilledTENG(EnergyAmount);
                RecieveDelay = DrillerTD.RecieveDelay;
                // End:0x196
                if(DrillerTD.bScaleRecieveDelayByDistance)
                {
                    RecieveDelay *= (VSize(DrillerPawn.Location - Location) / DrillerTD.BaseRecieveDelayDistance);
                }
                DrillerPawn.AddDrilledTENG(EnergyAmount, RecieveDelay);
            }
        }
    }
    //return;    
}

simulated function ConditionalAttachDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];

    // End:0x44
    if((bIsDNATagged || bWasDNATagged) || !TuneDataPawn.bCanBeTagged)
    {
        return;
    }
    bIsDNATagged = true;
    // End:0xB6
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        DNAParticles = TuneDataPawnFXEventBindings.PlayEventFX('DNATag', self, Mesh, none);
    }
    // End:0x1A7
    if(DNAParticles != none)
    {
        NearestDNABoneName = Mesh.FindClosestBone(HitLocation);
        DNAParticles.SetAbsolute(true);
        DNAParticles.SetScale(10.0000000);
        DNAParticles.SetTranslation(Mesh.GetBoneLocation(NearestDNABoneName));
        DNAParticles.ActivateSystem(true);
    }
    //return;    
}

simulated function GetLastRenderTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Mesh.LastRenderTime;
    //return ReturnValue;    
}

simulated function TimeSinceLastRendered()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return WorldInfo.TimeSeconds - (GetLastRenderTime());
    //return ReturnValue;    
}

simulated function HasNotBeenRenderedForTime()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (TimeSinceLastRendered()) > inTime;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x220
    if(((int(EventInstigator.GetTeamNum()) != int(GetTeamNum())) && ClassIsChildOf(DamageType, Class'LPDamageType')) && class<LPDamageType>(DamageType).default.bCausesEMP)
    {
        EMPInfo.EMPRepCount++;
        EMPInfo.EMPDamageType = DamageType;
        EMPInfo.EMPInstigator = LPPawn(EventInstigator.Pawn);
        EMPInfo.EMPDuration = GetDefaultEMPDuration();
        // End:0x216
        if((ClassIsChildOf(DamageType, Class'LPDamageTypeHalberdEMP') && EMPInfo.EMPInstigator != none) && LPWeaponHalberd(EMPInfo.EMPInstigator.Weapon) != none)
        {
            EMPInfo.EMPDuration *= LPWeaponHalberd(EMPInfo.EMPInstigator.Weapon).GetEMPIncreasedDuration();
        }
        HandleEMP();
    }
    super(SPPawn).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = Class'SPEngine.SPUtil'.static.GetFilteredDamageFactorIndex(TuneDataBasePawn.DamageFilterInfo, TakeDamageParams.DamageType);
    // End:0xB9
    if((Idx >= 0) && TuneDataBasePawn.DamageFilterInfo[Idx].DamageFactor <= float(0))
    {
        return false;
    }
    return super(SPAIPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function NotifyMeleeAnimStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0xB8
    foreach WorldInfo.AllControllers(Class'LPAIController', AICtrl)
    {
        // End:0x97
        if((AICtrl.Pawn == none) || AICtrl.Pawn.Health <= 0)
        {
            continue;            
        }
        AICtrl.NotifyPlayerStartMelee(self);        
    }    
    // End:0xFB
    if(IsLocallyControlled())
    {
        LPPlayerController(Controller).StopFire();
        bPendingFire = false;
    }
    //return;    
}

function ReplicateTakeDamageEffects()
{
    // End:0x2E
    if(DamageReactionManager != none)
    {
        DamageReactionManager.ReplicateTakeDamageEffects();
    }
    super(SPPawn).ReplicateTakeDamageEffects();
    //return;    
}

function HandleMomentum()
{
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];

    Momentum.Z = 0.0000000;
    // End:0x3A
    if(VSizeSq(Momentum) <= 1.1000000)
    {
        return;
    }
    super(Pawn).HandleMomentum(Momentum, HitLocation, DamageType, HitInfo);
    //return;    
}

function AddVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewVelocity[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];
    local /*0x97E50000-0x00000000*/ private class LPDT;

    LPDT = class<LPDamageType>(DamageType);
    // End:0x54
    if((LPDT == none) || !LPDT.default.bAllowMomentumTransfer)
    {
        return;
    }
    super(Pawn).AddVelocity(NewVelocity, HitLocation, DamageType, HitInfo);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    LPPawnTick(DeltaTime);
    //return;    
}

simulated function SetRadarIconState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    PrevRadarIconState = RadarIconState;
    RadarIconState = NewState;
    // End:0x46
    if(int(RadarIconState) == int(0))
    {
        RadarIconState = 1;
    }
    //return;    
}

final simulated function GetRadarIconState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return RadarIconState;
    //return ReturnValue;    
}

simulated function PutWeaponAway()
{
    local /*0x97E50000-0x00000000*/ private name SlotName[8388609];

    AimNodeInfo.EndWantsToAimTime = WorldInfo.TimeSeconds;
    super(SPInventoryPawn).PutWeaponAway(SlotName);
    //return;    
}

final simulated event ScriptServerSetWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private int Pitch[8388609], Yaw;

    ServerSetWorldAimDir(Pitch, Yaw);
    //return;    
}

final simulated event ScriptServerSetAimState()
{
    local /*0x97E50000-0x00000000*/ private byte NewAimState[8388609];

    ServerSetAimState(NewAimState);
    //return;    
}

// Export ULPPawn::execSimulateUpdateAimNodeInfo(FFrame&, void* const)
native function SimulateUpdateAimNodeInfo();

// Export ULPPawn::execGetBestAimContext(FFrame&, void* const)
native simulated function GetBestAimContext()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPPawn::execGetBestAimZone(FFrame&, void* const)
native simulated function GetBestAimZone()
{
    local /*0x97E50000-0x00000000*/ private float YawDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPPawn::execIsValidAimZone(FFrame&, void* const)
native simulated function IsValidAimZone()
{
    local /*0x97E50000-0x00000000*/ private int ContextIndex[8388609], ZoneIndex;
    local /*0x97E50000-0x00000000*/ private @NULL W[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated exec event ForceAimZone()
{
    local /*0x97E50000-0x00000000*/ private byte Zone[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    ForcedAimZone.EndForceTime = WorldInfo.TimeSeconds + Duration;
    ForcedAimZone.AimZoneType = Zone;
    // End:0x14D
    if(int(ForcedAimZone.AimZoneType) == int(1))
    {
        // End:0xDF
        if(int(AimNodeInfo.AimState) == int(2))
        {
            ForcedAimZone.OutOfRangeHint = -1.0000000;            
        }
        else
        {
            // End:0x12B
            if(int(AimNodeInfo.AimState) == int(3))
            {
                ForcedAimZone.OutOfRangeHint = 1.0000000;                
            }
            else
            {
                ForcedAimZone.OutOfRangeHint = 0.0000000;
            }
        }
    }
    //return;    
}

// Export ULPPawn::execCanUseAimZone(FFrame&, void* const)
native simulated function CanUseAimZone()
{
    local /*0x97E50000-0x00000000*/ private int AimContextIndex[8388609], AimZoneIndex;
    local /*0x97E50000-0x00000000*/ private float YawDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPawn::execIsInAimZone(FFrame&, void* const)
native simulated function IsInAimZone()
{
    local /*0x97E50000-0x00000000*/ private int AimContextIndex[8388609], AimZoneIndex;
    local /*0x97E50000-0x00000000*/ private float YawDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event HandleNotifyPlayerDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private byte AttackType[8388609], DodgePhase;
    local /*0x97E50000-0x00000000*/ private @NULL InEnemyToNotify[8388609];

    //return;    
}

event HandleNotifyShowProp()
{
    local /*0x97E50000-0x00000000*/ private bool ShowProp[8388609];
    local /*0x97E50000-0x00000000*/ private byte PropType[8388609];

    //return;    
}

simulated function NotifyFreezeComplete()
{
    // End:0x31
    if(TuneDataPawn.bDropTEnergyOnFreeze)
    {
        DropThermalEnergy();
    }
    //return;    
}

function DropThermalEnergy()
{
    local /*0x97E50000-0x00000000*/ private float DropAmount[9437185];
    local /*0x97E50000-0x00000000*/ private int DropCount[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL DropOffset[9437185], DropVelocity, EnergyPool, TE;
    local /*0x97E50000-0x00000000*/ private class TEClass;
    local /*0x97E50000-0x00000000*/ private @NULL PC, DropLocation;

    0.0000000
    0
    vect(0.0000000, 0.0000000, 0.0000000)
    vect(0.0000000, 0.0000000, 0.0000000)
    none
    // End:0x46
    if(!bCanDropTEnergy)
    {
        return;
    }
    // End:0x95
    if(TuneDataPawn.TEnergyContentClass != none)
    {
        TEClass = TuneDataPawn.TEnergyContentClass;        
    }
    else
    {
        PC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
        // End:0x114
        if(PC != none)
        {
            TEClass = PC.ThermalEnergyClass;
        }
    }
    // End:0x1DA
    if(TEClass != none)
    {
        TE = Spawn(TEClass);
        // End:0x1DA
        if(TE != none)
        {
            DropLocation = ((IsZero(TEnergyDropLocation)) ? Location + DropOffset : TEnergyDropLocation);
            TE.ManualDrop(DropLocation, DropVelocity, DropAmount, DropCount, EnergyPool);
        }
    }
    //return;    
}

simulated function AddThermalEnergy()
{
    local /*0x97E50000-0x00000000*/ private float energy[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPlayFX[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TE;

    true
    // End:0x9C
    if(InvManager != none)
    {
        TE = LPThermalEnergy(SPInventoryManager(InvManager).FindInventoryType(Class'LPThermalEnergy', true));
        // End:0x9C
        if(TE != none)
        {
            return TE.AddEnergy(energy, bPlayFX);
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

function AddCourierItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x36
    if(CourierItems.Find(CourierItem) == )
    {        
        CourierItems.AddItem(CourierItem);        
    }
    //return;    
}

function RemoveCourierItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    CourierItems.RemoveItem(CourierItem);    
    //return;    
}

function UpdateCourierItems()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPCI;

    // End:0x37
    foreach CourierItems(LPCI)
    {
        LPCI.UpdateCarrier();        
    }    
    //return;    
}

function DropCourierItems()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPCI;

    // End:0x73
    foreach CourierItems(LPCI)
    {
        LPCI.Drop(Location.Z < WorldInfo.KillZ);        
    }    
    UpdateCourierItems();
    //return;    
}

function DeliverCourierItems()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPCI;

    // End:0x38
    foreach CourierItems(LPCI)
    {
        LPCI.TryDeliver(true);        
    }    
    UpdateCourierItems();
    //return;    
}

simulated event AnimNotifyThermalPostPlanted()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(Controller);
    // End:0x2D
    if(LPC == none)
    {
        return;
    }
    LPC.AnimNotifyThermalPostPlanted();
    //return;    
}

simulated event AnimNotifyBombPlanted()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(Controller);
    // End:0x2D
    if(LPC == none)
    {
        return;
    }
    LPC.AnimNotifyBombPlanted();
    //return;    
}

simulated event AnimNotifyBombDisarmed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(Controller);
    // End:0x2D
    if(LPC == none)
    {
        return;
    }
    LPC.AnimNotifyBombDisarmed();
    //return;    
}

simulated function @NULL LocalParticleFX()
{
    local /*0x97E50000-0x00000000*/ private name FXEVent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Trans[8388609], Rot, Comp;

    Comp = TuneDataPawnFXEventBindings.PlayEventFX(FXEVent, self, Mesh, none);
    // End:0x9C
    if(Comp != none)
    {
        Comp.SetTranslation(Trans);
        Comp.SetRotation(Rot);
    }
    //return;    
}

simulated function LocalSoundFX()
{
    local /*0x97E50000-0x00000000*/ private name FXEVent[8388609];

    TuneDataPawnSoundEventBindings.PlayEventSoundLocally(FXEVent, 'None', self, none, none);
    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    //return;    
}

simulated function @NULL NotifyOfGrenadeGettingStuckTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo, grenMesh;

    // End:0x278
    if((GrenGettingStuck != none) && !IsPendingKill())
    {
        // End:0x278
        if(PhysMat != none)
        {
            GrenGettingStuck.BoneNameGluedTo = GetNameOfBoneToAttackGrenadeToBasedOnPhysicalMaterial(PhysMat);
            grenMesh = GrenGettingStuck.GetSkeletalMesh();
            // End:0x153
            if(bStopAllPhysicalActionsOfGrenadeOnAttachment)
            {
                GrenGettingStuck.StopSimulating();
                grenMesh.SetHidden(true);
                GrenGettingStuck.SetBase(self,, Mesh, GrenGettingStuck.BoneNameGluedTo);
                GrenGettingStuck.SetHardAttach(true);
                GrenGettingStuck.SetBase(self);
            }
            HitInfo.PhysMaterial = PhysMat;
            HitInfo.BoneName = GrenGettingStuck.BoneNameGluedTo;
            HitInfo.HitComponent = ComponentGrenOn;
            // End:0x206
            if(bITakeOverGrenadeExplosionWhenAttachedToMe)
            {
                GrenGettingStuck.StopExplosionTimer();
            }
            PhysMat.PlayImpactEffects(self, HitInfo, GrenGettingStuck.Location, HitNormal, Class'LPDamageTypeGrenadeActual');
            HandleDamageNotifyForGrenadeAttachment(GrenGettingStuck);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function HandleDamageNotifyForGrenadeAttachment()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL dmgEvent;

    Idx = 0;
    J0x0B:

    // End:0xAE [Loop If]
    if(Idx < GeneratedEvents.Length)
    {
        dmgEvent = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        // End:0xA0
        if(dmgEvent != none)
        {
            dmgEvent.HandleDamage(self, GrenGettingStuck.InstigatorController, Class'LPDamageTypeGrenadeActual', 1);
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function GetNameOfBoneToAttackGrenadeToBasedOnPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMatToTest[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_Defualt';
    //return ReturnValue;    
}

simulated function WeaponFired()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    super.WeaponFired(InWeapon, bViaReplication, HitLocation);
    TriggerEventClass(Class'LPSeqEvent_WeaponFired', self);
    //return;    
}

simulated function WeaponStoppedFiring()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    // End:0x36
    if(SPInventoryWeapon(InWeapon).bIsSemiAuto[0])
    {
        StopAdditiveFireAnimation();
    }
    super(SPInventoryPawn).WeaponStoppedFiring(InWeapon, bViaReplication);
    //return;    
}

simulated function StartAdditiveFireAnimation()
{
    //return;    
}

simulated function StopAdditiveFireAnimation()
{
    //return;    
}

simulated function PlayImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL SourceWeapon, SPPhysMat;

    super(SPPawn).PlayImpactEffects();
    SourceWeapon = SPWeapon(TakeDamageParams.DamageCauser);
    // End:0xF6
    if(SourceWeapon != none)
    {
        SourceWeapon.HandleImpactEffects(TakeDamageParams.HitInfo, TakeDamageParams.HitLocation, TakeDamageParams.HitNormal, TakeDamageParams.Momentum, TakeDamageParams.DamageType);        
    }
    else
    {
        SPPhysMat = SPPhysicalMaterial(TakeDamageParams.HitInfo.PhysMaterial);
        // End:0x1FF
        if((SPPhysMat != none) && TakeDamageParams.DamageType != none)
        {
            SPPhysMat.PlayImpactEffects(self, TakeDamageParams.HitInfo, TakeDamageParams.HitLocation, TakeDamageParams.HitNormal, TakeDamageParams.DamageType);
        }
    }
    //return;    
}

simulated function SetGrabPointEnabledByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    GrabPoints[Index].bEnabledForFreeGrab = bOn && !GrabPoints[Index].bDestroyed;
    //return;    
}

simulated function SetGrabPointEnabledByCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x82 [Loop If]
    if(I < GrabPoints.Length)
    {
        // End:0x74
        if(GrabPoints[I].VulnerableCoreID == CoreID)
        {
            SetGrabPointEnabledByIndex(I, bOn);
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function SetGrabPointDestroyedByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDestroyed[8388609];

    GrabPoints[Index].bDestroyed = bDestroyed;
    // End:0x68
    if(bDestroyed)
    {
        GrabPoints[Index].bEnabledForFreeGrab = false;
    }
    //return;    
}

simulated event IsValidGrabPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (((Index >= 0) && Index < GrabPoints.Length) && !GrabPoints[Index].bDestroyed) && !bForceDisableBeingGrabbed;
    //return ReturnValue;    
}

simulated event FindGrabPointBySocketName()
{
    local /*0x97E50000-0x00000000*/ private name InSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x6F [Loop If]
    if(I < GrabPoints.Length)
    {
        // End:0x61
        if(GrabPoints[I].SocketName == InSocketName)
        {
            return I;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

simulated function OnToggleGrabbableByVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bForceDisableBeingGrabbed = false;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bForceDisableBeingGrabbed = true;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bForceDisableBeingGrabbed = !bForceDisableBeingGrabbed;
            }
        }
    }
    //return;    
}

simulated function SetWinchPointEnabledByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    WinchPoints[Index].bEnabledForWinching = bOn && !WinchPoints[Index].bDestroyed;
    //return;    
}

simulated function SetWinchPointDestroyedByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDestroyed[8388609];

    WinchPoints[Index].bDestroyed = bDestroyed;
    // End:0x68
    if(bDestroyed)
    {
        WinchPoints[Index].bEnabledForWinching = false;
    }
    //return;    
}

simulated event IsValidWinchPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((Index >= 0) && Index < WinchPoints.Length) && !WinchPoints[Index].bDestroyed;
    //return ReturnValue;    
}

simulated function StruggleTakeDamage()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleTakeDamage, self);
    //return;    
}

simulated function StrugglePlayCameraAnim()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StrugglePlayCameraAnim, self);
    //return;    
}

simulated function NotifyWonStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    //return;    
}

simulated function NotifyLostStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    //return;    
}

simulated function NotifySucceedStruggleButtomMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifyFailedStruggleButtomMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifySucceedStruggleWaggleMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifyFailedStruggleWaggleMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifySucceedStruggleAimMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifyFailedStruggleAimMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifyEnddedStruggleDefaultMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function CheckToSeeIfPhaseActionWillResultInLeaderFailingMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function IsWinchPointEnabled()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return WinchPoints[Idx].bEnabledForWinching && !WinchPoints[Idx].bDestroyed;
    //return ReturnValue;    
}

simulated function GetWinchPointCollisionLocation()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Loc;

    // End:0x33
    if((Idx < 0) || Idx >= WinchPoints.Length)
    {
        return Loc;
    }
    // End:0xBA
    if(WinchPoints[Idx].IconSocketName != 'None')
    {
        Mesh.GetSocketWorldLocationAndRotation(WinchPoints[Idx].IconSocketName, Loc);        
    }
    else
    {
        // End:0x141
        if(WinchPoints[Idx].SocketName != 'None')
        {
            Mesh.GetSocketWorldLocationAndRotation(WinchPoints[Idx].SocketName, Loc);            
        }
        else
        {
            Loc = Location;
        }
    }
    return Loc;
    //return ReturnValue;    
}

simulated function GetWinchPointCollisionLocationAndRotation()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825], OutRotation;

    // End:0x8F
    if(WinchPoints[Idx].IconSocketName != 'None')
    {
        Mesh.GetSocketWorldLocationAndRotation(WinchPoints[Idx].IconSocketName, OutLocation, OutRotation);        
    }
    else
    {
        // End:0x11E
        if(WinchPoints[Idx].SocketName != 'None')
        {
            Mesh.GetSocketWorldLocationAndRotation(WinchPoints[Idx].SocketName, OutLocation, OutRotation);            
        }
        else
        {
            OutLocation = Location;
            OutRotation = Rotation;
        }
    }
    //return;    
}

simulated function FindValidWinchPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchProjectile[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Idx;
    local /*0x97E50000-0x00000000*/ private @NULL socketLoc;
    local /*0x97E50000-0x00000000*/ private float Dist;

    Idx = 0;
    J0x0B:

    // End:0xF7 [Loop If]
    if(Idx < WinchPoints.Length)
    {
        // End:0xE9
        if(IsWinchPointEnabled(Idx))
        {
            socketLoc = GetWinchPointCollisionLocation(Idx);
            Dist = VSize(socketLoc - HitLocation);
            // End:0xE9
            if(Dist < (WinchPoints[Idx].Radius + WinchProjectile.CylinderComponent.CollisionRadius))
            {
                return Idx;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

simulated event GetCurrentStruggleModeMaxSinkDepth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentSpecialMove, LeadStruggleMode, FollowerStruggleMode, StruggleTuneData;
    local /*0x97E50000-0x00000000*/ private float MaxSinkDepth;

    CurrentSpecialMove = SpecialMoveState.CurSMInstance;
    FollowerStruggleMode = LPSM_FollowerStruggleMode(CurrentSpecialMove);
    // End:0x101
    if(FollowerStruggleMode != none)
    {
        StruggleTuneData = FollowerStruggleMode.TuneData;
        // End:0xCD
        if(StruggleTuneData != none)
        {
            MaxSinkDepth = StruggleTuneData.MaxSinkDepth;
            // End:0xCD
            if(MaxSinkDepth >= 0.0000000)
            {
                return MaxSinkDepth;
            }
        }
        LeadStruggleMode = LPSM_LeadStruggleMode(FollowerStruggleMode.LeaderSMInstance);        
    }
    else
    {
        LeadStruggleMode = LPSM_LeadStruggleMode(CurrentSpecialMove);
    }
    // End:0x182
    if(LeadStruggleMode != none)
    {
        StruggleTuneData = LeadStruggleMode.TuneData;
        // End:0x182
        if(StruggleTuneData != none)
        {
            return StruggleTuneData.MaxSinkDepth;
        }
    }
    return -1.0000000;
    //return ReturnValue;    
}

simulated function PlayDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x1B
    if(Weapon != none)
    {
        StopFire(0);
    }
    // End:0x66
    if(!BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayDying, self))
    {
        StartDie(DamageType, HitLoc);
    }
    super.PlayDying(DamageType, HitLoc);
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    //return;    
}

final simulated function PlayRagDollDeath()
{
    OnPlayRagDollDeath();
    //return;    
}

function EnableAIResourceManager()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(AIResourceManager != none)
    {
        AIResourceManager.AllowAccess(bEnable);
    }
    //return;    
}

simulated function OnToggleCinematicLod()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x44
    if(inAction.InputLinks[0].bHasImpulse)
    {
        SetLodForCinematic();        
    }
    else
    {
        // End:0x88
        if(inAction.InputLinks[1].bHasImpulse)
        {
            SetLodForInGame();            
        }
        else
        {
            // End:0xA2
            if(bUsingCinematicLod)
            {
                SetLodForInGame();                
            }
            else
            {
                SetLodForCinematic();
            }
        }
    }
    //return;    
}

simulated function SetLodForCinematic()
{
    bUsingCinematicLod = true;
    //return;    
}

simulated function SetLodForInGame()
{
    bUsingCinematicLod = false;
    //return;    
}

function IsRolling()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1B
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRollBase'))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function GetBestAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL InPosition, GoToActor, Best;
    local /*0x97E50000-0x00000000*/ private float mindistsq, DistSq;

    Best = none;
    // End:0x1D6
    if(Requester != none)
    {
        InPosition = Requester.Location;
        mindistsq = 2147484000.0000000;
        I = 0;
        J0x5C:

        // End:0x1D6 [Loop If]
        if(I < AttackVolume.Length)
        {
            // End:0x1C8
            if((AttackVolume[I].TouchingVolume != none) && AttackVolume[I].TouchingVolume.IsAccessPossible(Requester))
            {
                GoToActor = AttackVolume[I].TouchingVolume.GetBestGoToActor(Requester);
                DistSq = VSizeSq(GoToActor.Location - InPosition);
                // End:0x1C8
                if(DistSq < mindistsq)
                {
                    mindistsq = DistSq;
                    Best = AttackVolume[I].TouchingVolume;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x5C;
        }
    }
    return Best;
    //return ReturnValue;    
}

simulated event HandleAnimNotifyIKToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], AnimNodeSeq;

    //return;    
}

simulated function OnToggleRadarActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bHideFromRadar = false;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bHideFromRadar = true;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bHideFromRadar = !bHideFromRadar;
            }
        }
    }
    //return;    
}

simulated event HandleAnimNotifyGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

    //return;    
}

simulated function ShouldActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActiveD[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(ActiveD.EnabledForDifficulty.GetValue() != float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function FindCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private name WindowName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x121 [Loop If]
    if(Idx < TuneDataPawn.ActiveDefenseWindows.Length)
    {
        // End:0x113
        if(((TuneDataPawn.ActiveDefenseWindows[Idx] != none) && TuneDataPawn.ActiveDefenseWindows[Idx].WindowName == WindowName) && ShouldActiveDefense(TuneDataPawn.ActiveDefenseWindows[Idx]))
        {
            return TuneDataPawn.ActiveDefenseWindows[Idx];
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

simulated function FindCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private name WindowName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xEA [Loop If]
    if(Idx < TuneDataPawn.ForkArmWindows.Length)
    {
        // End:0xDC
        if((TuneDataPawn.ForkArmWindows[Idx] != none) && TuneDataPawn.ForkArmWindows[Idx].WindowName == WindowName)
        {
            return TuneDataPawn.ForkArmWindows[Idx];
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

simulated function FindCombatWindow_VSMeleeInterrupt()
{
    local /*0x97E50000-0x00000000*/ private name WindowName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xEA [Loop If]
    if(Idx < TuneDataPawn.VSMeleeInterruptWindows.Length)
    {
        // End:0xDC
        if((TuneDataPawn.VSMeleeInterruptWindows[Idx] != none) && TuneDataPawn.VSMeleeInterruptWindows[Idx].WindowName == WindowName)
        {
            return TuneDataPawn.VSMeleeInterruptWindows[Idx];
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

simulated function PublishCombatWindowsFromAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], Subscriber;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyEvents;
    local /*0x97E50000-0x00000000*/ private @NULL CombatWindowNotify, CombatWindow;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL NewActiveCombatWindow;
    local /*0x97E50000-0x00000000*/ private float Duration, ScaleDelta, NotifyEventTime, NotifyEventDuration;

    // End:0x37
    if((SeqNode == none) || SeqNode.AnimSeq == none)
    {
        return;
    }
    SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_CombatWindow', NotifyEvents);
    Idx = 0;
    J0x88:

    // End:0x381 [Loop If]
    if(Idx < NotifyEvents.Length)
    {
        CombatWindowNotify = LPAnimNotify_CombatWindow(NotifyEvents[Idx].Notify);
        // End:0x373
        if(CombatWindowNotify != none)
        {
            CombatWindow = CombatWindowNotify.FindCombatWindow(self);
            // End:0x373
            if(CombatWindow != none)
            {
                NewActiveCombatWindow.Publisher = self;
                NewActiveCombatWindow.bTimedWindow = true;
                NotifyEventTime = NotifyEvents[Idx].Time / SeqNode.Rate;
                NotifyEventDuration = NotifyEvents[Idx].Duration / SeqNode.Rate;
                NewActiveCombatWindow.StartTime = NotifyEventTime + WorldInfo.TimeSeconds;
                Duration = NotifyEventDuration;
                Duration *= TuneDataPawn.ActiveDefenseScale.GetValue();
                ScaleDelta = NotifyEventDuration - Duration;
                NewActiveCombatWindow.StartTime += (ScaleDelta / float(2));
                NewActiveCombatWindow.EndTime = NewActiveCombatWindow.StartTime + Duration;
                NewActiveCombatWindow.CombatWindow = CombatWindow;
                Subscriber.AddActiveCombatWindow(NewActiveCombatWindow);
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x88;
    }
    //return;    
}

simulated function AddActiveCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActiveWindow[25296897];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x60 [Loop If]
    if(Idx < SubscribedCombatWindows.Length)
    {
        // End:0x52
        if(SubscribedCombatWindows[Idx].Publisher == none)
        {
            // [Explicit Break]
            goto J0x60;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x60:

    // End:0x90
    if(Idx == SubscribedCombatWindows.Length)
    {
        SubscribedCombatWindows.Length = SubscribedCombatWindows.Length + 1;
    }
    SubscribedCombatWindows[Idx] = ActiveWindow;
    //return;    
}

simulated function RemoveActiveCombatWindows()
{
    local /*0x97E50000-0x00000000*/ private @NULL Publisher[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xB5 [Loop If]
    if(Idx < SubscribedCombatWindows.Length)
    {
        // End:0xA7
        if(SubscribedCombatWindows[Idx].Publisher == Publisher)
        {
            SubscribedCombatWindows[Idx].Publisher = none;
            SubscribedCombatWindows[Idx].CombatWindow = none;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function SetActiveDefenseCallback()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ActiveDefenseCallback[8388609];

    SubscribedActiveDefense = ActiveDefenseCallback;
    //return;    
}

simulated function ClearActiveDefenseCallback()
{
    SubscribedActiveDefense = None;
    //return;    
}

simulated function GetSMForCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

simulated event IsValidActiveCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWindow[8388609];
    local /*0x97E50000-0x00000000*/ private class Type[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x194
    if((InWindow.Publisher != none) && InWindow.CombatWindow != none)
    {
        // End:0x9C
        if((Type != none) && !ClassIsChildOf(InWindow.CombatWindow.Class, Type))
        {
            return false;
        }
        // End:0x194
        if(!InWindow.bTimedWindow || (WorldInfo.TimeSeconds >= InWindow.StartTime) && WorldInfo.TimeSeconds <= InWindow.EndTime)
        {
            // End:0x194
            if(InWindow.CombatWindow.IsValid(self, InWindow.Publisher))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function FindActiveCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private class Type[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609], OutWindow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0C:

    // End:0xCF [Loop If]
    if(Idx < SubscribedCombatWindows.Length)
    {
        // End:0xC1
        if(ClassIsChildOf(SubscribedCombatWindows[Idx].CombatWindow.Class, Type))
        {
            // End:0xC1
            if(SubscribedCombatWindows[Idx].Publisher == OtherPawn)
            {
                OutWindow = SubscribedCombatWindows[Idx];
                return true;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0C;
    }
    return false;
    //return ReturnValue;    
}

simulated function FindValidActiveCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private class Type[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OutWindow[25165825];
    local /*0x97E50000-0x00000000*/ private bool bSimulate[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private bool Found;
    local /*0x97E50000-0x00000000*/ private @NULL TestWindow;

    false
    Found = false;
    Idx = 0;
    J0x1C:

    // End:0x10F [Loop If]
    if(Idx < SubscribedCombatWindows.Length)
    {
        // End:0x101
        if(IsValidActiveCombatWindow(SubscribedCombatWindows[Idx], Type))
        {
            TestWindow = SubscribedCombatWindows[Idx];
            // End:0x101
            if(!Found || TestWindow.CombatWindow.IsBetterWindow(TestWindow, OutWindow, self))
            {
                OutWindow = TestWindow;
                Found = true;
                // End:0x101
                if(bSimulate)
                {
                    return true;
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x1C;
    }
    return Found;
    //return ReturnValue;    
}

simulated function FindAllValidActiveCombatWindows()
{
    local /*0x97E50000-0x00000000*/ private class Type[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutWindows[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x7A [Loop If]
    if(Idx < SubscribedCombatWindows.Length)
    {
        // End:0x6C
        if(IsValidActiveCombatWindow(SubscribedCombatWindows[Idx], Type))
        {
            OutWindows.AddItem(SubscribedCombatWindows[Idx]);            
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return OutWindows.Length > 0;
    //return ReturnValue;    
}

function DetermineBestValidCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Windows[25296897];
    local /*0x97E50000-0x00000000*/ private @NULL OutWindow[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx, HighestPriority;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Candidates;
    local /*0x97E50000-0x00000000*/ private int TotalWeight, RandomWeight;

    HighestPriority = -1;
    Idx = 0;
    J0x1A:

    // End:0x1E9 [Loop If]
    if(Idx < Windows.Length)
    {
        // End:0x136
        if(Windows[Idx].CombatWindow.Priority > HighestPriority)
        {
            TotalWeight = 0;
            Candidates.Length = 0;
            Candidates.AddItem(Idx);            
            HighestPriority = Windows[Idx].CombatWindow.Priority;
            TotalWeight += Windows[Idx].CombatWindow.Weight;            
        }
        else
        {
            // End:0x1DB
            if(Windows[Idx].CombatWindow.Priority == HighestPriority)
            {
                Candidates.AddItem(Idx);                
                TotalWeight += Windows[Idx].CombatWindow.Weight;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x1A;
    }
    // End:0x1FB
    if(Candidates.Length == 0)
    {
        return false;
    }
    RandomWeight = Rand(TotalWeight);
    TotalWeight = 0;
    Idx = 0;
    J0x226:

    // End:0x2DC [Loop If]
    if(Idx < Candidates.Length)
    {
        TotalWeight += Windows[Candidates[Idx]].CombatWindow.Weight;
        // End:0x2CE
        if(RandomWeight < TotalWeight)
        {
            OutWindow = Windows[Candidates[Idx]];
            return true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x226;
    }
    OutWindow = Windows[Candidates[0]];
    return true;
    //return ReturnValue;    
}

function IsAnyActiveDefenseWindowOpen()
{
    local /*0x97E50000-0x00000000*/ private bool bIgnoreSubscribedWindows[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ADWindows;

    // End:0x23
    if(!bIgnoreSubscribedWindows && SubscribedActiveDefense != none)
    {
        return true;
    }
    // End:0x44
    if(FindAllValidActiveCombatWindows(Class'LPCombatWindow_ActiveDefense', ADWindows))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsAnyForkArmWindowOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array FAWindows;

    // End:0x21
    if(FindAllValidActiveCombatWindows(Class'LPCombatWindow_ForkArm', FAWindows))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TryCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ADWindows;
    local /*0x97E50000-0x00000000*/ private @NULL Window;
    local /*0x97E50000-0x00000000*/ private class SMClass;
    local /*0x97E50000-0x00000000*/ private bool bWindowFoundByCallback;

    bWindowFoundByCallback = false;
    // End:0x4C
    if(SubscribedActiveDefense != none)
    {
        bWindowFoundByCallback = ActiveDefenseFunction(self, SMClass, Window);
    }
    // End:0xBE
    if(!bWindowFoundByCallback)
    {
        // End:0x7E
        if(!FindAllValidActiveCombatWindows(Class'LPCombatWindow_ActiveDefense', ADWindows))
        {
            return false;
        }
        // End:0xA1
        if(!DetermineBestValidCombatWindow(ADWindows, Window))
        {
            return false;
        }
        SMClass = GetSMForCombatWindow_ActiveDefense(Window);
    }
    // End:0xD8
    if(SMClass == none)
    {
        return bWindowFoundByCallback;
    }
    // End:0xF3
    if(!CanDoSpecialMove(SMClass, true))
    {
        return false;
    }
    // End:0x193
    if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
    {
        ReplicatedCombatWindowInfo.Window = Window;
        DoSpecialMove(SMClass, true, false, None, Window.Publisher);
    }
    ServerStartCombatWindow_ActiveDefense(SMClass, Window);
    return true;
    //return ReturnValue;    
}

reliable server function ServerStartCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private class SMClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Window[8388609], SM;

    SM = GetSpecialMoveInstance(SMClass);
    ReplicatedCombatWindowInfo.Count++;
    ReplicatedCombatWindowInfo.Window = Window;
    // End:0xFB
    if(LPAIController(Window.Publisher.Controller) != none)
    {
        LPAIController(Window.Publisher.Controller).NotifyPreActiveDefenseSpecialMove(Window, self);
    }
    DoSpecialMove(SM.Class, true, false, None, Window.Publisher);
    //return;    
}

simulated function FindCombatWindow_Melee()
{
    local /*0x97E50000-0x00000000*/ private name WindowName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xEA [Loop If]
    if(Idx < TuneDataPawn.MeleeWindows.Length)
    {
        // End:0xDC
        if((TuneDataPawn.MeleeWindows[Idx] != none) && TuneDataPawn.MeleeWindows[Idx].WindowName == WindowName)
        {
            return TuneDataPawn.MeleeWindows[Idx];
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

simulated function GetSMForCombatWindow_Melee()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

simulated function IsValidMeleeTargetNonCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !bUsesPhatPawnCollision && Health > 0;
    //return ReturnValue;    
}

simulated function @NULL UpdateEdgeGlowMICs()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp, MI, MIC;
    local /*0x97E50000-0x00000000*/ private int MaterialIndex, Idx;

    // End:0x18C
    if((EdgeGlowPhysicalMaterial != none) && EdgeGlowMICs.Length == 0)
    {
        // End:0x18B
        foreach AllOwnedComponents(Class'Engine.MeshComponent', Comp)
        {
            Idx = 0;
            J0x4B:

            // End:0x18A [Loop If]
            if(Idx < Comp.GetNumElements())
            {
                MI = Comp.GetMaterial(Idx);
                // End:0x17C
                if((MI != none) && MI.GetPhysicalMaterial() == EdgeGlowPhysicalMaterial)
                {
                    MIC = MaterialInstanceConstant(MI);
                    // End:0x145
                    if(MIC == none)
                    {
                        MIC = Comp.CreateAndSetMaterialInstanceConstant(Idx);
                    }
                    // End:0x17C
                    if(MIC != none)
                    {
                        EdgeGlowMICs[MaterialIndex] = MIC;
                        MaterialIndex++;
                    }
                }
                Idx++;
                // [Loop Continue]
                goto J0x4B;
            }            
        }        
    }
    //return;    
}

simulated function SetEdgeGlowColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL ColorInfo[8388609], MIC;

    UpdateEdgeGlowMICs();
    // End:0x3E
    foreach EdgeGlowMICs(MIC)
    {
        ApplyEdgeGlowToMIC(MIC, ColorInfo);        
    }    
    //return;    
}

simulated function StartEdgeGlow()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewEdgeGlow[8388609];

    EdgeGlow = NewEdgeGlow;
    SetTimer(0.0500000, false, 'UpdateEdgeGlow');
    //return;    
}

simulated function StopEdgeGlow()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NeutralEdgeGlow, NeutralColorInfo;

    ClearTimer('UpdateEdgeGlow');
    ClearTimer('FinishEdgeGlowBlend');
    SetEdgeGlowColor(NeutralColorInfo);
    EdgeGlow = NeutralEdgeGlow;
    //return;    
}

simulated function UpdateEdgeGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentBlend, CurrentColorInfo;
    local /*0x97E50000-0x00000000*/ private float InterpAlpha;

    // End:0x854
    if(EdgeGlow.EdgeGlowBlends.Length > 0)
    {
        // End:0x854
        if(EdgeGlow.EdgeGlowBlends.Length > EdgeGlow.CurrentBlendIndex)
        {
            CurrentBlend = EdgeGlow.EdgeGlowBlends[EdgeGlow.CurrentBlendIndex];
            // End:0x17C
            if(!EdgeGlow.bCurrentBlendStarted)
            {
                EdgeGlow.bCurrentBlendStarted = true;
                // End:0x15C
                if(CurrentBlend.BlendTime > float(0))
                {
                    SetEdgeGlowColor(CurrentBlend.StartColorInfo);
                    SetTimer(CurrentBlend.BlendTime, false, 'FinishEdgeGlowBlend');                    
                }
                else
                {
                    FinishEdgeGlowBlend();
                }
                SetTimer(0.0500000, false, 'UpdateEdgeGlow');                
            }
            else
            {
                // End:0x854
                if(IsTimerActive('FinishEdgeGlowBlend'))
                {
                    InterpAlpha = GetTimerCount('FinishEdgeGlowBlend') / GetTimerRate('FinishEdgeGlowBlend');
                    switch(CurrentBlend.BlendType)
                    {
                        // End:0x232
                        case 2:
                            InterpAlpha = FClamp((Sin(3.1415930 * (InterpAlpha - 0.5000000)) + 1.0000000) * 0.5000000, 0.0000000, 1.0000000);
                            // End:0x37A
                            break;
                        // End:0x277
                        case 1:
                            InterpAlpha = FClamp(FCubicInterp(0.0000000, 0.0000000, 1.0000000, 0.0000000, InterpAlpha), 0.0000000, 1.0000000);
                            // End:0x37A
                            break;
                        // End:0x2B7
                        case 3:
                            InterpAlpha = FClamp(FInterpEaseInOut(0.0000000, 1.0000000, InterpAlpha, 2.0000000), 0.0000000, 1.0000000);
                            // End:0x37A
                            break;
                        // End:0x2F7
                        case 4:
                            InterpAlpha = FClamp(FInterpEaseInOut(0.0000000, 1.0000000, InterpAlpha, 3.0000000), 0.0000000, 1.0000000);
                            // End:0x37A
                            break;
                        // End:0x337
                        case 5:
                            InterpAlpha = FClamp(FInterpEaseInOut(0.0000000, 1.0000000, InterpAlpha, 4.0000000), 0.0000000, 1.0000000);
                            // End:0x37A
                            break;
                        // End:0x377
                        case 6:
                            InterpAlpha = FClamp(FInterpEaseInOut(0.0000000, 1.0000000, InterpAlpha, 5.0000000), 0.0000000, 1.0000000);
                            // End:0x37A
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    CurrentColorInfo = CurrentBlend.EndColorInfo;
                    CurrentColorInfo.EdgeGlowColor.R = Lerp(CurrentBlend.StartColorInfo.EdgeGlowColor.R, CurrentBlend.EndColorInfo.EdgeGlowColor.R, InterpAlpha);
                    CurrentColorInfo.EdgeGlowColor.G = Lerp(CurrentBlend.StartColorInfo.EdgeGlowColor.G, CurrentBlend.EndColorInfo.EdgeGlowColor.G, InterpAlpha);
                    CurrentColorInfo.EdgeGlowColor.B = Lerp(CurrentBlend.StartColorInfo.EdgeGlowColor.B, CurrentBlend.EndColorInfo.EdgeGlowColor.B, InterpAlpha);
                    CurrentColorInfo.EdgeGlowColor.A = Lerp(CurrentBlend.StartColorInfo.EdgeGlowColor.A, CurrentBlend.EndColorInfo.EdgeGlowColor.A, InterpAlpha);
                    CurrentColorInfo.EdgeGlowRamp = Lerp(CurrentBlend.StartColorInfo.EdgeGlowRamp, CurrentBlend.EndColorInfo.EdgeGlowRamp, InterpAlpha);
                    CurrentColorInfo.EdgeGlowThresholdRef = Lerp(CurrentBlend.StartColorInfo.EdgeGlowThresholdRef, CurrentBlend.EndColorInfo.EdgeGlowThresholdRef, InterpAlpha);
                    CurrentColorInfo.EdgeGlowThresholdSlope = Lerp(CurrentBlend.StartColorInfo.EdgeGlowThresholdSlope, CurrentBlend.EndColorInfo.EdgeGlowThresholdSlope, InterpAlpha);
                    SetEdgeGlowColor(CurrentColorInfo);
                    SetTimer(0.0500000, false, 'UpdateEdgeGlow');
                }
            }
        }
    }
    //return;    
}

simulated function FinishEdgeGlowBlend()
{
    // End:0x172
    if(EdgeGlow.EdgeGlowBlends.Length > 0)
    {
        // End:0x172
        if(EdgeGlow.EdgeGlowBlends.Length > EdgeGlow.CurrentBlendIndex)
        {
            SetEdgeGlowColor(EdgeGlow.EdgeGlowBlends[EdgeGlow.CurrentBlendIndex].EndColorInfo);
            EdgeGlow.CurrentBlendIndex++;
            EdgeGlow.bCurrentBlendStarted = false;
            // End:0x172
            if(EdgeGlow.bLooping && EdgeGlow.CurrentBlendIndex >= EdgeGlow.EdgeGlowBlends.Length)
            {
                EdgeGlow.CurrentBlendIndex = 0;
            }
        }
    }
    //return;    
}

static function GetEdgeGlowFromMIC()
{
    local /*0x97E50000-0x00000000*/ private @NULL MIC[8388609], ReturnValue, CCI;
    local /*0x97E50000-0x00000000*/ private float bEdgeGlow, bEdgeGlowSharp;

    MIC.GetScalarParameterValue('L1_EdgeGlowRamp', CCI.EdgeGlowRamp);
    MIC.GetScalarParameterValue('L1_EdgeGlowThresholdRef', CCI.EdgeGlowThresholdRef);
    MIC.GetScalarParameterValue('L1_EdgeGlowThresholdSlope', CCI.EdgeGlowThresholdSlope);
    MIC.GetVectorParameterValue('L1_EdgeGlowColor', CCI.EdgeGlowColor);
    MIC.GetScalarParameterValue('Enable_L1_EdgeGlow', bEdgeGlow);
    MIC.GetScalarParameterValue('Enable_L1_EdgeGlowSharp', bEdgeGlowSharp);
    CCI.bEnableEdgeGlow = bEdgeGlow != float(0);
    CCI.bEnableEdgeGlowSharp = bEdgeGlowSharp != float(0);
    return CCI;
    //return ReturnValue;    
}

static function ApplyEdgeGlowToMIC()
{
    local /*0x97E50000-0x00000000*/ private @NULL MIC[8388609], ColorInfo;

    MIC.SetScalarParameterValue('Enable_L1_EdgeGlow', float(((ColorInfo.bEnableEdgeGlow) ? 1 : 0)));
    MIC.SetScalarParameterValue('Enable_L1_EdgeGlowSharp', float(((ColorInfo.bEnableEdgeGlowSharp) ? 1 : 0)));
    MIC.SetScalarParameterValue('L1_EdgeGlowRamp', ColorInfo.EdgeGlowRamp);
    MIC.SetScalarParameterValue('L1_EdgeGlowThresholdRef', ColorInfo.EdgeGlowThresholdRef);
    MIC.SetScalarParameterValue('L1_EdgeGlowThresholdSlope', ColorInfo.EdgeGlowThresholdSlope);
    MIC.SetVectorParameterValue('L1_EdgeGlowColor', ColorInfo.EdgeGlowColor);
    //return;    
}

simulated function OnTeleport()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array objVars;
    local /*0x97E50000-0x00000000*/ private @NULL LPAction;

    LPAction = LPSeqAct_Teleport(Action);
    // End:0xF8
    if(LPAction != none)
    {
        LPAction.GetObjectVars(objVars, "Destination");
        // End:0xF5
        if(!SPHandleTeleport(objVars, LPAction.bUpdateRotation, LPAction.bCheckOverlap,, LPAction.TeleportVolumes,, LPAction.bNoCollisionCheck))
        {
        }        
    }
    else
    {
        super(Pawn).OnTeleport(Action);
    }
    // End:0x139
    if(AIResourceManager != none)
    {
        AIResourceManager.OnTeleport();
    }
    //return;    
}

simulated function SPHandleTeleport()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array DestList[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUpdateRotation[8388609], bCheckOverlap;
    local /*0x97E50000-0x00000000*/ private float TeleportDistance[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array TeleportVolumes[9437185];
    local /*0x97E50000-0x00000000*/ private int PreferredDestIndex[9437185];
    local /*0x97E50000-0x00000000*/ private bool bNoCollisionCheck[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx, Cnt;
    local /*0x97E50000-0x00000000*/ private @NULL destActor, tempActor, A, C;
    local /*0x97E50000-0x00000000*/ private bool bOccupiedDest, bColliding;
    local /*0x97E50000-0x00000000*/ private @NULL Extent;
    local /*0x97E50000-0x00000000*/ private bool bSetLocationSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL DestLocation;

    Extent = GetCollisionExtent();
    bOccupiedDest = false;
    // End:0x2AF
    if(DestList.Length > 0)
    {
        Idx = ((PreferredDestIndex >= 0) ? PreferredDestIndex : 0);
        // End:0x87
        if(Idx >= DestList.Length)
        {
            Idx = 0;
            PreferredDestIndex = 0;
        }
        Cnt = 0;
        J0x92:

        tempActor = Actor(DestList[Idx]);
        // End:0x242
        if(tempActor != none)
        {
            C = Controller(tempActor);
            // End:0x140
            if((C != none) && C.Pawn != none)
            {
                tempActor = C.Pawn;
            }
            // End:0x1FB
            if(bCheckOverlap)
            {
                bColliding = false;
                // End:0x1E5
                foreach VisibleCollidingActors(Class'Engine.Actor', A, Extent.X * 2.0000000, tempActor.Location, false, Extent, true)
                {
                    // End:0x1E4
                    if(IsBlockedBy(A))
                    {
                        bColliding = true;
                        // End:0x1E5
                        break;
                    }                    
                }                
                bOccupiedDest = bColliding;
            }
            destActor = tempActor;
            // End:0x242
            if((!bCheckOverlap || !bOccupiedDest) && destActor != none)
            {
                // [Explicit Continue]
                goto J0x2AC;
            }
        }
        ++Idx;
        // End:0x270
        if(Idx >= DestList.Length)
        {
            Idx = 0;
        }
        ++Cnt;
        // End:0x92
        if(!((Idx == PreferredDestIndex) || Cnt >= DestList.Length))
            goto J0x92;
        J0x2AC:
        
    }
    // End:0x539
    if((destActor != none) && Class'Engine.SeqAct_Teleport'.static.ShouldTeleport(self, destActor.Location, TeleportDistance, TeleportVolumes))
    {
        // End:0x369
        if(bNoCollisionCheck)
        {
            DestLocation = destActor.Location;
            bSetLocationSuccess = SetLocationNoCheck(DestLocation);            
        }
        else
        {
            bSetLocationSuccess = SetLocation(destActor.Location);
        }
        // End:0x537
        if(bSetLocationSuccess)
        {
            // End:0x41A
            if(!IsLocallyControlled() && PlayerController(Controller) != none)
            {
                PlayerController(Controller).ClientSetLocation(destActor.Location, Rotation);
            }
            PlayTeleportEffect(false, true);
            // End:0x4E5
            if(bUpdateRotation)
            {
                SetRotation(destActor.Rotation);
                // End:0x4E5
                if(Controller != none)
                {
                    Controller.SetRotation(destActor.Rotation);
                    Controller.ClientSetRotation(destActor.Rotation);
                }
            }
            // End:0x514
            if(Controller != none)
            {
                Controller.OnTeleport(none);
            }
            Mesh.bOneTimeIgnoreKinematics = true;
            return true;
        }
        return false;
    }
    // End:0x54A
    if(destActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function GetProjectileTargetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy[8388609], ReturnValue;

    return Location;
    //return ReturnValue;    
}

simulated function GetCoverSwatEnterDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x38
    if(LPWeaponPistol(Weapon) != none)
    {
        // End:0x32
        if(int(CoverType) == int(2))
        {
            return 239.5000000;
        }
        return 242.6000000;
    }
    // End:0x52
    if(int(CoverType) == int(2))
    {
        return 169.5000000;
    }
    return 155.5000000;
    //return ReturnValue;    
}

function @NULL StopSoundsOnPawn()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC;

    // End:0x4E
    foreach AllOwnedComponents(Class'Engine.SPAudioComponentBase', AC)
    {
        // End:0x4D
        if(AC != none)
        {
            AC.Stop();
        }        
    }    
    //return;    
}

function @NULL IsThisAudioComponentInTheListToNotStopOnFollowerAtStartOfActiveDefenses()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x54 [Loop If]
    if(iter < AudioComponentsToNotStopOnFollowerAtStartOfActiveDefenses.Length)
    {
        // End:0x46
        if(AudioComponentsToNotStopOnFollowerAtStartOfActiveDefenses[iter] == AC2Test)
        {
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function @NULL AddThisAudioComponentToTheToNotStopOnFollowerAtStartOfActiveDefenses()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC2Test[8388609];

    AudioComponentsToNotStopOnFollowerAtStartOfActiveDefenses.AddItem(AC2Test);    
    //return;    
}

function @NULL RemoveThisAudioComponentToTheToNotStopOnFollowerAtStartOfActiveDefenses()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC2Test[8388609];

    AudioComponentsToNotStopOnFollowerAtStartOfActiveDefenses.RemoveItem(AC2Test);    
    //return;    
}

event ImpactCombatTargetAllowed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated event NotifyWeaponSoundEvent()
{
    local /*0x97E50000-0x00000000*/ private name WeaponSoundEventName[8388609];
    local /*0x97E50000-0x00000000*/ private float Loudness[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return super(SPPawn).NotifyWeaponSoundEvent(WeaponSoundEventName, Loudness);
    //return ReturnValue;    
}

simulated event NotifySurfaceEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL SurfaceAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return super(SPPawn).NotifySurfaceEffect(SurfaceAnimNotify);
    //return ReturnValue;    
}

state Dying
{
    event TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, ApplyImpulse;

        // End:0x142
        if((int(Physics) == int(10)) && DamageType.default.KDamageImpulse > float(0))
        {
            Momentum = Normal(Momentum);
            CheckHitInfo(HitInfo, Mesh, Momentum, HitLocation);
            ApplyImpulse = Momentum * DamageType.default.KDamageImpulse;
            // End:0x142
            if(HitInfo.HitComponent != none)
            {
                HitInfo.HitComponent.AddImpulse(ApplyImpulse * RagdollImpulseScale, HitLocation, HitInfo.BoneName);
            }
        }
        // End:0x1A5
        if(bPlayImpactEffectsWhenDead)
        {
            TakeDamage_SetParams(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo,, DamageCauser, true, true);
            PlayImpactEffects();
        }
        //return;        
    }

    simulated function TakeRadiusDamage()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];
        local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private float Momentum[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609];
        local /*0x97E50000-0x00000000*/ private bool bFullDamage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
        local /*0x97E50000-0x00000000*/ private float DamageFalloffExponent[9437185];
        local /*0x97E50000-0x00000000*/ private @NULL MomentumDir, ScaledMomentumDir, HitLocation, HitLoc, HitNorm, HitInfo;

        1.0000000
        // End:0xC0
        if((int(Physics) == int(10)) && DamageType.default.RadialDamageImpulse > float(0))
        {
            Mesh.AddRadialImpulse(HurtOrigin, DamageRadius, DamageType.default.RadialDamageImpulse * RagdollRadialImpulseScale, 1, DamageType.default.bRadialDamageVelChange);
        }
        // End:0x20B
        if(bPlayImpactEffectsWhenDead)
        {
            MomentumDir = Normal(HurtOrigin - Location) * default.CylinderComponent.CollisionRadius;
            ScaledMomentumDir = -Momentum * MomentumDir;
            HitLocation = Location + MomentumDir;
            Mesh.GetClosestCollidingBoneLocation(HitLocation, true, true);
            Trace(HitLoc, HitNorm, HitLocation - MomentumDir, HitLocation, true,, HitInfo, 1);
            TakeDamage_SetParams(int(BaseDamage), InstigatedBy, HitLoc, ScaledMomentumDir, DamageType, HitInfo,, DamageCauser, true, true);
            PlayImpactEffects();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bReplicateWorldAimDir=true
    bStopAllPhysicalActionsOfGrenadeOnAttachment=true
    bCanDropTEnergy=true
    bPlayImpactEffectsWhenDead=true
    bNotValidForAiWhileHidenRightNow=true
    bIsAnyAimStateNodeAiming=true
    ATL_AdditiveHitReaction_Name="AdditiveHitReaction"
    AdditiveAimingAnimInfo=(AnimNodeSlotName="AdditiveAimingSlotNode",AnimNodeSlot=none)
    AdditiveAimingBlendStrengthNodeName="AdditiveAimingBlendStrength"
    CarrierKnockDownTimeToStayOnGround=1.0000000
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    CameraInteraction=(bCameraIgnoreCylinder=true)
    MaxFootstepDist=12000.0000000
    PawnTemplateQueryClass=Class'LPTuneDataPawnTemplate'
    // Reference: SPDamageOverTimeComponent'Default__LPPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bReplicateHealthToAll=true
    ControllerClass=Class'LPAIController'
    // Reference: SkeletalMeshComponent'Default__LPPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    InventoryManagerClass=Class'LPInventoryManager'
    // Reference: AudioComponent'Default__LPPawn.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    bCanStepUpOn=false
    bAlwaysRelevant=true
    NetUpdateFrequency=10.0000000
    // Reference: LPActorInteractionMetaData'Default__LPPawn.IMetaData'
    begin object name=IMetaData class=Class'LPActorInteractionMetaData'
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}