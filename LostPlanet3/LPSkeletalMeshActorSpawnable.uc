class LPSkeletalMeshActorSpawnable extends SPSkeletalMeshActorSpawnable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SPHeadTrackComponent'Default__LPSkeletalMeshActorSpawnable.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPSkeletalMeshActorSpawnable.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPSkeletalMeshActorSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPSkeletalMeshActorSpawnable.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    CollisionComponent=SkeletalMeshComponent0
}