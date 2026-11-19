class ParticleModuleLifetime_Seeded extends ParticleModuleLifetime
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    Lifetime=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleLifetime_Seeded.DistributionLifetime'
    begin object name=DistributionLifetime
    end object
    Distribution=DistributionLifetime)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}