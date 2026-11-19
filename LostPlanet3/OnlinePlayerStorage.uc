class OnlinePlayerStorage extends Object;

enum EOnlineProfilePropertyOwner
{
    OPPO_None,                      // 0
    OPPO_OnlineService,             // 1
    OPPO_Game,                      // 2
    OPPO_MAX                        // 3
};

enum EOnlinePlayerStorageAsyncState
{
    OPAS_NotStarted,                // 0
    OPAS_Read,                      // 1
    OPAS_Write,                     // 2
    OPAS_Finished,                  // 3
    OPAS_MAX                        // 4
};

struct native OnlineProfileSetting
{
    var(*) /*0x35EA0000-0x00000000*/ private byte Owner;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ProfileSetting;

    structdefaultproperties
    {
        Owner=EOnlineProfilePropertyOwner.OPPO_None
        ProfileSetting=(PropertyId=0,Data=(Type=ESettingsDataType.SDT_Empty,Value1=0),AdvertisementType=EOnlineDataAdvertisementType.ODAT_DontAdvertise)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private int VersionNumber[131073];
var(*) /*0x35EA0000-0x00000000*/ private int VersionSettingsId[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SaveCountSettingId[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ProfileSettings;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ProfileMappings;
var(*) /*0x35EA0000-0x00000000*/ private byte AsyncState[131073];
var(*) /*0x35EA0000-0x00000000*/ private int DeviceID;

// Export UOnlinePlayerStorage::execGetProfileSettingId(FFrame&, void* const)
native function GetProfileSettingId()
{
    local /*0x35EA0000-0x00000000*/ private name ProfileSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingName(FFrame&, void* const)
native function GetProfileSettingName()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingColumnHeader(FFrame&, void* const)
native function GetProfileSettingColumnHeader()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execFindProfileSettingIndex(FFrame&, void* const)
native final function FindProfileSettingIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], ReturnValue;


}

// Export UOnlinePlayerStorage::execFindProfileMappingIndex(FFrame&, void* const)
native final function FindProfileMappingIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], ReturnValue;


}

// Export UOnlinePlayerStorage::execFindProfileMappingIndexByName(FFrame&, void* const)
native final function FindProfileMappingIndexByName()
{
    local /*0x35EA0000-0x00000000*/ private name ProfileSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execFindDefaultProfileMappingIndexByName(FFrame&, void* const)
native static final function FindDefaultProfileMappingIndexByName()
{
    local /*0x35EA0000-0x00000000*/ private name ProfileSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execIsProfileSettingIdMapped(FFrame&, void* const)
native function IsProfileSettingIdMapped()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValue(FFrame&, void* const)
native function GetProfileSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[25165825];
    local /*0x35EA0000-0x00000000*/ private int ValueMapID[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1                    
}

// Export UOnlinePlayerStorage::execGetProfileSettingValueName(FFrame&, void* const)
native function GetProfileSettingValueName()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValues(FFrame&, void* const)
native function GetProfileSettingValues()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Values[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValueByName(FFrame&, void* const)
native function GetProfileSettingValueByName()
{
    local /*0x35EA0000-0x00000000*/ private name ProfileSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetProfileSettingValueByName(FFrame&, void* const)
native function SetProfileSettingValueByName()
{
    local /*0x35EA0000-0x00000000*/ private name ProfileSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewValue[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetProfileSettingValue(FFrame&, void* const)
native function SetProfileSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewValue[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValueId(FFrame&, void* const)
native function GetProfileSettingValueId()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], ValueId, ListIndex;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValueFromListIndex(FFrame&, void* const)
native function GetProfileSettingValueFromListIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], ListIndex, Value;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValueInt(FFrame&, void* const)
native function GetProfileSettingValueInt()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], Value;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingValueFloat(FFrame&, void* const)
native function GetProfileSettingValueFloat()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetProfileSettingValueId(FFrame&, void* const)
native function SetProfileSettingValueId()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], Value;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetProfileSettingValueInt(FFrame&, void* const)
native function SetProfileSettingValueInt()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], Value;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetProfileSettingValueFloat(FFrame&, void* const)
native function SetProfileSettingValueFloat()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingMappingType(FFrame&, void* const)
native function GetProfileSettingMappingType()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileId[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OutType[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingMappingIds(FFrame&, void* const)
native static function GetProfileSettingMappingIds()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Ids[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetProfileSettingRange(FFrame&, void* const)
native function GetProfileSettingRange()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileId[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutMinValue[25165825], OutMaxValue, RangeIncrement;
    local /*0x35EA0000-0x00000000*/ private byte bFormatAsInt[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetRangedProfileSettingValue(FFrame&, void* const)
native function SetRangedProfileSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileId[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewValue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execGetRangedProfileSettingValue(FFrame&, void* const)
native function GetRangedProfileSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileId[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execAddSettingInt(FFrame&, void* const)
native function AddSettingInt()
{
    local /*0x35EA0000-0x00000000*/ private int SettingId[8388609];


}

// Export UOnlinePlayerStorage::execAddSettingFloat(FFrame&, void* const)
native function AddSettingFloat()
{
    local /*0x35EA0000-0x00000000*/ private int SettingId[8388609];


}

// Export UOnlinePlayerStorage::execSetToDefaults(FFrame&, void* const)
native event SetToDefaults();

// Export UOnlinePlayerStorage::execAppendVersionToSettings(FFrame&, void* const)
native function AppendVersionToSettings();

// Export UOnlinePlayerStorage::execGetVersionNumber(FFrame&, void* const)
native function GetVersionNumber()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UOnlinePlayerStorage::execSetDefaultVersionNumber(FFrame&, void* const)
native function SetDefaultVersionNumber();

defaultproperties
{
    VersionNumber=-1
    SaveCountSettingId=1
    DeviceID=-1
}