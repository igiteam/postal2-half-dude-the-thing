class SkeletalMeshActorMAT extends SkeletalMeshCinematicActor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlotNodes[536870913];

// Export USkeletalMeshActorMAT::execMAT_SetAnimWeights(FFrame&, void* const)
native function MAT_SetAnimWeights()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotInfos[8388609];


}

// Export USkeletalMeshActorMAT::execMAT_SetMorphWeight(FFrame&, void* const)
native function MAT_SetMorphWeight()
{
    local /*0x35EA0000-0x00000000*/ private name MorphNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private float MorphWeight[8388609];


}

// Export USkeletalMeshActorMAT::execMAT_SetSkelControlScale(FFrame&, void* const)
native function MAT_SetSkelControlScale()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];


}

// Export USkeletalMeshActorMAT::execMAT_SetSkelControlStrength(FFrame&, void* const)
native function MAT_SetSkelControlStrength()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ControlStrength[8388609];


}

simulated event Destroyed()
{
    ClearAnimNodes();
    super(SkeletalMeshActor).Destroyed();
    //return;    
}

simulated event @NULL PostInitAnimTree()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    super(Actor).PostInitAnimTree(SkelComp);
    ClearAnimNodes();
    CacheAnimNodes();
    //return;    
}

simulated function CacheAnimNodes()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SlotNode;

    // End:0x53
    foreach SkeletalMeshComponent.AllAnimNodes(Class'AnimNodeSlot', SlotNode)
    {
        SlotNodes[SlotNodes.Length] = SlotNode;        
    }    
    //return;    
}

simulated function ClearAnimNodes()
{
    SlotNodes.Length = 0;
    //return;    
}

simulated event SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;

    MAT_SetAnimPosition(SlotName, ChannelIndex, InAnimSeqName, InPosition, bFireNotifies, bLooping, bEnableRootMotion);
    //return;    
}

// Export USkeletalMeshActorMAT::execMAT_SetAnimPosition(FFrame&, void* const)
native function MAT_SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;


}

simulated event FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    MAT_FinishAnimControl(InInterpGroup);
    //return;    
}

simulated event SetMorphWeight()
{
    local /*0x35EA0000-0x00000000*/ private name MorphNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private float MorphWeight[8388609];

    MAT_SetMorphWeight(MorphNodeName, MorphWeight);
    //return;    
}

simulated event SetSkelControlScale()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];

    MAT_SetSkelControlScale(SkelControlName, Scale);
    //return;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__SkeletalMeshActorMAT.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SkeletalMeshActorMAT.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__SkeletalMeshActorMAT.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    CollisionComponent=SkeletalMeshComponent0
}