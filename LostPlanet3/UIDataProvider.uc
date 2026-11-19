class UIDataProvider extends UIRoot
    abstract
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

enum EProviderAccessType
{
    ACCESS_ReadOnly,                // 0
    ACCESS_PerField,                // 1
    ACCESS_WriteAll,                // 2
    ACCESS_MAX                      // 3
};

struct native transient UIDataProviderField
{
    var(*) /*0x35EA0000-0x00000010*/ private name FieldTag;
    var(*) /*0x35EA0000-0x00000010*/ private byte FieldType;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array FieldProviders;

    structdefaultproperties
    {
        FieldTag="None"
        FieldType=EUIDataProviderFieldType.DATATYPE_Property
        FieldProviders=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private byte WriteAccessType;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ProviderChangedNotifies[536870913];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnDataProviderPropertyChange__Delegate[536870913];

delegate OnDataProviderPropertyChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SourceProvider[8388609];
    local /*0x35EA0000-0x00000000*/ private name PropTag[9437185];

    //return;    
}

// Export UUIDataProvider::execGetProviderFieldType(FFrame&, void* const)
native final function GetProviderFieldType()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DataTag[142606337];
    local /*0x35EA0000-0x00000000*/ private byte out_ProviderFieldType[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UUIDataProvider::execParseArrayDelimiter(FFrame&, void* const)
native function ParseArrayDelimiter()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DataTag[25165825];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

event GetSupportedScriptFields()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Fields[25165825];

    //return;    
}

event AllowPublishingToField()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FieldName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ArrayIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

event GetFieldValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FieldName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FieldValue[25165825];
    local /*0x35EA0000-0x00000000*/ private int ArrayIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

event SetFieldValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FieldName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FieldValue[25296897];
    local /*0x35EA0000-0x00000000*/ private int ArrayIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

event GenerateScriptMarkupString()
{
    local /*0x35EA0000-0x00000000*/ private name DataTag[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

event GenerateFillerData()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DataTag[8388609], ReturnValue;

    //return ReturnValue;    
}

event IsProviderDisabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event IsCollectionDataType()
{
    local /*0x35EA0000-0x00000000*/ private byte FieldType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (int(FieldType) == int(4)) || int(FieldType) == int(5);
    //return ReturnValue;    
}

event NotifyPropertyChanged()
{
    local /*0x35EA0000-0x00000000*/ private name PropTag[9437185];
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Subscriber;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SubscriberArrayCopy;

    SubscriberArrayCopy.Length = ProviderChangedNotifies.Length;
    Index = 0;
    J0x21:

    // End:0x6E [Loop If]
    if(Index < SubscriberArrayCopy.Length)
    {
        SubscriberArrayCopy[Index] = ProviderChangedNotifies[Index];
        Index++;
        // [Loop Continue]
        goto J0x21;
    }
    Index = 0;
    J0x79:

    // End:0xD9 [Loop If]
    if(Index < SubscriberArrayCopy.Length)
    {
        Subscriber = SubscriberArrayCopy[Index];
        OnDataProviderPropertyChange(self, PropTag);
        Index++;
        // [Loop Continue]
        goto J0x79;
    }
    //return;    
}

final function AddPropertyNotificationChangeRequest()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAllowDuplicates[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private int NewIndex;
    local /*0x35EA0000-0x00000000*/ private bool bResult;

    NewIndex = ProviderChangedNotifies.Find(InDelegate);    
    // End:0x80
    if(bAllowDuplicates || NewIndex == -1)
    {
        NewIndex = ProviderChangedNotifies.Length;
        ProviderChangedNotifies[NewIndex] = InDelegate;
        bResult = true;
    }
    return bResult;
    //return ReturnValue;    
}

final function RemovePropertyNotificationChangeRequest()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private bool bResult;

    Index = ProviderChangedNotifies.Find(InDelegate);    
    J0x20:

    // End:0x77 [Loop If]
    if(Index != -1)
    {
        ProviderChangedNotifies.Remove(Index, 1);        
        bResult = true;
        Index = ProviderChangedNotifies.Find(InDelegate);        
        // [Loop Continue]
        goto J0x20;
    }
    return bResult;
    //return ReturnValue;    
}

final function ParseTagArrayDelimiter()
{
    local /*0x35EA0000-0x00000000*/ private name FieldName[25165825];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FieldNameString;
    local /*0x35EA0000-0x00000000*/ private int Result;

    FieldNameString = string(FieldName);
    Result = ParseArrayDelimiter(FieldNameString);
    FieldName = name(FieldNameString);
    return Result;
    //return ReturnValue;    
}
