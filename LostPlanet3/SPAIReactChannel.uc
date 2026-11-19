class SPAIReactChannel extends Object;

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name ChannelName;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bNeedsPoll[131073];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bChannelSuppressed;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array Reactions;

// Export USPAIReactChannel::execSubscribe(FFrame&, void* const)
native function Subscribe()
{
    local /*0x03A30000-0x00000000*/ private @NULL Condition[8388609];


}

// Export USPAIReactChannel::execUnSubscribe(FFrame&, void* const)
native function UnSubscribe()
{
    local /*0x03A30000-0x00000000*/ private @NULL Condition[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIReactChannel::execSuppressReactionByType(FFrame&, void* const)
native function SuppressReactionByType()
{
    local /*0x03A30000-0x00000000*/ private class Type[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIReactChannel::execUnSuppressReactionByType(FFrame&, void* const)
native function UnSuppressReactionByType()
{
    local /*0x03A30000-0x00000000*/ private class Type[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIReactChannel::execFindReactionByType(FFrame&, void* const)
native final function FindReactionByType()
{
    local /*0x03A30000-0x00000000*/ private class Type[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIReactChannel::execNudgeChannel(FFrame&, void* const)
native function NudgeChannel()
{
    local /*0x03A30000-0x00000000*/ private @NULL Instigator[8388609];


}

event Suppress()
{
    bChannelSuppressed = true;
    //return;    
}

event UnSuppress()
{
    bChannelSuppressed = false;
    //return;    
}
