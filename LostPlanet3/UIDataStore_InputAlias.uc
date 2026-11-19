class UIDataStore_InputAlias extends UIDataStore_StringBase
    transient
    config(Input)
    hidecategories(Object,UIRoot);

struct native UIInputKeyData
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InputKeyData[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ButtonFontMarkupString[1073741825];

    structdefaultproperties
    {
        InputKeyData=(InputKeyName="None",ModifierKeyFlags=56)
        ButtonFontMarkupString=""
    }
};

struct native UIDataStoreInputAlias
{
    var(*) /*0x35EA0000-0x00000000*/ private name AliasName[1073741825];
    var(*_664666111) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL PlatformInputKeys[1073741827];

    structdefaultproperties
    {
        AliasName="None"
        PlatformInputKeys[0]=(InputKeyData=(InputKeyName="None",ModifierKeyFlags=56),ButtonFontMarkupString="")
        PlatformInputKeys[1]=(InputKeyData=(InputKeyName="None",ModifierKeyFlags=56),ButtonFontMarkupString="")
        PlatformInputKeys[2]=(InputKeyData=(InputKeyName="None",ModifierKeyFlags=56),ButtonFontMarkupString="")
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InputAliases[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} InputAliasLookupMap[805437441];

// Export UUIDataStore_InputAlias::execGetAliasFontMarkup(FFrame&, void* const)
native final function GetAliasFontMarkup()
{
    local /*0x35EA0000-0x00000000*/ private name DesiredAlias[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OverridePlatform[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    3                
}

// Export UUIDataStore_InputAlias::execGetAliasFontMarkupByIndex(FFrame&, void* const)
native final function GetAliasFontMarkupByIndex()
{
    local /*0x35EA0000-0x00000000*/ private int AliasIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OverridePlatform[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    3                
}

// Export UUIDataStore_InputAlias::execGetAliasInputKeyName(FFrame&, void* const)
native final function GetAliasInputKeyName()
{
    local /*0x35EA0000-0x00000000*/ private name DesiredAlias[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OverridePlatform[9437185];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];

    3                
}

// Export UUIDataStore_InputAlias::execGetAliasInputKeyNameByIndex(FFrame&, void* const)
native final function GetAliasInputKeyNameByIndex()
{
    local /*0x35EA0000-0x00000000*/ private int AliasIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OverridePlatform[9437185];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];

    3                
}

// Export UUIDataStore_InputAlias::execGetAliasInputKeyData(FFrame&, void* const)
native final function GetAliasInputKeyData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_InputKeyData[25165825];
    local /*0x35EA0000-0x00000000*/ private name DesiredAlias[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OverridePlatform[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    3                    
}

// Export UUIDataStore_InputAlias::execGetAliasInputKeyDataByIndex(FFrame&, void* const)
native final function GetAliasInputKeyDataByIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_InputKeyData[25165825];
    local /*0x35EA0000-0x00000000*/ private int AliasIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OverridePlatform[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    3                    
}

// Export UUIDataStore_InputAlias::execFindInputAliasIndex(FFrame&, void* const)
native final function FindInputAliasIndex()
{
    local /*0x35EA0000-0x00000000*/ private name DesiredAlias[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UUIDataStore_InputAlias::execHasAliasMappingForPlatform(FFrame&, void* const)
native final function HasAliasMappingForPlatform()
{
    local /*0x35EA0000-0x00000000*/ private name DesiredAlias[8388609];
    local /*0x35EA0000-0x00000000*/ private byte DesiredPlatform[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    InputAliases=/* Array type was not detected. */
    Tag="ButtonCallouts"
}