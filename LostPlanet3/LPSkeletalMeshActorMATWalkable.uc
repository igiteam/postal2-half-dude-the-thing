class LPSkeletalMeshActorMATWalkable extends SPSkeletalMeshActorMATWalkable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPSkeletalMeshActorMATWalkable.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPSkeletalMeshActorMATWalkable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPSkeletalMeshActorMATWalkable.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    // Reference: CylinderComponent'Default__LPSkeletalMeshActorMATWalkable.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[3]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}