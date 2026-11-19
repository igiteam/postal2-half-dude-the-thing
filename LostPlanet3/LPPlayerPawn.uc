class LPPlayerPawn extends LPBasePlayerPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum EThermalProximityPingState
{
    EThermalProximityPingState_Uninitialized,// 0
    EThermalProximityPingState_Start,// 1
    EThermalProximityPingState_Playing,// 2
    EThermalProximityPingState_Stopping,// 3
    EThermalProximityPingState_Aborting,// 4
    EThermalProximityPingState_Off, // 5
    EThermalProximityPingState_MAX  // 6
};

enum EVSExitType
{
    EET_Exit,                       // 0
    EET_SoftEject,                  // 1
    EET_HardEject,                  // 2
    EET_DeathEject,                 // 3
    EET_MAX                         // 4
};

enum EVSExitDirection
{
    EED_Front,                      // 0
    EED_Back,                       // 1
    EED_Safety,                     // 2
    EED_Left,                       // 3
    EED_Right,                      // 4
    EED_MAX                         // 5
};

enum EVSExitStyle
{
    EES_Normal,                     // 0
    EES_Additive,                   // 1
    EES_Winch,                      // 2
    EES_Platform,                   // 3
    EES_Turret,                     // 4
    EES_Invalid,                    // 5
    EES_MAX                         // 6
};

enum EMeleeTakedownTargetValidity
{
    EMeleeTakedown_Valid,           // 0
    EMeleeTakedown_OutOfChoreographyRange,// 1
    EMeleeTakedown_OutOfMeleeTakedown,// 2
    EMeleeTakedown_InFrontOfVictim, // 3
    EMeleeTakedown_OutOfFacingWindow,// 4
    EMeleeTakedown_OutOfRearWindow, // 5
    EMeleeTakedown_MAX              // 6
};

enum EGrappleMovementType
{
    GMT_Normal,                     // 0
    GMT_Horizontal,                 // 1
    GMT_Vertical,                   // 2
    GMT_MAX                         // 3
};

struct native InventoryPickupProximityNotification
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ItemClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PickupActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfNotification;

    structdefaultproperties
    {
        ItemClass=none
        PickupActor=none
        TimeOfNotification=0.0000000
    }
};

struct native RepairComponentProximityList
{
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Comp[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Dist;

    structdefaultproperties
    {
        Comp=none
        Dist=0.0000000
    }
};

struct native HackComponentProximityList
{
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Comp[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Dist;

    structdefaultproperties
    {
        Comp=none
        Dist=0.0000000
    }
};

struct native FreezeMaterialRemap
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Original;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Replacement;

    structdefaultproperties
    {
        Original=none
        Replacement=none
    }
};

struct native ThermalProximityParameters
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte pingState;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL pingSound[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL pingActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float pingDistance;

    structdefaultproperties
    {
        pingState=EThermalProximityPingState.EThermalProximityPingState_Uninitialized
        pingSound=none
        pingActor=none
        pingDistance=0.0000000
    }
};

struct native KnockDownParams
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bActive;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoRecover;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LinearVelocity;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AngularVelocity;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReplicateMe;

    structdefaultproperties
    {
        bActive=false
        bAutoRecover=false
        LinearVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        AngularVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ReplicateMe=0
    }
};

struct native GrenadeInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VisibleGrenadeCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GrenadeClass;

    structdefaultproperties
    {
        VisibleGrenadeCount=0
        GrenadeClass=none
    }
};

struct native QueuedChatterStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ChatterAkEvent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ChatterPriority;

    structdefaultproperties
    {
        ChatterAkEvent=none
        ChatterPriority=0
    }
};

struct native PlayedChatterStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ChatterEvent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastPlayAttemptTime;

    structdefaultproperties
    {
        ChatterEvent=eChatterEventName.CEN_AcknowledgeSupport
        LastPlayAttemptTime=0.0000000
    }
};

struct native ShieldActivationStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepCounter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration;

    structdefaultproperties
    {
        RepCounter=0
        Duration=0.0000000
    }
};

struct native CombatFireLine
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimDir;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStamp;

    structdefaultproperties
    {
        StartPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        AimDir=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        TimeStamp=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatLineOfFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel byte ExitType[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel byte ExitDirection[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel byte ExitStyle[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte UmbilicalState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte UmbilicalStateAfterShutdown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel byte TotalShotgunReloads[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GrappleMovementType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseExitSpec[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbleToDisplayReplenishMessage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUmbilicalHUDShuttingDown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUmbilicalHUDStartingUp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseShortVSEntry;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceRearVSExit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bUseZiplineVSTransition[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeployPlatform[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeployPlatformVSISS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bUnderhandGrenadePose[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleFaceNodeDir;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleHooked;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleIsVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleVSFront;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleStopping;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanRepair;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToRepair;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bProfileLoadOutInitialized[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceZiplineSprint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableProjectilePreview[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingTeammatesHarmonizer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimingDownSightModeActive[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInStruggleExclusionVolume[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInReticuleOverride[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInsideTentacleArea[536870913];
var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataPlayerPawn[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerMoveAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerWeaponAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerCoverAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerMeleeAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_FiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_ADSFiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_HitReaction_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_StationaryAdditiveAiming_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_MovingAdditiveAiming_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_FiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_ADSFiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_HitReaction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_StationaryAdditiveAiming[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_MovingAdditiveAiming[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SavedVelocity;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPPlayerController SavedController[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmmoReplenishTimeCounter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int DistanceFromVS[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UmbilicalShutDownTime[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UmbilicalStartUpTime[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UmbilicalUpdateRate[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DummyVS[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DummyUmbilicalRange;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL KnifeComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MineComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DefaultKnifeSocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AttachedKnifeSocket[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Grenade1Component[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Grenade2Component[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Grenade3Component[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Grenade4Component[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ZiplineTrolleyComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PerkGhostMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RepairScreenLightComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RepairScreenProjectionComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RepairConeProjectionComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairScreenProjectionSimpleMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairScreenProjectionSimpleMaterialInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairScreenProjectionMinigameMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairScreenProjectionMinigameMaterialInstance;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CurrentRepairComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SnowPercent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SnowBlendTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editconst float SnowMeltRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editconst float SnowMinimum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReviveMessageTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PickupMessageTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InventoryPickupNotification;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InventoryWeaponPickupNotification;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrapplePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleDir;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrappleDist;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleLandingDir;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleActorLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrappleSpeedBonusModifier[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrappleAccelBonusModifier[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel class GrappleHookClass[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyGlowTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurTEnergyGlow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyToTransfer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyFannyPackGlowTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrilledTEnergyToTransfer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL ThermalPingParams;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PawnZiplineSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PawnZiplineReleaseSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL KnockDownInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FacingBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ZiplineLogicAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL GrenadeInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerLeech;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerPackHunter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerPackHunterNPH;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerFireWasp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerBurrower;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerBurrowerMelee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerIss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerAct1Boss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerSepiaNPH;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerStalkerStrikeBull;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerStalkerStrikeBullLong;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleShackBridge;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerRestartTheUR;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerUnTaserTheUR;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerCrouchCSA[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CrouchTransitionBlendTime;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL JobLogLightComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL JobLogProjectionConeComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL WristPDAComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FXAction_WristPDA;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorResponsibleForRevival;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IncapacitatedRevivalTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPGFxMoviePlayerScoreboardContentClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPGFxMoviePlayerScoreboardMovie;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumEquippablePlayerWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumNonEquippablePlayerWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel string ParticleThrowerArcTargets[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalHarmonizerRegen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataChatter;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MPChatterComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentChatterPriority[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array QueuedChatterInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayedChatterInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InvulnerabilityReplacementMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeTakedownActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnterVSQuestEvent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExitVSQuestEvent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FreezeMaterialRemapList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextVSCheckTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClosestValidRepairableActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL InvulnerabilityInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float InvulnerabilityRemaining[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ShieldHitRepCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ThermalPaddingRegenRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ThermalPaddingRegenDelayModifier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HackDistanceBonus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HackSpeedMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedKiller;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class CachedDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedHitLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrozenGibParticleSystem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefaultCrouchCSA;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeReachedAlmostDeadHealth[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampInTentacleArea[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MineComp_TeamID_PhysMaterialIndex;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareRepairComponentByDistance__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareHackComponentByDistance__Delegate;

delegate CompareRepairComponentByDistance()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.Dist < B.Dist) ? -1 : 0);
    //return ReturnValue;    
}

delegate CompareHackComponentByDistance()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.Dist < B.Dist) ? -1 : 0);
    //return ReturnValue;    
}

// Export ULPPlayerPawn::execPositionSelfForVSEnterOrExit(FFrame&, void* const)
native function PositionSelfForVSEnterOrExit()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimNode[8388609], vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bOnlyMoveIfValidGround[8388609];


}

// Export ULPPlayerPawn::execGetRigidBodyLoc(FFrame&, void* const)
native function GetRigidBodyLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerPawn::execCanFallFromZipline(FFrame&, void* const)
native function CanFallFromZipline()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetGrappleParams(FFrame&, void* const)
native function GetGrappleParams()
{
    local /*0x97E50000-0x00000000*/ private bool bIsMagnetic[9437185], bForceIsMagnetic;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];

    false
    false                
}

// Export ULPPlayerPawn::execSetupGrappleBonus(FFrame&, void* const)
native final simulated function SetupGrappleBonus()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrappleLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGrappleDownMode[9437185];

    false                
}

// Export ULPPlayerPawn::execGetTargetLocation(FFrame&, void* const)
native simulated function GetTargetLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL RequestedBy[9437185];
    local /*0x97E50000-0x00000000*/ private bool bRequestAlternateLoc[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetGrapplingHook(FFrame&, void* const)
native final simulated function GetGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerPawn::execUpdateMeshTranslationForCover(FFrame&, void* const)
native final simulated function UpdateMeshTranslationForCover();

// Export ULPPlayerPawn::execSetCoverAction(FFrame&, void* const)
native simulated function SetCoverAction()
{
    local /*0x97E50000-0x00000000*/ private byte NewCoverAction[8388609];


}

// Export ULPPlayerPawn::execOn360AimingChangeNotify(FFrame&, void* const)
native simulated function On360AimingChangeNotify();

// Export ULPPlayerPawn::execGetBestAdditivateAimingAnimation(FFrame&, void* const)
native simulated function GetBestAdditivateAimingAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerPawn::execWantsToAim(FFrame&, void* const)
native simulated function WantsToAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetBestAimContext(FFrame&, void* const)
native simulated function GetBestAimContext()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPPlayerPawn::execIsAiming(FFrame&, void* const)
native simulated function IsAiming()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetUmbilicalRange(FFrame&, void* const)
native final simulated function GetUmbilicalRange()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetHealthRegenRate(FFrame&, void* const)
native function GetHealthRegenRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execUpdateRegenRate(FFrame&, void* const)
native function UpdateRegenRate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPlayerPawn::execGetHealthRegenMultiplier(FFrame&, void* const)
native simulated function GetHealthRegenMultiplier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetEnabledPerk(FFrame&, void* const)
native final simulated function GetEnabledPerk()
{
    local /*0x97E50000-0x00000000*/ private byte Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerPawn::execUpdateHealth(FFrame&, void* const)
native function UpdateHealth()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPlayerPawn::execIsDoingGrenadeSpecialMove(FFrame&, void* const)
native simulated function IsDoingGrenadeSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerPawn::execAbortWeaponReload(FFrame&, void* const)
native final simulated function AbortWeaponReload();

// Export ULPPlayerPawn::execHandleWeaponFiring(FFrame&, void* const)
native simulated function HandleWeaponFiring();

// Export ULPPlayerPawn::execSetDepthPriorityGroup(FFrame&, void* const)
native simulated function SetDepthPriorityGroup()
{
    local /*0x97E50000-0x00000000*/ private byte NewDepthPriorityGroup[8388609];


}

// Export ULPPlayerPawn::execGetLedgeWalkType(FFrame&, void* const)
native simulated function GetLedgeWalkType()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetPawnViewLocation(FFrame&, void* const)
native simulated function GetPawnViewLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerPawn::execDisableRepairScreenProjection(FFrame&, void* const)
native final simulated function DisableRepairScreenProjection();

// Export ULPPlayerPawn::execTakeDamage_SetParams(FFrame&, void* const)
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

// Export ULPPlayerPawn::execHasDamageImmunityWithEffects(FFrame&, void* const)
native simulated function HasDamageImmunityWithEffects()
{
    local /*0x97E50000-0x00000000*/ private class dmgType[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetJimDamageFactor(FFrame&, void* const)
native final simulated function GetJimDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetJimSnowFactor(FFrame&, void* const)
native final simulated function GetJimSnowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetJimTEnergyFactor(FFrame&, void* const)
native final simulated function GetJimTEnergyFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetJimTEnergyFannyPackFactor(FFrame&, void* const)
native final simulated function GetJimTEnergyFannyPackFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetHealthPercentage(FFrame&, void* const)
native final simulated function GetHealthPercentage()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPPlayerPawn::execGetShoulderLightPercentage(FFrame&, void* const)
native final simulated function GetShoulderLightPercentage()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private bool bFrozenGib;

    // End:0x72
    if(!IsAliveAndWell() && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x72
        if(GetFXActionManager().IsFXActionActive(Class'LPFXAction_PlayerPawnFreezeMaterial'))
        {
            bFrozenGib = true;
        }
    }
    DisableRepairScreenProjection();
    RepairScreenProjectionMinigameMaterialInstance = none;
    RepairScreenProjectionSimpleMaterialInstance = none;
    super.Destroyed();
    AbortThermalEnergyPocketProximity();
    // End:0xE9
    if(MyLPPRI != none)
    {
        MyLPPRI.PerksManager.DeactivateDeploymentMode();
    }
    Mesh.SetHidden(true);
    Mesh.DetachComponent(PerkGhostMesh);
    PerkGhostMesh.SetStaticMesh(none);
    // End:0x17C
    if(bFrozenGib)
    {
        SpawnFrozenGibParticles();
        LocalSoundFX('FrozenGib');
    }
    InvulnerabilityInfo.Duration = 0.0000000;
    InvulnerabilityInfo.RepCounter = 0;
    InvulnerabilityRemaining = 0.0000000;
    ShieldHitRepCount = 0;
    ClearTimer('InvulnerabiltyCounter');
    //return;    
}

simulated function ClientRestart()
{
    super(SPGFCoverPawn).ClientRestart();
    // End:0x6A
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        Class'LPMultiplayerManager'.static.GetInstance().bIsJoining = false;
    }
    AbortThermalEnergyPocketProximity();
    // End:0xB7
    if(MyLPPRI != none)
    {
        MyLPPRI.PerksManager.DeactivateDeploymentMode();
    }
    ShieldHitRepCount = 0;
    //return;    
}

simulated function SetupMineComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL MI, MIC, LCol;

    // End:0x157
    if(MineComponent != none)
    {
        MineComponent.SetLightEnvironment(LightEnvironment);
        // End:0x157
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x157
            if(MineComp_TeamID_PhysMaterialIndex >= 0)
            {
                MI = MineComponent.GetMaterial(MineComp_TeamID_PhysMaterialIndex);
                // End:0x157
                if(MI != none)
                {
                    MIC = MineComponent.CreateAndSetMaterialInstanceConstant(MineComp_TeamID_PhysMaterialIndex);
                    // End:0x157
                    if(MIC != none)
                    {
                        LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(int(GetTeamNum()));
                        MIC.SetVectorParameterValue('TeamColor', LCol);
                    }
                }
            }
        }
    }
    //return;    
}

function InvulnerabiltyCounter()
{
    InvulnerabilityRemaining -= 1.0000000;
    // End:0x46
    if(InvulnerabilityRemaining <= 0.0000000)
    {
        ClearTimer('InvulnerabiltyCounter');
        InvulnerabilityRemaining = 0.0000000;
    }
    // End:0x5D
    if(IsLocallyControlled())
    {
        UpdateDamageImmunityUI();
    }
    //return;    
}

simulated function GetMaxTEnergyCapacity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MaxEng, Adjustment;

    MaxEng = super(LPPawn).GetMaxTEnergyCapacity();
    // End:0x71
    if((WorldInfo != none) && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        Adjustment = 0.0000000;
        MaxEng -= Adjustment;
    }
    return MaxEng;
    //return ReturnValue;    
}

simulated function GetInitialTEnergyAdjustment()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x5D
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return MyLPPRI.PerksManager.TEnergyCapacityAdjustment;
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function GetRemainingDamageImmunityTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return InvulnerabilityRemaining;
    //return ReturnValue;    
}

function SetRemainingDamageImmunityTime()
{
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    InvulnerabilityRemaining = Duration;
    InvulnerabilityInfo.Duration = Duration;
    InvulnerabilityInfo.RepCounter++;
    StartInvulnerabilityEffects(Duration);
    // End:0x81
    if(IsLocallyControlled())
    {
        UpdateDamageImmunityUI();
    }
    // End:0x115
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0xD7
        if((Duration > float(0)) && !IsTimerActive('InvulnerabiltyCounter'))
        {
            SetTimer(1.0000000, true, 'InvulnerabiltyCounter');            
        }
        else
        {
            // End:0x115
            if((Duration == float(0)) && IsTimerActive('InvulnerabiltyCounter'))
            {
                ClearTimer('InvulnerabiltyCounter');
            }
        }
    }
    //return;    
}

reliable server function ServerSetRemainingDamageImmunityTime()
{
    local /*0x97E50000-0x00000000*/ private float fDuration[8388609];

    SetRemainingDamageImmunityTime(fDuration);
    //return;    
}

function UpdateDamageImmunityUI()
{
    local /*0x97E50000-0x00000000*/ private float RemainingTime;

    // End:0x60
    if((Class'LPGameViewportClient'.static.IsTGSDemo() || !IsLocallyControlled()) || int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    RemainingTime = GetRemainingDamageImmunityTime();
    // End:0x104
    if(RemainingTime > float(0))
    {
        SavedController.myLPHUD.ShowDamageImmunity(true);
        SavedController.myLPHUD.SetDamageImmunityTime(FCeil(RemainingTime));        
    }
    else
    {
        SavedController.myLPHUD.SetDamageImmunityTime(0);
        SavedController.myLPHUD.ShowDamageImmunity(false);
    }
    //return;    
}

simulated function OnMakePlayerInvulnerable()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private float fDuration;

    fDuration = FClamp(inAction.Duration, 0.0000000, 100.0000000);
    // End:0x9A
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x87
        if(int(Role) == int(ROLE_Authority))
        {
            SetRemainingDamageImmunityTime(fDuration);            
        }
        else
        {
            ServerSetRemainingDamageImmunityTime(fDuration);
        }
    }
    //return;    
}

simulated function SetHealthMax()
{
    local /*0x97E50000-0x00000000*/ private int InHealth[8388609], InHealthMax;
    local /*0x97E50000-0x00000000*/ private float T;
    local /*0x97E50000-0x00000000*/ private @NULL TDMH, MH;

    Health = InHealth;
    HealthMax = InHealthMax;
    MH = LPPerkMoreHealth(GetEnabledPerk(19));
    // End:0x132
    if(MH != none)
    {
        TDMH = MH.MoreHealthTuneData;
        // End:0x132
        if(TDMH != none)
        {
            T = TDMH.HealthModifier.GetValue(SavedController) / float(100);
            HealthMax = int(float(InHealthMax) + (float(InHealthMax) * T));
            // End:0x132
            if(InHealthMax == InHealth)
            {
                Health = HealthMax;
            }
        }
    }
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
    if((LPDT == none) || !LPDT.default.bAllowMomentumTransferForPof)
    {
        return;
    }
    super(LPPawn).AddVelocity(NewVelocity, HitLocation, DamageType, HitInfo);
    //return;    
}

simulated function AbortGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL Hook;

    // End:0x1E
    if(int(Role) == int(ROLE_Authority))
    {
        MultiCastAbortGrapple();
    }
    Hook = GetGrapplingHook();
    // End:0x60
    if(Hook != none)
    {
        Hook.AbortIfNecessary();
    }
    GrappleActor = none;
    bGrappleHooked = false;
    //return;    
}

reliable client simulated function MultiCastAbortGrapple()
{
    // End:0x16
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    AbortGrapple();
    //return;    
}

simulated function CanBeginGrapple()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vF, vTemp;
    local /*0x97E50000-0x00000000*/ private float dotprod;

    vF = Vector(Rotation);
    vTemp = GrappleDir;
    vTemp.Z = 0.0000000;
    vTemp = Normal(vTemp);
    dotprod = vF Dot vTemp;
    // End:0x92
    if(dotprod < 0.9960000)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function OnGrappleHookConnected()
{
    //return;    
}

simulated function StopGrappling()
{
    //return;    
}

function OnReachedGrapple()
{
    //return;    
}

simulated function OnGrapplingFinishedAnimBegin()
{
    //return;    
}

simulated function PlayTrollyAnim()
{
    local /*0x97E50000-0x00000000*/ private name InAnimName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InFinishedCallback[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL AnimNodeSeq;

    // End:0x1A
    if(InAnimName == 'None')
    {
        return;
    }
    ZiplineTrolleyComponent.PlayAnim(InAnimName);
    AnimNodeSeq = SPAnimNodeSequence(ZiplineTrolleyComponent.Animations);
    // End:0x125
    if((AnimNodeSeq == none) && ZiplineTrolleyComponent.Animations.IsA('AnimTree'))
    {
        AnimNodeSeq = SPAnimNodeSequence(AnimTree(ZiplineTrolleyComponent.Animations).Children[0].Anim);
    }
    // End:0x15F
    if(AnimNodeSeq == none)
    {
        // End:0x15D
        if(InFinishedCallback != none)
        {
            SPOnAnimationFinished(none, -1, true);
        }
        return;
    }
    // End:0x1B7
    if(InFinishedCallback != none)
    {
        AnimNodeSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
        AnimNodeSeq.SetAnimationFinishedDelegate(InFinishedCallback);
    }
    //return;    
}

reliable client simulated function MultiCastShowTrolly()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x16
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    // End:0x30
    if(bShow)
    {
        PlayShowTrolly();        
    }
    else
    {
        PlayHideTrolly();
    }
    //return;    
}

simulated function PlayShowTrolly()
{
    // End:0x1F
    if(int(Role) == int(ROLE_Authority))
    {
        MultiCastShowTrolly(true);
    }
    ShowTrolly();
    PlayTrollyAnim('PRP_ziplin_hookxx_Zipline_Hook_Open_Core');
    //return;    
}

simulated function PlayHideTrolly()
{
    // End:0x1F
    if(int(Role) == int(ROLE_Authority))
    {
        MultiCastShowTrolly(false);
    }
    PlayTrollyAnim('PRP_ziplin_hookxx_Zipline_Hook_Close_Core', HideTrolly);
    //return;    
}

simulated function ShowTrolly()
{
    ZiplineTrolleyComponent.SetHidden(false);
    //return;    
}

simulated function IsTrollyShown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ZiplineTrolleyComponent.HiddenGame;
    //return ReturnValue;    
}

simulated function HideTrolly()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimNodeSeq;

    AnimNodeSeq = SPAnimNodeSequence(ZiplineTrolleyComponent.Animations);
    // End:0xDE
    if((AnimNodeSeq == none) && ZiplineTrolleyComponent.Animations.IsA('AnimTree'))
    {
        AnimNodeSeq = SPAnimNodeSequence(AnimTree(ZiplineTrolleyComponent.Animations).Children[0].Anim);
    }
    // End:0x10D
    if(AnimNodeSeq != none)
    {
        AnimNodeSeq.ClearAnimationFinishedDelegate();
    }
    ZiplineTrolleyComponent.SetHidden(true);
    //return;    
}

function StartZiplineSound()
{
    // End:0xD3
    if(PawnZiplineSoundComponent == none)
    {
        PawnZiplineSoundComponent = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('WinchZip', 'None', self, Mesh, none));
        // End:0xD0
        if(PawnZiplineSoundComponent != none)
        {
            PawnZiplineSoundComponent.bAutoDestroy = false;
            PawnZiplineSoundComponent.bStopWhenOwnerDestroyed = true;
            PawnZiplineSoundComponent.Play();
        }        
    }
    else
    {
        PawnZiplineSoundComponent.Stop();
        PawnZiplineSoundComponent.Play();
    }
    //return;    
}

function StopZiplineSound()
{
    // End:0x2E
    if(PawnZiplineSoundComponent != none)
    {
        PawnZiplineSoundComponent.Stop();
    }
    //return;    
}

function StartZiplineReleaseSound()
{
    // End:0xD3
    if(PawnZiplineReleaseSoundComponent == none)
    {
        PawnZiplineReleaseSoundComponent = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('WinchZipRelease', 'None', self, Mesh, none));
        // End:0xD0
        if(PawnZiplineReleaseSoundComponent != none)
        {
            PawnZiplineReleaseSoundComponent.bAutoDestroy = true;
            PawnZiplineReleaseSoundComponent.bStopWhenOwnerDestroyed = true;
            PawnZiplineReleaseSoundComponent.Play();
        }        
    }
    else
    {
        PawnZiplineReleaseSoundComponent.Stop();
        PawnZiplineReleaseSoundComponent.Play();
    }
    //return;    
}

simulated function FindBestZiplineWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPW;

    // End:0x11
    if(InvManager == none)
    {
        return none;
    }
    // End:0x76
    foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
    {
        // End:0x75
        if(LPW.bCanUseOnZipline == true)
        {            
            return LPW;
        }        
    }    
    return none;
    //return ReturnValue;    
}

simulated function SetBestZiplineWeapon()
{
    // End:0x30
    if(LPWeapon(Weapon).bCanUseOnZipline == true)
    {
        return;
    }
    StopFiring();
    AbortWeaponReload();
    Weapon.GotoState('Active');
    InvManager.SetCurrentWeapon(FindBestZiplineWeapon());
    //return;    
}

simulated function TrySpitterAcidReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[25296897], SM;

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    // End:0x50
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && IsUsingCover())
    {
        return;
    }
    // End:0x77
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRollBase') || bIncapacitated)
    {
        return;
    }
    SM = LPSM_HitReactionFromSpitterAcidDOT(GetSpecialMoveInstance(Class'LPSM_HitReactionFromSpitterAcidDOT'));
    SM.SetDOTInfo(DOTInfo);
    SM = LPSM_HitReactionFromSpitterAcidDOT(GetCurrentSpecialMoveInstance());
    // End:0x141
    if(!IsDoingSpecialMove(Class'LPSM_HitReactionFromSpitterAcidDOT'))
    {
        ServerDoSpecialMove(Class'LPSM_HitReactionFromSpitterAcidDOT', true,,, DOTInfo.DamageCauser.Pawn);
    }
    //return;    
}

simulated function DamageOverTimeStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[25296897];

    // End:0x3E
    if(ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeSpitterAcidDOT'))
    {
        TrySpitterAcidReaction(DOTInfo);
    }
    //return;    
}

simulated function DamageOverTimeUpdated()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[25296897];

    // End:0x3E
    if(ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeSpitterAcidDOT'))
    {
        TrySpitterAcidReaction(DOTInfo);
    }
    //return;    
}

simulated event DamageOverTimeFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[25296897];

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    // End:0x54
    if(ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeSpitterAcidDOT'))
    {
        ServerEndSpecialMove(Class'LPSM_HitReactionFromSpitterAcidDOT');
    }
    //return;    
}

simulated function ShouldAllowFullBodyHitReactionForDamageType()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeSpitterAcidDOT'))
    {
        return false;
    }
    // End:0x92
    if((IsUsingCover() && int(CoverType) == int(3)) && class<LPDamageType>(TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function NotifyMovePlayerToGrapplePoint()
{
    //return;    
}

function NotifyStopPlayerFalling()
{
    //return;    
}

function NotifyStartPlayerFalling()
{
    //return;    
}

function NotifyShootGrappleHook()
{
    //return;    
}

simulated function OnGrappleDownBegin()
{
    //return;    
}

simulated function OnGrappleDownDrop()
{
    //return;    
}

simulated function OnGrappleDownLanded()
{
    //return;    
}

simulated function GrappleStartNotify()
{
    //return;    
}

simulated function GrappleFallNotify()
{
    //return;    
}

simulated function CheckGrappleFall()
{
    //return;    
}

simulated function EnterVSMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    StopGrappling();
    //return;    
}

simulated function GrappleDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeapOff[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Hook;

    GrappleDir = Vector(GrappleHookTarget.Rotation) * float(-1);
    Hook = GetGrapplingHook();
    Hook.SetupCable(self);
    GrappleActorLocation = GrappleHookTarget.GetGrappleDownPoint(self);
    Hook.GrapplePoint = GrappleActorLocation;
    // End:0xD9
    if(bLeapOff)
    {
        GotoState('PlayerGrappleLeap');        
    }
    else
    {
        GotoState('PlayerGrappleDownAttach');
    }
    //return;    
}

reliable client simulated function MultiCastGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeapOff[8388609];

    // End:0x16
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    GrappleDown(GrappleHookTarget, bLeapOff);
    //return;    
}

reliable server function ServerGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeapOff[8388609];

    // End:0x11
    if(GrappleHookTarget == none)
    {
        return;
    }
    // End:0x22
    if(!IsAliveAndWell())
    {
        return;
    }
    GrappleActor = GrappleHookTarget;
    // End:0x91
    if(SavedController.DoPlayerGrapplingDownState())
    {
        MultiCastGrappleDown(GrappleHookTarget, bLeapOff);
        GrappleDown(GrappleHookTarget, bLeapOff);
    }
    //return;    
}

reliable server function ServerDoFallRappelRecovery()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrapplePoint;

    // End:0x11
    if(GrappleHookTarget == none)
    {
        return;
    }
    GrappleActorLocation = InGrapplePoint;
    GrapplePoint = InGrapplePoint;
    SavedController.SetGrappleHookCurrentTarget(GrappleHookTarget);
    SavedController.GotoState('PlayerFallRappelRecovery');
    //return;    
}

reliable client simulated function MultiCastDoFallRappelRecovery()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrapplePoint, Hook;

    // End:0x16
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Hook = GetGrapplingHook();
    Hook.SetupCable(self);
    DoFallRappelRecovery(GrappleHookTarget, InGrapplePoint);
    //return;    
}

simulated function DoFallRappelRecovery()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrapplePoint, Hook;

    GrappleDir = Vector(GrappleHookTarget.Rotation) * float(-1);
    Hook = GetGrapplingHook();
    GrappleActorLocation = InGrapplePoint;
    GrapplePoint = InGrapplePoint;
    Hook.SetupCable(self);
    Hook.GrapplePoint = InGrapplePoint;
    bGrappleHooked = false;
    GotoState('PlayerFallRappelRecovery');
    //return;    
}

reliable client simulated function MultiCastGrappleTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrappleActorLocation, InCollisionAdjustedGrappleLocation, Hook;

    // End:0x16
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    Hook = GetGrapplingHook();
    Hook.SetupCable(self);
    GrappleActorLocation = InGrappleActorLocation;
    GrappleTo(GrappleHookTarget, InGrappleActorLocation, InCollisionAdjustedGrappleLocation);
    //return;    
}

simulated function GrappleTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrappleActorLocation, InCollisionAdjustedGrappleLocation, Hook;

    Hook = GetGrapplingHook();
    // End:0x80
    if(Hook != none)
    {
        GrappleActor = GrappleHookTarget;
        GrappleActorLocation = InGrappleActorLocation;
        // End:0x80
        if(GrappleHookTarget != none)
        {
            Hook.GrapplePoint = InCollisionAdjustedGrappleLocation;
        }
    }
    BeginGrapple();
    //return;    
}

reliable server function ServerPlayerFallingGrappleTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrappleLocation;

    // End:0x11
    if(GrappleHookTarget == none)
    {
        return;
    }
    SetupGrappleBonus(InGrappleLocation);
    GrappleActorLocation = InGrappleLocation;
    SavedController.SetGrappleHookCurrentTarget(GrappleHookTarget);
    SavedController.GotoState('PlayerFallGrappelRecovery');
    //return;    
}

reliable server function ServerGrappleTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrappleActorLocation, InCollisionAdjustedGrappleLocation;

    // End:0x11
    if(GrappleHookTarget == none)
    {
        return;
    }
    SetupGrappleBonus(InGrappleActorLocation);
    GrappleActor = GrappleHookTarget;
    // End:0xB7
    if(SavedController.DoPlayerGrapplingState())
    {
        GrappleActorLocation = InGrappleActorLocation;
        MultiCastGrappleTo(GrappleHookTarget, InGrappleActorLocation, InCollisionAdjustedGrappleLocation);
        GrappleTo(GrappleHookTarget, InGrappleActorLocation, InCollisionAdjustedGrappleLocation);
    }
    //return;    
}

simulated function BeginGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL Hook;

    // End:0x11
    if(!IsAliveAndWell())
    {
        return;
    }
    Hook = GetGrapplingHook();
    // End:0x57
    if(Hook != none)
    {
        Hook.GotoState('Firing');
    }
    GotoState('PlayerGrappling');
    bGrappleHooked = false;
    //return;    
}

reliable server function ServerDeployTotem()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];

    DeployTotem(PerkIndex);
    //return;    
}

function DeployTotem()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot, Perk, Totem, TD;

    Perk = LPPerkDeployable(GetEnabledPerk(PerkIndex));
    // End:0x21C
    if(Perk != none)
    {
        TD = LPTuneDataPerkBeaconBase(Perk.GetTuneData());
        // End:0x21C
        if(TD != none)
        {
            // End:0x21C
            if(float(Perk.GetNumActivePips()) < TD.MaxNumberDeployed.GetValue())
            {
                Mesh.GetSocketWorldLocationAndRotation(TD.DeploymentSocket, Loc, Rot);
                Totem = Spawn(TD.BeaconObjectClass,,, Loc, Rot);
                // End:0x1D4
                if(Totem != none)
                {
                    Totem.Velocity = (Vector(GetAimDirection()) + vect(0.0000000, 0.0000000, 0.4000000)) * TD.DeploymentVelocity;
                }
                AddThermalEnergy(-1.0000000 * TD.DeploymentCost.GetValue(), false);
            }
        }
    }
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPGame;

    super(Pawn).PossessedBy(C, bVehicleTransition);
    MyLPPRI = LPPRI(self.PlayerReplicationInfo);
    MPGame = LPGameMP_Base(WorldInfo.Game);
    // End:0xE4
    if(MPGame != none)
    {
        NetUpdateFrequency = float(MPGame.NetFrequencyOverride);
        LPPlayerController(C).NetUpdateFrequency = NetUpdateFrequency;        
    }
    else
    {
        NetUpdateFrequency = Class'LPPlayerPawn'.default.NetUpdateFrequency;
    }
    //return;    
}

function UnPossessed()
{
    super(Pawn).UnPossessed();
    MyLPPRI = none;
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float cosVal;

    TuneDataPlayerPawn = LPTuneDataPlayerPawn(TuneData);
    // End:0x53
    if(TuneDataPlayerPawn != none)
    {
        AimYawThreshold = TuneDataPlayerPawn.AimYawThreshold;
    }
    super.InitTuneData(TuneData);
    // End:0x10B
    if(((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(WorldInfo.NetMode) != int(NM_Client)) && Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_Standalone))
    {
        FloorConformInfo.ConformType = 0;
        bFastFootplacement = true;
    }
    // End:0x208
    if(TuneDataPlayerPawn != none)
    {
        iter = 0;
        J0x125:

        // End:0x208 [Loop If]
        if(iter < TuneDataPlayerPawn.DodgeRollImmunityInfo.Length)
        {
            Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(TuneDataPlayerPawn.DodgeRollImmunityInfo[iter].AngleOfImmunityExclusionInDegrees, cosVal);
            TuneDataPlayerPawn.DodgeRollImmunityInfo[iter].CosOfAngleOfImmunityExclusion = cosVal;
            ++iter;
            // [Loop Continue]
            goto J0x125;
        }
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    CheckCSAForSwitchToBestWeapon();
    // End:0x49
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        bPreventWeaponFireAtTeammates = true;
    }
    InitGrenades();
    // End:0x96
    if(MyLPPRI != none)
    {
        MyLPPRI.PerksManager.DeactivateDeploymentMode();
    }
    InitJobLogAttachedComponents();
    InitRepairAndReviveMaterials();
    //return;    
}

function InitJobLogAttachedComponents()
{
    // End:0x52
    if((JobLogLightComponent != none) && JobLogLightComponent.bAttached)
    {
        JobLogLightComponent.DetachFromAny();
    }
    // End:0xA4
    if((JobLogProjectionConeComponent != none) && JobLogProjectionConeComponent.bAttached)
    {
        JobLogProjectionConeComponent.DetachFromAny();
    }
    //return;    
}

simulated function InitRepairAndReviveMaterials()
{
    local /*0x97E50000-0x00000000*/ private @NULL Instance;

    // End:0x73
    if((RepairScreenProjectionMinigameMaterialInstance == none) && RepairScreenProjectionMinigameMaterial != none)
    {
        Instance = new (self) Class'Engine.MaterialInstanceConstant';
        Instance.SetParent(RepairScreenProjectionMinigameMaterial);
        RepairScreenProjectionMinigameMaterialInstance = Instance;
    }
    // End:0xE6
    if((RepairScreenProjectionSimpleMaterialInstance == none) && RepairScreenProjectionSimpleMaterial != none)
    {
        Instance = new (self) Class'Engine.MaterialInstanceConstant';
        Instance.SetParent(RepairScreenProjectionSimpleMaterial);
        RepairScreenProjectionSimpleMaterialInstance = Instance;
    }
    //return;    
}

simulated function CheckForFalling()
{
    // End:0x2E
    if(SavedController != none)
    {
        SavedController.CheckForFalling();
    }
    //return;    
}

exec function ExitVSSpec()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Param[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x2A
    if(InStr(Param, "Exit", false, true) != -1)
    {
        ExitType = 0;
    }
    // End:0x54
    if(InStr(Param, "Soft", false, true) != -1)
    {
        ExitType = 1;
    }
    // End:0x7E
    if(InStr(Param, "Hard", false, true) != -1)
    {
        ExitType = 2;
    }
    // End:0xAA
    if(InStr(Param, "Normal", false, true) != -1)
    {
        ExitStyle = 0;
    }
    // End:0xD3
    if(InStr(Param, "Add", false, true) != -1)
    {
        ExitStyle = 1;
    }
    // End:0xFE
    if(InStr(Param, "Front", false, true) != -1)
    {
        ExitDirection = 0;
    }
    // End:0x128
    if(InStr(Param, "Back", false, true) != -1)
    {
        ExitDirection = 1;
    }
    // End:0x152
    if(InStr(Param, "Safe", false, true) != -1)
    {
        ExitDirection = 2;
    }
    // End:0x1A0
    if((InStr(Param, "Clear", false, true) != -1) || InStr(Param, "Reset", false, true) != -1)
    {
        bUseExitSpec = false;
        return;
    }
    // End:0x346
    if(InStr(Param, "Help", false, true) != -1)
    {
        LPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
        // End:0x344
        if(LPC != none)
        {
            LPC.ClientMessage("ExitVS Spec Clear param: Clear");
            LPC.ClientMessage("ExitVS Spec Exit/Eject Type param: Exit, Soft, Hard");
            LPC.ClientMessage("ExitVS Spec Style param: Normal, Add");
            LPC.ClientMessage("ExitVS Spec Direction param: Front, Back, Safe");
        }
        return;
    }
    bUseExitSpec = true;
    //return;    
}

function DetectDangerFrontBack()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnInDanger[8388609];
    local /*0x97E50000-0x00000000*/ private int bFrontOk[25165825], bBackOk;
    local /*0x97E50000-0x00000000*/ private @NULL AngularDist, toPawn, AxisX, AxisY, AxisZ, akrid;

    local /*0x97E50000-0x00000000*/ private float dSq;
    local /*0x97E50000-0x00000000*/ private bool bIsInFront;

    bFrontOk = 1;
    bBackOk = 1;
    PawnInDanger.GetAxes(PawnInDanger.Rotation, AxisX, AxisY, AxisZ);
    // End:0x1F0
    foreach WorldInfo.AllPawns(Class'LPAIPawnAkrid', akrid)
    {
        // End:0xCD
        if(ClassIsChildOf(akrid.Class, Class'LPAIPawnMedFlyer'))
        {
            continue;            
        }
        toPawn = akrid.Location - PawnInDanger.Location;
        dSq = VSizeSq2D(toPawn);
        // End:0x163
        if(!akrid.CheckExitVSDangerousRange(dSq))
        {
            continue;            
        }
        bIsInFront = GetAngularDistance(AngularDist, toPawn, AxisX, AxisY, AxisZ);
        // End:0x1D2
        if(bIsInFront)
        {
            bFrontOk = 0;
            // End:0x1CF
            if(bBackOk == 0)
            {                
                return;
            }
            // End:0x1EF
            continue;
        }
        bBackOk = 0;
        // End:0x1EF
        if(bFrontOk == 0)
        {            
            return;
        }        
    }    
    //return;    
}

simulated function SetupVSExit()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], vsPawn, Winch;
    local /*0x97E50000-0x00000000*/ private class ReceivedDamageType;
    local /*0x97E50000-0x00000000*/ private bool bIsEject, bIsHardEject;
    local /*0x97E50000-0x00000000*/ private int bIsFrontOk, bIsBackOk;
    local /*0x97E50000-0x00000000*/ private bool bIsInMove, bIsAdditiveOk;

    // End:0x0F
    if(bUseExitSpec)
    {
        return;
    }
    ExitType = 0;
    ExitDirection = 0;
    ExitStyle = 0;
    // End:0x55
    if((LPC == none) || vsPawn == none)
    {
        return;
    }
    Winch = LPWeaponVSWinch(vsPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x161
    if((Winch != none) && Winch.IsInState('WinchPointInteracting'))
    {
        // End:0x146
        if(Winch.SpawnedProjectile.AttachedWinchPoint.bUseAsZipline && vsPawn.IsAliveAndWell())
        {
            ExitStyle = 2;            
        }
        else
        {
            ExitStyle = 1;
            ExitDirection = 1;
        }        
    }
    else
    {
        // End:0x17D
        if(bDeployPlatform)
        {
            ExitStyle = 3;            
        }
        else
        {
            // End:0x1E3
            if(vsPawn.TakeDamageParams.DamageType == Class'LPDamageTypeAct1BossMelee')
            {
                ExitType = 3;
                ExitDirection = 1;
                ExitStyle = 0;                
            }
            else
            {
                bIsAdditiveOk = true;
                bIsInMove = vsPawn.IsDoingASpecialMove();
                DetectDangerFrontBack(vsPawn, bIsFrontOk, bIsBackOk);
                bIsEject = vsPawn.Health <= 0;
                // End:0x394
                if((vsPawn.TakeDamageParams.DamageType != none) && (WorldInfo.TimeSeconds - vsPawn.TakeDamageParams.Time) <= WorldInfo.DeltaSeconds)
                {
                    ReceivedDamageType = class<SPDamageType>(vsPawn.TakeDamageParams.DamageType);
                    // End:0x394
                    if(ReceivedDamageType != none)
                    {
                        bIsHardEject = ReceivedDamageType.default.bIsConcussive;
                    }
                }
                // End:0x3E6
                if(!bIsEject)
                {
                    // End:0x3E6
                    if(vsPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrab_Base'))
                    {
                        bIsEject = true;
                        bIsHardEject = false;
                    }
                }
                // End:0x404
                if(!bIsEject)
                {
                    ExitType = 0;                    
                }
                else
                {
                    // End:0x420
                    if(bIsHardEject)
                    {
                        ExitType = 2;                        
                    }
                    else
                    {
                        ExitType = 1;
                    }
                }
                // End:0x44A
                if(!bIsInMove)
                {
                    ExitStyle = 0;                    
                }
                else
                {
                    // End:0x46E
                    if(bIsAdditiveOk)
                    {
                        ExitStyle = 1;
                        bIsFrontOk = 0;
                    }
                }
                // End:0x4AA
                if(ClassIsChildOf(vsPawn.Class, Class'LPVSFuturePlayerPawn'))
                {
                    ExitDirection = 0;                    
                }
                else
                {
                    // End:0x4C6
                    if(bForceRearVSExit)
                    {
                        ExitDirection = 1;                        
                    }
                    else
                    {
                        // End:0x4F3
                        if(LPC.AkridOnFrontOfCockPit())
                        {
                            bIsFrontOk = 0;
                        }
                        // End:0x511
                        if(bIsFrontOk == 1)
                        {
                            ExitDirection = 0;                            
                        }
                        else
                        {
                            // End:0x52F
                            if(bIsBackOk == 1)
                            {
                                ExitDirection = 1;                                
                            }
                            else
                            {
                                ExitDirection = 2;
                                ExitStyle = 1;
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

simulated function SetupVSEntry()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], vsPawn, VSFacing, VSLeft;
    local /*0x97E50000-0x00000000*/ private bool bInFront;

    // End:0x0F
    if(bUseExitSpec)
    {
        return;
    }
    ExitType = 0;
    ExitDirection = 0;
    ExitStyle = 0;
    // End:0x55
    if((LPC == none) || vsPawn == none)
    {
        return;
    }
    // End:0x142
    if(ClassIsChildOf(vsPawn.Class, Class'LPPlayerTurretPawn'))
    {
        ExitStyle = 4;
        VSFacing = Vector(vsPawn.Rotation);
        VSLeft = VSFacing Cross vect(0.0000000, 0.0000000, 1.0000000);
        bInFront = (Normal(vsPawn.Location - Location) Dot VSLeft) < 0.0000000;
        ExitDirection = ((bInFront) ? 3 : 4);        
    }
    else
    {
        // End:0x15E
        if(bUseZiplineVSTransition)
        {
            ExitStyle = 2;            
        }
        else
        {
            // End:0x17A
            if(bDeployPlatform)
            {
                ExitStyle = 3;                
            }
            else
            {
                VSFacing = Vector(vsPawn.Rotation);
                bInFront = (Normal(vsPawn.Location - Location) Dot VSFacing) < 0.0000000;
                ExitDirection = ((bInFront) ? 0 : 1);
                // End:0x29D
                if((vsPawn.IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin') || vsPawn.IsDoingSpecialMove(Class'LPSM_VSPlatformMode')) || vsPawn.IsDoingSpecialMove(Class'LPSM_PlayerVSWinchWinchPoint'))
                {
                    ExitStyle = 0;                    
                }
                else
                {
                    // End:0x331
                    if((vsPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchArmGrabbedPawn') || vsPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchStun')) || vsPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrab_Base'))
                    {
                        ExitStyle = 1;                        
                    }
                    else
                    {
                        ExitStyle = 5;
                    }
                }
            }
        }
    }
    //return;    
}

simulated function PlayVSExit()
{
    // End:0x11
    if(SavedController == none)
    {
        return;
    }
    // End:0x68
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        SavedController.bPlayVSExit = false;
        SetHidden(false);
        return;
    }
    // End:0x79
    if(!IsLocallyControlled())
    {
        return;
    }
    SavedController.bPlayVSExit = false;
    SetTimer(0.0600000, false, 'BecomeVisible');
    // End:0x177
    if(((int(ExitType) == int(0)) && int(ExitStyle) != int(1)) || LPVSFuturePlayerPawn(SavedController.ExitVSPawn) != none)
    {
        SavedController.DoSpecialMove(Class'LPSM_PlayerExitVS', true, false, SavedController.On_LPSM_PlayerExitVS_Done, SavedController.ExitVSPawn);        
    }
    else
    {
        SavedController.DoSpecialMove(Class'LPSM_PlayerEjectedFromVS', true, false, SavedController.On_LPSM_PlayerExitVS_Done, SavedController.ExitVSPawn);
    }
    //return;    
}

function PlayVSEnter()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMoveToPlay;

    // End:0x174
    if(((int(ExitType) == int(0)) && int(ExitStyle) != int(1)) || LPVSFuturePlayerPawn(SavedController.ExitVSPawn) != none)
    {
        switch(ExitStyle)
        {
            // End:0xA6
            case 4:
                SpecialMoveToPlay = ((int(ExitDirection) == int(3)) ? Class'LPSM_PlayerEnterVS_TurretLeft' : Class'LPSM_PlayerEnterVS_TurretRight');
                // End:0x171
                break;
            // End:0xC1
            case 2:
                SpecialMoveToPlay = Class'LPSM_PlayerEnterVS_Zipline';
                // End:0x171
                break;
            // End:0xDC
            case 3:
                SpecialMoveToPlay = Class'LPSM_PlayerEnterVS_Platform';
                // End:0x171
                break;
            // End:0x158
            case 0:
                // End:0x123
                if(bUseShortVSEntry)
                {
                    SpecialMoveToPlay = ((int(ExitDirection) == int(0)) ? Class'LPSM_PlayerEnterVS_FrontShort' : Class'LPSM_PlayerEnterVS_RearShort');                    
                }
                else
                {
                    SpecialMoveToPlay = ((int(ExitDirection) == int(0)) ? Class'LPSM_PlayerEnterVS_Front' : Class'LPSM_PlayerEnterVS_Rear');
                }
                // End:0x171
                break;
            // End:0xFFFF
            default:
                SpecialMoveToPlay = Class'LPSM_PlayerEnterVS';
                // End:0x171
                break;
                break;
        }        
    }
    else
    {
        SpecialMoveToPlay = Class'LPSM_PlayerEnterVSAdditive';
    }
    ServerDoSpecialMove(SpecialMoveToPlay, true, false,, SavedController.ExitVSPawn);
    //return;    
}

simulated function IsPawnAMeleeTakedownTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL VictimPawn[8388609], KillerFacingRot;
    local /*0x97E50000-0x00000000*/ private float fFrontFacingDotProduct[8388609], fRearFacingDotProduct, DistanceBetween;
    local /*0x97E50000-0x00000000*/ private byte RejectionReason[26214401];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistanceApart;
    local /*0x97E50000-0x00000000*/ private @NULL VictimFacingRot, VictimFacing, KillerFacing, KillerToVictim;
    local /*0x97E50000-0x00000000*/ private float DotResult;
    local /*0x97E50000-0x00000000*/ private byte Reason;
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawnLoc;
    local /*0x97E50000-0x00000000*/ private float CollisionHeight;

    Reason = 1;
    DistanceApart = DistanceBetweenCollisionCylinders(VictimPawn);
    // End:0x261
    if(DistanceApart <= TuneDataPlayerPawn.MaxDistanceCandidateForChoreography)
    {
        Reason = 2;
        // End:0x261
        if(DistanceApart <= TuneDataPlayerPawn.MeleeTakedownRange.GetValue())
        {
            Reason = 4;
            VictimFacingRot = MatrixGetRotator(VictimPawn.Mesh.GetBoneMatrix(VictimPawn.Mesh.MatchRefBone('JO_hip')));
            VictimFacingRot.Yaw += 16384;
            VictimFacing = Vector(VictimFacingRot);
            KillerFacing = Vector(KillerFacingRot);
            KillerToVictim = Normal(VictimPawn.Location - Location);
            DotResult = VictimFacing Dot KillerFacing;
            // End:0x261
            if(DotResult >= fFrontFacingDotProduct)
            {
                Reason = 3;
                DotResult = KillerToVictim Dot (VictimFacing * float(-1));
                // End:0x261
                if(DotResult < float(0))
                {
                    Reason = 4;
                    // End:0x261
                    if(Abs(DotResult) >= fRearFacingDotProduct)
                    {
                        Reason = 0;
                    }
                }
            }
        }
    }
    DistanceBetween = DistanceApart;
    RejectionReason = Reason;
    // End:0x36A
    if(int(Reason) == int(0))
    {
        OtherPawnLoc = VictimPawn.Location;
        CollisionHeight = GetCollisionHeight();
        // End:0x336
        if(Abs(Location.Z - OtherPawnLoc.Z) > (CollisionHeight / float(4)))
        {
            Reason = 2;            
        }
        else
        {
            // End:0x36A
            if(!FastTrace(OtherPawnLoc, Location, vect(1.0000000, 1.0000000, 1.0000000)))
            {
                Reason = 2;
            }
        }
    }
    return int(Reason) == int(0);
    //return ReturnValue;    
}

simulated event TornOff()
{
    super(Pawn).TornOff();
    SavedController = none;
    //return;    
}

simulated event @NULL Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL RepairComp, BaseVSPlayerPawn, FutureVSPlayerPawn;
    local /*0x97E50000-0x00000000*/ private bool bClearEnterVSMessage, bPCBuild;

    // End:0x3C
    if((SavedController == none) && Controller != none)
    {
        SavedController = LPPlayerController(Controller);
    }
    // End:0x6A
    if(SavedController != none)
    {
        SavedController.ZiplineTick();
    }
    // End:0x113
    if(((int(Role) == int(ROLE_Authority)) && !IsLocallyControlled()) && !IsAiming())
    {
        // End:0x113
        if((SavedController != none) && SavedController.PlayerCamera != none)
        {
            WorldAimDir = SavedController.PlayerCamera.GetCameraRotation();
        }
    }
    super.Tick(DeltaTime);
    // End:0x15E
    if(SnowBlendTime == 0.0000000)
    {
        SnowPercent = SnowMinimum;
        SnowBlendTime = -1.0000000;        
    }
    else
    {
        // End:0x1B8
        if(SnowBlendTime > float(0))
        {
            SnowBlendTime -= DeltaTime;
            SnowPercent = Lerp(SnowPercent, SnowMinimum, DeltaTime / SnowBlendTime);            
        }
        else
        {
            // End:0x1FB
            if(SnowPercent < SnowMinimum)
            {
                SnowPercent = SnowPercent + (SnowMeltRate * DeltaTime);                
            }
            else
            {
                SnowPercent = FMax(SnowMinimum, SnowPercent - (SnowMeltRate * DeltaTime));
            }
        }
    }
    // End:0x2B7
    if(SavedController != none)
    {
        // End:0x26C
        if(!SavedController.bIsInVitalSuit)
        {
            CheckForFalling();
        }
        SavedController.UpdateLastSolidFootingLocation();
        // End:0x2B7
        if(SavedController.bPlayVSExit)
        {
            PlayVSExit();
        }
    }
    // End:0x2C8
    if(!IsLocallyControlled())
    {
        return;
    }
    // End:0x996
    if(WorldInfo.TimeSeconds >= NextVSCheckTime)
    {
        NextVSCheckTime = WorldInfo.TimeSeconds + 0.2000000;
        bCanRepair = false;
        RepairComp = FindNearestValidRepairComponent();
        // End:0x5BB
        if((((RepairComp != none) && Health > 0) && !bIncapacitated) && Controller.LineOfSightTo(RepairComp.Owner, Location))
        {
            bCanRepair = true;
            // End:0x5BB
            if(!IsDoingASpecialMove())
            {
                ClosestValidRepairableActor = RepairComp.Owner;
                bPCBuild = !Class'Engine.WorldInfo'.static.IsConsoleBuild(0);
                // End:0x5BB
                if(!SavedController.myLPHUD.IsMessageLayerActive(11))
                {
                    // End:0x540
                    if((RepairComp.bUseSimpleRepair || bPCBuild) || int(WorldInfo.NetMode) != int(NM_Standalone))
                    {
                        SavedController.myLPHUD.DisplayHUDMessageLayer(11, "<Strings:LostPlanetGame.Tutorials.VSREPAIRPRESSHOLDPROMPT>");                        
                    }
                    else
                    {
                        SavedController.myLPHUD.DisplayHUDMessageLayer(11, "<Strings:LostPlanetGame.Tutorials.VSREPAIRMINIGAMEPROMPT>");
                    }
                }
            }
        }
        // End:0x62E
        if(SavedController.myLPHUD.IsMessageLayerActive(11) && !bCanRepair)
        {
            ClearRepairHUDMessage();
            SavedController.RefreshMunitionsLockerDisplay();
        }
        // End:0x67B
        if(!bCanRepair || !bWantsToRepair)
        {
            bWantsToRepair = false;
            // End:0x67B
            if(IsDoingSpecialMove(Class'LPSM_PlayerRepairSimple'))
            {
                LocalEndCurrentSpecialMove();
            }
        }
        bClearEnterVSMessage = true;
        // End:0x821
        if((!IsDoingASpecialMove() && SavedController.CanEnterAnyVitalSuit()) && int(Physics) != int(4))
        {
            BaseVSPlayerPawn = SavedController.FindBestVSToEnter(false);
            // End:0x821
            if(((BaseVSPlayerPawn != none) && BaseVSPlayerPawn.GetTeam() == none) && !BaseVSPlayerPawn.bIsPlatformMode || BaseVSPlayerPawn.bIsPlatformModeFinished)
            {
                bClearEnterVSMessage = false;
                // End:0x821
                if(!SavedController.myLPHUD.IsMessageLayerActive(22))
                {
                    SavedController.myLPHUD.DisplayHUDMessageLayer(22, BaseVSPlayerPawn.EnterPromptString);
                }
            }
        }
        // End:0x864
        if(bClearEnterVSMessage)
        {
            SavedController.myLPHUD.RemoveMessageLayer(22);
        }
        // End:0x960
        if((!IsDoingASpecialMove() && SavedController.CanEnterAnyVitalSuit()) && SavedController.GetFutureVSThatWeAreBehind(FutureVSPlayerPawn))
        {
            // End:0x95D
            if(!SavedController.myLPHUD.IsMessageLayerActive(21))
            {
                SavedController.myLPHUD.DisplayHUDMessageLayer(21, FutureVSPlayerPawn.RotateVSPromptString);
            }            
        }
        else
        {
            SavedController.myLPHUD.RemoveMessageLayer(21);
        }
    }
    // End:0x9C9
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        UpdateQueuedChatterAkEvents();
    }
    // End:0xA33
    if(((GetMyLPPRI()) != none) && MyLPPRI.PerksManager != none)
    {
        MyLPPRI.PerksManager.Tick();
    }
    //return;    
}

function ClearRepairHUDMessage()
{
    // End:0x45
    if(SavedController != none)
    {
        SavedController.myLPHUD.RemoveMessageLayer(11);
    }
    //return;    
}

function DisplayRepairInstructionMessage()
{
    SavedController.myLPHUD.DisplayHUDMessageLayer(11, "<Strings:LostPlanetGame.Tutorials.VSREPAIRMINIGAMEINSTRUCT>");
    //return;    
}

function ClearRepairInstructionMessage()
{
    ClearRepairHUDMessage();
    //return;    
}

simulated function GetMyLPPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x2B
    if(MyLPPRI == none)
    {
        MyLPPRI = LPPRI(PlayerReplicationInfo);
    }
    return MyLPPRI;
    //return ReturnValue;    
}

simulated function BecomeVisible()
{
    SetHidden(false);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private float DistPct;
    local /*0x97E50000-0x00000000*/ private @NULL Shield;

    // End:0x8E
    if(VarName == 'DistanceFromVS')
    {
        DistPct = FMin(float(DistanceFromVS) / float(GetUmbilicalRange()), 1.0000000);
        // End:0x8E
        if(SavedController != none)
        {
            SavedController.myLPHUD.UpdateVSUmbilicalRange(DistPct);
        }
    }
    // End:0xBB
    if(VarName == 'SavedController')
    {
        SetTimer(0.3000000, false, 'InitHUD');        
    }
    else
    {
        // End:0xF3
        if(VarName == 'TotalShotgunReloads')
        {
            // End:0xF0
            if(int(TotalShotgunReloads) > int(0))
            {
                DoRemoteShotgunReload();
            }            
        }
        else
        {
            // End:0x138
            if(VarName == 'bUnderhandGrenadePose')
            {
                bPreferLeanOverPopup = !bUnderhandGrenadePose;
                UpdateGrenadePose(bUnderhandGrenadePose);                
            }
            else
            {
                // End:0x17C
                if(VarName == 'KnockDownInfo')
                {
                    // End:0x179
                    if(KnockDownInfo.bActive)
                    {
                        DoKnockDown();
                    }                    
                }
                else
                {
                    // End:0x1D8
                    if(VarName == 'GrenadeInfo')
                    {
                        ShowGrenades(GrenadeInfo.VisibleGrenadeCount, GrenadeInfo.GrenadeClass);                        
                    }
                    else
                    {
                        // End:0x1FC
                        if(VarName == 'GrappleHookClass')
                        {
                            GetGrapplingHook();                            
                        }
                        else
                        {
                            // End:0x220
                            if(VarName == 'ParticleThrowerArcTargets')
                            {
                                RemoteUpdateArcTargets();                                
                            }
                            else
                            {
                                // End:0x244
                                if(VarName == 'CoverAction')
                                {
                                    UpdateMeshTranslationForCover();                                    
                                }
                                else
                                {
                                    // End:0x28E
                                    if(VarName == 'InvulnerabilityInfo')
                                    {
                                        StartInvulnerabilityEffects(InvulnerabilityInfo.Duration);
                                        UpdateDamageImmunityUI();                                        
                                    }
                                    else
                                    {
                                        // End:0x2B2
                                        if(VarName == 'InvulnerabilityRemaining')
                                        {
                                            UpdateDamageImmunityUI();                                            
                                        }
                                        else
                                        {
                                            // End:0x336
                                            if(VarName == 'ShieldHitRepCount')
                                            {
                                                Shield = LPFXAction_InvulnerabilityShield(GetFXActionManager().GetFXAction(Class'LPFXAction_InvulnerabilityShield'));
                                                // End:0x333
                                                if(Shield != none)
                                                {
                                                    Shield.OnHit();
                                                }                                                
                                            }
                                            else
                                            {
                                                super.ReplicatedEvent(VarName);
                                            }
                                        }
                                    }
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

simulated function SetCoverInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL Link[8388609];
    local /*0x97E50000-0x00000000*/ private int SlotIdx[8388609], LeftIdx, RightIdx;
    local /*0x97E50000-0x00000000*/ private float SlotPct[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReplicate[8388609];

    super(SPGFCoverPawn).SetCoverInfo(Link, SlotIdx, LeftIdx, RightIdx, SlotPct, bReplicate);
    // End:0x5A
    if(Link == none)
    {
        UpdateMeshTranslationForCover();
    }
    //return;    
}

simulated function InitHUD()
{
    // End:0x4C
    if(Controller != none)
    {
        SavedController.myLPHUD.UpdateVSUmbilicalRange(0.0000000);        
    }
    else
    {
        SetTimer(0.0300000, false, 'InitHUD');
    }
    //return;    
}

function ServerKnockDownPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bAutoRecover[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LinearVel[8388609], AngularVel;

    // End:0xF5
    if(!KnockDownInfo.bActive)
    {
        KnockDownInfo.bAutoRecover = bAutoRecover;
        KnockDownInfo.LinearVelocity = LinearVel;
        KnockDownInfo.AngularVelocity = AngularVel;
        KnockDownInfo.bActive = true;
        KnockDownInfo.ReplicateMe++;
        bNetDirty = true;
        bForceNetUpdate = true;
        DoKnockDown();
    }
    //return;    
}

simulated function DoKnockDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    bUseRigidBodySync = true;
    bIncapacitated = !KnockDownInfo.bAutoRecover;
    EndCurrentSpecialMove();
    StopChatter();
    GotoState('PlayerKnockedDown');
    DoRagdoll();
    Mesh.SetRBLinearVelocity(KnockDownInfo.LinearVelocity, true);
    TakeDamageParams.bShouldPlayHitEffects = false;
    TakeDamageParams.bShouldPlayHitReactAnim = false;
    // End:0x190
    if(KnockDownInfo.bAutoRecover && IsLocallyControlled())
    {
        SetTimer(TuneDataBasePawn.MinRecoveryDelay.GetValue(), false, 'CheckRagdollRecovery');
        SetTimer(TuneDataBasePawn.MaxRecoveryDelay.GetValue(), false, 'RecoverFromKnockDown');
    }
    // End:0x282
    if(TuneDataPlayerPawn.bUseEdgeGlowWhileIncapacitated)
    {
        PC = Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor;
        // End:0x282
        if(!TuneDataPlayerPawn.bOnlyShowIncapacitatedEdgeGlowToTeammates || (PC != none) && int(PC.GetTeamNum()) == int(GetTeamNum()))
        {
            StartEdgeGlow(TuneDataPlayerPawn.IncapacitatedEdgeGlowParams);
        }
    }
    // End:0x362
    if(SavedController != none)
    {
        SavedController.myLPHUD.ShowCountdown(false);
        // End:0x362
        if((!SavedController.IsInState('Dead') && !SavedController.IsInState('Incapacitated')) && !SavedController.IsInState('RoundEnded'))
        {
            SavedController.GotoState('Incapacitated');
        }
    }
    //return;    
}

function OnKnockdownAnimFinished()
{
    // End:0x39
    if(int(Role) == int(ROLE_Authority))
    {
        ServerKnockDownPlayer(false, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000));
    }
    //return;    
}

function GetAbsoluteMinimumHealthThreshold()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], MinHealth;
    local /*0x97E50000-0x00000000*/ private @NULL TP;

    // End:0x53
    if((TuneDataPlayerPawn == none) || TuneDataPlayerPawn.IncapacitationToDeathHealthThreshold.GetValue() > float(0))
    {
        return -100;
    }
    MinHealth = int(TuneDataPlayerPawn.IncapacitationToDeathHealthThreshold.GetValue());
    TP = LPPerkThermalPadding(GetEnabledPerk(2));
    // End:0x12A
    if(TP != none)
    {
        MinHealth -= int(TP.ThermalPaddingTuneData.IncapacitatedHealthIncrease.GetValue(LPPlayerController(Controller)));
    }
    return MinHealth;
    //return ReturnValue;    
}

simulated function CheckRagdollRecovery()
{
    // End:0x50
    if(VSize(Velocity) < TuneDataBasePawn.MinRecoveryVelocity)
    {
        ClearTimer('RecoverFromKnockDown');
        RecoverFromKnockDown();        
    }
    else
    {
        SetTimer(0.3330000, false, 'CheckRagdollRecovery');
    }
    //return;    
}

reliable server function RecoverFromKnockDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorResponsible[9437185];

    none
    ClearTimer('CheckRagdollRecovery');
    ClearTimer('RecoverFromKnockDown');
    ActorResponsibleForRevival = ActorResponsible;
    // End:0xA9
    if(int(Physics) == int(10))
    {
        // End:0x8A
        if(int(Role) == int(ROLE_Authority))
        {
            ServerDoSpecialMove(Class'LPSM_RecoverFromRagdoll', true, true,, ActorResponsible);            
        }
        else
        {
            LocalDoSpecialMove(Class'LPSM_RecoverFromRagdoll', true, true,, ActorResponsible);
        }
    }
    GotoState('NoState');
    //return;    
}

simulated function InitGrenades()
{
    local /*0x97E50000-0x00000000*/ private bool Found;
    local /*0x97E50000-0x00000000*/ private name Gren1Socket, Gren2Socket, Gren3Socket, Gren4Socket, ZiplineSocket;

    local /*0x97E50000-0x00000000*/ private @NULL sourcepos;

    Gren1Socket = 'Grenade1';
    Gren2Socket = 'Grenade2';
    Gren3Socket = 'Grenade3';
    Gren4Socket = 'Grenade4';
    ZiplineSocket = 'Zipline';
    Found = Mesh.GetSocketWorldLocationAndRotation(Gren1Socket, sourcepos);
    // End:0xDB
    if(Found)
    {
        Mesh.AttachComponentToSocket(Grenade1Component, Gren1Socket);
    }
    Found = Mesh.GetSocketWorldLocationAndRotation(Gren2Socket, sourcepos);
    // End:0x157
    if(Found)
    {
        Mesh.AttachComponentToSocket(Grenade2Component, Gren2Socket);
    }
    Found = Mesh.GetSocketWorldLocationAndRotation(Gren3Socket, sourcepos);
    // End:0x1D3
    if(Found)
    {
        Mesh.AttachComponentToSocket(Grenade3Component, Gren3Socket);
    }
    Found = Mesh.GetSocketWorldLocationAndRotation(Gren4Socket, sourcepos);
    // End:0x24F
    if(Found)
    {
        Mesh.AttachComponentToSocket(Grenade4Component, Gren4Socket);
    }
    Found = Mesh.GetSocketWorldLocationAndRotation(ZiplineSocket, sourcepos);
    // End:0x2EB
    if(Found)
    {
        Mesh.AttachComponentToSocket(ZiplineTrolleyComponent, ZiplineSocket);
        ZiplineTrolleyComponent.SetHidden(true);
    }
    Grenade1Component.SetShadowParent(Mesh);
    Grenade1Component.SetLightEnvironment(LightEnvironment);
    Grenade2Component.SetShadowParent(Mesh);
    Grenade2Component.SetLightEnvironment(LightEnvironment);
    Grenade3Component.SetShadowParent(Mesh);
    Grenade3Component.SetLightEnvironment(LightEnvironment);
    Grenade4Component.SetShadowParent(Mesh);
    Grenade4Component.SetLightEnvironment(LightEnvironment);
    ZiplineTrolleyComponent.SetShadowParent(Mesh);
    ZiplineTrolleyComponent.SetLightEnvironment(LightEnvironment);
    //return;    
}

simulated function StartGrenadeMovement()
{
    super(LPPawn).StartGrenadeMovement();
    // End:0x3F
    if(IsLocallyControlled())
    {
        LPPlayerController(Controller).SetGrenadeCam();
    }
    //return;    
}

simulated function EndGrenadeMovement()
{
    super(LPPawn).EndGrenadeMovement();
    // End:0x3F
    if(IsLocallyControlled())
    {
        LPPlayerController(Controller).EndGrenadeCam();
    }
    //return;    
}

function AddDefaultInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL Inv;

    super(SPInventoryPawn).AddDefaultInventory();
    Inv = GetGrenade();
    // End:0x73
    if(Inv != none)
    {
        ShowGrenades(Inv.AmmoLeftInMagazine, Inv.Class);
    }
    //return;    
}

function AddGrappleHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL Inv;

    Inv = FindInventoryType(GrappleHookClass);
    // End:0x60
    if(Inv == none)
    {
        Inv = InvManager.CreateInventory(GrappleHookClass, true);
    }
    // End:0x6F
    if(Inv == none)
    {
    }
    //return;    
}

reliable server function ServerUpdateGrenadePose()
{
    local /*0x97E50000-0x00000000*/ private bool bNewUnderhandPose[8388609];

    UpdateGrenadePose(bNewUnderhandPose);
    bUnderhandGrenadePose = bNewUnderhandPose;
    bForceNetUpdate = true;
    //return;    
}

simulated function UpdateGrenadePose()
{
    local /*0x97E50000-0x00000000*/ private bool bNewUnderhandPose[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SMInstance, GrenadePrimeSM;

    SMInstance = GetCurrentSpecialMoveInstance();
    // End:0x7D
    if(SMInstance.IsA('LPSM_GrenadePrime'))
    {
        GrenadePrimeSM = LPSM_GrenadePrime(SMInstance);
        GrenadePrimeSM.bUnderhandToss = bNewUnderhandPose;
    }
    //return;    
}

simulated function ShouldDrawProjectilePreviewComponent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SMInstance;

    // End:0x0F
    if(bDisableProjectilePreview)
    {
        return false;
    }
    SMInstance = GetCurrentSpecialMoveInstance();
    // End:0x57
    if((LPSM_GrenadePrime(SMInstance) != none) || LPSM_GrenadeThrow(SMInstance) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnSetCoverLock()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x4F
    if(IsUsingCover())
    {
        SavedController.bLockInCover = Action.bLocked;        
    }
    //return;    
}

simulated function OnGiveInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPWG;

    super(SPInventoryPawn).OnGiveInventory(inAction);
    // End:0x56
    if(SavedController != none)
    {
        SavedController.myLPHUD.OnGiveInventory();
    }
    // End:0xD4
    foreach InvManager.InventoryActors(Class'LPWeaponGrenade', LPWG)
    {
        ShowGrenades(LPWG.AmmoLeftForWeapon, LPWG.Class);
        // End:0xD4
        break;        
    }    
    //return;    
}

simulated function ReceivedInventoryItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewItem[8388609], NewWeapon, LPPC;

    // End:0x152
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        NewWeapon = LPWeapon(NewItem);
        // End:0x152
        if(NewWeapon != none)
        {
            LPPC = LPPlayerController(Controller);
            // End:0x92
            if(LPPC == none)
            {
                LPPC = SavedController;
            }
            // End:0xE1
            if(LPPC != none)
            {
                LPPC.AddWeaponToStorage_ByClass(NewWeapon.Class);                
            }
            else
            {
                ScriptTrace();
            }
            // End:0x152
            if(LPWeaponGrenade(NewWeapon) != none)
            {
                ShowGrenades(NewWeapon.AmmoLeftForWeapon, class<LPWeaponGrenade>(NewWeapon.Class));
            }
        }
    }
    //return;    
}

function OnGiveAmmoSmart()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPW;
    local /*0x97E50000-0x00000000*/ private int MaxAmmo, CurrentAmmo, AmmoToGive;
    local /*0x97E50000-0x00000000*/ private float AmmoDiff, AmmoPct;
    local /*0x97E50000-0x00000000*/ private int MaxAmmoForWeapon;

    // End:0x3D1
    foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
    {
        MaxAmmoForWeapon = LPW.GetMaxAmmoForWeapon();
        // End:0x72
        if(MaxAmmoForWeapon < 0)
        {
            continue;            
        }
        // End:0x192
        if(LPWeaponGrenade(LPW) != none)
        {
            // End:0x18E
            if(inAction.bGivesGrenades)
            {
                AmmoToGive = MaxAmmoForWeapon - LPW.AmmoLeftForWeapon;
                // End:0x18E
                if(AmmoToGive > 0)
                {
                    LPW.AddAmmo(AmmoToGive);
                    LPW.AddAmmoMessage(AmmoToGive);
                    ShowGrenades(LPW.AmmoLeftForWeapon, class<LPWeaponGrenade>(LPW.Class));
                }
            }
            continue;            
        }
        // End:0x207
        if(LPW.AmmoTypeInfo.CurrentAmmoMode == 0)
        {
            MaxAmmo = MaxAmmoForWeapon;
            CurrentAmmo = LPW.AmmoLeftForWeapon;            
        }
        else
        {
            MaxAmmo = LPW.GetMaxAmmoForWeapon(LPW.TuneDataBaseWeapon.SupportedAmmoTypes[0]);
            CurrentAmmo = SPInventoryAmmoType(LPW.AmmoTypes[0]).AmmoLeftForWeapon;
        }
        // End:0x2C9
        if(MaxAmmo == CurrentAmmo)
        {
            continue;            
        }
        AmmoDiff = float(MaxAmmo - CurrentAmmo);
        AmmoPct = float(Rand(inAction.MaxPercentageOfDifferenceToGive - inAction.MinPercentageOfDifferenceToGive) + inAction.MinPercentageOfDifferenceToGive) * 0.0100000;
        AmmoToGive = Max(int(AmmoPct * AmmoDiff), 1);
        LPW.AddAmmo(AmmoToGive);
        LPW.AddAmmoMessage(AmmoToGive);        
    }    
    //return;    
}

simulated function OnGetPlayerWeaponType()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], W;

    W = LPWeapon(Weapon);
    // End:0x8F
    if((W != none) && int(W.AnimationContext) == int(2))
    {
        inAction.OutputLinks[0].bHasImpulse = true;        
    }
    else
    {
        // End:0x102
        if((W != none) && int(W.AnimationContext) == int(3))
        {
            inAction.OutputLinks[1].bHasImpulse = true;            
        }
        else
        {
            inAction.OutputLinks[2].bHasImpulse = true;
        }
    }
    //return;    
}

function HasRoomInInventory()
{
    local /*0x97E50000-0x00000000*/ private class UniqueClass[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPW;
    local /*0x97E50000-0x00000000*/ private int NumPlayerWpn;
    local /*0x97E50000-0x00000000*/ private bool bEquippable;

    none
    bEquippable = ((UniqueClass == none) ? true : UniqueClass.default.bCanEquip);
    NumPlayerWpn = 0;
    // End:0xEE
    if(InvManager != none)
    {
        // End:0xED
        foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0xEC
            if(LPW.bCanThrow && LPW.bCanEquip == bEquippable)
            {
                NumPlayerWpn++;
            }            
        }        
    }
    // End:0x11F
    if(NumPlayerWpn < ((bEquippable) ? MaxNumEquippablePlayerWeapons : MaxNumNonEquippablePlayerWeapons))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasUniqueSetClass()
{
    local /*0x97E50000-0x00000000*/ private class UniqueSetClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPW;

    // End:0x59
    if((UniqueSetClass != none) && InvManager != none)
    {
        // End:0x58
        foreach InvManager.InventoryActors(UniqueSetClass, LPW)
        {            
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function ShowGrenades()
{
    local /*0x97E50000-0x00000000*/ private int Count[8388609];
    local /*0x97E50000-0x00000000*/ private class GrenadeClass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeMesh, Gren;

    Gren = GetGrenade();
    // End:0x27
    if(Gren != none)
    {        
    }
    // End:0x2EA
    if(GrenadeClass != none)
    {
        GrenadeMesh = GrenadeClass.default.BeltMesh;
        Grenade1Component.SetStaticMesh(GrenadeMesh);
        Grenade2Component.SetStaticMesh(GrenadeMesh);
        Grenade3Component.SetStaticMesh(GrenadeMesh);
        Grenade4Component.SetStaticMesh(GrenadeMesh);
        Grenade1Component.SetTranslation(GrenadeClass.default.BeltMeshTranslation);
        Grenade2Component.SetTranslation(Grenade1Component.Translation);
        Grenade3Component.SetTranslation(Grenade1Component.Translation);
        Grenade4Component.SetTranslation(Grenade1Component.Translation);
        Grenade1Component.SetRotation(GrenadeClass.default.BeltMeshRotation);
        Grenade2Component.SetRotation(Grenade1Component.Rotation);
        Grenade3Component.SetRotation(Grenade1Component.Rotation);
        Grenade4Component.SetRotation(Grenade1Component.Rotation);
    }
    // End:0x379
    if(Count <= 0)
    {
        Grenade1Component.SetHidden(true);
        Grenade2Component.SetHidden(true);
        Grenade3Component.SetHidden(true);
        Grenade4Component.SetHidden(true);
    }
    // End:0x408
    if(Count == 1)
    {
        Grenade1Component.SetHidden(true);
        Grenade2Component.SetHidden(true);
        Grenade3Component.SetHidden(true);
        Grenade4Component.SetHidden(false);
    }
    // End:0x498
    if(Count == 2)
    {
        Grenade1Component.SetHidden(true);
        Grenade2Component.SetHidden(true);
        Grenade3Component.SetHidden(false);
        Grenade4Component.SetHidden(false);
    }
    // End:0x528
    if(Count == 3)
    {
        Grenade1Component.SetHidden(true);
        Grenade2Component.SetHidden(false);
        Grenade3Component.SetHidden(false);
        Grenade4Component.SetHidden(false);
    }
    // End:0x5B8
    if(Count >= 4)
    {
        Grenade1Component.SetHidden(false);
        Grenade2Component.SetHidden(false);
        Grenade3Component.SetHidden(false);
        Grenade4Component.SetHidden(false);
    }
    // End:0x691
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        GrenadeInfo.VisibleGrenadeCount = Count;
        GrenadeInfo.GrenadeClass = ((GrenadeClass != none) ? GrenadeClass : GrenadeInfo.GrenadeClass);
        bForceNetUpdate = true;
    }
    //return;    
}

simulated function NotifyAmmoCountUpdated()
{
    // End:0x58
    if(SavedController.myLPHUD != none)
    {
        SavedController.myLPHUD.RefreshHUDAmmoCount();
    }
    //return;    
}

simulated function NotifyShellMeshDetach()
{
    // End:0x4B
    if(Weapon.IsA('LPWeaponShotgun'))
    {
        LPWeaponShotgun(Weapon).DetachShellMesh();
    }
    //return;    
}

simulated function DoRemoteShotgunReload()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPWRS;
    local /*0x97E50000-0x00000000*/ private byte NumReloads;

    // End:0x120
    if(IsDoingSpecialMove_OF_Class(LPWeapon(Weapon).ReloadSpecialMoveClass))
    {
        LPWRS = LPSM_WeaponReloadShotgun(GetCurrentSpecialMoveInstance());
        NumReloads = LPWRS.NumReloads;
        LPWRS.NumReloads = TotalShotgunReloads;
        LPWRS.TotalShotgunReloads = 0;
        // End:0x11D
        if(int(NumReloads) == int(0))
        {
            LPWRS.StartingReloads = TotalShotgunReloads;
            LPWRS.PlayReloadAnim();
        }        
    }
    else
    {
        SetTimer(0.0300000, false, 'DoRemoteShotgunReload');
    }
    //return;    
}

simulated function WeaponFired()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    CombatLineOfFire.StartPos = SPGFAimControlPlayerControlled(AimController).GetAimCollisionStartPoint(false);
    CombatLineOfFire.AimDir = Vector(GetAimDirection());
    CombatLineOfFire.TimeStamp = WorldInfo.TimeSeconds;
    super(LPPawn).WeaponFired(InWeapon, bViaReplication, HitLocation);
    //return;    
}

simulated function HasCombatLineOfFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if((WorldInfo.TimeSeconds - CombatLineOfFire.TimeStamp) > 15.0000000)
    {
        return false;
    }
    // End:0x7D
    if(VSize(Location - CombatLineOfFire.StartPos) > 500.0000000)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function GetDegreesToLineOfFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x44
    if(!HasCombatLineOfFire())
    {
        return Acos(Normal(InLocation - Location) Dot Vector(Rotation)) * 57.2957800;
    }
    return Acos(Normal(InLocation - CombatLineOfFire.StartPos) Dot CombatLineOfFire.AimDir) * 57.2957800;
    //return ReturnValue;    
}

simulated event GetGrenade()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x3F
    if(Controller == none)
    {
        return LPWeaponGrenade(RemoteClientGetInventoryByClass(GrenadeInfo.GrenadeClass));
    }
    return super(LPPawn).GetGrenade();
    //return ReturnValue;    
}

simulated function NotifyGrenadeReleased()
{
    super(LPPawn).NotifyGrenadeReleased();
    // End:0x39
    if(IsLocallyControlled())
    {
        SavedController.NotifyGrenadeReleased();        
    }
    else
    {
        // End:0x8E
        if((Controller != none) && Controller.IsInState('DeployManualPerk'))
        {
            SavedController.NotifyGrenadeReleased();
        }
    }
    //return;    
}

function NotifyChangedWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL PreviousWeapon[8388609], NewWeapon, CollectionCSA;

    super(SPInventoryPawn).NotifyChangedWeapon(PreviousWeapon, NewWeapon);
    CollectionCSA = LPCSAO_PlayerCollection(ContextSensitiveAnimInfo.CurrentCSA);
    // End:0x99
    if(CollectionCSA != none)
    {
        CollectionCSA.UseContextSensitiveAnims(self, CollectionCSA.DefaultBlendTime);
    }
    NotifyAmmoCountUpdated();
    //return;    
}

simulated function CheckCSAForSwitchToBestWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = LPContextSensitiveAnimObject(ContextSensitiveAnimInfo.CurrentCSA);
    // End:0x5E
    if(CSA != none)
    {
        CSA.CheckSwitchToBestWeapon(self);
    }
    //return;    
}

simulated event OnPlayRagDollDeath()
{
    local /*0x97E50000-0x00000000*/ private @NULL RagdollNotify[9437185];

    // End:0x10
    if(bIncapacitated)
    {
        return;
    }
    super(SPPawn).OnPlayRagDollDeath(RagdollNotify);
    //return;    
}

function SendTeamDiedEvent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array EventsToActivate, ActivateIndices;
    local /*0x97E50000-0x00000000*/ private @NULL GameSeq;
    local /*0x97E50000-0x00000000*/ private bool bResult;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xC8
    if(PlayerReplicationInfo.Team != none)
    {
        ActivateIndices.AddItem(int(PlayerReplicationInfo.Team.GetTeamNum()));        
        // End:0xB9
        if(LPTeamInfo_MP(PlayerReplicationInfo.Team).bAttackingTeam)
        {
            ActivateIndices.AddItem(4);                        
        }
        else
        {
            ActivateIndices.AddItem(5);            
        }
    }
    GameSeq = WorldInfo.GetGameSequence();
    // End:0x1B1
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'LPSeqEvent_TeamDied', true, EventsToActivate);
        I = 0;
        J0x13D:

        // End:0x1B1 [Loop If]
        if(I < EventsToActivate.Length)
        {
            // End:0x1A3
            if(SequenceEvent(EventsToActivate[I]).CheckActivate(self, self,, ActivateIndices))
            {
                bResult = true;
            }
            I++;
            // [Loop Continue]
            goto J0x13D;
        }
    }
    return bResult;
    //return ReturnValue;    
}

function EnteredStruggleExclusionVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVolume[8388609];

    bInStruggleExclusionVolume = true;
    //return;    
}

function ExitedStruggleExclusionVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVolume[8388609], V;

    // End:0x33
    foreach TouchingActors(Class'LPStruggleExclusionVolume', V)
    {
        // End:0x32
        if(V != InVolume)
        {            
            return;
        }        
    }    
    bInStruggleExclusionVolume = false;
    //return;    
}

function HandleDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, GI;
    local /*0x97E50000-0x00000000*/ private bool bIsDead;
    local /*0x97E50000-0x00000000*/ private @NULL TI;
    local /*0x97E50000-0x00000000*/ private int TeamLivingCount;
    local /*0x97E50000-0x00000000*/ private @NULL LPAIC;
    local /*0x97E50000-0x00000000*/ private bool bAllowIncapacitation, bMultiplayer;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    GI = LPGameMP_Base(WorldInfo.Game);
    bIsDead = true;
    bMultiplayer = int(WorldInfo.NetMode) != int(NM_Standalone);
    LPPC = LPPlayerController(Controller);
    // End:0x1AF
    if(bMultiplayer)
    {
        TI = LPTeamInfo_MP(WorldInfo.GRI.Teams[int(GetTeamNum())]);
        MyLPPRI.ScoreDeath(Killer, DamageType);
        // End:0x16C
        if(!bIncapacitated && GI != none)
        {
            GI.ScoreIncapacitation(Killer, Controller);
        }
        // End:0x1AF
        if(LPPC.CurrentBombActor != none)
        {
            LPPC.ClientClearBombMessage();
        }
    }
    // End:0x499
    if((GI != none) && GI.bIncapacitatePlayerOnDeath)
    {
        bAllowIncapacitation = GI.bIncapacitatePlayerOnDeath;
        // End:0x266
        if(bAllowIncapacitation && ClassIsChildOf(DamageType, Class'LPDamageType'))
        {
            bAllowIncapacitation = class<LPDamageType>(DamageType).default.bAllowPlayerIncapacitation;
        }
        // End:0x499
        if((((((((DamageType != none) && DamageType != Class'Engine.DmgType_Suicided') && DamageType != Class'Engine.KillZDamageType') && (MyLPPRI == none) || !MyLPPRI.bTappedOut) && float(HeadshotDeathDamage) < Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_Headshot')) && !bIncapacitated) && Health > (GetAbsoluteMinimumHealthThreshold())) && bAllowIncapacitation)
        {
            bIncapacitated = true;
            bIsDead = false;
            DropCourierItems();
            // End:0x499
            if(int(Role) == int(ROLE_Authority))
            {
                // End:0x3FA
                if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageType') && class<LPDamageType>(DamageType).default.bPlayDeathAnimOnIncapped)
                {
                    ServerDoSpecialMove(Class'LPSM_DirectionalKnockdown', true);                    
                }
                else
                {
                    ServerKnockDownPlayer(false, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000));
                }
                TuneDataPawnSoundEventBindings.PlayEventSoundAtLoc('Incapacitated', Location, WorldInfo, none, none, false);
                TuneDataPawnSoundEventBindings.PlayEventSoundAtLoc('IncapacitatedEffort', Location, WorldInfo, none, none, false);
            }
        }
    }
    // End:0x52C
    if(bIsDead)
    {
        PlayDeathSound(DamageType);
        bIncapacitated = false;
        // End:0x4F6
        if(SavedController != none)
        {
            SavedController.ClientNotifyProximityToMunitionsLocker(none, false);
        }
        // End:0x52C
        if(bMultiplayer)
        {
            MyLPPRI.TEnergyAtDeath = GetEnergyCount();
        }
    }
    // End:0x5DE
    if(Killer != none)
    {
        LPAIC = LPAIController(Killer);
        // End:0x5A4
        if(LPAIC != none)
        {
            SetLastKillerInfo(LPAIC.GetAssociatedPlayerPRI(), Killer, DamageType);            
        }
        else
        {
            SetLastKillerInfo(Killer.PlayerReplicationInfo, Killer, DamageType);
        }
    }
    // End:0x6FF
    if(TI != none)
    {
        // End:0x6FF
        if(TI.bUseTeamLives && TI.TeamLives == 0)
        {
            // End:0x679
            if(bIsDead && int(Role) == int(ROLE_Authority))
            {
                PlayerReplicationInfo.bOutOfLives = true;
            }
            TeamLivingCount = TI.GetAliveAndWellTeamMembers();
            // End:0x6FF
            if(TeamLivingCount <= 0)
            {
                // End:0x6FF
                if(!SendTeamDiedEvent())
                {
                    WorldInfo.Game.EndGame(none, "teamdead");
                }
            }
        }
    }
    LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
    // End:0x74D
    if(!bIsDead)
    {
        return false;
    }
    GrenadeWeapon = GetGrenade();
    // End:0x7B3
    if((GrenadeWeapon != none) && GrenadeWeapon.IsPrimed())
    {
        GrenadeWeapon.DropGrenade();
    }
    bCanDropTEnergy = (bCanDropTEnergy && Killer != none) && int(Killer.GetTeamNum()) != int(GetTeamNum());
    return Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x55
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        DelayedDeath(0.0001000, Killer, HitLocation, DamageType);
        return true;
    }
    return HandleDied(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

function PlayDeathSound()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private name DeathSoundEventName;
    local /*0x97E50000-0x00000000*/ private class LPDamageClass;

    // End:0x23
    if(bIncapacitated)
    {
        DeathSoundEventName = 'DeathIncapacitated';        
    }
    else
    {
        LPDamageClass = class<LPDamageType>(DamageType);
        // End:0x96
        if(LPDamageClass.default.DeathSoundEventName != 'None')
        {
            DeathSoundEventName = LPDamageClass.default.DeathSoundEventName;            
        }
        else
        {
            DeathSoundEventName = 'NormalDeath';
        }
    }
    TuneDataPawnSoundEventBindings.PlayEventSoundAtLoc(DeathSoundEventName, Location, WorldInfo, none, none, false);
    //return;    
}

function HandleNoxiousDemise()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ND;
    local /*0x97E50000-0x00000000*/ private bool bHeadshot, bBledOut, bTappedOut, bSuicided, bOverkilled;

    ND = LPPerkNoxiousDemise(GetEnabledPerk(13));
    // End:0x330
    if(ND != none)
    {
        // End:0x330
        if(DamageType != none)
        {
            bHeadshot = float(HeadshotDeathDamage) >= Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_Headshot');
            bBledOut = (MyLPPRI != none) && MyLPPRI.bBledOut;
            bTappedOut = (MyLPPRI != none) && MyLPPRI.bTappedOut;
            bSuicided = !bTappedOut && DamageType == Class'Engine.DmgType_Suicided';
            bOverkilled = ((!bHeadshot && !bBledOut) && !bTappedOut) && !bSuicided;
            // End:0x330
            if(((((bHeadshot && ND.NoxiousTuneData.bSpawnCloudOnHeadshot) || bBledOut && ND.NoxiousTuneData.bSpawnCloudOnBleedOut) || bTappedOut && ND.NoxiousTuneData.bSpawnCloudOnTapOut) || bSuicided && ND.NoxiousTuneData.bSpawnCloudOnSuicide) || bOverkilled && ND.NoxiousTuneData.bSpawnCloudOnOverkill)
            {
                AddThermalEnergy(-1.0000000 * FMin(GetEnergyCount(), ND.GetCost(true)), false);
                ND.SpawnCloud();
            }
        }
    }
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(LPPawn).PerformPostInitAnimTreeActions(SkelComp);
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], theweapon;

    super(LPPawn).DrawHUD(H);
    // End:0x8F
    if((Weapon != none) && LPWeapon(Weapon) != none)
    {
        theweapon = LPWeapon(Weapon);
        // End:0x8F
        if(theweapon != none)
        {
            theweapon.DrawHUD(H);
        }
    }
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return PlayerMoveAnimTree;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForCoverSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPGFCoverPawn).GetAnimTemplateTreeForCoverSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    // End:0x59
    if(PlayerCoverAnimTree == none)
    {
        return GetAnimTemplateTreeForSpecialMove(SpecialMove);
    }
    return PlayerCoverAnimTree;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForWeaponSwitching()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(PlayerWeaponAnimTree != none)
    {
        return PlayerWeaponAnimTree;
    }
    return PlayerMoveAnimTree;
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MoveNames, MoveNodes;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array HitReactionNodes, HitReactionNames;

    super(LPPawn).InitAnimTemplates();
    // End:0x156
    if(PlayerWeaponAnimTree != none)
    {
        MoveNames.AddItem(AnimTemplateLogic_FiringCycle_Name);        
        MoveNames.AddItem(AnimTemplateLogic_ADSFiringCycle_Name);        
        MoveNames.AddItem(AnimTemplateLogic_StationaryAdditiveAiming_Name);        
        MoveNames.AddItem(AnimTemplateLogic_MovingAdditiveAiming_Name);        
        PlayerWeaponAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        AnimTemplateLogic_FiringCycle = SPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_ADSFiringCycle = SPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_StationaryAdditiveAiming = SPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_MovingAdditiveAiming = SPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
    }
    HitReactionNames.AddItem(AnimTemplateLogic_HitReaction_Name);    
    I = 0;
    HitReactLogicAnimTree.FindAnimNodes(HitReactionNames, HitReactionNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
    AnimTemplateLogic_HitReaction = SPAnimNodeTemplateLogicNamedRoot(HitReactionNodes[I++]);
    //return;    
}

simulated function ShouldAllowFullBodyHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((!InStruggleMode && !bBearTrapped) && ((((TakeDamageParams.DamageCauser != none) && LPBaseVSPlayerPawn(TakeDamageParams.DamageCauser) != none) && LPBaseVSPlayerPawn(TakeDamageParams.DamageCauser).GetTeam() != (GetTeam())) || TakeDamageParams.DamageCauser == none) || LPBaseVSPlayerPawn(TakeDamageParams.DamageCauser) == none) && !bIncapacitated;
    //return ReturnValue;    
}

simulated function PlayHitReactionAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldOverride, bOverrideAdditive, bAllowFullBodyReaction;
    local /*0x97E50000-0x00000000*/ private class SPDT;
    local /*0x97E50000-0x00000000*/ private bool bAllowAdditiveHitReaction, bPlayHitReactionSoundEvent;
    local /*0x97E50000-0x00000000*/ private @NULL HitReactionSM, HitReactionNodeSequence, HitReactionSequence;
    local /*0x97E50000-0x00000000*/ private bool bRequestAdditiveAnim;

    // End:0x24
    if(TakeDamageParams.Damage <= 0)
    {
        return;
    }
    bAllowAdditiveHitReaction = true;
    // End:0x6A
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeVSISSRailgun'))
    {
        bShouldOverride = true;        
    }
    else
    {
        bShouldOverride = !ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeBallistic');
    }
    bOverrideAdditive = ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageType') && class<LPDamageType>(TakeDamageParams.DamageType).default.bOverrideAdditiveHitReaction;
    SPDT = class<SPDamageType>(TakeDamageParams.DamageType);
    // End:0x183
    if((SPDT != none) && SPDT.default.bAdditiveHitReaction)
    {
        bRequestAdditiveAnim = true;        
    }
    else
    {
        bAllowFullBodyReaction = (ShouldAllowFullBodyHitReaction()) && ShouldAllowFullBodyHitReactionForDamageType(SPDT);
        // End:0x420
        if(bAllowFullBodyReaction)
        {
            // End:0x1DD
            if(IsDoingSpecialMove(Class'LPSM_WeaponReloadAssaultRifle'))
            {
                NotifyWeaponReload();
            }
            // End:0x234
            if((Controller != none) && IsInCover())
            {
                SavedController.ClearCover(true);
                // End:0x234
                if(IsInCover())
                {
                    bRequestAdditiveAnim = true;
                }
            }
            // End:0x420
            if(SPDT != none)
            {
                // End:0x268
                if(ShouldPlayHitReactionAnimationForLargeNearByGroundHit())
                {
                    bPlayHitReactionSoundEvent = NotifyNearbyLargeGroundHit();                    
                }
                else
                {
                    // End:0x28A
                    if(ShouldPlayHitReactionAnimationForElectricalHit())
                    {
                        bPlayHitReactionSoundEvent = NotifyElectricalHit();
                    }
                    // End:0x3BA
                    if(SPDT.default.HitReactionSpecialMove == Class'LPSM_DirectionalHitReaction')
                    {
                        HitReactionSM = LPSM_DirectionalHitReaction(GetSpecialMoveInstance(Class'LPSM_DirectionalHitReaction'));
                        // End:0x3BA
                        if(HitReactionSM != none)
                        {
                            HitReactionNodeSequence = HitReactionSM.GetBestSequenceTemplateByIndex(HitReactionSM.GetDesiredAnimIndex());
                            HitReactionSequence = Mesh.FindAnimSequence(HitReactionNodeSequence.GetAnimSequenceName());
                            // End:0x3BA
                            if((HitReactionSequence != none) && HitReactionSequence.bIsAdditive)
                            {
                                bRequestAdditiveAnim = true;
                            }
                        }
                    }
                    // End:0x414
                    if(!bRequestAdditiveAnim && int(Role) == int(ROLE_Authority))
                    {
                        ServerDoSpecialMove(SPDT.default.HitReactionSpecialMove, bShouldOverride);
                    }
                    bPlayHitReactionSoundEvent = true;
                }
            }
        }
    }
    // End:0x4CA
    if(bRequestAdditiveAnim)
    {
        // End:0x48C
        if(SpecialMoveState.CurSMInstance != none)
        {
            bAllowAdditiveHitReaction = SpecialMoveState.CurSMInstance.bAllowAdditiveHitReaction;
        }
        // End:0x4CA
        if(bAllowAdditiveHitReaction && !bIncapacitated)
        {
            DoAdditiveHitReaction(bOverrideAdditive);
            bPlayHitReactionSoundEvent = true;
        }
    }
    // End:0x593
    if(bPlayHitReactionSoundEvent)
    {
        // End:0x556
        if(TakeDamageParams.Damage >= TuneDataPlayerPawn.LargeHitSoundDamageThreshhold)
        {
            TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GetHitLarge', 'None', self, Mesh, none);            
        }
        else
        {
            TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GetHitSmall', 'None', self, Mesh, none);
        }
    }
    //return;    
}

simulated function ShouldPlayHitReactionAnimationForLargeNearByGroundHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ShouldPlayHitReactionAnimationForElectricalHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

// Export ULPPlayerPawn::execIsAimingDownSight(FFrame&, void* const)
native simulated event IsAimingDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event GetAccuracyModifier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LS;

    // End:0xA3
    if(IsSpecialFire())
    {
        LS = LPPerkLuckshot(GetEnabledPerk(17));
        // End:0xA3
        if(LS != none)
        {
            return FMax(1.0000000 - (LS.LuckshotTuneData.BlindfireInaccuracyDecrease.GetValue(SavedController) / float(100)), 0.0000000);
        }
    }
    return 1.0000000;
    //return ReturnValue;    
}

simulated function StartAdditiveFireAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;
    local /*0x97E50000-0x00000000*/ private bool playerIsAimingDownSight;

    playerIsAimingDownSight = false;
    // End:0x45
    if(SavedController != none)
    {
        playerIsAimingDownSight = SavedController.IsAimingDownSight();
    }
    // End:0x7F
    if(playerIsAimingDownSight)
    {
        AnimSeqTemplate = AnimTemplateLogic_ADSFiringCycle.GetBestSequenceTemplate(self);        
    }
    else
    {
        AnimSeqTemplate = AnimTemplateLogic_FiringCycle.GetBestSequenceTemplate(self);
    }
    AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.1000000, false, true, 0, 0, false, 3);
    //return;    
}

simulated function StopAdditiveFireAnimation()
{
    AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    //return;    
}

function DelayedDeath()
{
    local /*0x97E50000-0x00000000*/ private float DeathTimer[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[9437185];

    Class'LPDamageTypeForced'
    // End:0x6C
    if(CachedKiller == none)
    {
        CachedKiller = Killer;
        CachedDamageType = DamageType;
        CachedHitLocation = HitLocation;
        SetTimer(DeathTimer, false, 'DEKillPlayer');
    }
    //return;    
}

function DEKillPlayer()
{
    HandleDied(CachedKiller, CachedDamageType, CachedHitLocation);
    CachedKiller = none;
    //return;    
}

simulated function PlayDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLedgeWalking, bShouldSkipDeathSpecialMove;

    bIsLedgeWalking = IsUsingCover() && int(CoverType) == int(3);
    // End:0x8D
    if((FXActionManagerInstance != none) && int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        FXActionManagerInstance.StartFXAction(Class'LPFXAction_DeathPostProcess');
    }
    bShouldSkipDeathSpecialMove = (Mesh.bPauseAnims || IsDoingSpecialMove(Class'LPSM_PlayerExitVS')) || IsDoingSpecialMove(Class'LPSM_PlayerMeleeTakedownDeath');
    super(LPPawn).PlayDying(DamageType, HitLoc);
    // End:0x132
    if(BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StrugglePlayerDying, self))
    {
        return;
    }
    // End:0x159
    if(bIsLedgeWalking)
    {
        DoSpecialMove(Class'LPSM_LedgeWalkingDeath', true);        
    }
    else
    {
        // End:0x17F
        if(!bShouldSkipDeathSpecialMove)
        {
            DoSpecialMove(Class'LPSM_DirectionalDeath', true);
        }
    }
    //return;    
}

function OnDeathFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_ShouldIgnoreDamageType, self))
    {
        return false;
    }
    return super(LPPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function ShouldUsePlayerExplosionDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function CheckThermalEnergyPocketProximity()
{
    local /*0x97E50000-0x00000000*/ private float PocketDistance, MaxDistance, Falloff;
    local /*0x97E50000-0x00000000*/ private @NULL Pocket;
    local /*0x97E50000-0x00000000*/ private bool bPlay;

    // End:0x2C
    if(!IsTimerActive('CheckThermalEnergyPocketProximity'))
    {
        SetTimer(0.1000000, true, 'CheckThermalEnergyPocketProximity');
    }
    // End:0x96
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0x96
        if((SavedController == none) || !SavedController.HasUpgrade(Class'LPUpgrade_ThermalDetector'))
        {
            return;
        }
    }
    // End:0x102
    if(SavedController != none)
    {
        // End:0x102
        if((MyLPPRI != none) && MyLPPRI.MyThermalPost == none)
        {
            bPlay = GetNearestThermalEnergyPocket(Pocket, PocketDistance);
        }
    }
    // End:0x1B2
    if(bPlay && Pocket != none)
    {
        // End:0x1A6
        if(PocketDistance < Pocket.PocketProximityPingMaxDistance)
        {
            MaxDistance = Pocket.PocketProximityPingMaxDistance;
            Falloff = ((MaxDistance - PocketDistance) / MaxDistance) * float(100);            
        }
        else
        {
            bPlay = false;
        }
    }
    switch(ThermalPingParams.pingState)
    {
        // End:0x2CE
        case 2:
            // End:0x221
            if(ThermalPingParams.pingSound == none)
            {
                ThermalPingParams.pingState = 5;
                // [Explicit Continue]
                goto J0x6EA;
            }
            // End:0x27E
            if((Pocket != ThermalPingParams.pingActor) || !bPlay)
            {
                ThermalPingParams.pingState = 3;
                // [Explicit Continue]
                goto J0x6EA;
            }
            ThermalPingParams.pingSound.SetRTPCValue("TEnergyProximity", Falloff);
            // End:0x6EA
            break;
        // End:0x3FC
        case 3:
            // End:0x317
            if(ThermalPingParams.pingSound == none)
            {
                ThermalPingParams.pingState = 5;
                // [Explicit Continue]
                goto J0x6EA;
            }
            PlayAkEvent(ThermalPingParams.pingActor.ThermalPocketTuneData.PocketProximityAkSoundStopCue, true, true);
            ThermalPingParams.pingSound.Stop();
            ThermalPingParams.pingSound = none;
            ThermalPingParams.pingActor = none;
            ThermalPingParams.pingState = 5;
            // End:0x6EA
            break;
        // End:0x4D5
        case 4:
            // End:0x445
            if(ThermalPingParams.pingSound == none)
            {
                ThermalPingParams.pingState = 5;
                // [Explicit Continue]
                goto J0x6EA;
            }
            ThermalPingParams.pingSound.Stop();
            ThermalPingParams.pingSound = none;
            ThermalPingParams.pingActor = none;
            ThermalPingParams.pingState = 5;
            // End:0x6EA
            break;
        // End:0x4DA
        case 0:
        // End:0x56D
        case 5:
            // End:0x502
            if(!bPlay || Pocket == none)
            {
                // [Explicit Continue]
                goto J0x6EA;
            }
            ThermalPingParams.pingState = 1;
            ThermalPingParams.pingActor = Pocket;
            ThermalPingParams.pingDistance = PocketDistance;
        // End:0x6E7
        case 1:
            ThermalPingParams.pingSound = Class'AkAudio.AkComponent'.static.CreateAkComponent(ThermalPingParams.pingActor.ThermalPocketTuneData.PocketProximityAkSoundCue, self, 'None', false, true, false);
            // End:0x646
            if(ThermalPingParams.pingSound == none)
            {
                ThermalPingParams.pingState = 5;
                // [Explicit Continue]
                goto J0x6EA;
            }
            ThermalPingParams.pingSound.Play();
            ThermalPingParams.pingSound.SetRTPCValue("TEnergyProximity", Falloff);
            ThermalPingParams.pingState = 2;
            // End:0x6EA
            break;
        // End:0xFFFF
        default:
            break;
    }
    J0x6EA:

    //return;    
}

simulated function StopThermalEnergyPocketProximity()
{
    switch(ThermalPingParams.pingState)
    {
        // End:0x2B
        case 2:
        // End:0x52
        case 1:
            ThermalPingParams.pingState = 3;
            // End:0x6C
            break;
        // End:0x57
        case 3:
        // End:0x5C
        case 4:
        // End:0x61
        case 0:
        // End:0x69
        case 5:
            // End:0x6C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function AbortThermalEnergyPocketProximity()
{
    // End:0x54
    if(ThermalPingParams.pingSound != none)
    {
        ThermalPingParams.pingSound.Stop();
    }
    ThermalPingParams.pingSound = none;
    ThermalPingParams.pingActor = none;
    ThermalPingParams.pingState = 5;
    //return;    
}

function TakeFallingDamage()
{
    // End:0x31
    if(IsLocallyControlled())
    {
        // End:0x31
        if(SavedController.bMobilityMode)
        {
            return;
        }
    }
    super(Pawn).TakeFallingDamage();
    //return;    
}

simulated function StartEMP()
{
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x47
    if(IsLocallyControlled())
    {
        SavedController.myLPHUD.UpdateVSUmbilicalRange(0.9500000, true);
    }
    // End:0x1E7
    if(Controller != none)
    {
        // End:0x1E7
        if(MyLPPRI.PerksManager != none)
        {
            I = 0;
            J0x85:

            // End:0x1E7 [Loop If]
            if(I < 4)
            {
                // End:0x1D9
                if((MyLPPRI.PerksManager.AssignedPerk[I].Perk != none) && LPPerkDeployable(MyLPPRI.PerksManager.AssignedPerk[I].Perk) != none)
                {
                    LPPerkDeployable(MyLPPRI.PerksManager.AssignedPerk[I].Perk).LastUsedTime = WorldInfo.TimeSeconds;
                }
                I++;
                // [Loop Continue]
                goto J0x85;
            }
        }
    }
    super(LPPawn).StartEMP();
    //return;    
}

simulated function EndEMPEffect()
{
    super(LPPawn).EndEMPEffect();
    // End:0x51
    if(IsLocallyControlled())
    {
        SavedController.myLPHUD.UpdateVSUmbilicalRange(0.0000000);
    }
    //return;    
}

simulated function GetTENGDrillerExtractAmount()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillerTuneData[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], EnergyAmount;

    // End:0x39
    if(!DrillerTuneData.bDrainFromIncapacitatedPlayers && bIncapacitated)
    {
        return 0.0000000;
    }
    EnergyAmount = super(LPPawn).GetTENGDrillerExtractAmount(DrillerTuneData);
    EnergyAmount = FMin(EnergyAmount, TEnergyLevel * (GetMaxTEnergyCapacity()));
    return EnergyAmount;
    //return ReturnValue;    
}

simulated function ExtractDrilledTENG()
{
    local /*0x97E50000-0x00000000*/ private float EnergyAmount[8388609];

    AddThermalEnergy(-EnergyAmount, false);
    //return;    
}

simulated function AddDrilledTENG()
{
    local /*0x97E50000-0x00000000*/ private float EnergyAmount[8388609], Delay;

    DrilledTEnergyToTransfer += EnergyAmount;
    SetTimer(Delay, false, 'ReceiveDrilledTENG');
    //return;    
}

simulated function ReceiveDrilledTENG()
{
    AddThermalEnergy(DrilledTEnergyToTransfer, true);
    // End:0x6B
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x6B
        if(SavedController != none)
        {
            SavedController.ServerModifyStat('Stat_TEnergyDrilled', int(DrilledTEnergyToTransfer));
        }
    }
    DrilledTEnergyToTransfer = 0.0000000;
    //return;    
}

simulated function CheckUmbilicalRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;
    local /*0x97E50000-0x00000000*/ private float DistFromVS, DistPct;
    local /*0x97E50000-0x00000000*/ private @NULL HUD;

    // End:0x11
    if(Controller == none)
    {
        return;
    }
    // End:0xA3
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0xA1
        if(PlayerController(Controller).myHUD != none)
        {
            SavedController.myLPHUD.UpdateVSUmbilicalRange(0.0000000);
        }
        return;
    }
    // End:0xD3
    if(!IsTimerActive('CheckUmbilicalRange'))
    {
        SetTimer(UmbilicalUpdateRate, true, 'CheckUmbilicalRange');
    }
    HUD = SavedController.myLPHUD;
    // End:0x146
    if(int(UmbilicalState) == int(2))
    {
        // End:0x143
        if(HUD != none)
        {
            HUD.UpdateVSUmbilicalRange(1.0000000);
        }        
    }
    else
    {
        // End:0x220
        if(int(UmbilicalState) == int(5))
        {
            // End:0x18E
            if(HUD != none)
            {
                HUD.UpdateVSUmbilicalRange(1.0000000);
            }
            vsPlayerPawn = GetVSPawn(float(GetUmbilicalRange()), DistFromVS);
            // End:0x21D
            if((vsPlayerPawn != none) && vsPlayerPawn.IsAliveAndWell())
            {
                // End:0x21D
                if(!vsPlayerPawn.IsInState('VSShutdown'))
                {
                    UmbilicalState = 4;
                }
            }            
        }
        else
        {
            // End:0x29F
            if(int(UmbilicalState) == int(3))
            {
                // End:0x29C
                if((HUD != none) && !bUmbilicalHUDShuttingDown)
                {
                    bUmbilicalHUDShuttingDown = true;
                    HUD.UpdateVSUmbilicalRange(0.9900000);
                    SetTimer(UmbilicalShutDownTime, false, 'ShutdownUmbilicalHUD');
                }                
            }
            else
            {
                // End:0x31E
                if(int(UmbilicalState) == int(4))
                {
                    // End:0x31B
                    if((HUD != none) && !bUmbilicalHUDStartingUp)
                    {
                        bUmbilicalHUDStartingUp = true;
                        HUD.UpdateVSUmbilicalRange(0.9900000);
                        SetTimer(UmbilicalStartUpTime, false, 'StartUpUmbilicalHUD');
                    }                    
                }
                else
                {
                    // End:0x428
                    if(int(UmbilicalState) == int(1))
                    {
                        bUmbilicalHUDShuttingDown = false;
                        bUmbilicalHUDStartingUp = false;
                        ClearTimer('ShutdownUmbilicalHUD');
                        ClearTimer('StartUpUmbilicalHUD');
                        // End:0x3DE
                        if(DummyVS != none)
                        {
                            DistFromVS = VSize(DummyVS.Location - Location);
                            DistPct = FMin(DistFromVS / DummyUmbilicalRange, 1.0000000);                            
                        }
                        else
                        {
                            DistPct = 0.1000000;
                        }
                        // End:0x425
                        if(HUD != none)
                        {
                            HUD.UpdateVSUmbilicalRange(DistPct);
                        }                        
                    }
                    else
                    {
                        vsPlayerPawn = GetVSPawn(float(GetUmbilicalRange()), DistFromVS);
                        // End:0x499
                        if(vsPlayerPawn == none)
                        {
                            // End:0x494
                            if(HUD != none)
                            {
                                HUD.UpdateVSUmbilicalRange(1.0000000);
                            }
                            return;                            
                        }
                        else
                        {
                            // End:0x537
                            if(vsPlayerPawn.IsInState('VSShutdown'))
                            {
                                // End:0x532
                                if((HUD != none) && !bUmbilicalHUDShuttingDown)
                                {
                                    bUmbilicalHUDShuttingDown = true;
                                    UmbilicalStateAfterShutdown = 5;
                                    HUD.UpdateVSUmbilicalRange(0.9900000);
                                    SetTimer(UmbilicalShutDownTime, false, 'ShutdownUmbilicalHUD');
                                }
                                return;                                
                            }
                            else
                            {
                                // End:0x58E
                                if((vsPlayerPawn.GetTeam() != none) && vsPlayerPawn.GetTeam() != (GetTeam()))
                                {
                                    return;
                                }
                            }
                        }
                        bUmbilicalHUDShuttingDown = false;
                        bUmbilicalHUDStartingUp = false;
                        ClearTimer('ShutdownUmbilicalHUD');
                        ClearTimer('StartUpUmbilicalHUD');
                        DistanceFromVS = int(DistFromVS);
                        // End:0x60C
                        if((vsPlayerPawn != none) && LPVSPlayerPawn(vsPlayerPawn) != none)
                        {
                        }
                        // End:0x67B
                        if(IsLocallyControlled())
                        {
                            DistPct = FMin(float(DistanceFromVS) / float(GetUmbilicalRange()), 1.0000000);
                            // End:0x67B
                            if(HUD != none)
                            {
                                HUD.UpdateVSUmbilicalRange(DistPct);
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function CaptivateTransferEnergytoVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float EnergyToTransfer, CachedStartingEnergy;

    EnergyToTransfer = GetEnergyCount();
    CachedStartingEnergy = GetEnergyCount();
    // End:0xC6
    if(EnergyToTransfer >= 1.0000000)
    {
        EnergyToTransfer = AddThermalEnergy(-EnergyToTransfer, false);
        EnergyToTransfer = vsPawn.AddThermalEnergy(-EnergyToTransfer, false);
        // End:0xC6
        if(EnergyToTransfer < CachedStartingEnergy)
        {
            AddThermalEnergy(CachedStartingEnergy - EnergyToTransfer, false);
        }
    }
    //return;    
}

simulated function ShutdownUmbilicalHUD()
{
    UmbilicalState = UmbilicalStateAfterShutdown;
    bUmbilicalHUDShuttingDown = false;
    //return;    
}

simulated function StartUpUmbilicalHUD()
{
    UmbilicalState = 1;
    // End:0x38
    if(int(UmbilicalStateAfterShutdown) == int(5))
    {
        UmbilicalState = 0;
        UmbilicalStateAfterShutdown = 2;
    }
    bUmbilicalHUDStartingUp = false;
    //return;    
}

simulated function GetVSPawn()
{
    local /*0x97E50000-0x00000000*/ private float DistanceToCheck[8388609], DistFromVS;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], vsPawn, ClosestVS;
    local /*0x97E50000-0x00000000*/ private float DistToVS, ClosestVSDistance;

    // End:0xCA
    foreach WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', vsPawn, Location, DistanceToCheck)
    {
        DistToVS = VSize(vsPawn.Location - Location);
        // End:0xC9
        if((ClosestVS == none) || DistToVS < ClosestVSDistance)
        {
            ClosestVS = vsPawn;
            ClosestVSDistance = DistToVS;
        }        
    }    
    DistFromVS = ClosestVSDistance;
    return ClosestVS;
    //return ReturnValue;    
}

simulated function @NULL FindNearestRepairComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Dist, ClosestDistance;
    local /*0x97E50000-0x00000400*/ private @NULL Comp, ClosestComp, LPMI;

    // End:0x13B
    if(WorldInfo != none)
    {
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x13B
        if(LPMI != none)
        {
            // End:0x13A
            foreach LPMI.RepairableComponentActors(Comp)
            {
                // End:0x139
                if(Comp.Owner != none)
                {
                    Dist = VSizeSq(Comp.Owner.Location - Location);
                    // End:0x139
                    if((ClosestComp == none) || Dist < ClosestDistance)
                    {
                        ClosestComp = Comp;
                        ClosestDistance = Dist;
                    }
                }                
            }            
        }
    }
    return ClosestComp;
    //return ReturnValue;    
}

simulated function @NULL FindNearestVisibleRepairComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], LPMI, RP, Comp, NearestComp, AimDir,
	    DirToComp;

    local /*0x97E50000-0x00000000*/ private int CompTeamNum;
    local /*0x97E50000-0x00000000*/ private float CurrentDot, NearestDot, RequiredDot, CurrentDistSq, RequiredDistSq, VisibleAngle,
	    VisibleDist;

    local /*0x97E50000-0x00000000*/ private bool bCheckEnemy, bCheckNeutral;

    NearestComp = none;
    RP = LPPerkRepair(GetEnabledPerk(1));
    // DebugMode: 0
    assert(RP != none);
    // End:0x442
    if(WorldInfo != none)
    {
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x442
        if(LPMI != none)
        {
            VisibleAngle = RP.RepairTuneData.StatusViewAngle.GetValue(SavedController);
            VisibleDist = RP.RepairTuneData.StatusViewRange.GetValue(SavedController);
            bCheckEnemy = RP.RepairTuneData.bViewEnemyStatus;
            bCheckNeutral = RP.RepairTuneData.bViewNeutralStatus;
            AimDir = Vector(GetAimDirection());
            RequiredDot = Cos(VisibleAngle * 0.0174533);
            NearestDot = RequiredDot;
            RequiredDistSq = VisibleDist * VisibleDist;
            // End:0x441
            foreach LPMI.RepairableComponentActors(Comp)
            {
                // End:0x440
                if(Comp.Owner != none)
                {
                    CompTeamNum = int(Comp.Owner.GetTeamNum());
                    // End:0x440
                    if(((CompTeamNum == int(GetTeamNum())) || bCheckNeutral && CompTeamNum == 3) || bCheckEnemy && CompTeamNum != 3)
                    {
                        DirToComp = Comp.Owner.Location - Location;
                        CurrentDistSq = VSizeSq(DirToComp);
                        // End:0x440
                        if(CurrentDistSq <= RequiredDistSq)
                        {
                            CurrentDot = AimDir Dot Normal(DirToComp);
                            // End:0x440
                            if(CurrentDot > NearestDot)
                            {
                                // End:0x440
                                if((WorldInfo.TimeSeconds - Comp.Owner.LastRenderTime) < 0.1000000)
                                {
                                    NearestDot = CurrentDot;
                                    NearestComp = Comp;
                                }
                            }
                        }
                    }
                }                
            }            
        }
    }
    return NearestComp;
    //return ReturnValue;    
}

simulated function @NULL FindNearestValidRepairComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], Comp, LPMI;
    local /*0x97E50000-0x00000000*/ private editfixedsize array CompList;
    local /*0x97E50000-0x00000000*/ private @NULL C;

    // End:0x1C7
    if(WorldInfo != none)
    {
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x1C7
        if(LPMI != none)
        {
            // End:0x13B
            foreach LPMI.RepairableComponentActors(Comp)
            {
                // End:0x13A
                if(Comp.Owner != none)
                {
                    C.Comp = Comp;
                    C.Dist = VSizeSq(Comp.Owner.Location - Location);
                    CompList.AddItem(C);                    
                }                
            }            
            CompList.Sort(CompareRepairComponentByDistance);            
            // End:0x1C6
            foreach CompList(C)
            {
                // End:0x1C5
                if(C.Comp.CanRepair(self))
                {                    
                    return C.Comp;
                }                
            }            
        }
    }
    return none;
    //return ReturnValue;    
}

simulated function @NULL FindNearestValidHackableComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], Comp, LPMI;
    local /*0x97E50000-0x00000000*/ private editfixedsize array CompList;
    local /*0x97E50000-0x00000000*/ private @NULL C;

    // End:0x1C7
    if(WorldInfo != none)
    {
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x1C7
        if(LPMI != none)
        {
            // End:0x13B
            foreach LPMI.HackableComponentActors(Comp)
            {
                // End:0x13A
                if(Comp.Owner != none)
                {
                    C.Comp = Comp;
                    C.Dist = VSizeSq(Comp.Owner.Location - Location);
                    CompList.AddItem(C);                    
                }                
            }            
            CompList.Sort(CompareHackComponentByDistance);            
            // End:0x1C6
            foreach CompList(C)
            {
                // End:0x1C5
                if(C.Comp.CanBeHacked(self))
                {                    
                    return C.Comp;
                }                
            }            
        }
    }
    return none;
    //return ReturnValue;    
}

function ReplenishAmmoFromAmmoPack()
{
    local /*0x97E50000-0x00000000*/ private @NULL APPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReplenishAmmo[9437185], bReplenishGrenades;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPW;
    local /*0x97E50000-0x00000000*/ private int ReplenishInfoIndex, I, AmmoLeft, AmmoCount, AmmoInPool, AmmoReplenished;

    local /*0x97E50000-0x00000000*/ private bool bIsGrenade, bIsGrenadeWeapon;
    local /*0x97E50000-0x00000000*/ private @NULL AmmoTD;

    true
    true
    AmmoReplenished = 0;
    // End:0x593
    if(InvManager != none)
    {
        // End:0x592
        foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            bIsGrenade = LPWeaponGrenade(LPW) != none;
            // End:0x10B
            if(!bReplenishAmmo || !bReplenishGrenades)
            {
                bIsGrenadeWeapon = bIsGrenade || LPWeaponGLauncher(LPW) != none;
                // End:0x10B
                if((bIsGrenadeWeapon && !bReplenishGrenades) || !bIsGrenadeWeapon && !bReplenishAmmo)
                {
                    continue;                    
                }
            }
            I = 0;
            J0x116:

            // End:0x591 [Loop If]
            if(I < LPW.AmmoTypes.Length)
            {
                AmmoTD = LPTuneDataAmmoDefault(LPW.MyTuneDataWeapon.SupportedAmmoTypes[I]);
                // End:0x1E1
                if((AmmoTD.GetMaxAmmoForWeapon() <= 0) && AmmoTD.AmmoPerMagazine <= 0)
                {                    
                }
                else
                {
                    // End:0x250
                    if(!LPW.IsAmmoUnlocked(SavedController, AmmoTD) || (I > 0) && LPW.IsPreOrderWeapon())
                    {                        
                    }
                    else
                    {
                        ReplenishInfoIndex = APPawn.AmmoReplenishInfo.Find('AmmoData', AmmoTD);                        
                        // End:0x373
                        if(ReplenishInfoIndex == -1)
                        {
                            AmmoLeft = AmmoTD.StartingAmmoPackHolds;
                            APPawn.AmmoReplenishInfo.Insert(0, 1);                            
                            ReplenishInfoIndex = 0;
                            APPawn.AmmoReplenishInfo[0].AmmoData = AmmoTD;
                            APPawn.AmmoReplenishInfo[0].AmmoLeft = AmmoLeft;                            
                        }
                        else
                        {
                            AmmoLeft = APPawn.AmmoReplenishInfo[ReplenishInfoIndex].AmmoLeft;
                        }
                        AmmoInPool = Min(AmmoLeft, AmmoTD.AmmoPerPulse);
                        // End:0x474
                        if(bIsGrenade && IsDoingGrenadeSpecialMove())
                        {
                            AmmoInPool = Min(AmmoInPool, (LPW.GetMagazineCapacity() - LPW.AmmoLeftForWeapon) - 1);
                            AmmoInPool = Max(AmmoInPool, 0);
                        }
                        AmmoCount = LPAmmoTypeDefault(LPW.AmmoTypes[I]).AddAmmo(AmmoTD, 0, AmmoInPool, AmmoTD.bAmmoPackReplenishesMagazine);
                        APPawn.AmmoReplenishInfo[ReplenishInfoIndex].AmmoLeft -= AmmoCount;
                        AmmoReplenished += AmmoCount;
                        LPW.AddAmmoMessage(AmmoCount, I);
                    }
                }
                I++;
                // [Loop Continue]
                goto J0x116;
            }            
        }        
    }
    return AmmoReplenished;
    //return ReturnValue;    
}

reliable server function ServerReplenishAmmoFromMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReplenishMagazine[9437185], bOnlyDefaultAmmo;
    local /*0x97E50000-0x00000000*/ private @NULL LPW;
    local /*0x97E50000-0x00000000*/ private int AvailableAmmo, AmmoAdded, AmmoIdx;
    local /*0x97E50000-0x00000000*/ private @NULL AmmoTD, Perk;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bAmmoWasAdded;

    // End:0x395
    if(InvManager != none)
    {
        // End:0x394
        foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            AmmoIdx = 0;
            J0x50:

            // End:0x393 [Loop If]
            if(AmmoIdx < LPW.MyTuneDataWeapon.SupportedAmmoTypes.Length)
            {
                // End:0xB3
                if(bOnlyDefaultAmmo && AmmoIdx > 0)
                {
                    // End:0x393
                    continue;
                }
                AmmoTD = LPTuneDataAmmoDefault(LPW.MyTuneDataWeapon.SupportedAmmoTypes[AmmoIdx]);
                AmmoAdded = 0;
                // End:0x148
                if(!LPW.IsAmmoUnlocked(LPC, AmmoTD))
                {                    
                }
                else
                {
                    // End:0x1F2
                    if(int(WorldInfo.NetMode) != int(NM_Standalone))
                    {
                        AmmoAdded = LPAmmoTypeDefault(LPW.AmmoTypes[0]).FullyReplenishAmmo(LPW.MyTuneDataWeapon.SupportedAmmoTypes[0]);                        
                    }
                    else
                    {
                        AvailableAmmo = LPC.GetAmmoCountInMunitionsLocker(AmmoTD);
                        // End:0x2F2
                        if(AvailableAmmo != 0)
                        {
                            AmmoAdded = LPAmmoTypeDefault(LPW.AmmoTypes[AmmoIdx]).AddAmmo(AmmoTD, 0, AvailableAmmo, bReplenishMagazine && LPWeaponGrenade(LPW) == none);
                            LPC.AddAmmoToMunitionsLocker(string(AmmoTD), -AmmoAdded);
                        }
                    }
                    // End:0x359
                    if(LPWeaponGrenade(LPW) != none)
                    {
                        ShowGrenades(LPW.AmmoLeftForWeapon, class<LPWeaponGrenade>(LPW.Class));
                    }
                    // End:0x385
                    if((AmmoAdded > 0) && LPC != none)
                    {
                        bAmmoWasAdded = true;
                    }
                }
                AmmoIdx++;
                // [Loop Continue]
                goto J0x50;
            }            
        }        
    }
    // End:0x4A7
    if(bAmmoWasAdded && LPC != none)
    {
        LPC.ClientAddStatusMessage("<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_Replenish_General>");
        TuneDataPawnSoundEventBindings.PlayEventSoundLocally('AmmoAdded', 'None', self, none, none);
        // End:0x4A7
        if(LPC.myLPHUD != none)
        {
            LPC.myLPHUD.RefreshHUDAmmoCount();
        }
    }
    // End:0x60C
    if(MyLPPRI != none)
    {
        I = 0;
        J0x4C1:

        // End:0x60C [Loop If]
        if(I < 22)
        {
            Perk = LPPerkDeployable(GetEnabledPerk(byte(I)));
            // End:0x5FE
            if(Perk != none)
            {
                AmmoTD = Perk.GetBeaconTuneData().TuneDataTotemAmmo;
                // End:0x5FE
                if(AmmoTD != none)
                {
                    AvailableAmmo = LPC.GetAmmoCountInMunitionsLocker(AmmoTD);
                    // End:0x5FE
                    if(AvailableAmmo != 0)
                    {
                        AmmoAdded = Perk.AddInventory(AvailableAmmo);
                        LPC.AddAmmoToMunitionsLocker(string(AmmoTD), -AmmoAdded);
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x4C1;
        }
    }
    //return;    
}

simulated function CanReplenishAmmoFromVS()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPW;
    local /*0x97E50000-0x00000000*/ private int AmmoLeft;

    // End:0x12D
    if(InvManager != none)
    {
        // End:0x12C
        foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            AmmoLeft = LPW.AmmoLeftForWeapon;
            // End:0xAA
            if((LPWeaponGrenade(LPW) != none) && LPSM_GrenadePrime(GetCurrentSpecialMoveInstance()) != none)
            {
                AmmoLeft += 1;
            }
            // End:0x12B
            if((AmmoLeft < LPW.GetMaxAmmoForWeapon()) && SavedController.GetAmmoCountInMunitionsLocker(LPTuneDataAmmoDefault(LPW.GetCurrentAmmoTypeTuneData())) != 0)
            {                
                return true;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function ReplenishDefaultAmmo()
{
    local /*0x97E50000-0x00000000*/ private bool bSimulate[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPW, AmmoTD;
    local /*0x97E50000-0x00000000*/ private bool bAmmoAdded;

    // End:0x1E9
    if(InvManager != none)
    {
        // End:0x1E8
        foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0x82
            if(LPW.MyTuneDataWeapon.SupportedAmmoTypes.Length == 0)
            {
                continue;                
            }
            AmmoTD = LPTuneDataAmmoDefault(LPW.MyTuneDataWeapon.SupportedAmmoTypes[0]);
            // End:0x105
            if(!LPW.IsAmmoUnlocked(SavedController, AmmoTD))
            {
                continue;                
            }
            // End:0x180
            if(LPAmmoTypeDefault(LPW.AmmoTypes[0]).AddAmmo(AmmoTD, 0, -1, false, bSimulate) > 0)
            {
                bAmmoAdded = true;
                // End:0x180
                if(bSimulate)
                {                    
                    return true;
                }
            }
            // End:0x1E7
            if(LPWeaponGrenade(LPW) != none)
            {
                ShowGrenades(LPW.AmmoLeftForWeapon, class<LPWeaponGrenade>(LPW.Class));
            }            
        }        
    }
    // End:0x200
    if(bAmmoAdded)
    {
        NotifyAmmoCountUpdated();
    }
    return bAmmoAdded;
    //return ReturnValue;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bReturnValue;

    bReturnValue = super(SPPawn).HealDamage(Amount, Healer, DamageType);
    // End:0x77
    if(Health == HealthMax)
    {
        // End:0x77
        if(MyLPPRI != none)
        {
            MyLPPRI.PlayerDamageList.Length = 0;
        }
    }
    // End:0xCA
    if((bIncapacitated && int(Role) == int(ROLE_Authority)) && SavedController != none)
    {
        SavedController.PauseBleedOut();
    }
    return bReturnValue;
    //return ReturnValue;    
}

simulated function GetWeaponReloadMultiplier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], T;
    local /*0x97E50000-0x00000000*/ private @NULL TDQF, QF;

    QF = LPPerkQuickFingers(GetEnabledPerk(0));
    T = 1.0000000;
    // End:0xCD
    if(QF != none)
    {
        TDQF = QF.QuickFingersTuneData;
        // End:0xCD
        if(TDQF != none)
        {
            T = T + (TDQF.QuickFingersSpeed.GetValue(SavedController) / float(100));
        }
    }
    return T;
    //return ReturnValue;    
}

simulated function GetHackDistanceBonus()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NT;

    // End:0x8F
    if(HackDistanceBonus < float(0))
    {
        HackDistanceBonus = 0.0000000;
        NT = LPPerkNanoThief(GetEnabledPerk(14));
        // End:0x8F
        if(NT != none)
        {
            HackDistanceBonus = ((SavedController.IsUnlockedMP('Nanothief_Range')) ? 200.0000000 : 0.0000000);
        }
    }
    return HackDistanceBonus;
    //return ReturnValue;    
}

simulated function GetHackSpeedMultiplier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NT;

    // End:0x8F
    if(HackSpeedMultiplier < float(0))
    {
        HackSpeedMultiplier = 1.0000000;
        NT = LPPerkNanoThief(GetEnabledPerk(14));
        // End:0x8F
        if(NT != none)
        {
            HackSpeedMultiplier = ((SavedController.IsUnlockedMP('Nanothief_Speed')) ? 2.0000000 : 1.0000000);
        }
    }
    return HackSpeedMultiplier;
    //return ReturnValue;    
}

simulated function PerkEnabled()
{
    local /*0x97E50000-0x00000000*/ private byte Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return GetEnabledPerk(Index) != none;
    //return ReturnValue;    
}

simulated function GetPerkInstance()
{
    local /*0x97E50000-0x00000000*/ private byte Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x11
    if(MyLPPRI == none)
    {
        return none;
    }
    // End:0x84
    if((MyLPPRI != none) && MyLPPRI.PerksManager != none)
    {
        return MyLPPRI.PerksManager.QueryPerkInstance(Index);
    }
    return none;
    //return ReturnValue;    
}

simulated event CanUseAnimatedCamera()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return SavedController.CanUseAnimatedCamera();
    //return ReturnValue;    
}

simulated function NotifyCameraColliding()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraForward[8388609];
    local /*0x97E50000-0x00000000*/ private float BlockedDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CameraDesiredLoc[8388609], LeadStruggleMode;

    super(SPPawn).NotifyCameraColliding(CameraForward, BlockedDistance, CameraDesiredLoc);
    // End:0x98
    if(InStruggleMode)
    {
        LeadStruggleMode = LPSM_LeadStruggleMode(GetCurrentSpecialMoveInstance());
        // End:0x98
        if(LeadStruggleMode != none)
        {
            LeadStruggleMode.NotifyCameraColliding(CameraForward, BlockedDistance, CameraDesiredLoc);
        }
    }
    //return;    
}

simulated function PlayTakeDamageEffects()
{
    super.PlayTakeDamageEffects();
    //return;    
}

simulated function FullBodyEquipsAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bIsCrouched)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function SetTEnergyGlowTimer()
{
    local /*0x97E50000-0x00000000*/ private float Time[8388609];

    TEnergyGlowTimer = Time;
    //return;    
}

simulated function SetTEnergyFannyPackGlowTimer()
{
    local /*0x97E50000-0x00000000*/ private float Time[8388609];

    // End:0x37
    if(TEnergyFannyPackGlowTimer <= float(0))
    {
        TEnergyFannyPackGlowTimer = Time;
        LocalSoundFX('TEnergyPickup');
    }
    //return;    
}

// Export ULPPlayerPawn::execGetPlayerNormalizedAccuracy(FFrame&, void* const)
native simulated function GetPlayerNormalizedAccuracy()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated function ShouldSkipAnimationOnWeaponSwitch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x18
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRollBase'))
    {
        return true;
    }
    return super(SPInventoryPawn).ShouldSkipAnimationOnWeaponSwitch();
    //return ReturnValue;    
}

simulated function PreChangeWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredWeapon[8388609];

    super(SPInventoryPawn).PreChangeWeapon(DesiredWeapon);
    // End:0x5F
    if(Controller != none)
    {
        SavedController.myLPHUD.ChangedWeapon(DesiredWeapon);
    }
    //return;    
}

simulated event HandleAnimNotifySpecialDodgeReady()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

    // End:0x37
    if(Controller != none)
    {
        SavedController.HandleAnimNotifySpecialDodgeReady(Notify);
    }
    //return;    
}

simulated function NotifyShouldStumble()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x60
    if(!IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBase'))
    {
        OverrideWithCSA(TuneDataPlayerPawn.StumbleCSA, TuneDataPlayerPawn.StumbleTime);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function NotifyNearbyLargeGroundHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x86
    if(!IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBase') && TuneDataPlayerPawn.NearbyLargeGroundHitCSA != none)
    {
        OverrideWithCSA(TuneDataPlayerPawn.NearbyLargeGroundHitCSA, TuneDataPlayerPawn.NearbyLargeGroundHitTime);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function NotifyElectricalHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x86
    if(!IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBase') && TuneDataPlayerPawn.ElectricalHitCSA != none)
    {
        OverrideWithCSA(TuneDataPlayerPawn.ElectricalHitCSA, TuneDataPlayerPawn.ElectricalHitTime);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetLodForCinematic()
{
    Mesh.MinLodModel = 0;
    Mesh.ForcedLodModel = 1;
    bUsingCinematicLod = true;
    //return;    
}

simulated function SetLodForInGame()
{
    Mesh.MinLodModel = 0;
    Mesh.ForcedLodModel = 0;
    bUsingCinematicLod = false;
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, AIPawn;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    // End:0x9E
    if((ClassIsChildOf(DamageType, Class'LPDamageTypeFreeze') || ClassIsChildOf(DamageType, Class'LPDamageTypeSpitterAcid')) && IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRollBase'))
    {
        InDamage = 0;
    }
    // End:0xD9
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeVSISSCloseRangeStrike') && IsDoingSpecialMove(Class'LPSM_PlayerRepairSimple'))
    {
        InDamage = 0;
    }
    // End:0x315
    if(InstigatedBy != none)
    {
        AIPawn = LPAIPawn(InstigatedBy.Pawn);
        // End:0x315
        if(AIPawn != none)
        {
            InDamage *= AIPawn.TuneDataAIPawn.GetDamageMultiplier(AIPawn, self);
            // End:0x315
            if(TuneDataPlayerPawn.HealthAlmostDeadSmallBreak > 0)
            {
                // End:0x222
                if((Health > TuneDataPlayerPawn.HealthAlmostDeadSmallBreak) && (Health - InDamage) < TuneDataPlayerPawn.HealthAlmostDeadSmallBreak)
                {
                    TimeReachedAlmostDeadHealth = WorldInfo.TimeSeconds;
                }
                // End:0x315
                if((Health < TuneDataPlayerPawn.HealthAlmostDeadSmallBreak) && (WorldInfo.TimeSeconds - TimeReachedAlmostDeadHealth) < TuneDataPlayerPawn.HealthAlmostDeadSmallBreakTime)
                {
                    // End:0x315
                    if((InDamage > Health) && ClassIsChildOf(DamageType, Class'LPDamageTypeBallistic'))
                    {
                        // End:0x2E8
                        if(Health == 1)
                        {
                            Health = 2;
                        }
                        // End:0x315
                        if(InDamage >= Health)
                        {
                            InDamage = Health - 1;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

simulated function OnForceCrouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x7E
    if(inAction.InputLinks[0].bHasImpulse)
    {
        ChangePosture(true, inAction.CrouchCSA, inAction.BlendTime);
    }
    // End:0xDF
    if(inAction.InputLinks[1].bHasImpulse)
    {
        ChangePosture(false, none, inAction.BlendTime);
    }
    //return;    
}

simulated function OnForceZiplineSprint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x43
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bForceZiplineSprint = true;
    }
    // End:0x86
    if(inAction.InputLinks[1].bHasImpulse)
    {
        bForceZiplineSprint = false;
    }
    //return;    
}

function ChangePosture()
{
    local /*0x97E50000-0x00000000*/ private bool bWantCrouch[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CrouchCSAOverride[9437185];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185];

    -1.0000000
    // End:0x2A
    if(bWantCrouch && !bCanCrouch)
    {
        return;
    }
    // End:0x61
    if(bWantsToCrouch && BlendTime == float(-1))
    {
        BlendTime = CrouchTransitionBlendTime;
    }
    super(SPGFCoverPawn).ChangePosture(bWantCrouch, CrouchCSAOverride, BlendTime);
    // End:0xC1
    if(bWantCrouch)
    {
        PlayerController(Controller).bDuck = 1;        
    }
    else
    {
        PlayerController(Controller).bDuck = 0;
    }
    CrouchTransitionBlendTime = BlendTime;
    // End:0x174
    if(bWantCrouch)
    {
        // End:0x139
        if(CrouchCSAOverride != none)
        {
            PlayerCrouchCSA = LPCSAO_Player(CrouchCSAOverride);            
        }
        else
        {
            PlayerCrouchCSA = DefaultCrouchCSA;
        }
        // End:0x171
        if(!PlayerCrouchCSA.IsCrouchingCSA(self))
        {
        }        
    }
    else
    {
        PlayerCrouchCSA = none;
    }
    // End:0x1B1
    if(int(Role) == int(ROLE_AutonomousProxy))
    {
        ServerChangePosture(bWantCrouch, CrouchCSAOverride);
    }
    //return;    
}

simulated function OnSetContextSensitiveAnimObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], CSA;

    CSA = LPCSAO_Player(Action.ContextSensitiveAnimObject);
    // End:0x67
    if((CSA != none) && CSA.IsCrouchingCSA(self))
    {
        return;
    }
    // End:0xEE
    if(bIsCrouched)
    {
        ContextSensitiveAnimInfo.KismetCSA = Action.ContextSensitiveAnimObject;
        ContextSensitiveAnimInfo.bKismetTopPriority = Action.bIsTopPriorityCSA;
        return;
    }
    super(SPPawn).OnSetContextSensitiveAnimObject(Action);
    //return;    
}

reliable server function ServerChangePosture()
{
    local /*0x97E50000-0x00000000*/ private bool bWantCrouch[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InCrouchCSA[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185];

    -1.0000000
    PlayerCrouchCSA = LPCSAO_Player(InCrouchCSA);
    CrouchTransitionBlendTime = BlendTime;
    ShouldCrouch(bWantCrouch);
    //return;    
}

simulated event EndCrouch()
{
    local /*0x97E50000-0x00000000*/ private float HeightAdjust[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ThirdPersonCameraMode;

    super(SPPawn).EndCrouch(HeightAdjust);
    UseContextSensitiveAnimObject(none, CrouchTransitionBlendTime);
    CrouchTransitionBlendTime = -1.0000000;
    // End:0xE3
    if(IsLocallyControlled())
    {
        SavedController.SetDefaultCam();
        ThirdPersonCameraMode = SPCameraModeAimControlThirdPerson(SavedController.GetCurrentCameraMode());
        // End:0xE3
        if(ThirdPersonCameraMode != none)
        {
            ThirdPersonCameraMode.ForceFilterZLocation(true, TuneDataPlayerPawn.CrouchCameraFilterDuration);
        }
    }
    //return;    
}

simulated event StartCrouch()
{
    local /*0x97E50000-0x00000000*/ private float HeightAdjust[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CrouchCameraMode;

    super(SPPawn).StartCrouch(HeightAdjust);
    UseContextSensitiveAnimObject(DefaultCrouchCSA, CrouchTransitionBlendTime);
    CrouchTransitionBlendTime = -1.0000000;
    // End:0xC4
    if((PlayerCrouchCSA != none) && PlayerCrouchCSA != DefaultCrouchCSA)
    {
        PlayerCrouchCSA.AllowOldCSAAnimsToPersist = true;
        UseContextSensitiveAnimObject(PlayerCrouchCSA, CrouchTransitionBlendTime);
        PlayerCrouchCSA.AllowOldCSAAnimsToPersist = false;
    }
    // End:0x202
    if(IsLocallyControlled())
    {
        // End:0x182
        if(SavedController != none)
        {
            SavedController.EndSprint();
            SavedController.PlayerMoveInfo.bSpecialActionButtonPressed = false;
            SavedController.SetCrouchCam();
            // End:0x182
            if(Weapon == none)
            {
                InvManager.SwitchToBestWeapon();
            }
        }
        CrouchCameraMode = LPCameraModeAimControlCrouch(SavedController.GetCurrentCameraMode());
        // End:0x202
        if(CrouchCameraMode != none)
        {
            CrouchCameraMode.ForceFilterZLocation(true, TuneDataPlayerPawn.CrouchCameraFilterDuration);
        }
    }
    //return;    
}

simulated function OnToggleVSUmbilical()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x15B
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0x68
        if(Action.bDisableTransition)
        {
            UmbilicalState = 1;            
        }
        else
        {
            // End:0xCC
            if((int(UmbilicalState) == int(0)) && int(SavedController.myLPHUD.GetDisplayState()) == int(2))
            {
                UmbilicalState = 1;                
            }
            else
            {
                // End:0xEC
                if(int(UmbilicalState) != int(1))
                {
                    UmbilicalState = 4;
                }
            }
        }
        DummyVS = Action.VSDummyActor;
        // End:0x158
        if(DummyVS != none)
        {
            DummyUmbilicalRange = VSize(DummyVS.Location - Location);
        }        
    }
    else
    {
        // End:0x261
        if(Action.InputLinks[1].bHasImpulse)
        {
            // End:0x1C3
            if(Action.bDisableTransition)
            {
                UmbilicalState = 2;                
            }
            else
            {
                // End:0x227
                if((int(UmbilicalState) == int(0)) && int(SavedController.myLPHUD.GetDisplayState()) == int(4))
                {
                    UmbilicalState = 2;                    
                }
                else
                {
                    // End:0x253
                    if(int(UmbilicalState) != int(2))
                    {
                        UmbilicalState = 3;
                        UmbilicalStateAfterShutdown = 2;
                    }
                }
            }
            DummyVS = none;            
        }
        else
        {
            // End:0x2B0
            if(Action.InputLinks[2].bHasImpulse)
            {
                UmbilicalState = 0;
                DummyVS = none;
            }
        }
    }
    //return;    
}

function OnWeaponEquipped()
{
    super(SPInventoryPawn).OnWeaponEquipped();
    // End:0x39
    if(SavedController != none)
    {
        SavedController.AllowAimDownSight();
    }
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_NotifyWeaponTakeOutFinished, self);
    //return;    
}

function OnWeaponPuttingDown()
{
    super(SPInventoryPawn).OnWeaponPuttingDown();
    // End:0x39
    if(SavedController != none)
    {
        SavedController.AllowAimDownSight(false);
    }
    //return;    
}

reliable client simulated function ClientNotifyProximityToInteractivePickup()
{
    local /*0x97E50000-0x00000000*/ private class InventoryClassItem[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PickupActor[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ItemName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP, TransContext, TransTag;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PickupMessage;

    InventoryPickupNotification.ItemClass = InventoryClassItem;
    InventoryPickupNotification.PickupActor = PickupActor;
    InventoryPickupNotification.TimeOfNotification = WorldInfo.TimeSeconds;
    // End:0x2CE
    if((SavedController != none) && SavedController.myLPHUD != none)
    {
        // End:0x23D
        if(Len(ItemName) > 0)
        {
            LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
            TransContext = LP.GetTranslationContext();
            TransTag = TransContext.GetTranslatorTagFromName('Strings');
            PickupMessage = TransTag.Translate("LostPlanetGame.HUDHintMessages.HUDHint_PickupSpecificItem");
            PickupMessage = Repl(PickupMessage, "<Item>", ItemName);
            SavedController.myLPHUD.DisplayHUDMessageLayer(12, PickupMessage, -1.0000000, CheckInteractivePickupProximity);            
        }
        else
        {
            SavedController.myLPHUD.DisplayHUDMessageLayer(12, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PickupItem>", -1.0000000, CheckInteractivePickupProximity);
        }
    }
    //return;    
}

reliable client simulated function ClientNotifyProximityToInteractiveWeaponPickup()
{
    local /*0x97E50000-0x00000000*/ private class InventoryClassItem[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PickupActor[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ItemName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    InventoryWeaponPickupNotification.ItemClass = InventoryClassItem;
    InventoryWeaponPickupNotification.PickupActor = PickupActor;
    InventoryWeaponPickupNotification.TimeOfNotification = WorldInfo.TimeSeconds;
    // End:0x1D5
    if((SavedController != none) && SavedController.myLPHUD != none)
    {
        // End:0x1D5
        if(ClassIsChildOf(InventoryClassItem, Class'LPWeapon'))
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_DropSwapWeapon>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageWeaponSwap';
            SavedController.myLPHUD.DisplayHUDMessageLayer(23, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_SwapWeapons>", -1.0000000, CheckInteractiveWeaponPickupProximity,,,, UIElementInfo);
        }
    }
    //return;    
}

simulated function CheckInteractivePickupProximity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL W, P, DP, APA;

    // End:0x176
    if(!IsDoingASpecialMove())
    {
        // End:0x55
        foreach TouchingActors(Class'Engine.Inventory', W)
        {
            // End:0x54
            if(W == InventoryPickupNotification.PickupActor)
            {                
                return true;
            }            
        }        
        // End:0xE8
        foreach TouchingActors(Class'Engine.DroppedPickup', DP)
        {
            // End:0xE7
            if(DP == InventoryPickupNotification.PickupActor)
            {
                // End:0xE4
                if((LPDroppedPickup(DP) != none) && !LPDroppedPickup(DP).CanBePickedUpBy(self))
                {
                    continue;                    
                }                
                return true;
            }            
        }        
        // End:0x158
        foreach TouchingActors(Class'SPEngine.SPPickupFactory', P)
        {
            // End:0x157
            if(P == InventoryPickupNotification.PickupActor)
            {
                // End:0x154
                if(!P.CanBePickedUpBy(self))
                {
                    continue;                    
                }                
                return true;
            }            
        }        
        // End:0x175
        foreach TouchingActors(Class'LPAmmoPickupActor', APA)
        {            
            return true;            
        }        
    }
    InventoryPickupNotification.PickupActor = none;
    InventoryPickupNotification.ItemClass = none;
    // End:0x1EB
    foreach TouchingActors(Class'SPEngine.SPPickupFactory', P)
    {
        P.SetRecheckValidTouchTimer();        
    }    
    return false;
    //return ReturnValue;    
}

simulated function CheckInteractiveWeaponPickupProximity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P, DP;

    // End:0xEF
    if(!IsDoingASpecialMove())
    {
        // End:0x7E
        foreach TouchingActors(Class'LPWeaponPickupFactory', P)
        {
            // End:0x7D
            if(P == InventoryWeaponPickupNotification.PickupActor)
            {
                // End:0x7A
                if(!P.CanBePickedUpBy(self))
                {
                    continue;                    
                }                
                return true;
            }            
        }        
        // End:0xEE
        foreach TouchingActors(Class'LPDroppedPickupWeapon', DP)
        {
            // End:0xED
            if(DP == InventoryWeaponPickupNotification.PickupActor)
            {
                // End:0xEA
                if(!DP.CanBePickedUpBy(self))
                {
                    continue;                    
                }                
                return true;
            }            
        }        
    }
    InventoryWeaponPickupNotification.PickupActor = none;
    InventoryWeaponPickupNotification.ItemClass = none;
    // End:0x164
    foreach TouchingActors(Class'LPWeaponPickupFactory', P)
    {
        P.SetRecheckValidTouchTimer();        
    }    
    // End:0x19E
    foreach TouchingActors(Class'LPDroppedPickupWeapon', DP)
    {
        DP.SetRecheckValidTouchTimer();        
    }    
    return false;
    //return ReturnValue;    
}

reliable client simulated function ClientNotifyAmmoFull()
{
    // End:0xC8
    if((SavedController != none) && SavedController.myLPHUD != none)
    {
        SavedController.myLPHUD.DisplayHUDMessageLayer(12, "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_AmmoFull>", 1.0000000, CheckNotifyAmmoFull);
    }
    //return;    
}

simulated function CheckNotifyAmmoFull()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL F;

    // End:0x4E
    foreach TouchingActors(Class'LPCustomizablePickupFactory', F)
    {
        // End:0x4D
        if((LPSmartAmmoPickupFactory(F) != none) || LPInfiniteAmmoPickupFactory(F) != none)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function OnPickUpAudioLog()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    Action.PickedUpItem(self);
    //return;    
}

function OnPickUpScrap()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    Action.PickedUpItem(self);
    //return;    
}

function OnPickUpThermalEnergyContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    Action.PickedUpItem(self);
    //return;    
}

function OnPickUpSurveyMap()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    Action.PickedUpItem(self);
    //return;    
}

event @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], OtherComp, HitLocation, HitNormal, OPP;

    local /*0x97E50000-0x00000000*/ private float Distance;

    super.RanIntoActor(OtherActor, OtherComp, HitLocation, HitNormal);
    OPP = LPPlayerPawn(OtherActor);
    // End:0x5B
    if(OPP == none)
    {
        return;
    }
    // End:0x92
    if((SavedController == none) || SavedController.myLPHUD == none)
    {
        return;
    }
    // End:0x1CC
    if(OPP.bIncapacitated)
    {
        Distance = DistanceBetweenCollisionCylinders(OPP);
        // End:0x16B
        if(int(OPP.GetTeamNum()) == int(GetTeamNum()))
        {
            // End:0x168
            if(Distance < TuneDataPlayerPawn.ReviveIncapacitatedDistance.GetValue())
            {
                // End:0x168
                if(true)
                {
                    SavedController.DisplayReviveIncapacitatedMessage_Revive();
                }
            }            
        }
        else
        {
            // End:0x1CC
            if(Distance <= TuneDataPlayerPawn.MeleeStompRange.GetValue())
            {
                SavedController.DisplayMeleeMessage_Stomp();
            }
        }
    }
    //return;    
}

function TossInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL Inv[8388609], ForceVelocity, TossVel, Offset;

    // End:0x32
    if(ForceVelocity != vect(0.0000000, 0.0000000, 0.0000000))
    {
        TossVel = ForceVelocity;        
    }
    else
    {
        TossVel = Vector(Rotation);
        TossVel = (TossVel * ((Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 200.0000000);
    }
    Offset = Vector(Rotation);
    Offset *= (float(2) * CylinderComponent.CollisionRadius);
    Inv.DropFrom(Location + Offset, TossVel);
    //return;    
}

function NotifyMeleeTakedown()
{
    local /*0x97E50000-0x00000000*/ private int Damage;

    // End:0x147
    if(MeleeTakedownActor != none)
    {
        Damage = int(TuneDataPlayerPawn.MeleeTakedownDamage.GetValue());
        MeleeTakedownActor.TakeDamage(Damage, SavedController, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypePlayerMeleeVisceralTakedown');
        // End:0x147
        if((TuneDataPlayerPawn.MeleeTakedownFeedbackWaveform != none) && !SavedController.IsForceFeedbackWaveformPlaying(TuneDataPlayerPawn.MeleeTakedownFeedbackWaveform))
        {
            SavedController.ClientPlayForceFeedbackWaveform(TuneDataPlayerPawn.MeleeTakedownFeedbackWaveform);
        }
    }
    //return;    
}

function NotifyMeleeStomp()
{
    local /*0x97E50000-0x00000000*/ private int Damage;

    // End:0x147
    if(MeleeTakedownActor != none)
    {
        Damage = int(TuneDataPlayerPawn.MeleeTakedownDamage.GetValue());
        MeleeTakedownActor.TakeDamage(Damage, Controller, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypePlayerMeleeStomp');
        // End:0x147
        if((TuneDataPlayerPawn.MeleeTakedownFeedbackWaveform != none) && !SavedController.IsForceFeedbackWaveformPlaying(TuneDataPlayerPawn.MeleeTakedownFeedbackWaveform))
        {
            SavedController.ClientPlayForceFeedbackWaveform(TuneDataPlayerPawn.MeleeTakedownFeedbackWaveform);
        }
    }
    //return;    
}

function SetupMeleeTakedown()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];

    MeleeTakedownActor = Target;
    //return;    
}

function ClearMeleeTakedownActor()
{
    MeleeTakedownActor = none;
    //return;    
}

event ImpactCombatTargetAllowed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn, OtherPawnLoc, TestFromLoc;

    OtherPawn = LPPawn(HitActor);
    // End:0x1C6
    if(OtherPawn != none)
    {
        // End:0xFA
        if(!SPGameInfo(WorldInfo.Game).bAllowFriendlyFire)
        {
            // End:0x88
            if(IsSameTeam(OtherPawn))
            {
                return false;                
            }
            else
            {
                // End:0xFA
                if((SPAIController(OtherPawn.Controller) != none) && SPAIController(OtherPawn.Controller).IsFriendlyPawn(self))
                {
                    return false;
                }
            }
        }
        TestFromLoc = Location;
        TestFromLoc.Z += ((GetCollisionHeight()) / float(4));
        OtherPawnLoc = OtherPawn.Location;
        OtherPawnLoc.Z = TestFromLoc.Z;
        // End:0x1C6
        if(!FastTrace(OtherPawnLoc, TestFromLoc, vect(1.0000000, 1.0000000, 1.0000000)))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class ImpactDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Frac;
    local /*0x97E50000-0x00000000*/ private float Damage, DamageMin, DamageMax;
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl, OtherPawn;
    local /*0x97E50000-0x00000000*/ private bool bHandledByAI, bCombatWindowMissed, bIsAPawn;

    // End:0x2D
    if(Class'LPWeapon'.static.PassThroughDamage(HitActor))
    {
        return;
    }
    Frac = FracturedStaticMeshActor(HitActor);
    // End:0xBA
    if((Frac != none) && Frac.IsFracturedByDamageType(ImpactDamageType))
    {
        Frac.BreakOffPartsInRadius(ImpactLocation, 50.0000000, 500.0000000, true);
        return;
    }
    bCombatWindowMissed = false;
    bHandledByAI = false;
    bIsAPawn = false;
    // End:0x322
    if(HitActor.IsA('LPPawn') || HitActor.IsA('LPThermalEnergyPostMeshActor'))
    {
        bIsAPawn = true;
        OtherPawn = LPPawn(HitActor);
        // End:0x18E
        if((OtherPawn != none) && FindActiveCombatWindow(Class'LPCombatWindow_Melee', OtherPawn))
        {
            bCombatWindowMissed = true;            
        }
        else
        {
            AICtrl = ((OtherPawn != none) ? LPAIController(OtherPawn.Controller) : none);
            // End:0x214
            if(AICtrl != none)
            {
                bHandledByAI = AICtrl.NotifyPlayerMeleeHit(self, ImpactLocation);
            }
            // End:0x322
            if(!bHandledByAI)
            {
                DamageMin = TuneDataPlayerPawn.MeleeDamageMin.GetValue();
                DamageMax = TuneDataPlayerPawn.MeleeDamageMax.GetValue();
                Damage = DamageMin + float(Rand(int(DamageMax - DamageMin)));
                HitActor.TakeDamage(int(Damage), Controller, ImpactLocation, vect(0.0000000, 0.0000000, 0.0000000), ImpactDamageType);
            }
        }
    }
    // End:0x515
    if(!bHandledByAI && !bCombatWindowMissed)
    {
        // End:0x385
        if(bIsAPawn || ImpactLocation != Location)
        {
            ImpactCombatTargetPlayEffects(HitActor, ImpactDamageType);
        }
        // End:0x515
        if(((bIsAPawn && TuneDataPlayerPawn.MeleeFeedbackWaveform != none) && !SavedController.IsForceFeedbackWaveformPlaying(TuneDataPlayerPawn.MeleeFeedbackWaveform)) && (LPWeaponHalberd(self.Weapon) == none) || !SavedController.IsForceFeedbackWaveformPlaying(LPWeaponHalberd(self.Weapon).WeaponChargingWaveform) && !SavedController.IsForceFeedbackWaveformPlaying(LPWeaponHalberd(self.Weapon).WeaponMaxChargeLoopingWaveform))
        {
            SavedController.ClientPlayForceFeedbackWaveform(TuneDataPlayerPawn.MeleeFeedbackWaveform);
        }
    }
    //return;    
}

function ImpactCombatTargetPlayEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private class ImpactDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OverwritePhysMaterial[9437185], PhysMaterial, HitInfo, StartTrace, EndTrace, HitLocation,
	    HitNormal;

    none
    StartTrace = Location;
    EndTrace = HitActor.Location;
    Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,, HitInfo, 1);
    // End:0x98
    if(OverwritePhysMaterial != none)
    {
        PhysMaterial = OverwritePhysMaterial;        
    }
    else
    {
        PhysMaterial = SPPhysicalMaterial(HitInfo.PhysMaterial);
    }
    // End:0x11E
    if(PhysMaterial != none)
    {
        PhysMaterial.PlayImpactEffects(self, HitInfo, HitLocation, HitNormal, ImpactDamageType);
    }
    //return;    
}

simulated function NotifyThermalPostDeploy_PLANT()
{
    //return;    
}

simulated function NotifyThermalPostDeploy_UNPLANT()
{
    //return;    
}

simulated event @NULL HandleNotifyShowProp()
{
    local /*0x97E50000-0x00000000*/ private bool bShowProp[8388609];
    local /*0x97E50000-0x00000000*/ private byte PropType[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL Prop;

    // End:0x3E
    if(int(PropType) == int(1))
    {
        Prop = MineComponent;
        // End:0x3E
        if(bShowProp)
        {
            SetupMineComponent();
        }
    }
    // End:0xFC
    if(Prop != none)
    {
        // End:0xDC
        if(bShowProp)
        {
            // End:0xB9
            if(!Mesh.IsComponentAttached(Prop))
            {
                Mesh.AttachComponentToSocket(Prop, 'PropSocket');
            }
            Prop.SetHidden(false);            
        }
        else
        {
            Prop.SetHidden(true);
        }
    }
    //return;    
}

simulated event HandleNotifyInteractionObjectTriggerExternal()
{
    // End:0x2C
    if(IsLocallyControlled())
    {
        SavedController.HandleNotifyInteractionObjectTriggerExternal();
    }
    //return;    
}

function GetCameraTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Loc[25165825], Rot, eyeLoc, eyeRot;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsIncapacitated;
    local /*0x97E50000-0x00000000*/ private @NULL BodyTM_A, BodyTM_B, NewRotation;
    local /*0x97E50000-0x00000000*/ private int BodyIndex_A, BodyIndex_B;

    bIsIncapacitated = ((Controller != none) ? Controller.IsInState('Incapacitated') : false);
    // End:0x336
    if(((((int(Physics) == int(10)) || bIsIncapacitated) && Mesh != none) && Mesh.PhysicsAsset != none) && Mesh.PhysicsAssetInstance != none)
    {
        BodyIndex_A = Mesh.PhysicsAsset.FindBodyIndex(FacingBone);
        BodyIndex_B = Mesh.PhysicsAssetInstance.RootBodyIndex;
        BodyTM_A = Mesh.PhysicsAssetInstance.Bodies[BodyIndex_A].GetUnrealWorldTM();
        BodyTM_B = Mesh.PhysicsAssetInstance.Bodies[BodyIndex_B].GetUnrealWorldTM();
        NewRotation.Yaw = Rotator(MatrixGetOrigin(BodyTM_A) - MatrixGetOrigin(BodyTM_B)).Yaw;
        Loc = MatrixGetOrigin(BodyTM_B);
        Loc = (Loc * Mesh.PhysicsWeight) + (Location * (1.0000000 - Mesh.PhysicsWeight));
        Loc = Loc + vect(0.0000000, 0.0000000, 100.0000000);
        Rot = NewRotation;
        eyeLoc = Loc;
        eyeRot = Rot;
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function RemoteUpdateArcTargets()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPWPT;

    LPWPT = LPWeaponParticleThrower(Weapon);
    // End:0x53
    if(LPWPT != none)
    {
        LPWPT.RemoteSetArcTargets(ParticleThrowerArcTargets);
    }
    //return;    
}

function TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int PrevHealth;
    local /*0x97E50000-0x00000000*/ private @NULL Shield;

    // End:0x60
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x60
        if((SavedController != none) && SavedController.bIsInVitalSuit)
        {
            return;
        }
    }
    PrevHealth = Health;
    super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x28A
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x28A
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x1B0
            if(((PrevHealth > TuneDataChatter.ChatterEventData.LowHealthThreshold) && Health <= TuneDataChatter.ChatterEventData.LowHealthThreshold) && Health > 0)
            {
                SavedController.BroadcastChatter(12);
            }
            // End:0x207
            if(PrevHealth > 0)
            {
                SavedController.ModifyStat('Stat_TotalDamageTaken', Min(PrevHealth, PrevHealth - Health));
            }
            // End:0x28A
            if(HasDamageImmunityWithEffects())
            {
                Shield = LPFXAction_InvulnerabilityShield(GetFXActionManager().GetFXAction(Class'LPFXAction_InvulnerabilityShield'));
                // End:0x27F
                if(Shield != none)
                {
                    Shield.OnHit();
                }
                ++ShieldHitRepCount;
            }
        }
    }
    //return;    
}

simulated function ShowKnifeFromNotify()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float NotUsed[8388609];

    ShowKnife();
    //return;    
}

simulated exec function ShowKnife()
{
    local /*0x97E50000-0x00000000*/ private name InSocket[9437185];

    'None'
    // End:0xE9
    if(KnifeComponent != none)
    {
        KnifeComponent.SetHidden(false);
        // End:0x66
        if(InSocket == 'None')
        {
            InSocket = DefaultKnifeSocket;
        }
        // End:0xE9
        if(InSocket != AttachedKnifeSocket)
        {
            AttachedKnifeSocket = InSocket;
            KnifeComponent.SetLightEnvironment(LightEnvironment);
            Mesh.AttachComponentToSocket(KnifeComponent, InSocket);
        }
    }
    //return;    
}

simulated function HideKnifeFromNotify()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float NotUsed[8388609];

    HideKnife();
    //return;    
}

simulated exec function HideKnife()
{
    // End:0x62
    if(KnifeComponent != none)
    {
        KnifeComponent.SetLightEnvironment(none);
        KnifeComponent.SetHidden(true);
        AttachedKnifeSocket = 'None';
    }
    //return;    
}

function SetDeploymentGhost()
{
    local /*0x97E50000-0x00000000*/ private @NULL M[8388609];

    // End:0xA9
    if(M == none)
    {
        PerkGhostMesh.SetHidden(true);
        // End:0x85
        if(!Mesh.IsComponentAttached(PerkGhostMesh))
        {
            Mesh.DetachComponent(PerkGhostMesh);
        }
        PerkGhostMesh.SetStaticMesh(none);        
    }
    else
    {
        PerkGhostMesh.SetStaticMesh(M, true);
        // End:0x134
        if(!Mesh.IsComponentAttached(PerkGhostMesh))
        {
            Mesh.AttachComponent(PerkGhostMesh, 'JO_positionTracker');
        }
        PerkGhostMesh.SetHidden(false);
        PerkGhostMesh.SetAbsolute(false, true, false);
    }
    //return;    
}

function SetDeploymentGhostLocationAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Loc[8388609], Rot;

    PerkGhostMesh.SetTranslation(Loc);
    PerkGhostMesh.SetRotation(Rot);
    //return;    
}

simulated function StandUpAfterDeployment()
{
    local /*0x97E50000-0x00000000*/ private @NULL SM;

    SM = LPSM_PlayerDeployDeployableBase(GetCurrentSpecialMoveInstance());
    // End:0x4B
    if(SM != none)
    {
        SM.NextSequence();
    }
    //return;    
}

function ShowWristPDA()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string State[9437185], Speed;

    "incoming"
    "medium"
    // End:0x64
    if(FXAction_WristPDA == none)
    {
        FXAction_WristPDA = LPFXAction_WristPDA(FXActionManagerInstance.StartFXAction(Class'LPFXAction_WristPDA'));
    }
    // End:0xAE
    if(FXAction_WristPDA != none)
    {
        FXAction_WristPDA.ShowWristPDA(bShow, State, Speed);
    }
    //return;    
}

function AnimNotifyStartJobLog()
{
    // End:0x2E
    if(SavedController != none)
    {
        SavedController.NotifyOpenJobLog();
    }
    //return;    
}

simulated function GetProjectileTargetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy[8388609], ReturnValue, TargetPos, EnemyShotDir;

    // End:0x19
    if(Mesh == none)
    {
        return Location;
    }
    // End:0xED
    if(((((IsInCover()) && int(CoverType) == int(2)) && int(CoverAction) != int(3)) && int(CoverAction) != int(4)) && int(CoverAction) != int(5))
    {
        // End:0x97
        if(Enemy == none)
        {
            return Location;
        }
        EnemyShotDir = Normal(Location - Enemy.Location);
        // End:0xED
        if(IsProtectedByCover(EnemyShotDir))
        {
            return Location;
        }
    }
    // End:0x104
    if(IsRolling())
    {
        return Location;
    }
    // End:0x144
    if(Mesh.GetSocketWorldLocationAndRotation('Chest', TargetPos))
    {
        return TargetPos;
    }
    return Location;
    //return ReturnValue;    
}

function StartRepairScreenEffects()
{
    bInReticuleOverride = true;
    // End:0x45
    if((GetFXActionManager()) != none)
    {
        GetFXActionManager().StartFXAction(Class'LPFXAction_RepairScreenSimple');
    }
    //return;    
}

function StopRepairScreenEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL Act;

    // End:0x7A
    if((GetFXActionManager()) != none)
    {
        Act = LPFXAction_RepairScreenSimple(GetFXActionManager().GetFXAction(Class'LPFXAction_RepairScreenSimple'));
        // End:0x7A
        if(Act != none)
        {
            Act.BeginShutdown();
        }
    }
    bInReticuleOverride = false;
    //return;    
}

function StartRepairScreenMinigameEffects()
{
    bInReticuleOverride = true;
    // End:0x73
    if((GetFXActionManager()) != none)
    {
        // End:0x73
        if(!GetFXActionManager().IsFXActionActive(Class'LPFXAction_RepairScreenMinigame'))
        {
            GetFXActionManager().StartFXAction(Class'LPFXAction_RepairScreenMinigame');
        }
    }
    //return;    
}

function StopRepairScreenMinigameEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL Act;

    // End:0x7A
    if((GetFXActionManager()) != none)
    {
        Act = LPFXAction_RepairScreenMinigame(GetFXActionManager().GetFXAction(Class'LPFXAction_RepairScreenMinigame'));
        // End:0x7A
        if(Act != none)
        {
            Act.BeginShutdown();
        }
    }
    bInReticuleOverride = false;
    //return;    
}

function StartReviveScreenEffects()
{
    bInReticuleOverride = true;
    // End:0x45
    if((GetFXActionManager()) != none)
    {
        GetFXActionManager().StartFXAction(Class'LPFXAction_ReviveProjection');
    }
    //return;    
}

function StopReviveScreenEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL Act;

    // End:0x7A
    if((GetFXActionManager()) != none)
    {
        Act = LPFXAction_ReviveProjection(GetFXActionManager().GetFXAction(Class'LPFXAction_ReviveProjection'));
        // End:0x7A
        if(Act != none)
        {
            Act.BeginShutdown();
        }
    }
    bInReticuleOverride = false;
    //return;    
}

simulated function @NULL StartInvulnerabilityEffects()
{
    local /*0x97E50000-0x00000000*/ private float fDuration[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Act, ActMan;

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    ActMan = LPFXActionManager(GetFXActionManager());
    // End:0x115
    if(ActMan != none)
    {
        Act = LPFXAction_InvulnerabilityShield(ActMan.GetFXAction(Class'LPFXAction_InvulnerabilityShield'));
        // End:0x115
        if(Act != none)
        {
            // End:0xED
            if(!Act.IsActive())
            {
                ActMan.StartFXAction(Class'LPFXAction_InvulnerabilityShield');
            }
            Act.SetEffectDuration(fDuration);
        }
    }
    //return;    
}

simulated function StopInvulnerabilityEffects()
{
    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    // End:0x64
    if((GetFXActionManager()) != none)
    {
        GetFXActionManager().StopFXAction(Class'LPFXAction_InvulnerabilityShield');
    }
    //return;    
}

unreliable client simulated function MultiCastReceiveChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];

    ReceiveChatter(ChatterEvent);
    //return;    
}

unreliable client simulated function ClientReceiveChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];

    ReceiveChatter(ChatterEvent);
    //return;    
}

simulated function ReceiveChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL QCS, ChatterAkEvent;
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride, bShouldQueue;
    local /*0x97E50000-0x00000000*/ private int ChatterPriority, Idx;

    ChatterAkEvent = TuneDataChatter.GetAkEvent(ChatterEvent, bShouldOverride, bShouldQueue, ChatterPriority);
    // End:0x5E
    if(ChatterAkEvent == none)
    {
        return;
    }
    // End:0x153
    if(((MPChatterComponent.PlayEvent == none) || !MPChatterComponent.IsPlaying()) || (int(bShouldOverride) > int(0)) && ChatterPriority >= CurrentChatterPriority)
    {
        CurrentChatterPriority = ChatterPriority;
        MPChatterComponent.Stop();
        MPChatterComponent.PlayEvent = ChatterAkEvent;
        MPChatterComponent.Play();        
    }
    else
    {
        // End:0x257
        if(int(bShouldQueue) > int(0))
        {
            QCS.ChatterAkEvent = ChatterAkEvent;
            QCS.ChatterPriority = ChatterPriority;
            Idx = 0;
            J0x1BE:

            // End:0x239 [Loop If]
            if(Idx < QueuedChatterInfo.Length)
            {
                // End:0x22B
                if(ChatterPriority > QueuedChatterInfo[Idx].ChatterPriority)
                {
                    QueuedChatterInfo.InsertItem(Idx, QCS);                    
                    return;
                }
                Idx++;
                // [Loop Continue]
                goto J0x1BE;
            }
            QueuedChatterInfo[QueuedChatterInfo.Length] = QCS;
        }
    }
    //return;    
}

simulated function ShowDebugChatterMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChatterAkEvent[8388609];
    local /*0x97E50000-0x00000000*/ private int ChatterEventIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride, bShouldQueue;
    local /*0x97E50000-0x00000000*/ private int ChatterPriority, Idx;

    -1
    // End:0x2C
    foreach LocalPlayerControllers(Class'LPPlayerController', LPPC)
    {
        // End:0x2C
        break;        
    }    
    // End:0xD2
    if(ChatterEventIndex == -1)
    {
        Idx = 0;
        J0x4B:

        // End:0xD2 [Loop If]
        if(Idx < 23)
        {
            // End:0xC4
            if(ChatterAkEvent == TuneDataChatter.GetAkEvent(byte(Idx), bShouldOverride, bShouldQueue, ChatterPriority))
            {
                ChatterEventIndex = Idx;
                // [Explicit Break]
                goto J0xD2;
            }
            Idx++;
            // [Loop Continue]
            goto J0x4B;
        }
    }
    J0xD2:

    LPPC.myLPHUD.MyLPGFxMovie.MPNotifications.PostNotificationString(((((GetDebugName()) $ ": Chatter ") $ string(ChatterEventIndex)) $ ": ") $ string(ChatterAkEvent), "");
    //return;    
}

reliable client simulated function MultiCastStopChatter()
{
    StopChatter();
    //return;    
}

simulated function StopChatter()
{
    // End:0x2E
    if(MPChatterComponent != none)
    {
        MPChatterComponent.Stop();
    }
    //return;    
}

simulated function IsChatterPlayingOrQueued()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterAkEvent;
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride, bShouldQueue;
    local /*0x97E50000-0x00000000*/ private int ChatterPriority, Idx;

    ChatterAkEvent = TuneDataChatter.GetAkEvent(ChatterEvent, bShouldOverride, bShouldQueue, ChatterPriority);
    // End:0xA2
    if(MPChatterComponent.IsPlaying() && MPChatterComponent.PlayEvent == ChatterAkEvent)
    {
        return true;        
    }
    else
    {
        // End:0x11D
        if(int(bShouldQueue) > int(0))
        {
            Idx = 0;
            J0xC1:

            // End:0x11D [Loop If]
            if(Idx < QueuedChatterInfo.Length)
            {
                // End:0x10F
                if(ChatterAkEvent == QueuedChatterInfo[Idx].ChatterAkEvent)
                {
                    return true;
                }
                Idx++;
                // [Loop Continue]
                goto J0xC1;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function UpdateQueuedChatterAkEvents()
{
    // End:0xF3
    if(MPChatterComponent != none)
    {
        // End:0xF3
        if(!MPChatterComponent.IsPlaying())
        {
            // End:0xF3
            if(QueuedChatterInfo.Length > 0)
            {
                CurrentChatterPriority = QueuedChatterInfo[0].ChatterPriority;
                MPChatterComponent.Stop();
                MPChatterComponent.PlayEvent = QueuedChatterInfo[0].ChatterAkEvent;
                MPChatterComponent.Play();
                QueuedChatterInfo.Remove(0, 1);                
            }
        }
    }
    //return;    
}

function SetMovementPct()
{
    local /*0x97E50000-0x00000000*/ private float InMovementPct[8388609];
    local /*0x97E50000-0x00000000*/ private int LedgeWalkType;

    // End:0x37
    if(!bIsDoingCoverRun || InMovementPct == float(0))
    {
        super(SPGFCoverPawn).SetMovementPct(InMovementPct);
        return;
    }
    LedgeWalkType = GetLedgeWalkType();
    // End:0x73
    if(LedgeWalkType == -1)
    {
        super(SPGFCoverPawn).SetMovementPct(InMovementPct);
        return;
    }
    super(SPGFCoverPawn).SetMovementPct(0.0000000);
    //return;    
}

simulated function @NULL SpawnFrozenGibParticles()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePool, PSComp;

    // End:0x11
    if(FrozenGibParticleSystem == none)
    {
        return;
    }
    ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
    PSComp = ThePool.SPSpawnEmitter(FrozenGibParticleSystem, Location);
    // End:0x93
    if(PSComp == none)
    {
        return;
    }
    PSComp.ActivateSystem();
    //return;    
}

simulated function ToggleEquipmentVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bStowedOnly;

    false
    // End:0x62
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(Role) == int(ROLE_Authority))
    {
        MulticastToggleEquipmentVisibility(bShow, bStowedOnly);
    }
    DoToggleEquipmentVisibility(bShow, bStowedOnly);
    //return;    
}

reliable client simulated function MulticastToggleEquipmentVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bStowedOnly;

    false
    // End:0x1B
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    DoToggleEquipmentVisibility(bShow, bStowedOnly);
    //return;    
}

simulated function DoToggleEquipmentVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bStowedOnly;
    local /*0x97E50000-0x00000000*/ private @NULL LPW, GrenadeWeapon, LPG;

    false
    // End:0x115
    if(InvManager != none)
    {
        // End:0x114
        foreach InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0x113
            if(LPW.bCanEquip)
            {
                // End:0xD3
                if(LPW == Weapon)
                {
                    // End:0xD0
                    if(!bStowedOnly)
                    {
                        LPW.Mesh.SetHidden(!bShow);
                    }
                    // End:0x113
                    continue;
                }
                LPW.StowedMeshComponent.SetHidden(!bShow);
            }            
        }        
    }
    // End:0x1D3
    if(!bStowedOnly && SavedController != none)
    {
        LPG = SavedController.GetGrapplingHook();
        // End:0x1D3
        if((LPG != none) && LPG.GrappleAttachmentMesh != none)
        {
            LPG.GrappleAttachmentMesh.SetHidden(!bShow);
        }
    }
    // End:0x25B
    if(!bStowedOnly)
    {
        GrenadeWeapon = GetGrenade();
        // End:0x25B
        if(GrenadeWeapon != none)
        {
            ShowGrenades(((bShow) ? GrenadeWeapon.AmmoLeftForWeapon : 0), GrenadeWeapon.Class);
        }
    }
    //return;    
}

function PlayerChangedTeam()
{
    Died(none, Class'LPDamageTypeChangedTeam', Location);
    //return;    
}

simulated function EnableRepairScreenProjection()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL scaleVec[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSimple[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL relLocation, relRotation;

    // End:0x22
    if((RepairScreenProjectionComponent == none) || RepairConeProjectionComponent == none)
    {
        return;
    }
    // End:0x4E
    if(RepairScreenProjectionComponent.bAttached)
    {
        DisableRepairScreenProjection();
    }
    Mesh.AttachComponentToSocket(RepairScreenProjectionComponent, SocketName);
    RepairScreenProjectionComponent.SetScale3D(scaleVec);
    RepairScreenProjectionComponent.SetHidden(false);
    Mesh.AttachComponentToSocket(RepairConeProjectionComponent, SocketName);
    RepairConeProjectionComponent.SetHidden(false);
    // End:0x151
    if(bSimple)
    {
        RepairScreenProjectionComponent.SetMaterial(0, RepairScreenProjectionSimpleMaterialInstance);        
    }
    else
    {
        RepairScreenProjectionComponent.SetMaterial(0, RepairScreenProjectionMinigameMaterialInstance);
    }
    // End:0x1A8
    if(IsLocallyControlled())
    {
        RepairScreenProjectionComponent.SetDepthPriorityGroup(1);
    }
    relLocation.X = 0.0000000;
    relLocation.Y = -50.0000000;
    relLocation.Z = 100.0000000;
    relRotation.Pitch = 16384;
    relRotation.Yaw = 0;
    relRotation.Roll = 0;
    // End:0x2F9
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        Mesh.AttachComponent(RepairScreenLightComponent, 'JO_hip', relLocation, relRotation);
        RepairScreenLightComponent.SetEnabled(true);
    }
    //return;    
}

simulated function OnAnimNotifyISSStruggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ISSPawn;

    ISSPawn = LPAIPawnHumanIss(SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x82
    if(ISSPawn != none)
    {
        ISSPawn.OnAnimNotifyISSStruggle(Notify, Duration);
    }
    //return;    
}

simulated function OnBeginStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    DoSpecialMove(inAction.StruggleModeClass, true, false);
    //return;    
}

simulated function TimeInTentacleArea()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return WorldInfo.TimeSeconds - TimeStampInTentacleArea;
    //return ReturnValue;    
}

simulated function OnVSISSPlayerInTentacleArea()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeqAct[8388609];

    // End:0x7D
    if(InSeqAct.InputLinks[0].bHasImpulse)
    {
        // End:0x7A
        if(!bInsideTentacleArea)
        {
            bInsideTentacleArea = true;
            TimeStampInTentacleArea = WorldInfo.TimeSeconds;
        }        
    }
    else
    {
        // End:0xC0
        if(InSeqAct.InputLinks[1].bHasImpulse)
        {
            bInsideTentacleArea = false;
        }
    }
    //return;    
}

simulated state PlayerZipline
{
    ignores TrySpitterAcidReaction;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        StartZiplineSound();
        AimNodeInfo.EndWantsToAimTime = WorldInfo.TimeSeconds;
        bCollideWorld = false;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StopZiplineSound();
        StartZiplineReleaseSound();
        GrappleActor = none;
        bCollideWorld = true;
        //return;        
    }

    simulated function AbortGrapple()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        // End:0x1E
        if(int(Role) == int(ROLE_Authority))
        {
            MultiCastAbortGrapple();
        }
        Hook = GetGrapplingHook();
        // End:0x60
        if(Hook != none)
        {
            Hook.AbortIfNecessary();
        }
        GrappleActor = none;
        bGrappleHooked = false;
        GotoState('NoState');
        //return;        
    }
    stop;    
}

simulated state PlayerGrappling
{
    ignores TrySpitterAcidReaction, CheckForFalling;

    simulated function ShouldAllowFullBodyHitReaction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        super(SPStateObject).BeginState(PreviousStateName);
        AirSpeed = GetGrappleParams().PlayerGrappleSpeed * GrappleSpeedBonusModifier;
        AccelRate = GetGrappleParams().PlayerGrappleAccelRate * GrappleAccelBonusModifier;
        Hook = GetGrapplingHook();
        // End:0x126
        if(Hook != none)
        {
            GrappleDir = Normal(Hook.GrapplePoint - Location);
            GrapplePoint = Hook.GrapplePoint - GrappleDir;
            GrappleDist = VSize(GrapplePoint - Location);
        }
        bGrappleStopping = false;
        SetPhysics(4);
        SetTimer(6.0000000, false, 'TimeoutGrappling');
        //return;        
    }

    simulated function PlayDying()
    {
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609], Hook;

        Hook = GetGrapplingHook();
        // End:0x42
        if(Hook != none)
        {
            Hook.AbortIfNecessary();
        }
        GotoState('NoState');
        super(LPPlayerPawn).PlayDying(DamageType, HitLoc);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        ClearTimer('TimeoutGrappling');
        super(SPStateObject).EndState(NextStateName);
        Hook = GetGrapplingHook();
        // End:0x69
        if(Hook != none)
        {
            Hook.AbortIfNecessary();
        }
        CleanUpGrappleState();
        //return;        
    }

    simulated function CleanUpGrappleState()
    {
        // End:0x1C
        if(bGrappleIsVS)
        {
            bGrappleIsVS = false;            
        }
        else
        {
            SetPhysics(1);
        }
        AirSpeed = TuneDataBasePawn.AirSpeed;
        AccelRate = TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
        GrappleActor = none;
        bGrappleHooked = false;
        //return;        
    }

    simulated function OnGrappleHookConnected()
    {
        local /*0x97E50000-0x00000000*/ private @NULL hookDest;

        hookDest = LPGrapplePointActorBase(GrappleActor);
        // End:0x114
        if(LPHookMeshActor(GrappleActor) != none)
        {
            GrapplePoint = hookDest.GetPawnGrappleDest(self, GetGrappleParams().GrapplePlayerHandOffset);
            GrapplePoint.Z -= float(12);
            // End:0x105
            if(hookDest.GrappleType != none)
            {
                bGrappleFaceNodeDir = hookDest.GrappleType.default.bShouldFaceGrappleRotation;                
            }
            else
            {
                bGrappleFaceNodeDir = false;
            }            
        }
        else
        {
            // End:0x181
            if(LPZiplinePoint_Base(hookDest) != none)
            {
                GrapplePoint = hookDest.GetPawnGrappleDest(self, GetGrappleParams().GrapplePlayerHandOffset);
                bGrappleFaceNodeDir = true;
            }
        }
        GrappleDir = Normal(GrapplePoint - Location);
        bGrappleHooked = true;
        bGrappleIsVS = GrappleActor.IsA('LPBaseVSPlayerPawn');
        // End:0x25E
        if(bGrappleIsVS)
        {
            GrappleLandingDir = Rotator(Normal(GrappleActor.Location - GrapplePoint));
            bGrappleVSFront = (Vector(GrappleLandingDir) Dot Vector(GrappleActor.Rotation)) < 0.0000000;            
        }
        else
        {
            // End:0x2F8
            if(LPVSWinchPoint(hookDest) != none)
            {
                GrappleLandingDir = Rotator(Normal(LPVSWinchPoint(hookDest).WinchWeapon.Owner.Location - hookDest.Location));                
            }
            else
            {
                // End:0x401
                if(LPZiplineActor(hookDest) != none)
                {
                    // End:0x394
                    if(SavedController != none)
                    {
                        GrappleLandingDir = Rotator(Normal(SavedController.ZiplineInfo.ZiplineEnd - SavedController.ZiplineInfo.ZiplineStart));                        
                    }
                    else
                    {
                        GrappleLandingDir = Rotator(Normal(LPZiplineActor(hookDest).ZiplineConnection.Location - hookDest.Location));
                    }                    
                }
                else
                {
                    // End:0x439
                    if(hookDest.bMagnetic)
                    {
                        GrappleLandingDir = Rotation;                        
                    }
                    else
                    {
                        GrappleLandingDir = GrappleActor.Rotation;
                    }
                }
            }
        }
        // End:0x48F
        if(SavedController != none)
        {
            SavedController.HandleGrappleHookConnected();
        }
        NextGrappleSequence();
        //return;        
    }

    simulated function NotifyMovePlayerToGrapplePoint()
    {
        // End:0x2E
        if(SavedController != none)
        {
            SavedController.MovePlayerToGrapplePoint();
        }
        //return;        
    }

    simulated function NotifyStopPlayerFalling()
    {
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }

    simulated function NextGrappleSequence()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_GrapplingHook(self.GetCurrentSpecialMoveInstance());
        // End:0x58
        if(SM != none)
        {
            SM.NextSequence();
        }
        //return;        
    }

    simulated function TimeoutGrappling()
    {
        StopGrappling();
        //return;        
    }

    simulated function StopGrappling()
    {
        // End:0x8E
        if(IsDoingSpecialMove_OF_Class(Class'LPSM_GrapplingHook'))
        {
            LocalEndSpecialMove(none);
            // End:0x8E
            if(bGrappleIsVS)
            {
                // End:0x65
                if(bGrappleVSFront)
                {
                    DoSpecialMove(Class'LPSM_PlayerGrappleEnterVS', true, false, EnterVSMoveFinished);                    
                }
                else
                {
                    DoSpecialMove(Class'LPSM_PlayerGrappleEnterVSRear', true, false, EnterVSMoveFinished);
                }
                return;
            }
        }
        // End:0xA6
        if(IsDoingASpecialMove())
        {
            LocalEndSpecialMove(none);
        }
        // End:0xD4
        if(SavedController != none)
        {
            SavedController.OnStopGrappling();
        }
        bGrappleHooked = false;
        GotoState('NoState');
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(LPPlayerPawn).Tick(DeltaTime);
        // End:0x4A
        if(SavedController != none)
        {
            SavedController.GrappleTick(DeltaTime);
        }
        // End:0x83
        if((int(Physics) != int(4)) && GetStateName() == 'PlayerGrappling')
        {
            // End:0x83
            if(bGrappleHooked)
            {
                SetPhysics(4);
            }
        }
        //return;        
    }

    function OnReachedGrapple()
    {
        StopGrappleMove();
        // End:0x47
        if((SavedController != none) && IsLocallyControlled())
        {
            SavedController.PlayGrappleFinishedSequence();
        }
        //return;        
    }

    simulated function OnGrapplingFinishedAnimBegin()
    {
        // End:0x2A
        if(!IsLocallyControlled() && !bGrappleStopping)
        {
            StopGrappleMove();
        }
        //return;        
    }

    simulated function StopGrappleMove()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        Hook = GetGrapplingHook();
        // End:0x42
        if(Hook != none)
        {
            Hook.PlayerLanded();
        }
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        bGrappleStopping = true;
        //return;        
    }

    simulated function ConstrainToRope()
    {
        local /*0x97E50000-0x00000000*/ private float CurDist;
        local /*0x97E50000-0x00000000*/ private @NULL NewLoc;

        Velocity = GrappleDir * VSize(Velocity);
        CurDist = VSize(Location - GrapplePoint);
        // End:0x6D
        if(CurDist < GrappleDist)
        {
            GrappleDist = CurDist;            
        }
        else
        {
            NewLoc = GrapplePoint + (Normal(Location - GrapplePoint) * GrappleDist);
            SetLocation(NewLoc);
            // End:0xDF
            if(SavedController != none)
            {
                SavedController.SetLocation(NewLoc);
            }
        }
        //return;        
    }

    simulated function FindBestCoverSideFor()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

        // End:0x23
        if(!IsLocallyControlled())
        {
            return super(SPGFCoverPawn).FindBestCoverSideFor(CovInfo);
        }
        return 2;
        //return ReturnValue;        
    }

    simulated function AbortGrapple()
    {
        // End:0x1E
        if(int(Role) == int(ROLE_Authority))
        {
            MultiCastAbortGrapple();
        }
        bGrappleHooked = false;
        GotoState('NoState');
        //return;        
    }
    stop;    
}

state NoState
{    stop;    
}

state PlayerGrappleDownAttach
{
    ignores SetFallLandingState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        bWantsToCrouch = false;
        bGrappleStopping = false;
        bGrappleFaceNodeDir = true;
        bGrappleHooked = false;
        SetPhysics(4);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ClearTimer('CheckGrappleFall');
        //return;        
    }

    simulated function ShouldAllowFullBodyHitReaction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated function GrappleStartNotify()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        Hook = GetGrapplingHook();
        Hook.GotoState('GrappleDownAttach');
        //return;        
    }

    simulated function GrappleFallNotify()
    {
        SetPhysics(2);
        // End:0x25
        if(IsLocallyControlled())
        {
            SetTimer(0.2500000, false, 'CheckGrappleFall');
        }
        //return;        
    }

    simulated function CheckGrappleFall()
    {
        // End:0x55
        if((int(Physics) != int(2)) || Velocity.Z >= float(0))
        {
            Landed(vect(0.0000000, 0.0000000, 1.0000000), none);            
        }
        else
        {
            SetTimer(0.2500000, false, 'CheckGrappleFall');
        }
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x57
        if(IsLocallyControlled())
        {
            // End:0x57
            if(SavedController != none)
            {
                SavedController.GrappleTick(DeltaTime);
                CheckForGrappleLeap(SavedController);
            }
        }
        super(LPPlayerPawn).Tick(DeltaTime);
        //return;        
    }

    simulated function CheckForGrappleLeap()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];

        // End:0x62
        if(bGrappleHooked)
        {
            // End:0x62
            if(CanBeginGrapple())
            {
                bGrappleFaceNodeDir = false;
                LPPC.DoSpecialMove(Class'LPSM_GrappleDownLeap', true, false, None);
            }
        }
        //return;        
    }

    simulated function OnGrappleDownBegin()
    {
        GotoState('PlayerGrapplingDown');
        //return;        
    }

    simulated function CleanUpGrappleState()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        Hook = GetGrapplingHook();
        // End:0x42
        if(Hook != none)
        {
            Hook.AbortIfNecessary();
        }
        bGrappleHooked = false;
        GrappleActor = none;
        //return;        
    }

    simulated function PlayDying()
    {
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609], Hook;

        Hook = GetGrapplingHook();
        // End:0x42
        if(Hook != none)
        {
            Hook.AbortIfNecessary();
        }
        GotoState('NoState');
        super(LPPlayerPawn).PlayDying(DamageType, HitLoc);
        //return;        
    }

    simulated function OnGrappleHookConnected()
    {
        bGrappleHooked = true;
        //return;        
    }
    stop;    
}

state PlayerGrappleDownBase extends PlayerGrappleDownAttach
{
    ignores TrySpitterAcidReaction, CheckForGrappleLeap, BeginState;

    simulated function ShouldAllowFullBodyHitReaction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        CleanUpGrappleState();
        //return;        
    }

    simulated function StopGrappling()
    {
        // End:0x2E
        if(SavedController != none)
        {
            SavedController.OnStopGrappling();
        }
        bGrappleHooked = false;
        GotoState('NoState');
        //return;        
    }

    simulated event Landed()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

        ClearTimer('CheckGrappleFall');
        // End:0x4D
        if(IsLocallyControlled())
        {
            SavedController.DoSpecialMove(Class'LPSM_GrappleDownLand');
        }
        super(Pawn).Landed(HitNormal, FloorActor);
        //return;        
    }

    simulated function OnGrappleDownDrop()
    {
        SetPhysics(2);
        // End:0x25
        if(IsLocallyControlled())
        {
            SetTimer(0.2500000, false, 'CheckGrappleFall');
        }
        //return;        
    }

    simulated function OnGrappleDownLanded()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        Hook = GetGrapplingHook();
        // End:0x61
        if(Hook != none)
        {
            Hook.PlayerLanded();
            Hook.AbortIfNecessary();
        }
        //return;        
    }

    simulated function OnGrappleHookConnected()
    {
        bGrappleHooked = true;
        //return;        
    }

    function TakeFallingDamage()
    {
        // End:0x0F
        if(bGrappleHooked)
        {
            return;
        }
        super(LPPlayerPawn).TakeFallingDamage();
        //return;        
    }

    simulated function NotifyStartPlayerFalling()
    {
        SetPhysics(2);
        // End:0x25
        if(IsLocallyControlled())
        {
            SetTimer(0.2500000, false, 'CheckGrappleFall');
        }
        //return;        
    }
    stop;    
}

state PlayerGrappleLeap extends PlayerGrappleDownBase
{
    ignores OnGrappleDownBegin;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bGrappleFaceNodeDir = false;
        //return;        
    }
    stop;    
}

state PlayerGrapplingDown extends PlayerGrappleDownBase
{
    ignores GrappleStartNotify;
    stop;    
}

simulated state PlayerFallRappelRecovery extends PlayerGrapplingDown
{
    ignores CheckForFalling;

    simulated function OnGrappleHookConnected()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_GrappleRappelRecovery(GetCurrentSpecialMoveInstance());
        SM.OnGrappleHookConnected();
        bGrappleHooked = true;
        //return;        
    }

    simulated function NotifyStopPlayerFalling()
    {
        SetPhysics(4);
        Velocity.Z = 0.0000000;
        //return;        
    }

    simulated function NotifyShootGrappleHook()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;

        Hook = GetGrapplingHook();
        Hook.GotoState('FallRecoveryAttach');
        //return;        
    }
    stop;    
}

state PlayerKnockedDown
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        bIncapacitated = !KnockDownInfo.bAutoRecover;
        // End:0x81
        if(bIncapacitated && int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            ToggleEquipmentVisibility(false);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL PerkRevive, RecParm;
        local /*0x97E50000-0x00000000*/ private float NewHealth;
        local /*0x97E50000-0x00000000*/ private @NULL LPP;

        // End:0x1AA
        if(bIncapacitated && int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            NewHealth = float(HealthMax / 20);
            // End:0x19E
            if(int(Role) == int(ROLE_Authority))
            {
                LPP = LPPlayerPawn(ActorResponsibleForRevival);
                // End:0x189
                if(LPP != none)
                {
                    PerkRevive = LPPerkRevival(LPP.GetPerkInstance(Class'LPPerkRevival'.default.PerkIndex));
                    // End:0x189
                    if(PerkRevive != none)
                    {
                        RecParm = PerkRevive.GetRecoveryParams();
                        NewHealth = RecParm.HealthRestoredValueOnCompletion.GetValue(LPPlayerController(LPP.Controller)) * float(HealthMax);
                    }
                }
                Health = int(NewHealth);
            }
            ToggleEquipmentVisibility(true);
        }
        bIncapacitated = false;
        KnockDownInfo.bActive = false;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function GetMinimumHealthThreshold()
    {
        local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

        // End:0x11
        if(!bIncapacitated)
        {
            return 0;
        }
        return GetAbsoluteMinimumHealthThreshold();
        //return ReturnValue;        
    }

    function VsHitMe()
    {
        local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609], HitNormal;
        local /*0x97E50000-0x00000000*/ private int Damage;

        // End:0x45
        if(!bIncapacitated || IsSameTeam(TheVs))
        {
            super(LPPawn).VsHitMe(TheVs, HitNormal);
            return;
        }
        Damage = int(TuneDataPlayerPawn.MeleeTakedownDamage.GetValue());
        TakeDamage(Damage, Controller, Location, vect(0.0000000, 0.0000000, 0.0000000), TuneDataPawn.DamageTypeFromFastVsKnockBackHit);
        //return;        
    }

    event TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, ApplyImpulse;

        // End:0x14F
        if(bIncapacitated)
        {
            // End:0x14F
            if((int(Physics) == int(10)) && DamageType.default.KDamageImpulse > float(0))
            {
                Momentum = Normal(Momentum);
                CheckHitInfo(HitInfo, Mesh, Momentum, HitLocation);
                ApplyImpulse = Momentum * DamageType.default.KDamageImpulse;
                // End:0x14F
                if(HitInfo.HitComponent != none)
                {
                    HitInfo.HitComponent.AddImpulse(ApplyImpulse * RagdollImpulseScale, HitLocation, HitInfo.BoneName);
                }
            }
        }
        super(LPPlayerPawn).TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        //return;        
    }
    stop;    
}

simulated state Dying
{
    ignores DoKnockDown, PlayHitReactionAnimation;

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPG, AIKiller;
        local /*0x97E50000-0x00000000*/ private int I;

        super.BeginState(PreviousStateName);
        // End:0x273
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            StopChatter();
            // End:0xE4
            if(SavedController != none)
            {
                LPG = LPGRI_Base_MP(WorldInfo.GRI);
                LifeSpan = (1.0000000 + LPG.MPScoreboardDelay) + float(LPG.GetRespawnDelay(int(GetTeamNum())));
            }
            GetFXActionManager().StartFXAction(Class'LPFXAction_PlayerPawnFreezeMaterial');
            GetFXActionManager().StopFXAction(Class'LPFXAction_HealthPostProcess');
            SetTimer(TuneDataPlayerPawn.MaximumIncapacitatedRagdollSettlingTime, false, 'FreezeRagdoll');
            I = 0;
            J0x16D:

            // End:0x24D [Loop If]
            if(I < Mesh.Attachments.Length)
            {
                // End:0x23F
                if(MeshComponent(Mesh.Attachments[I].Component) != none)
                {
                    MeshComponent(Mesh.Attachments[I].Component).SetHidden(true);
                }
                I++;
                // [Loop Continue]
                goto J0x16D;
            }
            // End:0x270
            if(int(Role) == int(ROLE_Authority))
            {
                SetRemainingDamageImmunityTime(0.0000000);
            }            
        }
        else
        {
            AIKiller = LPAIPawn(TakeDamageParams.InstigatedByPawn);
            AIKiller.NotifyYouKilledPlayer();
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x33
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            FreezeRagdoll();
        }
        //return;        
    }

    event Timer()
    {
        // End:0x36
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            super.Timer();            
        }
        else
        {
            // End:0x131
            if((SavedController != none) && SavedController.myLPHUD != none)
            {
                // End:0x12E
                if((SavedController.myLPHUD.ScoreboardIsShown() || SavedController.myLPHUD.IsPauseMenuOpen()) || SavedController.myLPHUD.IsMunitionsLockerOpen())
                {
                    LifeSpan = 3.5000000;
                    SetTimer(3.0000000, false);
                }                
            }
            else
            {
                GetFXActionManager().StopFXAction(Class'LPFXAction_HealthPostProcess');
            }
        }
        //return;        
    }

    simulated function FreezeRagdoll()
    {
        // End:0xC2
        if(Mesh != none)
        {
            Mesh.SetRBLinearVelocity(vect(0.0000000, 0.0000000, 0.0000000));
            Mesh.SetRBAngularVelocity(vect(0.0000000, 0.0000000, 0.0000000));
            // End:0xC2
            if(Mesh.PhysicsAssetInstance != none)
            {
                Mesh.PhysicsAssetInstance.SetAllBodiesFixed(true);
            }
        }
        ClearTimer('FreezeRagdoll');
        ClearTimer('CheckRagdollFreeze');
        //return;        
    }

    simulated function CheckRagdollFreeze()
    {
        // End:0x6C
        if(VSizeSq(Velocity) < (TuneDataPlayerPawn.IncapacitatedRagdollSettlingVelocity * TuneDataPlayerPawn.IncapacitatedRagdollSettlingVelocity))
        {
            FreezeRagdoll();
            ClearTimer('CheckRagdollFreeze');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    UmbilicalStateAfterShutdown=EHUDUmbilicalState.UHS_Disabled
    bUseShortVSEntry=true
    UmbilicalShutDownTime=2.0000000
    UmbilicalStartUpTime=2.0000000
    UmbilicalUpdateRate=0.1000000
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.KnifeComp'
    begin object name=KnifeComp class=Class'Engine.StaticMeshComponent'
    end object
    KnifeComponent=KnifeComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.MineComp'
    begin object name=MineComp class=Class'Engine.StaticMeshComponent'
    end object
    MineComponent=MineComp
    DefaultKnifeSocket="KnifeSocket"
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.Grenade1Comp'
    begin object name=Grenade1Comp class=Class'Engine.StaticMeshComponent'
    end object
    Grenade1Component=Grenade1Comp
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.Grenade2Comp'
    begin object name=Grenade2Comp class=Class'Engine.StaticMeshComponent'
    end object
    Grenade2Component=Grenade2Comp
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.Grenade3Comp'
    begin object name=Grenade3Comp class=Class'Engine.StaticMeshComponent'
    end object
    Grenade3Component=Grenade3Comp
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.Grenade4Comp'
    begin object name=Grenade4Comp class=Class'Engine.StaticMeshComponent'
    end object
    Grenade4Component=Grenade4Comp
    // Reference: SkeletalMeshComponent'Default__LPPlayerPawn.ZiplineComp'
    begin object name=ZiplineComp class=Class'Engine.SkeletalMeshComponent'
    end object
    ZiplineTrolleyComponent=ZiplineComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.PerkGhostMeshA'
    begin object name=PerkGhostMeshA class=Class'Engine.StaticMeshComponent'
    end object
    PerkGhostMesh=PerkGhostMeshA
    // Reference: PointLightComponent'Default__LPPlayerPawn.RepairScreenLightComponent0'
    begin object name=RepairScreenLightComponent0 class=Class'Engine.PointLightComponent'
    end object
    RepairScreenLightComponent=RepairScreenLightComponent0
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.RepairScreenProjectionComponent0'
    begin object name=RepairScreenProjectionComponent0 class=Class'Engine.StaticMeshComponent'
    end object
    RepairScreenProjectionComponent=RepairScreenProjectionComponent0
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.RepairConeProjectionComponent0'
    begin object name=RepairConeProjectionComponent0 class=Class'Engine.StaticMeshComponent'
    end object
    RepairConeProjectionComponent=RepairConeProjectionComponent0
    SnowBlendTime=-1.0000000
    SnowMeltRate=0.0400000
    GrappleSpeedBonusModifier=1.0000000
    GrappleAccelBonusModifier=1.0000000
    FacingBone="JO_Spine_B"
    CrouchTransitionBlendTime=-1.0000000
    // Reference: PointLightComponent'Default__LPPlayerPawn.JobLogLightComp'
    begin object name=JobLogLightComp class=Class'Engine.PointLightComponent'
    end object
    JobLogLightComponent=JobLogLightComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawn.JobLogProjectionConeComp'
    begin object name=JobLogProjectionConeComp class=Class'Engine.StaticMeshComponent'
    end object
    JobLogProjectionConeComponent=JobLogProjectionConeComp
    // Reference: SkeletalMeshComponent'Default__LPPlayerPawn.WristPDAComp'
    begin object name=WristPDAComp class=Class'Engine.SkeletalMeshComponent'
    end object
    WristPDAComponent=WristPDAComp
    MaxNumEquippablePlayerWeapons=2
    MaxNumNonEquippablePlayerWeapons=1
    ThermalPaddingRegenRate=-1.0000000
    ThermalPaddingRegenDelayModifier=-1.0000000
    HackDistanceBonus=-1.0000000
    HackSpeedMultiplier=-1.0000000
    MineComp_TeamID_PhysMaterialIndex=1
    bPlayImpactEffectsWhenDead=false
    bDelayFiringDuringFullBodyAnims=true
    bDelayFiringDuringUpperBodyAnims=true
    bTrackAimStateNodesThatDelayFiring=true
    // Reference: LPAIResManPlayer'Default__LPPlayerPawn.LPAIResManPlayer'
    begin object name=LPAIResManPlayer
    end object
    AIResourceManager=LPAIResManPlayer
    AdditiveHitReactionAnimInfo=(AnimNodeSlotName="AdditiveHitReactionSlotNode")
    AdditiveHitBlenderName="AdditiveHitBlender"
    // Reference: LPAimControlPlayerControlled'Default__LPPlayerPawn.AimControl'
    begin object name=AimControl
    end object
    AimController=AimControl
    AimYawThreshold=(MinYaw=-8192,MaxYaw=8192)
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPPlayerPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bIsPlayer=true
    bUseRigidBodySync=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPPlayerPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPPlayerPawn.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPPlayerPawn.HeadTrackComponent0'
    begin object name=HeadTrackComponent0 class=Class'LPHeadTrackComponent'
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPDamageOverTimeComponent'Default__LPPlayerPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    RightHandSocketName="ShotgunShellSocket"
    LeftHandSocketName="Grapple"
    HeadSocketName="Breath"
    // Reference: SPSeekFreePackageLoader'Default__LPPlayerPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPPlayerPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bCanCrouch=true
    bCanClimbLadders=true
    bCanWalkOffLedges=true
    bCanMantle=true
    bCanClimbUp=true
    bCanPickupInventory=true
    GroundSpeed=585.0000000
    AccelRate=1100.0000000
    JumpZ=820.0000000
    // Reference: SkeletalMeshComponent'Default__LPPlayerPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPPlayerPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPPlayerPawn.FaceAudioComponent'
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
    Components[8]=FXActionManagerDefObj0
    Components[9]=LPAIResManPlayer
    Components[10]=KnifeComp
    Components[11]=MineComp
    Components[12]=Grenade1Comp
    Components[13]=Grenade2Comp
    Components[14]=Grenade3Comp
    Components[15]=Grenade4Comp
    Components[16]=ZiplineComp
    // Reference: SPDamageStateComponent'Default__LPPlayerPawn.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[17]=DamageStateComponentDefObj
    Components[18]=HeadTrackComponent0
    NetUpdateFrequency=15.0000000
    // Reference: LPActorInteractionMetaData'Default__LPPlayerPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}