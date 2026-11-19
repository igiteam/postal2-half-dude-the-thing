class UIDataStore_DynamicResource extends UIDataStore
    transient
    config(Game)
    hidecategories(Object,UIRoot);

struct native DynamicResourceProviderDefinition
{
    var(*) /*0x35EA0000-0x00000000*/ private name ProviderTag[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ProviderClassName[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private class ProviderClass[536870913];

    structdefaultproperties
    {
        ProviderTag="None"
        ProviderClassName=""
        ProviderClass=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL ProfileProvider[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameResourceDataStore[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ResourceProviderDefinitions[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ResourceProviders[805437441];

// Export UUIDataStore_DynamicResource::execFindProviderTypeIndex(FFrame&, void* const)
native final function FindProviderTypeIndex()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UUIDataStore_DynamicResource::execGetResourceProviders(FFrame&, void* const)
native final function GetResourceProviders()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Providers[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UUIDataStore_DynamicResource::execOnLoginChange(FFrame&, void* const)
native final function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];


}

event Registered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609], OnlineSub, PlayerInterface, PlayerProfileDS;

    super.Registered(PlayerOwner);
    PlayerProfileDS = UIDataStore_OnlinePlayerData(Class'UIRoot'.static.StaticResolveDataStore(Class'UIDataStore_OnlinePlayerData'.default.Tag, PlayerOwner));
    // End:0xA3
    if(PlayerProfileDS != none)
    {
        ProfileProvider = PlayerProfileDS.ProfileProvider;
    }
    GameResourceDataStore = UIDataStore_GameResource(Class'UIRoot'.static.StaticResolveDataStore(Class'UIDataStore_GameResource'.default.Tag, PlayerOwner));
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x1AD
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0x1AD
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
        }
    }
    //return;    
}

event Unregistered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609];
    local /*0x35EA0000-0x00000000*/ private int TypeIndex, ProviderIndex;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ProviderInstances;
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    super.Unregistered(PlayerOwner);
    GameResourceDataStore = none;
    TypeIndex = 0;
    J0x29:

    // End:0xE5 [Loop If]
    if(TypeIndex < ResourceProviderDefinitions.Length)
    {
        // End:0xD7
        if(GetResourceProviders(ResourceProviderDefinitions[TypeIndex].ProviderTag, ProviderInstances))
        {
            ProviderIndex = 0;
            J0x88:

            // End:0xD7 [Loop If]
            if(ProviderIndex < ProviderInstances.Length)
            {
                ProviderInstances[ProviderIndex].ClearProviderReferences();
                ProviderIndex++;
                // [Loop Continue]
                goto J0x88;
            }
        }
        TypeIndex++;
        // [Loop Continue]
        goto J0x29;
    }
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x196
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0x196
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
        }
    }
    //return;    
}

defaultproperties
{
    Tag="DynamicGameResource"
}