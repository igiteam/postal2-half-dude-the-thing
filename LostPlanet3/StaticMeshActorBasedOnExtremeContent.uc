class StaticMeshActorBasedOnExtremeContent extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(StaticMeshes);

struct native SMMaterialSetterDatum
{
    var(*) /*0x47E70000-0x00000000*/ private int MaterialIndex[65537];
    var(*) /*0x47E70000-0x00000000*/ private @NULL TheMaterial[65537];

    structdefaultproperties
    {
        MaterialIndex=0
        TheMaterial=none
    }
};

var(*) /*0x4A240000-0x00000400*/ private const export @NULL StaticMeshComponent[720897];
var(*) /*0x4A240000-0x00000000*/ private editfixedsize array ExtremeContent[65537];
var(*) /*0x4A240000-0x00000000*/ private editfixedsize array NonExtremeContent[65537];

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
            StaticMeshComponent.SetMaterial(ExtremeContent[Idx].MaterialIndex, ExtremeContent[Idx].TheMaterial);
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
            StaticMeshComponent.SetMaterial(NonExtremeContent[Idx].MaterialIndex, NonExtremeContent[Idx].TheMaterial);
            ++Idx;
            // [Loop Continue]
            goto J0xE1;
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__StaticMeshActorBasedOnExtremeContent.StaticMeshComponent0'
    begin object name=StaticMeshComponent0 class=Class'StaticMeshComponent'
    end object
    StaticMeshComponent=StaticMeshComponent0
    Components[0]=StaticMeshComponent0
    bStatic=true
    bWorldGeometry=true
    bGameRelevant=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
    CollisionComponent=StaticMeshComponent0
}