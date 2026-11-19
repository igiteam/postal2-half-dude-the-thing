interface SharedCloudFileInterface extends Interface
    abstract;

function GetSharedFileContents()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SharedHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearSharedFiles()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearSharedFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SharedHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadSharedFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SharedHandle[8388609];

    //return;    
}

function ReadSharedFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SharedHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddReadSharedFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadSharedFileCompleteDelegate[8388609];

    //return;    
}

function ClearReadSharedFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadSharedFileCompleteDelegate[8388609];

    //return;    
}

delegate OnWriteSharedFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename, SharedHandle;

    //return;    
}

function WriteSharedFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Contents[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddWriteSharedFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteSharedFileCompleteDelegate[8388609];

    //return;    
}

function ClearWriteSharedFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteSharedFileCompleteDelegate[8388609];

    //return;    
}
