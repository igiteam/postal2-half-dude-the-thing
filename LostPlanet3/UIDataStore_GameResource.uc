class UIDataStore_GameResource extends UIDataStore
    transient
    config(Game)
    hidecategories(Object,UIRoot)
    implements(UIListElementProvider);

struct native GameResourceDataProvider
{
    var(*) /*0x35EA0000-0x00000000*/ private name ProviderTag[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ProviderClassName[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool bExpandProviders[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private class ProviderClass[536870913];

    structdefaultproperties
    {
        ProviderTag="None"
        ProviderClassName=""
        bExpandProviders=false
        ProviderClass=none
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IUIListElementProvider[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ElementProviderTypes[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ListElementProviders[805437441];

// Export UUIDataStore_GameResource::execFindProviderTypeIndex(FFrame&, void* const)
native final function FindProviderTypeIndex()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UUIDataStore_GameResource::execGenerateProviderAccessTag(FFrame&, void* const)
native final function GenerateProviderAccessTag()
{
    local /*0x35EA0000-0x00000000*/ private int ProviderIndex[8388609], InstanceIndex;
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export UUIDataStore_GameResource::execGetProviderCount(FFrame&, void* const)
native function GetProviderCount()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UUIDataStore_GameResource::execGetResourceProviders(FFrame&, void* const)
native final function GetResourceProviders()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Providers[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UUIDataStore_GameResource::execGetResourceProviderFields(FFrame&, void* const)
native final function GetResourceProviderFields()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ProviderFieldTags[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UUIDataStore_GameResource::execGetProviderFieldValue(FFrame&, void* const)
native final function GetProviderFieldValue()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609], SearchField;
    local /*0x35EA0000-0x00000000*/ private int ProviderIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL out_FieldValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UUIDataStore_GameResource::execFindProviderIndexByFieldValue(FFrame&, void* const)
native final function FindProviderIndexByFieldValue()
{
    local /*0x35EA0000-0x00000000*/ private name ProviderTag[8388609], SearchField;
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL ValueToSearchFor[25296897];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

defaultproperties
{
    ElementProviderTypes=/* Array type was not detected. */
    Tag="GameResources"
}