class LPDKAssetSpawnable extends SPDKAssetSpawnable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPDKAssetSpawnable.KAssetSkelMeshComponent'
    begin object name=KAssetSkelMeshComponent
    end object
    SkeletalMeshComponent=KAssetSkelMeshComponent
    // Reference: DynamicLightEnvironmentComponent'Default__LPDKAssetSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    Components[0]=MyLightEnvironment
    Components[1]=KAssetSkelMeshComponent
    // Reference: SPActorDestructComponent'Default__LPDKAssetSpawnable.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=KAssetSkelMeshComponent
}