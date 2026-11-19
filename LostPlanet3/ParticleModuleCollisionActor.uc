class ParticleModuleCollisionActor extends ParticleModuleCollision
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x00CE0000-0x00000000*/ private editfixedsize array ActorsToCollideWith[65537];
var(*) /*0x00CE0000-0x00000000*/ private bool bCheckPawnCollisions[65537];

defaultproperties
{
    DampingFactor=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleCollisionActor.DistributionDampingFactor'
    begin object name=DistributionDampingFactor
    end object
    Distribution=DistributionDampingFactor)
    DampingFactorRotation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleCollisionActor.DistributionDampingFactorRotation'
    begin object name=DistributionDampingFactorRotation
    end object
    Distribution=DistributionDampingFactorRotation)
    MaxCollisions=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleCollisionActor.DistributionMaxCollisions'
    begin object name=DistributionMaxCollisions
    end object
    Distribution=DistributionMaxCollisions)
    ParticleMass=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleCollisionActor.DistributionParticleMass'
    begin object name=DistributionParticleMass
    end object
    Distribution=DistributionParticleMass)
    DelayAmount=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleCollisionActor.DistributionDelayAmount'
    begin object name=DistributionDelayAmount
    end object
    Distribution=DistributionDelayAmount)
}