class SPDKAssetSpawnable extends SPKAssetSpawnable
    abstract
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__SPDKAssetSpawnable.KAssetSkelMeshComponent'
    begin object name=KAssetSkelMeshComponent
    end object
    SkeletalMeshComponent=KAssetSkelMeshComponent
    // Reference: DynamicLightEnvironmentComponent'Default__SPDKAssetSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    Components[0]=MyLightEnvironment
    Components[1]=KAssetSkelMeshComponent
    // Reference: SPActorDestructComponent'Default__SPDKAssetSpawnable.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0 class=Class'SPActorDestructComponent'
    end object
    Components[2]=SPActorDestructComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=KAssetSkelMeshComponent
}