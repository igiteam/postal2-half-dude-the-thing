class SPDAction_SpawnRigidBody extends SPDAction_SpawnActor
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x025F0000-0x00000400*/ private editfixedsize @NULL Factory[589825];
var(__OnDestroyed__Delegate) /*0x025F0000-0x00000000*/ private bool bTurnOnCollision[65537];

function CreateActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609], inActor, DamageInfo, ReturnValue, NewActor;

    NewActor = super(SPDAction_Spawn).CreateActor(manager, inActor, DamageInfo);
    // End:0x4F
    if(bTurnOnCollision)
    {
        TurnOnCollision(NewActor);
    }
    return NewActor;
    //return ReturnValue;    
}

simulated function @NULL TurnOnCollision()
{
    local /*0x01C00000-0x00000000*/ private @NULL NewRigidBody[8388609];
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x01C00000-0x00000400*/ private @NULL MeshComp;

    NewRigidBody.SetCollision(true, true, false);
    NewRigidBody.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
    // End:0x5E
    if(ComponentArray.Length == 0)
    {
        return;
    }
    MeshComp = StaticMeshComponent(ComponentArray[0]);
    // End:0x8D
    if(MeshComp == none)
    {
        return;
    }
    NewRigidBody.CollisionComponent = MeshComp;
    MeshComp.SetBlockRigidBody(true);
    MeshComp.SetRBCollidesWithChannel(0, true);
    MeshComp.SetRBCollidesWithChannel(2, true);
    MeshComp.SetRBCollidesWithChannel(3, true);
    MeshComp.SetRBCollidesWithChannel(5, true);
    MeshComp.SetRBCollidesWithChannel(6, true);
    NewRigidBody.DetachComponent(MeshComp);
    NewRigidBody.AttachComponent(MeshComp);
    MeshComp.WakeRigidBody();
    //return;    
}
