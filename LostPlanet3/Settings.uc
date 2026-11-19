class Settings extends Object
    abstract;

enum EOnlineDataAdvertisementType
{
    ODAT_DontAdvertise,             // 0
    ODAT_OnlineService,             // 1
    ODAT_QoS,                       // 2
    ODAT_OnlineServiceAndQoS,       // 3
    ODAT_MAX                        // 4
};

enum ESettingsDataType
{
    SDT_Empty,                      // 0
    SDT_Int32,                      // 1
    SDT_Int64,                      // 2
    SDT_Double,                     // 3
    SDT_String,                     // 4
    SDT_Float,                      // 5
    SDT_Blob,                       // 6
    SDT_DateTime,                   // 7
    SDT_MAX                         // 8
};

enum EPropertyValueMappingType
{
    PVMT_RawValue,                  // 0
    PVMT_PredefinedValues,          // 1
    PVMT_Ranged,                    // 2
    PVMT_IdMapped,                  // 3
    PVMT_MAX                        // 4
};

struct native LocalizedStringSetting
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id;
    var(*) /*0x35EA0000-0x00000000*/ private int ValueIndex;
    var(*) /*0x35EA0000-0x00000000*/ private byte AdvertisementType;

    structdefaultproperties
    {
        Id=0
        ValueIndex=0
        AdvertisementType=EOnlineDataAdvertisementType.ODAT_DontAdvertise
    }
};

struct native SettingsData
{
    var(*) /*0x35EA0000-0x00000000*/ private byte Type[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int Value1[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Value2[805437441];

    structdefaultproperties
    {
        Type=ESettingsDataType.SDT_Empty
        Value1=0
    }
};

struct native SettingsProperty
{
    var(*) /*0x35EA0000-0x00000000*/ private int PropertyId;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Data;
    var(*) /*0x35EA0000-0x00000000*/ private byte AdvertisementType;

    structdefaultproperties
    {
        PropertyId=0
        Data=(Type=ESettingsDataType.SDT_Empty,Value1=0)
        AdvertisementType=EOnlineDataAdvertisementType.ODAT_DontAdvertise
    }
};

struct native StringIdToStringMapping
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id[131073];
    var(*) /*0x35EA0000-0x00000000*/ private name Name;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsWildcard[131073];

    structdefaultproperties
    {
        Id=0
        Name="None"
        bIsWildcard=false
    }
};

struct native LocalizedStringSettingMetaData
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id[131073];
    var(*) /*0x35EA0000-0x00000000*/ private name Name[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ColumnHeaderText;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ValueMappings[131073];

    structdefaultproperties
    {
        Id=0
        Name="None"
        ColumnHeaderText=""
        ValueMappings=none
    }
};

struct native IdToStringMapping
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id[131073];
    var(*) /*0x35EA0000-0x00000000*/ private name Name;

    structdefaultproperties
    {
        Id=0
        Name="None"
    }
};

struct native SettingsPropertyPropertyMetaData
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id[131073];
    var(*) /*0x35EA0000-0x00000000*/ private name Name[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ColumnHeaderText;
    var(*) /*0x35EA0000-0x00000000*/ private byte MappingType[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ValueMappings[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PredefinedValues[131073];
    var(*) /*0x35EA0000-0x00000000*/ private float MinVal[131073];
    var(*) /*0x35EA0000-0x00000000*/ private float MaxVal[131073];
    var(*) /*0x35EA0000-0x00000000*/ private float RangeIncrement[131073];

    structdefaultproperties
    {
        Id=0
        Name="None"
        ColumnHeaderText=""
        MappingType=EPropertyValueMappingType.PVMT_RawValue
        ValueMappings=none
        PredefinedValues=none
        MinVal=0.0000000
        MaxVal=0.0000000
        RangeIncrement=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LocalizedSettings;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Properties;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LocalizedSettingsMappings;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PropertyMappings;

// Export USettings::execSetSettingsDataFloat(FFrame&, void* const)
native static function SetSettingsDataFloat()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private float InFloat[8388609];


}

// Export USettings::execSetSettingsDataInt(FFrame&, void* const)
native static function SetSettingsDataInt()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private int InInt[8388609];


}

// Export USettings::execSetSettingsDataDateTime(FFrame&, void* const)
native static function SetSettingsDataDateTime()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private int InInt1[8388609], InInt2;


}

// Export USettings::execSetSettingsDataBlob(FFrame&, void* const)
native static function SetSettingsDataBlob()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array InBlob[25165825];


}

// Export USettings::execSetSettingsData(FFrame&, void* const)
native static function SetSettingsData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825], Data2Copy;


}

// Export USettings::execEmptySettingsData(FFrame&, void* const)
native static function EmptySettingsData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];


}

// Export USettings::execGetSettingsDataFloat(FFrame&, void* const)
native static function GetSettingsDataFloat()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USettings::execGetSettingsDataInt(FFrame&, void* const)
native static function GetSettingsDataInt()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USettings::execGetSettingsDataBlob(FFrame&, void* const)
native static function GetSettingsDataBlob()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutBlob[25165825];


}

// Export USettings::execGetSettingsDataDateTime(FFrame&, void* const)
native static function GetSettingsDataDateTime()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Data[25165825];
    local /*0x35EA0000-0x00000000*/ private int OutInt1[25165825], OutInt2;


}

// Export USettings::execSetStringSettingValue(FFrame&, void* const)
native function SetStringSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609], ValueIndex;
    local /*0x35EA0000-0x00000000*/ private bool bShouldAutoAdd[9437185];


}

// Export USettings::execGetStringSettingValue(FFrame&, void* const)
native function GetStringSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609], ValueIndex;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execIncrementStringSettingValue(FFrame&, void* const)
native function IncrementStringSettingValue()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609], Direction;
    local /*0x35EA0000-0x00000000*/ private bool bShouldWrap[8388609], ReturnValue;


}

// Export USettings::execGetStringSettingValueNames(FFrame&, void* const)
native function GetStringSettingValueNames()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Values[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execSetStringSettingValueByName(FFrame&, void* const)
native function SetStringSettingValueByName()
{
    local /*0x35EA0000-0x00000000*/ private name StringSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ValueIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bShouldAutoAdd[8388609];


}

// Export USettings::execGetStringSettingValueByName(FFrame&, void* const)
native function GetStringSettingValueByName()
{
    local /*0x35EA0000-0x00000000*/ private name StringSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ValueIndex[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetStringSettingId(FFrame&, void* const)
native function GetStringSettingId()
{
    local /*0x35EA0000-0x00000000*/ private name StringSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetStringSettingName(FFrame&, void* const)
native function GetStringSettingName()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export USettings::execGetStringSettingColumnHeader(FFrame&, void* const)
native function GetStringSettingColumnHeader()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export USettings::execIsWildcardStringSetting(FFrame&, void* const)
native function IsWildcardStringSetting()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetStringSettingValueName(FFrame&, void* const)
native function GetStringSettingValueName()
{
    local /*0x35EA0000-0x00000000*/ private int StringSettingId[8388609], ValueIndex;
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export USettings::execGetStringSettingValueNameByName(FFrame&, void* const)
native function GetStringSettingValueNameByName()
{
    local /*0x35EA0000-0x00000000*/ private name StringSettingName[8388609], ReturnValue;


}

// Export USettings::execSetStringSettingValueFromStringByName(FFrame&, void* const)
native function SetStringSettingValueFromStringByName()
{
    local /*0x35EA0000-0x00000000*/ private name StringSettingName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewValue[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetPropertyId(FFrame&, void* const)
native function GetPropertyId()
{
    local /*0x35EA0000-0x00000000*/ private name PropertyName[8388609];
    local /*0x35EA0000-0x00000000*/ private int PropertyId[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetPropertyName(FFrame&, void* const)
native function GetPropertyName()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export USettings::execGetPropertyColumnHeader(FFrame&, void* const)
native function GetPropertyColumnHeader()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export USettings::execGetPropertyAsString(FFrame&, void* const)
native function GetPropertyAsString()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export USettings::execGetPropertyAsStringByName(FFrame&, void* const)
native function GetPropertyAsStringByName()
{
    local /*0x35EA0000-0x00000000*/ private name PropertyName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export USettings::execSetPropertyFromStringByName(FFrame&, void* const)
native function SetPropertyFromStringByName()
{
    local /*0x35EA0000-0x00000000*/ private name PropertyName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewValue[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execSetFloatProperty(FFrame&, void* const)
native function SetFloatProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export USettings::execGetFloatProperty(FFrame&, void* const)
native function GetFloatProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execSetIntProperty(FFrame&, void* const)
native function SetIntProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609], Value;


}

// Export USettings::execGetIntProperty(FFrame&, void* const)
native function GetIntProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609], Value;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execSetStringProperty(FFrame&, void* const)
native function SetStringProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];


}

// Export USettings::execGetStringProperty(FFrame&, void* const)
native function GetStringProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execSetPropertyValueId(FFrame&, void* const)
native function SetPropertyValueId()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609], ValueId;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetPropertyValueId(FFrame&, void* const)
native function GetPropertyValueId()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609], ValueId;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetPropertyType(FFrame&, void* const)
native function GetPropertyType()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export USettings::execUpdateStringSettings(FFrame&, void* const)
native function UpdateStringSettings()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Settings[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bShouldAddIfMissing[9437185];

    true                
}

// Export USettings::execUpdateProperties(FFrame&, void* const)
native function UpdateProperties()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Props[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bShouldAddIfMissing[9437185];

    true                
}

// Export USettings::execHasProperty(FFrame&, void* const)
native function HasProperty()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execHasStringSetting(FFrame&, void* const)
native function HasStringSetting()
{
    local /*0x35EA0000-0x00000000*/ private int SettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetPropertyMappingType(FFrame&, void* const)
native function GetPropertyMappingType()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OutType[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetPropertyRange(FFrame&, void* const)
native function GetPropertyRange()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutMinValue[25165825], OutMaxValue, RangeIncrement;
    local /*0x35EA0000-0x00000000*/ private byte bFormatAsInt[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execSetRangedPropertyValue(FFrame&, void* const)
native function SetRangedPropertyValue()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewValue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetRangedPropertyValue(FFrame&, void* const)
native function GetRangedPropertyValue()
{
    local /*0x35EA0000-0x00000000*/ private int PropertyId[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USettings::execGetQoSAdvertisedProperties(FFrame&, void* const)
native function GetQoSAdvertisedProperties()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array QoSProps[25165825];


}

// Export USettings::execGetQoSAdvertisedStringSettings(FFrame&, void* const)
native function GetQoSAdvertisedStringSettings()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array QoSSettings[25165825];


}

// Export USettings::execAppendDataBindingsToURL(FFrame&, void* const)
native function AppendDataBindingsToURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[25165825];


}

// Export USettings::execAppendPropertiesToURL(FFrame&, void* const)
native function AppendPropertiesToURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[25165825];


}

// Export USettings::execAppendContextsToURL(FFrame&, void* const)
native function AppendContextsToURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[25165825];


}

// Export USettings::execBuildURL(FFrame&, void* const)
native function BuildURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[25165825];


}

// Export USettings::execUpdateFromURL(FFrame&, void* const)
native function UpdateFromURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[25296897];
    local /*0x35EA0000-0x00000000*/ private @NULL Game[8388609];


}
