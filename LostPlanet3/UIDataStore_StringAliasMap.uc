class UIDataStore_StringAliasMap extends UIDataStore_StringBase
    transient
    config(Game)
    hidecategories(Object,UIRoot);

struct native UIMenuInputMap
{
    var(*) /*0x35EA0000-0x00000000*/ private name FieldName;
    var(*) /*0x35EA0000-0x00000000*/ private name Set;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MappedText;

    structdefaultproperties
    {
        FieldName="None"
        Set="None"
        MappedText=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MenuInputMapArray[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MenuInputSets[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int PlayerIndex[537001985];

// Export UUIDataStore_StringAliasMap::execGetPlayerOwner(FFrame&, void* const)
native final function GetPlayerOwner()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UUIDataStore_StringAliasMap::execFindMappingWithFieldName(FFrame&, void* const)
native final function FindMappingWithFieldName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FieldName[9437185], SetName;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    ""
    ""                
}

// Export UUIDataStore_StringAliasMap::execGetStringWithFieldName(FFrame&, void* const)
native function GetStringWithFieldName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FieldName[8388609], MappedString;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

defaultproperties
{
    PlayerIndex=-1
    Tag="StringAliasMap"
}