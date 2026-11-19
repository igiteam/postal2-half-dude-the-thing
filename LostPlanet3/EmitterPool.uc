class EmitterPool extends Actor
    transient
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct native EmitterBaseInfo
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL PSC[524289];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Base;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RelativeLocation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RelativeRotation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bInheritBaseScale;

    structdefaultproperties
    {
        PSC=none
        Base=none
        RelativeLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RelativeRotation=(Pitch=0,Yaw=0,Roll=0)
        bInheritBaseScale=false
    }
};

var(*) /*0x35EA0000-0x00000400*/ private export @NULL PSCTemplate[524289];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array PoolComponents[537526273];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array ActiveComponents[537395201];
var(*) /*0x35EA0000-0x00000000*/ private int MaxActiveEffects;
var(*) /*0x35EA0000-0x00000000*/ private input bool bLogPoolOverflow[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bLogPoolOverflowList[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export array RelativePSCs[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float SMC_MIC_ReductionTime;
var(*) /*0x35EA0000-0x00000000*/ private float SMC_MIC_CurrentReductionTime[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int IdealStaticMeshComponents;
var(*) /*0x35EA0000-0x00000000*/ private int IdealMaterialInstanceConstants;
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array FreeSMComponents[537526273];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FreeMatInstConsts[537001985];

// Export UEmitterPool::execOnParticleSystemFinished(FFrame&, void* const)
native function @NULL OnParticleSystemFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PSC[8388609];


}

// Export UEmitterPool::execClearPoolComponents(FFrame&, void* const)
native final function ClearPoolComponents()
{
    local /*0x35EA0000-0x00000000*/ private bool bClearActive[9437185];

    false            
}

// Export UEmitterPool::execReturnToPool(FFrame&, void* const)
protected native final function @NULL ReturnToPool()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PSC[8388609];


}

// Export UEmitterPool::execFreeStaticMeshComponents(FFrame&, void* const)
protected native final function @NULL FreeStaticMeshComponents()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PSC[8388609];


}

// Export UEmitterPool::execGetFreeStaticMeshComponent(FFrame&, void* const)
protected native final function @NULL GetFreeStaticMeshComponent()
{
    local /*0x35EA0000-0x00000000*/ private bool bCreateNewObject[9437185];
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    true            
}

// Export UEmitterPool::execFreeMaterialInstanceConstants(FFrame&, void* const)
protected native final function @NULL FreeMaterialInstanceConstants()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SMC[8388609];


}

// Export UEmitterPool::execGetFreeMatInstConsts(FFrame&, void* const)
protected native final function GetFreeMatInstConsts()
{
    local /*0x35EA0000-0x00000000*/ private bool bCreateNewObject[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    true            
}

// Export UEmitterPool::execGetPooledComponent(FFrame&, void* const)
protected native final function @NULL GetPooledComponent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EmitterTemplate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAutoActivate[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];


}

// Export UEmitterPool::execSpawnEmitter(FFrame&, void* const)
native function @NULL SpawnEmitter()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EmitterTemplate[8388609], SpawnLocation, SpawnRotation, AttachToActor, InInstigator;

    local /*0x35EA0000-0x00000000*/ private int MaxDLEPooledReuses[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bInheritScaleFromBase[9437185];
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];


}

// Export UEmitterPool::execSpawnEmitterMeshAttachment(FFrame&, void* const)
native function @NULL SpawnEmitterMeshAttachment()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EmitterTemplate[8388609], Mesh;
    local /*0x35EA0000-0x00000000*/ private name AttachPointName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAttachToSocket[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelativeLoc[9437185], RelativeRot, ReturnValue;


}

// Export UEmitterPool::execSpawnEmitterCustomLifetime(FFrame&, void* const)
native function @NULL SpawnEmitterCustomLifetime()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EmitterTemplate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSkipAutoActivate[9437185];
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__EmitterPool.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0 class=Class'ParticleSystemComponent'
    end object
    PSCTemplate=ParticleSystemComponent0
    SMC_MIC_ReductionTime=2.5000000
    IdealStaticMeshComponents=250
    IdealMaterialInstanceConstants=250
    TickGroup=ETickingGroup.TG_DuringAsyncWork
}