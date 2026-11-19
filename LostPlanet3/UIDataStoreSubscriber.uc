interface UIDataStoreSubscriber extends Interface
    abstract;

// Export UUIDataStoreSubscriber::execSetDataStoreBinding(FFrame&, void* const)
native function SetDataStoreBinding()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MarkupText[8388609];
    local /*0x35EA0000-0x00000000*/ private int BindingIndex[9437185];

    -1                
}

// Export UUIDataStoreSubscriber::execGetDataStoreBinding(FFrame&, void* const)
native function GetDataStoreBinding()
{
    local /*0x35EA0000-0x00000000*/ private int BindingIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    -1            
}

// Export UUIDataStoreSubscriber::execRefreshSubscriberValue(FFrame&, void* const)
native function RefreshSubscriberValue()
{
    local /*0x35EA0000-0x00000000*/ private int BindingIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1            
}

// Export UUIDataStoreSubscriber::execNotifyDataStoreValueUpdated(FFrame&, void* const)
native function NotifyDataStoreValueUpdated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SourceDataStore[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bValuesInvalidated[8388609];
    local /*0x35EA0000-0x00000000*/ private name PropertyTag[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SourceProvider[8388609];
    local /*0x35EA0000-0x00000000*/ private int ArrayIndex[8388609];


}

// Export UUIDataStoreSubscriber::execGetBoundDataStores(FFrame&, void* const)
native function GetBoundDataStores()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_BoundDataStores[25165825];


}

// Export UUIDataStoreSubscriber::execClearBoundDataStores(FFrame&, void* const)
native function ClearBoundDataStores();
