class GenericParamListStatEntry extends Object;

var(*) /*0x35EA0000-0x00000000*/ private @NULL StatEvent[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Writer[536870913];

// Export UGenericParamListStatEntry::execAddFloat(FFrame&, void* const)
native function AddFloat()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGenericParamListStatEntry::execAddInt(FFrame&, void* const)
native function AddInt()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGenericParamListStatEntry::execAddVector(FFrame&, void* const)
native function AddVector()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[8388609];


}

// Export UGenericParamListStatEntry::execAddString(FFrame&, void* const)
native function AddString()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[142606337];


}

// Export UGenericParamListStatEntry::execGetFloat(FFrame&, void* const)
native function GetFloat()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_Float[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGenericParamListStatEntry::execGetInt(FFrame&, void* const)
native function GetInt()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private int out_int[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGenericParamListStatEntry::execGetVector(FFrame&, void* const)
native function GetVector()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_vector[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGenericParamListStatEntry::execGetString(FFrame&, void* const)
native function GetString()
{
    local /*0x35EA0000-0x00000000*/ private name ParamName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string out_string[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGenericParamListStatEntry::execCommitToDisk(FFrame&, void* const)
native function CommitToDisk();
