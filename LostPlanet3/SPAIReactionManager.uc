class SPAIReactionManager extends Object within SPAIController;

struct native IntrinsicChannel
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name ChannelName;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class ChannelClass;

    structdefaultproperties
    {
        ChannelName="None"
        ChannelClass=none
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array IntrinsicChannels;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private map{VOID,VOID} ChannelMap[269090817];
var(__NotifyAccessLostDelegate__Delegate) /*0x051F0000-0x00000000*/ private class DefaultChannelClass[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array PollChannels;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAllReactionsSuppressed;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array BasicPerceptionChannels;

// Export USPAIReactionManager::execSubscribe(FFrame&, void* const)
native final function Subscribe()
{
    local /*0x03A30000-0x00000000*/ private @NULL Condition[8388609];
    local /*0x03A30000-0x00000000*/ private name ChannelName[8388609];


}

// Export USPAIReactionManager::execUnSubscribe(FFrame&, void* const)
native final function UnSubscribe()
{
    local /*0x03A30000-0x00000000*/ private @NULL Condition[8388609];
    local /*0x03A30000-0x00000000*/ private name ChannelName[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIReactionManager::execSuppressReactionsByType(FFrame&, void* const)
native final function SuppressReactionsByType()
{
    local /*0x03A30000-0x00000000*/ private class Type[8388609];
    local /*0x03A30000-0x00000000*/ private bool bDeepSearch[8388609];


}

// Export USPAIReactionManager::execSuppressAllChannels(FFrame&, void* const)
native final function SuppressAllChannels();

// Export USPAIReactionManager::execUnSuppressAllChannels(FFrame&, void* const)
native final function UnSuppressAllChannels();

// Export USPAIReactionManager::execSuppressChannel(FFrame&, void* const)
native final function SuppressChannel()
{
    local /*0x03A30000-0x00000000*/ private name ChannelName[8388609];


}

// Export USPAIReactionManager::execUnSuppressChannel(FFrame&, void* const)
native final function UnSuppressChannel()
{
    local /*0x03A30000-0x00000000*/ private name ChannelName[8388609];


}

// Export USPAIReactionManager::execSuppressReaction(FFrame&, void* const)
native final function SuppressReaction()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReactCondition[8388609];


}

// Export USPAIReactionManager::execUnSuppressReactionsByType(FFrame&, void* const)
native final function UnSuppressReactionsByType()
{
    local /*0x03A30000-0x00000000*/ private class Type[8388609];
    local /*0x03A30000-0x00000000*/ private bool bDeepSearch[8388609];


}

// Export USPAIReactionManager::execUnSuppressReaction(FFrame&, void* const)
native final function UnSuppressReaction()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReactCondition[8388609];


}

// Export USPAIReactionManager::execFindReactionByType(FFrame&, void* const)
native final function FindReactionByType()
{
    local /*0x03A30000-0x00000000*/ private class Type[8388609];
    local /*0x03A30000-0x00000000*/ private bool bDeepSearch[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIReactionManager::execNudgePerceptionChannel(FFrame&, void* const)
native function NudgePerceptionChannel()
{
    local /*0x03A30000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x03A30000-0x00000000*/ private byte Pt[8388609];


}

// Export USPAIReactionManager::execNudgeChannel(FFrame&, void* const)
native function NudgeChannel()
{
    local /*0x03A30000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x03A30000-0x00000000*/ private name ChannelName[8388609];


}

// Export USPAIReactionManager::execInitialize(FFrame&, void* const)
native function Initialize();

// Export USPAIReactionManager::execWipe(FFrame&, void* const)
native function Wipe();

// Export USPAIReactionManager::execGetChannelFor(FFrame&, void* const)
private native final function GetChannelFor()
{
    local /*0x03A30000-0x00000000*/ private name ChannelName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

final event SuppressAll()
{
    bAllReactionsSuppressed = true;
    //return;    
}

final event UnSuppressAll()
{
    bAllReactionsSuppressed = false;
    //return;    
}

function IncomingDamage()
{
    local /*0x03A30000-0x00000000*/ private @NULL DamageInstigator[8388609];
    local /*0x03A30000-0x00000000*/ private bool bDirectDamage[8388609];
    local /*0x03A30000-0x00000000*/ private class DamageType[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL HitInfo[9437185], LastInstigatorLoc;
    local /*0x03A30000-0x00000000*/ private int DamageAmt[9437185];
    local /*0x03A30000-0x00000000*/ private name ChannelName[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL DamageChannel;

    'Damage'
    DamageChannel = SPAIReactChan_Damage(GetChannelFor(ChannelName));
    // End:0x153
    if(DamageChannel != none)
    {
        DamageChannel.DamageInstigator = DamageInstigator;
        DamageChannel.bDirectDamage = bDirectDamage;
        DamageChannel.DamageType = DamageType;
        DamageChannel.HitInfo = HitInfo;
        DamageChannel.LastInstigatorLoc = LastInstigatorLoc;
        DamageChannel.DamageAmt = DamageAmt;
        NudgeChannel(DamageInstigator, ChannelName);
    }
    //return;    
}

defaultproperties
{
    IntrinsicChannels=/* Array type was not detected. */
    DefaultChannelClass=Class'SPAIReactChannel'
}