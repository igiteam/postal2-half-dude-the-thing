class LPInterpActorProxyVolume extends SPInterpActorProxyVolume
    abstract
    dontsortcategories(All)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPInterpActorProxyVolume.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPInterpActorProxyVolume.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInterpActorProxyVolume.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    CollisionComponent=StaticMeshComponent0
}