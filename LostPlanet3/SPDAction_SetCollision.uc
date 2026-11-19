class SPDAction_SetCollision extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02790000-0x00000000*/ private byte CollisionType[65537];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x37
    if(Actor != none)
    {
        Actor.SetCollisionType(CollisionType);
    }
    return 1;
    //return ReturnValue;    
}
