class SPDAction extends Object
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

struct native SPDProcesData
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private byte Padding[4];

    structdefaultproperties
    {
        Padding[0]=0
        Padding[1]=0
        Padding[2]=0
        Padding[3]=0
    }
};

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private const editfixedsize string Action[196609];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool bServerOnly[196609];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    return 1;
    //return ReturnValue;    
}
