class ParticleModuleOrbit extends ParticleModuleOrbitBase
    editinlinenew
    hidecategories(Object,Object,Object,Orbit);

enum EOrbitChainMode
{
    EOChainMode_Add,                // 0
    EOChainMode_Scale,              // 1
    EOChainMode_Link,               // 2
    EOChainMode_MAX                 // 3
};

struct native OrbitOptions
{
    var(*) /*0x38D80000-0x00000000*/ private bool bProcessDuringSpawn[65537];
    var(*) /*0x38D80000-0x00000000*/ private bool bProcessDuringUpdate[65537];
    var(*) /*0x38D80000-0x00000000*/ private bool bUseEmitterTime[65537];

    structdefaultproperties
    {
        bProcessDuringSpawn=true
        bProcessDuringUpdate=false
        bUseEmitterTime=false
    }
};

var(*) /*0x11500000-0x00000000*/ private byte ChainMode[65537];
var(*) /*0x373B0000-0x00000000*/ private editfixedsize export @NULL OffsetAmount[65537];
var(*) /*0x373B0000-0x00000000*/ private @NULL OffsetOptions[65537];
var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL RotationAmount[65537];
var(*) /*0x42510000-0x00000000*/ private @NULL RotationOptions[65537];
var(*) /*0x42600000-0x00000000*/ private editfixedsize export @NULL RotationRateAmount[65537];
var(*) /*0x42600000-0x00000000*/ private @NULL RotationRateOptions[65537];

defaultproperties
{
    ChainMode=EOrbitChainMode.EOChainMode_Link
    OffsetAmount=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleOrbit.DistributionOffsetAmount'
    begin object name=DistributionOffsetAmount class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionOffsetAmount,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    OffsetOptions=(bProcessDuringSpawn=true,bProcessDuringUpdate=false,bUseEmitterTime=false)
    RotationAmount=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleOrbit.DistributionRotationAmount'
    begin object name=DistributionRotationAmount class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionRotationAmount,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    RotationOptions=(bProcessDuringSpawn=true,bProcessDuringUpdate=false,bUseEmitterTime=false)
    RotationRateAmount=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleOrbit.DistributionRotationRateAmount'
    begin object name=DistributionRotationRateAmount class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionRotationRateAmount,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    RotationRateOptions=(bProcessDuringSpawn=true,bProcessDuringUpdate=false,bUseEmitterTime=false)
    bSpawnModule=true
    bUpdateModule=true
}