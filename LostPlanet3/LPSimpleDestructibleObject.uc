class LPSimpleDestructibleObject extends SPSimpleDestructibleObject
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPSimpleDestructibleObject.DestructMeshComp0'
    begin object name=DestructMeshComp0
    end object
    Mesh=DestructMeshComp0
    // Reference: ParticleSystemComponent'Default__LPSimpleDestructibleObject.Particle0'
    begin object name=Particle0
    end object
    Particles=Particle0
    Components[0]=DestructMeshComp0
    Components[1]=Particle0
    CollisionComponent=DestructMeshComp0
}