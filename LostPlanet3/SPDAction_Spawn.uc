class SPDAction_Spawn extends SPDAction
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool AttachToSpawner[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool bCheckForSpawnCollision[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private name SpawnerSocketName[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private float SpawnedFromLinearVelocityScale[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private @NULL PositionOffset[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000400*/ private editfixedsize array OnSpawnActionsLists[589825];

// Export USPDAction_Spawn::execSocketNameToBoneName(FFrame&, void* const)
native function @NULL SocketNameToBoneName()
{
    local /*0x01C00000-0x00000400*/ private @NULL Mesh[8388609];
    local /*0x01C00000-0x00000000*/ private name SName[8388609], ReturnValue;


}

// Export USPDAction_Spawn::execFindSpawnSpot(FFrame&, void* const)
native function FindSpawnSpot()
{
    local /*0x01C00000-0x00000000*/ private @NULL daActor[8388609];


}

// Export USPDAction_Spawn::execCreateActorInternal(FFrame&, void* const)
native function CreateActorInternal()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609], SpawnLocation, SpawnRotation, BaseActor, ReturnValue;


}

simulated function AdjustSpawnLocation()
{
    local /*0x01C00000-0x00000000*/ private @NULL daActor[8388609];

    // End:0x23
    if(bCheckForSpawnCollision == true)
    {
        FindSpawnSpot(daActor);
    }
    //return;    
}

function AddOnSpawnActions()
{
    local /*0x01C00000-0x00000000*/ private @NULL NewActor[8388609], manager;
    local /*0x01C00000-0x00000000*/ private int Idx;

    // End:0x9B
    if(manager.HasActions(OnSpawnActionsLists))
    {
        Idx = 0;
        J0x36:

        // End:0x9B [Loop If]
        if(Idx < OnSpawnActionsLists.Length)
        {
            manager.AddActionList(OnSpawnActionsLists[Idx], NewActor, 2);
            Idx++;
            // [Loop Continue]
            goto J0x36;
        }
    }
    //return;    
}

function array AddVelocity()
{
    local /*0x01C00000-0x00000000*/ private @NULL oldActor[8388609], NewActor, MeshComp;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    // End:0x169
    if(SpawnedFromLinearVelocityScale > 0.0000000)
    {
        NewActor.Velocity = oldActor.Velocity * SpawnedFromLinearVelocityScale;
        NewActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
        // End:0xBD
        if(ComponentArray.Length > 0)
        {
            MeshComp = MeshComponent(ComponentArray[0]);            
        }
        else
        {
            NewActor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
            // End:0x11C
            if(ComponentArray.Length > 0)
            {
                MeshComp = MeshComponent(ComponentArray[0]);
            }
        }
        // End:0x169
        if(MeshComp != none)
        {
            MeshComp.SetRBLinearVelocity(NewActor.Velocity);
        }
    }
    //return;    
}

function array AttachIt()
{
    local /*0x01C00000-0x00000000*/ private @NULL oldActor[8388609], NewActor, SpawnLocation, SpawnRotation;
    local /*0x01C00000-0x00000000*/ private bool HavePosition;
    local /*0x01C00000-0x00000000*/ private @NULL Location, Rotation, SkelMesh;
    local /*0x01C00000-0x00000000*/ private name BoneName;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    HavePosition = false;
    // End:0x13E
    if(SpawnerSocketName != 'None')
    {
        oldActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
        // End:0x82
        if(ComponentArray.Length > 0)
        {
            SkelMesh = SkeletalMeshComponent(ComponentArray[0]);
        }
        // End:0x13E
        if(SkelMesh != none)
        {
            HavePosition = SkelMesh.GetSocketWorldLocationAndRotation(SpawnerSocketName, Location, Rotation);
            // End:0x13E
            if(HavePosition)
            {
                BoneName = SocketNameToBoneName(SkelMesh, SpawnerSocketName);
                NewActor.SetBase(oldActor,, SkelMesh, BoneName);
            }
        }
    }
    // End:0x191
    if(!HavePosition)
    {
        NewActor.SetHardAttach(true);
        NewActor.SetBase(oldActor);
    }
    //return;    
}

function array GetSpawnPosition()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], DamageInfo, SpawnLocation, SpawnRotation, QRot, SkelMesh;

    local /*0x01C00000-0x00000000*/ private bool HavePosition;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    HavePosition = false;
    // End:0x132
    if(SpawnerSocketName != 'None')
    {
        Actor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
        // End:0x82
        if(ComponentArray.Length > 0)
        {
            SkelMesh = SkeletalMeshComponent(ComponentArray[0]);
        }
        // End:0x132
        if(SkelMesh != none)
        {
            HavePosition = SkelMesh.GetSocketWorldLocationAndRotation(SpawnerSocketName, SpawnLocation, SpawnRotation);
            // End:0x132
            if(HavePosition)
            {
                QRot = QuatFromRotator(SpawnRotation);
                SpawnLocation = QuatRotateVector(QRot, PositionOffset) + SpawnLocation;
            }
        }
    }
    // End:0x23D
    if(!HavePosition)
    {
        // End:0x1A3
        if(Actor != none)
        {
            SpawnLocation = Actor.Location;
            SpawnRotation = Actor.Rotation;            
        }
        else
        {
            SpawnLocation = DamageInfo.Location;
            SpawnRotation = DamageInfo.Rotation;
        }
        QRot = QuatFromRotator(SpawnRotation);
        SpawnLocation = QuatRotateVector(QRot, PositionOffset) + SpawnLocation;
    }
    //return;    
}

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    CreateActor(manager, Actor, DamageInfo);
    return 1;
    //return ReturnValue;    
}

function CreateActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609], inActor, DamageInfo, ReturnValue, NewActor, SpawnLocation,
	    SpawnRotation;

    GetSpawnPosition(inActor, DamageInfo, SpawnLocation, SpawnRotation);
    NewActor = CreateActorInternal(manager, SpawnLocation, SpawnRotation, inActor);
    AdjustSpawnLocation(NewActor);
    // End:0x11C
    if(NewActor != none)
    {
        NewActor.RemoteRole = ROLE_None;
        AddOnSpawnActions(NewActor, manager);
        // End:0x100
        if(AttachToSpawner)
        {
            AttachIt(inActor, NewActor, SpawnLocation, SpawnRotation);
        }
        AddVelocity(inActor, NewActor);
    }
    return NewActor;
    //return ReturnValue;    
}
