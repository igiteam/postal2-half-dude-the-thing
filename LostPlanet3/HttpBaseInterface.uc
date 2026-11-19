class HttpBaseInterface extends Object
    abstract;

// Export UHttpBaseInterface::execGetHeader(FFrame&, void* const)
native function GetHeader()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string HeaderName[8388609], ReturnValue;


}

// Export UHttpBaseInterface::execGetHeaders(FFrame&, void* const)
native function GetHeaders()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ReturnValue[92274689];


}

// Export UHttpBaseInterface::execGetURLParameter(FFrame&, void* const)
native function GetURLParameter()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ParameterName[8388609], ReturnValue;


}

// Export UHttpBaseInterface::execGetContentType(FFrame&, void* const)
native function GetContentType()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UHttpBaseInterface::execGetContentLength(FFrame&, void* const)
native function GetContentLength()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UHttpBaseInterface::execGetURL(FFrame&, void* const)
native function GetURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UHttpBaseInterface::execGetContent(FFrame&, void* const)
native function GetContent()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Content[25165825];


}
