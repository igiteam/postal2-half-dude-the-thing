class ParticleSystemComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Object,Physics,Collision);

enum EParticleSysParamType
{
    PSPT_None,                      // 0
    PSPT_Scalar,                    // 1
    PSPT_ScalarRand,                // 2
    PSPT_Vector,                    // 3
    PSPT_VectorRand,                // 4
    PSPT_Color,                     // 5
    PSPT_Actor,                     // 6
    PSPT_Material,                  // 7
    PSPT_MAX                        // 8
};

enum ParticleReplayState
{
    PRS_Disabled,                   // 0
    PRS_Capturing,                  // 1
    PRS_Replaying,                  // 2
    PRS_MAX                         // 3
};

enum EParticleEventType
{
    EPET_Any,                       // 0
    EPET_Spawn,                     // 1
    EPET_Death,                     // 2
    EPET_Collision,                 // 3
    EPET_WorldAttractorCollision,   // 4
    EPET_Kismet,                    // 5
    EPET_MAX                        // 6
};

struct ParticleEmitterInstance
{
};

struct native ParticleEmitterInstanceMotionBlurInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ParticleMBInfoMap[805437441];
};

struct native ViewParticleEmitterInstanceMotionBlurInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EmitterInstanceMBInfoMap[805437441];
};

struct native ParticleSysParam
{
    var(*) /*0x3AEA0000-0x00000000*/ private name Name[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private byte ParamType[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private float Scalar[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private float Scalar_Low[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private @NULL Vector[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private @NULL Vector_Low[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private @NULL Color[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private @NULL Actor[65537];
    var(*) /*0x3AEA0000-0x00000000*/ private @NULL Material[65537];

    structdefaultproperties
    {
        Name="None"
        ParamType=EParticleSysParamType.PSPT_None
        Scalar=0.0000000
        Scalar_Low=0.0000000
        Vector=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Vector_Low=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Color=(R=0,G=0,B=0,A=0)
        Actor=none
        Material=none
    }
};

struct native ParticleEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private int Type;
    var(*) /*0x35EA0000-0x00000000*/ private name EventName;
    var(*) /*0x35EA0000-0x00000000*/ private float EmitterTime;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Direction;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Velocity;

    structdefaultproperties
    {
        Type=0
        EventName="None"
        EmitterTime=0.0000000
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Direction=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native ParticleEventSpawnData extends ParticleEventData
{
};

struct native ParticleEventDeathData extends ParticleEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private float ParticleTime;
};

struct native ParticleEventCollideData extends ParticleEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private float ParticleTime;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Normal;
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x35EA0000-0x00000000*/ private int Item;
    var(*) /*0x35EA0000-0x00000000*/ private name BoneName;
};

struct native ParticleEventAttractorCollideData extends ParticleEventCollideData
{
};

struct native ParticleEventKismetData extends ParticleEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private bool UsePSysCompLocation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Normal;
};

var(*) /*0x3AEC0000-0x00000000*/ private @NULL Template[196609];
var(*) /*0x35EA0000-0x00000000*/ private class LightEnvironmentClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightEnvironmentSharedInstigator[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int MaxLightEnvironmentPooledReuses[536870913];
var(*) /*0x35EA0000-0x00000000*/ private array EmitterInstances[805437441];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array SMComponents[537526273];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SMMaterialInterfaces[537001985];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array SkelMeshComponents[537526273];
var(*) /*0x35EA0000-0x00000000*/ private array ViewMBInfoArray[805437441];
var(*) /*0x3AEC0000-0x00000000*/ private bool bAutoActivate[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasCompleted[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bSuppressSpawning[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasDeactivated[537001985];
var(*) /*0x3AEC0000-0x00000000*/ private bool bResetOnDetach[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateOnDedicatedServer;
var(*) /*0x35EA0000-0x00000000*/ private bool bJustAttached[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsActive[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenActivated[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bWarmingUp;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsCachedInPool;
var(*) /*0x2F830000-0x00000000*/ private bool bOverrideLODMethod[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipUpdateDynamicDataDuringTick;
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipBoundsUpdate;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateComponentInTick;
var(*) /*0x35EA0000-0x00000000*/ private bool bDeferredBeamUpdate;
var(*) /*0x35EA0000-0x00000000*/ private bool bForcedInActive[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsWarmingUp[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsViewRelevanceDirty[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bRecacheViewRelevance[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bLODUpdatePending[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipSpawnCountCheck[536870913];
var(*) /*0x3AEC0000-0x00000400*/ private editfixedsize array InstanceParameters[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldPosition;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldPosition_Owner;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartSysVelocity;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartSysVelocity_Owner;
var(*) /*0x35EA0000-0x00000000*/ private float WarmupTime;
var(*) /*0x35EA0000-0x00000000*/ private float WarmupTickRate;
var(*) /*0x35EA0000-0x00000000*/ private int LODLevel[536870913];
var(*) /*0x3AEC0000-0x00000000*/ private float SecondsBeforeInactive[65537];
var(*) /*0x35EA0000-0x00000000*/ private float TimeSinceLastForceUpdateTransform[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float MaxTimeBeforeForceUpdateTransform;
var(*) /*0x35EA0000-0x00000000*/ private int EditorLODLevel;
var(*) /*0x35EA0000-0x00000000*/ private int EditorDetailMode;
var(*) /*0x35EA0000-0x00000000*/ private float AccumTickTime[536870913];
var(*) /*0x2F830000-0x00000000*/ private byte LODMethod[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte ReplayState[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedViewRelevanceFlags[537001985];
var(*) /*0x3AEC0000-0x00000400*/ private editfixedsize array ReplayClips[196609];
var(*) /*0x35EA0000-0x00000000*/ private int ReplayClipIDNumber[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int ReplayFrameIndex[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float AccumLODDistanceCheckTime[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SpawnEvents[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DeathEvents[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CollisionEvents[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array KismetEvents[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AttractorCollisionEvents[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseResourcesFence[805437441];
var(*) /*0x3AEC0000-0x00000000*/ private float CustomTimeDilation[65537];
var(*) /*0x35EA0000-0x00000000*/ private float EmitterDelay[536870913];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnSystemFinished__Delegate;

delegate @NULL OnSystemFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PSystem[8388609];

    //return;    
}

// Export UParticleSystemComponent::execSetTemplate(FFrame&, void* const)
native final function SetTemplate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTemplate[8388609];


}

// Export UParticleSystemComponent::execActivateSystem(FFrame&, void* const)
native final function ActivateSystem()
{
    local /*0x35EA0000-0x00000000*/ private bool bFlagAsJustAttached[9437185];

    false            
}

// Export UParticleSystemComponent::execDeactivateSystem(FFrame&, void* const)
native final function DeactivateSystem();

// Export UParticleSystemComponent::execKillParticlesForced(FFrame&, void* const)
native final function KillParticlesForced();

// Export UParticleSystemComponent::execKillParticlesInEmitter(FFrame&, void* const)
native final function KillParticlesInEmitter()
{
    local /*0x35EA0000-0x00000000*/ private name InEmitterName[8388609];


}

// Export UParticleSystemComponent::execSetSkipUpdateDynamicDataDuringTick(FFrame&, void* const)
native final function SetSkipUpdateDynamicDataDuringTick()
{
    local /*0x35EA0000-0x00000000*/ private bool bInSkipUpdateDynamicDataDuringTick[8388609];


}

// Export UParticleSystemComponent::execGetSkipUpdateDynamicDataDuringTick(FFrame&, void* const)
native final function GetSkipUpdateDynamicDataDuringTick()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execSetSkipBoundsUpdate(FFrame&, void* const)
native final function SetSkipBoundsUpdate()
{
    local /*0x35EA0000-0x00000000*/ private bool bInSkipBoundsUpdate[8388609];


}

// Export UParticleSystemComponent::execGetSkipBoundsUpdate(FFrame&, void* const)
native final function GetSkipBoundsUpdate()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execSetKillOnDeactivate(FFrame&, void* const)
native function SetKillOnDeactivate()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bKill[8388609];


}

// Export UParticleSystemComponent::execSetKillOnCompleted(FFrame&, void* const)
native function SetKillOnCompleted()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bKill[8388609];


}

// Export UParticleSystemComponent::execRewindEmitterInstance(FFrame&, void* const)
native function RewindEmitterInstance()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];


}

// Export UParticleSystemComponent::execRewindEmitterInstances(FFrame&, void* const)
native function RewindEmitterInstances();

// Export UParticleSystemComponent::execSetBeamType(FFrame&, void* const)
native function SetBeamType()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609], NewMethod;


}

// Export UParticleSystemComponent::execSetBeamTessellationFactor(FFrame&, void* const)
native function SetBeamTessellationFactor()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewFactor[8388609];


}

// Export UParticleSystemComponent::execSetBeamEndPoint(FFrame&, void* const)
native function SetBeamEndPoint()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewEndPoint[8388609];


}

// Export UParticleSystemComponent::execSetBeamDistance(FFrame&, void* const)
native function SetBeamDistance()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float Distance[8388609];


}

// Export UParticleSystemComponent::execSetBeamSourcePoint(FFrame&, void* const)
native function SetBeamSourcePoint()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewSourcePoint[8388609];
    local /*0x35EA0000-0x00000000*/ private int SourceIndex[8388609];


}

// Export UParticleSystemComponent::execSetBeamSourceTangent(FFrame&, void* const)
native function SetBeamSourceTangent()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewTangentPoint[8388609];
    local /*0x35EA0000-0x00000000*/ private int SourceIndex[8388609];


}

// Export UParticleSystemComponent::execSetBeamSourceStrength(FFrame&, void* const)
native function SetBeamSourceStrength()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewSourceStrength[8388609];
    local /*0x35EA0000-0x00000000*/ private int SourceIndex[8388609];


}

// Export UParticleSystemComponent::execSetBeamTargetPoint(FFrame&, void* const)
native function SetBeamTargetPoint()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewTargetPoint[8388609];
    local /*0x35EA0000-0x00000000*/ private int TargetIndex[8388609];


}

// Export UParticleSystemComponent::execSetBeamTargetTangent(FFrame&, void* const)
native function SetBeamTargetTangent()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewTangentPoint[8388609];
    local /*0x35EA0000-0x00000000*/ private int TargetIndex[8388609];


}

// Export UParticleSystemComponent::execSetBeamTargetStrength(FFrame&, void* const)
native function SetBeamTargetStrength()
{
    local /*0x35EA0000-0x00000000*/ private int EmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewTargetStrength[8388609];
    local /*0x35EA0000-0x00000000*/ private int TargetIndex[8388609];


}

// Export UParticleSystemComponent::execDetermineLODLevelForLocation(FFrame&, void* const)
native function DetermineLODLevelForLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EffectLocation[25296897];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UParticleSystemComponent::execGetMaxLifespan(FFrame&, void* const)
native function GetMaxLifespan()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UParticleSystemComponent::execSystemHasCompleted(FFrame&, void* const)
native function SystemHasCompleted()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execSetLODLevel(FFrame&, void* const)
native final function SetLODLevel()
{
    local /*0x35EA0000-0x00000000*/ private int InLODLevel[8388609];


}

// Export UParticleSystemComponent::execSetEditorLODLevel(FFrame&, void* const)
native final function SetEditorLODLevel()
{
    local /*0x35EA0000-0x00000000*/ private int InLODLevel[8388609];


}

// Export UParticleSystemComponent::execGetLODLevel(FFrame&, void* const)
native final function GetLODLevel()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UParticleSystemComponent::execGetEditorLODLevel(FFrame&, void* const)
native final function GetEditorLODLevel()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UParticleSystemComponent::execSetFloatParameter(FFrame&, void* const)
native final function SetFloatParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Param[8388609];


}

// Export UParticleSystemComponent::execSetFloatRandParameter(FFrame&, void* const)
native final function SetFloatRandParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Param[8388609], ParamLow;


}

// Export UParticleSystemComponent::execSetVectorParameter(FFrame&, void* const)
native final function SetVectorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];


}

// Export UParticleSystemComponent::execSetVectorRandParameter(FFrame&, void* const)
native final function SetVectorRandParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[25296897], ParamLow;


}

// Export UParticleSystemComponent::execSetColorParameter(FFrame&, void* const)
native final function SetColorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];


}

// Export UParticleSystemComponent::execSetActorParameter(FFrame&, void* const)
native final function SetActorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];


}

// Export UParticleSystemComponent::execSetMaterialParameter(FFrame&, void* const)
native final function SetMaterialParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];


}

// Export UParticleSystemComponent::execGetFloatParameter(FFrame&, void* const)
native function GetFloatParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8519681];
    local /*0x35EA0000-0x00000000*/ private float OutFloat[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execGetVectorParameter(FFrame&, void* const)
native function GetVectorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL OutVector[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execGetColorParameter(FFrame&, void* const)
native function GetColorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL OutColor[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execGetActorParameter(FFrame&, void* const)
native function GetActorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL OutActor[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execGetMaterialParameter(FFrame&, void* const)
native function GetMaterialParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL OutMaterial[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UParticleSystemComponent::execClearParameter(FFrame&, void* const)
native final function ClearParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ParameterType[9437185];


}

// Export UParticleSystemComponent::execSetActive(FFrame&, void* const)
native final function SetActive()
{
    local /*0x35EA0000-0x00000000*/ private bool bNowActive[8388609], bFlagAsJustAttached;


}

// Export UParticleSystemComponent::execResetToDefaults(FFrame&, void* const)
native final function ResetToDefaults();

// Export UParticleSystemComponent::execSetStopSpawning(FFrame&, void* const)
native final function SetStopSpawning()
{
    local /*0x35EA0000-0x00000000*/ private int InEmitterIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInStopSpawning[8388609];


}
