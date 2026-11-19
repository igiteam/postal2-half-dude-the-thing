class PlatformInterfaceWebResponse extends Object
    transient;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string OriginalURL;
var(*) /*0x35EA0000-0x00000000*/ private int ResponseCode;
var(*) /*0x35EA0000-0x00000000*/ private int Tag;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Headers[268435457];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string StringResponse;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BinaryResponse;

// Export UPlatformInterfaceWebResponse::execGetNumHeaders(FFrame&, void* const)
native function GetNumHeaders()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UPlatformInterfaceWebResponse::execGetHeader(FFrame&, void* const)
native function GetHeader()
{
    local /*0x35EA0000-0x00000000*/ private int HeaderIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Header[25165825], Value;


}

// Export UPlatformInterfaceWebResponse::execGetHeaderValue(FFrame&, void* const)
native function GetHeaderValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string HeaderName[8388609], ReturnValue;


}
