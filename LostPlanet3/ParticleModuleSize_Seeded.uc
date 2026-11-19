class ParticleModuleSize_Seeded extends ParticleModuleSize
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartSize=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleSize_Seeded.DistributionStartSize'
    begin object name=DistributionStartSize
    end object
    Distribution=DistributionStartSize)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}