class SPDAction_EnablePhysics extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

// Export USPDAction_EnablePhysics::execInitPhysics(FFrame&, void* const)
native function @NULL InitPhysics()
{
    local /*0x01C00000-0x00000400*/ private @NULL SmComponent[8388609];
    local /*0x01C00000-0x00000000*/ private float Weight[8388609];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];


}

event array Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000400*/ private @NULL SkeletalMesh, StaticMesh;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    // End:0x12
    if(Actor == none)
    {
        return 1;
    }
    Actor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0x71
    if(ComponentArray.Length > 0)
    {
        SkeletalMesh = SkeletalMeshComponent(ComponentArray[0]);
    }
    // End:0x114
    if((SkeletalMesh != none) && SkeletalMesh.PhysicsAsset != none)
    {
        Actor.SetPhysics(10);
        InitPhysics(SkeletalMesh, SkeletalMesh.PhysicsWeight);
        SkeletalMesh.WakeRigidBody();        
    }
    else
    {
        Actor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
        // End:0x173
        if(ComponentArray.Length > 0)
        {
            StaticMesh = StaticMeshComponent(ComponentArray[0]);
        }
        // End:0x1BC
        if(StaticMesh != none)
        {
            Actor.SetPhysics(10);
            StaticMesh.WakeRigidBody();
        }
    }
    return 1;
    //return ReturnValue;    
}
