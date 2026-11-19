class ApexDestructibleActorSpawnable extends ApexDestructibleActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__ApexDestructibleActorSpawnable.LightEnvironment0'
    begin object name=LightEnvironment0
    end object
    LightEnvironment=LightEnvironment0
    // Reference: ApexStaticDestructibleComponent'Default__ApexDestructibleActorSpawnable.DestructibleComponent0'
    begin object name=DestructibleComponent0
    end object
    StaticDestructibleComponent=DestructibleComponent0
    Components[0]=LightEnvironment0
    Components[1]=DestructibleComponent0
    bNoDelete=false
    CollisionComponent=DestructibleComponent0
}