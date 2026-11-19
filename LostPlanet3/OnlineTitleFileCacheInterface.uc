interface OnlineTitleFileCacheInterface extends Interface
    abstract;

function LoadTitleFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnLoadTitleFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    //return;    
}

function AddLoadTitleFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoadCompleteDelegate[8388609];

    //return;    
}

function ClearLoadTitleFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoadCompleteDelegate[8388609];

    //return;    
}

function SaveTitleFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609], LogicalName;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnSaveTitleFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    //return;    
}

function AddSaveTitleFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> SaveCompleteDelegate[8388609];

    //return;    
}

function ClearSaveTitleFileCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> SaveCompleteDelegate[8388609];

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

function GetTitleFileHash()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609], ReturnValue;

    //return ReturnValue;    
}

function GetTitleFileLogicalName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609], ReturnValue;

    //return ReturnValue;    
}

function ClearCachedFiles()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearCachedFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DeleteTitleFiles()
{
    local /*0x35EA0000-0x00000000*/ private float MaxAgeSeconds[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DeleteTitleFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
