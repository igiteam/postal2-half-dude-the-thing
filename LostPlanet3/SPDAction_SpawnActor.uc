class SPDAction_SpawnActor extends SPDAction_Spawn
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x018C0000-0x00000000*/ private bool bInheritBaseLighting[65537];

// Export USPDAction_SpawnActor::execCreateActorInternal(FFrame&, void* const)
native function CreateActorInternal()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609], SpawnLocation, SpawnRotation, BaseActor, ReturnValue;


}

// Export USPDAction_SpawnActor::execMatchBoneOrientations(FFrame&, void* const)
native function @NULL MatchBoneOrientations()
{
    local /*0x01C00000-0x00000400*/ private @NULL Source[8388609], Destination;


}

function array MatchActorBoneOrientations()
{
    local /*0x01C00000-0x00000000*/ private @NULL SrcActor[8388609], destActor, SrcComponent, DestComponent;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    SrcActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0x5F
    if(ComponentArray.Length > 0)
    {
        SrcComponent = SkeletalMeshComponent(ComponentArray[0]);
    }
    destActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0xBE
    if(ComponentArray.Length > 0)
    {
        DestComponent = SkeletalMeshComponent(ComponentArray[0]);
    }
    MatchBoneOrientations(SrcComponent, DestComponent);
    //return;    
}
