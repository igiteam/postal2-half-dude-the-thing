class SkeletalMeshActorBasedOnExtremeContent extends SkeletalMeshActor
    placeable
    hidecategories(AnimDependency,Navigation);

struct native SkelMaterialSetterDatum
{
    var(*) /*0x47980000-0x00000000*/ private int MaterialIndex[65537];
    var(*) /*0x47980000-0x00000000*/ private @NULL TheMaterial[65537];

    structdefaultproperties
    {
        MaterialIndex=0
        TheMaterial=none
    }
};

var(*) /*0x47890000-0x00000000*/ private editfixedsize array ExtremeContent[65537];
var(*) /*0x47890000-0x00000000*/ private editfixedsize array NonExtremeContent[65537];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetMaterialBasedOnExtremeContent();
    //return;    
}

simulated function SetMaterialBasedOnExtremeContent()
{
    local /*0x35EA0000-0x00000000*/ private int Idx;

    // End:0xD6
    if(WorldInfo.GRI.ShouldShowGore())
    {
        Idx = 0;
        J0x42:

        // End:0xD3 [Loop If]
        if(Idx < ExtremeContent.Length)
        {
            SkeletalMeshComponent.SetMaterial(ExtremeContent[Idx].MaterialIndex, ExtremeContent[Idx].TheMaterial);
            ++Idx;
            // [Loop Continue]
            goto J0x42;
        }        
    }
    else
    {
        Idx = 0;
        J0xE1:

        // End:0x172 [Loop If]
        if(Idx < NonExtremeContent.Length)
        {
            SkeletalMeshComponent.SetMaterial(NonExtremeContent[Idx].MaterialIndex, NonExtremeContent[Idx].TheMaterial);
            ++Idx;
            // [Loop Continue]
            goto J0xE1;
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__SkeletalMeshActorBasedOnExtremeContent.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SkeletalMeshActorBasedOnExtremeContent.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__SkeletalMeshActorBasedOnExtremeContent.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    CollisionComponent=SkeletalMeshComponent0
}