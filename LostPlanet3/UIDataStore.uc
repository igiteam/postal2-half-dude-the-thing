class UIDataStore extends UIDataProvider
    abstract
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private name Tag;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RefreshSubscriberNotifies;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnDataStoreValueUpdated__Delegate;

delegate OnDataStoreValueUpdated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SourceDataStore[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bValuesInvalidated[8388609];
    local /*0x35EA0000-0x00000000*/ private name PropertyTag[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SourceProvider[8388609];
    local /*0x35EA0000-0x00000000*/ private int ArrayIndex[8388609];

    //return;    
}

event Registered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609];

    //return;    
}

event Unregistered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609];

    //return;    
}

event SubscriberAttached()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Subscriber[8388609];
    local /*0x35EA0000-0x00000000*/ private int SubscriberNotifyIndex;

    // End:0xC0
    if(NotEqual_InterfaceInterface(Subscriber, UIDataStoreSubscriber(none)))
    {
        SubscriberNotifyIndex = RefreshSubscriberNotifies.Find(Subscriber.NotifyDataStoreValueUpdated);        
        // End:0xC0
        if(SubscriberNotifyIndex == -1)
        {
            SubscriberNotifyIndex = RefreshSubscriberNotifies.Length;
            RefreshSubscriberNotifies[SubscriberNotifyIndex] = Subscriber.NotifyDataStoreValueUpdated;
        }
    }
    //return;    
}

event SubscriberDetached()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Subscriber[8388609];
    local /*0x35EA0000-0x00000000*/ private int SubscriberNotifyIndex;

    // End:0x86
    if(NotEqual_InterfaceInterface(Subscriber, UIDataStoreSubscriber(none)))
    {
        SubscriberNotifyIndex = RefreshSubscriberNotifies.Find(Subscriber.NotifyDataStoreValueUpdated);        
        // End:0x86
        if(SubscriberNotifyIndex != -1)
        {
            RefreshSubscriberNotifies.Remove(SubscriberNotifyIndex, 1);            
        }
    }
    //return;    
}

function NotifyGameSessionEnded()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

final event RefreshSubscribers()
{
    local /*0x35EA0000-0x00000000*/ private name PropertyTag[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bInvalidateValues[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL SourceProvider[9437185];
    local /*0x35EA0000-0x00000000*/ private int ArrayIndex[9437185], Idx;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Subscriber;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SubscriberArrayCopy;

    true    
    -1
    SubscriberArrayCopy.Length = RefreshSubscriberNotifies.Length;
    Idx = 0;
    J0x30:

    // End:0x7D [Loop If]
    if(Idx < SubscriberArrayCopy.Length)
    {
        SubscriberArrayCopy[Idx] = RefreshSubscriberNotifies[Idx];
        Idx++;
        // [Loop Continue]
        goto J0x30;
    }
    Idx = 0;
    J0x88:

    // End:0x104 [Loop If]
    if(Idx < SubscriberArrayCopy.Length)
    {
        Subscriber = SubscriberArrayCopy[Idx];
        OnDataStoreValueUpdated(self, bInvalidateValues, PropertyTag, SourceProvider, ArrayIndex);
        Idx++;
        // [Loop Continue]
        goto J0x88;
    }
    //return;    
}

// Export UUIDataStore::execOnCommit(FFrame&, void* const)
native function OnCommit();

final function GetDataStoreClient()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Class'UIInteraction'.static.GetDataStoreClient();
    //return ReturnValue;    
}
