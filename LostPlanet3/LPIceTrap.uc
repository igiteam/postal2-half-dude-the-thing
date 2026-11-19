class LPIceTrap extends LPDSkeletalMesh
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SPHeadTrackComponent'Default__LPIceTrap.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPIceTrap.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPIceTrap.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPIceTrap.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: SPActorDestructComponent'Default__LPIceTrap.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[4]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPIceTrap.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[5]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=SkeletalMeshComponent0
}