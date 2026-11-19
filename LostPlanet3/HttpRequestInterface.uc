class HttpRequestInterface extends HttpBaseInterface
    abstract;

//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnProcessRequestComplete__Delegate;

// Export UHttpRequestInterface::execGetVerb(FFrame&, void* const)
native function GetVerb()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UHttpRequestInterface::execSetVerb(FFrame&, void* const)
native function SetVerb()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Verb[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UHttpRequestInterface::execSetURL(FFrame&, void* const)
native function SetURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UHttpRequestInterface::execSetContent(FFrame&, void* const)
native function SetContent()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ContentPayload[25296897];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UHttpRequestInterface::execSetContentAsString(FFrame&, void* const)
native function SetContentAsString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ContentString[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UHttpRequestInterface::execSetHeader(FFrame&, void* const)
native function SetHeader()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string HeaderName[8388609], HeaderValue;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UHttpRequestInterface::execProcessRequest(FFrame&, void* const)
native function ProcessRequest()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

delegate OnProcessRequestComplete()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OriginalRequest[8388609], InHttpResponse;
    local /*0x35EA0000-0x00000000*/ private bool bDidSucceed[8388609];

    //return;    
}

function SetProcessRequestCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ProcessRequestCompleteDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    __OnProcessRequestComplete__Delegate = ProcessRequestCompleteDelegate;
    return self;
    //return ReturnValue;    
}
