class SPDAction_Delay extends SPDAction_Latent
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private float DelayInSeconds[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float Counter;

event PushData()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];

    manager.PushFloat(Counter);
    //return;    
}

event PopData()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];

    Counter = manager.PopFloat();
    //return;    
}

event Enter()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x14
    if(DelayInSeconds <= float(0))
    {
        return 1;
    }
    Counter = DelayInSeconds;
    return 0;
    //return ReturnValue;    
}

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    Counter -= ElapsedTime;
    // End:0x2D
    if(Counter > 0.0000000)
    {
        return 0;        
    }
    else
    {
        return 1;
    }
    //return ReturnValue;    
}

event Exit()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;

    //return;    
}
