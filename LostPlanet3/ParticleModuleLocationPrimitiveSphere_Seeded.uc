class ParticleModuleLocationPrimitiveSphere_Seeded extends ParticleModuleLocationPrimitiveSphere
    editinlinenew
    hidecategories(Object,Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartRadius=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveSphere_Seeded.DistributionStartRadius'
    begin object name=DistributionStartRadius
    end object
    Distribution=DistributionStartRadius)
    VelocityScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveSphere_Seeded.DistributionVelocityScale'
    begin object name=DistributionVelocityScale
    end object
    Distribution=DistributionVelocityScale)
    StartLocation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleLocationPrimitiveSphere_Seeded.DistributionStartLocation'
    begin object name=DistributionStartLocation
    end object
    Distribution=DistributionStartLocation)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}