class SPDAction_SpawnAI extends SPDAction_SpawnActor
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x025F0000-0x00000400*/ private editfixedsize @NULL Factory[589825];

function CreateActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609], inActor, DamageInfo, ReturnValue, NewActor, SpawnLocation,
	    SpawnRotation;

    Factory.bIgnoreCollision = !bCheckForSpawnCollision;
    GetSpawnPosition(inActor, DamageInfo, SpawnLocation, SpawnRotation);
    NewActor = CreateActorInternal(manager, SpawnLocation, SpawnRotation, inActor);
    AdjustSpawnLocation(NewActor);
    // End:0xD0
    if(NewActor != none)
    {
        AddOnSpawnActions(NewActor, manager);
    }
    return NewActor;
    //return ReturnValue;    
}
