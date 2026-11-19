interface OnlineContentInterface extends Interface
    abstract;

delegate OnContentChange()
{
    //return;    
}

function AddContentChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ContentDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[9437185];

    255
    //return;    
}

function ClearContentChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ContentDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[9437185];

    255
    //return;    
}

delegate OnReadContentComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadContentComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadContentCompleteDelegate[8388609];

    //return;    
}

function ClearReadContentComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadContentCompleteDelegate[8388609];

    //return;    
}

function ReadContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private int DeviceID[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

function ClearContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;

    //return;    
}

function GetContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ContentList[25165825];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    //return ReturnValue;    
}

function ReadCrossTitleContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private int TitleId[9437185], DeviceID;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    0
    -1
    //return ReturnValue;    
}

function ClearCrossTitleContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;

    //return;    
}

function GetCrossTitleContentList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ContentList[25165825];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadCrossTitleContentComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadCrossTitleContentCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadContentCompleteDelegate[8388609];

    //return;    
}

function ClearReadCrossTitleContentCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ContentType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadContentCompleteDelegate[8388609];

    //return;    
}

function ReadCrossTitleSaveGameData()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609], TitleId;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetCrossTitleSaveGameData()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609], TitleId;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;
    local /*0x35EA0000-0x00000000*/ private byte bIsValid[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SaveGameData[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadCrossTitleSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609], TitleId;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;

    //return;    
}

function AddReadCrossTitleSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadSaveGameDataCompleteDelegate[8388609];

    //return;    
}

function ClearReadCrossTitleSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadSaveGameDataCompleteDelegate[8388609];

    //return;    
}

function ClearCrossTitleSaveGames()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function QueryAvailableDownloads()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int CategoryMask[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

delegate OnQueryAvailableDownloadsComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddQueryAvailableDownloadsComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> QueryDownloadsDelegate[8388609];

    //return;    
}

function ClearQueryAvailableDownloadsComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> QueryDownloadsDelegate[8388609];

    //return;    
}

function GetAvailableDownloadCounts()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int NewDownloads[25165825], TotalDownloads;

    //return;    
}

function ReadSaveGameData()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetSaveGameData()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;
    local /*0x35EA0000-0x00000000*/ private byte bIsValid[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SaveGameData[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;

    //return;    
}

function AddReadSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadSaveGameDataCompleteDelegate[8388609];

    //return;    
}

function ClearReadSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadSaveGameDataCompleteDelegate[8388609];

    //return;    
}

function WriteSaveGameData()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SaveGameData[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnWriteSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename, SaveFileName;

    //return;    
}

function AddWriteSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteSaveGameDataCompleteDelegate[8388609];

    //return;    
}

function ClearWriteSaveGameDataComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteSaveGameDataCompleteDelegate[8388609];

    //return;    
}

function DeleteSaveGame()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearSaveGames()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
