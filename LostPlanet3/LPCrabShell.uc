class LPCrabShell extends LPCoreShield
    abstract
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPCrabShell.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPCrabShell.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__LPCrabShell.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPCrabShell.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}