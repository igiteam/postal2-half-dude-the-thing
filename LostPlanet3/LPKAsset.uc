class LPKAsset extends SPKAsset
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPKAsset.KAssetSkelMeshComponent'
    begin object name=KAssetSkelMeshComponent
    end object
    SkeletalMeshComponent=KAssetSkelMeshComponent
    // Reference: DynamicLightEnvironmentComponent'Default__LPKAsset.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    Components[0]=MyLightEnvironment
    Components[1]=KAssetSkelMeshComponent
    CollisionComponent=KAssetSkelMeshComponent
}