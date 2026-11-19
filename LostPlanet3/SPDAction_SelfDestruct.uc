class SPDAction_SelfDestruct extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL Pawn;

    // End:0xAF
    if(DamageInfo.Component == none)
    {
        Pawn = Pawn(Actor);
        // End:0x73
        if(Pawn != none)
        {
            // End:0x73
            if(Pawn.GetStateName() != 'Dying')
            {
            }
        }
        Actor.Destroy();
        Actor.bForceNetUpdate = true;        
    }
    else
    {
        DamageInfo.Component.SetHidden(true);
        Actor.DetachComponent(DamageInfo.Component);
    }
    return 1;
    //return ReturnValue;    
}
