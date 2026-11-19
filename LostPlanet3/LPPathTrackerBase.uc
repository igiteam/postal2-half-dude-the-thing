class LPPathTrackerBase extends SPPathTrackerBase
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPPathTrackerBase.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    Mesh=SkeletalMeshComponent0
    // Reference: AudioComponent'Default__LPPathTrackerBase.LoopingSound0'
    begin object name=LoopingSound0
    end object
    LoopingSound=LoopingSound0
    // Reference: DynamicLightEnvironmentComponent'Default__LPPathTrackerBase.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=LoopingSound0
    CollisionComponent=SkeletalMeshComponent0
}