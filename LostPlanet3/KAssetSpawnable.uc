class KAssetSpawnable extends KAsset
    notplaceable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__KAssetSpawnable.KAssetSkelMeshComponent'
    begin object name=KAssetSkelMeshComponent
    end object
    SkeletalMeshComponent=KAssetSkelMeshComponent
    // Reference: DynamicLightEnvironmentComponent'Default__KAssetSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    Components[0]=MyLightEnvironment
    Components[1]=KAssetSkelMeshComponent
    bNoDelete=false
    CollisionComponent=KAssetSkelMeshComponent
}