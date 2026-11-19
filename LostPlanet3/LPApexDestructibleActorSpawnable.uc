class LPApexDestructibleActorSpawnable extends SPApexDestructibleActorSpawnable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPApexDestructibleActorSpawnable.LightEnvironment0'
    begin object name=LightEnvironment0
    end object
    LightEnvironment=LightEnvironment0
    // Reference: ApexStaticDestructibleComponent'Default__LPApexDestructibleActorSpawnable.DestructibleComponent0'
    begin object name=DestructibleComponent0
    end object
    StaticDestructibleComponent=DestructibleComponent0
    Components[0]=LightEnvironment0
    Components[1]=DestructibleComponent0
    CollisionComponent=DestructibleComponent0
}