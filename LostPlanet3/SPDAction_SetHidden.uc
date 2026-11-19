class SPDAction_SetHidden extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool bHide[65537];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x38
    if(Actor != none)
    {
        Actor.SetHidden(bHide);
    }
    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    bHide=true
}