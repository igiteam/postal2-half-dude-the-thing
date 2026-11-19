class ParticleModuleSpawn extends ParticleModuleSpawnBase
    editinlinenew
    hidecategories(Object,Object,Object,ParticleModuleSpawnBase);

var(*) /*0x48AF0000-0x00000000*/ private editfixedsize export @NULL Rate[65537];
var(*) /*0x48AF0000-0x00000000*/ private editfixedsize export @NULL RateScale[65537];
var(*) /*0x48AF0000-0x00000000*/ private float RateSustainPoint[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bUseRateSustain[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bUseNormalizedEmitterTime[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bUseSpawnTimeOnUpdate[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bUseFixedInterpolation[65537];
var(*) /*0x0F250000-0x00000000*/ private byte ParticleBurstMethod[65537];
var(*) /*0x0F250000-0x00000200*/ private editfixedsize array BurstList[589825];

defaultproperties
{
    Rate=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleSpawn.RequiredDistributionSpawnRate'
    begin object name=RequiredDistributionSpawnRate class=Class'DistributionFloatConstant'
    end object
    Distribution=RequiredDistributionSpawnRate,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    RateScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleSpawn.RequiredDistributionSpawnRateScale'
    begin object name=RequiredDistributionSpawnRateScale class=Class'DistributionFloatConstant'
    end object
    Distribution=RequiredDistributionSpawnRateScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    LODDuplicate=false
}