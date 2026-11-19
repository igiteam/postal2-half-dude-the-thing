class ParticleModuleMeshRotation_Seeded extends ParticleModuleMeshRotation
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartRotation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleMeshRotation_Seeded.DistributionStartRotation'
    begin object name=DistributionStartRotation
    end object
    Distribution=DistributionStartRotation)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}