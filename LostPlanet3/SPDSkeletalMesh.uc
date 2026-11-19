class SPDSkeletalMesh extends SPSkeletalMeshActorSpawnable
    abstract
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SPHeadTrackComponent'Default__SPDSkeletalMesh.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__SPDSkeletalMesh.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SPDSkeletalMesh.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__SPDSkeletalMesh.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: SPActorDestructComponent'Default__SPDSkeletalMesh.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0 class=Class'SPActorDestructComponent'
    end object
    Components[4]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__SPDSkeletalMesh.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0 class=Class'SPDestructibleStateComponent'
    end object
    Components[5]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=SkeletalMeshComponent0
}