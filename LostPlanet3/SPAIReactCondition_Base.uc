class SPAIReactCondition_Base extends Object within SPAIController
    abstract;

var(__NotifyAccessLostDelegate__Delegate) /*0x051E0000-0x00000000*/ private editfixedsize array AutoSubscribeChannels[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array SubscribedChannels;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bSuppressed;
var(__NotifyAccessLostDelegate__Delegate) /*0x051E0000-0x00000000*/ private bool bAlwaysNotify[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x051E0000-0x00000000*/ private bool bActivateWhenBasedOnInterpActor[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x051E0000-0x00000000*/ private bool bActivateWhenBasedOnPawn[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x051E0000-0x00000000*/ private bool bOneTimeOnly[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x051E0000-0x00000000*/ private float TimerInterval[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimerLastActivationTime;

// Export USPAIReactCondition_Base::execSubscribeToMyChannels(FFrame&, void* const)
private native final function SubscribeToMyChannels();

// Export USPAIReactCondition_Base::execUnsubscribeAll(FFrame&, void* const)
native final function UnsubscribeAll();

event Initialize()
{
    SubscribeToMyChannels();
    //return;    
}

event Suppress()
{
    bSuppressed = true;
    //return;    
}

event UnSuppress()
{
    bSuppressed = false;
    //return;    
}

event ShouldActivate()
{
    local /*0x03A30000-0x00000000*/ private @NULL EventInstigator[8388609], OriginatingChannel;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event Activate()
{
    local /*0x03A30000-0x00000000*/ private @NULL EventInstigator[8388609], OriginatingChannel;

    // End:0x17
    if(bOneTimeOnly)
    {
        UnsubscribeAll();
    }
    //return;    
}

defaultproperties
{
    bActivateWhenBasedOnInterpActor=true
    TimerLastActivationTime=-1.0000000
}