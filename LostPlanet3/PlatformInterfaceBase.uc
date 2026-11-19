class PlatformInterfaceBase extends Object
    transient;

enum EPlatformInterfaceDataType
{
    PIDT_None,                      // 0
    PIDT_Int,                       // 1
    PIDT_Float,                     // 2
    PIDT_String,                    // 3
    PIDT_Object,                    // 4
    PIDT_Custom,                    // 5
    PIDT_MAX                        // 6
};

struct native PlatformInterfaceData
{
    var(*) /*0x35EA0000-0x00000000*/ private name DataName;
    var(*) /*0x35EA0000-0x00000000*/ private byte Type;
    var(*) /*0x35EA0000-0x00000000*/ private int IntValue;
    var(*) /*0x35EA0000-0x00000000*/ private float FloatValue;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string StringValue;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ObjectValue;

    structdefaultproperties
    {
        DataName="None"
        Type=EPlatformInterfaceDataType.PIDT_None
        IntValue=0
        FloatValue=0.0000000
        StringValue=""
        ObjectValue=none
    }
};

struct native PlatformInterfaceDelegateResult
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bSuccessful;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Data;

    structdefaultproperties
    {
        bSuccessful=false
        Data=(DataName="None",Type=EPlatformInterfaceDataType.PIDT_None,IntValue=0,FloatValue=0.0000000,StringValue="",ObjectValue=none)
    }
};

struct native DelegateArray
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Delegates;

    structdefaultproperties
    {
        Delegates=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AllDelegates;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __PlatformInterfaceDelegate__Delegate;

delegate PlatformInterfaceDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Result[25296897];

    //return;    
}

// Export UPlatformInterfaceBase::execCallDelegates(FFrame&, void* const)
native function CallDelegates()
{
    local /*0x35EA0000-0x00000000*/ private int DelegateType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DelegateResult[25165825];


}

// Export UPlatformInterfaceBase::execGetCloudStorageInterface(FFrame&, void* const)
native static function GetCloudStorageInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetLocalStorageInterface(FFrame&, void* const)
native static function GetLocalStorageInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetFacebookIntegration(FFrame&, void* const)
native static function GetFacebookIntegration()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetInGameAdManager(FFrame&, void* const)
native static function GetInGameAdManager()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetMicroTransactionInterface(FFrame&, void* const)
native static function GetMicroTransactionInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetAnalyticEventsInterface(FFrame&, void* const)
native static function GetAnalyticEventsInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetTwitterIntegration(FFrame&, void* const)
native static function GetTwitterIntegration()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetAppNotificationsInterface(FFrame&, void* const)
native static function GetAppNotificationsInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UPlatformInterfaceBase::execGetInAppMessageInterface(FFrame&, void* const)
native static function GetInAppMessageInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function AddDelegate()
{
    local /*0x35EA0000-0x00000000*/ private int DelegateType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    // End:0x32
    if(AllDelegates.Length < (DelegateType + 1))
    {
        AllDelegates.Length = DelegateType + 1;
    }
    // End:0xA2
    if(AllDelegates[DelegateType].Delegates.Find(InDelegate) == )
    {        
        AllDelegates[DelegateType].Delegates.AddItem(InDelegate);        
    }
    //return;    
}

function ClearDelegate()
{
    local /*0x35EA0000-0x00000000*/ private int DelegateType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    // End:0x9A
    if(DelegateType < AllDelegates.Length)
    {
        RemoveIndex = AllDelegates[DelegateType].Delegates.Find(InDelegate);        
        // End:0x9A
        if(RemoveIndex != -1)
        {
            AllDelegates[DelegateType].Delegates.Remove(RemoveIndex, 1);            
        }
    }
    //return;    
}
