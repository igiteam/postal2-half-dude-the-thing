class ParticleSystem extends Object
    hidecategories(Object);

enum EParticleSystemUpdateMode
{
    EPSUM_RealTime,                 // 0
    EPSUM_FixedTime,                // 1
    EPSUM_MAX                       // 2
};

enum ParticleSystemLODMethod
{
    PARTICLESYSTEMLODMETHOD_Automatic,// 0
    PARTICLESYSTEMLODMETHOD_DirectSet,// 1
    PARTICLESYSTEMLODMETHOD_ActivateAutomatic,// 2
    PARTICLESYSTEMLODMETHOD_MAX     // 3
};

enum EParticleSystemOcclusionBoundsMethod
{
    EPSOBM_None,                    // 0
    EPSOBM_ParticleBounds,          // 1
    EPSOBM_CustomBounds,            // 2
    EPSOBM_MAX                      // 3
};

struct native ParticleSystemLOD
{
    var(*) /*0x3AEE0000-0x00000000*/ private bool bLit[65537];

    structdefaultproperties
    {
        bLit=false
    }
};

struct native LODSoloTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoloEnableSetting[536870913];

    structdefaultproperties
    {
        SoloEnableSetting=none
    }
};

var(*) /*0x3AEB0000-0x00000000*/ private byte SystemUpdateMode[65537];
var(*) /*0x2F830000-0x00000000*/ private byte LODMethod[65537];
var(*) /*0x37140000-0x00000000*/ private byte OcclusionBoundsMethod[65537];
var(*) /*0x3AEB0000-0x00000000*/ private float UpdateTime_FPS[65537];
var(*) /*0x35EA0000-0x00000000*/ private float UpdateTime_Delta;
var(*) /*0x3AEB0000-0x00000000*/ private float WarmupTime[65537];
var(*) /*0x3AEB0000-0x00000000*/ private float WarmupTickRate[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array Emitters[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewComponent[537395201];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailAngle;
var(*) /*0x35EA0000-0x00000000*/ private float ThumbnailDistance;
var(*) /*0x4C8A0000-0x00000000*/ private float ThumbnailWarmup[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bLit[131073];
var(*) /*0x3AEB0000-0x00000000*/ private bool bOrientZAxisTowardCamera[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRegenerateLODDuplicate;
var(*) /*0x0B9E0000-0x00000000*/ private bool bUseFixedRelativeBoundingBox[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldResetPeakCounts;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasPhysics[536870913];
var(*) /*0x4C8A0000-0x00000000*/ private bool bUseRealtimeThumbnail[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool ThumbnailImageOutOfDate;
var(*) /*0x3AEB0000-0x00000000*/ private bool bSkipSpawnCountCheck[65537];
var(*) /*0x1C330000-0x00000000*/ private bool bUseDelayRange[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurveEdSetup[524289];
var(*) /*0x2F830000-0x00000000*/ private float LODDistanceCheckTime[65537];
var(*) /*0x2F830000-0x00000000*/ private editfixedsize array LODDistances[4259841];
var(*) /*0x35EA0000-0x00000000*/ private int EditorLODSetting;
var(*) /*0x2F830000-0x00000000*/ private editfixedsize array LODSettings[65537];
var(*) /*0x0B9E0000-0x00000000*/ private @NULL FixedRelativeBoundingBox[65537];
var(*) /*0x3AEB0000-0x00000000*/ private float SecondsBeforeInactive[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FloorMesh;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FloorPosition;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FloorRotation;
var(*) /*0x35EA0000-0x00000000*/ private float FloorScale;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FloorScale3D;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BackgroundColor;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailImage;
var(*) /*0x1C330000-0x00000000*/ private float Delay[65537];
var(*) /*0x1C330000-0x00000000*/ private float DelayLow[65537];
var(*) /*0x302A0000-0x00000000*/ private @NULL MacroUVPosition[65537];
var(*) /*0x302A0000-0x00000000*/ private float MacroUVRadius[65537];
var(*) /*0x37140000-0x00000000*/ private @NULL CustomOcclusionBounds[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoloTracking[536870913];

// Export UParticleSystem::execGetCurrentLODMethod(FFrame&, void* const)
native function GetCurrentLODMethod()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UParticleSystem::execGetLODLevelCount(FFrame&, void* const)
native function GetLODLevelCount()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UParticleSystem::execGetLODDistance(FFrame&, void* const)
native function GetLODDistance()
{
    local /*0x35EA0000-0x00000000*/ private int LODLevelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UParticleSystem::execSetCurrentLODMethod(FFrame&, void* const)
native function SetCurrentLODMethod()
{
    local /*0x35EA0000-0x00000000*/ private byte InMethod[8388609];


}

// Export UParticleSystem::execSetLODDistance(FFrame&, void* const)
native function SetLODDistance()
{
    local /*0x35EA0000-0x00000000*/ private int LODLevelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float InDistance[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystem::execGetMaxLifespan(FFrame&, void* const)
native function GetMaxLifespan()
{
    local /*0x35EA0000-0x00000000*/ private float InComponentDelay[8388609], ReturnValue;


}

// Export UParticleSystem::execForceTexturesRelevant(FFrame&, void* const)
native final function ForceTexturesRelevant()
{
    local /*0x35EA0000-0x00000000*/ private float Seconds[8388609];


}

defaultproperties
{
    UpdateTime_FPS=60.0000000
    UpdateTime_Delta=1.0000000
    ThumbnailImageOutOfDate=true
    LODDistanceCheckTime=0.2500000
    FixedRelativeBoundingBox=(Min=(X=-1.0000000,Y=-1.0000000,Z=-1.0000000),Max=(X=1.0000000,Y=1.0000000,Z=1.0000000),IsValid=0)
    MacroUVRadius=200.0000000
}