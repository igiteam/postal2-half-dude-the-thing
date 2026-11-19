class ParticleModuleLocation_Seeded extends ParticleModuleLocation
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartLocation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleLocation_Seeded.DistributionStartLocation'
    begin object name=DistributionStartLocation
    end object
    Distribution=DistributionStartLocation)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}