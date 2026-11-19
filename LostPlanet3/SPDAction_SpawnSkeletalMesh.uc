class SPDAction_SpawnSkeletalMesh extends SPDAction_SpawnActor
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x025F0000-0x00000400*/ private editfixedsize @NULL Factory[589825];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool MatchBoneOrientationOfOriginal[65537];

function CreateActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609], inActor, DamageInfo, ReturnValue, NewActor;

    NewActor = SPDSkeletalMesh(super(SPDAction_Spawn).CreateActor(manager, inActor, DamageInfo));
    // End:0x70
    if(NewActor != none)
    {
        // End:0x70
        if(MatchBoneOrientationOfOriginal)
        {
            MatchActorBoneOrientations(inActor, NewActor);
        }
    }
    return NewActor;
    //return ReturnValue;    
}
