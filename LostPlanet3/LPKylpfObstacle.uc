class LPKylpfObstacle extends SPKActor
    hidecategories(AnimDependency);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPKylpfObstacle.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPKylpfObstacle.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPKylpfObstacle.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: CylinderComponent'Default__LPKylpfObstacle.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    Components[2]=CollisionCylinder0
    CollisionComponent=CollisionCylinder0
}