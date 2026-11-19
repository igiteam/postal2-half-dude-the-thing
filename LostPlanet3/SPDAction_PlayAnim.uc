class SPDAction_PlayAnim extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02720000-0x00000000*/ private name AnimName[65537];
var(__OnDestroyed__Delegate) /*0x02720000-0x00000000*/ private float Rate[65537];
var(__OnDestroyed__Delegate) /*0x02720000-0x00000000*/ private bool bLooping[65537];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL InSkeletalMeshActor;

    InSkeletalMeshActor = SPSkeletalMeshActor(Actor);
    // End:0x2E
    if(InSkeletalMeshActor == none)
    {
        return 1;
    }
    InSkeletalMeshActor.PlayCustomAnim(bLooping, AnimName,, Rate);
    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    Rate=1.0000000
}