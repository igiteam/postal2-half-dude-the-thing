class ParticleModuleVelocity_Seeded extends ParticleModuleVelocity
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartVelocity=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleVelocity_Seeded.DistributionStartVelocity'
    begin object name=DistributionStartVelocity
    end object
    Distribution=DistributionStartVelocity)
    StartVelocityRadial=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleVelocity_Seeded.DistributionStartVelocityRadial'
    begin object name=DistributionStartVelocityRadial
    end object
    Distribution=DistributionStartVelocityRadial)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}