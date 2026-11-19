class SkeletalMeshActorSpawnable extends SkeletalMeshActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__SkeletalMeshActorSpawnable.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SkeletalMeshActorSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__SkeletalMeshActorSpawnable.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    bNoDelete=false
    CollisionComponent=SkeletalMeshComponent0
}