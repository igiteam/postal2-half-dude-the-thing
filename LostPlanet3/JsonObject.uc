class JsonObject extends Object;

var(*) /*0x35EA0000-0x00000000*/ private @NULL ValueMap[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ObjectMap[268435457];
var(*) /*0x35EA0000-0x00000000*/ private array ValueArray[268435457];
var(*) /*0x35EA0000-0x00000000*/ private array ObjectArray[268435457];

// Export UJsonObject::execGetObject(FFrame&, void* const)
native function GetObject()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UJsonObject::execGetStringValue(FFrame&, void* const)
native function GetStringValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681], ReturnValue;


}

function GetIntValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value;

    Value = Mid(GetStringValue(Key), 2);
    return int(Value);
    //return ReturnValue;    
}

function GetFloatValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value;

    Value = Mid(GetStringValue(Key), 2);
    return float(Value);
    //return ReturnValue;    
}

function GetBoolValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value;

    Value = Mid(GetStringValue(Key), 2);
    return bool(Value);
    //return ReturnValue;    
}

// Export UJsonObject::execSetObject(FFrame&, void* const)
native function SetObject()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL Object[8388609];


}

// Export UJsonObject::execSetStringValue(FFrame&, void* const)
native function SetStringValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681], Value;


}

function SetIntValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];

    SetStringValue(Key, "\\#" $ string(Value));
    //return;    
}

function SetFloatValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];

    SetStringValue(Key, "\\#" $ string(Value));
    //return;    
}

function SetBoolValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8519681];
    local /*0x35EA0000-0x00000000*/ private bool Value[8388609];

    SetStringValue(Key, "\\#" $ ((Value) ? "true" : "false"));
    //return;    
}

// Export UJsonObject::execEncodeJson(FFrame&, void* const)
native static function EncodeJson()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Root[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UJsonObject::execDecodeJson(FFrame&, void* const)
native static function DecodeJson()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Str[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}
