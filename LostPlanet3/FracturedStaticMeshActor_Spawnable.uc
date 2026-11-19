class FracturedStaticMeshActor_Spawnable extends FracturedStaticMeshActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: FracturedStaticMeshComponent'Default__FracturedStaticMeshActor_Spawnable.FracturedStaticMeshComponent0'
    begin object name=FracturedStaticMeshComponent0
    end object
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__FracturedStaticMeshActor_Spawnable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: FracturedSkinnedMeshComponent'Default__FracturedStaticMeshActor_Spawnable.FracturedSkinnedComponent0'
    begin object name=FracturedSkinnedComponent0
    end object
    SkinnedComponent=FracturedSkinnedComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__FracturedStaticMeshActor_Spawnable.LightEnvironment0'
    begin object name=LightEnvironment0
    end object
    Components[0]=LightEnvironment0
    Components[1]=FracturedSkinnedComponent0
    Components[2]=FracturedStaticMeshComponent0
    bNoDelete=false
    CollisionComponent=FracturedStaticMeshComponent0
}