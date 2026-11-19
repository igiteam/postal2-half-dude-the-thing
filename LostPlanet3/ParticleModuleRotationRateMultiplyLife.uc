class ParticleModuleRotationRateMultiplyLife extends ParticleModuleRotationRateBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL LifeMultiplier[65537];

defaultproperties
{
    LifeMultiplier=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleRotationRateMultiplyLife.DistributionLifeMultiplier'
    begin object name=DistributionLifeMultiplier class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionLifeMultiplier,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}