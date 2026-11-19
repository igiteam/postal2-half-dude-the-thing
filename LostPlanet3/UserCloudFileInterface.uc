interface UserCloudFileInterface extends Interface
    abstract;

function GetFileContents()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearFiles()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnEnumerateUserFilesComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609];

    //return;    
}

function EnumerateUserFiles()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609];

    //return;    
}

function AddEnumerateUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> EnumerateUserFileCompleteDelegate[8388609];

    //return;    
}

function ClearEnumerateUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> EnumerateUserFileCompleteDelegate[8388609];

    //return;    
}

function GetUserFileList()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array UserFiles[25165825];

    //return;    
}

delegate OnReadUserFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    //return;    
}

function ReadUserFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddReadUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadUserFileCompleteDelegate[8388609];

    //return;    
}

function ClearReadUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadUserFileCompleteDelegate[8388609];

    //return;    
}

delegate OnWriteUserFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    //return;    
}

function WriteUserFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddWriteUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteUserFileCompleteDelegate[8388609];

    //return;    
}

function ClearWriteUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteUserFileCompleteDelegate[8388609];

    //return;    
}

delegate OnDeleteUserFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    //return;    
}

function DeleteUserFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private bool bShouldCloudDelete[8388609], bShouldLocallyDelete, ReturnValue;

    //return ReturnValue;    
}

function AddDeleteUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DeleteUserFileCompleteDelegate[8388609];

    //return;    
}

function ClearDeleteUserFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DeleteUserFileCompleteDelegate[8388609];

    //return;    
}

function ClearAllDelegates()
{
    //return;    
}
