class WorldInfo extends ZoneInfo
    nativereplication
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision,Actor,Advanced,Display,Events,Object,Attachment);

const MAX_BOOKMARK_NUMBER = 10;
const MAX_INSTANCES_PER_CLASS = 5;

enum ENetMode
{
    NM_Standalone,                  // 0
    NM_DedicatedServer,             // 1
    NM_ListenServer,                // 2
    NM_Client,                      // 3
    NM_MAX                          // 4
};

enum EConsoleType
{
    CONSOLE_Any,                    // 0
    CONSOLE_Xbox360,                // 1
    CONSOLE_PS3,                    // 2
    CONSOLE_Mobile,                 // 3
    CONSOLE_IPhone,                 // 4
    CONSOLE_Android,                // 5
    CONSOLE_WiiU,                   // 6
    CONSOLE_Flash,                  // 7
    CONSOLE_MAX                     // 8
};

enum EVisibilityAggressiveness
{
    VIS_LeastAggressive,            // 0
    VIS_ModeratelyAggressive,       // 1
    VIS_MostAggressive,             // 2
    VIS_Max                         // 3
};

enum EPreferredLightmapType
{
    EPLT_Default,                   // 0
    EPLT_Directional,               // 1
    EPLT_Simple,                    // 2
    EPLT_MAX                        // 3
};

enum EHostMigrationProgress
{
    HostMigration_None,             // 0
    HostMigration_FindingNewHost,   // 1
    HostMigration_MigratingAsHost,  // 2
    HostMigration_MigratingAsClient,// 3
    HostMigration_ClientTravel,     // 4
    HostMigration_HostReadyToTravel,// 5
    HostMigration_Failed,           // 6
    HostMigration_MAX               // 7
};

struct native NetViewer
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InViewer;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Viewer;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewLocation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewDir;

    structdefaultproperties
    {
        InViewer=none
        Viewer=none
        ViewLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ViewDir=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native CompartmentRunList
{
    var(*) /*0x13C50000-0x00000000*/ private bool RigidBody[65537];
    var(*) /*0x13C50000-0x00000000*/ private bool Fluid[65537];
    var(*) /*0x13C50000-0x00000000*/ private bool Cloth[65537];
    var(*) /*0x13C50000-0x00000000*/ private bool SoftBody[65537];

    structdefaultproperties
    {
        RigidBody=true
        Fluid=true
        Cloth=true
        SoftBody=true
    }
};

struct native PhysXSimulationProperties
{
    var(*) /*0x3C690000-0x00000000*/ private bool bUseHardware[65537];
    var(*) /*0x3C690000-0x00000000*/ private bool bFixedTimeStep[65537];
    var(*) /*0x3C690000-0x00000000*/ private float TimeStep[65537];
    var(*) /*0x3C690000-0x00000000*/ private int MaxSubSteps[65537];

    structdefaultproperties
    {
        bUseHardware=false
        bFixedTimeStep=false
        TimeStep=0.0200000
        MaxSubSteps=5
    }
};

struct native PhysXSceneProperties
{
    var(*) /*0x3C680000-0x00000400*/ private @NULL PrimaryScene[65537];
    var(*) /*0x3C680000-0x00000400*/ private @NULL CompartmentRigidBody[65537];
    var(*) /*0x3C680000-0x00000400*/ private @NULL CompartmentFluid[65537];
    var(*) /*0x3C680000-0x00000400*/ private @NULL CompartmentCloth[65537];
    var(*) /*0x3C680000-0x00000400*/ private @NULL CompartmentSoftBody[65537];

    structdefaultproperties
    {
        PrimaryScene=(bUseHardware=false,bFixedTimeStep=false,TimeStep=0.0200000,MaxSubSteps=5)
        CompartmentRigidBody=(bUseHardware=false,bFixedTimeStep=false,TimeStep=0.0200000,MaxSubSteps=2)
        CompartmentFluid=(bUseHardware=true,bFixedTimeStep=false,TimeStep=0.0200000,MaxSubSteps=1)
        CompartmentCloth=(bUseHardware=true,bFixedTimeStep=true,TimeStep=0.0200000,MaxSubSteps=2)
        CompartmentSoftBody=(bUseHardware=true,bFixedTimeStep=true,TimeStep=0.0200000,MaxSubSteps=2)
    }
};

struct native ApexModuleDestructibleSettings
{
    var(*) /*0x03420000-0x00000000*/ private int MaxChunkIslandCount[65537];
    var(*) /*0x03420000-0x00000000*/ private int MaxShapeCount[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int MaxRrbActorCount;
    var(*) /*0x03420000-0x00000000*/ private float MaxChunkSeparationLOD[65537];
    var(*) /*0x03420000-0x00000000*/ private bool bOverrideMaxChunkSeparationLOD[65537];

    structdefaultproperties
    {
        MaxChunkIslandCount=-1
        MaxShapeCount=-1
        MaxRrbActorCount=-1
        MaxChunkSeparationLOD=1.0000000
        bOverrideMaxChunkSeparationLOD=false
    }
};

struct native PhysXEmitterVerticalProperties
{
    var(*) /*0x3C640000-0x00000000*/ private bool bDisableLod[65537];
    var(*) /*0x3C640000-0x00000000*/ private int ParticlesLodMin[65537];
    var(*) /*0x3C640000-0x00000000*/ private int ParticlesLodMax[65537];
    var(*) /*0x3C640000-0x00000000*/ private int PacketsPerPhysXParticleSystemMax[65537];
    var(*) /*0x3C640000-0x00000000*/ private bool bApplyCylindricalPacketCulling[65537];
    var(*) /*0x3C640000-0x00000000*/ private float SpawnLodVsFifoBias[65537];

    structdefaultproperties
    {
        bDisableLod=true
        ParticlesLodMin=0
        ParticlesLodMax=15000
        PacketsPerPhysXParticleSystemMax=500
        bApplyCylindricalPacketCulling=true
        SpawnLodVsFifoBias=1.0000000
    }
};

struct native PhysXVerticalProperties
{
    var(*) /*0x3C6A0000-0x00000400*/ private @NULL Emitters[65537];

    structdefaultproperties
    {
        Emitters=(bDisableLod=true,ParticlesLodMin=0,ParticlesLodMax=15000,PacketsPerPhysXParticleSystemMax=500,bApplyCylindricalPacketCulling=true,SpawnLodVsFifoBias=1.0000000)
    }
};

struct native WorldFractureSettings
{
    var(*) /*0x35EA0000-0x00000000*/ private float ChanceOfPhysicsChunkOverride;
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnableChanceOfPhysicsChunkOverride;
    var(*) /*0x35EA0000-0x00000000*/ private bool bLimitExplosionChunkSize;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxExplosionChunkSize;
    var(*) /*0x35EA0000-0x00000000*/ private bool bLimitDamageChunkSize;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxDamageChunkSize;
    var(*) /*0x35EA0000-0x00000000*/ private int MaxNumFacturedChunksToSpawnInAFrame;
    var(*) /*0x35EA0000-0x00000000*/ private float FractureExplosionVelScale;

    structdefaultproperties
    {
        ChanceOfPhysicsChunkOverride=0.0000000
        bEnableChanceOfPhysicsChunkOverride=false
        bLimitExplosionChunkSize=false
        MaxExplosionChunkSize=0.0000000
        bLimitDamageChunkSize=false
        MaxDamageChunkSize=0.0000000
        MaxNumFacturedChunksToSpawnInAFrame=0
        FractureExplosionVelScale=0.0000000
    }
};

struct native transient ScreenMessageString
{
    var(*) /*0x35EA0000-0x00000010*/ private @NULL Key[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string ScreenMessage[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private @NULL DisplayColor[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private float TimeToDisplay[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private float CurrentTimeDisplayed[536870913];

    structdefaultproperties
    {
        Key=none
        ScreenMessage=""
        DisplayColor=(R=0,G=0,B=0,A=0)
        TimeToDisplay=0.0000000
        CurrentTimeDisplayed=0.0000000
    }
};

struct native LightmassWorldInfoSettings
{
    var(*) /*0x25EE0000-0x00000000*/ private float StaticLightingLevelScale[65537];
    var(*) /*0x25EE0000-0x00000000*/ private int NumIndirectLightingBounces[65537];
    var(*) /*0x25EE0000-0x00000000*/ private @NULL EnvironmentColor[65537];
    var(*) /*0x25EE0000-0x00000000*/ private float EnvironmentIntensity[65537];
    var(*) /*0x01B40000-0x00000000*/ private bool bEnableAdvancedEnvironmentColor[65537];
    var(*) /*0x01B40000-0x00000000*/ private @NULL EnvironmentSunColor[65537];
    var(*) /*0x01B40000-0x00000000*/ private float EnvironmentSunIntensity[65537];
    var(*) /*0x01B40000-0x00000000*/ private float EnvironmentLightTerminatorAngle[65537];
    var(*) /*0x01B40000-0x00000000*/ private @NULL EnvironmentLightDirection[65537];
    var(*) /*0x25EE0000-0x00000000*/ private float EmissiveBoost[65537];
    var(*) /*0x25EE0000-0x00000000*/ private float DiffuseBoost[65537];
    var(*) /*0x35EA0000-0x00000000*/ private float SpecularBoost;
    var(*) /*0x25EE0000-0x00000000*/ private float IndirectNormalInfluenceBoost[65537];
    var(*) /*0x37140000-0x00000000*/ private bool bUseAmbientOcclusion[65537];
    var(*) /*0x37140000-0x00000000*/ private bool bEnableImageReflectionShadowing[65537];
    var(*) /*0x37140000-0x00000000*/ private float DirectIlluminationOcclusionFraction[65537];
    var(*) /*0x37140000-0x00000000*/ private float IndirectIlluminationOcclusionFraction[65537];
    var(*) /*0x37140000-0x00000000*/ private float OcclusionExponent[65537];
    var(*) /*0x37140000-0x00000000*/ private float FullyOccludedSamplesFraction[65537];
    var(*) /*0x37140000-0x00000000*/ private float MaxOcclusionDistance[65537];
    var(*) /*0x16220000-0x00000000*/ private bool bVisualizeMaterialDiffuse[65537];
    var(*) /*0x16220000-0x00000000*/ private bool bVisualizeAmbientOcclusion[65537];
    var(*) /*0x25EE0000-0x00000000*/ private bool bCompressShadowmap[65537];

    structdefaultproperties
    {
        StaticLightingLevelScale=1.0000000
        NumIndirectLightingBounces=3
        EnvironmentColor=(R=0,G=0,B=0,A=0)
        EnvironmentIntensity=1.0000000
        bEnableAdvancedEnvironmentColor=false
        EnvironmentSunColor=(R=0,G=0,B=0,A=0)
        EnvironmentSunIntensity=1.0000000
        EnvironmentLightTerminatorAngle=90.0000000
        EnvironmentLightDirection=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        EmissiveBoost=1.0000000
        DiffuseBoost=5.0000000
        SpecularBoost=1.0000000
        IndirectNormalInfluenceBoost=0.3000000
        bUseAmbientOcclusion=false
        bEnableImageReflectionShadowing=false
        DirectIlluminationOcclusionFraction=0.5000000
        IndirectIlluminationOcclusionFraction=1.0000000
        OcclusionExponent=1.0000000
        FullyOccludedSamplesFraction=1.0000000
        MaxOcclusionDistance=200.0000000
        bVisualizeMaterialDiffuse=false
        bVisualizeAmbientOcclusion=false
        bCompressShadowmap=false
    }
};

struct native NavMeshPathConstraintCacheDatum
{
    var(*) /*0x35EA0000-0x00000000*/ private int ListIdx;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL List[5];

    structdefaultproperties
    {
        ListIdx=0
        List[0]=none
        List[1]=none
        List[2]=none
        List[3]=none
        List[4]=none
    }
};

struct native NavMeshPathGoalEvaluatorCacheDatum
{
    var(*) /*0x35EA0000-0x00000000*/ private int ListIdx;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL List[5];

    structdefaultproperties
    {
        ListIdx=0
        List[0]=none
        List[1]=none
        List[2]=none
        List[3]=none
        List[4]=none
    }
};

struct native HostMigrationState
{
    var(*) /*0x35EA0000-0x00000000*/ private byte HostMigrationProgress;
    var(*) /*0x35EA0000-0x00000000*/ private float HostMigrationElapsedTime;
    var(*) /*0x35EA0000-0x00000000*/ private float HostMigrationTravelCountdown;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string HostMigrationTravelURL;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHostMigrationEnabled;

    structdefaultproperties
    {
        HostMigrationProgress=EHostMigrationProgress.HostMigration_None
        HostMigrationElapsedTime=0.0000000
        HostMigrationTravelCountdown=0.0000000
        HostMigrationTravelURL=""
        bHostMigrationEnabled=false
    }
};

var(*) /*0x41420000-0x00000000*/ private editfixedsize @NULL DefaultPostProcessSettings[1073807361];
var(*) /*0x41420000-0x00000000*/ private @NULL WorldPostProcessChain[65537];
var(*) /*0x41420000-0x00000000*/ private bool bPersistPostProcessToNextLevel[1073807361];
var(*) /*0x32E40000-0x00000000*/ private bool bFogEnabled[65537];
var(*) /*0x32E40000-0x00000000*/ private bool bBumpOffsetEnabled[65537];
var(*) /*0x32E40000-0x00000000*/ private bool bUseGammaCorrection[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bMapNeedsLightingFullyRebuilt;
var(*) /*0x35EA0000-0x00000000*/ private bool bMapHasMultipleDominantLightsAffectingOnePrimitive;
var(*) /*0x35EA0000-0x00000000*/ private bool bMapHasPathingErrors;
var(*) /*0x35EA0000-0x00000000*/ private bool bRequestedBlockOnAsyncLoading;
var(*) /*0x35EA0000-0x00000000*/ private bool bAdvanceAudioTimeDuringPause[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bBegunPlay;
var(*) /*0x35EA0000-0x00000000*/ private bool bPlayersOnly;
var(*) /*0x35EA0000-0x00000000*/ private bool bPlayersOnlyPending;
var(*) /*0x35EA0000-0x00000000*/ private bool bSuspendAI;
var(*) /*0x35EA0000-0x00000000*/ private bool bDropDetail[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bAggressiveLOD[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bStartup;
var(*) /*0x35EA0000-0x00000000*/ private bool bPathsRebuilt;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasPathNodes;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsMenuLevel[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bDebugPauseExecution[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bDebugStepExecution[537001985];
var(*) /*0x50F70000-0x00000000*/ private bool bShouldPersistWhenUnloaded[65537];
var(*) /*0x50F70000-0x00000000*/ private bool bNoMaxDeltaTime[65537];
var(*) /*0x304B0000-0x00000000*/ private bool bDoNotStopMovieAfterLoad[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseConsoleInput[536870913];
var(*) /*0x41420000-0x00000000*/ private bool bMinimizeBSPSections[65537];
var(*) /*0x50F70000-0x00000000*/ private bool bNoDefaultInventoryForPlayer[65537];
var(*) /*0x50F70000-0x00000000*/ private bool bNoPathWarnings[65537];
var(*) /*0x50F70000-0x00000000*/ private bool bNoMobileMapWarnings[1073807361];
var(*) /*0x35EA0000-0x00000000*/ private bool bHighPriorityLoading[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bHighPriorityLoadingLocal;
var(*) /*0x3E7D0000-0x00000000*/ private bool bUseProcBuildingRulesetOverride[65537];
var(*) /*0x3C510000-0x00000000*/ private bool bSupportDoubleBufferedPhysics[65537];
var(*) /*0x3C500000-0x00000000*/ private bool bPhysicsIgnoreDeltaTime[65537];
var(*) /*0x246A0000-0x00000000*/ private bool bEnableChanceOfPhysicsChunkOverride[1073807361];
var(*) /*0x246A0000-0x00000000*/ private bool bLimitExplosionChunkSize[1073807361];
var(*) /*0x246A0000-0x00000000*/ private bool bLimitDamageChunkSize[1073807361];
var(*) /*0x3DFB0000-0x00000000*/ private bool bPrecomputeVisibility[65537];
var(*) /*0x3DFB0000-0x00000000*/ private bool bPlaceCellsOnSurfaces[65537];
var(*) /*0x41420000-0x00000000*/ private input bool bAllowTemporalAA[1073807361];
var(*) /*0x2ECC0000-0x00000000*/ private bool bUseGlobalIllumination[65537];
var(*) /*0x2ECC0000-0x00000000*/ private bool bForceNoPrecomputedLighting[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bHaveActiveCrowd;
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowHostMigration[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bGameplayFramePause;
var(*) /*0x41420000-0x00000000*/ private float SquintModeKernelSize[1073807361];
var(*) /*0x35EA0000-0x00000100*/ private @NULL HighestPriorityPostProcessVolume[537001985];
var(*) /*0x35EA0000-0x00000100*/ private @NULL OverridePostProcessVolume[537001985];
var(*) /*0x03C50000-0x00000000*/ private @NULL DefaultReverbSettings[1073807361];
var(*) /*0x03C50000-0x00000000*/ private @NULL DefaultAmbientZoneSettings[1073807361];
var(*) /*0x32E40000-0x00000000*/ private float FogStart[65537];
var(*) /*0x32E40000-0x00000000*/ private float FogEnd[65537];
var(*) /*0x32E40000-0x00000000*/ private @NULL FogColor[65537];
var(*) /*0x32E40000-0x00000000*/ private float BumpEnd[65537];
var(*) /*0x35EA0000-0x00000100*/ private @NULL HighestPriorityReverbVolume[537001985];
var(*) /*0x35EA0000-0x00000100*/ private editfixedsize array MassiveLODOverrideVolumes[537001985];
var(*) /*0x35EA0000-0x00000100*/ private editfixedsize array PortalVolumes[537001985];
var(*) /*0x35EA0000-0x00000100*/ private editfixedsize array EnvironmentVolumes[537001985];
var(*) /*0x50F70000-0x00000400*/ private const editfixedsize array StreamingLevels[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastTimeUnbuiltLightingWasEncountered[536870913];
var(*) /*0x1F1E0000-0x00000000*/ private @NULL BookMarks[65546];
var(*) /*0x1F1E0000-0x00000000*/ private @NULL KismetBookMarks[65546];
var(*) /*0x1F1E0000-0x00000400*/ private editfixedsize array ClipPadEntries[65537];
var(*) /*0x35EA0000-0x00000000*/ private float TimeDilation[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float DemoPlayTimeDilation;
var(*) /*0x35EA0000-0x00000000*/ private float TimeSeconds[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float RealTimeSeconds[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float AudioTimeSeconds[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float StoredAudioTimeSeconds[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float DeltaSeconds[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float PauseDelay[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float RealTimeToUnPause[536870913];
var(*) /*0x35EA0000-0x00000000*/ private PlayerReplicationInfo Pauser[2097153];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient string VisibleGroups;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string VisibleLayers;
var(*) /*0x304B0000-0x00000000*/ private int NumFramesInitialRenderDelay[65537];
var(*) /*0x35EA0000-0x00000000*/ private int CurrNumFramesInitialRenderDelay[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultTexture;
var(*) /*0x35EA0000-0x00000000*/ private @NULL WireframeTexture;
var(*) /*0x35EA0000-0x00000000*/ private @NULL WhiteSquareTexture;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LargeVertex;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BSPVertex;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DeferredExecs;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GRI[537001985];
var(*) /*0x35EA0000-0x00000000*/ private byte NetMode;
var(*) /*0x35EA0000-0x00000000*/ private byte NextTravelType;
var(*) /*0x3DFB0000-0x00000000*/ private byte VisibilityAggressiveness[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte PreferredLightmapType;
var(*) /*0x2ECC0000-0x00000000*/ private const byte LevelLightingQuality[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ComputerName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string EngineVersion;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MinNetVersion;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Game;
var(*) /*0x515B0000-0x00000000*/ private float StallZ[65537];
var(*) /*0x35EA0000-0x00000000*/ private float WorldGravityZ[538968065];
var(*) /*0x35EA0000-0x00000000*/ private input float DefaultGravityZ[1073872897];
var(*) /*0x515B0000-0x00000000*/ private float GlobalGravityZ[65537];
var(*) /*0x35EA0000-0x00000000*/ private input float RBPhysicsGravityScaling[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NavigationPointList[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ControllerList[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PawnList[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CoverList[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PylonList[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float MoveRepSize;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ReplicationViewers[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NextURL;
var(*) /*0x35EA0000-0x00000000*/ private float NextSwitchCountdown;
var(*) /*0x41420000-0x00000000*/ private int PackedLightAndShadowMapTextureSize[65537];
var(*) /*0x41420000-0x00000000*/ private @NULL DefaultColorScale[65537];
var(*) /*0x25870000-0x00000000*/ private class DefaultGameType[65537];
var(*) /*0x25870000-0x00000000*/ private editfixedsize array GameTypesSupportedOnThisMap[65537];
var(*) /*0x25870000-0x00000000*/ private class GameTypeForPIE[65537];
var(*) /*0x35EA0000-0x00000000*/ private const editfixedsize array ClientDestroyedActorContent[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PreparingLevelNames[537001985];
var(*) /*0x35EA0000-0x00000000*/ private name CommittedPersistentLevelName[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PersistentMapForcedObjects;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL MusicComp[537395201];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CurrentMusicTrack[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize travel MusicTrackStruct ReplicatedMusicTrack[538968065];
var(*) /*0x50F70000-0x00000000*/ private editfixedsize string Title;
var(*) /*0x50F70000-0x00000000*/ private editfixedsize string Author[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string MapInfoClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string EntryLevelMapName[1073741825];
var(*) /*0x50F70000-0x00000400*/ private editfixedsize @NULL MyMapInfo[589825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string EmitterPoolClassPath[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyEmitterPool[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DecalManagerClassPath[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyDecalManager[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string FractureManagerClassPath[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyFractureManager[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ParticleEventManagerClassPath[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyParticleEventManager[536870913];
var(*) /*0x3E7D0000-0x00000000*/ private @NULL ProcBuildingRulesetOverride[65537];
var(*) /*0x3C510000-0x00000000*/ private float MaxPhysicsDeltaTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private int MaxPhysicsSubsteps[1073741825];
var(*) /*0x3C510000-0x00000400*/ private @NULL PhysicsProperties[65537];
var(*) /*0x3C510000-0x00000000*/ private editfixedsize array CompartmentRunFrames[65537];
var(*) /*0x3C510000-0x00000000*/ private float DefaultSkinWidth[65537];
var(*) /*0x3C510000-0x00000000*/ private float ApexLODResourceBudget[65537];
var(*) /*0x3C510000-0x00000000*/ private float ApexDestructionLODResourceValue[65537];
var(*) /*0x3C510000-0x00000000*/ private float ApexClothingLODResourceValue[65537];
var(*) /*0x3C510000-0x00000000*/ private @NULL DestructibleSettings[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL EmitterVertical;
var(*) /*0x3C510000-0x00000400*/ private @NULL VerticalProperties[65537];
var(*) /*0x35EA0000-0x00000000*/ private array WorldAttractors[268435457];
var(*) /*0x246A0000-0x00000000*/ private float ChanceOfPhysicsChunkOverride[1073807361];
var(*) /*0x246A0000-0x00000000*/ private float MaxExplosionChunkSize[1073807361];
var(*) /*0x246A0000-0x00000000*/ private float MaxDamageChunkSize[1073807361];
var(*) /*0x246A0000-0x00000000*/ private float FractureExplosionVelScale[1073807361];
var(*) /*0x246A0000-0x00000000*/ private int MaxNumFacturedChunksToSpawnInAFrame[65537];
var(*) /*0x35EA0000-0x00000000*/ private int NumFacturedChunksSpawnedThisFrame[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float FracturedMeshWeaponDamage[1073741825];
var(*) /*0x3DFB0000-0x00000000*/ private int VisibilityCellSize[65537];
var(*) /*0x2EA90000-0x00000000*/ private float CharacterLitIndirectBrightness[65537];
var(*) /*0x2EA90000-0x00000000*/ private float CharacterLitIndirectContrastFactor[65537];
var(*) /*0x2EA90000-0x00000000*/ private float CharacterShadowedIndirectBrightness[65537];
var(*) /*0x2EA90000-0x00000000*/ private float CharacterShadowedIndirectContrastFactor[65537];
var(*) /*0x2EA90000-0x00000000*/ private float CharacterLightingContrastFactor[65537];
var(*) /*0x41420000-0x00000000*/ private @NULL ImageReflectionEnvironmentTexture[65537];
var(*) /*0x41420000-0x00000000*/ private @NULL ImageReflectionEnvironmentColor[65537];
var(*) /*0x41420000-0x00000000*/ private float ImageReflectionEnvironmentRotation[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScreenMessages[805306369];
var(*) /*0x35EA0000-0x00000000*/ private array PriorityScreenMessages[805306369];
var(*) /*0x35EA0000-0x00000000*/ private int MaxTrianglesPerLeaf;
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize transient @NULL LMLevelSettings[524289];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} LandscapeInfoMap[805306369];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} NavMeshPathConstraintCache[268435457];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} NavMeshPathGoalEvaluatorCache[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PopulationManager;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL PeerHostMigration[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float HostMigrationTimeout[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FirstPhysicsVolume[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string KynapseDefaultWorldPath[1073741825];
var(*) /*0x2D730000-0x00000000*/ private @NULL KynapseWorldObject[65537];
var(*) /*0x2D730000-0x00000400*/ private editfixedsize array KynapseLevelSpecificParams[65537];
var(*) /*0x2D730000-0x00000400*/ private editfixedsize array FlyGraphLevelSpecificParams[65537];

// Export UWorldInfo::execReleaseCachedConstraintsAndEvaluators(FFrame&, void* const)
native function ReleaseCachedConstraintsAndEvaluators();

// Export UWorldInfo::execGetNavMeshPathConstraintFromCache(FFrame&, void* const)
native function GetNavMeshPathConstraintFromCache()
{
    local /*0x35EA0000-0x00000000*/ private class ConstraintClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Requestor[8388609], ReturnValue;


}

// Export UWorldInfo::execGetNavMeshPathGoalEvaluatorFromCache(FFrame&, void* const)
native function GetNavMeshPathGoalEvaluatorFromCache()
{
    local /*0x35EA0000-0x00000000*/ private class GoalEvalClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Requestor[8388609], ReturnValue;


}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x2A
    if(VarName == 'ReplicatedMusicTrack')
    {
        UpdateMusicTrack(ReplicatedMusicTrack);
    }
    super(Actor).ReplicatedEvent(VarName);
    //return;    
}

// Export UWorldInfo::execAddOnScreenDebugMessage(FFrame&, void* const)
native final function AddOnScreenDebugMessage()
{
    local /*0x35EA0000-0x00000000*/ private int Key[8388609];
    local /*0x35EA0000-0x00000000*/ private float TimeToDisplay[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DisplayColor[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DebugMessage[8388609];


}

// Export UWorldInfo::execIsMenuLevel(FFrame&, void* const)
native static final function IsMenuLevel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MapName[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execUpdateMusicTrack(FFrame&, void* const)
native final function UpdateMusicTrack()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL NewMusicTrack[8388609];


}

// Export UWorldInfo::execGetGravityZ(FFrame&, void* const)
native function GetGravityZ()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UWorldInfo::execGetGameSequence(FFrame&, void* const)
native final simulated function GetGameSequence()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UWorldInfo::execGetAllRootSequences(FFrame&, void* const)
native final simulated function GetAllRootSequences()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ReturnValue[92274689];


}

// Export UWorldInfo::execSetLevelRBGravity(FFrame&, void* const)
native final function SetLevelRBGravity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewGrav[8388609];


}

// Export UWorldInfo::execGetLocalURL(FFrame&, void* const)
native simulated function GetLocalURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UWorldInfo::execIsDemoBuild(FFrame&, void* const)
native static final simulated function IsDemoBuild()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execIsConsoleBuild(FFrame&, void* const)
native static final simulated function IsConsoleBuild()
{
    local /*0x35EA0000-0x00000000*/ private byte ConsoleType[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    0            
}

// Export UWorldInfo::execIsWithGFx(FFrame&, void* const)
native static final simulated function IsWithGFx()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execIsPlayInEditor(FFrame&, void* const)
native static final simulated function IsPlayInEditor()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execIsPlayInPreview(FFrame&, void* const)
native static final simulated function IsPlayInPreview()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execIsPlayInMobilePreview(FFrame&, void* const)
native static final simulated function IsPlayInMobilePreview()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execForceGarbageCollection(FFrame&, void* const)
native final simulated function ForceGarbageCollection()
{
    local /*0x35EA0000-0x00000000*/ private bool bFullPurge[9437185];


}

// Export UWorldInfo::execVerifyNavList(FFrame&, void* const)
native final simulated function VerifyNavList();

// Export UWorldInfo::execGetAddressURL(FFrame&, void* const)
native simulated function GetAddressURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UWorldInfo::execSetGRI(FFrame&, void* const)
native simulated function SetGRI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InGRI[8388609];


}

// Export UWorldInfo::execStoreAudioTimerDuringPause(FFrame&, void* const)
native simulated function StoreAudioTimerDuringPause();

// Export UWorldInfo::execRestoreAudioTimerDuringPause(FFrame&, void* const)
native simulated function RestoreAudioTimerDuringPause();

simulated function GetGameClass()
{
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x58
    if(WorldInfo.Game != none)
    {
        return WorldInfo.Game.Class;
    }
    // End:0xAC
    if((GRI != none) && GRI.GameClass != none)
    {
        return GRI.GameClass;
    }
    return none;
    //return ReturnValue;    
}

simulated event ServerTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAbsolute[9437185], bShouldSkipGameNotify;

    // End:0x1B
    if(InStr(URL, "%") >= 0)
    {
        return;
    }
    // End:0x66
    if(((InStr(URL, ":") >= 0) || InStr(URL, "/") >= 0) || InStr(URL, "\\") >= 0)
    {
        return;
    }
    // End:0x9B
    if((Game != none) && Game.bHasNetworkError)
    {
        return;
    }
    NextTravelType = ((bAbsolute) ? 0 : 2);
    // End:0x15D
    if((NextURL == "") && !IsInSeamlessTravel() || bShouldSkipGameNotify)
    {
        NextURL = URL;
        // End:0x14E
        if(Game != none)
        {
            // End:0x14B
            if(!bShouldSkipGameNotify)
            {
                Game.ProcessServerTravel(URL, bAbsolute);
            }            
        }
        else
        {
            NextSwitchCountdown = 0.0000000;
        }
    }
    //return;    
}

function ThisIsNeverExecuted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    P = none;
    //return;    
}

simulated function PreBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private class PoolClass, DecalManagerClass, FractureManagerClass, ParticleEventManagerClass;

    super(Actor).PreBeginPlay();
    // End:0x26F
    if((int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && IsInPersistentLevel())
    {
        // End:0xCE
        if(EmitterPoolClassPath != "")
        {
            PoolClass = class<EmitterPool>(DynamicLoadObject(EmitterPoolClassPath, Class'Core.Class'));
            // End:0xCE
            if(PoolClass != none)
            {
                MyEmitterPool = Spawn(PoolClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
            }
        }
        // End:0x159
        if(DecalManagerClassPath != "")
        {
            DecalManagerClass = class<DecalManager>(DynamicLoadObject(DecalManagerClassPath, Class'Core.Class'));
            // End:0x159
            if(DecalManagerClass != none)
            {
                MyDecalManager = Spawn(DecalManagerClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
            }
        }
        // End:0x1E4
        if(FractureManagerClassPath != "")
        {
            FractureManagerClass = class<FractureManager>(DynamicLoadObject(FractureManagerClassPath, Class'Core.Class'));
            // End:0x1E4
            if(FractureManagerClass != none)
            {
                MyFractureManager = Spawn(FractureManagerClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
            }
        }
        // End:0x26F
        if(ParticleEventManagerClassPath != "")
        {
            ParticleEventManagerClass = class<ParticleEventManager>(DynamicLoadObject(ParticleEventManagerClassPath, Class'Core.Class'));
            // End:0x26F
            if(ParticleEventManagerClass != none)
            {
                MyParticleEventManager = Spawn(ParticleEventManagerClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
            }
        }
    }
    // End:0x2AD
    if((MyMapInfo != none) && IsInPersistentLevel(true))
    {
        MyMapInfo.PreBeginPlay();
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x24
    if(IsConsoleBuild())
    {
        bUseConsoleInput = true;
    }
    // End:0x62
    if((MyMapInfo != none) && IsInPersistentLevel(true))
    {
        MyMapInfo.PostBeginPlay();
    }
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    //return;    
}

// Export UWorldInfo::execAllNavigationPoints(FFrame&, void* const)
native final iterator function AllNavigationPoints()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL N[25165825];


}

// Export UWorldInfo::execRadiusNavigationPoints(FFrame&, void* const)
native final iterator function RadiusNavigationPoints()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL N[25165825], Point;
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];


}

// Export UWorldInfo::execNavigationPointCheck(FFrame&, void* const)
native final function NavigationPointCheck()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Point[8388609], Extent;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Navs[26214401], Specs;


}

// Export UWorldInfo::execAllControllers(FFrame&, void* const)
native final iterator function AllControllers()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C[25165825];


}

// Export UWorldInfo::execAllPawns(FFrame&, void* const)
native final iterator function AllPawns()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P[25165825], TestLocation;
    local /*0x35EA0000-0x00000000*/ private float TestRadius[9437185];


}

// Export UWorldInfo::execAllClientConnections(FFrame&, void* const)
native final iterator function AllClientConnections()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[25165825];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[25165825], ClientPort;


}

// Export UWorldInfo::execNotifyMatchStarted(FFrame&, void* const)
native final function NotifyMatchStarted()
{
    local /*0x35EA0000-0x00000000*/ private bool bShouldActivateLevelStartupEvents[9437185], bShouldActivateLevelBeginningEvents, bShouldActivateLevelLoadedEvents;

    true
    true
    false                    
}

// Export UWorldInfo::execPrepareMapChange(FFrame&, void* const)
native final function PrepareMapChange()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array LevelNames[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bSkipProcessingAlreadyLoadedLevels[9437185];

    false                
}

// Export UWorldInfo::execIsPreparingMapChange(FFrame&, void* const)
native final function IsPreparingMapChange()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execIsMapChangeReady(FFrame&, void* const)
native final function IsMapChangeReady()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execCancelPendingMapChange(FFrame&, void* const)
native final function CancelPendingMapChange()
{
    local /*0x35EA0000-0x00000000*/ private bool bUnloadExistingStreamLevels[9437185];

    false            
}

// Export UWorldInfo::execCommitMapChange(FFrame&, void* const)
native final function CommitMapChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185];


}

// Export UWorldInfo::execSeamlessTravel(FFrame&, void* const)
native final function SeamlessTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAbsolute[9437185];
    local /*0x35EA0000-0x00000010*/ private @NULL MapPackageGuid[9437185];


}

// Export UWorldInfo::execIsInSeamlessTravel(FFrame&, void* const)
native final function IsInSeamlessTravel()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execSetSeamlessTravelMidpointPause(FFrame&, void* const)
native final function SetSeamlessTravelMidpointPause()
{
    local /*0x35EA0000-0x00000000*/ private bool bNowPaused[8388609];


}

// Export UWorldInfo::execGetMapInfo(FFrame&, void* const)
native final function GetMapInfo()
{
    local /*0x35EA0000-0x00000000*/ private bool bCheckStreamingPersistent[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    true            
}

// Export UWorldInfo::execSetMapInfo(FFrame&, void* const)
native final function SetMapInfo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMapInfo[8388609];


}

// Export UWorldInfo::execGetMapName(FFrame&, void* const)
native final function GetMapName()
{
    local /*0x35EA0000-0x00000000*/ private bool bIncludePrefix[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UWorldInfo::execGetDetailMode(FFrame&, void* const)
native final function GetDetailMode()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UWorldInfo::execIsRecordingDemo(FFrame&, void* const)
native final function IsRecordingDemo()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execIsPlayingDemo(FFrame&, void* const)
native final function IsPlayingDemo()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execGetDemoFrameInfo(FFrame&, void* const)
native final function GetDemoFrameInfo()
{
    local /*0x35EA0000-0x00000000*/ private int CurrentFrame[26214401], TotalFrames;


}

// Export UWorldInfo::execGetDemoRewindPoints(FFrame&, void* const)
native final function GetDemoRewindPoints()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutRewindPoints[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UWorldInfo::execDoMemoryTracking(FFrame&, void* const)
native final function DoMemoryTracking();

// Export UWorldInfo::execGetWorldFractureSettings(FFrame&, void* const)
native final function GetWorldFractureSettings()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UWorldInfo::execGetWorldInfo(FFrame&, void* const)
native static final function GetWorldInfo()
{
    local /*0x35EA0000-0x00000000*/ private bool bCheckStreamingPersistent[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    false            
}

// Export UWorldInfo::execFindEnvironmentVolume(FFrame&, void* const)
native final function FindEnvironmentVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestLocation[8388609], ReturnValue;


}

simulated event CanBeginHostMigration()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x90
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        // End:0x8F
        if(PC.IsPrimaryPlayer())
        {
            // End:0x8F
            if(!PC.CanAllPlayersPlayOnline() || PC.BestNextHostPeers.Length == 0)
            {                
                return false;
            }
        }        
    }    
    return true;
    //return ReturnValue;    
}

// Export UWorldInfo::execBeginHostMigration(FFrame&, void* const)
native function BeginHostMigration()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event NotifyHostMigrationStateChanged()
{
    local /*0x35EA0000-0x00000000*/ private byte NewState[8388609], OldState;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x8F
    if((int(OldState) == int(0)) && int(NewState) != int(0))
    {
        // End:0x8E
        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            // End:0x8D
            if(PC.IsPrimaryPlayer())
            {
                PC.NotifyHostMigrationStarted();
                // End:0x8E
                break;
            }            
        }        
    }
    //return;    
}

// Export UWorldInfo::execToggleHostMigration(FFrame&, void* const)
native function ToggleHostMigration()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnabled[8388609];


}

// Export UWorldInfo::execClearObjectPools(FFrame&, void* const)
native final function ClearObjectPools();

defaultproperties
{
    DefaultPostProcessSettings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000)
    bPersistPostProcessToNextLevel=true
    bBumpOffsetEnabled=true
    bNoMobileMapWarnings=true
    bLimitExplosionChunkSize=true
    bLimitDamageChunkSize=true
    bPlaceCellsOnSurfaces=true
    bAllowTemporalAA=true
    SquintModeKernelSize=128.0000000
    DefaultReverbSettings=(bApplyReverb=true,ReverbType=ReverbPreset.REVERB_Default,Volume=0.5000000,FadeTime=2.0000000)
    DefaultAmbientZoneSettings=(bIsWorldInfo=true,ExteriorVolume=1.0000000,ExteriorTime=0.5000000,ExteriorLPF=1.0000000,ExteriorLPFTime=0.5000000,InteriorVolume=1.0000000,InteriorTime=0.5000000,InteriorLPF=1.0000000,InteriorLPFTime=0.5000000)
    FogStart=400.0000000
    FogEnd=4000.0000000
    FogColor=(R=128,G=128,B=255,A=192)
    BumpEnd=1000.0000000
    TimeDilation=1.0000000
    DemoPlayTimeDilation=1.0000000
    NumFramesInitialRenderDelay=5
    DefaultTexture=Texture2D'EngineResources.DefaultTexture'
    WhiteSquareTexture=Texture2D'EngineResources.WhiteSquareTexture'
    NextTravelType=ETravelType.TRAVEL_Relative
    LevelLightingQuality=ELightingBuildQuality.None
    StallZ=1000000.0000000
    DefaultGravityZ=-1400.0000000
    RBPhysicsGravityScaling=2.5000000
    MoveRepSize=42.0000000
    PackedLightAndShadowMapTextureSize=1024
    DefaultColorScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    CurrentMusicTrack=(TheSoundCue=none,bAutoPlay=false,bPersistentAcrossLevels=false,FadeInTime=5.0000000,FadeInVolumeLevel=1.0000000,FadeOutTime=5.0000000,FadeOutVolumeLevel=0.0000000,MP3Filename="")
    ReplicatedMusicTrack=(TheSoundCue=none,bAutoPlay=false,bPersistentAcrossLevels=false,FadeInTime=5.0000000,FadeInVolumeLevel=1.0000000,FadeOutTime=5.0000000,FadeOutVolumeLevel=0.0000000,MP3Filename="")
    MapInfoClassName="LostPlanetGame.LPMapInfo"
    EntryLevelMapName="LostPlanetGame_M"
    EmitterPoolClassPath="LostPlanetGame.LPEmitterPool"
    DecalManagerClassPath="LostPlanetGame.LPDecalManager"
    FractureManagerClassPath="LostPlanetGame.LPFractureManager"
    MaxPhysicsDeltaTime=0.3333333
    MaxPhysicsSubsteps=2
    PhysicsProperties=(PrimaryScene=(bUseHardware=false,bFixedTimeStep=false,TimeStep=0.0200000,MaxSubSteps=5),CompartmentRigidBody=(bUseHardware=false,bFixedTimeStep=false,TimeStep=0.0200000,MaxSubSteps=2),CompartmentFluid=(bUseHardware=true,bFixedTimeStep=false,TimeStep=0.0200000,MaxSubSteps=1),CompartmentCloth=(bUseHardware=true,bFixedTimeStep=true,TimeStep=0.0200000,MaxSubSteps=2),CompartmentSoftBody=(bUseHardware=true,bFixedTimeStep=true,TimeStep=0.0200000,MaxSubSteps=2))
    DefaultSkinWidth=0.0250000
    ApexLODResourceBudget=-1.0000000
    ApexDestructionLODResourceValue=1000.0000000
    ApexClothingLODResourceValue=1000.0000000
    DestructibleSettings=(MaxChunkIslandCount=-1,MaxShapeCount=-1,MaxRrbActorCount=-1,MaxChunkSeparationLOD=1.0000000,bOverrideMaxChunkSeparationLOD=false)
    // Reference: PhysicsLODVerticalEmitter'Default__WorldInfo.PhysicsLODVerticalEmitter0'
    begin object name=PhysicsLODVerticalEmitter0 class=Class'PhysicsLODVerticalEmitter'
    end object
    EmitterVertical=PhysicsLODVerticalEmitter0
    VerticalProperties=(Emitters=(bDisableLod=true,ParticlesLodMin=0,ParticlesLodMax=15000,PacketsPerPhysXParticleSystemMax=500,bApplyCylindricalPacketCulling=true,SpawnLodVsFifoBias=1.0000000))
    ChanceOfPhysicsChunkOverride=1.0000000
    MaxExplosionChunkSize=30.0000000
    MaxDamageChunkSize=25.0000000
    FractureExplosionVelScale=10.0000000
    MaxNumFacturedChunksToSpawnInAFrame=6
    FracturedMeshWeaponDamage=5.0000000
    VisibilityCellSize=200
    CharacterLitIndirectBrightness=1.0000000
    CharacterLitIndirectContrastFactor=1.0000000
    CharacterShadowedIndirectBrightness=1.0000000
    CharacterShadowedIndirectContrastFactor=1.0000000
    CharacterLightingContrastFactor=1.5000000
    ImageReflectionEnvironmentColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
    LightmassSettings=(StaticLightingLevelScale=1.0000000,NumIndirectLightingBounces=3,EnvironmentColor=(R=0,G=0,B=0,A=0),EnvironmentIntensity=1.0000000,bEnableAdvancedEnvironmentColor=false,EnvironmentSunColor=(R=0,G=0,B=0,A=0),EnvironmentSunIntensity=1.0000000,EnvironmentLightTerminatorAngle=90.0000000,EnvironmentLightDirection=(X=0.0000000,Y=0.0000000,Z=0.0000000),EmissiveBoost=1.0000000,DiffuseBoost=5.0000000,SpecularBoost=1.0000000,IndirectNormalInfluenceBoost=0.3000000,bUseAmbientOcclusion=false,bEnableImageReflectionShadowing=false,DirectIlluminationOcclusionFraction=0.5000000,IndirectIlluminationOcclusionFraction=1.0000000,OcclusionExponent=1.0000000,FullyOccludedSamplesFraction=1.0000000,MaxOcclusionDistance=200.0000000,bVisualizeMaterialDiffuse=false,bVisualizeAmbientOcclusion=false,bCompressShadowmap=false)
    HostMigrationTimeout=45.0000000
    KynapseDefaultWorldPath="LPEngineKynapse.LPMainKynapseWorld"
    Components=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bWorldGeometry=true
    bAlwaysRelevant=true
    bMovable=false
    bBlockActors=true
    bHiddenEd=true
}