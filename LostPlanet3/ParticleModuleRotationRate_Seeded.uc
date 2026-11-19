class ParticleModuleRotationRate_Seeded extends ParticleModuleRotationRate
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartRotationRate=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleRotationRate_Seeded.DistributionStartRotationRate'
    begin object name=DistributionStartRotationRate
    end object
    Distribution=DistributionStartRotationRate)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}