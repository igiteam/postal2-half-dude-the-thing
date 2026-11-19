class SPDAction_Latent extends SPDAction
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

// Export USPDAction_Latent::execPushDataNative(FFrame&, void* const)
native function PushDataNative()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];


}

// Export USPDAction_Latent::execPopDataNative(FFrame&, void* const)
native function PopDataNative()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];


}

event PushData()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];

    PushDataNative(manager);
    //return;    
}

event PopData()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];

    PopDataNative(manager);
    //return;    
}

event Enter()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    return 1;
    //return ReturnValue;    
}

event Exit()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;

    //return;    
}

event Abort()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;

    //return;    
}

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    return 1;
    //return ReturnValue;    
}
