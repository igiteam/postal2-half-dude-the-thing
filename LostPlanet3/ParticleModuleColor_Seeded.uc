class ParticleModuleColor_Seeded extends ParticleModuleColor
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x3FA40000-0x00000000*/ private editfixedsize @NULL RandomSeedInfo[65537];

defaultproperties
{
    RandomSeedInfo=(ParameterName="None",bGetSeedFromInstance=false,bInstanceSeedIsIndex=false,bResetSeedOnEmitterLooping=true,RandomSeeds=none)
    StartColor=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleColor_Seeded.DistributionStartColor'
    begin object name=DistributionStartColor
    end object
    Distribution=DistributionStartColor)
    StartAlpha=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleColor_Seeded.DistributionStartAlpha'
    begin object name=DistributionStartAlpha
    end object
    Distribution=DistributionStartAlpha)
    bSupportsRandomSeed=true
    bRequiresLoopingNotification=true
}