class SPDKActorSpawnable extends SPKActorSpawnable
    abstract
    hidecategories(AnimDependency);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__SPDKActorSpawnable.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__SPDKActorSpawnable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__SPDKActorSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__SPDKActorSpawnable.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0 class=Class'SPActorDestructComponent'
    end object
    Components[2]=SPActorDestructComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}