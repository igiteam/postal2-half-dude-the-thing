interface OnlineCommunityContentInterface extends Interface
    abstract;

function Init()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function Exit()
{
    //return;    
}

function ReadContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int StartAt[9437185], NumToRead;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    0
    -1
    //return ReturnValue;    
}

delegate OnReadContentListComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadContentListCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadContentListCompleteDelegate[8388609];

    //return;    
}

function ClearReadContentListCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadContentListCompleteDelegate[8388609];

    //return;    
}

function GetContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ContentFiles[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ReadFriendsContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Friends[25296897];
    local /*0x35EA0000-0x00000000*/ private int StartAt[9437185], NumToRead;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    0
    -1
    //return ReturnValue;    
}

delegate OnReadFriendsContentListComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadFriendsContentListCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadFriendsContentListCompleteDelegate[8388609];

    //return;    
}

function ClearReadFriendsContentListCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadFriendsContentListCompleteDelegate[8388609];

    //return;    
}

function GetFriendsContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Friend[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ContentFiles[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UploadContent()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Payload[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL MetaData[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnUploadContentComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL UploadedFile[8388609];

    //return;    
}

function AddUploadContentCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UploadContentCompleteDelegate[8388609];

    //return;    
}

function ClearUploadContentCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UploadContentCompleteDelegate[8388609];

    //return;    
}

function DownloadContent()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FileToDownload[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnDownloadContentComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FileDownloaded[8388609];

    //return;    
}

function AddDownloadContentCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DownloadContentCompleteDelegate[8388609];

    //return;    
}

function ClearDownloadContentCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DownloadContentCompleteDelegate[8388609];

    //return;    
}

function GetContentPayload()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FileDownloaded[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnGetContentPayloadComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FileDownloaded[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Payload[25296897];

    //return;    
}

function AddGetContentPayloadCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> GetContentPayloadCompleteDelegate[8388609];

    //return;    
}

function ClearGetContentPayloadCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> GetContentPayloadCompleteDelegate[8388609];

    //return;    
}

function RateContent()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FileToRate[25296897];
    local /*0x35EA0000-0x00000000*/ private int NewRating[8388609];

    //return;    
}
