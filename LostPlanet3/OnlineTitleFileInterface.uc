interface OnlineTitleFileInterface extends Interface
    abstract;

delegate OnReadTitleFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    //return;    
}

function ReadTitleFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FileToRead[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddReadTitleFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadTitleFileCompleteDelegate[8388609];

    //return;    
}

function ClearReadTitleFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadTitleFileCompleteDelegate[8388609];

    //return;    
}

function GetTitleFileContents()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetTitleFileState()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearDownloadedFiles()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearDownloadedFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function RequestTitleFileList()
{
    //return;    
}

delegate OnRequestTitleFileListComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ResultStr[8388609];

    //return;    
}

function AddRequestTitleFileListCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RequestTitleFileListDelegate[8388609];

    //return;    
}

function ClearRequestTitleFileListCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RequestTitleFileListDelegate[8388609];

    //return;    
}
