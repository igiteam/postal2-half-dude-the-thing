class SkeletalMeshActorMATWalkable extends SkeletalMeshActorMAT
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__SkeletalMeshActorMATWalkable.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SkeletalMeshActorMATWalkable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__SkeletalMeshActorMATWalkable.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    // Reference: CylinderComponent'Default__SkeletalMeshActorMATWalkable.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    Components[3]=CollisionCylinder
    Physics=EPhysics.PHYS_Walking
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    CollisionComponent=CollisionCylinder
}