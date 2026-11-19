class DynamicSMActor_Spawnable extends DynamicSMActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__DynamicSMActor_Spawnable.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__DynamicSMActor_Spawnable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__DynamicSMActor_Spawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    bCollideActors=true
    bBlockActors=true
    CollisionComponent=StaticMeshComponent0
}