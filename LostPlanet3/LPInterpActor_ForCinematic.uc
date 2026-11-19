class LPInterpActor_ForCinematic extends SPInterpActor_ForCinematic
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPInterpActor_ForCinematic.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPInterpActor_ForCinematic.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInterpActor_ForCinematic.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    CollisionComponent=StaticMeshComponent0
}